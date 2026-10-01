Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D070522F1B
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 15:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790870072; cv=none; b=RZJTJYIP8b9L4BSKHvzSIhrVJ3cH6Fj8JnKhI1BUtS2Y4Fa1B2EI8b6fZT4Ok5rUC5OmvYxZTFzdnaVjU2M5g1lIC94a5Ax7bBRZnMe+L0o+QH76u/2qYBG6tppSLLzeYixQ9HYHauamwkUIAwPe3OntPMyhHXIvEy2dZ8JiXC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790870072; c=relaxed/simple;
	bh=rKlCQm13/lVSoRcoMYle6T204+/T5Pa4/yPg7USLSQM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ccHwC/AVen960J30FLsFavia2DUhiX1beXp9FAcFV2YdiRr6jBMEhGjyd7EK9fEWbIIkmUJVOli/2urhthCAW8d+EJL1PvN+5pEaHn3eVH02gLbTSw5K5LGe9am6FToMKXMI96u9zSEDJqAQ9zmuau+eZZE9VprRsYvGY98kLQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zo49IjM+; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zo49IjM+"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48af929e59dso2139630f8f.3
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 08:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790870067; x=1791474867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Elg4CK8BHPTlS8KGlNqB5v2UOw1qnjW/5zGPlvDhyVU=;
        b=Zo49IjM+FJUumbqlcG/zNCdt8xNt8r5MwkE9xlGMihEMXhYKi4BgEbSeOoxv54zqAo
         uZq0ClpPcnfsw+jsQ1NXxuzZbEqPMg7+pToTYBhHOdkICaqoOTAmZKnL611ZEtY/15Y8
         syY3GvlpdoKLKwEyqOQpfwuE7/L+iwpH1T+DawIpc/9yngBo+tWYjLr8ngOmA45Os+E8
         N2clwD+ClQEQIAqPgID7ZYlSv3F1TgajjLUKOvCLhQSEGSKr+B5uEU+3gl2ZS3omxL/Z
         NIWkuSSirWdA1AYbwT2xA6Jc/1iBOXSGj6XCNMf8fFTG3skaPYnD61BLtnJk882Ku3LV
         YMlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790870067; x=1791474867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Elg4CK8BHPTlS8KGlNqB5v2UOw1qnjW/5zGPlvDhyVU=;
        b=UXHivN+c8UgHgr+ozGzPYjoWyltwrt3MQqYew+Z+O1Ky7sbNwvtlVaBzTlNZXnb1AI
         TZ6owdCOl1ykh8Ct9wisFKU1Gi8hTk+hNfvv1G6ul2IqmJcA/navGbPnHKf3Ze2PmN4I
         +yGc/JM5QKLTy9mpkOLhOjWlR0WtiY0mE2+8/SXLtp9RJo919/In2BaSu+mjL+t6viOi
         a72K1v2iSmd/GUw/gEgnmXIRGa+YLEH7iJxNdGAfn1lDr8qBvmbyV+7mAs6xLhDeB/nR
         gGzlJWmbyE9VMEcfzc7HQulizi5HZswDA6gJ9WL0gzkztJSDMX0L+mFRDzEurPIfoCDd
         LCoA==
X-Gm-Message-State: AFq9FYJUumfRQpJQIedwRFacGnPpV1eF9EUzfMRg/UA+865HB3P8pPdI
	MMnExN2cILDxrta7rzRQ5SpqmSJBy9mVrvzGvdn19M2LyVe2db51TSwL
X-Gm-Gg: AYBFou2mnArX/QJm/XQLNsRiC1Go/+Aosx+99WSJUNC1+nAOxFrFCpxeH+lO8LTUC4U
	8uL+kYNPn0wvKeSPEt6IssVD75ZlOfVV1U3CbA6vxiXMQGm7IRSx5cqzHBjDOG6GGXeGRlCmeAE
	DD7MxLqoUFEbtICCyt0tirPoO+NE/iVUabBuWGKAPHvUKCOwRNkP4O9EPWMsNpU/Iq36YGYnSfl
	zmsVQEKGTVBddFU1ZZhU1VW/ArwLFox3IA8jnFxT/OL2UC1WEuU0AJMJPBrhIt9X5Vau+RoeHca
	QawsIGSKIiPyTHTfSV5VRy11JeS778RpbzFTJ1Ka6IT9ulDJD9X60qgwUtemSO8ASzzPGpEEnbR
	a8kROAaz7TZr/PDrx+gQ+HfkOMJF61PleJ3zwtM3zkeCnIWf0sNauJRPE8h8GE9brJLZP8O4N15
	BH7WXL+vmCDlNQtametsRpRJSyRPLKsjyNOzXYTu1tq/XcY5cqSnKds90rpQnrcON+i29WSRS8G
	LMogOnaYoBgGDL5/F6PxKwfT1fMEtEkGA8zHZPXe2Y4osjNPtbhR/J35VSGUo2CCYI=
X-Received: by 2002:adf:edc2:0:b0:488:7d08:edbc with SMTP id ffacd0b85a97d-48b127431dcmr12700f8f.24.1790870067132;
        Thu, 01 Oct 2026 08:54:27 -0700 (PDT)
Received: from leonardoc-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b068ff6eesm6517294f8f.11.2026.10.01.08.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:54:26 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	francesco.dolcini@toradex.com,
	leonardo.costa@toradex.com,
	hvilleneuve@dimonoff.com,
	marex@nabladev.com,
	stefano.r@variscite.com
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] ARM: dts: imx6q-apalis-ixora: Add 3.3V_SW power regulator
Date: Thu,  1 Oct 2026 12:52:52 -0300
Message-ID: <20261001155412.3177428-3-leoreis.costa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001155412.3177428-1-leoreis.costa@gmail.com>
References: <20261001155412.3177428-1-leoreis.costa@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Leonardo Costa <leonardo.costa@toradex.com>

The Ixora carrier board has a switched 3.3V power lane that is used for
powering peripherals. Add the correspondent power regulator node to the
Ixora carrier board device trees, similarly to the already existing
reg_3v3_sw node in imx6q-apalis-eval.dtsi, so that it can be referenced
by peripherals that require a specified power supply.

Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts | 7 +++++++
 arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts      | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts
index 3ac7a45016205..f6eb2eeee417e 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts
@@ -57,6 +57,13 @@ led5-red {
 		};
 	};
 
+	reg_3v3_sw: regulator-3v3-sw {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "3.3V_SW";
+	};
+
 	reg_3v3_vmmc: regulator-3v3-vmmc {
 		compatible = "regulator-fixed";
 		enable-active-high;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts
index f338be4352779..f015faf19199f 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts
@@ -55,6 +55,13 @@ led5-red {
 			label = "LED_5_RED";
 		};
 	};
+
+	reg_3v3_sw: regulator-3v3-sw {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "3.3V_SW";
+	};
 };
 
 &can1 {
