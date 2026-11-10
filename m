Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794334888;
	b=S0lPtunfWO1Xq6LikYcG/aPd0e8rEZ8mS0CKGStq4xajnt0PbZ+gFQwRsIdDBTHchdt7
	 YXkO/QAm4bCuN7oyVcSYbNm4UXecIArDDXykcqHxPPXQeU5+kvgecYLLnhRN61H6boTuH
	 xCBoSVQXHifCFmEWX/8BRmBAaB3xrp7/B+UXuHiB+Gh/Rpc/xmc4s0lrWSs/nsrO+m2ah
	 jlpOFZbhcgq5RKhRIHHn+pcz8R3Hg9e7UjjAOLi0MZmEGxMxSTvv6/j2BXcwG8c7/YFSW
	 flmnQYfX00jJ+6PC424VEhdxLgOPHefU1zjqYUiJUe+l6kDbz2Aptvo6a0TO/haCLYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794334888;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=F2RJY2BkqBxCSZFDxPJ5Kj7nqHWBCu+6Ch+FlubSWS4=;
	b=N/7usieCg0fYnESykZcMhZpM80oN0sqyRAGBmPor64W9R25y8b89f9OlE9voyNeun8sy
	 gsFAg9N8p1pmzHMhsFXcMNJhclgWRm08Jwie+HSn/454DXjOoPfbvUKpRHCRLtmdBtNB6
	 qjeG7wmsycCSPnWSPb7GSCLpybVgCP1ZOE3Iv7wldROqORDwvY08DGWEQekHPkce/ofLa
	 uecFohAB10y/3uKBdUh7lknB84cfDKS9dcgQLi2k8NMMgNTiapysh0Bf09zNGaqUPGxN+
	 7bhRjCx3xkyos2vLbsEGpfFgBlvr6rA+gJIirrfRdgd08uwm1HGZQFydZySFnMqTcSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RMKqWfWA;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71465606A321
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 18:21:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71465606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RMKqWfWA
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so23594765e9.3
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 10:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794334887; x=1794939687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F2RJY2BkqBxCSZFDxPJ5Kj7nqHWBCu+6Ch+FlubSWS4=;
        b=RMKqWfWAghzk5WJuHRkb1WroS6RTG+obBeePaKx6J5bQfU0ZMHKjkHkPl6sL/w31eX
         PwigkiYuHVH6o+Sea79842++t/bM2z5y8yn0HibdY2aS8MjZy5PHguk/K4UGy+/w7/1T
         dE9wWNABKEoXDp1j9Q0MhvBbF34Jf4qDZgNr9XsN0fR1tmLznMBHOOOj2972JUm3sx1L
         sWGU4u6zv9t8HmEh/r21Ds1ORky6PzkdS2JBJHxF/ceCZbYMd9Ypsrk8pyc0uA7HFTsA
         OaGWy51YrbUMeszqh444NCapezU+pVBPAlFzEpsqJ+NZvqoITX/aQ5pvlGTm8YfAlL7w
         BjtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794334887; x=1794939687;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F2RJY2BkqBxCSZFDxPJ5Kj7nqHWBCu+6Ch+FlubSWS4=;
        b=QMk2r+JMkLJn8InbmPLht48QKXTXbRri6bZGu7uCYFky4vM0WxSxeU+nE3O3wkTIxT
         DBeg2zpNcRT7UDawazirGwm6fYXqH0bBSky5SOi6cMhwIRhwNPD2WRffSKloDdf/BBsW
         DE/M/fYj4bJoifZXQb+MA4hC5kATwsGQE9pDiTR/La9wi8Qhv1XA0FKaoIwswmKz+f3g
         +H8HdpOfuviU7rWLPfLvWXRV6r+LLjC0k+X13nm9NUCWjrp2B50mBnSn9xCDxSI4m4ZW
         aJI8OJaknOOOIKebQhsv62TPy4mEjTFe1inmxmoz95r+f3cQGLgtQEvTBydCXhRzyRx0
         Qp+g==
