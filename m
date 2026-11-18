Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794996081;
	b=u/qFcDjiZLtRvZQQimiU7dqgYYQfvoVTqr90ZwCt5UE0wU8SwcyvTBoi+w7G6YA5qxh1
	 y0KHNrtmMqBmnPetlHSUH9ABDHqgHhIux7ky7jnbfd16Byd0wXUOnLPMA6zZ3YA/xu6//
	 4wnzHFm4vye7o5cYprWlsB6yrAGPPLoJ3tq/Ix6zi66H7yFuj2HgmVmhs3EJ3nrtJoip/
	 +E9gWCVtY6oO2DgL+pwv/Zn/T9u2y9EYJQ1trvmsZcEnPdbd/QIKzBtv8YHHjL3WHHU4T
	 UJJP1PIm47+WVl2IQaP6I1ESgXFqbBGM2MqBM+vrm1QJiZnIUtGEZFZt2WCWoqwmUaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794996081;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Wn4TlR8eLWxM319hKeH/ywNfQ03IMDmVqaFVXSQhsp4=;
	b=giboT8AlyqECqtR87TC7oY6etatwoZ/Hs0+QOyF/CP8JGodktavSmUjFqrxFZywfE48z
	 x85aS22KoCqZB5IOkvtw8wouc4+D2rMW2LnSznjlr2S6WqC0rxTAbyC6VYei2cbzVttdF
	 FkrJicAZgErY8AgOJkLcoICrLYa3Htyg4f43umC1GKlewQ6VQfWNRAdiaw2n8/ckME2Qi
	 VPS49wbmKpnrusushm/v3oJHH2X67xKkhRzUrS4Dh6UIAbAua4FEZ+1hp/F1/tljkRqbl
	 VOt5ztQ/SIreRdHTOySbsb9ZbIvpWODz16pnPV0WMZlSd2a8c5bv4O7eKQfOVwlLoaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Cu3dNoaO;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A05606A31C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 10:01:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0A05606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Cu3dNoaO
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-491971ac844so710622f8f.2
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 02:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794996079; x=1795600879; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Wn4TlR8eLWxM319hKeH/ywNfQ03IMDmVqaFVXSQhsp4=;
        b=Cu3dNoaOROvw8Z0X0aYoedt9cHmkWdIUCopqCk0FznPH6BTlJS6lkNA5ZuolQQzRSb
         gCwWmWglTBjy6D6Pxzb/dZTR9iLgq5ASnYmnjk8HWJC+tUEfuDP03qA4rvAP/DpNhUpD
         /4tEe5bgC/rVib/o/SX57mVsJyjT0HV0BEETlS+S57j9owY7Hb1Sp0YFtVDIJw+UYIIh
         cg9BzaDbSTpeVCd5czphc7fz+/NX6M1qNvsdIQxNqXI81QMAU8EHCTfuDnKk5damCqFL
         wAbdceW4r/L7L/lcrENwsNPAqS9wpiq1Y1G2FQp7h80V11fI8vBuE0mK09MzshIcFNj0
         Iozw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794996079; x=1795600879;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wn4TlR8eLWxM319hKeH/ywNfQ03IMDmVqaFVXSQhsp4=;
        b=FvISbiGOm0R/GRErg4UAEQyQ597/Nd2W75qD0eZLutqtjI7/kI/2vTM3bmVaQKBEel
         MR/v4WpbNQUzd2ybAd0ZTLu3RgsxKTlbGznNhQWOcM9UXrco8NgkZE6+NgElkEve+sIC
         NPP2dPan/5WtTwWjUFqp3IjO/4nERuVWPeKnH1ZJ64vVlztXbClhvsPjNS1e/k8l8NSN
         T2TG2comdDYBarl9VA5NPJBUwxNyMMQZQVE7gaqCNEfPcYbxWs/tm7391B94XvWIica6
         chvbyAmFWvAgQez7zZz7bohnuXOoDoSLBN8q+TtBEtrhPkIhE5eWhfTGy0ULYaJj3rBn
         fGLQ==
