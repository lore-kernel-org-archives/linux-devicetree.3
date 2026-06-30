Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBFA73E9C26
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 09:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782812824; cv=none; b=SqthzdVCIcgwsUTO6n2lEc4u58eJ7nOmSFVtdMvAfLvd1bfNfWO1HNQ3lw8jfkQB8/A9mqUt1aJo1mZu85LztMZiXw+t10fv+mm/p66Lx2S9Lyey08eMmeA2f1g957SMQ3eSo2XGUUgAx6WXv277F3/KoghrgcnGJ6UyJQPrCXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782812824; c=relaxed/simple;
	bh=LsjrC7hDGVCOoXjAMQ6g5qbajMV2gM1v+LBhCbwDs8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S2apfAv4shTDb5+WjW+VsZbUta2WNET8K369AWW7TFyTUbDDCvHrPk4ThHPM+FOBb4QWKFq7v8WErEycUVHyuZulBpY0Oqth4Es942/0ZAbr6gvfTKFGO4rMZLQSvmrTGTlJ3E5JEOqQ0UEwuFapSEtUyFJWS6Pg8tuszc+6Ju4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bmjYG3MT; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bmjYG3MT"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493b779003fso4910835e9.3
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 02:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782812821; x=1783417621; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4TYHjDbbP6M0n9F6tX9dbKAlLVBmbBYfjjSGS7CObkc=;
        b=bmjYG3MTVYCeUKt4A33sVUvDJc3AUBvYxV7SQBBk94XnkFLMwIuodq+vC3LGLyJh/K
         oiw0OrIAVbKXOiTc2UMjGpCZR0kFzD5cffMG5qXum3hP5rmoY2C3PaeYQgnIFJkcDXrW
         1W2lCi7ZoVxJwN8shSSDefezoiCHcxTvg3X8jURtXZ99g2xzJWVz00/O6FKTmuKg/kUe
         GAueu2rrjEzsIFc09D26M+hrRPmk4nKMeqFaBVhjQyV5jpEkNECFEkujvZfZz8ThuQdc
         kdaFFtQUp+v7SNldBSLD8o/c+PC+FoxVowWUu5uTTbsMAjfKAKgFWBDl+23roW5iwF00
         ujNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782812821; x=1783417621;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4TYHjDbbP6M0n9F6tX9dbKAlLVBmbBYfjjSGS7CObkc=;
        b=U/8+MDVGve4vF8Y434LG6B6pzDQTcJXZyDjd+BIh5/pt2keldP23Afy1RUXM23XgcM
         +4OMRHEYmtU9Q7djbOoRqlUKMIqw9NPk3Zw9yh/s8fjuIVho1MALYmLt6qnfMuD6q8Ig
         JEBaHo3eGHkz6eZz43NvTQkq3aLbIn3aaODQ1p+PPU0Mi1wBJ+KwwaOSuSRyNXdJISoE
         sJ4QAtriqkSpfV6p6D7m9FuLGDjReb0xM6T/H+2It+DF1NmKXMtNdtSvCeJz9+Kdy1NQ
         0r0e5FG1HX5usPdCKH8QwtHGZY3rgIkIgp0qQAX/KxOflmKjy57PDBxUsv1hHUHoHORb
         QZUg==
X-Forwarded-Encrypted: i=1; AFNElJ87cx1advGp8LoOIpkiSMLD1KTgk7OD0KKPbFsAIV6s5mxbLD3XVLRyPPXEoG/qru9WmdsXsSGwg2Qk@vger.kernel.org
X-Gm-Message-State: AOJu0YzhK8hAQo1wHpYm7E3Ztjd7Z67V0hMoYbqs3eWs5EfaOZFStFHS
	vCkyuDY0g1u3WZ3sW/+BPJTikIOSC1DT5M0kzogD9c+5LNhRC75aEbJh
X-Gm-Gg: AfdE7ckKXjklOo8CuQW3u0mtnXPm68L6dhMZWKVQMPnpsM3tENw/0XOwOGTYCyhxRzC
	CE4vLiKl7oNFZs2I/hI4FYnyvvLNk+oH+uHPHk/UHYOk3cYAh6pRopzQf1kExoEBMY6KJnJ6TDR
	+Px1g0PgQyHjGXV52MqliKHv8WfVWVvMnj0OSXmUjEXGPyCmlenoO6He1FdA+UcCo7neAAk4YDm
	jYCadhrbW78p2aKSzb4RY56ax6Lk0iFQGIRm8AqDpHMVc0+wNdOoJhlnOfmlwxfnmCeakJdMmcP
	wq1c6DenpmCTuJHu5wWcSmqFRlIJ1zsPFwix6JnnNk35FfD5DwEPIXXgCPsn2q6y3AOEFCxGu9O
	BU1iXujTJ5P7lWI4vSM3/d6w1lvX6nuugHL4R/25ANZohZCuZltkMGxFNSEAxg+nYOGrEMIa+LI
	gKKqx6Ryx7/IyD43lQE5x92YfYIdFWzznF4LbEwSgIuwPrg60yJQSPH62zC0HXq1cFCvekXwOQo
	I16L1jf8OWpuCR+L+k0jg18RQ==
X-Received: by 2002:a05:600c:a086:b0:493:a607:f3b8 with SMTP id 5b1f17b1804b1-493b8146e9bmr42929345e9.0.1782812821044;
        Tue, 30 Jun 2026 02:47:01 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4756778f015sm6552725f8f.31.2026.06.30.02.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 02:47:00 -0700 (PDT)
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
	Daniel Baluta <daniel.baluta@nxp.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Josua Mayer <josua@solid-run.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: [PATCH v1 0/3] Add support for Variscite VAR-SOM-MX8QM and Symphony board
Date: Tue, 30 Jun 2026 11:46:53 +0200
Message-ID: <cover.1782812572.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for the Variscite VAR-SOM-MX8 QuadMax
system on module and the Symphony carrier board.

The series includes:
- SOM device tree with on-module peripherals
- Symphony carrier board device tree with board-specific features

The implementation follows the standard SOM + carrier board pattern
where the SOM dtsi contains only peripherals mounted on the module,
while carrier-specific interfaces are enabled in the board dts.

Stefano Radaelli (3):
  dt-bindings: arm: fsl: add Variscite VAR-SOM-MX8 QuadMax Boards
  arm64: dts: freescale: Add support for Variscite VAR-SOM-MX8 QuadMax
  arm64: dts: imx8qm-var-som: Add support for Variscite Symphony board

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx8qm-var-som-symphony.dts | 488 ++++++++++++++++
 .../boot/dts/freescale/imx8qm-var-som.dtsi    | 529 ++++++++++++++++++
 4 files changed, 1024 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-var-som-symphony.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi


base-commit: 6d1a5ede11552f559ac02b31af03bfaa67f1e91f
-- 
2.47.3

