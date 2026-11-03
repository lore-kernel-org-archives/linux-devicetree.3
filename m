Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793669603;
	b=zaE1bpiJoU7/PYlCbuFsZMeaCY/GjW3zOsZ1rxR8dKuve2uhFykKjuObFcFu5UewcxkD
	 FAc6RLwTkN7Wm0znhxQpZJGRI+VpxMtfJfn/AEXwb8LDohW83UV4OFkqerO5minLlooWq
	 YRvH4DApFQApGo9ZtCTBTseoGGDTe/zx1/C+hrwq9QUcGOEIAzlVkoGMQQGQmT114gtyO
	 fv8GLrIqgEC1nh2EsltouYjhn/+5sDkXHISgOOol07b39UL1qnQBVS68SWP8ORKeasKkj
	 9tev3yMDA5H6IHx0Ws0hH4mgBY3L5Az1aHpZ5TFiTrc/tLs4gwOSJ9wcY6oXoB3WGcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793669603;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=5tRIaiK1TzgUV/taZKqe0e877QKWP8p0z+ea1Mbb1W0=;
	b=x9WceT5xgMDknWRUsFub3FBF4w+LSd9RyJ3t9kI52cetrlLDNWG1o58Fw805S3LOTseA
	 koCHrqid6Gh5gPNwEfKqjAfgFm0P6zobWXdA+GYbm3/ugvLwT0iRtFag7wLyr2LKmVgFY
	 e0mh1Gqv5qvreatR75ZQUoYDPhuzh9nydvowy/NRCSPdJoGb2YgIIgCtGAVYRcFvPEi/9
	 LbFji/LwRZUJQ9TU5PmLER30UcElub27RsLADaSnSIOKqcg/yTYLHdCdkovNrQvjCiUXE
	 jtG0HvmfG9eKQOEI3agAe/b3gf8dym3wefoZNJASCphcCjOzpGrnKVJYZBCTmEgAuGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lgQNLUCB;
	arc=none smtp.remote-ip=209.85.160.170
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EFC606A326
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 01:33:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51EFC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lgQNLUCB
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-536c8f958d7so27547011cf.1
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 17:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793669602; x=1794274402; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5tRIaiK1TzgUV/taZKqe0e877QKWP8p0z+ea1Mbb1W0=;
        b=lgQNLUCBm2WQLGp42iXbCrYUYAs+Oi1wVQBec5h/3veTVceezeaAU3WIEwWPr+U02d
         2Jqta9KhYiNZ5r+wA66ORykt7/O7EX6mrYjoZugMnQI7BBKjwaiVlvqOwNxSpFc1mjgP
         Ki2FVx8XpKUdDwqV0xTB8ZONiEDPLqzP1RXHyn/vks/Ch4IOszlHvCLUvN2xnAjHDWk7
         P8XZW/UPtjNtT0I0GsalpPdLtMTO5gXSvZJw063l7KglxNmgIGM8vHdEEwyE0YPMMzQU
         Jp2r+69MahJzUyJv/Oe7B5Qpy0VAEJN+nXt9nO0rwgNMDj8fkMFV/odObkF+WgrigCIf
         smsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793669602; x=1794274402;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5tRIaiK1TzgUV/taZKqe0e877QKWP8p0z+ea1Mbb1W0=;
        b=p3MTUxHUh+JeeuSy5ucHQN3BMbKnzOIYsbL0R15eQuD4jM5hYhIFZFzLkTgMO5PYvu
         zZPAhgBUbvUUr8KY8Zr8auukBsMPbqLW2dOVBLU++xTOO0W1eDidO838MtfJf1SC58CY
         Zoy/0VusiFzQ3Qrqf5yZ5EPpnBTqb4x8gLqZtPNmeA1FeAOQAWtpioY2OIMufUkcCCwo
         9QNbk2S6WG+UF4yWv+pFeKZfrk3iNy1KBbcEWlGnKOQSYNUAiSH9IWVER9j2he7IYl9Q
         E5e50d5z1wUVcE9Z7J1MqwQOCoznibxzmvX5iv6sj629OPCibuB9JtOccy7owRQg1bm5
         MDuA==
X-Forwarded-Encrypted: i=1; AKwUvByoDqUoxwEd4OKfCAkuWSt5g6hbX+j8zYsRU8h0K+S6RdhnIquT5agthMhGQKtrhfOtExvUHFPQicRA@vger.kernel.org
X-Gm-Message-State: AFq9FYJC0uB5sn+OeoHygkZ6YshwBeCIASEbAGF4OSTHdovD0+6hQecZ
	BlYJ3yNIFNfRSwGNoShXmX4aVaiKL5iOgXB9Lyn1T9vKJd44a9i96u0b
