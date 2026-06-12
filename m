Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A5E38B13C
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 10:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781261767; cv=none; b=DN+leqdDEQIlDCGHhPZMTycDg+5VCbdwOo6mdj/fhAIROyGsfRLhb87Fymg+NRWa9C/lKhG7mLj4FquKgwSPAaZ3I38b/Zr/+3Wpgc0dgvFH0E5kjS5zz6KuT5BoOuR7wR5956Ahm6AuZU/aodZrxlIq3CFcOkZABtUAdNiRBEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781261767; c=relaxed/simple;
	bh=S/OHGyWk5LV2U9rbhDbzhVoexTBv/UEfi50dRxV4F04=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u9piEUMZoJW8N39KkJMDklSebEwjxoE71EbbDUhpEtJe9LH0pCoEn01k91OMVRIqNyo8PYfZ2Ar2XPOWdM+k6fFXqn71zhyM3Gg+b2k2tvP4Mr/IoDKVNPAZJpaC9KtYWz+TrEea0Z4HHsnGQotAErb5utqW+p0I//N8eRhudhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=bSSBHPbS; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="bSSBHPbS"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-bec49f7e35eso116937366b.2
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 03:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1781261763; x=1781866563; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3GED/bZKxrj+cOmGbidsM9t/QHR2Y/ZoMvrWHOWRa/Y=;
        b=bSSBHPbSJtlhxc1qw5Y5n4x7cGddhIslOBngyC7729CTQR8j7XAJOXYhgszsM4O94N
         XGZggM8FQxtFicLRhX6+gmhhhziym+jNwsJsDhyz7y1VhmWXcB+s7iUai3r1otj8UuuK
         hUqhxtw0pmp+RfZzV15b7Y1XrrTjWLE+vLgwEgCEebErXiu4SsoXAP9gTKVG11YPSyH+
         vrWO+2SdhWJjSTC5xUSCJAOSUJntef7Fpqh4CFaFiZyl5GQGYyBLscOkISfAsqx1pVbH
         dk2JPq5f3tZysQtGLxMYVKzZ4e5qM7xPhrB3SreI+rc3LvfW5w5U7SNuAItIfXVPssic
         xm4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781261763; x=1781866563;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3GED/bZKxrj+cOmGbidsM9t/QHR2Y/ZoMvrWHOWRa/Y=;
        b=RAqytlKcKgf7/iFTWy02V0o4WcxXb/d8DdE2IlL6KWfUMFaVB7ZOxB1X4QfreN/Ym4
         6/aC4bOqVB2mMbNQDDEy3HFewpZgapANppu+MN/EAbTlNWgoRiPX1yfn9bRHBqay9mTG
         m+/OEIU33yNhHiysWCeFtmdtZKy6KEM79aZ161O2TneuneP84q9T7/GTRH719qDd6qGE
         qq+WQxfGQu9l0mxorqxDw4IC9057WQ4CTNq/VYmjjQrmZcOtWxD5diY31OZZpjnZw2hr
         18fJiRUKfEpE8EZjkcMsXUqgTMuWlyTb+ZjVE09K87HjALeUtJk+4xa5PDUwWvnjou+P
         SqnA==
X-Forwarded-Encrypted: i=1; AFNElJ+ZzakbMTyJLID2o1tvpXRH6rEnA9eGeIBffPnHI+C2Ynu4ME2kAP7abBM2i+SVTGHy80QHU8TUh4Y1@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2zdTVbFpHqBDROTpFakslirXXxg/dfbtFQgip3xQZ5jNr57Qi
	R0O5hZ85SWiwloh/8nsjy1ID8LLC24t46c7K3zKt8dVViqXxyhvOOtE8nQZ9mxgWhKE=
