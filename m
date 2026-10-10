Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A912E4A9D49
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 13:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791637236; cv=none; b=qt5+lZ0q8vYsUDKnpwvKP/VoWdGkUZkOvrFSLEGwqUV5YyPXYKLcDL5AN/dHKc00rFFJbiFDKtabuDTsVLjkqykMCr2Cswucqt+a8m1Kx9VAvyS3b9mqMOGPPG6Iun1/Je9b+PeZVNO0ZqQi2WB9eZxZkPwap5meef/NaaUsK/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791637236; c=relaxed/simple;
	bh=I3mvtx0Ku7o4wZPkC8Z9k+objo+CZJZNuiJWkR/XnRs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H6rRnWGFMExgauqxnvSf3DS84C/qoE8lWEfKKLFv1t4lf/tzK1u/jwA//kNDv47FSCGRtgqnd3K4/bds0axjwx+z3NyCuShM53cL2ZwMqW5+g9ACTLrlW75j00Nneb3o4A8urjkZPvaFfdbrVGhFPUuPkqPnjaqOuW7ZiIOb/uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S8n2lzvj; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S8n2lzvj"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49ff680331aso4914935e9.3
        for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 06:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791637233; x=1792242033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RSOY2agxT2iMt962Kcsg74ayJKaWCLdSy8T10g4JvDc=;
        b=S8n2lzvjoLYztV3Ss/yKmPcrgF4ncUbknJ6Ue9MtllrDZzRJnYkVLsopB7FkfIPE9W
         0N384mcdp85pOPZrCGtFnjh6zrIrqdfANKZ9sWIynUhUd5fijjscKXN7ixSKIEuNjJtL
         40Q1To07pGpdStX6yT3lUOecvg6IZpjMAnlwnla1ottMWkjeJVp/UWOtJdMAvysEw2Yy
         hPvyz+uQX0VBGtSQ3EFLYqlbxbEpjSVrK+sEwYmkUCFhbPb5pH8vQ1Lxc1QCG10+8scu
         A4Co7LoN4fo9PXuGX7YWa4I2JvAbfHBvyLBIBYoHx6KVxXluQ4RNShwdFSlniSbsNgdm
         lU4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791637233; x=1792242033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RSOY2agxT2iMt962Kcsg74ayJKaWCLdSy8T10g4JvDc=;
        b=fl+B7cGkvrmwFlU1mYgO+ELQPTmRRNN481tiBB3cxu4KMHQGcWxIM3o0A8ZHGbgU+3
         XYuNdXSKUNV373G+NfIHlAoSsyp5GOki53h7Tjkv2256WwpMuVWWPOqs+/xD1/6Wbxd5
         0W2ThCwPyOYGXRrQ1ZmpyPgjzrBFzOcyVOTqPwvIG/W/7aL4MV1HBBYvgn3sHRoY6R3N
         l7GMh9zJOeVw/hqypfiTRTuDczxcKwh6CAWzDNaL46mLiSZ0jE+jCl714X4P2JsIy1xA
         XQg0c1ScU9x6VtSpiKMit6s7VjctRYdc22JVQfVmSap9LHMUvcuJoVg6yf8U1bgYGCqH
         RP2g==
X-Gm-Message-State: AFq9FYIOnrTD6Skip7plQeAR+gvu7sr1gPqaRcd/XkrftdS/4ozOxqcQ
	SUiZYjH8kZSVwWcwoSpfxAqlFKbgUg6Ej8cIsmSVSaIi0jXUeG34e8oFM4vIZ7YgEMqsxQ==
X-Gm-Gg: AYBFou1PGd1per6ZbtrmYDuxhPhu+OLGTlOrvl56QGQ5B0uN6saB6Ffc8pIBKz032WI
	7qsEjvslbzpLcUuuGGU8y0I3pHc1ZCtVQC5wy5zOV31DXZigDz10s1xmvMRuaN2RjT/mp6RR9jx
	apdS48v9ldeukX6T/+oj16nP47Dnev0HJAfO8jK+jY6QPvyBqJxZ/9EmIPxK+vNDIt9q6k4M2LA
	wAkOSm3pO5UwoVJV0ypMD31yJMPcmCVxQl4izf6F2Jgk9mo+2tUWagiF5ZJqJgSvgdw2WDDeovT
	NSTh0s3YYxqHv/lohODUS8voKibTTOnSO0RzQojQ5ltYCcMEC3p8vQcu9Hd/UNBRBaaO3IjJXV+
	MIOEpOGqi6q3H2Xvd1zg+tZD/ROGzLUDZ3q9zkJNbKpK0N/7I2IOKAVpLfXlOT0kqtjbeOHIL1S
	RAbvbyjBthiUDgNHX9FK4PMm+Sc9FjO0VOLETIY6ICWi+2JMF16C9I1aOCZGEk6+83sOWVj3xme
	Pe1feGHtjn95T88+0kNDjCXpzI2Tr5HJNu97TE8VS0xj56Cc4FvkB0nXNsolkr6wFjZV1l1l+DV
	9sjDiT+Sc6KjHNOn9jty4iEqxxv4ggiEtoKder0KKnkUv927Bjiz6O20WxjbBSyLaXIYDvgK
X-Received: by 2002:a05:600c:19c8:b0:4a0:1a7f:2abb with SMTP id 5b1f17b1804b1-4a18e47ab20mr94757755e9.11.1791637232698;
        Sat, 10 Oct 2026 06:00:32 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a190c49d5csm162309975e9.3.2026.10.10.06.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 06:00:32 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux@armlinux.org.uk,
	stefandoesinger@gmail.com,
	robh@kernel.org,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>
