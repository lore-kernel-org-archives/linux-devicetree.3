Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583D12D7398
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 04:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789534068; cv=none; b=Yjo6yK8Bx1it8p6keKpYEDiEUVkRmEkqj6UBSc1pwCvZGV6P7L6l+uyHnxF2Lc8xZe8+RdXmE2cFploGbJpfTvItvJd5dG3dT4F9FV8us/q6CBgFUhOInrwHVhbVFg7exIzmRNvdI9xjFqWZUPeGrOs4EwElpqg14N2y4rxczZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789534068; c=relaxed/simple;
	bh=HUni2uJsmtim6CQheJa4FtAPdy7UDiEBI5giEHzcQgg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KND1rkorDPut7PdOVyjiIi7YjHNiXQKOj3QAEpGsQc8LOrBa96TUEv1X1r5cJCS6YvxhYzX4/g9m+nqf1KaDJJRw4vZ8PfbDvLvT/g33i9Jh12Hk1Mr+LsbCvIy7UuNkLE3ue2f5XeYEchJIB4BfftqokIgADttjHmAEJ9Xarnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MjzL/pO4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MjzL/pO4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8F431F000FF;
	Wed, 16 Sep 2026 04:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789534067;
	bh=0WENauEYTlEsPZ4Dk5LfI1YTYG9vHxXiFbke+6VK4gE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MjzL/pO4J3pp+5Qgz58PqnxAv51zb2jStuFenQegaQEOH5fXr2He3Ll9FYZ79y+bW
	 I4L39jGdRL/Dha2MA7inFNK51GNbmADmtmiAIhT3VOzBuhKI4H89Ady6gwhN7Nh+Oo
	 mzPe/rIyQi6msxCw2z22/qvBERjzAsEQ0kSzdlX2z0wGjeVifSjkWH4EmlB135Tc19
	 s5bhjX2r8WoX4KRXHux17qaEQDLjFhTaXcg4J1jGKA/Mv0Z7YzHpzL1ovaxJGcPFlc
	 P1UldQl0ajtY8snsIPAEkUrkyqNFTshzjfLt5Miie19m0cBr6PsiF5WXub2U7yBQh0
	 m9p78AurJ5jfA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] powerpc/pseries/dlpar: Remove DT entries if failure
 from CPU ADD notifier
Reply-To: sashiko-reviews@lists.linux.dev
To: "Haren Myneni" <haren@linux.ibm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260916043249.2062676-2-haren@linux.ibm.com>
References: <20260916043249.2062676-1-haren@linux.ibm.com>
 <20260916043249.2062676-2-haren@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 04:47:46 +0000
Message-Id: <20260916044746.A8F431F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] of: kernel panic in __of_detach_node() due to unattached node
- [High] powerpc/pseries: sibling device nodes leaked on hotplug error path
--

commit 4b977223f26c877c63148563cad8a84f1583e398
Author: Haren Myneni <haren@linux.ibm.com>

powerpc/pseries/dlpar: Remove DT entries if failure from CPU ADD notifier
   =20
For CPU ADD, the device tree entries are retrieved with
configure-connector RTAS call and attached to the device tree.
Then the CPU is added as part of DT node notification. If the CPU
ADD notifier returns failure, this patch calls of_detach_node_no_notify()
instead of dlpar_free_cc_nodes() to prevent device tree issues.

> diff --git a/arch/powerpc/platforms/pseries/dlpar.c b/arch/powerpc/platfo=
rms/pseries/dlpar.c
> index f4d33b8dffd85..01a9849773cd1 100644
> --- a/arch/powerpc/platforms/pseries/dlpar.c
> +++ b/arch/powerpc/platforms/pseries/dlpar.c
> @@ -247,15 +247,18 @@ int dlpar_attach_node(struct device_node *dn, struc=
t device_node *parent)
>  	return 0;
>  }
> =20
> -int dlpar_detach_node(struct device_node *dn)
> +int dlpar_detach_node(struct device_node *dn, bool notify)
>  {
>  	struct device_node *child;
>  	int rc;
> =20
>  	for_each_child_of_node(dn, child)
> -		dlpar_detach_node(child);
> +		dlpar_detach_node(child, notify);

[Severity: High]
Does this code leak sibling device nodes?

In the error handling path of dlpar_cpu_add(), when
pseries_cpuhp_attach_nodes() fails, dlpar_detach_node(dn, false) is called
to clean up. However, the old dlpar_free_cc_nodes() used to recursively
free dn->sibling. This new implementation only iterates through children and
completely ignores dn->sibling.

If siblings were returned by configure-connector but never successfully
attached, or if they were attached but later notification fails, are those
sibling nodes permanently leaked?

> =20
> -	rc =3D of_detach_node(dn);
> +	if (notify)
> +		rc =3D of_detach_node(dn);
> +	else
> +		rc =3D of_detach_node_no_notify(dn);

[Severity: High]
Can this cause a NULL pointer dereference leading to a kernel panic?

If of_changeset_attach_node() fails in pseries_cpuhp_attach_nodes() (for
instance, due to an allocation failure), the dn node is never attached to
the device tree's sibling list, and its OF_DETACHED flag remains 0.

If dlpar_cpu_add() then attempts to clean up by calling
dlpar_detach_node(dn, false), this code forwards the unattached node to
of_detach_node_no_notify(dn). Since OF_DETACHED is 0, it calls
__of_detach_node(np).

Inside __of_detach_node(), the node is not found in parent->child, causing
the prevsib pointer to traverse past the end of the list to NULL, leading to
a crash at prevsib->sibling =3D np->sibling.

>  	if (rc)
>  		return rc;
> =20
> diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/=
platforms/pseries/hotplug-cpu.c
> index bc6926dbf1489..db359fa3f9224 100644
> --- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
> +++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
> @@ -603,7 +603,7 @@ static ssize_t dlpar_cpu_add(u32 drc_index)
> =20
>  		rc =3D dlpar_release_drc(drc_index);
>  		if (!rc)
> -			dlpar_free_cc_nodes(dn);
> +			dlpar_detach_node(dn, false);
> =20
>  		return saved_rc;
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916043249.2062=
676-1-haren@linux.ibm.com?part=3D2