X-Gm-Gg: Acq92OE9XeJI9N3ZSH9AtM81KyNx95GLj8jKbwBIAt8TY1avZHDiuJ+TeXOdWtpT0Fs
	kmOcQEMRx8L6SIJoxaR4dUgHytEHrGzhFapByZU5sEeFM97FX2bANLIB8Z6hFkUkkKMYVT7CeP1
	roU++uXLGiZkxUlZihS9Kh0bCEDi6JCcJWi2ze9RSSjSU80tmxEZX1YZgNQYfP4GUiR9iys0NVr
	fRKqDfkg+80CYQrp8xdnyhRS5ziByj7VvfxF8FRKRWoc5dAfTGyLuHiPZJk8hDgMpHDR3Qo54aJ
	HfhAf04YnE+lEG8byPWH7bKwshaJ1MMe9FUn4Ih4w1NDtYJKFP6M2Mt1mSXmm2IzzEzWv1YcORE
	/KQ+ujGK2ZUAPL+Au/wZQZTNn5G6xYIJ+BDiCnD/u6cCfqtDGupayQU4NQJ65Fxm6bNryOSpEUL
	AO4H9ZLqlXnCSzGlK94rrW7JymCEn5J5bFz7/iqOz3NOgphfD4M/81K2yWNQzrmnWWyCGQtTqD+
	7iYUAlYJKOMtu+GhDwHk+7dbNR7kCQ3RxhCpcNNnSSZjaHb
X-Received: by 2002:a17:907:2666:b0:bec:fd3d:4072 with SMTP id a640c23a62f3a-bfe2aa00d74mr64211766b.35.1781261763397;
        Fri, 12 Jun 2026 03:56:03 -0700 (PDT)
Received: from [192.168.178.182] (2001-1c00-3b89-c600-b4d0-bc9f-f60e-913a.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:b4d0:bc9f:f60e:913a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb8b23f8fsm91583266b.53.2026.06.12.03.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 03:56:03 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 12 Jun 2026 12:55:52 +0200
Subject: [PATCH 2/2] arm64: dts: qcom: kodiak: Add camera mclk pinctrl
 definitions
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-kodiak-cam-mclk-v1-2-fd294ff003a2@fairphone.com>
References: <20260612-kodiak-cam-mclk-v1-0-fd294ff003a2@fairphone.com>
In-Reply-To: <20260612-kodiak-cam-mclk-v1-0-fd294ff003a2@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781261761; l=1957;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=S/OHGyWk5LV2U9rbhDbzhVoexTBv/UEfi50dRxV4F04=;
 b=FdrlD65Tt+jQROey8o9bfFEL+Xrzd4VXeXPMORyYvZw1uA6y16rBv7K1/M3qepAm6F6n5WgYQ
 B31+8R+lEdyA2f3DOrsHLDGMCHb61spniDoyjLIUdnEgCYGV7XHSw4E
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

On different boards the cameras are connected to different pins with the
cam_mclk function. Add the definitions so that mclk0-5 are covered.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 62daef726d32..903937947811 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -6505,6 +6505,27 @@ qup_uart15_rx: qup-uart15-rx-state {
 				function = "qup17";
 			};
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio64";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio65";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio66";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cam_mclk3_default: cam-mclk3-default-state {
 				pins = "gpio67";
 				function = "cam_mclk";
@@ -6512,6 +6533,13 @@ cam_mclk3_default: cam-mclk3-default-state {
 				bias-disable;
 			};
 
+			cam_mclk4_default: cam-mclk4-default-state {
+				pins = "gpio68";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci0_default: cci0-default-state {
 				pins = "gpio69", "gpio70";
 				function = "cci_i2c";
@@ -6578,6 +6606,13 @@ pcie0_clkreq_n: pcie0-clkreq-n-state {
 				function = "pcie0_clkreqn";
 			};
 
+			cam_mclk5_default: cam-mclk5-default-state {
+				pins = "gpio93";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			mi2s0_mclk: mi2s0-mclk-state {
 				pins = "gpio96";
 				function = "pri_mi2s";

-- 
2.54.0

