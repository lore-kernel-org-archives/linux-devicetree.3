Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794867988;
	b=i2JeyKsn6KYwDdgGe7mJOKMWBEFBMHHjmnpKoK5fgFqiNgJTYbLvZeaVn5FvNuKWfR/q
	 bJHYnt+G2BJVcq5yzL+vx6a/VZhIlA4KcH6ShXG9Ie+M2CckvBhNDlvXx4Dcz1P7FyVn0
	 w840AmLrqGNN3SO6PFcjhzElfFXaN31d53tKG+HSSKHKuLI9vPxdp+JhMV3tTm112+O3s
	 67lL8t1Tt7mVrGkXN2SkyKh229DRmehyCxySUh0F88oQ3eajYIKzoTDL3JEwJjRMUjqaK
	 04oYKm9iocM9sH13SgEj0Ekhjz6hNzpMZ0Hq1amNbfjaB9QadA5Oeuty25GnLpAqcXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794867988;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=WsVmZB0UH8bgbSx0D+T0vzINQcKZFGUzB4qEYlW4WKE=;
	b=ZljTqDyQtYo6gJ+Z4WRLTsUKx8bkpLTJoZMWSIZ3nd8ZXWzQu7HFsS8Hksk4ZHfrskHu
	 EoLFkjL3I7siMyVs+7ddiE+Mt/lDNZgSWsRRf6dCQaDrSYafKuPiZtMvQTrES4fM3UL0u
	 UIQnmoXxaRx4JCHLhlhHdXr8qnBv2fzCI3ZrWFPxnr83eC8yyF/FcjV7QBzEw+mfj9TCu
	 QbtOAMi88dxKwrG7IvlrtSbKDlCKYzVCbNcMpyAXllArB6AMDYsERkZdo1BWlRwiWudz0
	 oA2eyE7LoyY4hbmowXUnJumNK42WTg9P07Wc6btJEfGe+7pHM4lNfXroer5A1aTUI+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=hIr7GbNK;
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72881606A32F
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 22:26:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72881606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=hIr7GbNK
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cdb2893531bso2870260a12.1
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 14:26:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794867987; x=1795472787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WsVmZB0UH8bgbSx0D+T0vzINQcKZFGUzB4qEYlW4WKE=;
        b=J6gDHwMzfTbQflWoKebK73RXKqh7XhJYoAVR00E2Xzvpdfxva49leV+OkCo5lbMKSl
         HM7oc7oMvhE9quuosnzeORkLBc9DReDxcq/9I29+R8DX9DEkyqjjBepls6EG4xglq7RC
         bPyki5n/dme5RJMLaHp+MfQqLe2GKQ+LSfeo5elOQV1RlNCjwEEbc3Kz3NG3tyX3+nrc
         6Di9TOOT3WVT7uk/EBAs/waSsgeKw64aTOjnZLdmO47AigWmhgKaCWM01dEQD866PFcz
         gxCd7A8V9YXsWIowUeYK91dtINxBMet2wG0lmEQwwymSjscBzIKzdx160kb2bFAw1tsH
         kRig==
X-Forwarded-Encrypted: i=1; AL+hErHIqbMZ4AxIHGBY3Isxls4AXD77QIJacFm7qNx9CBOybsvOsIIyz+KKLJ/W0hdjRVQX82Sw/4uN37TV@vger.kernel.org
X-Gm-Message-State: APuU4Z/nQ9QTFQjynJ/Jin6tteDKMc/hIsvhHf1jGRFBRA8lbZQjSeYQ
	gZNrcl11rowOP5rZ+3tagrQuMMKep9hi4lRWQIDMTA4JU9OKHJbSpnY/nmDDWMH8M1fSinCvtqf
	94N4dglTBoW4GHH569lkdTQC0RbRfeQYNXv9ArAOmpKWy73O+MN5FmNZVLPfYPpw7dsKTDR4U4o
	rzPewiaHF+8c/QW2Qp6E6jJsTlXj3zfJbwFzdFsQWkM46fKhy6G1SdCh4b8yjV91dcYkke8gLqJ
	mzoowl7ixgNSu3SAWXGlg==