X-Forwarded-Encrypted: i=1; AL+hErEvWH7FnDIdFf6ee2a7oBNprfl0m06PojgurubYSCZWgmMFwf/OHK2fTD2+RhYeIsAS/yJB3TZ0/SE8@vger.kernel.org
X-Gm-Message-State: APuU4Z/hVAgIsu6TlJIgbVtSACdF83F1lcKF0uzSCGviro53wkvHXxl4
	YIPhdQe5v8Y+vSyJC+tOrUmk3XKEzNiRW9/N71BHEsXaAfA8lgDqSERnK1LDb81uJLA=
X-Gm-Gg: AZFdTZewV8K3sIMf7L8M4L5Xc3YbsHpohktjcwOWns5ojC5sQIgv8f8UDSAF5Cl5iBm
	G5qwb1Ep/4amW9tvBhokFb05MsBwZMntVs4qMDHBr7Ui8rn0pDFi7hx4jVldStKl7tiWpZ94nWZ
	IcovcxEgtTrDfpxl7BKhEHFg+O0u6axr1f+0+ngbZ4heFXjRQsarmIHUF/ApjlELuFsV1CzUQFl
	85kpPsqqNol8xrNh/qvAFN0U56BrAc9YhZLjSFnE7M/ItQ+ltXLMHHdbgsjxrkzGS4f63/6FawP
	j/0L8oYWtxATY8qaNCgHVrq+B5S0uzp4EMQdGexSMDqqQFzu/hhdPGNvEBzenBmun9U4wkEuJ5+
	B74ToTKe+8RrYUx+ccDPTSECBKT8xMUVJHhr0UVvcZ2zgA0+Ef67ju3DTtAYPUYz4m/BLzcBQLt
	TyOgofZB3bf1yPkXF8lBMhwxbWKfeEL9b8d2TftWI61N+V6KQP5VH5S9cVz91MG46mm8MBGCchh
	oZU79Ik2eOMHmsnaTcUrJbzZ92f0+w5OtJodgUxocS0/sPROji0LTnBwAPUA/mYlrffhGLk1Pnr
	AspsBwaeJlejyMTIZ+g5GdsBU8TocmzS5nKbJqjd3Vu1lnkD
X-Received: by 2002:a05:6000:4812:b0:491:ef0a:1f5d with SMTP id ffacd0b85a97d-4a63c0938c4mr4292105f8f.39.1794996078453;
        Wed, 18 Nov 2026 02:01:18 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65100c6bfsm3712254f8f.2.2026.11.18.02.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:01:17 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 2/7] clk: meson: pll: Support PLLs without a
 pre-divider
From: Jerome Brunet <jbrunet@baylibre.com>
To: Carlo Caione <ccaione@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20261106-upstream-s7-clk-v1-2-7d501d62621f@baylibre.com>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
 <20261106-upstream-s7-clk-v1-2-7d501d62621f@baylibre.com>
Date: Wed, 18 Nov 2026 11:01:12 +0100
Message-Id: <179499607255.413320.2562080050432015678.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=867; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=5EHyC5MxoGvHsCcV/VC2od4aT2B3tCgL0d4UTk1LaZY=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFl/y3OMtyjNXN+x6DPTga27pnxbX7qy1DfK8qqpoZ13x
 EfpYP64jlIWBjEuBlkxRZYa7mrxd5JaX2ZN17kNM4eVCWQIAxenAExkRivDP5ujDMWqq/wiOi8w
 7dgxUSuhNjf2xpWV3VtVUp2rknN+XWdkeCgxYdb+ymrWX4mWglrTe08XrHBQCr18n71wQbN1tIY
 PKwA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> The common PLL code assumes that every PLL has a pre-divider. This
> does not hold for the S7 HDMI PLL, and the S7 GP0 and HIFI PLLs are
> meant to run with theirs set to 1.
> 
> Make the pre-divider optional so these PLLs can use the common
> implementation.
>

This change looks like the intermediate step Jian needed for its rework.
It leaves some problems open, like a PLL without a predivider could still
pass a prediv in its table which would lead to inconsistencies.

If I take it for the S7, I still expect Jian's to rework to be finalized
for the other SoCs. Note that I will not accept more SoC drivers using this
intermediate step until the rework is complete.

Regarding sashiko pre-existing issues, You are free to ignore those in the
context of this series but you are welcome to have a look at them, if you
want to.

-- 
Jerome

