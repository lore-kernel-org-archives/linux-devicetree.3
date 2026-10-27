Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793112013;
	b=jdg1vzbyZyv2YELhxaUqxdgICXclps1EboOZlIEy8jRAe1MK/SJpRxtdLa+iQJfchyle
	 YZwKfMkTaygTRcoYKIWb/Bv2iDe2H+RrmmQMO7CfwKxnDRFtfzbtz5stmGp3FWYwrYcn5
	 nT9EVw8dTMGsNIvaHb9PqZfhJgueW6woh1qEadIneFvFBduFl2Sig5tsW+6UvfbOpKOT2
	 8mZLY6+WRBLoAfXJzo7Mu3U0zWfa/4KT/TBQ0VcnxWadmUutWEKjzA/EHN2IX+5P/VR31
	 3YaKr/Y6OuBjmuzDpO5QW5MGwXdFwJCY7orjX22UWNaJYyEew4choRPp1ZO6Qmn+8mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793112013;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ssGW1Dqn9NQO094E/8Ttr3abz77jsGgzbaDPU8z6CLQ=;
	b=ohxMWSQTGcPx/enioOLPM573Ij3LUV7pyv8Upbg49gEz7gXFRp5LwyZnak13Q6k2Fk5e
	 +ax7FVD5h2VBBgBjTBpMfJGza+Bntv0MCv/K4/XeAfNfgmkjUq52W80WcF9VP9+DVZ8s4
	 XTLBzD/K1lvN9TL7wiGpMby+eUUScj8e422PXTWEFlERTLR/jf/yXH9ZmJ+xqAS6hh4M3
	 o8zWNE9Mz6Mgx8Ejo9NVRNiFMJAd5CFHPT3Rp14T9AYjR4MsTu8JW6eNU2Xla95i+tffp
	 33YVilgo8qnQmCccIyiXaX9JAmN9v/GPGeqJ5jTJZD4yNmAFeVAVH1NC4Q7umDc0NBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j2VJm2rP;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B800606A326
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 14:40:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B800606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j2VJm2rP
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e00eee27dso2762447f8f.0
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 07:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793112011; x=1793716811; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ssGW1Dqn9NQO094E/8Ttr3abz77jsGgzbaDPU8z6CLQ=;
        b=j2VJm2rPL8dKoGJ5IAD837xozfaN1bHUYYeUTo5hq2LnuJZrIJg+KJfxbTv/5cC0hT
         QXcGC/xhuLi33OWTMbx1SrHFI69l2+Oypn8lTDoXNPcn3uzdDkcNDNbpZWA7SckTH98l
         kxKwbPVOtsrU9Whq67KApMl5KY/aJiHpnL0XUY55LyPFxQBVzRMNNg7tQ7tUpeDqnh7q
         9tzcEZ20wdy7TBHddU1djSbtqFou0GVBzzMBitqcWAjWcnx3FImJJs95qAXFO7l6eJvJ
         9sgB1IWutAaejD9a9uLnhotVH3rU6RQJZTwg8pY5Ef3oWQCwCunmqjaM1sBEF6YO5ugv
         shqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793112011; x=1793716811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ssGW1Dqn9NQO094E/8Ttr3abz77jsGgzbaDPU8z6CLQ=;
        b=CYWs2g0bkxP0ocsp2CBQczr51FSUzMu49b2NEp3C4uYybUGLX9R6xkmTrFtE5mQRAP
         WF/JVmSm3Hllffpx592pIY5jRKyL5pI9uBHNVO2MafsUcKrw7w7n/P1NsE2l8AKt0o2w
         LL1A+FAi28VkmHCdhwDCx+8PNY6cFbE4EUo8SOWsLxwrLQntdZ2Uxt6YpG5Bkqcc3a1e
         jW0OmFcQjp/V66XFRvqUVccfhWcVCXvGc8AWGEaq2HfSAXGXpJumDD8UQpNlJvxpaHve
         K+rv46CelbtY8MLRCLhbbbTt/knvK3kISrWkUO4B0lAawzHvJRPdPj+pqtRgel6xAbQn
         Sd0w==