X-Gm-Gg: AYBFou0oUlJfNjLuYFYgVwuRqiRUUdR2JYkrmsApdLQ6QdmT2cbzMDIxaVjSYZ0ctob
	TN8ehZlw+phNWOQ6sjtn2v8cVedqeLoplTFccofCd3CI4lDATffP59MU+zq4AtbOJja73skvzsR
	OGSZbg0Xgf4ek+xovJUDXG2CCpz87ZulpKa9GBNu/TU7jCz5gTB3MPbbC+EyBWPsR2E8HJmtNPO
	ZeadrWaHGmydxglGxN+FBXBeYwpjMUejcnZYrsPPuHiBMIN27zZ1skl/7IaR2KLOfFCkw9GyeYv
	haT1HDnKwDdFI2XmIe2ymxM5DuhuPwg+T9F/f/3k2q7OZD2kzikOF+dqxsgQbnqv9gTOOaTQVlb
	IRtgiWxXwKwFkx9961fbgxfEGdRslpLDGSeuULgAyay9ZDp36c5DX9fuqPvbtg4g8O4aOacQCvL
	O0YOcu9l1kJClkJu1rGMiMHgFqBS1Qf6Qw80f2G/CkJT6Wg7WrjZy0WSHEJ1+CBPXf0EAcKizF5
	ijCN1hY/lCAsUbioGaTEIiX2t+PwipYxEkAQ9pdgRam6UWiDovLdDuKgoV2MLRjdxHeUc6vcr1/
	6zOWoV+qj+529Iu/rpOGSdxWDgA/PTEtZ1KISkc4vxl6mv8ImIrQtIL67q6rjlvJZScYouUKun4
	4qUSoiAkidZrBqfy1sg3PEuAGYg==
X-Received: by 2002:a05:622a:3c7:b0:535:5fa:ca6e with SMTP id d75a77b69052e-542b75236b4mr201626151cf.51.1793669602205;
        Mon, 02 Nov 2026 17:33:22 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5498cb5b520sm12746021cf.26.2026.11.02.17.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 17:33:21 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: junhui.liu@pigmoral.tech
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org,
	Jerome Brunet <jbrunet@baylibre.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Norman Herms <dockseed@proton.me>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Subject: Re: [PATCH v6 3/8] clk: sunxi-ng: a733: Add PRCM CCU
Date: Mon,  2 Nov 2026 20:33:19 -0500
Message-ID: <20261103-a733-ccu-v6-fw-clocks@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261009-a733-clk-v6-3-ae8178fce7e8@pigmoral.tech>
References: <20261009-a733-clk-v6-0-ae8178fce7e8@pigmoral.tech> <20261009-a733-clk-v6-3-ae8178fce7e8@pigmoral.tech>
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

Hi Junhui,

On Fri, Oct 09, 2026 at 11:52:08PM +0800, Junhui Liu wrote:
> +static SUNXI_CCU_P_DATA_WITH_MUX_GATE(r_cpu_timer0, "r-timer0", r_apb_parents, 0x100,
> +				      1, 3,	/* P */
> +				      4, 3,	/* mux */
> +				      BIT(0),	/* gate */
> +				      0);

On a Cubie A7S with vendor boot firmware, v6 reaches a Linux shell but
stalls at warm reboot. The system-controller firmware uses the R-domain
timer and mailboxes without Linux clock consumers, so disabling these
clocks as unused can leave its services unavailable.

Could you consider marking r-timer0, bus-r-timer, bus-r-riscv and
bus-r-msgbox here, and bus-msgbox0 in 7/8, CLK_IS_CRITICAL in the next
revision? My standalone patch has the diff, firmware references and
board results:
https://lore.kernel.org/r/20261031020640-263f7b05-a7s-clock@gmail.com

With those five flags, two RAM boots of my A7S integration completed
warm reboots without clk_ignore_unused, and all five clocks reported
enabled. That is one board on vendor firmware. Vinicius reported native
PSCI reboot working on an A7Z without local critical flags on
bus-r-riscv and bus-r-msgbox, with TF-A and U-Boot built from source, so
the boot chain may matter. I haven't tested suspend, or shown that each
of the five flags is needed on its own.

Thanks,
Enzo
