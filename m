Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794588397;
	b=BrZqyGUboGdQDKkw9E2P3WCWDlb3Lx3FgHnU274xXcPNgf7RwI10Atli0DwoZkg9Ioxj
	 haokP+fLNvF03ZhmxUlY1zCRDzOdBqGnW0DszxFQxZjKjncgx0H6sebuE3qIlBjUik1NK
	 Wyd38B7d6C393KD+f2Vsp7HKl9GmU0bkiSKp8cp+byASdNgzz5EBg6CYPjBTGGc8lvqmF
	 wndRUEaSgU0tle+Jx9+8me66E0dly2CADmRYQ0XsH/2mKI+y3k7yHdzFoWsoxuuRhzwWS
	 rfN532F5PuGFaI6JB5wWLj0S94xB99Svynl/FYxIPVsW2GumHLQSl6m4RcWoTySI3dA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794588397;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=PoDV0KjgP3E1TDHsMfvgVh/hKwNzYfobSY5qYswUHZI=;
	b=hhxu+m5PslMF7zyZFihhCkPUC5/vQMkLJz0Lq+RJQOPhluvWpCTGDvS+Qur+l5dQ8o89
	 oI2pBnjar6dr0m9+2bDm79uviFIRo6oiPA5ivlaYwkgHIdWGS0EbN8RhvgEOJhsym+p4q
	 TKQ1dxTxIAk8mtCzeF/v+39RCleyXpL3C2pXp8iuuc8rq0eaaKoxtLpYqZyexNz012z0Q
	 awfHVo1yqNpBcihaSAQ0Pk5PJNMEVzIa+Qtl49bubtCTcLeGx5B+J77pCaG+3cZ+wYOU5
	 OcLOJdUNF90/wmd3WQGLlVnrhGU+1b6YJVJ95PrCfE4jL8IymbcflxFokwlk5Da+TPQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=iv+OQwbi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B62606F5D5
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 16:46:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1B62606F5D5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=iv+OQwbi
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b587538a37so2227572a12.2
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 08:46:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794588395; cv=none;
        d=google.com; s=arc-20260327;
        b=jUJLyP3umu7+k5QMRB2dUzXxPse+uMhGAOaMQeTWfUtvCag8ctMVY7fK+V5ofpcIkX
         GgqDdhLZrAHZZxrxpGEhn4ZnMW9Q/aRp2PaOn9oD1NfQuBle65AKKXaoGB7TBogAlqzf
         umv+1lxyDkuCG5YT2At9m4sXcyrKR2/ERckUgymvODnb258XrC895xm2n5QHHIG90hlG
         lwqTKLa3vtiEZLGUIIEG+xk+1pcxc7ku6uM1N3cgrqDQLutWJ9IQ63yglTSe0stAMUAF
         WqdLk1+YnKQQwDR1yGDJDZQjeVXHRXPDBNHx7tYQGDWYxlslI/lB2+lJV274oMG1uWQ2
         tggA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PoDV0KjgP3E1TDHsMfvgVh/hKwNzYfobSY5qYswUHZI=;
        fh=4pxZFdyz8Uc6g+1y1hA5hBtb3ra/dyvuCsQW0fYTjh4=;
        b=dCYQ0joXArnIUvuIsvGmW52jXBR1zSAZrfTxlIQucKvRTkFY//8k5khAZdEG0D0n/r
         g3FMwr849N/d9adwR6Xsx2WiLcs4mur6k2bGv+z1Y/S3q20Ve8NNc6a8Qi8MZetH4Cep
         eXhrWVon+pTQd2vFXMgfAcYaZDQgQCAe6CyfKCXLJV7zWwwMTH8aUGSUQZI67vdhBUX4
         el0idh/iKgjBpt7Cu1IgzSrJR4IdDZP6zTIrCwCO6eDP2Js6h/y12mqdL1P4UBjmAXwU
         fouOzHiEeR1/EtBIHFYiC6OIzcmcHoXGjjlBiF+swV4lhs+YiExsHR93eFSSN8bPJZ0s
         XGfg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794588395; x=1795193195; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PoDV0KjgP3E1TDHsMfvgVh/hKwNzYfobSY5qYswUHZI=;
        b=iv+OQwbi4cghQpC0jKft/CSqfDiS1Ihc9bfUHcjUtiUmUBegPlwVr/Ul8v16P5x1Oa
         WJ2xfkXeIZqSRMcmRIzFnK1FCmeyxWVAIN2VXSDib1ZkUH3H2LU/Mip8ClkyAAhJIoT2
         uPY+i1hFWgOsylJs945u0z0AG0T/5ilAOzPbwa+bAykSn4GOP5UArt1jcWlNkZso2IzX
         CRiSokmPrLmTrrWNUe1r/OIJGNSh9i7KzU/GU1Dh6QEuNwGrKE3ZKB/sOkvKeqEk411k
         rndIDYoU9jL3kD+f7zNtbLiby6wstIJPZzPp+JZSwdoACWmvyFq1F6zTwoR/yjpV55pa
         jhuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794588395; x=1795193195;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PoDV0KjgP3E1TDHsMfvgVh/hKwNzYfobSY5qYswUHZI=;
        b=j8PtfV4v4pvNy6nyXrYTUeUBv4RXes3SA0UjbnFt5IpzNKQo9B0tS50mVHFasArInm
         fcWuwZ4zns2ndRrLgUOJ01syMewseE0c8i65VFTdZBvOw8yAyOt0oE1D67nr9WybUk80
         fP2SqlCLc5uBAoWZp9EOUrPk48dqZGbOP/mBJaeQmUNzZmDbEztbl10bwe57XY4M75Us
         zlvDjKTo5MJmoaVg5t1EIujk/2rv+vpcZ+epr8qsUopo0aw/cnrmI5FJ/xnpbxoTllyZ
         ZnqrWsm6FAbw/XY0Q3ERSdj0dLpY3boQSim2zbfHT7tpaVXTCSSPqOTC3lYUOyiFNOvi
         xbTw==
