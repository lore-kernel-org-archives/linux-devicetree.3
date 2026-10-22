Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792677780;
	b=fVDkz7uI5+RMDqlANxbOQUeF9Iqv9+1LLgyivaVRnkoP/m5llZxYGlSITEUEwAcJrPMx
	 3shR86suVDT5i6TRfpy0BlcPr9EEgoyjVJE/hzPocemZLchThGRICK+Zt4bCMsxIjsJbV
	 n0tYxn2KNiaJg3K0a8G6sqWoj6i0i0t0oUJsuASk8H294uhqgjzw9SDThQOmjRk6tRaSc
	 cpcSTzTiXuFCHJqcr8tQ+PUprc3SjTerb9nFKWzZm8BtTJwXQvEuebYsuRszximJe5REp
	 B0g2eo4d88eDYltUs9Xt0//rCBm6VyIw9JmpqXJfBqyFxbXvGfZt4jL4vvgCJQHDZBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792677780;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=cpTBG70GLztkppBlWDxA4zs5YJB3Ae5lFCFEvrLL98I=;
	b=UJKbw4xRypNesj86yiX0REDg1DL3hAgJkBGeEsWx6IRUkxwICTZp0sW8oXGlKQEuvW0w
	 frKVIUhQ96zWRpA6MJLBj4xvF0KMEa8wCCmhyh12e6iTIwf7f5Rmb4XwjclrNOk3A9As/
	 fMqtcuwfVOfjmG7kCTTORMo7TjBKf0zt2CsMJLWSeKClbfeHjpJxtjIj54DUOy1v/DHDF
	 rPb5q9UnFD98ur1rBZn/20SLYVoyS6UQ8isYGVxszlOaAkX+8jtHxnSxXikYcNeyRPHPW
	 KdE+RUn9tvdiM7cnYM1b335Xl8gv5BHT4hAp44LYUKaRxNYfrAoWXPxYtfo0eWltgzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=konsulko.com;
	spf=pass smtp.mailfrom=konsulko.com;
	dkim=pass header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256 header.s=google header.b=AXQ9HFzh;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C41606A320
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 14:02:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1C41606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256 header.s=google header.b=AXQ9HFzh
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso1852848f8f.2
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 07:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792677778; x=1793282578; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cpTBG70GLztkppBlWDxA4zs5YJB3Ae5lFCFEvrLL98I=;
        b=AXQ9HFzhd/Z3Nvc9F5PL8GYl2otL1UEi671CjDSsedcCw87bOZI2GQC5b9Sp5LVaqy
         Kpe8DzFhZY0WQ4WHeu/Y57Fnv25O/HC1UzsBdIijueZfg0nuD0V01KwpDR9575h0dCIK
         e5/D2XfyYzfVRck9PfNZ2scW5qPJEROenucls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792677778; x=1793282578;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cpTBG70GLztkppBlWDxA4zs5YJB3Ae5lFCFEvrLL98I=;
        b=pXDg/oq4hMBr4hZ7dkMtl5fOqxH+zIYmTCco27iDugYBVGZYAd7dkxUjOS7UZ+1h1v
         RJH8Wdh1g36Ilra3Sy1jv2t92wWcKp9p+SYxjRdFFkpAOPy4xICrrnTm+UOu/1ip1Skm
         8ri+iTtu/VK3QbmkkgzxWl54D9Rq/w+YUoG5ouLxMm4uGnxnJKl4/l/F3dpEn3msX7sH
         cdu8buSWuphQ+TzV4/PpYjN2TkOpVqCUfkGGl9fTRPuhNRgKPPJEoav7Ibe65jVb0omL
         4oTSQpfbxvORCLu/pUO4J/LEq+rX+DuuXkkjsxbDDoonXjrNARz4CqvKiPa6+Rq0A1JV
         m96A==
