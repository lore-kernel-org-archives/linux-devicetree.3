Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72DD240863F
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 12:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782736364; cv=pass; b=kb8RUsVpZraZof5Yp9VCE2T92mlQXfbfDPE9WCGU0+D98uy+JsJ36XxQO+YtvaT1FUlKoIkVqIXCZEfv5asu7V/3F3sQ4KroTeT6taaD/jUtQqqwjRngVhLzeoa5nQ8y6CF7VTw0Sa3y71+/tzl2gTwQlz/zkQlkLLDhxuLVt1E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782736364; c=relaxed/simple;
	bh=L8JaU1cFQMm9KChrGufXeN5dKBFqD7lhpptMglX4LMw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FX+3UtCh2SCtD8KzdHBp3KZyiQj3+n+DMvGOx9NG5Mqg3TaoWCJbA6BkCWirf41NPAgbnZExIQ3raPpepVhNgwnAqfPKa0npuyvC5gkdP7vwN0RTIloONbAmhbu4tpqYfUC5V+XsIan7bHyOcgWxAZlItEoyHkjmojf6lWWIovc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JGuyXLnQ; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JGuyXLnQ"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6982e71dfb0so3684042a12.0
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 05:32:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782736361; cv=none;
        d=google.com; s=arc-20260327;
        b=EN3h2sBfw+iccgURCgK3ipd2r1ZWhJ/TbGI+3UVCCsVnf1INKaypBzWhxjkuZfpNIg
         xk4rJZFe66bsWm34ZyqXBVeGtxEqPKOYhFwMYDOLP8rurRXCgPso4vFd4RM0tOuxnuuk
         EsaO2KUwUbjaYETnSCxkNKir++Hk24Itu7GOMe2dhIbhNVrSnKDeYurUuLOJNJrzPIEr
         uWWKI/2jlQEqqpbkziDJYlaKyICW2cNFUJ13cuRZCxx6Ig4x3ztrGSHJeJ/8UmY1oWig
         GorYkByQ27Db4ks2kSKuvLCSmkWqjQ0iHjqj0VXnwFY2y2ZAJBDIOQLis+6ByIuj/gJe
         xmXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mx+bJya2052OeT1zYheYpJVI5drzn8BNJLEF7IAU1sg=;
        fh=C9p10IgJBQSQxqTl0LEGNob60MOSZhhMQJMDT53bkn4=;
        b=EG1B918peHx/zu4t44W61ADgsljj4jI0YHmKyqRzD9VmiGqCgDiX1jaCcmRz8pZPLV
         +mat6Me3388Hr+PPVUxVfSZC+sQdn1c5tBuBTF+P3G9ZqZLCQ+NdhAvRn6A7xdohc6WI
         IOYO0HUa13wZO5HsOItMZmtOD9ig/b3LHd6ViVPBGMAZcvd4z8y21euSPwYsYM7i1uUw
         v9lu8CNGjiUy6SevJfC3sAE2iUCPTmVQICsAsL9lOftEkoCoYJ+Yb5HEkKfVZQErSnXw
         kxoUpWeE3rHylRdPEPF+RxFC2o8YVM4ysllSzEPXpJ38vpRjSKxoykk/kXMmC9+abnv6
         NeqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782736361; x=1783341161; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mx+bJya2052OeT1zYheYpJVI5drzn8BNJLEF7IAU1sg=;
        b=JGuyXLnQL5sz9BH6+VPjvQeoF3/judbJARvJ0xkTJSpwa3rlW9fTCnYBr3mSjiI2xB
         3Ac60HX+i5+KJAoVOEBKs+x3EUrHbziQNfLPDONqowB+t9HrmkDfyf1YK0P8vDtScu3Y
         791WtF7RyjGrvlOAOBWeitOkmZzwWJkx0f9z3W9jhD4iRV1xGBbKtKyvI231NsXMyMuP
         LDLPPtMnXTbWN/mUVqzpW0vlEevdhFAu00He9KdLufz9D/UHuvLWxDOjj5tSixQ+mR/1
         8jtGvG6Bgzl0NFhPretHBnDU9dB/73TI0SSZKc3sVk/29lR2qq6KpsiAZTLvkZPSIX31
         diog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782736361; x=1783341161;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mx+bJya2052OeT1zYheYpJVI5drzn8BNJLEF7IAU1sg=;
        b=VsgDVDFUHQYCo6Am7R8Zb4QdcdvuRNfxT8QnQgalODNSR9w83QgQaLRJdnnLTGX/ew
         Bp6FweYbcWcRtc1ZQ1e2zvxUwvDRpGmEpMuTgYEMF8feNV6w849vOMg53sGnTa6eKGqB
         bTHtQsbSLjEEPPWRMpZo1zhpolmdtJoMR5l4WVbNBFPGvakXHtZ+mklX64COGsndqxFv
         PYqdXhwUwx2rWAN15BTCTPHZyCIykzFXRyx7Il0ApBXejYzRgXy3KHiEAvfe+N60bZfj
         8Xb6mTcZ2TSqDEQCZvyqojqhFsaarGORTsfFcb1W+iXj7wT+j7opd/7jLAfRMdmfmEyx
         tmdg==
