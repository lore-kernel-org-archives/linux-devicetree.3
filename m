Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3783B4EA9
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 08:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786091532; cv=none; b=O0MNNW+94fJD4Rg2R8kGZkfdAodp4GCO0XZz0jZtGTTomRry/3tdxR7FC2PNxMcI5cXtOwEyzfbTH6E3ZR9pJapZ9PmnxlMUqhpGbND+5/NIMVQcd9gwykEqOA67L4fZ1xb6FkTQyM56GCatXC/aGgR39wqhBcwaveLm7F2ir5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786091532; c=relaxed/simple;
	bh=V1tCqV4rRAIbxTQt8lC4Qg3MIH/+M0OafDA012y1LiQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IBFos1lAotPZNJfmohjl7c1/62qhbNtxQGtyupAfRB5fh/j5oDljx9/LEPG2UmP2HU1EmqBTU1h6WxNu0BiN/xCPSlNYJes5IcuHexTw8wTy9RzRqMM/YVGyYZJ2RDTtb8hM3oe3+OQlxMf2LNEgD0fhqs5uoLvLQgym60aMwLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gWcUsZgG; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gWcUsZgG"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-84867f07d63so3701792b3a.2
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 01:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786091526; x=1786696326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ixpqFwpYyvhO6JYNSRkqWZf82rMGmiosNWxtjl84Sb8=;
        b=gWcUsZgGfSTBhpW8Zmp4uxZEHQqiUJ3OpbxdQ+wGi970ANqcayjde87U06La69af8m
         6Pp11Z2lRY14EIhpi5QTvS594rtwiJr+WhXsKdOgvn5ERcWkxG7J6+q1Xc+dc4XWdfHh
         pXbrMNtfQg3yFIttJqAKJ6+/30dc3+W/C2wBum8ct1BmejYbs0Eqm6nRQ7/T5grB8Exm
         Dtirt7Us4WKkpqYRZ2ZQE1vFtrl3KnSMoULwf/dY26lAdPk43nyTHJcA2eAUa9Hq2Dog
         kjI2IV8XFtjoimgkzQamzB3uctOwzVmrGQj/cHE4IpuxfhUIO2+vGcDvTyuvi2NOtlJR
         VO+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786091526; x=1786696326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ixpqFwpYyvhO6JYNSRkqWZf82rMGmiosNWxtjl84Sb8=;
        b=IsK8JDZeDl94IyxxgkXI1MzDbgBJ9qWhqqZw3ypWp7x0cojp3ZjIkBIsUtzr8PZUbu
         3eEGMgXsCL02wxjmX9ExeKUD6gdOJsRrcUDjviBRXQ10a3fKIqOygv1vRmnkAe92FtDr
         o03jZiHgwOnuwCF6I/cVeeKIWzuJyLcV847e6MRNO3Lz9INY5DNNjV8TWfdkCrSvJALf
         Bk/oPoDPUBmyiGDRBjlh/Rp7H8rOVxtBtxH6RfdfTR4S0kh+LAJtEVW6m29LwL5pWEMT
         AX31qlRzOHErMTqMFuxTm0cXamsbkvd4cB7D2uj/8PXDBjmWklyldkME9xu3cyH9Ih43
         biOg==
X-Forwarded-Encrypted: i=1; AHgh+RomdxdXl19TIunhTwn1rmfPJ7S1C9JVhiJBuWHQZwgi2ZaHSV8tQ9VSyISXFWfq6D0vaA5dn6NvhC3n@vger.kernel.org
X-Gm-Message-State: AOJu0YyWwNhKltvqqEPoLg/9DfOfV2L5SO4P8wUAvsZmNWbeL/sOVUjy
	e9Dh0rUlQTxRQW3ecUmaZCSc9b1+71oLNTehy/0GMVel9JDBE8WN2Cxw