Subject: [PATCH 03/24] wifi: mt76: Serialize MMIO reads with outer cache maintenance
Date: Sat, 10 Oct 2026 13:59:41 +0100
Message-ID: <20261010130024.177503-4-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261010130024.177503-1-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Apply the existing workaround to current mainline mt76. This depends on
the preceding ARM API and needs review together with that API.

Assisted-by: LLM

The implementation is refreshed from the existing locally signed mt76
patch; this new draft still requires review of the final dependency/API.

Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/dma.h      |  2 +-
 drivers/net/wireless/mediatek/mt76/mmio.c     |  6 ++---
 drivers/net/wireless/mediatek/mt76/mt76.h     | 23 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt76x02_mmio.c |  2 +-
 .../net/wireless/mediatek/mt76/mt7915/pci.c   |  2 +-
 5 files changed, 29 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/dma.h b/drivers/net/wireless/mediatek/mt76/dma.h
index 7694764feb..721c54b92f 100644
--- a/drivers/net/wireless/mediatek/mt76/dma.h
+++ b/drivers/net/wireless/mediatek/mt76/dma.h
@@ -107,7 +107,7 @@ mt76_dma_handle_write(struct mt76_queue *q, u32 offset, u32 val)
 	u32 _offset = offsetof(struct mt76_queue_regs, _field);		\
 	u32 _val;							\
 	if (!mt76_dma_handle_read(_q, _offset, &_val))			\
-		_val = readl(&(_q)->regs->_field);			\
+		_val = mt76_readl(&(_q)->regs->_field);		\
 	_val;								\
 })
 
diff --git a/drivers/net/wireless/mediatek/mt76/mmio.c b/drivers/net/wireless/mediatek/mt76/mmio.c
index 73d47608bf..95c6fe27f3 100644
--- a/drivers/net/wireless/mediatek/mt76/mmio.c
+++ b/drivers/net/wireless/mediatek/mt76/mmio.c
@@ -11,7 +11,7 @@ static u32 mt76_mmio_rr(struct mt76_dev *dev, u32 offset)
 {
 	u32 val;
 
-	val = readl(dev->mmio.regs + offset);
+	val = mt76_readl(dev->mmio.regs + offset);
 	trace_reg_rr(dev, offset, val);
 
 	return val;
@@ -53,13 +53,13 @@ static void mt76_mmio_read_copy(struct mt76_dev *dev, u32 offset,
 	int i;
 
 	for (i = 0; i + 4 <= len; i += 4)
-		put_unaligned_le32(readl(dev->mmio.regs + offset + i),
+		put_unaligned_le32(mt76_readl(dev->mmio.regs + offset + i),
 				   data + i);
 
 	if (i < len) {
 		u8 tmp[4];
 
-		put_unaligned_le32(readl(dev->mmio.regs + offset + i), tmp);
+		put_unaligned_le32(mt76_readl(dev->mmio.regs + offset + i), tmp);
 		memcpy(data + i, tmp, len - i);
 	}
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 62b41c8bb7..54b63ba614 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -20,6 +20,29 @@
 #include "util.h"
 #include "testmode.h"
 
+#ifdef CONFIG_CACHE_L2X0_IO_LOCK
+#include <asm/outercache.h>
+#endif
+
+/*
+ * Some SoCs deadlock when an outer cache maintenance operation runs while a
+ * PCIe read is outstanding (see CONFIG_CACHE_L2X0_IO_LOCK).  On those, take
+ * the platform lock around device register reads.
+ */
+static inline u32 mt76_readl(const void __iomem *addr)
+{
+#ifdef CONFIG_CACHE_L2X0_IO_LOCK
+	unsigned long flags = outer_io_lock();
+	u32 val = readl(addr);
+
+	outer_io_unlock(flags);
+
+	return val;
+#else
+	return readl(addr);
+#endif
+}
+
 #define MT_MCU_RING_SIZE	32
 #define MT_RX_BUF_SIZE		2048
 #define MT_SKB_HEAD_LEN		256
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x02_mmio.c b/drivers/net/wireless/mediatek/mt76/mt76x02_mmio.c
index dc7c03d231..0fdf2e3a2a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x02_mmio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x02_mmio.c
@@ -357,7 +357,7 @@ static bool mt76x02_tx_hang(struct mt76x02_dev *dev)
 		q = dev->mphy.q_tx[i];
 
 		prev_dma_idx = dev->mt76.tx_dma_idx[i];
-		dma_idx = readl(&q->regs->dma_idx);
+		dma_idx = mt76_readl(&q->regs->dma_idx);
 		dev->mt76.tx_dma_idx[i] = dma_idx;
 
 		if (!q->queued || prev_dma_idx != dma_idx) {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/pci.c b/drivers/net/wireless/mediatek/mt76/mt7915/pci.c
index 8007e62004..4c57e66a21 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/pci.c
@@ -36,7 +36,7 @@ static struct mt7915_hif *mt7915_pci_get_hif2(u32 idx)
 	spin_lock_bh(&hif_lock);
 
 	list_for_each_entry(hif, &hif_list, list) {
-		val = readl(hif->regs + MT_PCIE_RECOG_ID);
+		val = mt76_readl(hif->regs + MT_PCIE_RECOG_ID);
 		val &= MT_PCIE_RECOG_ID_MASK;
 		if (val != idx)
 			continue;
-- 
2.55.0

