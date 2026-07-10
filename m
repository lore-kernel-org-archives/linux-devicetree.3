Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC60543B488
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 16:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783700833; cv=none; b=k/kRBfLqzavv7tMqV2tsUI6qLXM1j+6uU+hpyo7ECo5R7NbDYTlcvjFHj2xUdJ8sFUM0uwUnKqyIdsomF2GihtnsJSI1u1lir8YgV0eMw/S3c+q2yFetIk0ZfI9ZlhVAmf3u8mdM5tnFVxKDxwjWpcnzFiPzuoA3X+AzL6Z8dUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783700833; c=relaxed/simple;
	bh=OzoQmwdUBVBNXx6CxTr+OoAC+AVVuunAXnfmy76Y4Wg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LbKPhGCjvrZ+g6RMcK3++KWqGj53pc/wKu10h+c54wRz2wFIcfRkt171UA0dowB6/0gweVqwzeFoxuwW0PoxKYAYeiz9gYDdWhq+9IXljWp5jn3HVU5L+z8OA+QzZs+c/3b03Gx5HP/8EZe0QgLYaFmn9397j+q9EBkoKnMg0uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=fkdLrEgx; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="fkdLrEgx"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493c2c0b9a8so9521575e9.1
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 09:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783700824; x=1784305624; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IE6Q272bNim0vHtTn2AJvVI/2/qzN6dtTCS1g37160s=;
        b=fkdLrEgxgNVDBfcnNmoXa4AEsP4H6KnKrdJCulI9EoIX5OU0qpMFtQ+AZmR1/3uwnM
         czmlG47lWASAXbKHIfXOZVftmJ/v32dnSDZVVPbCDV61Ic2G1BJdBE9Nzuk6RuN/hG4g
         8uw0iVVnuo+I+ivF55wjWiZ9b+wJw+WPvH6IDb0655+0nF0ZPlaEuoA22D6oQsfPYLgs
         +actfkRcxTocoijPMZ3EcMKZ4t192/J+aKYAzQZ7t0O0+nkH5LIVzD5VryQz6bTFB+Nu
         3uwSarSa5r9smoD4MJEFhqfM0ynJe2aTySg8ZNJKol/aF0VBR0ZYLNPsZ9tUdXq0GLDp
         jWWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783700824; x=1784305624;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=IE6Q272bNim0vHtTn2AJvVI/2/qzN6dtTCS1g37160s=;
        b=NN37yn4dVIhRLLtZ2uTJ8+O/RIvCsh6LjRft5S2eUWU8Vw4I4GBy85acrfg8irhxJ6
         zbQZbAMyhc+2SEsDorCd9cPIJYscDL7hjGLvrEvDP+ArpBlTJX/kuypPzbTmZ81Ept3L
         JemZWGecWbCeVXwjb2FUovFp7+eQuMVT1W3wJNB7PhhfAUuGK79HdyHsC1BVjGGx+7HJ
         uihLGUCK44u8VSzEdw94A4UISITjENhNMBa7WVVdAoIcu0mZOx62kapc8iA8aKYT2+VT
         YBZPVy6j1mVs1Rk+thtrs5+NmGiHYE+21gCZXKQBaWrqKaRYM/pKv3cmFmQc0/Xp+443
         YnYA==
X-Forwarded-Encrypted: i=1; AHgh+Rqi6Ch6AOtJORPVXecZ29fZUVmWaxhfYR8zh65wPwULN4t0H5yR5SooM8+MCzSreo9JJh+nU2czcSUW@vger.kernel.org
X-Gm-Message-State: AOJu0YxndytJavE3JhaRDyS/5/2JaudUrQlduxzQVQF5tuWmvWXRsfqS
	ikZL1XfAW70FtSHB2V0Zgv4/Sc9toXx330ecSEZpfop0it3tkwIciDiWNEGZcmsw/30=
X-Gm-Gg: AfdE7clylBKQqA3chALXQHv8Ap9HSf94uJMhfRC3seCoipIHZfxTShxqjHOyQDjy6cm
	p9LNBGsEJZG7T3If2P82WT7oHymHwhn3IMMNTgJkVFxomxGuc2xnlzXosUfliPoKaOTMZ/Cxvay
	nnpM6Q2bj3HfRxaBv2vBcQO0/wX+oiLz/Uyk9Os5Rm8t6zLip07eRiFz5F4i7iljooex4ZHPvOq
	goi94aZudD+ch9W1X7wvYfS1HyAomfp3fHLB6hZxELsUhDpgR2Vg4/LMy9CKKRHXLjFWVxEu7Z9
	EHv/svQoJ26+H/+xbxDQ04eAJKcNuQHoai3UVi2hZv4m4Rmmjfwzy4+Q76nBNFefpVC1AkhfhqX
	sI99e4HzJ/tv/TNeer2uK7gfjpLOEom0mUIBElSWrMTHZUw4iL5RdJives6QhV/iBoEjqJ0n7XB
	0U7Wy6qY2PfiOIwToh76dZlA==
