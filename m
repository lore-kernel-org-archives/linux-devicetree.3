Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795078524;
	b=fA1p45GYuGTrtUbdrHWcMHdk9ykDxVgZ3BbbD3SFv55p/1m/dGYoCcxnBvTq+MKTBvIn
	 S6LTGhGwBnyc/76pajdCl0wjg+9RgERXMAFokUgTPPuy59m8FNxWHqS7imzWY7I/NLg0I
	 r6iyuYNwP/FIvkpRyLfeYYOrUGrXbthIlTE3o/1NI7prj16j19zY4p74nDcs4iH6/mETP
	 UXsTKii93ZV9MF6OeYZNFpme7QozvKgO88v/J1o8+ZiLVSMSLajOpbj+fIxwerSnC0LNi
	 6MoOoty/pcE8+gBUN1uLGY0+JXk3fyWhcHT/6W774dwdlCNEp+EWcYFDyoRqt8Xw2gA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795078524;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oVnSTbltEKzZ7TazraahyXbMXLICXbVMVZEEQRtY7Tg=;
	b=F+5UNvNPXRUC87oSXEsmWVVIPgJ896Je2EyrCie6QGWC9EBBlcuCtOuGQ0u92T477fcy
	 II3PXro9kaVjK84uYfwn+hu+3mf9fImP7D6H80GyEUSUaVowlKX2t3LJeoDRGYv2ZHLp+
	 WddWlPJtyCzcypaYZRNJGX4k1cyNfEQJNqqAoWnH7mYEVcQL2OMF8B7l+6xH/NdkJ1tBX
	 c1gnJtIXkSDuuKvE7sl7qibyAHycq+slKXlxMvPBEAlzXqK9q4wuwNE1dhNiQrjl8cvZ0
	 kDrEnpZemX7OmrqI3wFrwGW+jUE4o7HUGy41VabM64SmbPMN1vOv5hHAbGNVXst4ydw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j22xjTN5;
	arc=none smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7AF606A337
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 08:55:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC7AF606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j22xjTN5
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-55c38cdd5b7so24985441cf.2
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 00:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795078523; x=1795683323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oVnSTbltEKzZ7TazraahyXbMXLICXbVMVZEEQRtY7Tg=;
        b=j22xjTN5TZx132GVphrKHfZLHPA8U1fROlWOmGcuiOIfROIcMvu0NM7BMmp6AqGXZG
         W9lTxT6F/XeM7nlFSz1XELU5I6QyMC49qh0hojdFNZx+L/H1+YcAgq+4t3/jMKPih5iP
         OgbH1jAzaf/QFqavHGJ+1yC1T07ttAZEYs+lifpShPs3c6feDuGYZHuAhdtE0UYe6w2q
         o2+/uqYqIxiEBS5QOquiVdbuwiCmRuL6yneb21uHPi5okpJvVkxgCNCYiEieIm+Ej7zp
         WhvVu4qEW8GUZf/XBNDleO2W3oCQUp7XO4c4CBP7dAxhWapmovE/aB4BDi52VG4lW+Q8
         66VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795078523; x=1795683323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oVnSTbltEKzZ7TazraahyXbMXLICXbVMVZEEQRtY7Tg=;
        b=ODs4nMq5WB3LrrYSTnIClI4Vjf9k8dKwPYtOJePKbabaAmaKGSOna1SyHOcty0AxJ2
         F0RwtCul6FMXF+Bz4IYh7WzmWB/3V0jSRDadaH8XEXzXyMNK5s8lhvm/9vaHgg7S9usx
         CuzpYyms8Fdq8BxJCWSpWd9AQuGEEvxneBJ2EfMDdCuajGzCgVFjSQUFK4F7j9PJ4GLa
         yXq32BFgtwfOdHglMeAHM/SGtFIF0CSUyb8CciYmMkRdP7uKspS53I9UHjiJ5l+KGURa
         233pIezV0c9SvN4Qo7yXnOpxBRHwOzB1uPga6veJpyljuNfCCqIqRD43nKIJa63IhulJ
         m+AA==
