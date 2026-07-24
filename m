Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F85A4137A5
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 14:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784903665; cv=none; b=Mp1QMHZDpfpuOkxAwS4sSpIzrtl7pxmbrDVgdkydJbX7rK2obdsdGgZfNTlXZB8ZdgP0XwMhHolLks8orDoSHYYcfR/s8wMdG/qjZn4fdPHMsT/RUGyjTO0/HRayHFZkWj5QPeqDkgkcam01jkf4+9zN6xpor+91p8AtCA/5obU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784903665; c=relaxed/simple;
	bh=DM3qBtJl3Jp81ZUOV3czUPQlj0qKe2aUA7jHuiH+B6g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=E2d5G0mGcONjaB4b70/gF7Dx9uwN2gwlTWawRYLVgBmItB4glL8ozsJU9V1uwn0diIW28oDSB2MIKSWj+w87XTaXEHgxEN4mGDrMqy4BySYKkMjSURvZjcGfF+6v3d7yACChV8SWvL8wQWVo/NFmNWE7j/SGyH2Db0sX3NqZD9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NH31Vmv9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NH31Vmv9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D2151F000E9;
	Fri, 24 Jul 2026 14:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784903662;
	bh=wLhRqprnW96W5KoFpqm/Ojaivkskuyg1XWCKvHtTjtk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NH31Vmv9sfRz9i/0EIzi+aoZUm7VGvoUlO92+wLithe4co7vyZvATV2BPXq4vOP7S
	 fo2UJqstHU6LIGqJYiaM15d8ieTufsPpIdF++e/Wik3TjwUoY6wK8gjkug4PnBkk78
	 EUGmmUwp+FD8Pwhxm9aUJjF/BPbd7RgprOFm12bkjRUcWhFfJQPmzZjQsIot6PileS
	 5XAxgzdivT/LO2clIOEjsXBFawhN/hRjx+3RYRVfudGVWaTSrs3bilv206jeb7kmyK
	 tNV2jsCTkrhjnykQaNWwlvznjb8DaSDedj83OfgxxQninkKa44Rl1rR5FEG11cJXJr
	 WtHXG4IQjlU9A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/5] ASoC: qcom: qdsp6: Increase Q6DSP_MAX_CLK_ID for
 LPASS LPR vote clock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Prasad Kumpatla" <prasad.kumpatla@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260724141708.2212057-3-prasad.kumpatla@oss.qualcomm.com>
References: <20260724141708.2212057-1-prasad.kumpatla@oss.qualcomm.com>
 <20260724141708.2212057-3-prasad.kumpatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 14:34:21 +0000
Message-Id: <20260724143422.1D2151F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Medium] The LPASS LPR vote clock is supported by the array bound increas=
e, but the clock itself is never actually instantiated in the provider tabl=
es.

Pre-existing issues:
- [High] Clock operations can be called before device drvdata is initialize=
d, leading to a NULL pointer dereference.
- [Medium] Concurrent or multiple OF clock lookups mutate shared clock attr=
ibutes locklessly.
--

--- Patch [2]: [PATCH v6 2/5] ASoC: qcom: qdsp6: Increase Q6DSP_MAX_CLK_ID =
for LPASS LPR vote clock ---
commit c2ccafc9793d5fdece974aa409ae112fa2b07ae4
Author: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

ASoC: qcom: qdsp6: Increase Q6DSP_MAX_CLK_ID for LPASS LPR vote clock
   =20
Q6DSP_MAX_CLK_ID defines the upper bound of supported clock
identifiers in the qdsp6 LPASS clock driver.
   =20
Increase the maximum clock ID value to accommodate the LPASS
LPR vote clock identifier.

> diff --git a/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c b/sound/soc/qcom/q=
dsp6/q6dsp-lpass-clocks.c
> index 03838582aeade..ab7d20580638b 100644
> --- a/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c
> +++ b/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c
> @@ -12,7 +12,7 @@
>  #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
>  #include "q6dsp-lpass-clocks.h"
> =20
> -#define Q6DSP_MAX_CLK_ID			104
> +#define Q6DSP_MAX_CLK_ID			105

[Severity: Medium]
Will consumers actually be able to get this clock?  While the bounds limit =
has
been increased, it does not appear that the clock is ever instantiated in t=
he
provider tables (like q6afe_clks[] or q6prm_clks[]).

If a consumer requests LPASS_HW_LPR_VOTE (104), cc->clks[104] will remain N=
ULL
during lookup, resulting in a safe but incorrect fallback:

sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c:q6dsp_of_clk_hw_get() {
    ...
	if (cc->clks[idx]) {
		cc->clks[idx]->attributes =3D attr;
		return &cc->clks[idx]->hw;
	}

	return ERR_PTR(-ENOENT);
}

Is there a missing clock provider array update in this patch?

>  #define Q6DSP_LPASS_CLK_ROOT_DEFAULT		0

[Severity: High]
This is a pre-existing issue, but can this lead to a NULL pointer dereferen=
ce
during early clock operations?

The driver registers the hardware clock provider before setting the device
drvdata:

sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c:q6dsp_clock_dev_probe() {
    ...
	ret =3D devm_of_clk_add_hw_provider(dev, q6dsp_of_clk_hw_get, cc);
	if (ret)
		return ret;

	dev_set_drvdata(dev, cc);

	return 0;
}

If an asynchronous or deferred probe consumer requests the clock and calls
the prepare operations, the callback fetches drvdata which will be NULL:

sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c:clk_q6dsp_prepare() {
	struct q6dsp_clk *clk =3D to_q6dsp_clk(hw);
	struct q6dsp_cc *cc =3D dev_get_drvdata(clk->dev);

	return cc->desc->lpass_set_clk(clk->dev, clk->q6dsp_clk_id, clk->attribute=
s,
                                 ...
}

Should dev_set_drvdata() be moved before devm_of_clk_add_hw_provider()?

[Severity: Medium]
This is also a pre-existing issue, but does this clock lookup introduce a d=
ata
race if multiple consumers share the same clock?

When a consumer requests a clock via of_clk_get(), the shared clock
attributes are mutated locklessly based on the caller's arguments:

sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c:q6dsp_of_clk_hw_get() {
    ...
	if (cc->clks[idx]) {
		cc->clks[idx]->attributes =3D attr;
		return &cc->clks[idx]->hw;
	}
    ...
}

If multiple consumers request the same clock concurrently, this could race.
Additionally, the last consumer's attributes will silently overwrite those =
of
earlier consumers, potentially causing subsequent prepare operations for all
consumers to execute with incorrect attributes.

Could this shared state mutation be avoided or protected?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724141708.2212=
057-1-prasad.kumpatla@oss.qualcomm.com?part=3D2
