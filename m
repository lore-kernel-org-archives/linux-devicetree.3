Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793042295;
	b=iXjY3Pn/t9ntP4WmtQJfIse9iqah7EwuVv1BpN3MnPfYE+yaoNz6zWcwHkwML6p7jjq+
	 N9B44aJtIr+gsq5hpsZceyw63GAW6RCa5Nnt/1wC8MTedFrBLgQzspwoK41PSqcWnM3hl
	 6pCHwqeQY7sB4N2sYLmrnj+PZXvVAR/yNVustjib1KOl21IX4y4oHFqucZn5nMO1jU5hI
	 EFQ/hawDveNQlKWyIaYDIht5sS16UpgCk3osq3JWWSkNBgvmnSRjF4RkTTNFmT1x4uU6H
	 55FvqlAf8qHrdKToAsV67+zhYhYviX7zHhcbzSyUIBq/gX1A7x9I9vvs1+JuoOLTlbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793042295;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=1MIbl2zx8FaPW7oX7ST7fbgJ9gFOgJZeuRxXV0E1qzg=;
	b=TmP9KtRxti6jFILji1a4SNdLMDo3jQP0uioQWwk79sdsrEcleePhH2FM61E2d+UlwjJl
	 ItyXC+6iH8/7+2aXwxM8ojsSkO444BmHiTFvBI1GO+pWOs/jI1Sm0/qU+MWGR0opPi4hh
	 t0gB9YmybnvHHXiKaEprTtdluYmNp+VyTj3sNTpJ+GpBNXttFy8NfdJ3fcgP9tgxKEkqm
	 cm814togJPl8F9yZtb4OaKFcoHHZbcN3JZwnRB4Gc3zBgIqm/yJP31VVsBD9Y/mS7c+02
	 FvMLYAVO4HLV1mP2XGtIUUtHdHPomjLLlUkxOiZld2JH2hhTIdA3cTMJmON/BPs07ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ZaQw6+6z;
	arc=none smtp.remote-ip=209.85.219.99
