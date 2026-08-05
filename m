Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C630E429803
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 20:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785962412; cv=none; b=S61TTiGOScHaSryoVEMvA/5izOoAU1EL+uvM2ARdNlrdTSRYmg12EqlbRiVA23ELMMxflghgj+cMldWiJJVizPrlzVUXCE8fjO6rqE73X1xEsmzkX9Dmbv9TQdp2oxZM3sSbYzYZZmbkdo89sGLO+I06vQGrresw33Fv8RUM8Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785962412; c=relaxed/simple;
	bh=LxmF1iN//1yJD76e302T3fRr+jrYP7xYAcsrWBp3LiQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mb416Yk15Mv7ZND7am65ruH2CE6/n9/UBhtqKTcjtHESY2lRT1hnppkIEy0dSjeZw372nyDnNw7C6wEVip7kqbMFvj1bjZhFqSVdxLNpb/1SAmCjI5vDYs9MHuRfYpkUH1RXLlxidtn0A+rVtyMqJh6xOVVuo5LlvTQ77kNJAOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HNTlnqbK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HNTlnqbK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF3891F000E9;
	Wed,  5 Aug 2026 20:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785962410;
	bh=KmoUdxciW/J/mNdGkml6tfXOb3iI3Y1HoRINiLS9yIk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HNTlnqbKVfVLUkTdVEljTzCSHOshzUaW5rVjY9uQC3e1QBiiIB09XKngFYIbDe7jA
	 QbJlgdbPQU6JrcC2AT/aKQ7sORDhsfK+/e5WYSVs/6fHR0mTqp4ruoRVfMV7uCkLur
	 CH8D6daz+lZaXvRx0kH1b7jZxiOUW9J3oEfOfBhiH+EPvP+JH2Uv4OZlOXhjCH2tDn
	 5IAwelBw+TlqJrufO5RzRUQyCSrwBSwmqnxhJ024SxojdnZiJNRS+f2H/oooJBmPc/
	 zRuweNMC3o6QolRVwmJYPBSEFru+Gj3n9ESRTgRTC/Xd003fmLob1+7thwtZXxXP+9
	 gT6zN4HoB3Dag==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 04/10] of/overlay: look up absolute target-paths
 absolutely
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260805-nh-of-alias-overlay-v6-4-74f21d440819@nexthop.ai>
References: <20260805-nh-of-alias-overlay-v6-0-74f21d440819@nexthop.ai>
 <20260805-nh-of-alias-overlay-v6-4-74f21d440819@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 20:40:09 +0000
Message-Id: <20260805204009.CF3891F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Medium] Pre-existing memory leak of target and overlay device node refer=
ences occurs on the error paths of `init_overlay_changeset()`.
--

--- Patch [4]: [PATCH v6 04/10] of/overlay: look up absolute target-paths a=
bsolutely ---
commit 28d3c18ff8d649fd8af8d895999493b24c338fa1
Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>

of/overlay: look up absolute target-paths absolutely

This commit updates find_target() to resolve non-empty target-path properti=
es
as absolute paths from the live-tree root rather than appending them to the
target base. Empty target-path values still resolve to the target base itse=
lf.
The documentation for init_overlay_changeset() and of_overlay_apply() is
updated to reflect this new behavior.

> diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
> index 08d5351746be6..74aea704835ac 100644
> --- a/drivers/of/overlay.c
> +++ b/drivers/of/overlay.c

[ ... ]

> @@ -737,7 +731,9 @@ static struct device_node *find_target(const struct d=
evice_node *info_node,
>  /**
>   * init_overlay_changeset() - initialize overlay changeset from overlay =
tree
>   * @ovcs:		Overlay changeset to build
> - * @target_base:	Point to the target node to apply overlay
> + * @target_base:	Target for fragments with an empty "target-path";
> + *			fragments with a non-empty "target-path" resolve
> + *			absolutely and ignore @target_base
>   *
>   * Initialize @ovcs.  Populate @ovcs->fragments with node information fr=
om
>   * the top level of @overlay_root.  The relevant top level nodes are the

[Severity: Medium]
This is a pre-existing issue, but does init_overlay_changeset() leak
device node references when an error occurs during fragment processing?

Looking at init_overlay_changeset(), if find_target() fails (or if the
__symbols__ target is missing), it jumps to err_out without updating
ovcs->count:

		fragment->target =3D find_target(node, target_base);
		if (!fragment->target) {
			of_node_put(fragment->overlay);
			ret =3D -EINVAL;
			of_node_put(node);
			goto err_out;
		}

Because ovcs->count is only updated to the successfully processed count
at the very end of the function, it remains 0 during the error return.

When the caller subsequently runs free_overlay_changeset() to clean up the
partially initialized changeset, its cleanup loop is skipped entirely becau=
se
ovcs->count is 0:

	for (i =3D 0; i < ovcs->count; i++) {
		of_node_put(ovcs->fragments[i].target);
		of_node_put(ovcs->fragments[i].overlay);
	}

Would this permanently leak the node references for any fragments that were
successfully processed before the failure occurred?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-nh-of-alia=
s-overlay-v6-0-74f21d440819@nexthop.ai?part=3D4
