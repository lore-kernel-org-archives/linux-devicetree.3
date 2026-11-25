Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795635090;
	b=Wb8YcK8/ZvvRBxowjp/aNgs8nUiUnJRL1f3x8YX6oHYNDuDGnJXbbd/paxtaNqQUa+pS
	 NbtigDee0VINfAv6Z/eQQdOqS99OamwmTgx2+5u8/6I8OVSAKV0gDf94byuuJWcuiRCy6
	 KMkZ18ZjoTu/u0UXS3gmvfGyaQwbH6RmIT1WUXXLUXc6l2evjXF1LtRcOk1Tj/yrPVZrq
	 pFo8xQpmxhkc1iBuaQGQLQ5n6CpdD38kSpYBPVJI5BuRmaV6jyLpJRKBc45hhezTH9V1x
	 C8CSu0RhKQH6Aiu8th6+q3/8uW3tUSz1qdrJQvp6cHeO58ySsCjUwudXoUQT3SRFRUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795635090;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=U1oBw4U+gjNk3iM5j42wuAngnRMfL1HrI9OahKdf/KQ=;
	b=R7ZWMmK6BmMdPxQILsVBRUdLlAYC9oT0mc+5Ai9SjFSzLhszAzw10meLFGkNYaKOqVjk
	 kc4rOZv5R7QSIM7sBTs+aKqt9fsuixKEt9KIyLLxdJ8bMuVEFKSrRj9TK5CasXd616T4L
	 v2wPHDCzKGU2Kzs8P0pBpnQcCjmjvhboYDPSirhdCalj43meKFFd+vdKOResHWig8JrN+
	 82+XvWv/rnTB6HlAyZdXdmoZumtSbtrv7eTwB8sFBKOq+aAfK4mTAdPNQkucYTy8qrkNV
	 2uIRBVsvL0Ojj/KMbuFgyXKI418ixOwD7mk4d8z6EGIQ6V6PD8drRseK2KOYNuyk1aQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0nHMyVEo;
	arc=none smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8476606A323
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 19:31:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8476606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0nHMyVEo
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b8b20b2538so7183145a12.3
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 11:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795635088; x=1796239888; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U1oBw4U+gjNk3iM5j42wuAngnRMfL1HrI9OahKdf/KQ=;
        b=0nHMyVEo+cHSBg/yZjo07YS7lm0nSu5aapXced69byeyWvlod6eZOHh3vHqbFwviLr
         fXpsJZQXB8MYqRvheUfHH+u50BUewnvIXigX2sGoh1oBv0F9raAp1hdMWLRSKGQZGQI1
         SQQk+CCM8hEOeYgk00xfrypTvmXRqtcUioIBzk0/arl1DHjQmysx9hYsi5u3I063SrFG
         +8kYHx4giGHRVBYzeGw5tjEcknNPOtd1dXh2UMhaEQzFdLNIZyhcgBRDqr05SI1pzSPq
         E5lNpN7bzrTvZr0k975+r8Blji+jn/Y2ahr5ord2EOCxrBjaO2ytOiaWdGmorD2eF3Mx
         PhJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795635088; x=1796239888;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U1oBw4U+gjNk3iM5j42wuAngnRMfL1HrI9OahKdf/KQ=;
        b=1B6ik9EhfrhAuVNY0RHqH+gXCI1FzhwjBuhtidOTwBn8AVILk/yXtE6SYTDxKS+BlG
         WSpuxe43bhvAcwKB84F48Rtb0ZCYbtc53ZGF+3sCj04pHTJ7Vzn3ebobKO81czQcPdgG
         f+lRzJK0/5Q+f3hKPI5DLpIIaPfkiJUaGAs+7y5ZqEgCDI+OHMD/RBK4FBz2Pe6pHZG8
         HV9XXZZEVLfds8aLZAyp96VeW6MO+OTnYK5PGqZHUFjSoaIA2FzAMiSxUCOn+rC/pTFq
         aof9bNLxcjkdModM5DAoUfdJaS97itw7cpMLQbmSCz459SfCz3eosqKxnLwUUjXdvyml
         h1MQ==
