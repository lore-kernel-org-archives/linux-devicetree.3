Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA12C401A38
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 15:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774540108; cv=none; b=JBE9nFNr6F/gAlZtEYv73KQlBPBBRCRuNdWruPX/pp089RdaVI8uPDD9ZsnpB4uCMYzDgD9x8hqvAgsmtvFUTKK11XB5bG/9k0gjeG0s6eGKpKgEE11VqMX+XGPGSCW+jAAccuOxaSqtDtqGUAid2vpiNsbUPEmTE5dRZ+fAe04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774540108; c=relaxed/simple;
	bh=/ZmT/DBJHUb+IDvYI73kBBbncazb+maXp9T5kj0cSLg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IeGlz3atAacajHWM0fXql66zSCPpk5jOPCLFjCl6MjiD1s14+eeUeu9S3DOKLV247w5NyiGA3dGK/qqEXjT9cogF11NLdJIgu0/iYb3mpf6QCjiAo7ZSEdQZ/cmC1mHqrGHjtQm09NqhrmS0MqgKt4H0Cz8d67dMhlEQ7Z0uShY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kWsgn+8P; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kWsgn+8P"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-486507134e4so13692085e9.0
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 08:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774540105; x=1775144905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=07/cjURuXrTCYh7didrIz8VeWt0ESapQ65aqs/B2tiM=;
        b=kWsgn+8POp+N4JFl8RepJTKtNsPz8dYx5NBtMJgYHjhKb26MGR13Lr0RFDRqB3Cl/l
         QMha27gOGimPDXJ4eNorEQCG770s57wFhi0MFTaSfTbgjs7D6CpaMjUIraQ63/76WddV
         buCwd/M4JStIcbEPmJl5XlOl7VNbZS8DF4izAflGSmEpDPiz9AxI59MoiubZgLvuprFo
         QCrpeBBagFD6qkvUBttIse0Oq6Mux/uAKhpslNF0g38jzbiNmV0BFXyXxOSO5Wa6HlIO
         DK0yDaJz1fSbXKIl+R503hrWi7lEBx003L7dGGFzExkECf/1h5uf+3Xt/8mbOydKPA9A
         TDYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774540105; x=1775144905;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=07/cjURuXrTCYh7didrIz8VeWt0ESapQ65aqs/B2tiM=;
        b=OlDzZBc8ZSusdjbCxUrEyYJfzIzhZYFX20LQPY2YxssviFmlqAFYhwg4tWTBuN+kyl
         HAueIblaola68MXRoOFWr80a/1XK78bAq3EeclrizLRHfKFOLaGK/Pr8sEmXfDx0sIvI
         JVw5XEe3J6OFQeTNsmQmQYrBftC7oMkevHSYLSGhS04Q8k9GRN5N1wj0KLv1ZwDZcjy9
         yYs/Y3n7T8OYjmm7H14tnPGQoQ3haa6MAcjEcxlAELcPytLbXrVc3kqltBKjP4mDaLTR
         uzvU1B8AeVK+PjmJg8W/Y8fWIEZSAxvroT8l2pf4L/mE1iokzzB6/1SV7sJ3KFXEV4aL
         W/Lw==
X-Forwarded-Encrypted: i=1; AJvYcCVAQSjGV2a9jn0p0awpIrYImYlKriuYEVrP82YTfgLj82CKEIwlA/eQlzKOJwYxFYgli77JfGpHecvC@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe2Wb9MNX4/pF/0h6oe5QLS07WF7JK3EcOYbsE/HlsCGcR0qqs
	js4MyG+rSaJ2zBa/RTsHSyFDTjLiEUy7HD8S1AsXYLvmKWZcSyvullvAf78moCPn
X-Gm-Gg: ATEYQzzbOxOTXKB+EF/6A4Df62BKJwq5bojQR8il1goUtBgloxtcg8h79rxbaJyzeOZ
	+wmaxHsQeOWcpvzX/dCWQO2ti2YGlNeGd1xyaeuT7QC6/lFe0b8msZFf6FQiEINBbJIW4O1s53k
	8RkUhbyEd+asL2IGabmUUjZkAe+ySQtvbery9DhQbSthU7tyVRxhI11eghzrTbmty5nEYF05Gm3
	36nuk4tSh7QO+ZsmFYLhwjToC5ooY+ATk3EsJZP6f91Ek+EyzyOLQo3TasGzlKtwlQHjRNNOKpY
	+XMrdmGyM9h6uiG9Hi3DwX4ILEvVaItv6AJdK4JM8sYr1yey0AOfKQ6HSniAmMLGWsTr9mIb0+7
	IYFhJo3HvdZqq+Mn0vPbwb5katV4aOYYn0YMMKnt+pIDvvbLZwAu2D0wSw1etKFglM32AFhmH3X
	l4PT6jBkjRILQ4k1n64bB5CX9kiPCf72c20mXS9KVX4Z0BWs//G4rtLXkYA6I3CKTLPF1ezqLJl
	zn3/5HSlK3MaQUcKGUdOzJeaP0N1bD+I6VuDw==
X-Received: by 2002:a05:600c:8489:b0:485:304a:58cd with SMTP id 5b1f17b1804b1-48715fc3925mr119005735e9.4.1774540104995;
        Thu, 26 Mar 2026 08:48:24 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.vodafonedsl.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b91942e52sm8831016f8f.9.2026.03.26.08.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 08:48:24 -0700 (PDT)
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
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Josua Mayer <josua@solid-run.com>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Primoz Fiser <primoz.fiser@norik.com>
Subject: [PATCH v1 0/3] Add support for Variscite DART-MX93 and Sonata board
Date: Thu, 26 Mar 2026 16:47:16 +0100
Message-ID: <cover.1774539301.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for the Variscite DART-MX93 system on
module and the Sonata carrier board.

The series includes:
- SOM device tree with on-module peripherals
- Sonata carrier board device tree with board-specific features

The implementation follows the standard SOM + carrier board pattern
where the SOM dtsi contains only peripherals mounted on the module,
while carrier-specific interfaces are enabled in the board dts.

Stefano Radaelli (3):
  dt-bindings: arm: fsl: add Variscite DART-MX93 Boards
  arm64: dts: freescale: Add support for Variscite DART-MX93
  arm64: dts: imx93-var-dart: Add support for Variscite Sonata board

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx93-var-dart-sonata.dts   | 654 ++++++++++++++++++
 .../boot/dts/freescale/imx93-var-dart.dtsi    | 462 +++++++++++++
 4 files changed, 1123 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-var-dart.dtsi


base-commit: 6c4b48012d57f205c94f25da0c68a4027ea6daf6
-- 
2.47.3