X-Forwarded-Encrypted: i=1; AKwUvBwCnesLO0YaTkZ9PWUXTC34+1FEdJlwqD1qrF8dHuqmhJwngW4tJ+0t2smR9Uo9CJmuh5poTWGUqatE@vger.kernel.org
X-Gm-Message-State: AFq9FYLSaIiBB8sBThJk4I+orxY9FZcvnk0wxcUCTsUUCTii2e/dh/FO
	C8/NaDK4nSrMD/EdSYJlYWHMcIVAVOJAcrAJu3v+cqdevpPzAspFKTA3
X-Gm-Gg: AYBFou3GFUXAfBIF/IQrhQ8m1gjQ7E0YoPiMis/II/FuEdiy4YTde7EeHUy6aqgMyYj
	H7BvP5iYP5FdSgawxepdEMH9hQdRC1PtG+ou950HcmN6ixjYQsw+KEK6UuvfBBdsK6kPGhmddaR
	3N3K3efwB7Ms2RgoTMQNEsht0RX1b+/aEHWoDPBnEOpXhpEPAuNHYX+Xe6mIewEe7VTxGs4xbOF
	ZX3KV7xAc1KwESoYjLzrVuBn6AY4l50TUzGwwMhJhQnPEmBidpayGKMqaegBVkzyXwoXAQe/4Zr
	XIK8wU2IHz6w6CrdSlVM2a7EZgmfADV8TSwSbF0KonuCWvxifxBzQvePKAuW1TXIru/3hVYA/sX
	KCpKsVz7sugFnRaho7tsiC5+DDVUMDs3y0UmPD5l6UJhj4p4vcioiaEcYpxQ6TidprD+gQ5JJ6Z
	hQmSoNX09dJ7qcM0Ntu2JFU/1vlBAn9ebSpzSYMyfpOaiuU0QNjurntEFsFaihi9a1G06pD9Ubn
	vEVsiLbZMZGD6MXV71KMmZWktPVF7U7BxFYa7kEANZ0GkITvT9MbtaLjjX4QSfjVBDCKtj8QBRe
	rcjseKGB0+80meOH/lD9S9c2MDGUInddSsUyegs9WGzFkjs4nu542yosS9DU
X-Received: by 2002:a05:6000:26d0:b0:487:91e:d8ed with SMTP id ffacd0b85a97d-48e3eb2ceedmr18881590f8f.2.1793112011312;
        Tue, 27 Oct 2026 07:40:11 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb846sm23354151f8f.25.2026.10.27.07.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 07:40:10 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Chaotian Jing <chaotian.jing@mediatek.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wenbin Mei <wenbin.mei@mediatek.com>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v2 2/2] mmc: mtk-sd: Add Airoha AN7581 MMC compatible
Date: Tue, 27 Oct 2026 15:40:01 +0100
Message-ID: <20261027144002.10606-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261027144002.10606-1-ansuelsmth@gmail.com>
References: <20261027144002.10606-1-ansuelsmth@gmail.com>
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

Add dedicated compatible for Airoha AN7581 SoC that implement a dedicated
MMC controller based on MT7988 with the difference of having a single clock
controlling it.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/mmc/host/mtk-sd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index 5b160fdad3f0..736cff2783e2 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -713,6 +713,7 @@ static const struct mtk_mmc_compatible mt8196_compat = {
 };
 
 static const struct of_device_id msdc_of_ids[] = {
+	{ .compatible = "airoha,an7581-mmc", .data = &mt7986_compat},
 	{ .compatible = "mediatek,mt2701-mmc", .data = &mt2701_compat},
 	{ .compatible = "mediatek,mt2712-mmc", .data = &mt2712_compat},
 	{ .compatible = "mediatek,mt6779-mmc", .data = &mt6779_compat},
-- 
2.55.0

