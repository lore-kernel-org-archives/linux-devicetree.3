Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.202
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794854801;
	b=vzvORCtVnCo0UyrwZ4ybcynI4te7IPo88RGUow0IBYsIYuhznmBYykvKK1/PiP4B4DzT
	 9X576pqULIG3lnGp5+pvltL1Tw+oQT3ev/5m5abg9eL2KI5Q/OHKIaGRmMqrRGJCbhvBb
	 aEeZdlIKYp0pxJOaArC6FDm/cV8ZkncM0FrlCZ1tyc7ST/hRGj6MxqwroYGL3IO9AMbfs
	 YtE1r/1nKeKM3gS8HD2ltQlByD/5UOGTJ7ZYx2hpS5529MM2Ce/tYAgDC/lNsW04TcTbP
	 b9F1q3X6gnx+eT0e6Yg3OBdm9D84bm+QFknaUrXY4N3eTrYBze4+Vb7oxUXOQfHuuQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794854801;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=tFzDEYw+EnooXYdZM/QgeJxwD9oyUj/5EK6tkUOx56g=;
	b=lCmQH2HBbqtixPNAnK4HwC7DRbpgvaJq3jbKJUmnVXOrGyVaNj9ZtXgfNVCZcbd4S2Zh
	 L3Tb4PVFTr6QsNnUxe3OUpiFuSE38RVqlxQhCPnpQg0l/3SJm67nJU24s3VZeqrXrK6+l
	 96+KP1NmZ8uyIpPpEMdXDeLUNrUEZskDS9y7RcS4XCWSpYBWEbdCmebFDWM7LSep29sWE
	 xFDFaHrnetofKMsWVXA0MtMIkAbicuaOsb4rA1vrQrBArVB4QUET4uhjRUQgc3m2zg6hI
	 ex9agU/iK46ruH1+PqL6UdBf3DB9+K8juxBxTSNJBHbkym+MhcK29FnxoCW3o7lID+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LH2NaDId;
	arc=none smtp.remote-ip=74.125.231.202
Received: from mail-oi2-f10.google.com (mail-oi2-f10.google.com [74.125.231.202])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BD4606A31C
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 18:46:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77BD4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LH2NaDId
Received: by mail-oi2-f10.google.com with SMTP id 5614622812f47-4c3bb46aaf0so1349602b6e.1
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 10:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794854800; x=1795459600; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tFzDEYw+EnooXYdZM/QgeJxwD9oyUj/5EK6tkUOx56g=;
        b=LH2NaDIdv753SjJEeUr7ecK4bF/cc+zRWr1U26KYqgTiyD06NGMXCrAMQXdGBkEp9d
         fcQZjAzFzFiaTeDl7IZ615eUklx4vwO2lOFxDx8S6r12V3b9HeY3MtplnQC4rNrbr6Zo
         yARNzQB1HjTxhtRoRK68WqF2fIHw5/zuRnAWVSZm7PJLnzVj40TO8aWwLytLjmSag67D
         VIPWP7Bp3wbPmYlNuEBUjiuj9eXTBe7FSNpiVfajXs6SwzFaxhLoo4zwahGwci3pYG2p
         soVGU7w+mKiLJr7bQduw1oWIVaBp608WOhOq8LEJFb4vPn5q+OqqzuGkgfWYIMJzJyTv
         bqwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794854800; x=1795459600;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tFzDEYw+EnooXYdZM/QgeJxwD9oyUj/5EK6tkUOx56g=;
        b=y/FM91Qg75JpTuB3pYwG3Xwga4/pG0BHozoZnmVleo7Ys2aMSmIQIMqfXYP4gmEeIQ
         V8CBVUz09g7C7tf+UQeo3K4hxsd+QONEBTzLlyxFXqXdXOYz7xgDLajRUG/IdVQDUUj8
         v5FSfMTofMh2hsk3zIjlCQEHpeDdu4mF/eaDkQN5cwcv9KEYOCem4aRcGoKV8d0VXtBk
         yu7VnjwIvb98uNRNq+eZsTJyWskf0IctzAn6p2OcKggW5BPSdUChNDSCjEUrBcWM7I15
         w0B2CQIB9tN8zlQgeurmxd/S+sg9hezeXuLkkZiJXhR9lZh7MR8/aF+PzrapH0CT1iFC
         dL2w==
X-Forwarded-Encrypted: i=1; AL+hErHZ9jVmcpSY+JfRXmd03rBlLC2tz4zZd5LmTO6JFN3UPU+LGVqvOgpG64uqaCmPk8vyFNsYCJl9YKxO@vger.kernel.org
X-Gm-Message-State: APuU4Z/ieASlgLEIFJpPQCAkGQSZ2fRyQWfcAqwDo07VfmZ20VSUoaAm
	XMwR9rlblfdPdlL4PiN7bCp4rrNlokDerrvD1ypJ5FRrZTGFtXBa+xIz
