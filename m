Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02DD3F5BCE
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 13:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784553417; cv=none; b=ZuKMXjoj0IUctHWc19ny3gK+NLCs/bVXkZjxcyy0r+vkBNBCR5zqM6XQykeoSg1+Nbd9p2Wy0CFcYR+RuQXaWH+El756G/tWdXfheqbLoB4lioAOXgmmkhG54AB5RYE4o1Z3YJibt6Pi/PI5I1DVRydA8b3Y16iTTUBxPuQyvgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784553417; c=relaxed/simple;
	bh=NMOCObn2Rm9Oy8wdXKK6z2Kh4k6DPvBLJ1zq6W9oodY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=F739Z3ZmbW9aIWIDQcrmBfRRKz8ohhcPe20O/vpMCuhnL5slRFM6RgDH9r9jCpP+YgExdiQJVLtU7AOPnHBf9M5+TGuhOT4ZxgKDF/rUKQ29gYQUpwBAZ095TPX4Xu/I5jHsuJa1LhsBm1vdkVoOSJk7MQtLntjKsOAfwD8kexo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BZMjx5Mr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BZMjx5Mr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C4391F000E9;
	Mon, 20 Jul 2026 13:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784553416;
	bh=oBdgGWPAUxHyryJ96N3DAJ+D88grQxQ72tGxAir5hOE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BZMjx5MrEgquLiRTlikJkwRGEH6XlFkQQHGA3ujb/vtmGdsnIcS+Qg+UkL/7a9rOB
	 JlguCkRjbfdkPBL1JzTQlkz2nWJZlvJ3zlrt1NgfryEbH+XFBwtC5qo64F/MJUaME8
	 CxUdMrJE9DB2H02oskkO5BFoc+wPShh0z6AUuT/tUNc+l00Ji8kYhkBjMqL/UKJGK0
	 Q5BTSHgU6ePEPUAwBNtx/0KqkTPcy3AnBFJpGjs6H2ZCtCD2l1i6uc+3SzUTwXPRe/
	 oCXpu1QH2qbwJZG4QufuqtnQED5qeGGKDUmlfpZi9vlgZnK0gWh1jYjF5mYRjLHJUL
	 vReHFCrQEgnvQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/4] ASoC: dt-bindings: qcom: add LPASS LPR vote
 clock ID
Reply-To: sashiko-reviews@lists.linux.dev
To: "Prasad Kumpatla" <prasad.kumpatla@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260720130511.493295-2-prasad.kumpatla@oss.qualcomm.com>
References: <20260720130511.493295-1-prasad.kumpatla@oss.qualcomm.com>
 <20260720130511.493295-2-prasad.kumpatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 13:16:55 +0000
Message-Id: <20260720131656.4C4391F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The newly added clock ID `LPASS_HW_LPR_VOTE` (104) exceeds the dri=
ver's hardcoded `Q6DSP_MAX_CLK_ID` limit, rendering it unusable and creatin=
g an out-of-bounds array write hazard.
--

--- Patch [1]: [PATCH v4 1/4] ASoC: dt-bindings: qcom: add LPASS LPR vote c=
lock ID ---
commit de8b22fd20a65bf92d9b09b0009733d46893c763
Author: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

ASoC: dt-bindings: qcom: add LPASS LPR vote clock ID

Add a new clock ID, LPASS_HW_LPR_VOTE, to represent the LPASS low-power
resource (LPR) vote through the PRM interface. Exposing this as a q6prm
clock ID allows clients to request the LPR vote using the existing
qcom,q6prm clock provider interface. Drop Q6AFE_MAX_CLK_ID from the
bindings since it is not used in-tree.

> diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include=
/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> index 45850f2d43425..ce5e8589dd1a7 100644
> --- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> +++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> @@ -236,8 +236,8 @@
>  #define LPASS_HW_AVTIMER_VOTE		101
>  #define LPASS_HW_MACRO_VOTE		102
>  #define LPASS_HW_DCODEC_VOTE		103
> +#define LPASS_HW_LPR_VOTE		104

[Severity: High]
With LPASS_HW_LPR_VOTE being set to 104, does this exceed the driver's maxi=
mum
clock limit?

Looking at sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c, Q6DSP_MAX_CLK_ID is
set to 104:

sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c:
#define Q6DSP_MAX_CLK_ID			104

This causes q6dsp_of_clk_hw_get() to reject the new clock ID:

sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c:q6dsp_of_clk_hw_get() {
    ...
	if (idx >=3D Q6DSP_MAX_CLK_ID || attr > LPASS_CLK_ATTRIBUTE_COUPLE_DIVISOR=
) {
		dev_err(cc->dev, "Invalid clk specifier (%d, %d)\n", idx, attr);
		return ERR_PTR(-EINVAL);
	}
    ...
}

Will this also cause an out of bounds write during probe if the ID is used?

The clock array is sized with Q6DSP_MAX_CLK_ID:

sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c:
struct q6dsp_cc {
	struct device *dev;
	struct q6dsp_clk *clks[Q6DSP_MAX_CLK_ID];
	const struct q6dsp_clk_desc *desc;
};

If ID 104 is added to the driver's clock array in the future,
q6dsp_clock_dev_probe() will write past the end of the clks array,
overwriting the adjacent desc pointer.

> =20
> -#define Q6AFE_MAX_CLK_ID			104
> =20
>  #define LPASS_CLK_ATTRIBUTE_INVALID		0x0
>  #define LPASS_CLK_ATTRIBUTE_COUPLE_NO		0x1

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720130511.4932=
95-1-prasad.kumpatla@oss.qualcomm.com?part=3D1
