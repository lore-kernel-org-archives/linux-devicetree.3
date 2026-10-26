Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793042286;
	b=JPOKEO+cyxvyNlejIJuRf5g6cNUiwzmq5xcDoBIgso2IW0fF/eQhT/tNHUEG6paP3kr0
	 cmr9jbAxHXmCOubg2n62nn8ObNIQN9IRHaKPhsLoXkBiOOLVuARNpdT41mTUwBhkNnvxq
	 5YiTnIlDpHI935xAPKYEpQIXAlCLVVLtTVfHmfEf7s8SdFQOihS4qpxHM+KS7pk1W+6sY
	 uCNaSFtfBqIkoWYpW1LYJI5KLmLuTmSVLwaP2Wk63rawjL7TXqIOfM4xXJ8oya5HV+nxp
	 T4dhdgzEls8sLJcB6oCvMHcqK+KXBrlJyXyCyOpo2FolZ+gTj347OL+BHsuGGDkfOwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793042286;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=AaqGunwSleeDLPx2z6NkDc6zUunPgMcaEWPlGCr1dr4=;
	b=DfCqb2DsM1L9AyStqPaWVEiGYuH3Vh4neRFvzaZA/E3TSxpjIE/ZEeNhkdfzTbVc8qB1
	 4JEF/rZ22DVNwTEV6KA5upgPjn6X1/AVQNHClOWeinN383ChCm8FJ+xbGsMMwe7ZwzYFb
	 ilpll77K4xCKCQtXy6At2/MZ4bfOioIuudxJiY9W7DC5xzrdKdNXfg6dF1EqQAD248Pig
	 G16dxCjCFG7uPe289OqKVJfy1Jno+ysOh45NXwFHXlWrfKZnNTJj2Nf7W1HiY5h3KVi0+
	 uBMa3tY25whe7H2Sn7Siy9Gi4Yzu08XsVKPkWN8b6drf26fFAPQ+2wJ65pVsrFoK9fQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Tn1WMVIB;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6051A606A331
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 19:18:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6051A606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Tn1WMVIB
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3adc4590de4so2304370a91.2
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 12:18:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793042286; x=1793647086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AaqGunwSleeDLPx2z6NkDc6zUunPgMcaEWPlGCr1dr4=;
        b=OmYf/ZcT+zqESbgwrdaANPoBTevKPjx3QRj8Sx/rRLmJIsHTPLqviEcTTVmZz0+z7R
         E3tG46qn2TUiVo5JRzIPBmtAXoh8JzwDaw0XRHaTuv+O89Zva79fgYbuTj10sA7l3t6I
         SfpoqNYJdBYi4lwiyOqT1REI0VyeFNslR69QN5CdcJCJ4psfq8ZH8TmFY6E3sH1WoVuG
         67O0AIFcO7AFyDcpFBKPb5sI092+gFKm9J/dxpeGlNLllh0qoG+nMGj9hxQe6ayRCNcO
         MdLX5wa39PqBTZVvL3xdB9tq3JfcLj/1yapSf7OpRqfvuUaYs+7kq2JSktWRB1FR3cL4
         IYOw==
X-Forwarded-Encrypted: i=1; AKwUvByKssDVIOlbp/E+rC1z3WpXbaTaw3dxIiRZ7CSihf047KCIMjWJj386YjQ375if0tWAESzfwsruih+u@vger.kernel.org
X-Gm-Message-State: AFq9FYLqOzQEN0FBuzN9t4Un2roNlRXlENKCcBGUF51L8GHCSReOXHNw
	X5koQhq5J/+ei/twFVr1Zi+YXnDyVeLE/xzCXjzHx4xh+ij2cuvAeJ3PW4Uci4YCfKQy/4u1xR1
	QWJT1Q908hX0+9D9ER7ZJvJ6M/VEk5F5zRgpUO8PrhH1hOojVPcSuyRwHOxoQ4Ky2nGwlF9ruiW
	dtYPvXrunRABxpDjWON/YsVPSt7Ai/mWc4xV9ETHOPpUzmuDJnioEmofiyA4DVMtSDV7e+O1AY5
	FvymFihRVlaAE5x1Y1bVg==
X-Gm-Gg: AYBFou3bTGwW/CC90u+QDY35oIMPKDeSmnbxBKIEIyuZRrpjQNxQRY0v6iBIRJT0JEl
	btk8/erLnyCagvp8zptOPegafXSUvzt2dDPJLtqSum0rmUhLoZkvsd/aUCxAaU2YRcjv5JfAzpR
	m8toEm+D6zHzFo11xywd4zNL0A8johhayOkShL8boZsTQw+peC+eY8WVUz1GfAbBNjQau/OC/XA
	dUXEADTzDWV0RgQULhaMWLtXjpY+KbB+md90osAYvjZdIuvCU5dWQ5Y4bN5tNnpcxsm7yRhEGra
	bBhXqByoUSBjLr5QBYVZKB4vfrtsTJtD4LOvLD1+FnDZac/FBbqifsYm0M0YUjtygdPJN+o5Ck4
	N31nVDXsq0suIzOsTYkr+DnvTudJUubflmXGJTE5TFlo1qvgL40wcR0GxfBCnODZRE90CwRA8DQ
	7jOfiWOTzDPj2Ah0RYy+xInau0tlMKvUqbKSIkb7w0
X-Received: by 2002:a17:90a:ce09:b0:3ac:929d:ba5c with SMTP id 98e67ed59e1d1-3adeaf96220mr4618216a91.45.1793042285628;
        Mon, 26 Oct 2026 12:18:05 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae406dc8fbsm320199a91.1.2026.10.26.12.18.05
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2026 12:18:05 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91c44b8fed1so61931806d6.1
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 12:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793042284; x=1793647084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AaqGunwSleeDLPx2z6NkDc6zUunPgMcaEWPlGCr1dr4=;
        b=Tn1WMVIBGSyvEXQW6ghXykDqjZsixbqHSgiyjXQtlTsblqZtOCn6qc4YHUg1RknSqu
         fGRmg2itEUqXrX0YuwUnu1Rkvox2ehEV0ura38GsFIkufp8ABgnIv4E3BYx1e2oMi/Pk
         N2YsiTY638Thf3Znlxj6q+CwLLO/Nwois6aPI=
X-Forwarded-Encrypted: i=1; AKwUvBxfzlGgawycsO2xQyELaNIcg3C961IIqkktOvnNjDNK2+Rsh7ypuLZEpJoiIc0R3DHOKSoQAV2R7Eoe@vger.kernel.org
X-Received: by 2002:a05:6214:5701:b0:914:5769:dcee with SMTP id 6a1803df08f44-91c48e36c9emr119686386d6.17.1793042284482;
        Mon, 26 Oct 2026 12:18:04 -0700 (PDT)
X-Received: by 2002:a05:6214:5701:b0:914:5769:dcee with SMTP id 6a1803df08f44-91c48e36c9emr119685776d6.17.1793042283921;
        Mon, 26 Oct 2026 12:18:03 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c62063dacsm33430996d6.37.2026.10.26.12.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 12:18:03 -0700 (PDT)
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
Subject: [PATCH v3 1/6] phy: broadcom: brcm-sata: Keep NSP ports in the shared PCB window
Date: Mon, 26 Oct 2026 12:16:13 -0700
Message-ID: <20261026191618.3178830-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026191618.3178830-1-florian.fainelli@broadcom.com>
References: <20261026191618.3178830-1-florian.fainelli@broadcom.com>
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