X-Forwarded-Encrypted: i=1; AL+hErGGb+aBtsWof0DnutYulqUaf/O0nnIBn2jF1c1z1W4zv4foWtuBDTiB1qLww+3RwxWXbLJ8bOBSLwqg@vger.kernel.org
X-Gm-Message-State: APuU4Z8pUTMJ5YJqmafAgJHn0nscQ4zXVQzxsn51cNGbSE6Rj7JUkNXr
	wZZs3dr2g5QqE9B4bNFXYWiG2DpjKUBeL81jqY64Rf2dfJn6sCIXHH3t
X-Gm-Gg: AYBFou1cQKw7dMZ6gTO8RUW3ah6sV3mrf/DqjEvNKJkWBnGI/qfDbhCwJ1j+7L3Tt66
	K2U4E9cOzV/9opEHR+9Wv3fQSVMMNZKcfbNQhbeNcSUEMmHb1f5bSa+28BBPXxABGrven/BU7vT
	EiQXQIjA/wBDW5DWrTpzKIlgnRyk1h5YJtSGZ8u41xVXXWD036XBRChtQY+f6HWOt3lgpFqQp4M
	CJAdaWUvL1UrjioJRdT2iCNqxDBMOOEckpBWMUOgXg3e37OmxBeLhjxUatMeyE/7EtTh3dlU+qP
	8HxE8b9ma2vAnBcKpyxYTIku/kwRIbmXq1o3nzlx8E/13mi0J47hm4OimMfN9zusSPxCnBhL5Ih
	lkZFw+KIucwPpPdQz9Mv0EESBxjfo4AJMEfVEiQLoPpxR3uYV+i7+Bg9cNAIYB7hoRQ7qeRIuj7
	j5gkIqB2Xt6BX287JKnOu+NFgx93YfyUtGRNPcYxu4DxXk203L0QbQFFINbvxthU3INJvfpUDfJ
	qVgc8mdQJoMrwR4wx1nO/cZOZcuxvY+b2q5FUCOw/Lx5RfpvYE/E29rAFV+YWeTjBVgl1cMBthH
	/gWa12Ogya99IePoN4aIJvz/KnbfobN0m/2jOAJ7LG/3VpEto4dxBlAI79cjkH7RONbQtZOvOgX
	hVHFbKTJuFTivxpndFeWogWq1zO4Q/ZbzvMzaAC7JB2FyDukrS9HwxIvzh8wNvJsh4fBRDPFw0l
	jZ4g==
X-Received: by 2002:ac8:5d8a:0:b0:55d:591b:ed78 with SMTP id d75a77b69052e-55d5a699b03mr85930401cf.55.1795078522885;
        Thu, 19 Nov 2026 00:55:22 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66bcbeabsm19578151cf.18.2026.11.19.00.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:55:22 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 06/22] ARM: dts: BCM5301X: EA6300: specify switch
Date: Thu, 19 Nov 2026 00:54:36 -0800
Message-ID: <20261119085452.75708-7-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119085452.75708-1-rosenp@gmail.com>
References: <20261119085452.75708-1-rosenp@gmail.com>
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

bcm-ns.dtsi specifies a default layout that is not correct for the
EA6300. Also allows setting the WAN MAC address properly.

The port mapping is taken from OpenWrt.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../broadcom/bcm4708-linksys-ea6300-v1.dts    | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts b/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts
index f8dd08cc7cca..bca4c440a499 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts
@@ -59,3 +59,40 @@ &gmac2 {
 	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
+
+&srab {
+	status = "okay";
+
+	ports {
+		port@0 {
+			label = "lan1";
+		};
+
+		port@1 {
+			label = "lan2";
+		};
+
+		port@2 {
+			label = "lan3";
+		};
+
+		port@3 {
+			label = "lan4";
+		};
+
+		port@4 {
+			label = "wan";
+
+			nvmem-cells = <&et0macaddr 1>;
+			nvmem-cell-names = "mac-address";
+		};
+
+		port@5 {
+			status = "disabled";
+		};
+
+		port@7 {
+			status = "disabled";
+		};
+	};
+};
-- 
2.56.1

