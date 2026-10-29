Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793309129;
	b=5CHLRGjbNynX+7C2kpxb0gLG4Z/8Fe1tJy2jTKV8PQbmUB+mg3yEhDHg7u+hobWGgZIK
	 OQz/MDIWkdl/5NxLEWxe9rEGx5JUxCNN6I1swN9Twvpd/G6rx+M7ThDnugWD3foXiOASG
	 wYdWqJw6OwoOyoMc4pClIljjKxaSxt/SMDtLUeGht6vVIUnisDsodMOPXK4TIiBhr/Log
	 /ThlYqofzBkI7MR4JzcWfImGztbR10D2Za1vYeYmUolW9cSOM1ZOg+XQr/N/hl07+oWWW
	 JkP9CauyvHqZZe3NU7IxeQKa2G3S2OCNy3sp9vZZUTxVijV98h5Z6UAY76TuRMfXhCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793309129;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=AaqGunwSleeDLPx2z6NkDc6zUunPgMcaEWPlGCr1dr4=;
	b=IujOkz6tXFkozrrzcG2U7pGf6DClQLFLsW6VM6K2qLK0k0t7hEridczXimfD2hXNv9Yl
	 uqSMPpzH5JBHcqgaBB4E2PONnNg+kLIdZnUhMrwjcuGYrh7sECdD2Mf6I4dwPLlpk7Z9f
	 Ea2fwVVOLrAtQyUPanZdn9MzI7rdiHKQHYQrqZffhH4S+7qkkpcFQtWCqvsopDnTP9uOA
	 usGAjNOPZ5M0WvBwwR/uj5+fie+ptTFulR+sOQyh/w9hHuC3zMJ0eTGgiIndicfiSox2A
	 ycmzmd5mGU+5zwkGvn0vYAn2661J537M/vlhc2oM8isACVBABeasXVflqOXPEc/Vapw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=SYZDi6rA;
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E3A606A32C
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 21:25:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6E3A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=SYZDi6rA
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cc147d86bebso57859a12.0
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 14:25:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793309128; x=1793913928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AaqGunwSleeDLPx2z6NkDc6zUunPgMcaEWPlGCr1dr4=;
        b=g1qJcxtbvJGPq6xkBMxjwxUG1niij8B4I0Q3p4ij1ngPFAllowPAhrHiswlDQdGK5p
         BwglD7/NpBZnav9GDVDf4diUfuwh3ntNwUZ227xRT9SFOkOWBIjfdBQx3UYadMqv5EgB
         DaSciej/4xe+n7zKQtiFXKwBZzDD9cN/xOCvcOExZrNM8SUWGuQUxRkc0MB5PVkhB1/E
         vbQIpXKgRsyJtGRLUGaBlW5pCQg4NIU85280poDqf4msw4Cj0Oj5ZBoEpUkniyLRsxmr
         la39a+5e+EHkrkEUZuQ3rlr4jSNYAQoz/o/tE1XfQSzSTZHoxN3ISY5YmEXVcX1tZxM8
         tRoA==
X-Forwarded-Encrypted: i=1; AKwUvBxFq1Or4sBrBlOfPwkbdYjHkApTMagkskeiYYlhNz/I1w5VzOcQXx3aeemeRdoTvdTaGNV8UQtLphKT@vger.kernel.org
X-Gm-Message-State: AFq9FYKDrhUP4gLGlosBd9UyTRVNBmDLzNExa9zsIJ3f4boRKMxEiIhE
	IXafHrbJ0UsFPyc43FVBFpyWZOZg3SidZ/9aJmUFRs857NQU2cFo3bvWgHtQJrHP8LN2JTvDs/a
	UH39auMfUfc/ADHs1bVnErjQk8x3N5X6qM13NDGVH9K/ir2InS8e2qnEetbTCJo77iuh7/tX291
	0NaDjvAgGL+bFGALYkR2RlJOlcx2rsVUxd2sBurpkWQRdeoITbv0OiVQdgCn0/5jn6cAehHWNez
	+XbNS2mgAtFh04sfZqw3BxS
X-Gm-Gg: AYBFou2Q+RLY5/S7x0mnl7t0Nuiu8PGxcYOSvEBGR1mdMpGd/Go+imaXUtSB9XnSjCx
	B3vzZSWmvs/LnexHVPbwtcJLfzI801uxTSxcT12yoDfbC4w6OZAF4zf28ViKAMN8ivIxhy1uxPz
	0pT9d6wd31cscDG5dye3mMkB/mZRa2R4lpJPj0gmopg3Nh5a0/gzIz/LqoBbKtPKC4ltQZVELcv
	5hhNELY+P+L7l47V0RbDfujdu9LB4O9+F6N7pmwQasJMGdS6+mfhT1mnOIPiW7fBuCTHwlLJoDg
	cnro7h42osHas5SPU3FCPea523pOG0IwjzQHg+mBzl7HJCSuq7Zsye17rdXgnQWcCSE+fkjrA3P
	jAkfhfjXPCjos4sCDEnbLSJCnbLwp0yKtObA+k09D6JsTsP6fEtQLPRi/ubPPjMDlG9kw9h+ZhB
	YAKM8wRQzxwkCN4NMVV+ZmRQgYV465vwD0pVo3leeI
