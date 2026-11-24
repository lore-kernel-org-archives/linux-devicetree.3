Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795514783;
	b=Id4afzPqXwnnn8kpMA8LPUFNcA6iZNl6qDNX/m/IyT2LlNWXACk74fdwH7JhvjE8jIKP
	 KGiX2JewQz8MQrIVlPH2R/DDS6+5gybQidX8WqcjN8uqt909kNOyca3reLBzDLVYQnHMd
	 +7LVqJDcI2sv6nmRcxa5RxDTHJWFVKYtYv94B+G9ujKkdMo93PMARUgsatKmjTZsvHotM
	 aPpj8cARa/bWOToU3kW9aiAaoU9NhDAvHEzUE6F2d+kRdhCCZTLX6SjYLhnjzo1Icgvnn
	 oR3h2fs2HtFJCipzZ4yFFilhtJ8gDOoPNKrWcBawNN1tCCQBEUTvEl3VFLFeQiyfIjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795514783;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Transfer-Encoding:MIME-Version:Content-Type;
	bh=HKyC5Y8ArbHevJ7+3eNbqEfUXbI8Lmcn1USmOAduUL8=;
	b=Qk3wvileEsw89vytu81AdxjWrTKXZfh+JqMgB93Pon+iQu+K4JmADso7LUI6aYui7WTQ
	 VgTQm1Od0Gx6C+WKY6vm5laEcMedOw/XXvt7hN8qQTcM/WxGXL5ChS1zj6xZjZgHz12r2
	 RybHAPrLpi7GKJCGkKukAJ3WG98IKZZtXqS6RN0/oOKXJf7eNxFE47KYRqjFmLNyLdm8D
	 JQv99MxhXJymv2jhRPYsPGE0Zp53NV/K7hAyHmb4TwUw4dvn4wFeUP2Iob242WEeAQF+L
	 Gaxx6o6e452VlOUf7O+U6e0Btp/roRDgFYp6x6nKGdOIBY3wk+z0MfvtgY+GrgFEnuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mZgY1IRu;
	arc=none smtp.remote-ip=209.85.167.52
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E754C606A326
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:06:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E754C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mZgY1IRu
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5bccecba199so4112480e87.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 02:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795514781; x=1796119581; darn=vger.kernel.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HKyC5Y8ArbHevJ7+3eNbqEfUXbI8Lmcn1USmOAduUL8=;
        b=mZgY1IRutbfxoEyOQvSGmKLJUEp+Eu6JolB/hRdVFmprzU+N56r0kuBCzbaGeoC1Kr
         E1leuNmYvr9aamFFdNrVl9ezKqpJU81J+m1rFJ6zT4rJdddCoK3/67Z0jGxUEJmH+51I
         f+7qcGFjjCXKtibJaZulYEU8kCXqkEugCSd8o2tP4/Agdf4Sa4YLI4ylBQmucH4xI5q7
         RpxgVmlA2zyQZGwNTsUSlXWjx/AgqmY024OBMY3Ri/UOKpLBaBt6jA4iCpLda0RdjcwX
         i5czapbYLURJq+GvRGG85QrH4G42nkyth48LqTS74ywvIO3EdQKa4ZBRTMoB3CG2wyd3
         SRsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795514781; x=1796119581;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HKyC5Y8ArbHevJ7+3eNbqEfUXbI8Lmcn1USmOAduUL8=;
        b=Cfvi/uIcFPLa7jZYuk47klwENgfS8jZOLMOnPku/NYF2xC2h/CduJZLag9cvIb1zNU
         s0OC3bGfiQ+jtAa13jsC+tKMpLqQ9Cc5Eoe4DAwU+H3dbmuUYuw1OkpJRYGvu9uM6eSZ
         I+CErOWdpoX3Q0qjaUsY1SMgJP++6MB85HnmGPYfMNQTKcPkB5OjfVK0HAjWl8kZRafE
         1bScz/3JJnzLfUYl09wtB1bDdlq8UPvnh3d5oEH1832gmdZGESi/B1CaMi251gorWO2s
         bJHMH8lv8qCqD7ta80FAidHYs4RozmIuY6bdfDCNofOUaT1jbt4KXmXl9Cgx7O7si0fz
         unxw==