X-Forwarded-Encrypted: i=1; AL+hErER9pwOa4btCLIw2BeYB8D6lt/rKyXt9n4NMJWpfBtn1/pqjgYSMGbk/CqCeLydaM68n2Ry03HrYbVL@vger.kernel.org
X-Gm-Message-State: APuU4Z+5no8XKKyquwdf5eeXz7xgLk3rSDoINp+Foqe0WhKgWJDt7Xqe
	XrcUYoK5WoQBV/xNKpMBKRIDyCb2iFrGOYuJXvr5GZhYZqAH0FL5nI0S
X-Gm-Gg: AZFdTZfaP3CY4/LfMrJezDz/Vih8pB+J3gmkLdXFW3q1m4GuTCC7SO0KmlYjScoDt56
	FLMFvs7eMvH2sHJIAMoghUIMK7ZkiqrnwYqHOJvW15YsqLWIz7p/imE0fpKFRZQeUwEv4rbJnUo
	x/KC6Rl0man5Dx3NdVlxU1a0nfkhjPmr4UT+k8XsnlGBUZ1hwhpLsmdrlp5FsjOq2rpzW+0z4a3
	f2RtBbh/1szcoTDkeYwfoQTyoP6VVtYU/5C6u9jUgJB51Py0CdRHYfetq64ftUy4nlSFf8WeCAj
	oZh4FqW1W+Nr7sffJf9N8oTfSReUaq8i+16lixWeEmoLrytqrMvu+I+1zTN7ZVvsXZzNOt72Gap
	ujpunJtW3vqqUAMbrDMvfh8lWercVP1s9TrLX9PagSNlZ2EYo9u+/871QWBvihUUHGM8TmAIPY/
	RMgVZEwOYNS5K4C/Z2NhnklxlssS4F2G2X20YOto5w2I09BzxW2223hp/3zqpKeMVa84M9DiUSc
	/DvfumvEGivDIMgZyliQtcNtmle0ll2n4xYTSsnRGdfi/Tfp4kyx5epjbWrR3QykgUsDkLC3mzx
	36c0bKp5pqnKO+UBKcjDE2IgkJTbqbQGClG6RypsYczJhYE=
X-Received: by 2002:a05:6402:1f4b:b0:6bb:1203:487e with SMTP id 4fb4d7f45d1cf-6bb12034b21mr4236672a12.6.1795635087911;
        Wed, 25 Nov 2026 11:31:27 -0800 (PST)
Received: from localhost.localdomain ([195.155.168.135])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba371072f6sm8924419a12.28.2026.11.25.11.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:31:26 -0800 (PST)
From: =?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v2 0/5] Exynos850 ADC support and soc thermistor
Date: Wed, 25 Nov 2026 22:31:23 +0300
Message-ID: <20261125193122.747908-2-tadilhusrev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125-exynos850_adc-v2-0-26de1c6f1717@linaro.org>
References: <20261125-exynos850_adc-v2-0-26de1c6f1717@linaro.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, Nov 25, 2026 at 02:23:32PM +0000, Alexey Klimov wrote:
> This small series adds support for the ADC block found in the Samsung
> Exynos850 SoC and enables the Murata NTC thermistor on the WinLink E850-96
> development board.

I tested patches 1-3 on a Samsung Galaxy XCover5 (SM-G525F, Exynos850),
with an ADC node equivalent to patch 4 (same reg, interrupt and clock)
and the board's three NTC channels.
Readings match what I get with the vendor-style sequence (re-init around
every conversion, SOFT_NON_RESET after reset) to 1-2 LSB on the static
channels, the NTC channels follow the temperature, and 200 back-to-back
reads per channel show no stale values. So initialising once at probe
works fine here.

One small thing: channels 8 and 9 always read 0. The downstream driver
uses 8 channels for this SoC, so MAX_ADC_V2_CHANNELS (10) may expose two
channels that don't exist.

For patches 1-3:
Tested-by: Adil Hüsrev Tepe <tadilhusrev@gmail.com>

Adil
