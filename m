Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0582E328B75
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 17:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775670042; cv=none; b=FyajU5SDO0/6+50QY6h4pve/KFQQ31k3Y57MGX73cfaiJe8bV8jsV7hgnF/twK1neSuDdEzMQvxOZeuAyN6/jRCLKy49r0KfPgiSubjSZ2iOOf+HGKDcJYfSLbCN+VWtfoHSd5Sr7afAm7n+KxkcyqAASBFusOo2R+2Nnge8514=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775670042; c=relaxed/simple;
	bh=0qsG/us2WVwXLTbDE9ON6cQRer4EhyAiATQsPRj6xis=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kIL6KMB3Q+RLfLwWqoq1tnpD+YfuOMCGc9k/tNjln4fxWyoM1RdRqq80D6aRIkR6iIPw6dWc9bPz0bdgd9cfMrn95am3zSC+DFUqrzjXJ1Go3JX6qmvpWcIxnabbS7eCSwgRIsjiD6e9DGf+PK7b4vD3ebGYBQ0dkhuBGZMdSJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RSr9okzi; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RSr9okzi"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488a4bc360bso541635e9.0
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 10:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775670039; x=1776274839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JVknTNXnOvlztmP5bPCaJ9VCAFMggsih6gMsKKZCoUg=;
        b=RSr9okzidB+sk8GIim/c28Cr11mmMa4lDcZxZGmjNKqrIPTYT9/yKHjF4H1F6FW2ZR
         a1JTSdwQj+TEBhwvUDPrX2ypfCFKfYQ3+c67BkC42lNzjcklbD1LXIlIA+bRXRUTFZrJ
         bGUPmjUynwHarn59vEAFanBHp6S697/rdtbrAVge/y+pYgjlu4clhqrche22O0Ui6AbE
         y8ZzcmYZjVn8YBRwMm35Bsq0K5IOTgzpAw+ZD9Y7X7r2Pql2SiKqXWdqkviC2OIzumE9
         2AJZVlDuek00XFekQhl8qxy7zQwUHVbUda2FH2dqWC4VEsQ4e/BOkvs6tJvT6u1TNqB0
         ZaVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775670039; x=1776274839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JVknTNXnOvlztmP5bPCaJ9VCAFMggsih6gMsKKZCoUg=;
        b=SS7SeQrOfXpAluQ+ohZ30dX2/01i7WIYS3KRcGyaDgWuAS1luTOe4mUDmn0se0RUgD
         WUWBOWXIpvtb7VHu/Rz+sDbKVBDcFzAFo+W/FE1hYfetv+jM2jXN6AKQCL62zsvODcRN
         KmVJnDzCWY3FzxUYO/rZxvQwVtF3B/XKn4PzGg8UDFwRJh+f/GG7zAE1Ja0iigIhuaG6
         sye66y+/niiQTNNDhXc98SepRtJL15gjmyNc8tDNdwv01VjqA0jhDaPnFnlWifJNSufk
         CSFOZsjK7kGzzH2bzRRu0c/Qwh7GQ/2Zf1OqfOkmw3ley4+5ghFY2zYT6EqMeLQQ701J
         nlmQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9QvKGhgf21YRy2AAYQ86yih/PxDGaNYoKKMPTS+OORMlYsdYq1NAclP0ijhzCTP9QUPcz19UfNSiW@vger.kernel.org
X-Gm-Message-State: AOJu0YwVQD0EgZKeU8FXfIqpI46GpxefbNuMr8dzu1nrMZrhuJy28UgM
	NZCZjwPA2xwRHzTV7w6QG7fRlok0Xd/WLfd7/oYAcLJTmenkJIZUFdZg
X-Gm-Gg: AeBDievoEgn/eSUN3yCTm+VRFamAP4VE+z+u7vrp6hq5fzMi71jamVM3bH/Ei83OKM0
	M5CQh5Pu+rtL3qFMjcUkDVMMt4Vf31kcTK4h3NrxetwoyAUxG2Flzz5K1TOPLwCaOKG1rmnSciI
	1Xhfw8U/ARhiicI7aJUP+xukBoL7y4nive2BwyIloMs19RY+tvp5raU/Ml3JoVY14iK62bevisS
	I+61AIpEsF1/mi0RMK/y+wgej8IbrucVNIbkV5HyPB/WA+b9SiVJKwngEqImxkJRooO0Ur6GnIl
	1I4AIet6DBGUrwGGVPHQsgoiWgAm/gj1O1rd0Uq9sxPoefcrHcDdzRha9WtZXkbHs7z8b4qxN5G
	KXqeCZbhnUiDiFUHOR0Wc+GSuibufYtLnGPj52lUKnCya+yf8HQmewqSMJ+aSlEHlNobpxcZvgj
	krgtK61aNZSuZR5oFO7se0Rlu3N7hSVwY6bueIYAY5aMd5v/m/8XS3WfG1HIzkQ5vBo6EsGUEzC
	E3G+eohHLjnuFnTQKswoLuZITEoC9RL8F7HKScUIg5WfA1S
X-Received: by 2002:a05:600c:1884:b0:488:a2ac:a340 with SMTP id 5b1f17b1804b1-488a2aca44emr139853645e9.12.1775670039126;
        Wed, 08 Apr 2026 10:40:39 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.vodafonedsl.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e1fe0b0sm61774659f8f.0.2026.04.08.10.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 10:40:38 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Josua Mayer <josua@solid-run.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Primoz Fiser <primoz.fiser@norik.com>
Subject: [PATCH v1 0/3] Add support for Variscite VAR-SOM-MX91 and Symphony board
Date: Wed,  8 Apr 2026 19:39:43 +0200
Message-ID: <cover.1775669847.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for the Variscite VAR-SOM-MX91 system on
module and the Sonata carrier board.

The series includes:
- SOM device tree with on-module peripherals
- Sonata carrier board device tree with board-specific features

The implementation follows the standard SOM + carrier board pattern
where the SOM dtsi contains only peripherals mounted on the module,
while carrier-specific interfaces are enabled in the board dts.

Stefano Radaelli (3):
  dt-bindings: arm: fsl: add Variscite VAR-SOM-MX91 Boards
  arm64: dts: freescale: Add support for Variscite VAR-SOM-MX91
  arm64: dts: imx91-var-som: Add support for Variscite Symphony board

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx91-var-som-symphony.dts  | 527 ++++++++++++++++++
 .../boot/dts/freescale/imx91-var-som.dtsi     | 456 +++++++++++++++
 4 files changed, 990 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-var-som-symphony.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-var-som.dtsi


base-commit: 52bd553667e68b91ae6bb686ebddb66e539c7798
prerequisite-patch-id: 6aed59e9105465c7ff1c01475972351600be1526
-- 
2.47.3