X-Gm-Gg: AZFdTZeBd1CjxYW+NF7/jfbmIZH5qaJJlgM3Vwu9toPJwR3m/o16zkZKgW3VxmvYAax
	MgXadYyaV+zlhfnTmcbO10b5Rj4yVFKxtZilI2iyiOjL2obmzZlOO/fnIbrjZmxpjCi8W42Yt1H
	R8Db+0C4Num6zMevycmAt94HHi06EmJKydq9pQd787dFTBp+3W+vGGvOuJ+GS60fk9w5IvhdsqJ
	87grZIi5aOhWgqecnPeQZciawfdNidTUm0W6sToU9i/7JLs1dWtMtuzPFnDSPlUSXGAnkh/hdIY
	IalEaR1nIh5lywdhgcxXTj9BcChFXntf3DgchCHoiQ7vWU0j6lRzL5U1v2tOjlghLieqybjQQlG
	HjoZ/CGe8I7OQSk2Q1sJC9HoBcG8phbIWuDv91OIq/THB72wnyXw9/IOe0ckd6CYuQQO5njGasy
	acyPBAiy12VSHsYIL6Iv63RrFuCNotyhpHKBGRCnVV
X-Received: by 2002:a17:90b:2548:b0:3ac:a521:959 with SMTP id 98e67ed59e1d1-3b1b0ba3583mr10651179a91.29.1794867987583;
        Mon, 16 Nov 2026 14:26:27 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1b335bdacsm6255638a91.1.2026.11.16.14.26.27
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 14:26:27 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso5701574eec.1
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 14:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794867986; x=1795472786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WsVmZB0UH8bgbSx0D+T0vzINQcKZFGUzB4qEYlW4WKE=;
        b=hIr7GbNKjnkH64q1lev2y9rJOLQcydbwnhEJDdjupN7FrF65IFq5tz989yBs8FlD9d
         AabbxRwDuxspnkmJ8wZT712jZAvhMJC8PhTpx31Cxka+9lU6PftW3I5RpQOlxIOvtezQ
         FwSfVad6aXjf8Aj2VEO2p21k+taX1sctFnZz0=
X-Forwarded-Encrypted: i=1; AL+hErH47rOz2t/sFTN3a7Nusd255HUDfhBr2A+b657awNvskA90NX7/JtJ9ofUovSReujNmpt7z1W5OFBga@vger.kernel.org
X-Received: by 2002:a05:7301:d185:b0:36b:fca0:80b3 with SMTP id 5a478bee46e88-37966961040mr12994353eec.22.1794867985479;
        Mon, 16 Nov 2026 14:26:25 -0800 (PST)
X-Received: by 2002:a05:7301:d185:b0:36b:fca0:80b3 with SMTP id 5a478bee46e88-37966961040mr12994310eec.22.1794867984774;
        Mon, 16 Nov 2026 14:26:24 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm50176624eec.19.2026.11.16.14.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 14:26:24 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	netfilter-devel@vger.kernel.org (open list:NETFILTER),
	coreteam@netfilter.org (open list:NETFILTER)
Subject: [PATCH net-next 1/9] net: ethernet: bgmac: validate RX length against the DMA packet capacity
Date: Mon, 16 Nov 2026 14:25:11 -0800
Message-ID: <20261116222519.1416501-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116222519.1416501-1-florian.fainelli@broadcom.com>
References: <20261116222519.1416501-1-florian.fainelli@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

BGMAC_RX_ALLOC_SIZE includes skb_shared_info and alignment space beyond
the DMA receive buffer. An invalid completion length can pass that check
and reach skb_put() with more data than the skb tailroom permits.

Limit received frames to BGMAC_RX_MAX_FRAME_SIZE and reject lengths too
short for the FCS subtraction. Keep invalid DMA completions visible
through rate-limited diagnostics and RX error counters.

Fixes: 6a6c708469c9 ("bgmac: add check for oversized packets")

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/ethernet/broadcom/bgmac.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bgmac.c b/drivers/net/ethernet/broadcom/bgmac.c
index 9ef239bc487d..1c502bd64d7d 100644
--- a/drivers/net/ethernet/broadcom/bgmac.c
+++ b/drivers/net/ethernet/broadcom/bgmac.c
@@ -457,10 +457,14 @@ static int bgmac_dma_rx_read(struct bgmac *bgmac, struct bgmac_dma_ring *ring,
 				break;
 			}
 
-			if (len > BGMAC_RX_ALLOC_SIZE) {
+			/* The allocation also contains headroom and skb_shared_info;
+			 * only the mapped packet area may be supplied by the DMA.
+			 */
+			if (unlikely(len > BGMAC_RX_MAX_FRAME_SIZE || len < ETH_FCS_LEN)) {
 				if (net_ratelimit())
-					netdev_err(bgmac->net_dev, "Found oversized packet at slot %d, DMA issue!\n",
-						   ring->start);
+					netdev_err(bgmac->net_dev,
+						   "Invalid RX length %u at slot %d (flags %#x)\n",
+						   len, ring->start, flags);
 				put_page(virt_to_head_page(buf));
 				bgmac->net_dev->stats.rx_length_errors++;
 				bgmac->net_dev->stats.rx_errors++;
-- 
2.53.0

