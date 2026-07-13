Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4708630ACF0
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 18:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783969079; cv=none; b=Y9RIJWFHRb87+v0TjiypUhjADWGifExfOVIZoJbOZ6KOj7U5my3j2RHdwb9ceV7R1ERsXeXu4BA8kc1bFQO0Us0uSIt4Yx5Z8zfcf7btfQwLnbRccD3HdgK/BhOW2jcSxwO7Qy7VdEU9t9QLfE2zICTMrS4hf2C01rSrqsW8+mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783969079; c=relaxed/simple;
	bh=glVtec9ZVtISO4hhBGIu6Mgx+mnYeVUxprTyptPIT4E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eZlhxZll3iSIs1wXWxbqVli0BNlG8VlKUknr5xNdsodeIU3kAvEf7tukDr8Ia+PnIIP13i8/xsQwDP7S2412Rr2cHqa+Pp+GFGyNiVybquO+wtxmqhkN2w1lzQc48dGqLZxA6v9qp28C/6YlqPrfJtryLqmrGkCzkhfZq8HArJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DaCW/du6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DaCW/du6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D28271F000E9;
	Mon, 13 Jul 2026 18:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783969078;
	bh=AR6UGFqQEu7dXUkOsBuykGr8lAsWGkdChmyTkGrRjYI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DaCW/du6ykZJUkmN0LOz1afk2hdhD6E1aVufOrovDDdA0nU2QE9UyIMpGZpOH5dSO
	 kVeYUh3XwYspS+qLbRNAGzBZJhp0N9N3Llhp8Mp/Shzip5iCWYg1mbeuDP4VGfvnYs
	 c2lDbl0x2qo+dY5/Co28Cqlek/i86mwD8rSIkmvXkrnyDxmWvynXoFzurOJPEvKnYS
	 2nACOW7PSvewM09Sgj8ZCtqANwoT5/45sT+q7QaHozlSuLTTd284rKUa42e2apt1v+
	 Ol7nGsBz2/ioisgjs3lmLS299TibrmliblHLABe+0RssqVZfP9dDjsYp/ynKE8UiVG
	 RPd+jtV7zmP0Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/5] ASoC: dt-bindings: qcom: add LPASS LPR vote
 clock ID
Reply-To: sashiko-reviews@lists.linux.dev
To: "Prasad Kumpatla" <prasad.kumpatla@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260713184549.929569-3-prasad.kumpatla@oss.qualcomm.com>
References: <20260713184549.929569-1-prasad.kumpatla@oss.qualcomm.com>
 <20260713184549.929569-3-prasad.kumpatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 18:57:57 +0000
Message-Id: <20260713185757.D28271F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Adding the clock ID `LPASS_HW_LPR_VOTE` (104) without updating the=
 hardcoded driver limit `Q6DSP_MAX_CLK_ID` causes valid device tree request=
s to be rejected and creates an out-of-bounds write hazard.
- [High] The driver implementation for the newly added `LPASS_HW_LPR_VOTE` =
clock ID and `PARAM_ID_RSC_CPU_LPR` parameter is completely missing.
--

--- Patch [2]: [PATCH v2 2/5] ASoC: dt-bindings: qcom: add LPASS LPR vote c=
lock ID ---
commit 806d87026efc23f9d5588f86e5e4c815dd4852cd
Author: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

ASoC: dt-bindings: qcom: add LPASS LPR vote clock ID

Add a new clock ID, LPASS_HW_LPR_VOTE, to represent the LPASS low-power
resource (LPR) vote through the PRM interface. Also update
Q6AFE_MAX_CLK_ID to account for the newly added clock ID.

> The LPASS PRM supports a resource voting mechanism to control low-power
> states via PARAM_ID_RSC_CPU_LPR. Exposing this as a q6prm clock ID allows
> clients to request the LPR vote using the existing qcom,q6prm clock
> provider interface.

[Severity: High]
Is the driver implementation for this functionality missing from this patch?

Looking at sound/soc/qcom/qdsp6/q6prm-clocks.c, the q6prm_clks[] array does
not appear to map the new LPASS_HW_LPR_VOTE clock ID, which means it will
not be registered during probe.

Additionally, q6prm_set_hw_core_req() hardcodes PARAM_ID_RSC_HW_CORE and
does not seem to have the logic to handle the newly documented
PARAM_ID_RSC_CPU_LPR parameter ID:

sound/soc/qcom/qdsp6/q6prm.c:q6prm_set_hw_core_req() {
    ...
    param_data->param_id =3D PARAM_ID_RSC_HW_CORE;
    ...
}

Are there corresponding driver changes expected to accompany this binding?

> diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include=
/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> index 45850f2d43425..06ca2c287ab2f 100644
> --- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> +++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> @@ -236,8 +236,9 @@
>  #define LPASS_HW_AVTIMER_VOTE		101
>  #define LPASS_HW_MACRO_VOTE		102
>  #define LPASS_HW_DCODEC_VOTE		103
> +#define LPASS_HW_LPR_VOTE		104
> =20
> -#define Q6AFE_MAX_CLK_ID			104
> +#define Q6AFE_MAX_CLK_ID			105

[Severity: High]
Does the hardcoded limit in the driver also need to be updated to support
this new clock ID?

In sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c, Q6DSP_MAX_CLK_ID is hardcoded
to 104. Since LPASS_HW_LPR_VOTE is exactly 104, device tree requests for
it will fail the bounds check and be rejected:

sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c:q6dsp_of_clk_hw_get() {
    ...
    if (idx >=3D Q6DSP_MAX_CLK_ID || attr > LPASS_CLK_ATTRIBUTE_COUPLE_DIVI=
SOR) {
        dev_err(cc->dev, "Invalid clk specifier (%d, %d)\n", idx, attr);
        return ERR_PTR(-EINVAL);
    }
    ...
}

Also, if the provider driver is updated to register this clock, will it
cause an out-of-bounds array write during probe? The target array seems to
be sized based on the old maximum limit (104 elements):

sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c:q6dsp_clock_dev_probe() {
    ...
    cc->clks[id] =3D clk;
    ...
}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713184549.9295=
69-1-prasad.kumpatla@oss.qualcomm.com?part=3D2