X-Forwarded-Encrypted: i=1; AHgh+Ro6Wk+rg2FpT9DSGx21zoAQro0CSG3IC4DESx7r2L2j4b8tzNroLJOb2xGL5reBpZF52r0qGw1Vv+iQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6Zh/iWg24eLiug+xwcl/H+YjjS7g4Q3EVa5ktsJfc0FgOO1QU
	qvywlmEZOarrcyFsYAyhN87hPwDHSYaXCgrvG/AjM3mKUXeI9ikCv8VHIUldpYDF8t9/ZVbHSuY
	pwHCjpzIkosN16TlaIVPtsXouIE13mrydPsGNeoHgIg==
X-Gm-Gg: AfdE7cnhdtkDgEfPu256M/erAukNp7iUSeJMUtFsvzv5v/66WI1updZQtJAyXHCFqrE
	gYyTA02Hdil4mzFRw1VPTs8RderefUlWZDYyE2qNxMIrccWiIiayUCfluZUqdxdAzjuxAy3FUYX
	V/DTBK5DJzj3VVuVR9ZVvLqyPH7utqxVdh7DmRu8kiH3+KNLVbyzsEM2HpSjqIKB3SIocZm9bcu
	kWWW+4Nv/hlyZAuZE3al0K8lnVtb2p0p+AccD4RzUADVuijkL9LvkxNwzab4hpxr5uDIFIAx+bE
	+063oF/JC8EXdOiIN7OIY8D8rfNQ7g==
X-Received: by 2002:a05:6402:35cd:b0:697:d475:9692 with SMTP id
 4fb4d7f45d1cf-6983630b4camr4695431a12.11.1782736360872; Mon, 29 Jun 2026
 05:32:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260613-exynos990-peris-fix-v3-v3-0-2b230db78ae4@gmail.com> <20260613-exynos990-peris-fix-v3-v3-3-2b230db78ae4@gmail.com>
In-Reply-To: <20260613-exynos990-peris-fix-v3-v3-3-2b230db78ae4@gmail.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 29 Jun 2026 13:32:29 +0100
X-Gm-Features: AVVi8CdLbhp4Di9rmkSMap57ieyZzpxVCIoG3c1G91VB-Ou_IfcxhglJYrQ6uH0
Message-ID: <CADrjBPpNQd6WgwVo-a3Mz74d1EptPm9D9BisLEmoFRsdUb3izw@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] clk: samsung: exynos990: Fix PERIS gate clock parents
To: Denzeel Oliva <wachiturroxd150@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krysztof & Denzeel,

On Sat, 13 Jun 2026 at 13:36, Denzeel Oliva <wachiturroxd150@gmail.com> wrote:
>
> Correct eight PERIS gate clock parents to match the hardware clock
> tree and reorder the GIC mux parents so mout_peris_bus_user is the
> default source.
>
> Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

@Krysztof: I was thinking, maybe we should establish a new rule/best
practice for Samsung clock upstream submissions whereby patch
contributors should link to the downstream cal-if code for the SoC
after the --- line. That would make reviewing the patches' correctness
a bit easier, as the downstream cal-if code would be readily available
to the reviewer.

regards,

Peter

