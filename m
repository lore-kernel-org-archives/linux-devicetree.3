Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794826563;
	b=J1Hb4TPoFEI9/Bo1hPAVtvtnWMTbbiuqIP65AmewsqACDURwKZDXcQpGyEmcCjmH3dZP
	 SThGHBoWr8BjGnAfOaV2Z26heV3gZ4jDBGOiW0Hl1Jc8/GNBStCMt/3fR4eKsF9Ux2aQs
	 c3eDZQGDBPHryV9ZKs89hCGEOpIslhPJ1PFdFA7LUGSYlYtNfmzPgpVvH36IDFVh6MUJX
	 2wiqdlex/bNTUhrhYo8gW1klce6d3j//dEUk6WKqXZq0FVzx/GfO0DSRs3poMI3dfZr1+
	 CB8HaflYD/OSyX4MavERFNsEMvmE82gzM0E63ecxsmr7l/sFWffP1EuLNSyvKlzboEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794826563;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EJkLT5+FbYsBkV6aiXjOdMACJbaO9v6pAiv+btB2ar8=;
	b=wJABua0Y9o7aAbohNdggEcUJVIns61br2oUbmiPedQbPXyXX5qPXHcWPMHuxN10Sn4El
	 sFQydMADCqjsQgbuybS4HLRbQOV9M/K34nzhyxuROxwAGS6J6Zi96ijKE3mWqQg5vpSS5
	 vMV3LINUdWL4FWNfl721yC2vdZi7eQh3eU7bxTlAfVU3qGLPwRRbaaM5uv/61uoAopSot
	 SnYEiUzqko0rhQWNgO9W801cVYYA902Og/ptnNse9KHwVPabBIL2dWpy7+6Rmpp1x7WIT
	 6I26SpWvei/HfpHwmQw9vPn/uGGmt4vGCYjnhK9M4Bek5YWz4cmLi6KJ4gu6kBlh0vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uOrwRPEd;
	arc=none smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0AC7606A32C
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 10:56:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0AC7606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uOrwRPEd
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b4b2bf375fso10012407b3.0
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 02:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794826562; x=1795431362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EJkLT5+FbYsBkV6aiXjOdMACJbaO9v6pAiv+btB2ar8=;
        b=uOrwRPEdZxwb751ktNgOXxghBLBpPgaLQHcaFaWrPZ9mYh+pJvYGFRSmBcQjXlNGUu
         f8sf9QV0oC/OyjPxc6MyhCG9MtP/nOKCLHziSXOy9zantRD21yBHE77MW2QrB3iVWuL4
         C1N3vLsRi+Emnf+aQrr85rlNlRbXD7I86JgrRIPPecbV4Ns/CDPrcgT3hCNKqzq29kcO
         5zkokpzQ7xXbjktdnEJ2iQthbiO9qkYK0g5Wni6g5DuKx1RRyhKaQPBcbZ8sCxLr/Vc7
         Folo/BNh8KRGnbanBK/Ch5dQsaFe+qEz3vvlzZGrSF/hHNzV76yJlo7y6C2SvwQppMCd
         XmWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794826562; x=1795431362;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EJkLT5+FbYsBkV6aiXjOdMACJbaO9v6pAiv+btB2ar8=;
        b=XwfjPiXLt26m9IwkqGY4ooyv7+3kfTqY4h+fI7AuD3ZJurBbFdPI2Pbnv9yFU1h0RU
         +kk9EWBnx6Udzlx1TSyOLIXvTtBnu9E8Z9bnlaZ/vhzRs8crCUcuqXCSEX9BysuyrxlX
         P7X6C68j55+Jz0UHECOWP/NZH1vn1tz4g5YOGzMj2ztl+FclVulRN7O2AUkfcGX1KG17
         2yGUNOFhpwm1/Miil4Vkff+B/Q80+IPVs5QLKTUQcQ1G8Vcx9NO6rUmTb+WUw/XLYO+b
         TKCdWaZ9Jhbzq9FOeIk+hswMlpfswLykxEczafEBK1mXn4KA8xNP5J4TI3o1SJJLEtd+
         IicQ==
X-Forwarded-Encrypted: i=1; AL+hErHElMfvu3zZEsbDZxCeFC+yDb3quICdLJFguwuIw/awqiVwnQbmy57nUT4EC98lgSuZ0wqujPr7SGFz@vger.kernel.org
X-Gm-Message-State: APuU4Z/2tI0Fb4jzeC7YS+GLXATBvqmBd6qyUmKCCqjg+W4rubSRYZ/P
	XtS2oYr2vGFAL0F3+znnbR4zWBg7rybBWY59edvKUQcCmuiCmfLNyUzC