X-Received: by 2002:a05:600c:6291:b0:493:f442:3dd4 with SMTP id 5b1f17b1804b1-493f44241d5mr34964145e9.39.1783700824480;
        Fri, 10 Jul 2026 09:27:04 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:5e43:31e8:5645:d4e0])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f25b23b7esm6577463f8f.18.2026.07.10.09.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 09:27:03 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Chen-Yu Tsai
 <wens@kernel.org>,  Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown
 <broonie@kernel.org>,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v2 3/3] regulator: axp20x: add support for the AXP318W
In-Reply-To: <20260710-axp318-regulator-v2-3-ee5f1c56b49f@baylibre.com>
	(Jerome Brunet's message of "Fri, 10 Jul 2026 18:19:27 +0200")
References: <20260710-axp318-regulator-v2-0-ee5f1c56b49f@baylibre.com>
	<20260710-axp318-regulator-v2-3-ee5f1c56b49f@baylibre.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Fri, 10 Jul 2026 18:27:02 +0200
Message-ID: <1j33xqhktl.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On ven. 10 juil. 2026 at 18:19, Jerome Brunet <jbrunet@baylibre.com> wrote:

> From: Andre Przywara <andre.przywara@arm.com>
>
> The X-Powers AXP318W is a typical PMIC from X-Powers, featuring nine
> DC/DC converters and 28 LDOs, on the regulator side.
>
> Describe the chip's voltage settings and switch registers, how the
> voltages are encoded, and connect this to the MFD device via its
> regulator ID.
> We use just "318" for the internal identifiers, for easier typing and
> less churn. If something else other than the "AXP318W" shows up, that's
> an easy change, externally visible strings carry the additional letter
> already.
>
> Reviewed-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Co-developed-by: Jerome Brunet <jbrunet@baylibre.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/regulator/axp20x-regulator.c | 298 ++++++++++++++++++++++++++++++++++-
>  include/linux/mfd/axp20x.h           |  43 +++++
>  2 files changed, 333 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/regulator/axp20x-regulator.c b/drivers/regulator/axp20x-regulator.c
> index da891415efc0..bc8d3aa2bd67 100644
> --- a/drivers/regulator/axp20x-regulator.c
> +++ b/drivers/regulator/axp20x-regulator.c
> @@ -138,6 +138,31 @@
>  #define AXP313A_DCDC_V_OUT_MASK		GENMASK(6, 0)
>  #define AXP313A_LDO_V_OUT_MASK		GENMASK(4, 0)
>  
> +#define AXP318_DCDC1_V_OUT_MASK		GENMASK(4, 0)
> +#define AXP318_DCDC2_V_OUT_MASK		GENMASK(6, 0)
> +#define AXP318_LDO_V_OUT_MASK		GENMASK(4, 0)
> +#define AXP318_ELDO_V_OUT_MASK		GENMASK(5, 0)
> +#define AXP318_DCDC2_NUM_VOLTAGES	88
> +#define AXP318_DCDC6_NUM_VOLTAGES	128
> +#define AXP318_DCDC7_NUM_VOLTAGES	103
> +#define AXP318_DCDC8_NUM_VOLTAGES	119

Silly me. I was sure I removed this and missed it - will be removed in v3

> +#define AXP318_THRESHOLD_VOLTAGE	1540000
> +/*
> + * FIXME:
> + * Some LDOs of the AXP318 may be fed by different supplies and
> + * the documentation repeatidly warns that output voltage must
> + * be less than the supply, which is the case for any LDO really.
> + *
> + * The best way to let the framework handle this is to set the
> + * min_dropout_uV field. However the AXP318 documentation
> + * does not provide any information about this.
> + *
> + * Realistically, it can't be less than 1uV so use this
> + * for all LDOs until we know more.
> + */
> +#define AXP318_LDO_MIN_DROPOUT		1 /* uV */
> +
