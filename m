Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038C435F179
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 06:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782110672; cv=none; b=cja5vmij+sjI1+mmbZ6lhzYI6wfW+wEuUcQjX5nCEqrzQAnCKOXwzEJ0OvLhIpS5ZscCF5erTwCu30GebB4gT8jG/1+C7G7cnsBpPugf+3MCpHfKnPsVqmFOwUGMIUescwW7XLXal0p/0WonTG0ZLTLfj2UjWTefy7S2fuGqmIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782110672; c=relaxed/simple;
	bh=OxEHUy5Ic1fu4YfX1SO8XomStbmjsfKgUH/Ujl5aiPs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qSR74HErY/jqcpb/MDJw9mI9SiD1HO36ts8fkSGUvE2EUc/CRUQiVIw4JK8Lb/oe19zqgpt5JS2ej9nL1ED+rJxa0pe6ET556yX/Nu6u42EzvcR+Xu/rr45asboEjX2Y/e/IfaoLHzMpR30PJMUQda1YF46dm6WreoXPVCaVg/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dEsWnSOd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dEsWnSOd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A34FA1F00A3A;
	Mon, 22 Jun 2026 06:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782110670;
	bh=WQtbgiZJGLXG47LaLFyvtVDRcLhjRjgon9OC9UTNq50=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dEsWnSOdIuT4JFWRYeRPmnZ6D5AxhcJOk1bFrZbfxLDDTjoLZMkjSOarY9cbaaxjC
	 JVSoS64b18wHqvnIGtYQruM5+i7wKqeJd48GdJi8UN3Rp0kkQ3BTJ6fHFJKro5rSYa
	 GmtGJigqX5IY7E7KxRCrHGvsyZgk+t9ctdN1R0McXx9rUC6T2Wp0Jm/8AtTvxTJVja
	 WenLnlI3X2GT6WWVmj02Q8FhOlb3wxvJAAM6YMPAJtIB7pk40FUmhYioRTJ0Bq1mUl
	 0mhJ2fJSyydjrDA8EcXyjsa8ZQkoHv2rRSVHpIzIsMFy1m3ZS5jb8mmAecDD2fFeiD
	 6zFHufqPbnS9g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] interconnect: qcom: add Maili interconnect
 provider driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Raviteja Laggyshetty" <raviteja.laggyshetty@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260622-maili_icc-v2-2-18b5ac08c04f@oss.qualcomm.com>
References: <20260622-maili_icc-v2-0-18b5ac08c04f@oss.qualcomm.com>
 <20260622-maili_icc-v2-2-18b5ac08c04f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 22 Jun 2026 06:44:30 +0000
Message-Id: <20260622064430.A34FA1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Use-After-Free on driver unbind/rebind due to stale pointers in st=
atically allocated driver structures.
--

commit 9266119e904a5c675879f8849d752743c3590271
Author: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>

interconnect: qcom: add Maili interconnect provider driver
   =20
Add driver for the Qualcomm interconnect buses found in Maili
based platforms. The topology consists of several NoCs that are
controlled by a remote processor that collects the aggregated
bandwidth for each master-slave pairs.

> diff --git a/drivers/interconnect/qcom/maili.c b/drivers/interconnect/qco=
m/maili.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/interconnect/qcom/maili.c

[ ... ]

> +static struct platform_driver qnoc_driver =3D {
> +	.probe =3D qcom_icc_rpmh_probe,
> +	.remove =3D qcom_icc_rpmh_remove,

[Severity: High]
This isn't a bug introduced by this patch, but I noticed the framework
functions used here might leave dangling pointers in the static data struct=
ures
introduced by this patch.

During a driver unbind, qcom_icc_rpmh_remove() frees the dynamically alloca=
ted
nodes associated with the provider:

qcom_icc_rpmh_remove() {
    ...
    icc_nodes_remove(&qp->provider);
}

However, the qn->node pointers in the statically allocated driver structures
added in this patch are never cleared. If the driver is subsequently rebound
via sysfs, qcom_icc_rpmh_probe() sees the stale pointer and skips allocatio=
n:

qcom_icc_rpmh_probe() {
    ...
    if (!qn->node)
        qn->node =3D icc_node_create_dyn();
           =20
    node =3D qn->node;
    ...
}

Does this code result in a use-after-free when the freed node memory is
accessed during the rebind?

> +	.driver =3D {
> +		.name =3D "qnoc-maili",
> +		.of_match_table =3D qnoc_of_match,
> +		.sync_state =3D icc_sync_state,
> +	},
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260622-maili_icc-=
v2-0-18b5ac08c04f@oss.qualcomm.com?part=3D2
