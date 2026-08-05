Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F38C3DD50D
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 20:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785962709; cv=none; b=oNNjPu28YRDBCX1hqxo4qkQxKB627EhJIs8Riasz8I7t6aw2waEPZVwV5icz+diQy8u+/k+KGhkQ3pRlfRf1eH3SjjOX2+aDpuVB8MK5Eq08SgomcQrN5BEOmhfbZXL1dq/uehiUWWBu8nvtG8haGsgz/d0OGMjHAZNiy+vi7UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785962709; c=relaxed/simple;
	bh=nrb//huXe5/MUe5iTZW4JOAMQQbocb2kTQRqUQomX64=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uUYJv2mHXf7YyFwctulF+4GymXZQ0yTgdAXVS/fIuCTgNK/0EetM+i/spuIRhyUXV81S7C/q0u2LcQlS55VgEzcOhO4732UdR9Lz3Dnp0Z541OGqUtuQfQFDfdvnCckXQf4rWWpC4IkvcToP0DrVe7wtyiuDpzKjOg9zzXYvS3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rbz+l+l1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rbz+l+l1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AB171F000E9;
	Wed,  5 Aug 2026 20:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785962707;
	bh=/OZacn4zAQ6pAWaAhNaUmAx4MUxfpMc0DGEvgCnkpFA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Rbz+l+l1HGdcNSOWf81jc14Z8nNilL+jvBpf/hcxbERBC+VeGs9e3HNIvz/AvENaW
	 fOz2SAj1S4dmLhyz467EXMttnjEDlHSXJ/eFOwlWMtxVosp7OKLOgKyhtD5lFs3Ij7
	 X4/krycUFhQq70wM6RMJF6XRt4x5AuOalV97/zf9UcD3hTMRWCFg7rpjc92XjuvL3B
	 5HDZ8lIlYwBWF62r+DQlev7sCiGmUvx+nl8/HmNSHjnsUcxUUS/LAWMtwh7wxOUyAO
	 zDDIl0KTh75gnx6d8sx4zvg3s//M98Ndr1/Jo39up5KUwRXNjsjA9Xhi6UFOsb7bok
	 DwpEhuNQdRROg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 05/10] of/overlay: put property on deadprops only
 after changeset add succeeds
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260805-nh-of-alias-overlay-v6-5-74f21d440819@nexthop.ai>
References: <20260805-nh-of-alias-overlay-v6-0-74f21d440819@nexthop.ai>
 <20260805-nh-of-alias-overlay-v6-5-74f21d440819@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 20:45:06 +0000
Message-Id: <20260805204507.5AB171F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Leaked fragment target and overlay node references when init_overl=
ay_changeset() fails mid-iteration.
--

--- Patch [5]: [PATCH v6 05/10] of/overlay: put property on deadprops only =
after changeset add succeeds ---
commit 32c9bbaae9841195a053f81f6d3eb35116c97a19
Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>

of/overlay: put property on deadprops only after changeset add succeeds

This commit fixes a double-free issue in add_changeset_property().
It ensures a new property is only linked into the target node's deadprops
list after it has been successfully added to the changeset.

> diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
> index 74aea704835ac..284c9bc6c9cfc 100644
> --- a/drivers/of/overlay.c
> +++ b/drivers/of/overlay.c

[ ... ]

While reviewing this file, I noticed a pre-existing issue nearby:

drivers/of/overlay.c:init_overlay_changeset() {
	...
	cnt =3D 0;
	for_each_child_of_node(ovcs->overlay_root, node) {
		overlay_node =3D of_get_child_by_name(node, "__overlay__");
		if (!overlay_node)
			continue;

		fragment =3D &fragments[cnt];
		fragment->overlay =3D overlay_node;
		fragment->target =3D find_target(node, target_base);
		if (!fragment->target) {
			of_node_put(fragment->overlay);
			ret =3D -EINVAL;
			of_node_put(node);
			goto err_out;
		}

		cnt++;
	}
	...
}

[Severity: High]
This is a pre-existing issue, but does this error path leak node references?

If find_target() fails for a later fragment, we jump to err_out without
updating ovcs->count.

When free_overlay_changeset() is later called to clean up, it relies on
ovcs->count to free the fragments:

drivers/of/overlay.c:free_overlay_changeset() {
	...
	for (i =3D 0; i < ovcs->count; i++) {
		of_node_put(ovcs->fragments[i].target);
		of_node_put(ovcs->fragments[i].overlay);
	}
	...
}

Because ovcs->count was never updated before the error jump in
init_overlay_changeset(), won't this skip cleaning up the successfully
processed fragments and leak their target and overlay node references?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-nh-of-alia=
s-overlay-v6-0-74f21d440819@nexthop.ai?part=3D5