X-Gm-Message-State: AFq9FYIC5QJWG70qJ9xmb+Z+QjcFM/XpSyoymA+MW+AOOabk9H9m54x0
	Vd8oWU9DBMmRwq9REf5zwGGUFfBvTwDBuZxlH1yHDtrBANQ0uo7ydLEZBla0f/MzOmk=
X-Gm-Gg: AYBFou0cQjygnXyQhJj1STzndr2a++JiavW6LXLiQt6gXjXVZJs+Cc3SzgGt5ujQRm4
	XOXIVDnDFJ2T0HRn9/V+2Dg/up4CYVuzuV9Rnry1Z4YdnhtpXiEbhfv/NjtfwFhaBW9EghOJZIm
	bEHUF8RU7VaLPCNRgForSBYFErCAN0qiQLMYjIklCG/l24AkGVujxFWtx3HvXXT8Mn1e5Y3QDu0
	54ve7bUOJa63vnaMu9KYBF+kJQe+dq0UZPq7Mw7ETIRYQiHUnG9ofqtLeWMS0UwOSh/DoEeObEy
	MxpNMXMqoRs1AOXJ/a8tRI38WhfLZ6Z8Gh4Y8GFctUzYiI2dxnjVX6nu5V5T9edo5R+ViybWOzz
	tSyz9701/NfGaw+OAQ0IBbVPVgxJi1yELBGgmJHumg84FP/dQCIgsNm5xjlUJTPkGKxgMnwLBlZ
	uNp7ghI2VicodujHIiGaXWTFIaAzqhCOd6qr9WCOSTcBU9YmtkuwGTJxxb+u95yrTn2CuTPwd9N
	zyrXJYMQvQ65WOh6CEmi2/p/4MLg79+CGkRvBHR2pIopfgI1DFeIvMrOAXVEVTbfTmGEbCo
X-Received: by 2002:a05:6000:2612:b0:48e:7fb:aed3 with SMTP id ffacd0b85a97d-48e264a5a5bmr11406983f8f.17.1792677776798;
        Thu, 22 Oct 2026 07:02:56 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2582a53fsm12538258f8f.32.2026.10.22.07.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:02:56 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	arnemaximilian.richter@draeger.com,
	martynas.grybauskas@draeger.com,
	Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v4 0/2] arm: dts: nxp: imx: add Draeger M48 CPU board
Date: Thu, 22 Oct 2026 17:02:41 +0300
Message-ID: <20261022140244.3476844-1-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
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

Adds the device trees for “Dräger M48 on NXP i.MX6 (Q|DL) and Intel/Altera
SoCFPGA Cyclone V” board variant.  It has both (the SoC and FPGA) on the
same carrier and they are cross-monitoring each other.  The SoCFPGA boots
independently off qspi flash.

This is the imx6 devicetree part.  There are two bindings as well as device
trees, since M48 is using two parts: imx6q and imx6dl.

new in v4:
  - added the missing GPIO_OPEN_DRAIN definitions on I2C recovery GPIOs;
  - fixed the halved LVDS pixel clock in split mode;

new in v3:
  - used LLM to cleanup most of the errors and warnings;
  - proper use of dt-schema this time around;

new in v2:
  - add the tag from Conor Dooley <conor.dooley@microchip.com>;
  - it should be clarified that "draeger" vendor prefix is added in
    my previous Draeger M48 patch series;

Petko Manolov (2):
  dt-bindings: arm: fsl: add Draeger M48 dual-cpu board
  arm: dts: nxp: imx: Add devicetree files for M48

 .../devicetree/bindings/arm/fsl.yaml          |   2 +
 arch/arm/boot/dts/nxp/imx/Makefile            |   2 +
 .../boot/dts/nxp/imx/imx6dl-draeger-m48.dts   |  16 ++
 .../boot/dts/nxp/imx/imx6q-draeger-m48.dts    |  16 ++
 .../boot/dts/nxp/imx/imx6qdl-draeger-m48.dtsi | 213 ++++++++++++++++++
 5 files changed, 249 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-draeger-m48.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-draeger-m48.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-draeger-m48.dtsi

-- 
2.47.3

