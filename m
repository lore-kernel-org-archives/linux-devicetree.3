Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793039368;
	b=ucpbUMbhb2h3Xixl2qy7aGQri6AdPnU6sITfHT6L90HU6GBqeUbFqyY/EEIEywqxghuI
	 Hcl1f4KCPFIXSQckaHXVfRG3JlblY88ilw+KRDNm6Xu/BRNsp5QVco4dvepnbEs2Su24F
	 uK73ntSBuKhV2u8VKVuRHn6tn1nvHvm9wh9T0C2XM4V04P5O/RwFZPQMl/p28vL46xlkv
	 ZdyEdBa+GY0dlPhcMzy+1KQy2EM9QSi7hXY5tLSH5m/cC5tmsz3eAAMoKav6QAZlVnESq
	 /GAVbDD1pcgiZfZ2AqjutyY+t/ZbcTGDtqqX0McMSzwkbjEdQ0kntM2/96Y0LUOK7Xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793039368;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=AaqGunwSleeDLPx2z6NkDc6zUunPgMcaEWPlGCr1dr4=;
	b=uuhftDHkev+C3Ed8BGz0/nz2B3j4SRKAxuwC1Tm+IVuuSG5iVK6oDa2rrPYxRz2dQHTI
	 /ZbBBX1CZaVdeUH6XA7r6hCME59B5gwtNzHU1/jocPz/TIakGqPLT8YF1RhJ+NfQUtdGX
	 4REe5/AXBKh0ZKy2wBEWe4qqGkPOluLCG6JAB4paPZBYt5+x3hz+QxHmjE1S0KYp60eB9
	 GNeqXr0w6wvpDjCDiHRqnRqr6VsvfHzUjaq6Apq98MMmHfWMMiJIPasYFaN8VZAcpv0hf
	 ul1PLZ5V1okWwJBLIlAlC09pRm3bSKVDOR5roKkIF7wpx3yVJEuenft4Z5G8E7I6NVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=NrdJqHUm;
	arc=none smtp.remote-ip=209.85.222.228