X-Gm-Gg: AR+sD102sx5oiMviLokLj0QF9ogozWkXJbzRLK/X7oWbSy7pZgPiOCio3BFBg6K1SNQ
	1y7QCWUBA8JoP1gkcyUBDdPOjkTGZ+KsP04986zjvKulwZWOr9+FocJk8lukH4ALukFqK1tprFh
	MXntGmXYn6Kp6iugdq4ucz9kmxD50JNPps+mAnzACp8yoYbo1jzoCkFdzdy38GpeJ4xBB8gGAoK
	/UrPRhF/O4NzPJ5sx5TDHtCbh1EZRJ+rfIIukIKqefSJPA3ZgaZ/jPaNsw5mQrRtfxVrRPAPozp
	xe/TlUeDXPUVlDI4g/aJZnJKxg8BnCqmsVgC7BWQH8/5g/994nRB8MbJl4HF6WYZ5npJYzLgGgy
	xZSOgAd1ho8BairmkS47KdKja+CO3qXLLl6/lUj6EO4U/D4wc6s/gasI/BU0gtWkXIr2X8gL1vS
	DviwJIDCfA4V4BQ73yuwfRAHjJkPZ+15+D9tIDdD9u3RCyjIiade1sCH8TTJc/3PrjGfCF489BW
	XvkSGEtxOIGbNorMw7+zsgRqCUXnQTfLg1Af3OyxFyyZPlJ5Q==
X-Received: by 2002:a05:6a00:c93:b0:84a:29a7:f650 with SMTP id d2e1a72fcca58-84f2de6ab12mr22053575b3a.0.1786091525621;
        Fri, 07 Aug 2026 01:32:05 -0700 (PDT)
Received: from fred-System-Product-Name (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a553071sm627409b3a.43.2026.08.07.01.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 01:32:05 -0700 (PDT)
From: Fred Chen <fredchen.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/5] ARM: dts: aspeed: santabarbara: Add SGPIO line names
Date: Fri,  7 Aug 2026 16:34:07 +0800
Message-ID: <20260807083415.672008-5-fredchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260807083415.672008-1-fredchen.openbmc@gmail.com>
References: <20260807083415.672008-1-fredchen.openbmc@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Label two groups of SGPIO lines.

- FM_MCIO_[1-4]_THERMTRIP_N: thermal trip signals carried over the
  MCIO cables, indicating overheat on each of the four asic modules.
- UFM_READ_CMPLT: asserted by the BMC after it finishes reading UFM
  data, to notify the CPLD that the data can be cleared.

Signed-off-by: Fred Chen <fredchen.openbmc@gmail.com>
---
 .../boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts   | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
index 9d334a01d407..3d35a5a74104 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
@@ -1907,7 +1907,7 @@ &sgpiom0 {
 	"MB_SKU_ID_3","",
 	"SYS_PWR_FAULT_ALERT","BIOS_DEBUG_MODE",
 	/*H0-H3 line 112-119*/
-	"FM_IOEXP_U538_INT_N","",
+	"FM_IOEXP_U538_INT_N","UFM_READ_CMPLT",
 	"FM_IOEXP_U539_INT_N","FM_MODULE_PWR_EN_N_1B",
 	"FM_IOEXP_U540_INT_N","FM_MODULE_PWR_EN_N_2B",
 	"FM_IOEXP_U541_INT_N","FM_MODULE_PWR_EN_N_3B",
@@ -1941,7 +1941,10 @@ &sgpiom0 {
 	"I3C_MCIO_4B_ALERT_ISO_R_N","",
 	"","",
 	/*K4-K7 line 168-175*/
-	"","","","","","","","",
+	"FM_MCIO_1_THERMTRIP_N","",
+	"FM_MCIO_2_THERMTRIP_N","",
+	"FM_MCIO_3_THERMTRIP_N","",
+	"FM_MCIO_4_THERMTRIP_N","",
 	/*L0-L3 line 176-183*/
 	"FM_CPU0_THERMTRIP_N","",
 	"FM_CPU0_PROCHOT_N","",
-- 
2.52.0