X-Forwarded-Encrypted: i=1; AL+hErH5g/0qic/8o0tLBfopIPvajG2cYZIRcm9vj98RMnzhmN14yb1uuj3odgFYV0QsKVlBvg58dJAKHhQB@vger.kernel.org
X-Gm-Message-State: APuU4Z8bQ2tZ8LsOuRXzBxam7QpDjTnVniGXSnN0/YJJ+h/Dw44hWo/i
	ZeF3qZtZfIgQwvxGhIOwrBsOeFV0+4nNtZv4aJkzyWTMrmyoVW+VhaCGSsVHYjE4ILM9HHpG/sA
	i2wOfWHfYF59Zq7lfv/s7PtiLYEBLZFku02vr/FJ6aQ==
X-Gm-Gg: AYBFou1iTw4Me8YnTZ5Jox3IDEtyreRSfYX2Y4R+7zByT/po0QNGpLEl9lNIBVTqW0z
	gPGYmDtcmWkzaEDc/hNHbp2PTOsjgNoDsMvnurIh5ypT6qwp/yAYQJ8ZQBCFjVfg+Ui7n2yFizv
	fmk/kt81tCw9aY8XeNaPnHxOYtJUMqnqvPD++wBYmeGKu/OgrHkohDUxQdMUMAMR23sQkRYw+5v
	XyI3Ez5zBd65WrP220Qm8y6HhwknElgj0y2G/PXeMHY3/iSvgPZ2g+AhNaWbBfM26NzwrXAMitW
	7c2rmUroRY82HtQg1R1DqmWnyXhOSUPgb0ft2hVK03WRMElB0tEoRbxkddAjLbUDb+Q+m32tj79
	W9p93yFqkAYA/pMH0aVRqAIYY+0FLzUnqim8qm3gZqTy7RS+IwUhuLtBTohu8LxbVl1UEEw==
X-Received: by 2002:a05:6402:a6c4:10b0:6b4:7b28:858b with SMTP id
 4fb4d7f45d1cf-6b7c0be1709mr2033159a12.19.1794588394028; Fri, 13 Nov 2026
 08:46:34 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260929-exynos850-acpm-node-cpufreq-v1-0-5a86c1d404b8@linaro.org>
 <20260929-exynos850-acpm-node-cpufreq-v1-1-5a86c1d404b8@linaro.org>
 <7b5dded4-c475-40dd-b5c4-5086bab4162e@linaro.org> <DLSMQGCHNINR.ZPYVN1SR0GM2@linaro.org>
 <8e305a3a-c30d-4862-9da4-8c763b9f88a0@linaro.org> <DMS1ELJMVBTB.2I2J926XE5V3S@linaro.org>