Received: from mail-qk1-f228.google.com (mail-qk1-f228.google.com [209.85.222.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77740606A31E
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 18:29:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77740606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=NrdJqHUm
Received: by mail-qk1-f228.google.com with SMTP id af79cd13be357-93f079a63b8so312651785a.3
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 11:29:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793039367; x=1793644167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AaqGunwSleeDLPx2z6NkDc6zUunPgMcaEWPlGCr1dr4=;
        b=e0Gi2Qf7qVn+rLDj3o3u2Afy7uFowAORULGj+XiVsUEJ0pIadaaNr/lh/gcRLrmGBc
         ybao8WkXaUSEa/B9clCc7X+zO3THMEeWLZ5AY6e5kD4WTqY5LNcJTLpKeq+3YGDvMQ4d
         atP4SZ+gFR3YIt79lC40UrumObRPj+bKN54nNPAtpO4fXLIx91A+dnpR5FhMX7unZW4d
         UeZKuxmizoy891cWdIcfi8AFmTiBJiXRbRGQJBRNSyRyjwxcr77aFPKcNSYwvyPkq9D3
         7h6KlE7L6p//8tKAR/VcEtbXAMWbqvpIvdgaEYxAeCfxdBVCv3jvyufvTNPxL2RDVNvR
         Brmw==
X-Forwarded-Encrypted: i=1; AKwUvByBuSSBE2bmyxkAMCx2HDObm/Pe1Sa6Tx02RF08Xh7flmktIMpl7Lauvh7SkmQmSETQZvFi6PjaCs2H@vger.kernel.org
X-Gm-Message-State: AFq9FYJCQTP7Y/uixm5E3YcOBa8mArarzkBWbftux6Lk3fbNvn9C5vzH
	t/QYwjs7xrLbybKwMDUl+eiGdhQ1KgXfcfvUlahWizWQTO27nYqZQmZCO67G6JlaK7Ix/1rD7pA
	jmj/yDsPuIemRP4lrnqW/W7ucQjTGMZLUa3/dfRdDtPkqZXgOFuRzJJMr7wBqH6z5Ae9KPfo8FW
	IAx4tYpKULun5LfnH9GNR0oj38qy/0Uv8No1cFgZfmpPtS5yGc5CyIsR6/QQZTN0WClZ/9PL2u6
	4a3MX/YxR6KAkVSQWWajHff
X-Gm-Gg: AYBFou0ZApqV7uiFGp8+t9sLtrTB58rzWSZbiFdQgZA+S0g/XFVl1x+kAhorNnqhdMm
	+PRpvrq8AXp3BD5DtDEBvCemgogjaEzDxAoQDxX3o0Hy43ZPwrmEqO6T0MD4mGKVeehJRB7HVS8
	azSy1pIhfhjsxEKe+Y5usv2sRpV5zZWL157rH7+xJkSOxySfmUkxFA7LbLxHdSsrwiveEYiUDqG
	UD5GhELAifxUVKTRNyYXcRq46nKtDdZ+mqUFhwj7EQixBqp51MQAcOe48WdH6hTQYAZMwOuX0og
	GUpl2Z/AjHlXbPDWc6GwNL/X15+a1kuUhw1mYCUV2CnOZj5Xa/LIPcUKwock+v3w2OFUdz0/fQD
	XNeet9hhh9WnT14OoB50nTjL+m3Y8EK5+Ajnhx1cTYtrKSlwSOxQHr3nCpOQgXPWsxNexyGuIX4
	2WGviw/DZ9SnBboFn6ot0YQs0UmVc0iqvU4fCQhxFJ
X-Received: by 2002:a05:620a:4001:b0:93a:1048:7d2f with SMTP id af79cd13be357-940ef93327bmr1111773585a.41.1793039367480;
        Mon, 26 Oct 2026 11:29:27 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-23.dlp.protect.broadcom.com. [144.49.247.23])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-940f06613d9sm112150385a.4.2026.10.26.11.29.26
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2026 11:29:27 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3510d0baf63so9419332eec.1
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 11:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793039365; x=1793644165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AaqGunwSleeDLPx2z6NkDc6zUunPgMcaEWPlGCr1dr4=;
        b=NrdJqHUm350MLdrMsPBipFdOudEhxlwhjdFscE+PcsUJ7vtNvqiU5npnzYfdWYJl0v
         XKoZa/oL0QkAitD9k45Y+zVS/LQTGS2gmxxiLRSpwoQMqrWq9i7OOASCjITO6LrnrJ6/
         6TAqbM+rcWIVordiufiCxWgdWjD5+6cdXfcBc=
X-Forwarded-Encrypted: i=1; AKwUvBygIraYyzbEdVojXBD+xSkqc9s1l50xRfe/ycfqd3se/n2iaan7dN/pUZ9zghba3flQ4+jrU5nDbw0z@vger.kernel.org
X-Received: by 2002:a05:693c:80cd:b0:34c:fb30:3e30 with SMTP id 5a478bee46e88-369e842cbf2mr12303469eec.7.1793039365336;
        Mon, 26 Oct 2026 11:29:25 -0700 (PDT)
X-Received: by 2002:a05:693c:80cd:b0:34c:fb30:3e30 with SMTP id 5a478bee46e88-369e842cbf2mr12303426eec.7.1793039364706;
        Mon, 26 Oct 2026 11:29:24 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a01fa4c58sm24657259eec.21.2026.10.26.11.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 11:29:24 -0700 (PDT)
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
Subject: [PATCH v2 1/6] phy: broadcom: brcm-sata: Keep NSP ports in the shared PCB window
Date: Mon, 26 Oct 2026 11:28:51 -0700
Message-ID: <20261026182856.3168686-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026182856.3168686-1-florian.fainelli@broadcom.com>
References: <20261026182856.3168686-1-florian.fainelli@broadcom.com>
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

