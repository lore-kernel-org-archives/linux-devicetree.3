Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795033012;
	b=xcnPunIP2CjFFbjJbailwnvkpaeqaythM0Bt5oVHh6btCDVsZ1mRQUlwJz8hXzCnoeA9
	 I4LAFDG4fwiQVpd9Yzct3rIhdLLciEhWHFxDAwCl3iwaOXy2XymgcPUeKOUV86cDz7URk
	 MfOb/gflUUPVYP+adIOnSQgDZfrwrWonIBGsXXXicMCUw2hBbZr2Cqjps8gybH3OYr2H2
	 JLNWMUBOZpVWmBhjhUSWMe/yGd/oE5pkzjta15+RB6A3lJLNrLrx6GCYiXSgt0D5yfhb1
	 n61bvM/5QlMuXW3FS9MNPEVhgBoU0/fIjA3c7y3gHQG89d1CoAV+OLwypUtgwDYmBow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795033012;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=5UnqAJ+AexMehXANmzRxjm1wi6GBuId92BoCIleFMPc=;
	b=UrikXBG3V4BaArlFRa1OK+ymQo+1CboCidCAjsVYMdlrgZeHPxcCocJryKX3quY9Gipk
	 QS40yHwDsVDVEpg0zsILmPyyWFTJpmpxnHPbB0Mc3rApE+bbYliKW44m5sx3F461k0u1R
	 t84DAOXo2wRL4sLfiN9SAGAu+kTWKoAQFpJ0TgdbM9x9rxyktTfF/kRQnUSQahpXuGwCP
	 UUMUl8E5JP0E5i09AnoTTdgVHwDPr90X4ip7hKf93cddkSLGvixM0IkOX4icVm1I1I1Ax
	 NWgdNpBpvvT6RQTFAEKmhK9ka2dYH8Zwmezyv74vQFJReN6haYqmEfP7+VBWo3hoYYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B71F606A332
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 20:16:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B71F606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cdab9e9761cso1018272a12.2
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 12:16:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795033012; x=1795637812;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5UnqAJ+AexMehXANmzRxjm1wi6GBuId92BoCIleFMPc=;
        b=GROge+xQiOcXo3SQl8qBVkD7ZmLQD4RrFQVQUERw2lv61ja91Mk7+GbMxU6ZlL9dCv
         UTZqAiLiS6QlTLpRSGocaX6SfJYSqqR8wCm7D9UfJFtQUi576SaO2KPKrhGBVgbKDSBL
         sYddRarwjRRvjLNtUxOCXKA6fqvGJ66KCBs/e4XIw1jBjdabF5C6MakNk/cJaPn+jopG
         gsn1dyn+iVXRiHqpHpG1xb11s11zubzkbteWoax95DxSn4T/wt42d6LtfY+c0bCAP6gd
         7tNkR5rItKuTS1shlGavKAMVyCuhyOkPxJf/YLKYApvkLXP6cnu45Hy5AJ4EmwYRCPQv
         B78Q==
X-Forwarded-Encrypted: i=1; AL+hErHQwgZHL/VGT/cIONFJBSZL96dLJk+4Ekpb4DOcuwZsmzoFhq/rt4ZYtnEYsY89ygV/p8nE67nqifm1@vger.kernel.org
X-Gm-Message-State: APuU4Z/so7QFCpbStV/rePwzxXuLC7W3qlo3ORJq+LxkRSKexZ5nb/y9
	kH//XhwNlnss0RtNo84LYXMC/xuOwG1b4UKoAfgtFkMsEtcWyAK/Nlc8TiMOxGhP
