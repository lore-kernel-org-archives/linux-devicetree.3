Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F703BFE52
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 10:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789383165; cv=none; b=KAxefWsZJUvxQDcfMimYZzjEzHs//X/cxQj0LjKg5ZL1z/pHIitR1Ng54kQGMDch04MLjlsa43LBkC8Rab5G9jr4+Nnr+1D8uxRIKgggStidDdjma9zXm9stC8bncbwbVQXj7f2tk4hD5mmz5iQa/tARpagqrGbJ/u9ObwxY9h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789383165; c=relaxed/simple;
	bh=22DHHgZNQXp3kgL3SI6CaIkC5B7KXoJ3XG21XN2Thwg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kNq+vlPIsf+NUfEtUIlnTmlYb9SNLQZ/piXbnfuHdDyTsBIllP06/iZbl3SdeRneB4+K8ViGpLWT6kuYDMwBUIs1ATtC4gF5NfXa9uuHGiNBRB0F+ZnVsdx/PspNqFcLxTTxNR3MYbgH89yo0mmmwqvY5TOHdbJ1vl8sZ320R/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gr67PGhX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gr67PGhX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 682101F000FF;
	Mon, 14 Sep 2026 10:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789383163;
	bh=wQwQA0gqusEXB+R1rDPw7UcPwP9IWLFvFSfouLyX2CI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gr67PGhXk4Df5G5oEjMEz9CCLfYSrbC9LF5axFdqnVFHpDOnNndyb1ByIoy0MnbHF
	 97h0KerLoe2NfZ0Uxsbk4dALR2Nm11jI+KDl6RVLTjDQkNTDJQuOsgacJf0OawaUdg
	 pa6dB8TwN3rj8TtcBX8ofddEld+DM4D5+GMfo4JKcaD+mtjh4eDKc+vuLPfqeTC5yt
	 eyLPwFCIqEXn2NecN7ffqzL5wbSXp3GsT8JVEBPKGp6QhylFddkKkQJgFgACtIPoZy
	 KPNlHmVT5sMOOSls5lhNxflInl9053RwmHI/y0fbiDtj43kTmC7781+GWXIzmotYvG
	 GIXFx8EHG7Umg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/5] arm64: dts: qcom: eliza: Rename existing EVK to
 suggest eMMC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260914-dts-qcom-eliza-add-ufs-variant-v1-3-78b3249eae61@oss.qualcomm.com>
References: <20260914-dts-qcom-eliza-add-ufs-variant-v1-0-78b3249eae61@oss.qualcomm.com>
 <20260914-dts-qcom-eliza-add-ufs-variant-v1-3-78b3249eae61@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 10:52:43 +0000
Message-Id: <20260914105243.682101F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The commit renames `eliza-cqs-som.dtsi` but fails to delete `eliza-=
cqs-evk.dts`, leaving it as an orphaned file that includes a now-nonexisten=
t file.
--

commit a1174aba52e7db785b4c5053b74679986a1f1e7c
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

arm64: dts: qcom: eliza: Rename existing EVK to suggest eMMC

This commit renames the Eliza SoM EVK and Eliza CQS EVK to reflect their
eMMC support and differentiate them from a newly discovered UFS variant.
It updates the Makefile, adds a new EVK dts, and renames the base dtsi.

> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom=
/Makefile
> index d6547fb18edf0..ccaca98ad4c8f 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -14,7 +14,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+=3D apq8094-sony-xperia-kitaka=
mi-karin_windy.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D apq8096-db820c.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D apq8096sg-db820c.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D apq8096-ifc6640.dtb
> -dtb-$(CONFIG_ARCH_QCOM)	+=3D eliza-cqs-evk.dtb

[Severity: Low]
Does this commit forget to delete the corresponding eliza-cqs-evk.dts file?

While this file is removed from the Makefile build list here, it appears it
wasn't deleted from the repository. Because this patch also renames
eliza-cqs-som.dtsi to eliza-cqs-som-emmc.dtsi, the orphaned eliza-cqs-evk.d=
ts
will fail to parse since it still contains:

#include "eliza-cqs-som.dtsi"

This will break any tool that processes all device tree files in the
directory, such as running make dtbs_check.

As a side note, previous concerns regarding this patch dropping hardware
configurations appear to be unfounded, as those configurations were safely
refactored into eliza-evk.dtsi in a preceding patch (commit "arm64: dts:
qcom: eliza-cqs-evk: Move sound card support to Eliza EVK generic"). Howeve=
r,
the forgotten deletion of the obsolete file remains an issue.

> +dtb-$(CONFIG_ARCH_QCOM)	+=3D eliza-cqs-evk-emmc.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D eliza-mtp.dtb

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914-dts-qcom-e=
liza-add-ufs-variant-v1-0-78b3249eae61@oss.qualcomm.com?part=3D3
