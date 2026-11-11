Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794382316;
	b=vhkOxRuZALICg2yqu77Ov1fvB7xDm8Kg5vl/V/dBMsSnoTRHM7dlr+Y4LlmXsUF0v3fa
	 HfnGOeSGHP/+qsp8+oz4auEvdqQPJbrzZ16gJ7IjI1MiNjZI7CEEvME78QtVIFliTlQ09
	 7Dl/z5VcnUV+0R2z+i0xGNTTiUOvQY1HRG7YY4WhKWX+qFhJAmRG+ZDOqKhMgCXUGs9UD
	 f39BuR4NVVCZPxHxOd2kwUYY6X3RIE1ZSOVlXnfD6J5Q7YtUPISqGRPKySqrckwLSdCTl
	 P03MnXVkxZ27bmJ/rJRhzBfd/z8eXava5IcVJdbhFVrrsVPdE+n2e/KaDF63Zq03eDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794382316;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=C7z8/qe+AfvmJGG4y2bRYtRiZGRNOq/Sl0ivxixfInc=;
	b=DB7yb01aXWmyfeiNJ/tB44g7CqGISxSr5nG3g4ayrgZXQ9J8q2ORxs9p33zAbYotqInN
	 uWWgGuIv9e3vxh3S20+a3IEmieACLjhk95TPBd74q+dBJoBqAwokruFFOzhwPBiHRvGg+
	 pk4ME4iWqWFoExcp++BkOQ1xckXH3xoXUfTTLMSwBCf9YX2Q8FJpwY/quwN267yollESJ
	 /6goh8JIANZVWcIRku8m8ICYrHjFjj6nsyPDbjXlM0nVPA4VZNiOvxkpV5T0hhSOSNgK4
	 0m9NnlKhI6PqWHQUw0D9Xc2ESYYZnlz1Y15X12z4TBH4yDNr7B9mcJ1r1pVN8wgrPwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WEC2sk9b;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3385760A3829
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 07:31:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3385760A3829
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WEC2sk9b
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3720addb068so5266300eec.1
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 23:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794382314; x=1794987114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C7z8/qe+AfvmJGG4y2bRYtRiZGRNOq/Sl0ivxixfInc=;
        b=WEC2sk9bZoSA0aHvh8bTBuuU4M6coFaD4OT396CaeqfwqYkgvmSrpYUXI5ZKF+k6mW
         ZHfBy8AEZSfptKFrMT35avYPKRVBqOzQtQjF0+u6q3GpT+2IwXsCRvlL6HwkYMqtYo2E
         LiuDVF0nRctc+Imgm8XBMBfl8BbmUwCgnC5/SmS0syEwoZbDeuBRj/MTfmqth3U2XJj6
         FF09k1O+J9AfDGDVtH1FOospmuB2+W9hZYnRH2D4IE76p10HhqczwozMJf0zoAebm8XA
         mQK9htvFCrRbT2cUUK/vmA+2ANr+sK1rDL4ErcnwxCc/zrLMbuy0GMdR2qHA51KEPEUr
         KroQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794382314; x=1794987114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C7z8/qe+AfvmJGG4y2bRYtRiZGRNOq/Sl0ivxixfInc=;
        b=oBPeHm3XJa9Nf1qPtYvLj+JgJn426SHVw1FmcGZ69OVKSAenrd/GKiFsOEbbTSOB8Z
         0gO/V2EUEvkbHnSEshLZQOtw7uHD3qpdEn25JjQPR3YNnqe6ytUETJPSUSvrDOCKWj1o
         7eujI5sVcHqTA4uxj9+st/OzgoWlZE4coLEdZENGtqSgpK5KMwTq+uLAjVLjynpt4XhQ
         QMWrfDx/3F61A4e83tR6nLFruhkQZhpyNk61LE17LvfsS8INgKd1yKItcNkkszegfX/o
         daHJH9aT5qekl5B2Iqk9B+NJMAklu3apno3KzovmkvBUh88npJuweDLkQxUAgZ+RuvOR
         YzjQ==