X-Gm-Gg: AZFdTZe8ql9/lbCw3wO1bE2MT5O14uIqRBQ70HeTZF/w4YCR3N/r5GDtiP3SfXEpWFB
	utx5vSYNKAhgE6T6fYsPY4eNTEnM5oxuo/TNDO6u5Xg3xOcHlQBKvse70M6i/FaNom9V1JnphNa
	jxH1W5o24gL/kziM4kF8yF5+99+kwDaoV+Akc0slp0sixqw0ZSVETuGy2jkaNLCZD9JY9vK9+cN
	jxuGHEmiDZhjSOX6m2XcNv9tTicScNMqes5tKmVIF5Qql9syWl4RPZ+4w0EWeUOv8gI2Brd8eYR
	iYyAGT8S9ZXHWs93kKkYBaVHgWn68v1GmjTKdSqH3Tw1d+4EFJh1ui9IG8iHSSq8v4dV4FfIsMU
	Lq8b7X3Fk/u2iS2VclV3aqytu4dniosm0JfKkTalxb3/2NgdEW1UW7w8a9o7kpjU19gfDmGg5zn
	GtC5bWIyNKCyVir73Ib35gKpkySowxTHAqMx3AWyA3ygOmVjNQSEljQKf3H7Z8hso/DiEqTWi5q
	H7DLktPC9RkOch4BtRKfVcL0Mc4slHjFIYXOTVggCgLHxMbx5sRHEHD26kzTh9J8DNJOCWxHMUe
	vFhjYQTxWSWELvoV5A6xLHrOfn4LZrx7zdvSbpnIg8k7yX1fNSviItsyNIeh7V5k5jwxTQX9Ax+
	it1jrd+tR79FmsbsTBpefN6V8b828JgZk65E4CSEwd05fj1dRXvJTKnD3nQ==
X-Received: by 2002:a05:690c:34c9:b0:8b4:c9b1:ba6b with SMTP id 00721157ae682-8b4c9b1c520mr26140997b3.23.1794826561834;
        Mon, 16 Nov 2026 02:56:01 -0800 (PST)
Received: from MaquinaLab.. ([2804:1b2:aa41:8a69:2b8b:32cb:351d:f30d])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa7f1a0dsm82274987b3.1.2026.11.16.02.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 02:56:01 -0800 (PST)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Xu Rao <raoxu@uniontech.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] phy: sun4i-usb: add the Allwinner A733 USB PHY
Date: Mon, 16 Nov 2026 07:55:42 -0300
Message-ID: <20261116105544.669029-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds the A733 to the sun4i-usb PHY driver. It works with the D1
settings, except that the A733 gets SIDDQ cleared before the PHY reset
is released (patch 2). That made an intermittent USB1 enumeration
failure go away on my board.

I only have one Cubie A7Z, running a local DT, since there's no A733
dtsi upstream yet. Only USB1 is enabled in it, so PHY0 (the OTG port)
never went through the new order. The boots ran the same reorder on
top of 7.3-rc6, before I turned it into a per-SoC flag.

The numbers are in patch 2. The comparison inside the last run alone
(1/31 vs 0/60) isn't statistically significant, so it leans on the
earlier 3/40 too.

One question. The vendor BSP uses this order in common code, for every
SoC. I kept it per SoC because I can't test the others and the manual
says nothing about the order. Would you prefer it for all the SoCs that
clear PHY_CTL_SIDDQ (D1, H616, and A100/A523 through the D1 fallback),
or is a per-SoC flag fine?

Changes in v2:
- Reword the binding commit message into a single paragraph (Krzysztof)
- Rebase on phy/next and drop the dependency on Xu Rao's "phy:
  allwinner: sun4i-usb: disable the PHY2 PMU clock after SIDDQ setup".
  Patch 2 only overlaps with it in context.

v1: https://lore.kernel.org/all/20261029172325.3425046-1-vinicius.eduardo.pedrosa@gmail.com/

Vinicius

Vinicius Pedrosa (2):
  dt-bindings: phy: document Allwinner A733 USB-2.0 PHY
  phy: sun4i-usb: clear SIDDQ before the PHY reset on A733

 .../phy/allwinner,sun50i-a64-usb-phy.yaml     |  1 +
 drivers/phy/allwinner/phy-sun4i-usb.c         | 35 ++++++++++++++++---
 2 files changed, 31 insertions(+), 5 deletions(-)


base-commit: 6bdfbe223ed4735073c299a6645ebd3faac3f51f
-- 
2.43.0

