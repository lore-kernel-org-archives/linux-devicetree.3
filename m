Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794945879;
	b=LXAg7ExYlbWhfyEmD5pQOfdtRDXq+gqtCfy+pPRiCYAyn8LJU1lkKcHxtdtAt1neTeG1
	 gQlzUBOUcdy1Tusj/zaFB7SoTZZQLgQIZ5uzHCgSHUyz6e1yWrkIOncnPfP2dBCYXQtNl
	 izTNk9sHal3qMMUK9asdzMd/xWo2cNMlvTZEcVX9GqlJOF6HYDPjnQxtHedeSZWUkeZBX
	 bQ9SGGQOWlU+YS9LxQXS2Q2kMyPyzg/sRsZnLFV6fesK6BqW7SfeGjM06ZW+YLNSVkD6o
	 BqFn4uAv+vv75Xhea+qOPRVspARwFNPdzp7h6B0QCQphcfW1kkkJ6P5y408I6f4XmRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794945879;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=XjiiH9vEp71/nKv/afBhmdp7G4Z4pntmYOkq9YJDSd4=;
	b=WHRFzgBiB+hyeHsCsidwy34TV0WQ46sbtYetzP6L1hkXlYGfr9UJgJ9n8i2DwDKyFMGv
	 43u9OSnc0Lt21JV7JTQPz0vejLTkMPzmLa1jyGIJXlsthjEG9U7280F9zJOCWI8vmRipm
	 ekRb3BM3UYH2mpU/vLc8F1NE1EyS7SJsPhIYmRpHH2Yrxdzz99U5BdynUsxEgePEWB8/i
	 152o6AwZ58xDQUca9jNkgPESBfKBjyE7IEheC3b14fv2qXdEN6HkTGf5/2/1sKQXMBl3t
	 0I0/ioPcABIGez0DHCTmPUAFPSR8Sm2q2vxWHatNHB6+4BpGjvSEJLJLJTeSGuEV9Qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51A2606A32A
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 20:04:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E51A2606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8b5a6f2f27fso96802b3a.3
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 12:04:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794945878; x=1795550678;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XjiiH9vEp71/nKv/afBhmdp7G4Z4pntmYOkq9YJDSd4=;
        b=dopC35rg7ENLxCTXPtPgsUnUdI/fNKQ4rdBXnDX13GFNbf+jm7JkbtaGL+PcsoYjLG
         K+N5oHlwFu697rrIKIpPNJKxiI9igyxnV6EW0X+JHRy3ghxKK5OCtpGGhV0AeQH2Rybr
         XYGhDlXYdCRk5fy2Uc6PE0zKmKs1Z76Suz3CYoiwn9X0Kf2Lk6VPAbqeq4Ndkqu7Rdle
         2RWFiHk6lLhA5YdHg6How8Eootey99e4IPVtBu3s/HoB/AsRP8MN7llz7SZ20IUvBylZ
         5573cCRDf7kmDX+hQC1MV32XqZjbz+zaNxwTkqFAyT7MtapArO/MLk3N332d0e3EHsP3
         xjUw==
X-Forwarded-Encrypted: i=1; AL+hErFDAv33HgMzkkDHVfL2QTigKbS9G5QRUQvbiCtPIKyDuSL2HCrkfT/mTqqwfiCfIO/lU9V4qP5kADKi@vger.kernel.org
X-Gm-Message-State: APuU4Z+jrKfmsIkN9zTgF4agtAw8xua9RaNtyk781TeBhrTyTPukYWJ0
	Zy/oNgZZe3v5p7V9DiF0q50MGGkc5C+AbLvMJxAw9H+8H4GNDz3NSzK8Ktri+nEm