X-Forwarded-Encrypted: i=1; AL+hErFYLptsiBJpii3cxmdQf+JxnuAaPDkXu4b///bvlSpf8lBPdF0HK7JPpqwJzAU2alaIKO2wsHmLmyqM@vger.kernel.org
X-Gm-Message-State: APuU4Z96FBwQJB5LNdLdFODQ8GoVJbT7Mu4IbUzmqryBfwJLRUsr5ZHp
	ulWAaJpVOUw6VVDk9dnundLcN2YApnFDHWwp3yYb0p3L109O0FFcglU+
X-Gm-Gg: AZFdTZfZWfiNk+jKkhF8zmZJKLSut/Nas7b/fSqtBuLAtMarPQ/pT/gnWlnLeJU1zTK
	u6DPZe0h8kGXaSo74p6Hlk8FJt8hSGRg4xtF75TXaGUq5OY1JwT//4a30JFJirkcsFNUKeFT0tE
	4Q7KNhOYnOCFXk7KMbiPMKIVK4H8rsFVT68JESGJKd5b+NoqIC+kwaAM6mM635yKwX6zNdBULrg
	XPYlzQ4tkT5XHlAWepAurkU+oo6RyDC3A7qO7EhrI796w7puD7eDwvfOgaLZ1m+Mqr4mQ4uJnPq
	WmHHn4TJRO7P0HX2aEj3p8fRvKAgQn3sKMvgT2LopbeLl5nsmYPiFNIyu+cjaI7Kk8LTHJAxILw
	oGNtExyD+i4K/DrajsG3qPxFb5FexvtZmc6JFUZ7F1pFwR3EPhbRg5EOC11zyVcEpucs60qnsKH
	5zUQot7Z2FE6Zs+rqeWJyzpoet5at1ZJ1PjzpUM04GZO/eKKdlb0qJU6Vb/UMmTRhfwQ6q5EWtv
	Vfa7mS0bQSfSyDzwxh/MkB/zeKI5W+8PEb7SQbjqvA3wWvDRY65JmcYGHtOvIm8jO91ycz0P6t/
	fv5XilFFnGFayPzCRnInY+Xw0PXbDeGd8lAILVgASZ9g8r1nkxy4HwI=
X-Received: by 2002:a05:6512:3b08:b0:5c1:b29a:1ba3 with SMTP id 2adb3069b0e04-5c1bc7d5ce5mr5731034e87.29.1795514780815;
        Tue, 24 Nov 2026 02:06:20 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd01b423sm3627942e87.43.2026.11.24.02.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:06:20 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/3] clk: cs7542: Add global PCIe controls and network
 engine reset
In-Reply-To: <9facd8eabb9d0c2bbe816117481dd624aa8c1f04.camel@pengutronix.de>
References: <20261124-b4-cs7542-global-controls-v1-0-12548785df2c@gmail.com>
 <20261124-b4-cs7542-global-controls-v1-2-12548785df2c@gmail.com>
 <9facd8eabb9d0c2bbe816117481dd624aa8c1f04.camel@pengutronix.de>
Date: Tue, 24 Nov 2026 13:05:40 +0300
Message-ID: <179551474060.2.10541952676329766668@gmail.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"

Hi Philipp,

Yes, those are seven separately named bits in GLOBAL_BLOCK_RESET. I
haven't found a hardware requirement to change them in one write. The
vendor cs_ni_reset() toggles bits in a different register,
NI_TOP_NI_INTF_RST_CONFIG.

I grouped the lines for Ethernet teardown. QM can still own RX buffers
and DMA-LSO can still own TX descriptors. The driver checks that all
the blocks it owns are held in reset before freeing those buffers.
The -EIO for a mixed readback is how the current driver detects an
incomplete stop. The Almond+ tests exercised the grouped sequence.

I'll try exposing individual reset lines and checking each in the
Ethernet driver. If any assert or readback fails, it needs to keep the
DMA buffers. reset_control_bulk_assert() would deassert earlier lines
on error, so that helper is unsuitable for this teardown.

I'll also use regmap_test_bits() for the gate, drop the redundant ID
checks, and move the PCIe assert, deassert and delays into the host
driver. These reset bits stay asserted until software clears them.

Thanks,
Fil

