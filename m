Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7914189AE
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 09:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783329415; cv=none; b=hBhWJWzfwAkyvMghZHiMCf/1ffd64O6ZMkgFQRcSnoGMSsHDh+qJiH1J2SDj23pDAoghW/T3M9eBc5BrvCovmEZ+pfqN9J1t+h7rYkvrRMhjM+DhRkJ4SNJwuy2p3iJ4Y6QUzB6PDTkaKAb+/vYM1oBKKdV0HyKlp6qAAeFA3NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783329415; c=relaxed/simple;
	bh=n9nR8Fg+JMZq1BaP4ahqBVtAOKem/sDG6ZYm02uG/jY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=I44+b6WCE7bAYpR5+wiiNcXwJVIIjopM104g1wo1RPiufWt83Vi0Ra9gnPQ43Xs1Bq6Dx60m2p2NH49IIM0zONhZrFnk1NLYGd8hBSzc2uixfiJlTKvLhs5PRH3cIQAbzKqvFqiL9MwaEPWd+S5HJG6fJCvyDKqAUBmkW2WjKTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=hhaOeUgC; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="hhaOeUgC"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493d1e8aa46so13737935e9.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 02:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783329403; x=1783934203; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FQyAj/mTcNP80GWpdq+ZAxNRRGcOVsB8iHT6S7Y5T98=;
        b=hhaOeUgCsGd5/uXFSRWLmF75XtoCKqfbLtuJ8dOyj4sVCerPjVGqgI1HyrNxYZnBNJ
         PbARJZAk2ipcetfFgcUCfUt2QvLfNvNq0ZlvCEbQj2RsIZScF99ThSAIfCmjaF4KPfSm
         wX39UlTqcHr7f1b7Hh2BOcWZS6C/lbirRHIJu/GRWdaBVOo9l4kR9h+P8FFyl/oF2Ra3
         pg3RE2U2IeRNMc3X9UkMo5At5Cs/M6dv+13kfy+N+weoJ9qNI56LVy5D+nC/rWO4rrQI
         IR7PMW1ygNBwDAFmvys83EcdSDT5k+E9F7cNTmfu3MuP2ayq2HrX++oiVZwXshrlrLT6
         rxzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783329403; x=1783934203;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FQyAj/mTcNP80GWpdq+ZAxNRRGcOVsB8iHT6S7Y5T98=;
        b=RHTdOeg0dXJR1i6KRddB/I9tLHoNgjXDG3qxehh+Q3VRwOxUhtQcx/AwErWd1iVwHQ
         48lqInvVot3u6yHarehS/gfO5LVXmbi/4GM1K73mHdGgnQery4apUFNbmzH8NiSZO4G4
         EazxR8J+y4MZZ/szEUNt6uS+FGsQLDwg6/EAB27qbIfcwcuRGiTb0TR6HyFbqj9f3Wjz
         v8F+NgOMPOWzI/CEassmGZJVoaWyXCYyZsfmrdS9+tUWiqsrQZkN48tDzB0R3MY2IIKQ
         4ZeS/Gf4abmY807CHkNF8DF0zpoQOI8uJwnFDVP5/x74yfufFBxgi66TD4KKTotNJwru
         LJdw==
X-Forwarded-Encrypted: i=1; AHgh+Roj6h+dPfR4GgZWzWkAO3ZdlNnhEF7cSSZE+MEQfkgcrKlimrvZ749pIOhJxATwu9kxwMXmfg85HPk4@vger.kernel.org
X-Gm-Message-State: AOJu0YwVnO0Xze0mDOb1RlRUAmMEtU2q3IA9T+lBZCFnemFL4ndhhv1n
	rxUCwzMvIwhsW6/T0bCttZg8S2cYJ0ImXg3rUUUclzEBFEChg9Vm/gsvjGAXP1Ay1m0=
