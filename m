Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF7C517BC4
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 19:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788810036; cv=none; b=aZ5bEdjiLfGLgOAR06agCYm4ePhxiqRxbFSIkqdigp9GiC5Jq4VmsOyTK6Mu+xd9lIUJOoV71au6bUSRkDQHjLWpzhu/KsFbyvIXCXuTvRQK2wbXya5GAGle3TpphuJ0fLn1XafYUw6WVYj1CiGzPYstCeyHSNFObl1NIstr2VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788810036; c=relaxed/simple;
	bh=S1oBtUxfx51L+HaoM1uDY8wNWLzal8JzhXXt56gkyZc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dxs56Hu7TNmK8ZBPYjefdpaX1WNL8qeA/qw/UKwTzYlnP81u6kzfMBcjhI+bb8lGvWeScNjjmSf1bNgCxOuIUw/0BdxA1dDYWMbStrRNc7Wg7Qr0UbEsc1CWbLBl233wmf7xSiSOvSUQ2BvvvmVFo2pRsimPm6h3BZYD8+UNLTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jVEgcE78; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jVEgcE78"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d53197d8b5so33168695ad.3
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 12:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788810035; x=1789414835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UY5V4769IH4Ej/gBFK5P/RDOlj2xF6MyPqJ3qhvhir4=;
        b=jVEgcE78YH4qiQaYjGV7v7W8tZohcnSHjD9tA9ztHlVYoVnjrpYQ1XUQBWr7u/UlLv
         ExcSMv75bGBAfreysi//YIyeR6ss2MH49n9w98IpTVfm65HL5IGdqHlIGPWW0xbmT7WZ
         8vi7mPW1sD2M0KyhSt4ARAc/B6pCmf6bjQeo/oDTyG7ynI1JHWzSMiVxZ5QMOrYcsLmK
         RXc4Zprun8BMUCWH4yDSakRbfIDb33A6tJDYQnPvyoKTucG1deSy9CcgsSwqaQLbuagQ
         EXOVolypQOSJSGjAuME7YjhqAbukA0qAbQnJDaB8MhzzH3XFTQkq2AHymihcU4IgLDfl
         TDKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788810035; x=1789414835;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UY5V4769IH4Ej/gBFK5P/RDOlj2xF6MyPqJ3qhvhir4=;
        b=s2NEV5ILoOik2og1+ESkeQEdXEj2qSFUWJFABdO3RgmbTYDO2sImXin7hsZDfiYZVw
         r1MKeCPN96tkeOFbMRSaPDTFSxpmxInX6P0W8pRZNYZRYilDkvfS1HpUe3GAtQpXvm58
         1YB0YbIL5UslTKnR42kdfwsr4c0YiLc7FtRJg7HZngDdgJlzeCVgue6vMizoS5sOfQNT
         uTfvdwzwVDl0N9f2tt3XRy7dpRauac6TfRuFpLFlnvKq0M5hjWo3xKQ5EAVJVvJ4wtDM
         CmN7X+Y42b9RqSjoGdF5cyhuDexPhsovOzQp7ETrrsaw593/xYrvtwDtphAT9KtEjn50
         kctA==
X-Gm-Message-State: AFuF++k4TZuowix5EwLbMdHJzLroV0q1LPYEsRdXdrrYxDhAtY2WjQrR
	+dDbWenOD414lAPPY10DATKcexWxhjznVT8VtfUm/PdjZR+M1p6j5P1R3qwNNA==
X-Gm-Gg: AYBFou0PrlJEHmpIies7vU/g/iE1YDTHAgk/xsgcIYoJ90WBRuqiv5Zc1kxC0jJdOPe
	WBMoJ1eQBmy82SsZe0IRB83rR+DH3FRtZQpmfZYo5Ue/1myJIIarJaVJtahI1RE6eJ1XHylayco
	psnpQdDHDjHIwqxc8C4I/oa5bqG+g59VE92CfrxghVn90iZ/VgxfUN4/KVIw35u9U9M3GE81P6P
	r5BEuX52SCZpn889aVTjOG3XnGT6GUu+XKGyNjkHNXsLU5bDhOY6s8jGf+WrmuorcnBILkXG5Uh
	e4i1KfUT3fJ1ysG3qQ2mpqQTQqWqzGa54gCu2YCovazCq7ANsCnzGvlZwcKGIbfz3bYiiNVfP15
	NyUsKoSWHFVFb3lMbzDvf/zJuibmGc4F7q5dittM++NqIpJJM+Di4XnXJ3AEvRi3wuT17OsWz3T
	5b198yjgxFciymRFEcWOP5Fiu13DL1aHF+V5gWrqMxl7TWkhYJrlblpQEHUXNBoxwxtrUpIIED9
	zO2a1pz0CRkhHq098Wm1WPN3wwrCNC9nKLkOR9r1bhlyW4SmxcSfq3JHysCtyIXmuWStLMJArJt
	w0scu9Y1oHpSTC0ZHi108+1iWdAO+SoI6UtsW0I=
X-Received: by 2002:a17:903:22c6:b0:2db:7269:38ef with SMTP id d9443c01a7336-2db726939a1mr31543325ad.14.1788810034741;
        Mon, 07 Sep 2026 12:40:34 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1497e9e5sm47901105ad.38.2026.09.07.12.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 12:40:34 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: BCM5301X: AC56U: add nvram node
Date: Mon,  7 Sep 2026 12:40:32 -0700
Message-ID: <20260907194032.20042-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add it and set for gmac0, which is the only GMAC used on this board.

nvram size found from a random bootlog online.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts    | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts b/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
index c80ac16ad949..550cc67f5ba6 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
@@ -25,6 +25,15 @@ memory@0 {
 		      <0x88000000 0x08000000>;
 	};
 
+	nvram@1c080000 {
+		compatible = "brcm,nvram";
+		reg = <0x1c080000 0x180000>;
+
+		et0macaddr: et0macaddr {
+			#nvmem-cell-cells = <1>;
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
@@ -92,3 +101,8 @@ button-wps {
 &usb3_phy {
 	status = "okay";
 };
+
+gmac0 {
+	nvmem-cells = <&et0macaddr 0>;
+	nvmem-cell-names = "mac-address";
+};
-- 
2.55.0

