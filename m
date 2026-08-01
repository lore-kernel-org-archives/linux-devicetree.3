Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E195E2E739C
	for <devicetree@vger.kernel.org>; Sat,  1 Aug 2026 14:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785594013; cv=none; b=sjqPOuXnVyy2KuxK4W0u+FUPuU1CZ+whWPGe4tSH2M2cBl+8A2+H2ZrnTRYcTXnVu33VRUS2FHc8fHuXZCuuMjpNCAt4VJG3beU0/nGQZlsnO7/B8N4PkrQFfuxpbX8SXwzFD/bNzbwCo0Iy0qcKnQN4K+3L59hglK/wOJSf8qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785594013; c=relaxed/simple;
	bh=WJjHBvwGQ+2GQULWvTAX8VAs3Tiq6RaNnRUirzOhme0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Fnrzw21/OiD/oYtRnGEyo6jUwhnDPjXwP+JPWZl7fNaDI00p+yNLdEnfclUyXce88QMKyqsBwSNW5WPcfRP91myREnnqQNRL1jbLEKx/NC0is3nB7j5eMG12y4etpUefq25eYAJYUCRPHT7lE1LLvCrmnhpCS2kSc6zwJc73zn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EbZ2tgVl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EbZ2tgVl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30D481F00AC4;
	Sat,  1 Aug 2026 14:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785594011;
	bh=PtAayrpBmvK212BNdAQ89SxXnrrti1ZiUqVtxGZcF4M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EbZ2tgVlry5Y9lX/NLPHyLuj+kvj/i4C7In1js1Rbij+8eHee5RdV4fsXhAEsBDZb
	 lAqSQYJWed5T7+ymbDW3/UtQAtPWeBdd+E0FWVsDL+Us03+kSJogWRe95VkKzVK4gl
	 fJr4FJTg3Hs/4+hCpW2Y90ygl8ySEWLSv1/kxWuoT1K/VgSfwr36HI1kyUTX91auFI
	 wErvJ9QbHWtxYyIAJ8J+ubeKoXCt03xis6FhE5ozBMjUatnOamVLm3IIkzi+BFUgqO
	 4QjBAc7ngnlbhWCMhFE3lCvrYJI5zWYN2QFjJnu25UUwi/6biseqMZsa9EW870uTOq
	 kD5Urfqegw/tw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: clock: qcom: Add GCC video axi
 reset clocks for Nord
Reply-To: sashiko-reviews@lists.linux.dev
To: "Taniya Das" <taniya.das@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260801-nord_videocc_camcc-v2-1-674d7718e41f@oss.qualcomm.com>
References: <20260801-nord_videocc_camcc-v2-0-674d7718e41f@oss.qualcomm.com>
 <20260801-nord_videocc_camcc-v2-1-674d7718e41f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 01 Aug 2026 14:20:10 +0000
Message-Id: <20260801142011.30D481F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The patch adds new reset constants to the device tree bindings hea=
der but fails to update the corresponding reset map array in the clock driv=
er, rendering the new resets unusable.
--

--- Patch [1]: [PATCH v2 1/6] dt-bindings: clock: qcom: Add GCC video axi r=
eset clocks for Nord ---
commit 692b7cd0d9919908875aa714906a97e0aca5d6cb
Author: Taniya Das <taniya.das@oss.qualcomm.com>

dt-bindings: clock: qcom: Add GCC video axi reset clocks for Nord

This commit adds new NW_GCC video axi reset clocks to the device tree
bindings for the Nord platform. These resets are required by the video
driver to handle clock resets during the power down sequence.

> diff --git a/include/dt-bindings/clock/qcom,nord-nwgcc.h b/include/dt-bin=
dings/clock/qcom,nord-nwgcc.h
> index b6253dd2aa85a..8beaa129aa814 100644
> --- a/include/dt-bindings/clock/qcom,nord-nwgcc.h
> +++ b/include/dt-bindings/clock/qcom,nord-nwgcc.h
> @@ -65,5 +65,8 @@
>  #define NW_GCC_GPU_2_BCR					6
>  #define NW_GCC_GPU_BCR						7
>  #define NW_GCC_VIDEO_BCR					8
> +#define NW_GCC_VIDEO_AXI0_CLK_ARES				9
> +#define NW_GCC_VIDEO_AXI0C_CLK_ARES				10
> +#define NW_GCC_VIDEO_AXI1_CLK_ARES				11

[Severity: High]
Are these new resets missing their corresponding register offsets in the
clock driver?

It appears the nw_gcc_nord_resets array in drivers/clk/qcom/nwgcc-nord.c
was not updated to map these new reset indices. Without these mappings, the
array size remains at 9.

If a consumer driver requests one of these new resets via the device tree,
the reset subsystem bounds check will fail because the requested index (9, =
10,
or 11) is greater than or equal to the registered number of resets (9):

drivers/clk/qcom/nwgcc-nord.c:nw_gcc_nord_resets[] =3D {
        ...
        [NW_GCC_GPU_BCR] =3D { 0x23000 },
        [NW_GCC_VIDEO_BCR] =3D { 0x1a000 },
};

Will this cause the reset controller to return -EINVAL and prevent the
video subsystem from successfully asserting or deasserting resets during
its power-down sequence?

> =20
>  #endif

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260801-nord_video=
cc_camcc-v2-0-674d7718e41f@oss.qualcomm.com?part=3D1