>  drivers/clk/samsung/clk-exynos990.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/clk/samsung/clk-exynos990.c b/drivers/clk/samsung/clk-exynos990.c
> index ee3566b8e57c..df5928833b23 100644
> --- a/drivers/clk/samsung/clk-exynos990.c
> +++ b/drivers/clk/samsung/clk-exynos990.c
> @@ -2551,7 +2551,7 @@ static const unsigned long peris_clk_regs[] __initconst = {
>
>  /* Parent clock list for CMU_PERIS muxes */
>  PNAME(mout_peris_bus_user_p)           = { "oscclk", "mout_cmu_peris_bus" };
> -PNAME(mout_peris_clk_peris_gic_p)      = { "oscclk", "mout_peris_bus_user" };
> +PNAME(mout_peris_clk_peris_gic_p)      = { "mout_peris_bus_user", "oscclk" };
>
>  static const struct samsung_mux_clock peris_mux_clks[] __initconst = {
>         MUX(CLK_MOUT_PERIS_BUS_USER, "mout_peris_bus_user",
> @@ -2584,15 +2584,15 @@ static const struct samsung_gate_clock peris_gate_clks[] __initconst = {
>              CLK_CON_GAT_GOUT_BLK_PERIS_UID_RSTNSYNC_CLK_PERIS_BUSP_IPCLKPORT_CLK,
>              21, 0, 0),
>         GATE(CLK_GOUT_PERIS_CLK_PERIS_OSCCLK_CLK,
> -            "gout_peris_clk_peris_oscclk_clk", "mout_peris_bus_user",
> +            "gout_peris_clk_peris_oscclk_clk", "oscclk",
>              CLK_CON_GAT_CLK_BLK_PERIS_UID_RSTNSYNC_CLK_PERIS_OSCCLK_IPCLKPORT_CLK,
>              21, 0, 0),
>         GATE(CLK_GOUT_PERIS_CLK_PERIS_GIC_CLK,
> -            "gout_peris_clk_peris_gic_clk", "mout_peris_bus_user",
> +            "gout_peris_clk_peris_gic_clk", "mout_peris_clk_peris_gic",
>              CLK_CON_GAT_GOUT_BLK_PERIS_UID_RSTNSYNC_CLK_PERIS_GIC_IPCLKPORT_CLK,
>              21, 0, 0),
>         GATE(CLK_GOUT_PERIS_AD_AXI_P_PERIS_ACLKM,
> -            "gout_peris_ad_axi_p_peris_aclkm", "mout_peris_bus_user",
> +            "gout_peris_ad_axi_p_peris_aclkm", "mout_peris_clk_peris_gic",
>              CLK_CON_GAT_GOUT_BLK_PERIS_UID_AD_AXI_P_PERIS_IPCLKPORT_ACLKM,
>              21, CLK_IGNORE_UNUSED, 0),
>         GATE(CLK_GOUT_PERIS_OTP_CON_BIRA_PCLK,
> @@ -2600,19 +2600,19 @@ static const struct samsung_gate_clock peris_gate_clks[] __initconst = {
>              CLK_CON_GAT_GOUT_BLK_PERIS_UID_OTP_CON_BIRA_IPCLKPORT_PCLK,
>              21, 0, 0),
>         GATE(CLK_GOUT_PERIS_GIC_CLK,
> -            "gout_peris_gic_clk", "mout_peris_bus_user",
> +            "gout_peris_gic_clk", "mout_peris_clk_peris_gic",
>              CLK_CON_GAT_GOUT_BLK_PERIS_UID_GIC_IPCLKPORT_CLK,
>              21, CLK_IS_CRITICAL, 0),
>         GATE(CLK_GOUT_PERIS_LHM_AXI_P_PERIS_CLK,
> -            "gout_peris_lhm_axi_p_peris_clk", "oscclk",
> +            "gout_peris_lhm_axi_p_peris_clk", "mout_peris_bus_user",
>              CLK_CON_GAT_GOUT_BLK_PERIS_UID_LHM_AXI_P_PERIS_IPCLKPORT_I_CLK,
>              21, CLK_IGNORE_UNUSED, 0),
>         GATE(CLK_GOUT_PERIS_MCT_PCLK,
> -            "gout_peris_mct_pclk", "mout_peris_clk_peris_gic",
> +            "gout_peris_mct_pclk", "mout_peris_bus_user",
>              CLK_CON_GAT_GOUT_BLK_PERIS_UID_MCT_IPCLKPORT_PCLK,
>              21, 0, 0),
>         GATE(CLK_GOUT_PERIS_OTP_CON_TOP_PCLK,
> -            "gout_peris_otp_con_top_pclk", "mout_peris_clk_peris_gic",
> +            "gout_peris_otp_con_top_pclk", "mout_peris_bus_user",
>              CLK_CON_GAT_GOUT_BLK_PERIS_UID_OTP_CON_TOP_IPCLKPORT_PCLK,
>              21, 0, 0),
>         GATE(CLK_GOUT_PERIS_D_TZPC_PERIS_PCLK,
> @@ -2624,7 +2624,7 @@ static const struct samsung_gate_clock peris_gate_clks[] __initconst = {
>              CLK_CON_GAT_GOUT_BLK_PERIS_UID_TMU_SUB_IPCLKPORT_PCLK,
>              21, 0, 0),
>         GATE(CLK_GOUT_PERIS_TMU_TOP_PCLK,
> -            "gout_peris_tmu_top_pclk", "mout_peris_clk_peris_gic",
> +            "gout_peris_tmu_top_pclk", "mout_peris_bus_user",
>              CLK_CON_GAT_GOUT_BLK_PERIS_UID_TMU_TOP_IPCLKPORT_PCLK,
>              21, 0, 0),
>         GATE(CLK_GOUT_PERIS_OTP_CON_BIRA_OSCCLK,
>
> --
> 2.54.0
>
