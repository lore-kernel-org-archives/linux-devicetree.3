Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D095835C1A6
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 17:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783702943; cv=none; b=iFI5rtJ4tJU2OERsqeCQzgxHnCUjrCmBgXxH+gy00jQs4L+zhngyaQHuuXuokZlRTZIIdVPccDW1GgSeeG9yJx6XzCSIYnGPp+SBca6LPfyKVNvGzpYsy1OYx5ASvHPiIwjG4cuPiGCQnfa2sx+q2Gc3SJDMRY5SmuzJTYo/eOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783702943; c=relaxed/simple;
	bh=zI0YbIPQiZhlu7BQqMKf6cO4GFcM5ewk2NvTfVbLEpA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HaXJg7FUdSZoB4U7reTQxZiA0yLsz8DVTpRcf2c4/y0dPw9K8R9X8g9UYmXtX0C23g+uD15U0T3ZESIuCi9L3NKy1qDvMN8yPBfGX1EleXXLGyfYqcKb4gLFPt05s/a3VmRp/0vFXDYIRV4U8XU2ClMOEYsJ6nXzLMHMCiJ0SLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=I8/8zTX+; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="I8/8zTX+"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493b1710405so5947395e9.2
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 10:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783702938; x=1784307738; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=O3PEv/85mgKmQeDAaIOSKuCLAVJoXdX7UdliBoP0G5w=;
        b=I8/8zTX+M6JOeY/v+TOk+OHw4g3G0mlqFors9ilQgf9gy2QqmZV3EXSXoPhC7dT3q8
         LuCjaBveSKGpCMKPYV4AkrW3t4k2yqjOZnG10jwXCO0HCroXNPaLmHxZue6oBA39BhpP
         mw27yvyLQg35sr7mCmWU96xRkRm9jSfc2UlmEoedyc8dwNL+Ya7/0agXuIoGHtrlCN29
         it28jchz78PVFYn9Ql6duwcyziMnjFAc8QzmhDyq6TMilVRCxlEbNQaiZxcLe707C4Rn
         PO2r8oAEy3/sBx9q+Hr0a4sjhNTOFzPyRS7PHdh4XF64Ow0Qb6w2J74jP6A6TgySTvyI
         qRfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783702938; x=1784307738;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=O3PEv/85mgKmQeDAaIOSKuCLAVJoXdX7UdliBoP0G5w=;
        b=bDtDgr+DI9td8R1nmABhU2K0ya26IAaI5PkA7gUXX1EwzBcILqcLCDHKji/kuEPwG5
         uEWkX9+hItwLj1YwjvyrdJ1gOLUGzIQELpKOsNJQxb3jM4/90pDJwg9jNUHEBX9DMlTn
         ERUwpQ04d6N5z9pdPkrgBt+H08eGl5hULO7GELw3Z/FP6LiqhbEsBu90BnHOBU0jmRCJ
         1I5jWKkqLiO9HkkungUU6Pxst3iUEjP/Tv1FkdYo3tbKATkFxil7M1e0qaroJJLCQnwd
         S8Qntp7Y1d24AH85/CUNvd2o4rp1h2GJ6iYqpXzPlxZmpzfcva9psEgzFh4AUHkNqinl
         obuQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro9AXlVMZ8TEl9F3SdYrO9LH/qkR5nLN1MAmd7BzxNQNwf/L334D1wxgDVT/RIBt2Uzw+HkT8AjEBSr@vger.kernel.org
X-Gm-Message-State: AOJu0YyJWGn/dBNhN5uecMb5LcsVGN9LVQmWGTrmi8FB++WU56fV/xmI
	DV/kIcTqrIzFGoSKorq+QJmHXdegv2+4Qrhnojz2xV9c+glH8lh5lHbC10RP+lG9M2AfhDfDOAx
	9uBMZ