X-Gm-Gg: AZFdTZfWoYUePhLtkLx6WJ+IIwo3fa9sAOPe4e1KKl6o3cn+nCXllidKHLZE2CaCh6C
	A2M7R7M4Z7kHU4NMA5rUua7f73LjJJc4KM4k2/o2PyNP07IoY9KxQslKG90oDRzkSQSePMHH2HM
	VMEGHuUrtHdl4wzzQluYXeCx7ZJ4puERJ5Jcln1P1fRnVCCQTvjGOnzF5oXI0qHbHm8fMQu6T5L
	5tKNZDlNW9+t60HcE8Vl91fRRxpi5lw2fn4yzabgm6mKXUNnfAdMrZTC59qLYZNQqi8ESLcLfZY
	QDG8JsRR5yFpbwksbPdKKGNpYyKSXOAcKuDr1ub7M/Q662zyEr3P7HCyhQhEjw5PeFALIqJeMeX
	LNXJ7acHMxTxgxPp9PvMBIGmpnVSaW2XvGBFvY6NEJJ6raG8lsLjvfRtMc8lpbkTdlKGLGUFGhd
	0Aj9xrvcCaqheS3RuS29CmXah8r/VV6duIz8y6dxp0y8qIIbv9ZEVV/G/qvij3EcNcnGTncmFir
	CGEEFAnNXv9jkwDtAnF7g2WpO6PvCK6RvFYp8KC4e3+q67lFTT6rME8FWxXywJo2NgBlwcTrkSx
	W+JpmFtxqMjIibKh5IJbjpn6G8YsEsDluMMEv+2gXLEeKlzewVd0SNduxg8c/1bICHtANVtta24
	YWBFEdbC5OEWaFb75CuFlysl7D96x+XR71DC2ULE6vA+g
X-Received: by 2002:a17:90b:3a47:b0:3b3:bf8f:9ccb with SMTP id 98e67ed59e1d1-3b3d074d7f0mr524910a91.18.1794945878255;
        Tue, 17 Nov 2026 12:04:38 -0800 (PST)
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com. [74.125.82.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d187df25sm449807a91.3.2026.11.17.12.04.37
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 12:04:37 -0800 (PST)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3712b6d9843so377141eec.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 12:04:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGksMeb55bJwAde2/7hdiILPm/xC0zah2nOIIdx43fcoBFmWqsCq54vvf2x8eVLghSXkYwZxZT7ffFq@vger.kernel.org
X-Received: by 2002:a05:7300:7314:b0:381:1580:cb4c with SMTP id
 5a478bee46e88-38281023cfemr582427eec.24.1794945876970; Tue, 17 Nov 2026
 12:04:36 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-iio-ad5246-v1-0-ef6b7c06d4b0@telaak.dev>
 <20261116-iio-ad5246-v1-3-ef6b7c06d4b0@telaak.dev> <20261117-object-glutton-d948f8e36ae4@spud>
In-Reply-To: <20261117-object-glutton-d948f8e36ae4@spud>
From: Joseph Telaak <joseph@telaak.dev>
Date: Tue, 17 Nov 2026 15:04:25 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ6dAt1YGcd_u6SJW6A_tBUZrZUZyie6W9Pc0Q3NHwXGYg@mail.gmail.com>
X-Gm-Features: Aa3M54qec_C2Pi8qcev_6zb3aM3vk4ZjOhmwBtJpitJBxkWn2QAJ5tNJXdTE9jc
Message-ID: <CAPY4CJ6dAt1YGcd_u6SJW6A_tBUZrZUZyie6W9Pc0Q3NHwXGYg@mail.gmail.com>
Subject: Re: [PATCH 3/5] dt-bindings: iio: potentiometer: Add Analog Devices AD5246
To: Conor Dooley <conor@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Peter Rosin <peda@lysator.liu.se>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux@analog.com, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 17, 2026, Conor Dooley wrote:
> Why is there no fallback between devices? Do the different resistance
> values affect the logic? Please note that.

Yes. The versions differ only in end-to-end resistance, which the
driver reports as the channel's scale (R_AB / 128 per step), and the
part can't report it, so none of them can stand in for another. I'll
note that in the v2 commit message.

> Filename matching a compatible please.

Will do, as adi,ad5246-005.yaml.