X-Gm-Gg: AYBFou3dd95Q+GCqVI6qsV9KfCfr5gPyGLLqf9ArfYDn9L60eNqKUssV4pkv6vZL4Tt
	uHTWXJZ7pmqie6sHMBDVs9pZUYn0mS7IahpbuG5z/b7kyh/nIGI7cYzQ7eI2xL8da+WlC0hld3T
	rx/tM5JcmH9dCxZeqJhNfsr2mIJWvnzJISj5fUpMvOvp/L21+uvTlr28aBubVq4ymyhOzV/WW/5
	Zu4FJ1ItPWuw7nPqE19wOUrzohng3AktkUUb6/EwazHyg7MiXrTZN3KOSHGQKwqs8Lhz+0T3jDe
	PH917XsJjQd61ZAGauswOuwIVyabIjTH2RZQGlaCGqT76VilZCCfGn3D1oxAcd4dIy7XGAoy8Yo
	gjT925QYQ9zNV755HUCaVXiyDDtoS3iLzfwaEwb0+qofdB6E+r4dvtN1LuAvUAv38qYoupNIG+2
	OMzbF34jfjd7VhKt5CfJTyWDIV7xYN00ANmLZdAIIsva32ZjXjczItTbvrgsN/VL3NlE4egdsN3
	+CKf/CWv5m7aTTEG4Fy3xQ0RKNoUgAacIX1K6EuSpDfjtivc/Ld/TWavFvKQ6bntnBAgpY9SlQE
	/jytYvPHIP8YHHV0umEg4+klTtiNxMCjEnGnA15aOJ9VPbs96uA6gauifeh2i9KBEqbYfKU7OYC
	Cdy1Kl75AQpL/qWE6fu8=
X-Received: by 2002:a05:6808:4fd2:b0:4df:5cd0:89c1 with SMTP id 5614622812f47-56e63ba5727mr9976924b6e.23.1794854800435;
        Mon, 16 Nov 2026 10:46:40 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe242b670sm7210735fac.17.2026.11.16.10.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:46:39 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Mon, 16 Nov 2026 12:46:33 -0600
Subject: [PATCH v3 1/2] rtc: mt6397: rename the write trigger register
 offset
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-rbrue-suez-upstreaming-mt6397-rtc-32k-v3-1-179145eb7e89@gmail.com>
References: <20261116-rbrue-suez-upstreaming-mt6397-rtc-32k-v3-0-179145eb7e89@gmail.com>
In-Reply-To: <20261116-rbrue-suez-upstreaming-mt6397-rtc-32k-v3-0-179145eb7e89@gmail.com>
To: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Eddie Huang <eddie.huang@mediatek.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-rtc@vger.kernel.org, Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794854794; l=1817;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=df32cdCXYqRXb7AgGz4g+i9owLPH2NyaDIX+9W0kTJ8=;
 b=YXj0OOXR/Ek7mAgVNZ2ePkshYGmwdQh66wpXgUVRUARhBWhlo4xL7c+hw4g+ulZz6PAARMwLB
 rVWKea1gZoeASnjj2zRQPwTaWnyl9lPPgcWMM+sqyHTCH5hZTlMhQwv
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

struct mtk_rtc_data holds the offset of the register that commits RTC
writes, in a member called wrtgr after the register's datasheet name.
Call it write_trigger_reg, so that the next member, the control
register's offset, can be named the same way.

No functional change.

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/rtc/rtc-mt6397.c       | 7 ++++---
 include/linux/mfd/mt6397/rtc.h | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
index ab402f9f85c3..5afdb707a5b5 100644
--- a/drivers/rtc/rtc-mt6397.c
+++ b/drivers/rtc/rtc-mt6397.c
@@ -22,7 +22,8 @@ static int mtk_rtc_write_trigger(struct mt6397_rtc *rtc)
 	int ret;
 	u32 data;
 
-	ret = regmap_write(rtc->regmap, rtc->addr_base + rtc->data->wrtgr, 1);
+	ret = regmap_write(rtc->regmap,
+			   rtc->addr_base + rtc->data->write_trigger_reg, 1);
 	if (ret < 0)
 		return ret;
 
@@ -411,11 +412,11 @@ static SIMPLE_DEV_PM_OPS(mt6397_pm_ops, mt6397_rtc_suspend,
 			mt6397_rtc_resume);
 
 static const struct mtk_rtc_data mt6358_rtc_data = {
-	.wrtgr = RTC_WRTGR_MT6358,
+	.write_trigger_reg = RTC_WRTGR_MT6358,
 };
 
 static const struct mtk_rtc_data mt6397_rtc_data = {
-	.wrtgr = RTC_WRTGR_MT6397,
+	.write_trigger_reg = RTC_WRTGR_MT6397,
 };
 
 static const struct of_device_id mt6397_rtc_of_match[] = {
diff --git a/include/linux/mfd/mt6397/rtc.h b/include/linux/mfd/mt6397/rtc.h
index f4da579ec638..44d2b2cb1ff7 100644
--- a/include/linux/mfd/mt6397/rtc.h
+++ b/include/linux/mfd/mt6397/rtc.h
@@ -71,7 +71,7 @@
 #define MTK_RTC_POLL_TIMEOUT   (jiffies_to_usecs(HZ))
 
 struct mtk_rtc_data {
-	u32                     wrtgr;
+	u32                     write_trigger_reg;
 };
 
 struct mt6397_rtc {

-- 
2.56.0

