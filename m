Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792856536;
	b=RdigpZ/pnIy30XTYJUnh83xvuOk1dNTplkv4YgRR4LEfAknprjD8r5ragC9rropTojzm
	 McTAp2ycAFfrVH8Zo3xd2Udfu9DhqU3qU6OP086ldvXklASlVcPmm+4Dyo+4SNPidsmiJ
	 G7NxStjXVJN9WocUYRp+0nDxTiOkS/PxVwLohtFhRz39sek//eRhdjiMSgBhKf7vs4ZDI
	 tsxcsuykGKzbl6N3+Ar3CW4goKaYwJU+irLlwwPO3/sQhx1YFH5FQ0BdBhT+6RkEBAHY7
	 xc8hUkf3YER62ZIDc0m8fu9MGiWHKPmhmLfhQ1eT5ZWmkk3q2o4dgVOCn5aieQ4d0kQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792856536;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vjEeye3G0zd8caK/nKeFaZ6nAZ8lGBdWDRGnP6Iv4Rk=;
	b=pTTnvEmS7Cz5Jtt2CWRfxihGHuRXUxzc8qWYrFZ8fk8CCpLgAp8l9mIUtevZ4f+455Ts
	 eaLOrxRPDJphZkI3Qjr6qeUSwEF9hn43OSp1ClquH1HAUWfOcefr4v5gMmhCRiETni3Kt
	 ic2R988wD8tB4GU41aHQYO9QkZ+ETrTAvSSdPCn3IHibTP+5rQEHsiGQclRlOLUyKsfID
	 6Fe/VverhXRzAF1LLWalIvcBGuho7aOxTrCOFqr47YYvHR6FyG/axvtM1o4EL7+dYZUqc
	 +JAerpzy4CdVaSAhCSys85bG5Z8FR4HxOac2g3rnjk4/y85BpH9+CjwaIfuJ8W5OBWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=p1wELQ+o;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF36B606A324
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 15:42:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF36B606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=p1wELQ+o
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-35f1f76ea84so2975720eec.1
        for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 08:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792856535; x=1793461335; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vjEeye3G0zd8caK/nKeFaZ6nAZ8lGBdWDRGnP6Iv4Rk=;
        b=p1wELQ+orMTpRswwM/ZFz0l/PQum7SYe5fMWmghobxe8OJfJ36isFVuGAi3JSPs7Ok
         uXKGICH8ql8O9uUNuU426L5tX14TwQTKfRta7EP9cbTapnLomRgdPDaRmUWGolJ3YxQS
         hMY6LzlVH5sFHkAADPtO1ZhbQbzC4OiiUn3RSOHX+XavV5C9yCwEakRzOLXgbFDqgNHf
         YDlGTgwkg9ci8ztGSyKkHjF7pwjFbfCJKUhWv2581RJ5RuTNTq5qiJbDHT76AtAz+uqN
         7w3g0B19n3hnkrvKUtfDBdu24fZotplO1BRbGnLDVRpADxZYEi8QguCP1Y3r/2e2+r60
         7EvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792856535; x=1793461335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vjEeye3G0zd8caK/nKeFaZ6nAZ8lGBdWDRGnP6Iv4Rk=;
        b=l1R4hCleZTlppQbcTeqO6G5ANGOTsuwmiL2qa1sGo6fHxKHBKQGECm2AMcvJks8sFX
         bkkXOpGtoMrZwg9vjC9tFyLF4TzBxxEJthIFrvwKgFCdhFHwbjZNYup+pNlC1FvBbZcp
         aGW4Ok+vpKe3BrRvMF2suH97+o+7qVnKLEzUIQOrZq6Yl1h8MOmm+QP+FkfLYShTQdDF
         Q5XVgAFyA71sIEFR/XV1GCVXoSu9wbtS2F4+h8ta7NndPFBWM8cd19pt5n8bg44O+s8Y
         6icU2N/bkRJrJwVTsBwP/ApEewM9Z5i95B66oypiCNw0H8QPOcNn+0758R6XTp3a0s5G
         +JNQ==
X-Forwarded-Encrypted: i=1; AKwUvByWBllk3CSLn0tAbqBI5M5XYSnEMdzQRVTu2mRkZLkfMP5AAxdGdxLf/iT9RyYLrRKQUTSFrFc6ihEo@vger.kernel.org
X-Gm-Message-State: AFq9FYKWLi4yQA3tISPmMuZ8miXnyR4HgbYzmn4X7ZxzQLmcu6t+gVVQ
	2X1sHOY6FNkBrqJ5czrGMCagwd4aHW+oB96IIyOdf549oPKHT0XUJ07G