X-Received: by 2002:a05:6a21:9105:b0:3e2:2459:b774 with SMTP id adf61e73a8af0-3e928914359mr297726637.16.1793309128034;
        Thu, 29 Oct 2026 14:25:28 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id d2e1a72fcca58-8a98ed13f0asm33128b3a.4.2026.10.29.14.25.27
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Oct 2026 14:25:28 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91c938148eeso2353516d6.0
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 14:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793309127; x=1793913927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AaqGunwSleeDLPx2z6NkDc6zUunPgMcaEWPlGCr1dr4=;
        b=SYZDi6rATPJq8Zao52OYuJ6jxtqhnjs9qWKUQL3KRTs6AUtSiwJwrxjaXaM83bCBOx
         Cf3esCbw/lNiR7wzHgulnZUSc6iCsQSYKqPk4UQWM0Lz79C+8FBuYnfCdU+jq85bkyfH
         dySV1zu2AVk+7ojehfNw+sPmXsXWFB6ejNXgs=
X-Forwarded-Encrypted: i=1; AKwUvBz414G1JUijsLVVl725awPYFQz6Bcq0pU78WGuOiaOlCG23ByklHAvLLbS6FWkX74V+v6RD8lXXBLOv@vger.kernel.org
X-Received: by 2002:a05:6214:2f89:b0:914:48c8:6961 with SMTP id 6a1803df08f44-91ca4b6acabmr3500656d6.17.1793309126823;
        Thu, 29 Oct 2026 14:25:26 -0700 (PDT)
X-Received: by 2002:a05:6214:2f89:b0:914:48c8:6961 with SMTP id 6a1803df08f44-91ca4b6acabmr3500336d6.17.1793309126431;
        Thu, 29 Oct 2026 14:25:26 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca314fb6csm6384936d6.34.2026.10.29.14.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 14:25:25 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>,
	linux-ide@vger.kernel.org (open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM IPROC ARM ARCHITECTURE),
	linux-phy@lists.infradead.org (open list:GENERIC PHY FRAMEWORK)
Subject: [PATCH v4 1/6] phy: broadcom: brcm-sata: Keep NSP ports in the shared PCB window
Date: Thu, 29 Oct 2026 14:25:08 -0700
Message-ID: <20261029212513.4126083-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029212513.4126083-1-florian.fainelli@broadcom.com>
References: <20261029212513.4126083-1-florian.fainelli@broadcom.com>
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

Northstar Plus has one PCB register aperture for both SATA ports. Its
per-port OOB settings use separate banks, while the PLL registers are
shared.

The 40nm MDIO refactor made all non-40nm platforms use a 0x1000 per-port
stride. NSP previously passed the shared base directly to the helpers.
For port 1, the new stride moves the bank selector from 0x1804033c to
0x1804133c in the AHCI register window, outside the PHY resource, and
prevents the second PHY from being initialized correctly.

Exclude NSP from the per-port aperture offset in both read and write
helpers, preserving its existing bank selection.

Fixes: 0ed41b33882c ("phy: brcm-sata: Correct MDIO operations for 40nm platforms")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/phy/broadcom/phy-brcm-sata.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/broadcom/phy-brcm-sata.c b/drivers/phy/broadcom/phy-brcm-sata.c
index fb69e21a0292..b5fb9dff1ae9 100644
--- a/drivers/phy/broadcom/phy-brcm-sata.c
+++ b/drivers/phy/broadcom/phy-brcm-sata.c
@@ -215,9 +215,10 @@ static void brcm_sata_phy_wr(struct brcm_sata_port *port, u32 bank,
 	void __iomem *pcb_base = priv->phy_base;
 	u32 tmp;
 
+	/* NSP has one shared PCB window; its per-port OOB banks are selected below. */
 	if (priv->version == BRCM_SATA_PHY_STB_40NM)
 		bank += (port->portnum * SATA_PCB_REG_40NM_SPACE_SIZE);
-	else
+	else if (priv->version != BRCM_SATA_PHY_IPROC_NSP)
 		pcb_base += (port->portnum * SATA_PCB_REG_28NM_SPACE_SIZE);
 
 	writel(bank, pcb_base + SATA_PCB_BANK_OFFSET);
@@ -233,7 +234,7 @@ static u32 brcm_sata_phy_rd(struct brcm_sata_port *port, u32 bank, u32 ofs)
 
 	if (priv->version == BRCM_SATA_PHY_STB_40NM)
 		bank += (port->portnum * SATA_PCB_REG_40NM_SPACE_SIZE);
-	else
+	else if (priv->version != BRCM_SATA_PHY_IPROC_NSP)
 		pcb_base += (port->portnum * SATA_PCB_REG_28NM_SPACE_SIZE);
 
 	writel(bank, pcb_base + SATA_PCB_BANK_OFFSET);
-- 
2.53.0

