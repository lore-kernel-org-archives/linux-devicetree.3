Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793309138;
	b=jE3I3pzIsewRCG6i4AOKMR9JWE0xnNtLFbEw78TE9M3OwZmUhYKOwuklv34cEvnfZsfp
	 qs2MZmh9zM2fISQIvuGz+0S2tHK2QMS4N1UEoo5TUOxzNK98yMmwyvzkwLO3AQWj9gBLE
	 fVbLu3MxpaQW4kaZJrpypwoTt973+IAi3+s++wA4pzKDRDlUvwKbohSlpIndHndREp4ei
	 zNC2+KLfEik8n/ixUU4OONaX3MQH1MdmZKbk6UpXRtEIJpHKVSMuidtYZsqHr+SdFY6vp
	 zaFvKkLo3hhFpMHJWE+2i8zbypiO3l+1kb9VpHCN8XjeEUOthmcBTHZkPe4cBgG6aBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793309138;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=1MIbl2zx8FaPW7oX7ST7fbgJ9gFOgJZeuRxXV0E1qzg=;
	b=zG9xMpVMx69IMtHBugL7yGsyzW1EiWk3ojtKPQiTlk2+3uCPEbbUG2pzCQfKwJDLXFUI
	 T1AriNpuRIw47GbjDMhzpnAVZrU49DmrSO/6AjT8ZzJCasyz3lg7Oifh44VZAmoJ8Q5vJ
	 d8y6GVUw2JPI3l4rJeZU8JRjL4nWzpLNn2iWqKsaC0b0xu5iEhkLVsSuqMtE60rjWfcC7
	 3y7kyJalE9ayK22Q/mUmoRgUPtOvBCEh54KMFIvrYvkg8NTg2Iks5Zduo1G/Ok3c4EDZ6
	 csf1Klf/D/32+GIF49jCJzQ9ygPlAtjKkFbhiuDr+zh03ffahB7HQ1BVq2HA+4cQ5yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=OCcZJ1lC;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAE060A2602
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 21:25:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCAE060A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=OCcZJ1lC
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3ab752f6244so56631a91.2
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 14:25:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793309137; x=1793913937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1MIbl2zx8FaPW7oX7ST7fbgJ9gFOgJZeuRxXV0E1qzg=;
        b=YsSs1JOD9lNXjYRkmqQqkWhEyuCNd96Df040NYXVaTghMZVu/OqjHA/lF1+Awv9rgD
         TKTwz/sbbkG3Noq0wwSdHaNzlVIqYYqjpbTYPxSFrkTL35uknWB5Cuei4sjTA9PPb4GR
         mtpZn/WE/V8yS2C23EglwgNbCCqANHjtaGkvpfJqdCuJEmnfX84DaSvHjD15ARDcLysK
         IIKtIvsUhoUD+2Url41plFifFN2dX8oDhzSa0SPcAKGLmjwkFTRm/7f/WjycmbBjq27h
         xAbOTm2KOaWViRE7m/Oftua70TIk6He+uZeghAS4Fxb5rC/vOkWSMiQAtJL3+hpiDMmi
         1DpQ==
X-Forwarded-Encrypted: i=1; AKwUvBzUCrIl8t7+RnsTOrfwL5AvmPlh0SYILCyc8KrGYHzfpNBa8PkloKA2gT55UFEO5KwANjIkVCf9MD/W@vger.kernel.org
X-Gm-Message-State: AFq9FYLfAraRw28inH6lBZHcWkHgsAEa41BVzd5pHKJJI7HmI3nZZiXy
	BtMtr59ZqTF6U91OPw5Pe38Um6CIj57kxRkdPnAQIhVqClKysZ8seRXN85EcnKs63KIkP8YTaQb
	UkaPvlSqYnvFXcZQuGecbqjdv/uPLWXKA74awyIDJRPBLGk3ABVHRkh4pIu6Ldg6ZZb3+X6Bevx
	/fTXsC8BqF1wqtosHHQ6VDrfVwLLdC/mg5CYGoDZU1JMTJ0wB+5GJ9h5XAKZeBvVgb6vxtaZhn4
	PEVzl2SHoNakJsx5XGxmw==
X-Gm-Gg: AYBFou33aD/4yAb9Gh4f6t0Z37r9lF83eH/Xx7fLDqkNdh5WBrueUJuJJBQnX4fhgiC
	BMFOzD9oSTDA/WX1WKnNhq5+S0PfVraLSHdTS/ib+V3zfM+2AfGDh0Vb9rVYb+EV+u8j7iAwwzV
	JAzswlPtxIFUwhLXxodFCgx8hRJAjUg+T9uhvDGdLxBJ2KQw37v42l8s6yg6QWWCjbP2LOEGYZr
	p9ttA3J8XNWaU7e1Vt2d+TJjL0t5hEv8bp+VwP5BqSwdmnNJ9MvlNIUCO5wJ4yt8JjxzBRtaHEV
	cQCUaQerQsLmlNvcspHiVRleFLmNlI06Xl+v0ZqHM8QyPiEArN3Vyg6pc25jhuQGcwUeYcYAR8w
	rmC5hEbA99uF0xF85yJ3TQHsbdt2yNXX4frELfeCN5E6iTkmk8G0HChIITNl8zetazQ0V+CUFDu
	yuto5DqliQ6y/LgBO/4nvv9p8NPpPKXHN8+P9ExwHn
X-Received: by 2002:a17:90b:1b0f:b0:3ac:9f24:44be with SMTP id 98e67ed59e1d1-3ae897f55e5mr207662a91.29.1793309137260;
        Thu, 29 Oct 2026 14:25:37 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae6e88749csm2736456a91.7.2026.10.29.14.25.36
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Oct 2026 14:25:37 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ecdc701a2so315730785a.3
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 14:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793309136; x=1793913936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1MIbl2zx8FaPW7oX7ST7fbgJ9gFOgJZeuRxXV0E1qzg=;
        b=OCcZJ1lCcla5nu1XRchCwUR4ui/IM/5jiZ9jyB51n2JPCnVzXY6DOGoaTrm1LDLPwz
         LbHJHpII/5V4uoHwyKZqY+K1fIFa7GyxOhYkKlDfrBNLQyp47YMpewYDy3bwrB0WNL9L
         h2UPHAcwopF4OdUAcn2vqNTlZXW86nlD3FJug=
X-Forwarded-Encrypted: i=1; AKwUvByijgIb9JCJKOj/nak2oJlq/BkTmvLw+RzUjcdTaFe+XM3rq/3Lht0pwBeOPkEcJwX4vo0SK5W8yxLu@vger.kernel.org
X-Received: by 2002:a05:620a:8385:b0:93e:48fc:aa88 with SMTP id af79cd13be357-944217118e3mr84086485a.44.1793309135634;
        Thu, 29 Oct 2026 14:25:35 -0700 (PDT)
X-Received: by 2002:a05:620a:8385:b0:93e:48fc:aa88 with SMTP id af79cd13be357-944217118e3mr84081485a.44.1793309134993;
        Thu, 29 Oct 2026 14:25:34 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca314fb6csm6384936d6.34.2026.10.29.14.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 14:25:34 -0700 (PDT)
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
Subject: [PATCH v4 4/6] ARM: dts: broadcom: Add the NSP SATA IDM registers
Date: Thu, 29 Oct 2026 14:25:11 -0700
Message-ID: <20261029212513.4126083-5-florian.fainelli@broadcom.com>
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

