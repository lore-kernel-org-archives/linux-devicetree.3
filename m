Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ADA33AFD1A
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 14:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784903359; cv=none; b=JOriMH2a86kF907NxVH2sd7IOOXrQ+YeRIChyxFSW4HlIQGi0koX9HYPaquT+dv2AHkTKzdMub62t58aax+qiUViWYdlEKOgcqph0+w7nd1w4nQgHHTEuVV6MqeQJRvRciSHkj7058w9+YKDNCXOvhdiPZ8wnj9k+LqQBeOldhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784903359; c=relaxed/simple;
	bh=jg09bIh6TqQ1ZVyhdSJEdLq1IQBF+U2NVap1fRDCarA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=M73t0gYdU7USpVJtPSgefVDqVI1SYrU6oq3vD9Ko4up2t2/sEEz1TkG/wvzGZgLTtYObH0ByXabFUQzVYIXVJE0jxqz+uYyS+h41u22enRbGleNg5ToH8fzOmDt2y3R+Z4gchAFrMBI+kmpOPg8NYrQKEc2L0PkUQONr+UnkRhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ld1BY5u8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ld1BY5u8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 953BC1F000E9;
	Fri, 24 Jul 2026 14:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784903357;
	bh=uOGanmYCYPRnr5mhsdRoBeorWyBXkRyFdfe6d89fZbo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ld1BY5u8teaZmYoBQyAhOPwjKDu6kgA6uYsRo+J8TPhsRvo/T1t6pg4EHTtioSdmj
	 IIauiFb51Jzz6chCKWRPdMhSobkNqs68QkhGX2SOZJMks0cbtpJTSnKAAHGAygK2+/
	 FZFyMniazHjSraGDJ+qUKqintDtpkY+XoGKxLYUCeXXQ0Xg34CxNSV/+EgBtGUkqFx
	 ZDL3ixVFFlHoPi29rq61s0N+zqwxIQazgDELqRbmPQc2KauFlDD+uzQa7ZsXx8B9Ky
	 4rMaSeonUPGnYbxsZ7QefXGrB5SJHMmqTFK5ABpUCyN+drXvCv0CSPekmJuqbRBFaq
	 rQJIxVCww81Aw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/5] ASoC: dt-bindings: qcom: add LPASS LPR vote
 clock ID
Reply-To: sashiko-reviews@lists.linux.dev
To: "Prasad Kumpatla" <prasad.kumpatla@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260724141708.2212057-2-prasad.kumpatla@oss.qualcomm.com>
References: <20260724141708.2212057-1-prasad.kumpatla@oss.qualcomm.com>
 <20260724141708.2212057-2-prasad.kumpatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 14:29:17 +0000
Message-Id: <20260724142917.953BC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Adding clock ID LPASS_HW_LPR_VOTE (104) without incrementing Q6DSP=
_MAX_CLK_ID in the clock driver prevents its use and introduces a latent ou=
t-of-bounds array access.
- [Medium] The new clock ID `LPASS_HW_LPR_VOTE` is defined in the dt-bindin=
gs header but is completely unimplemented in the actual clock provider driv=
er, making it unusable.
--

--- Patch [1]: [PATCH v6 1/5] ASoC: dt-bindings: qcom: add LPASS LPR vote c=
lock ID ---
commit f9999fdb82c99c4b2b674da0fc47d8921c55373d
Author: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

ASoC: dt-bindings: qcom: add LPASS LPR vote clock ID

This patch adds a new clock ID, LPASS_HW_LPR_VOTE (104), to the dt-bindings
for the LPASS low-power resource (LPR) vote.

> Add a new clock ID, LPASS_HW_LPR_VOTE, to represent the LPASS low-power
> resource (LPR) vote through the PRM interface.
>=20
> The LPASS PRM supports a resource voting mechanism to control low-power
> states via PARAM_ID_RSC_CPU_LPR. Exposing this as a q6prm clock ID allows
> clients to request the LPR vote using the existing qcom,q6prm clock
> provider interface.

[Severity: Medium]
Is the clock provider implementation missing from this patch?

The existing qcom,q6prm clock provider interface doesn't appear to have this
new ID wired up in the q6prm_clks array in sound/soc/qcom/qdsp6/q6prm-clock=
s.c.
Without adding it there, clients won't actually be able to request the clock
as described in the commit message.

[ ... ]

> diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include=
/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> index 7b553a73bc928..8e04106d48be5 100644
> --- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> +++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> @@ -236,6 +236,7 @@
>  #define LPASS_HW_AVTIMER_VOTE		101
>  #define LPASS_HW_MACRO_VOTE		102
>  #define LPASS_HW_DCODEC_VOTE		103
> +#define LPASS_HW_LPR_VOTE		104

[Severity: High]
Will this new ID get rejected by the driver's bounds checking?

In sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c, Q6DSP_MAX_CLK_ID is currently
defined as 104. When a client requests this new clock, the validation check
in q6dsp_of_clk_hw_get() will fail:

    if (idx >=3D Q6DSP_MAX_CLK_ID || attr > LPASS_CLK_ATTRIBUTE_COUPLE_DIVI=
SOR) {
        dev_err(cc->dev, "Invalid clk specifier (%d, %d)\n", idx, attr);
        return ERR_PTR(-EINVAL);
    }

Since 104 >=3D 104 is true, it will return -EINVAL.

Additionally, if the new clock is wired up later in the provider array with=
out
increasing Q6DSP_MAX_CLK_ID, q6dsp_clock_dev_probe() will perform an
out-of-bounds write because the array is sized based on the max ID:

    cc->clks[id] =3D clk;

Does Q6DSP_MAX_CLK_ID need to be incremented to accommodate this new ID?

> =20
>  #define LPASS_CLK_ATTRIBUTE_INVALID		0x0
>  #define LPASS_CLK_ATTRIBUTE_COUPLE_NO		0x1

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724141708.2212=
057-1-prasad.kumpatla@oss.qualcomm.com?part=3D1