Received: from mail-qv1-f99.google.com (mail-qv1-f99.google.com [209.85.219.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7BB6606A330
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 19:18:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7BB6606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ZaQw6+6z
Received: by mail-qv1-f99.google.com with SMTP id 6a1803df08f44-91bb5795792so39873186d6.2
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 12:18:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793042293; x=1793647093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1MIbl2zx8FaPW7oX7ST7fbgJ9gFOgJZeuRxXV0E1qzg=;
        b=2l/bac2sp08EGaMoA/6xoak6hO8Zm/FRI1742OXCDUPmVoBTdp1mqenPBfVfPePqZp
         MMJZjyXBKth2ArwUqdaX97THl5oXuPg1XETXMIu2GKyJNX7ad3qjB6vnAqDJdHBCuL9k
         GNMAXKL/LBvWgKMsVRxzp0S1WsoZXhrRNKf1fK8/vYYmPUURy3XjTxIsmRRkgz+aiBXm
         IvRleo6l44OefXwX9IxUsai/7y1wWlPSwdveaaskpwE55uriSNviNsuWzrWyj74fbtKs
         JZ414JcIHrfE44945H9TVgesQ0OT0K1R9EX1g2/tTLdWqF66PAw+v7XLSRQcTfTfBODU
         tavA==
X-Forwarded-Encrypted: i=1; AKwUvBwjlP7kp/lli+neCDg/r17ZjUIYoXBJU8W/Sh8c6rbXtuVb4Cuvtzr/oKtauR3lc3uE1fgTD/d1vLVt@vger.kernel.org
X-Gm-Message-State: AFq9FYLpMGQ7D9roBWcALSi622QaJQKnRCoClUTe/4FK9V4DQVY/Dh+V
	rYIEBODTT9LBuNfqMbQTwutxVbWtLSmcwZQKejUvDWkM/ehtiFFd+3bAX9zWQAkbLRHTgMaVQmT
	l9mKQ4KpApErBxi0CLZ8DP0rtVA1iNqDdxj0YAXCSigY4Bhxmu+TpBNsmAyQ+PWMvFM2+NxOsP3
	DOAXtXDCBrRmytwsZm6r3Ivui72Mx/uuAU6GeestQlkY3HJ5FEqciueGVj16cuYL3WhsKo3CORs
	Nw/tncjjlAobkh/yJa4X8Hd
X-Gm-Gg: AYBFou2ZACqUB6HdXCRJOg3Y0QB+i7w4haINhBH5SE4VMIW8UUWPpPZjivC5C/H9i/i
	3F0dlxXTg5I/KY5kTIWDKQJMIMvrxqWe2WK9rFvGmi/09ZqItfGs/nz194uiXKnFhAvmHLwD+od
	zrqMfY3vtNzZip0zgxX5iHfx6dcFAB3/Nx0ypO3vb8LOMW1BV67YoSzvhlL+Ch5oyt7NoC2kqbQ
	+APKpsLoxf1PpePMuCqDl94xwWEl0e7m7Hd7/a52X5oLO9QFV6SJmikMBF4DUJ6/H5G+RHJKmBW
	xPN40ng36j5ChqDbXMSFejSp7PTd7ywOFm4l8Hy7U0A+JUfk621591WqefhdDyW+7wPek77nmsj
	B1wHp//mX2/T0j6c6XELOBviae0vElIYe4ozz3hVSeGvKRGNp6nSnn/vjA7XaHp4CKJLrcoI8SK
	gbN5wMAjUuG6h03aTmhPbwM/QPASd26sIG+L7HWJtn
X-Received: by 2002:a05:620a:2a06:b0:93e:c12c:9dd2 with SMTP id af79cd13be357-940ef9ed966mr1092495285a.82.1793042293533;
        Mon, 26 Oct 2026 12:18:13 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-940f06613cesm117379385a.6.2026.10.26.12.18.13
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2026 12:18:13 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-917a7c17166so76347436d6.1
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 12:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793042293; x=1793647093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1MIbl2zx8FaPW7oX7ST7fbgJ9gFOgJZeuRxXV0E1qzg=;
        b=ZaQw6+6zFxoBEbQe/sz92TQ46W9SM3oo9ELw08440qjow1aYBXUv1cb2a/dcY/Y1MM
         QgWcuh3h4Nz93wJV7hYyzRuzrRGhby+o2jok4D+0UePsTnegdEdZ/zqtpSCZEE7WpQYk
         frATGascxUN4IK5iHAPC7pjDVhdNWPhhd8Ggc=
X-Forwarded-Encrypted: i=1; AKwUvBzeknJsnfFLHpHjUY00bP4nKOWc9LoTBaNyv5o76a4tcu5u14GHDakO/DNQ38cVrJ6xeOb5BsQ086Ao@vger.kernel.org
X-Received: by 2002:a05:6214:3c8e:b0:915:e5c8:5663 with SMTP id 6a1803df08f44-91c48cd11edmr127063586d6.4.1793042292701;
        Mon, 26 Oct 2026 12:18:12 -0700 (PDT)
X-Received: by 2002:a05:6214:3c8e:b0:915:e5c8:5663 with SMTP id 6a1803df08f44-91c48cd11edmr127062806d6.4.1793042292066;
        Mon, 26 Oct 2026 12:18:12 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c62063dacsm33430996d6.37.2026.10.26.12.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 12:18:11 -0700 (PDT)
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
Subject: [PATCH v3 4/6] ARM: dts: broadcom: Add the NSP SATA IDM registers
Date: Mon, 26 Oct 2026 12:16:16 -0700
Message-ID: <20261026191618.3178830-5-florian.fainelli@broadcom.com>
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

The NSP SATA description omits the IDM block at 0x1811e000, leaving the
interface clock and core reset dependent on firmware initialization.

Supply the IDM as the third controller register region so ahci_brcm can
perform the downstream clock/reset sequence. Extend the AXI bus range to
cover the complete IDM aperture.

Fixes: 8dbcad020f2e ("ARM: dts: nsp: Add sata device tree entry")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 arch/arm/boot/dts/broadcom/bcm-nsp.dtsi | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm-nsp.dtsi b/arch/arm/boot/dts/broadcom/bcm-nsp.dtsi
index 6a4482c93167..9dbcd810e27b 100644
--- a/arch/arm/boot/dts/broadcom/bcm-nsp.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm-nsp.dtsi
@@ -168,7 +168,7 @@ periph_clk: periph_clk {
 
 	axi: axi@18000000 {
 		compatible = "simple-bus";
-		ranges = <0x00000000 0x18000000 0x0011c40c>;
+		ranges = <0x00000000 0x18000000 0x0011f000>;
 		#address-cells = <1>;
 		#size-cells = <1>;
 
@@ -538,8 +538,9 @@ sata_phy1: sata-phy@1 {
 
 		sata: sata@41000 {
 			compatible = "brcm,bcm-nsp-ahci";
-			reg-names = "ahci", "top-ctrl";
-			reg = <0x41000 0x1000>, <0x40020 0x1c>;
+			reg-names = "ahci", "top-ctrl", "idm";
+			reg = <0x41000 0x1000>, <0x40020 0x1c>,
+			      <0x11e000 0x1000>;
 			interrupts = <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.53.0

