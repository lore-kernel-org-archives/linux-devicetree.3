Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98A73D45E5
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 12:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783082249; cv=none; b=L09/vJ7RlY8xl8t0zwioMYdCUbKTfhY0t7VdFxG3ljhZUyi8BccS8brnAmX+UxlALbLWCEtil5QJQvO1z8M9MAp25MvfVGV7nG4FKbL3Tz8rR083koF3JHd2so7pC+305HteZpiZtCCgaA/yrhqFg7CZ72XN2VPiR3Px6lrxjzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783082249; c=relaxed/simple;
	bh=8EZiIgYbxc5CgRtXQrgB1oMK4SeGfzZrajb0b/WEyQc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GurIRBVgkdRD9jisOZNU2P+gNuWrGLMJhawGOESiMoH977onMwpSkux27ecbmbjHIkUKDYQEWpEfCoTqISQsBVTEzcP2FXDMmV1Jw1j6HnQ1qhQiRoBQxERAbqxR+5unitGozxghrWkO7kxJqXtO/LNaSFR31zRYnzCduseacbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N2Xnku9s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N2Xnku9s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CD5C1F00AC4;
	Fri,  3 Jul 2026 12:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783082248;
	bh=BYE/lV7SNFNjiRW1OvPf/C91HlAa6SAOIDboTHMY1nE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=N2Xnku9sQlsxZbGAOxyy+7hThRqA98yxWN+lzdGKpA8JXt1XTQgfr1kNUDN0GVkvs
	 Ee/jOBIaanjizwEH/9XX+9rOCeRVIjW/89EtPtyZsLvbtzn5Itf9+q2vEeRN2pouGm
	 7XXR9iKxPUnj14vA/pcfobvFpiBJndN8FZx+z2izgCBBBeKMD0XOLfVY/g0MSRXUy+
	 M8xb5QdwQITtRcf3V57hV1xe2/ZgCaKlOIN3gctr0QSJhClgDOpRjI8qeqi1V5SmmP
	 58YuceLD8At6jSS5ZXK5SBRzxTDtLCyn+2BOALeFQ2Fbl6rEx8bgLWfjra7fXWYaY9
	 JDfpA18VyKYaA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/3] arm64: dts: qcom: fix SoCCP memory mappings for
 Glymur
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ananthu C V" <ananthu.cv@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260703-glymur-soccp-v4-2-b706c4c9b3e2@oss.qualcomm.com>
References: <20260703-glymur-soccp-v4-0-b706c4c9b3e2@oss.qualcomm.com>
 <20260703-glymur-soccp-v4-2-b706c4c9b3e2@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 12:37:27 +0000
Message-Id: <20260703123728.2CD5C1F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Device tree nodes in `reserved-memory` are no longer sorted by unit=
-address.
--

commit a19a73590d416c9dc7623921d49433687e8ae84f
Author: Ananthu C V <ananthu.cv@oss.qualcomm.com>
arm64: dts: qcom: fix SoCCP memory mappings for Glymur

This commit updates the SoCCP and SoCCP DTB memory regions to match the
Glymur v21 memory map release requirements.

> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/q=
com/glymur.dtsi
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
[ ... ]
> -		soccpdtb_mem: soccpdtb@892e0000 {
> -			reg =3D <0x0 0x892e0000 0x0 0x20000>;
> +		soccpdtb_mem: soccpdtb@89200000 {
> +			reg =3D <0x0 0x89200000 0x0 0x20000>;
>  			no-map;
>  		};
> =20
> -		soccp_mem: soccp@89300000 {
> -			reg =3D <0x0 0x89300000 0x0 0x400000>;
> +		soccp_mem: soccp@88e00000 {
> +			reg =3D <0x0 0x88e00000 0x0 0x400000>;
>  			no-map;
>  		};

[Severity: Low]
This isn't a bug, but should these nodes be reordered to maintain ascending
unit-address order?

By changing the addresses here, soccpdtb@89200000 now structurally appears
before soccp@88e00000, which breaks the conventional ascending sort order
for reserved-memory nodes.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260703-glymur-soc=
cp-v4-0-b706c4c9b3e2@oss.qualcomm.com?part=3D2
