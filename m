Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD4214E2F2
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 01:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782177040; cv=none; b=tDBeVebcG1qNhbBCYcFdoPSYpW5p64TDXfRd8NF8XrM2Gw0sdfnauQlXWezUv5fxC+2QcRkUAsVVWI8Fa+W5qOxzuDZe1pJORrNXCmyXa4273s6EhuAwF8e9Om2Hcopz+5G+sEej6oLovVm0726RCrzdr+2gzjuzFV7GN0RB2z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782177040; c=relaxed/simple;
	bh=3V4yotkiaVSGP4LmtyVzN2kRvyFR7MRVMsO9vduVqQo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KeUdwunBUixp1Pc1QURmZpEDR9Y7luu0NliXdGOiihOMszKr5syVaZCsybiKzFR/aHn5wpMuQldqDsUTTzFDL/ZzboTEKTE3va/85NOGHHEZOUrvTZM12xX/vc/cv0WidSnK8kVlPHx1DfsId2em0vfViv/AQA3LwKvisiknWj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BpNI/RMm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BpNI/RMm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFA271F000E9;
	Tue, 23 Jun 2026 01:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782177039;
	bh=vNEKF36isjpHiu5z6iVdmoo7elpoIamhcgdOHNRJepw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BpNI/RMmuxJwsYoQQfMgmPBhGFxiaDqzN7dSRJLMSBPGCRrZiylZQLKCa/qyZpyiY
	 1vIpv1TcQSKqUVUfZuZwkQT83EpyKhgEm3MF1Tu/M4mD5Os/FK6H1ekIkCsf1jZj2h
	 SJ7ciem1YIb8xpxMYJd3nvV6r3I/aGMQ/UvsCctnZ5Z0vxmxzOJyg52TWxfJRBqQx4
	 n30squBELsJ+fxyy0aoTLn8ACCYHu1NH5CRWfs2U3GKMdeX6cMDw6XhNXyNQlYfEMZ
	 73o2MNLdGQNNyIRl7dTURJtKgRVBl6r0xVvUYaQTAJtG5dSjDVE8fH0nB9nHrcbB30
	 K0d8FIblbxO4A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/8] arm64: dts: qcom: sm8450: Modify GPU operating
 points
Reply-To: sashiko-reviews@lists.linux.dev
To: "Esteban Urrutia via B4 Relay" <devnull+esteuwu.proton.me@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, neil.armstrong@linaro.org, vkoul@kernel.org, conor+dt@kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org
In-Reply-To: <20260622-sm8450-qol-v1-3-37e2ee8df9da@proton.me>
References: <20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me>
 <20260622-sm8450-qol-v1-3-37e2ee8df9da@proton.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Jun 2026 01:10:38 +0000
Message-Id: <20260623011038.AFA271F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Removing the 3 lowest GPU OPPs breaks the 1:1 index mapping betwee=
n the GPU frequency table and the hardcoded GMU bandwidth table in the Adre=
no DRM driver, causing severe memory bandwidth starvation at high GPU frequ=
encies.
--

commit d0ec9d0cbceaf15f2295a4c6a613a8ca7a354eea
Author: Esteban Urrutia <esteuwu@proton.me>

arm64: dts: qcom: sm8450: Modify GPU operating points

This commit removes the 317MHz, 285MHz, and 220MHz GPU operating points from
the SM8450 device tree, as they do not exist in the downstream device trees.

> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/q=
com/sm8450.dtsi
> index e34e3c05bf74c..5e331a25e22a2 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -2495,21 +2495,6 @@ opp-350000000 {
>  					opp-hz =3D /bits/ 64 <350000000>;
>  					opp-level =3D <RPMH_REGULATOR_LEVEL_LOW_SVS>;
>  				};
> -
> -				opp-317000000 {
> -					opp-hz =3D /bits/ 64 <317000000>;
> -					opp-level =3D <RPMH_REGULATOR_LEVEL_LOW_SVS>;
> -				};

[Severity: High]
Will removing these 3 lowest GPU OPPs break the index mapping between the
GPU frequency table and the GMU bandwidth table in the Adreno driver?

The Adreno A730 driver doesn't use dynamic bandwidth voting. Instead, it
sends a hardcoded table of exactly 12 memory bandwidth levels to the GMU
firmware:

drivers/gpu/drm/msm/adreno/a6xx_hfi.c:a730_build_bw_table() {
    ...
    msg->bw_level_num =3D 12;
    ...
}

The GMU firmware applies the bandwidth vote corresponding to the GPU
performance level index. Previously, with 12 GPU OPPs, the maximum frequency
mapped to the maximum bandwidth at index 11.

By removing 3 OPPs here, the active OPPs are reduced to 9. Does this mean t=
he
maximum frequency of 818MHz will now map to performance index 8 instead?

If so, this would cause the GMU to apply the lower bandwidth vote from inde=
x 8
when the GPU is at maximum frequency, severely reducing the available memory
bandwidth and bottlenecking the GPU under heavy load.

> -
> -				opp-285000000 {
> -					opp-hz =3D /bits/ 64 <285000000>;
> -					opp-level =3D <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
> -				};
> -
> -				opp-220000000 {
> -					opp-hz =3D /bits/ 64 <220000000>;
> -					opp-level =3D <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
> -				};
>  			};
>  		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260622-sm8450-qol=
-v1-0-37e2ee8df9da@proton.me?part=3D3