X-Gm-Gg: AfdE7ck/gDxv17mGH3SHNbEa6UfYfhLG7nvTtDEJBsDXS/bJaB7z0JswEHkgCAQ+H5+
	nyNicyzIcbzxgesTAby0OCb+6vIzOBPEI3qM8f600sl9bzad/61XSHSUl5OB60RJApvw6dC//LO
	HKM8J3YUh26DIj29z2iokuTNV0jVeSJqfyn0ecsWXdSI2DOho2IVY11JLj3V/pdwdhaXSWjp8Yt
	GGCRHsdZFNP8HEI1rxp02ELExKCev45bqVHmydPn/r0xrIwcuSEkIUY0pmeN8pfZRC5r725OOno
	ApN69k56SjSJzKthDZelGoNKKdLdhRfYjt2TjJUH9k0XlzW1Or3xOGxXVrVGyte5Zf060sSzZzV
	h6Zhwau4m67acJt91EzozjWPoi5GCMoKuFXSFdGIOTgRaFrdtUWxgJs9gY/a32vML8A2rc+0/p2
	nTWrW8iNwCmdY=
X-Received: by 2002:a05:600c:3551:b0:493:c453:6002 with SMTP id 5b1f17b1804b1-493d11fb8a4mr101976925e9.35.1783329399663;
        Mon, 06 Jul 2026 02:16:39 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1495:8c97:96f4:dff8])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493c6381e4fsm412373525e9.8.2026.07.06.02.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:16:39 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>,  Alexandre Belloni
 <alexandre.belloni@bootlin.com>,  Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>,  Jernej Skrabec <jernej.skrabec@gmail.com>,  Samuel
 Holland <samuel@sholland.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Maxime
 Ripard <mripard@kernel.org>,  linux-rtc@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-sunxi@lists.linux.dev,  linux-kernel@vger.kernel.org,
  linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 6/8] clk: sunxi-ng: div: add read-only operation support
In-Reply-To: <CAGb2v64C4Xn=V5NQcqZQa=v0KsemsVh+_6g7ed0kHz6C_bzmww@mail.gmail.com>
	(Chen-Yu Tsai's message of "Sat, 4 Jul 2026 16:25:07 +0800")
References: <20260702-a733-rtc-v3-0-eb2580374de6@baylibre.com>
	<20260702-a733-rtc-v3-6-eb2580374de6@baylibre.com>
	<CAGb2v64C4Xn=V5NQcqZQa=v0KsemsVh+_6g7ed0kHz6C_bzmww@mail.gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 06 Jul 2026 11:16:37 +0200
Message-ID: <1j1pdgiikq.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On sam. 04 juil. 2026 at 16:25, Chen-Yu Tsai <wens@kernel.org> wrote:

>>
>>  extern const struct clk_ops ccu_div_ops;
>> +extern const struct clk_ops ccu_rodiv_ops;
>>
>>  #endif /* _CCU_DIV_H_ */
>> diff --git a/drivers/clk/sunxi-ng/ccu_mux.c b/drivers/clk/sunxi-ng/ccu_mux.c
>> index 766f27cff748..e2d6833a6d33 100644
>> --- a/drivers/clk/sunxi-ng/ccu_mux.c
>> +++ b/drivers/clk/sunxi-ng/ccu_mux.c
>> @@ -68,13 +68,14 @@ unsigned long ccu_mux_helper_apply_prediv(struct ccu_common *common,
>>  }
>>  EXPORT_SYMBOL_NS_GPL(ccu_mux_helper_apply_prediv, "SUNXI_CCU");
>>
>> -static unsigned long ccu_mux_helper_unapply_prediv(struct ccu_common *common,
>> +unsigned long ccu_mux_helper_unapply_prediv(struct ccu_common *common,
>>                                             struct ccu_mux_internal *cm,
>>                                             int parent_index,
>>                                             unsigned long parent_rate)
>>  {
>>         return parent_rate * ccu_mux_get_prediv(common, cm, parent_index);
>>  }
>> +EXPORT_SYMBOL_NS_GPL(ccu_mux_helper_unapply_prediv, "SUNXI_CCU");
>
> This does not need to be exported since all the base clocks build into
> one module. And maybe it shouldn't as we probably don't want individual
> clock drivers implementing ops.

Indeed, I'll add a patch to remove the export of
ccu_mux_helper_apply_prediv() as well, for consistency. It does not
appear to used out of that module either.

>
>
> Otherwise,
>
> Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
>

-- 
Jerome