X-Gm-Gg: AfdE7cnoPmT/J5t/pRxPCNJbh2R1jFcwRqCYn48eWXglljUb33rOy0ktCUM91imdZeD
	Iyz/dJAxtazCxBjt1uUO5dLQmGemgPEg038BCEcNiw8mCLtzQp+inRktNopUC96n7NDGe1f1Mpo
	OrmfgCGYlzrckdtDlvCxl/3U+5x3tR28ArVCRiY/tMIsp7bcbTYjO4n+SAT9e2V5RhF1J5++kV3
	lXPnKELJZsylF1MR1HH9jzjlxaeyYQfOkXEmfDPAZirrKjaos+w9ZZY9jTsy6nfLIDfoaYgN2ad
	EXtvx5JUi9iv2bKJaOuiR7H8YIZ7Xqt+uVqlgnseZMetQbC+aVnn+Ygm+nuYV8FLxsIJg0zH/aS
	BGhCanVn2bBvlcCWaxT9NJmEs2JqbbCLv8J0m96u0c3By8Vlyj8NrHtbxMHi1Wl0slFa9RgmuCo
	Xsjwf+rJvEXlg=
X-Received: by 2002:a05:600c:a0d:b0:493:c389:d434 with SMTP id 5b1f17b1804b1-493e684a968mr135326315e9.15.1783702938158;
        Fri, 10 Jul 2026 10:02:18 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:5e43:31e8:5645:d4e0])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493eb73ae14sm148311345e9.11.2026.07.10.10.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 10:02:17 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Chen-Yu Tsai
 <wens@kernel.org>,  Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown
 <broonie@kernel.org>,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  Andre Przywara <andre.przywara@arm.com>,
  Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 0/3] regulator: Add X-Powers AXP318W PMIC support
In-Reply-To: <20260710-axp318-regulator-v2-0-ee5f1c56b49f@baylibre.com>
	(Jerome Brunet's message of "Fri, 10 Jul 2026 18:19:24 +0200")
References: <20260710-axp318-regulator-v2-0-ee5f1c56b49f@baylibre.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Fri, 10 Jul 2026 19:02:15 +0200
Message-ID: <1jse5qg4mg.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On ven. 10 juil. 2026 at 18:19, Jerome Brunet <jbrunet@baylibre.com> wrote:

> This patch series adds support for the X-Powers AXP318W PMIC, which is
> used recently on new boards with Allwinner SoCs (the A733).
>
> The PMIC features 9 DCDC buck converters and 28 LDOs, plus the usual ADC,
> interrupts, and power key components.
> A datasheet can be found linked in this Wiki table:
> https://linux-sunxi.org/AXP_PMICs
>
> Patch 1 adds the compatible string to the binding document, and adds
> the additional input supply properties.
> Patch 2 is the MFD part, describing the regmap and all the interrupts.
> So far we support the regulator and power key devices, the ADC and
> other pieces will follow later.
> Patch 3 adds the voltage regulator rails, this part is crucial to enable
> any board using this PMIC, as we depend on those rails even for basic
> devices.
>
> There was an unclosed topic regarding the handling of LDOs output
> voltage being limited to input voltage being provided by the supply.
> Chen-Yu noted the min_dropout_uV would be a good fit for that but
> the actual minimal dropout value was unknown. I've arbitrarily picked
> 1uV because it is the minimum the framework supports. Realistically a low
> dropout regulator is bound to have some dropout. This choice
> is very likely optimistic but does the trick for now.
>
> If anyone has problems because the dropout is actually higher
> * it is arguably an HW design error
> * it is a good time to let us know what the actual dropout is :P
>

I've focused on the regulator and the comments from v1 while taking over,
assuming the rest was fine. I should not have. Please ignore this
version. I'll re-spin it.

> Changes in v2:
> * Droped _NUM_VOLTAGES macros
> * Use min_dropout_uV to limit LDO voltage to supplies
> * Add bypass mode for EDLO4/5
> * Prevent crossing 1.54V threshold for DCDC6/7/8/9
> * Link to v1: https://lore.kernel.org/r/20251021112013.2710903-1-andre.przywara@arm.com
>
> ---
> Andre Przywara (3):
>       dt-bindings: mfd: x-powers,axp152: Document AXP318W
>       mfd: axp20x: Add support for AXP318W PMIC
>       regulator: axp20x: add support for the AXP318W
>
>  .../devicetree/bindings/mfd/x-powers,axp152.yaml   |  28 +-
>  drivers/mfd/axp20x-i2c.c                           |   2 +
>  drivers/mfd/axp20x.c                               |  84 ++++++
>  drivers/regulator/axp20x-regulator.c               | 298 ++++++++++++++++++++-
>  include/linux/mfd/axp20x.h                         | 129 +++++++++
>  5 files changed, 532 insertions(+), 9 deletions(-)
> ---
> base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
> change-id: 20260710-axp318-regulator-43545ce3261f
>
> Best regards,

-- 
Jerome