In-Reply-To: <DMS1ELJMVBTB.2I2J926XE5V3S@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 13 Nov 2026 16:46:21 +0000
X-Gm-Features: AclHuK_ez23rl1EP1_wg4tzOti-KVedDElMJmYIu226TUJ8WPAQv2T8gyYll0Ws
Message-ID: <CADrjBPq79Dn5pv-2wdcG5b9rNb4NHatzGGZMrfAkF1L0ZD1mHQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: exynos850: Add ACPM firmware node
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Thomas Turner <tturner@lineageos.org>, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Juan Yescas <jyescas@google.com>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Alexey,

> >> Eventually to have some sensible/working ->recalc_rate() for ACPM
> >> cpucl{0,1} clocks.
> >>
> >> Which is needed, for instance, for cpufreq_dt because it registers with:
> >>
> >> static struct cpufreq_driver dt_cpufreq_driver = {
> >>         .flags = CPUFREQ_NEED_INITIAL_FREQ_CHECK |
> >>                  CPUFREQ_IS_COOLING_DEV,
> >>
> >> Don't know if it answers the question (if I understood it correctly)?
> >>
> >
> > Thanks, Alexey. I see now that clk-acpm.c uses pdata.fw_name on the
> > parent (acpm_ipc) DT node to link the ACPM clocks to the CMU PLLs for
> > ->recalc_rate(). Could you please clarify a few things in the commit
> > message (and below):
>
> Thanks for the good questions. You hit the exact pain points we have been
> debugging on hardware with cpufreq-dt and Panfrost devfreq.
>
> > 1. Physically, CLK_FOUT_CPUCL{0,1}_PLL are not input clocks feeding the
> >    APM hardware, they are the PLLs that ACPM reconfigures behind the
> >    scenes. Meanwhile, acpm_clk_register() sets num_parents = 1 and
> >    pdata.fw_name = name for all 9 clocks in exynos850_acpm_clks[].
> >    Since the DT node only lists "cpucl0" and "cpucl1", won't the other
> >    7 ACPM clocks (mif, int, g3d, aud, cam, disp, cp) remain permanently
> >    orphaned in CCF with rate = 0?
>
> Correct. Is it a problem now since there are no "clients" or consumers or
> users of these clocks?
>
> Or do you suggest to link them all to parents clocks to have a sensible
> rate?

Since your implementation relies on CCF to get the clock rates I think
you have two options:
1) Only register ACPM clocks that have a corresponding CCF implementation.
2) Add the missing CCF clocks for the ACPM clocks you are registerring

Should CCF's ability to set the rate for these ACPM-managed clocks
also be restricted? It seems undesirable to have two entities (Linux
and ACPM) able to set the clock rate, with the possible exception of
it being useful for debugging. These limitations should also be
clearly mentioned in the commit message or cover letter.

>
> > 2. Does bypass_acpm_exynos850_get_rate() actually return the updated rate
> >    after clk_set_rate()? When ACPM changes the PLL frequency via IPC,
> >    CCF is unaware that the parent clock (fout_cpucl0_pll) changed in
> >    hardware. Even with CLK_GET_RATE_NOCACHE on the ACPM clock,
> >    __clk_recalc_rates() only reads the cached core->parent->rate without
> >    calling ->recalc_rate() on the parent itself. Won't parent_rate remain
> >    stuck at the initial boot frequency?
>
> This was already asked and seems there are no answers. The problem with
> stale rate is present.
> https://lore.kernel.org/linux-samsung-soc/DLAZXSNZK6QC.1VFAX37XCXBOV@linaro.org/

The question was sent on September 9th, but the series adding support
into ACPM was sent on September 15th
(https://lore.kernel.org/lkml/20260915-exynos850-acpm-clk-v2-0-ffad4a6b3fb1@linaro.org/).
The limitation about get_rate returning stale values should have been
clearly stated in the cover letter or commit messages.

>
> Any suggestions?

For the benefit of the ML, we discussed this topic off list. The
consensus was to try and make CCF walk the clock tree, recalculating
clock rates from the SFRs without using any cached values (as ACPM
could have changed the SFRs of PLLs, dividers, etc., behind Linux's
back).

That should in theory mean that clk_summary will always report the
correct clock rates for everything in the clock tree and we won't
report (or make decisions) based on stale values.

> > 3. In drivers/clk/samsung/clk-exynos850.c, cpucl0_cmu_info and
> >    cpucl1_cmu_info still set `.manual_plls = true`.
> >    Does that conflict with ACPM firmware managing the CPU PLLs?
>
> I don't know yet what to do with that. I didn't encounter any problems
> yet because of this. Is it related to early initialisation only?
> I thought that exynos CMU driver doesn't touch PLL clocks after init.

You should check this with downstream sources and the TRM.

regards,

Peter