X-Forwarded-Encrypted: i=1; AL+hErFJ4fwuI6SK4MF5DN8c2sAQLc8s/4xp2UarXTx5eb0e0tqnRpDTPbv+BlunhUEh9dcbcXQOjtbO5xBZ@vger.kernel.org
X-Gm-Message-State: APuU4Z/alzC2SKYc5ljX0iHWUWtZlqu8rcoyR3GTM0FWKJykfuNZ2Ieu
	YcPjjXd6wfAsfVn5LqND1z1DeAVZQQKNPaa3qJXd8OkzbWWDt3n+1IQr
X-Gm-Gg: AYBFou0X3LKIt3iiY9pF9W3NAZf2OEGWDaZtzHHv6HZ35FDIgyzhR/lrOhoRTSNjkdW
	ULkQeCOK9zdOl+dWxEPDGYYnnkIaAKcrCX/dJNFvz95PtlnLZ3Ewgz2hj8cs1x4iiJIL3Rth9XG
	jZDSLuPrwK+xukobFzg/8dzcaT8WFKTy20y8/4NGRY1QGno8DxBE3uOg6qMZEvbi7yf9Qkf9xbY
	W20cervOtlX4Y0z8zSZv6+jucBs9ohx35ssHGivxdEoqyo25LSrTrAWweVwz+T05P4iKK0x1gZP
	P3aOkxSZ2B5azmoPnmtlmMgf3XMjajvcKAN9UkneEqVqjxh2JHKUWaoDW4ZgzX5VfourUq6Wsnr
	xPDLaW1Iis6fiiwNv+uYX2DvbL5A6sYtkO1O4ubJ+usHshHDBbufo5s3RSvjsm2A0kNyrBjuBnm
	Xy7rnwSZhn6GxL6w6jTDxOAzHz9lGSfSc1ELIznFGsgEbcBxtAfqdSRtzx6J+QXEEYt3bpdPrGh
	0T4rpq8XDKY9iRQfJ+qHG49JaZQixka11XZprXeCA3q6PeDJow2P1BRoezKsUsRb8rkER05o8ha
	VH/SeQOs0Z4b3lZUv2uFPMqlptxxm3HHgwtQUOEtlpR5Dqn6Bl7dWy5/RM4yo/DOGr30WZeYC1/
	1rrQ1b8IFRBir6QYY4w==
X-Received: by 2002:a05:7022:8b:b0:143:26cf:8615 with SMTP id a92af1059eb24-1b3c036359dmr1596278c88.25.1794382314148;
        Tue, 10 Nov 2026 23:31:54 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe32276sm12640655eec.8.2026.11.10.23.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 23:31:53 -0800 (PST)
From: Joey Lu <a0987203069@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Hui-Ping Chen <hpchen0nvt@gmail.com>,
	Joey Lu <yclu4@nuvoton.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v9 3/4] phy: nuvoton: phy-ma35d1-usb2: remove unused linux/io.h include
Date: Wed, 11 Nov 2026 15:31:36 +0800
Message-ID: <20261111073137.381966-4-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111073137.381966-1-a0987203069@gmail.com>
References: <20261111073137.381966-1-a0987203069@gmail.com>
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

This driver never performs direct MMIO access (no readl()/writel()/
ioremap()/__iomem); all register access goes through regmap via
syscon_regmap_lookup_by_phandle(). linux/io.h has therefore been
unused since the driver was first added.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 drivers/phy/nuvoton/phy-ma35d1-usb2.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/phy/nuvoton/phy-ma35d1-usb2.c b/drivers/phy/nuvoton/phy-ma35d1-usb2.c
index 9a459b700ed4..0b9976fb15c1 100644
--- a/drivers/phy/nuvoton/phy-ma35d1-usb2.c
+++ b/drivers/phy/nuvoton/phy-ma35d1-usb2.c
@@ -5,7 +5,6 @@
 #include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
-#include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
-- 
2.43.0