X-Gm-Gg: AZFdTZfWUYMV64/OG35LYbkTu6Fgdjgg38LMKhU0w8QtQiekqOgMRMxNGkz8NZsyPr/
	9gTaEbceEN9ko0ae3yYM8t0cgwV6RiQ5suEZMyOc9WEBPfZ4ZOY5UMEwrHYcGP3r9b4J+oJguOB
	NDnwHrKBzBA89fisxRDk7j0vT7kG28MOQ0wdwERKyn2EbxVDKkcQMltrqqLBP9GRQ2cGtPvzOIu
	RTny6nGViJiwf6gBk7p+9/zYpK9ymyu7S8f+DGt9YqhCMHV6GbJ0uvDKVxBlymFki0F1VdD34/J
	pQsu+LMrJKiHHdy151FJc3q15j8CBSeVEWCOb6Ru6J0+fg1szDxFvAXompllxQc936KlpSV3MWY
	PYBWqWXoouRtAbF9auD1fRgOeWg7tyL2QtF1YzX5QzLiWrDf3rbEXsAYG3g1CH5RTy5HBO/mxem
	kci+nL2kCpIavjF1KqOMgmOfA7QhTYt5KyuGKZr0l3lia09jXMBsg+pZmgx1YabMzyxr4paN/PW
	osHbsCoZWzDrQ49ILRstQImddvbn5gpYvuu4Zu82vzPZe2kMTbJ0h7X/MMpLLnQVHc6fevtxeRn
	Hd+vdYdiGEW2Trp6uxBJTuarBqYyHtEMxf51PTO4W19tCUYjv2X6Bn9r1dW9/hgc62oMe07v1D+
	qdSPg6HaeZTBUsRFhw+Vf3sXcwhgIJ2R3nwumoksdwJZb
X-Received: by 2002:a17:90b:5407:b0:3b0:ab34:afc8 with SMTP id 98e67ed59e1d1-3b3d074d84cmr3356735a91.20.1795033011619;
        Wed, 18 Nov 2026 12:16:51 -0800 (PST)
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com. [74.125.82.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d56ee297sm2317324a91.4.2026.11.18.12.16.50
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 12:16:50 -0800 (PST)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-382c3c9671fso1744832eec.0
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 12:16:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHkss7fhs+djn9KGX6WWkfZCAiJbNskI1EPyF9+Le23kc6WimK+idB9bLO1L5uVCkV5vgdOcOmsGaMz@vger.kernel.org
X-Received: by 2002:a05:7300:7314:b0:35f:8c5d:5928 with SMTP id
 5a478bee46e88-38281213cbcmr3898471eec.30.1795033010021; Wed, 18 Nov 2026
 12:16:50 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115-mxl-gsw1xx-reset-v4-2-4ecd18c922e2@telaak.dev> <179500523674.3136.3797005435367758007@kernel.org>
In-Reply-To: <179500523674.3136.3797005435367758007@kernel.org>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 18 Nov 2026 15:16:38 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ5MxJJvfPehp+1cFMRZYRa059H5NqbivaHgHymCni=MtQ@mail.gmail.com>
X-Gm-Features: Aa3M54rVwPf5ul66wX8lmbjDq-z9xoC_lJskOBFIWYhripfW-S7U1hEPGn-f_Xs
Message-ID: <CAPY4CJ5MxJJvfPehp+1cFMRZYRa059H5NqbivaHgHymCni=MtQ@mail.gmail.com>
Subject: Re: [PATCH net-next v4 2/2] net: dsa: mxl-gsw1xx: reset the switch
 through reset-gpios
To: netdev-bot+sashiko@kernel.org
Cc: hauke@hauke-m.de, andrew@lunn.ch, olteanv@gmail.com, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, daniel@makrotopia.org, 
	p.zabel@pengutronix.de, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 18, 2026 at 12:33:56PM +0000, netdev-bot+sashiko@kernel.org wrote:
> [Severity: Medium]
> If the switch node has reset-gpios, can the reset still be skipped here
> with no message at all?

Only in a kernel built without RESET_CONTROLLER or without RESET_GPIO,
and then the switch runs as the bootloader left it, as it did before
this patch. That is how an optional reset control behaves in every
driver that uses one. The driver uses the reset controller API rather
than devm_gpiod_get_optional() because Daniel asked for it in v1.

On the SF19A2890, the board this is for, the SoC's peripheral clock and
reset driver (under review on linux-clk) selects RESET_CONTROLLER, so
the imply does enable RESET_GPIO there by default. Selecting
RESET_CONTROLLER from this driver would turn the reset framework on in
every config that builds it, for one GPIO line; imply only takes effect
where RESET_GPIO can be enabled.

> Does this pulse the reset again on every probe attempt after
> -EPROBE_DEFER?

Yes, as in the realtek DSA drivers. The v4 changelog says why the pulse
stays in probe.

Joseph
