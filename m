Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A408386C0D
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 04:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784175333; cv=none; b=LJp5d31HQcvcu9TN1Mc9F0PRbGH3Y+9BZOT2IUd/oQikzFMPFXRApjFENYX+9J5u6PBZdDxvaHoc47jAImnnav5g4zptoZOiKes6jmVVXbw/nPqG5e/eYrb9vctLN1Z4g73ClD15It5EcntsB+IvGaB1UYIB5Kq7KngdlxUrOmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784175333; c=relaxed/simple;
	bh=Y6nlROwnap0deoVeVJVGx3gBc3zIh/EkPl52/D5XRAI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eV3fN+T8IjS+TXdFA32m226GAqaBVKjYJNdl1QFt/qWj2fJbxyA7idelVnmnMuAXCyz5StWhpfapA+rqc670Wfp7l+iy039ZhBa22bMw4agxunHjo9uGpaQoFTYp/PWTCka7F3zqEx1HeTrVASUAPNM/OKllYqCP/DcFELXc3e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RG/jnhpt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RG/jnhpt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83FED1F000E9;
	Thu, 16 Jul 2026 04:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784175331;
	bh=0bcTO0/xAOJiI574ky3D/h9on90re/rGE66zwTw4DLU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RG/jnhpt9ThQwTxt5RhVNzTt0cYGhb/tFhGbVLC6cAIbbCss/hltkCUr9/ZfuCedS
	 KmhV+418ZEG/RE6ydiPkYEsRAjcLVwcTuWrQZWEtQ9XYeAddlTDv5PiKBOYNNKYyEq
	 wnhThSC9j1DYm+yC+aE2RWZuQxd8s04diXhScNOqgWsvIkSBMfGWwNB+3wSN04XhXq
	 iDFvRy6u8ud1Y4CvjRpBf9WHDrJXN1IL/t9QLPxtoV3/tOUtG1k2i170HASrIdxhW5
	 v3JMc7SOo8zrHACF40Ek/RWKNsc5hCe6a4MaT2hr/SgXBvR5kz4cGpaprW8KVAoT0V
	 WdLZFLNKajUNA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: qcom: Add Qualcomm Maili
 video clock controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jagadeesh Kona" <jagadeesh.kona@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260716-maili_videocc-v2-1-7ed5ab140770@oss.qualcomm.com>
References: <20260716-maili_videocc-v2-0-7ed5ab140770@oss.qualcomm.com>
 <20260716-maili_videocc-v2-1-7ed5ab140770@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 04:15:31 +0000
Message-Id: <20260716041531.83FED1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Spaces are used instead of tabs for macro value alignment.
--

--- Patch [1]: [PATCH v2 1/2] dt-bindings: clock: qcom: Add Qualcomm Maili =
video clock controller ---
commit 1f9a58072beaf3de6334360055c245542fde73e1
Author: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

dt-bindings: clock: qcom: Add Qualcomm Maili video clock controller
   =20
This commit adds device tree bindings for the video clock controller on
the Qualcomm Maili SoC.

> diff --git a/include/dt-bindings/clock/qcom,maili-videocc.h b/include/dt-=
bindings/clock/qcom,maili-videocc.h
> new file mode 100644
> index 0000000000000..ae52686639db3
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,maili-videocc.h

[ ... ]

> +/* VIDEO_CC resets */
> +#define VIDEO_CC_INTERFACE_BCR					0
> +#define VIDEO_CC_MVS0_BCR					1
> +#define VIDEO_CC_MVS0_CLK_ARES					2
> +#define VIDEO_CC_MVS0_FREERUN_CLK_ARES				3
> +#define VIDEO_CC_MVS0_VPP0_BCR					4
> +#define VIDEO_CC_MVS0C_BCR					5
> +#define VIDEO_CC_MVS0C_CLK_ARES					6
> +#define VIDEO_CC_MVS0C_FREERUN_CLK_ARES                         7

[Severity: Low]
Could we use tabs to align the value for VIDEO_CC_MVS0C_FREERUN_CLK_ARES
instead of spaces?

> +#define VIDEO_CC_XO_CLK_ARES					8
> +
> +#endif

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716-maili_vide=
occ-v2-0-7ed5ab140770@oss.qualcomm.com?part=3D1