X-Gm-Gg: AYBFou3qrDoeMjGTbtV2AP3fkHY7gbQP1Jmt54/eLxHMoowXfGnBF1uorlO8WCLAwsi
	8cxN3R2vVwSQ2Ga4Y1Pj+rzJ92H29sPL4tusmiqpo8A3ZGfP25Cf8Wt+kcbPcH3ZbxdNEGg6yjm
	jXAVkgpq/zR0+CHUktvkBjwmNgNeSmu6GuGnmXJ2Pnsc/T4SK8G88xTrg/BpaNf86PmzYYl31Ip
	zT5JDPX3pcqxD93vLob7hN317NwJSBWYNMZt2PtuNyFgKdFVxUKPUPzImgWEGAcSktMwtE2rYfx
	Nz0luK4TL9JAjjwcGoro3GanRWUVMxPopQNQDvHXxiCzzpHyawMEeJjGAjbx5uRrGzqE2qhQ4Z2
	hGFkN6BmjkEexJTbX1nUhaP5CaMF28w4eWIm0V8K4+NBqHNlIh9HcCJi6aCY30U1QsVswghwjAG
	z7Z2/IZV7tJIN1sS52ourYsbSV+wtJcore1mCmoiKtREi8MQT7g76fKBJvk1QKHA3bgq+2PqngP
	J84sHfD6cWIe5CYrumNa8IW1lR0nARlXuE9AVgG8fU4XfwbO2ENL3VBog==
X-Received: by 2002:a05:693c:8381:10b0:351:dbc:b663 with SMTP id 5a478bee46e88-369e863b90emr3837046eec.31.1792856534783;
        Sat, 24 Oct 2026 08:42:14 -0700 (PDT)
Received: from plex ([2406:6d00:a27c:4200:aab8:e0ff:fe02:33c1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8daf444sm7766450eec.18.2026.10.24.08.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 08:42:14 -0700 (PDT)
From: Chris Scott <gilroyscott1970@gmail.com>
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	pawlik.dan@gmail.com,
	zhengping.zhang@airoha.com,
	Chris Scott <gilroyscott1970@gmail.com>
Subject: [RFC net-next 2/3] net: airoha: npu: attach a coherent pool in the NPU window
Date: Sun, 25 Oct 2026 01:41:49 +1000
Message-ID: <20261024154150.45733-3-gilroyscott1970@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261024154150.45733-1-gilroyscott1970@gmail.com>
References: <20261024154150.45733-1-gilroyscott1970@gmail.com>
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

The EN7581 NPU can only address host DRAM at 0x80000000-0xbfffffff;
higher addresses alias the lower 1 GiB. The coherent buffers allocated
on the NPU device are all shared with the NPU: since mt76 uses the NPU
device as dma_dev, these are the NPU TX/RX descriptor rings, the HW-RRO
ba_bitmap/addr_elem/msdu_pg/session buffers and the NPU TXD buffers.
On a 2 GiB board nothing keeps them below 0xc0000000; they normally
land there only because of early-boot allocation order. With low DRAM
reserved away on W1700K the SoC hangs right after mt7996 firmware load.

If the NPU node has an optional "dma" reserved-memory region, attach it
as the device coherent pool so all of these come from the window. The
next patch moves the mailbox buffers to coherent memory as well.

Unlike a restricted-dma-pool this leaves streaming mappings alone.
Packet buffers are passed through to the WiFi DMA engine: on W1700K
with 96% of TX skbs and ~20% of RX page_pool buffers above 0xc0000000,
host-path traffic and sha256 file round-trips stay intact, at the same
throughput as without a pool, whereas a restricted-dma-pool (swiotlb
bouncing) costs ~22% of host-path TX.

A device coherent pool has no fallback once full; mt76 and the mailbox
use ~10.7 MiB with MT7996, so the DT region should be 16 MiB.

This patch was written with the help of Claude (Anthropic, claude-
opus-5-5).

Link: https://lore.kernel.org/r/atCRsquzA1UxSpCc@mediatek.com
Tested-by: Daniel Pawlik <pawlik.dan@gmail.com>
Signed-off-by: Chris Scott <gilroyscott1970@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_npu.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ethernet/airoha/airoha_npu.c
index 4d3195eb00..069fd60680 100644
--- a/drivers/net/ethernet/airoha/airoha_npu.c
+++ b/drivers/net/ethernet/airoha/airoha_npu.c
@@ -693,6 +693,11 @@ static const struct regmap_config regmap_config = {
 	.disable_locking	= true,
 };
 
+static void airoha_npu_rmem_release(void *data)
+{
+	of_reserved_mem_device_release(data);
+}
+
 static int airoha_npu_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -776,6 +781,19 @@ static int airoha_npu_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
+	if (of_property_match_string(dev->of_node, "memory-region-names",
+				     "dma") >= 0) {
+		err = of_reserved_mem_device_init_by_name(dev, dev->of_node,
+							  "dma");
+		if (err)
+			return err;
+
+		err = devm_add_action_or_reset(dev, airoha_npu_rmem_release,
+					       dev);
+		if (err)
+			return err;
+	}
+
 	err = airoha_npu_run_firmware(dev, base, &res);
 	if (err)
 		return err;
-- 
2.53.0