X-Forwarded-Encrypted: i=1; AL+hErGu7KBtOJZT8kcN2z7SCKNlsAg0V/mA0omy9KPSvCWK/AEcg21HaYg18c8Pk2gn64DaacVqn8hihR5P@vger.kernel.org
X-Gm-Message-State: APuU4Z+ljW+r9qR2EMGHQDfkeGX/2B2njlfFwudDcEiQ9zT2dErqOcmO
	EsG9wRwzu8OiTS75QtKU3pG+Af5r0ARsC1BjZ0OBk18hISpQG8RUeWC5
X-Gm-Gg: AYBFou2SksJoiq3je6hVQZkHYkVzI4Zyc6zbqC/o2wfYVovENxWUzo8HKbJgh8Whv6j
	Ca93kZdqbL2FsUnsDwflTHh/00Ga/y0wOlRcO+EFbXn0dgwHUDVAV0zrbo5EihGG2ScyFtn5F+s
	ATYxhfyXGT4Th9QGRRzXj2Ky3Rn5yxPEegzkTh4rRJCWtoK9qPsU7G/jZAoVflELuCaooOkBBw/
	ihsoEQUt+o8yJ4VQ14ppoAvIbLqxCKlYEofEJAoyblsHGMIsYflbzlBnNHHKqxODat/d0WXQcDV
	+gGelFKKLKMVveECxXfvrE4ZA5zlhWXm/gqDS8YDD+u0tSBWmXP1emuxtkOQpncHajnw71w2xM5
	KR0/QLGNOf8zKU/eccbic1lzvDsG4PMfrPcazmn/r6vTaLwGWQEo51SsWOsL/Po5ksohoUlhu1Z
	/snVsUeW2MsuDyhqB30kgYt44X70y15J0oF4XwK1kYK2lBzrVVMxJ0HGlWVMfkn48dlJAJXzv6S
	/CE4i1GcPBJvBGqrsYTYauXegG2W0ksAsSLTQKrsu6dpfwDdWV5+hQXfNsaHHXtC/yZ5CjU+jEq
	IEWvNeFelTgrDwY6zQiJMXGWHTrZ5Mreot25I9Fy5iY1L5RRxpf7DI6OgoUos7pqDbRxsTrIJvN
	QHWSkjC4vmcy1NNnY+bZQFGQSU97+52HQlOfSZTLzwKn8Z8FER/0bcp8=
X-Received: by 2002:a05:600c:8b84:b0:4a7:6bc7:f778 with SMTP id 5b1f17b1804b1-4ba02355aa5mr62875845e9.30.1794334886677;
        Tue, 10 Nov 2026 10:21:26 -0800 (PST)
Received: from Lord-Beerus.station ([93.146.104.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01d9df5csm95507825e9.0.2026.11.10.10.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 10:21:25 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Joseph Guo <qijian.guo@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: [PATCH v1 0/3] Add support for Variscite VAR-SMARC-MX8M-PLUS and Echo board
Date: Tue, 10 Nov 2026 19:18:10 +0100
Message-ID: <cover.1794334398.git.stefano.r@variscite.com>
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
Content-Transfer-Encoding: 8bit

This patch series adds support for the Variscite VAR-SMARC-MX8M-PLUS
system on module and the Echo carrier board.

The series includes:
- Device tree bindings for the module and carrier board
- SOM device tree with on-module peripherals
- Echo carrier board device tree with board-specific features

The implementation follows the standard SOM + carrier board pattern
where the SOM dtsi contains only peripherals mounted on the module,
while carrier-specific interfaces are enabled in the board dts.

Stefano Radaelli (3):
  dt-bindings: arm: fsl: Add Variscite VAR-SMARC-MX8M Plus
  arm64: dts: freescale: Add support for Variscite VAR-SMARC-MX8M-PLUS
  arm64: dts: imx8mp-var-smarc: Add support for Variscite Echo board

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx8mp-var-smarc-echo.dts   | 647 ++++++++++++++++++
 .../boot/dts/freescale/imx8mp-var-smarc.dtsi  | 640 +++++++++++++++++
 4 files changed, 1294 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-smarc-echo.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-smarc.dtsi


base-commit: a62533fb6362e6424a7bb4ecd4b5afe1a3355849
-- 
2.47.3

