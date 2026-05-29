Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D59B3C7690
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 10:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780051975; cv=none; b=ay/89+H++mv42qHKsi2xOkKb3IAkuufpDjBEuN3Hlc0GxG0IqwMztIpm6tlrAa4TRGVYMuFPOwav/Pru3KEunuwpdPUPc3J+ftU+qDqcpenPvp+RV7i6Z0vx03vfMmRcCOJOF9eSDo8CqAir9W5i6ri6TtnOe2UKY+x/w2USlm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780051975; c=relaxed/simple;
	bh=1x3vnUCnjS8a4R79aThJypMCQj9fwOnt1ShYkpyxugY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cezm7IUXb7Y1fYx+JydeIaCDvJ0uGqc83b8DbXx7gMHI6+geAU9A4Ni66Ycz8++wPNrnc7iG3mBRUI39g51fdhHMekwJ7vcGftZikSuWqrOXj+89TBcBKCRJ45L/LSrIdnW/IW52xrTdHK2gVCC+PUBKcL7/uLlDMZP4dvA0r2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YjKCeYJ0; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YjKCeYJ0"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-45eec22fab7so862204f8f.3
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 03:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780051973; x=1780656773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JfF+RXqoejGgiWqoKcAHP3fk5A5vKuoY8Cwpe8kKlEI=;
        b=YjKCeYJ0tAmzoNmgZbYIt+nYPxFRRXardMd3J+NuLEyrmK9HmNBkM0KOmSXW+qJJR9
         Fw4cC3Y2bkAQAYic3a6pq74DlDmCbqTI8pLJvFsdXnVb3zqRtS24fzgh1vg7JbdtXaxM
         2xRlaiH6cX1nU4Kh29rbpid0yRlrCxYnhqsMwdkkwyRF2pUlcm2GwpqUpzxARx+fXGY2
         1Z5rbluwcoSaEH/cCt9kifkRIblv9+1uFJzRsAWmUKCbjPku7058TX6UxAzCp5LZwKky
         uo/zYoOQargLjQqzQLs9KV+0AC6VSh4/Af0iHAlYXByXqvKMM+2kHI3E6nKHNKnOOT2/
         ikcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780051973; x=1780656773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JfF+RXqoejGgiWqoKcAHP3fk5A5vKuoY8Cwpe8kKlEI=;
        b=WNhjF2MFPSKj69Gp9j+sDn5SoKBh90nlTZ9Um4Xclm75svsdpN1ViISk6mJBWHeqTG
         /197SpklM0lwiJpRsRv5HRuYH/zQHn/IlpfY2GuYSM9sLSm4UmlGMe4Yvkj3ql180J9/
         +oOX11McWXwIE6yAPiCkwMDNiH1ijM2EJHxSkXHA9kabjYplA4Q19i5fNMaBq2sAm224
         zJ80zpV7fFGKtWXQl7lYO/qAWCJVF4SQ5iE6J1tjKXZIDr9CE8/yuxtRRiHxR7pPReL+
         ONoTt5OB54iWVVLdZcMFpfNi5uhxUU7pOVGjky3+uF5WboUBmvb3aXIHwoWWLb4OygV7
         mwJQ==
X-Forwarded-Encrypted: i=1; AFNElJ8n7uuvEvD9B+CkA//M9jncl9Bxk5oFb0mJb3u+aooDWRhFveWsQHBaZDdj4cIXD4X4PxpwyQLrFxL7@vger.kernel.org
X-Gm-Message-State: AOJu0YwbP4EMSZ24e9g6PHxFXlx0yhABJyabJQzWhWlRHR+a5n9pcDi7
	apPzyut3ijc8wfgpAzHEkFvbj6HcotVAPnfaJgOvyBkjh0i4jiGHtJyE
X-Gm-Gg: Acq92OEdIvsiAUREhdT5s6vCISoYBlJUjLztZzBV6pif/dR0+z/X/lapsZ7eWKp7GEw
	bLYkeqEUN2f1yYLX0YXnDWLmBNyqiUMdzg/6n0QYwHu/K9qviOA0VdfgMxNbeB/kDkVGnSRNLpp
	OT6RiSsTJ4dSlVecLEzRPJJLvcbzOjOgYGUOm3MknaKrmeqqlLzPu+Hqn+LiPacEifwNK57WJcs
	WfnCw6rWhCn4hTV8B4+B+OB7fmcut/+hfmIBffvEb4Ksmj67lKi8qJ7J7GKcBVf2ZImYIMX4eBk
	yFqHP79CwG4vcm7obBeg/NcmuQKDdx8eSh71lCJotINC/c0Lj1K7A3CNKj5A1XWarF7RbGz4/3M
	lgYlns3ArpPTaUP2k+MoOBlMTB7cF8okSWulk6+TJ3dXGIjEjAdt9zuovoBC7UWiaK0mrymRHIW
	gNPKjv2qTcB+Q6T3KZKY2Dg4mrtrxh/H0l5AHIzjPREyz4kqQVERK7uk7BmPv9dbssCLtXorfoy
	8cKCH+qBRnHS5jAHhol8uxdDtRBrOYEjCLo3gRO0jdOQs0=
X-Received: by 2002:a05:6000:40c5:b0:45e:ec27:b4ad with SMTP id ffacd0b85a97d-45ef143eff4mr4491582f8f.24.1780051972829;
        Fri, 29 May 2026 03:52:52 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.dsl.teletu.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34a090dsm2541596f8f.3.2026.05.29.03.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 03:52:52 -0700 (PDT)
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
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 2/4] arm64: dts: imx93-var-som-symphony: enable UART7
Date: Fri, 29 May 2026 12:52:45 +0200
Message-ID: <d7cbbae223dff7ad797b715d34eb79db9ee54203.1780051874.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780051874.git.stefano.r@variscite.com>
References: <cover.1780051874.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Enable UART7 on the Symphony carrier board and add its pinctrl
configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 .../boot/dts/freescale/imx93-var-som-symphony.dts  | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
index f541308ebf6b..f313f168cfb4 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
@@ -35,6 +35,7 @@ aliases {
 		serial3 = &lpuart4;
 		serial4 = &lpuart5;
 		serial5 = &lpuart6;
+		serial6 = &lpuart7;
 	};
 
 
@@ -310,6 +311,12 @@ &lpuart6 {
 	status = "okay";
 };
 
+&lpuart7 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart7>;
+	status = "okay";
+};
+
 &usbotg1 {
 	dr_mode = "otg";
 	hnp-disable;
@@ -446,6 +453,13 @@ MX93_PAD_GPIO_IO04__LPUART6_TX			0x31e
 		>;
 	};
 
+	pinctrl_uart7: uart7grp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO09__LPUART7_RX			0x31e
+			MX93_PAD_GPIO_IO08__LPUART7_TX			0x31e
+		>;
+	};
+
 	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
 		fsl,pins = <
 			MX93_PAD_GPIO_IO18__GPIO2_IO18		0x31e
-- 
2.47.3

