Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793049129;
	b=Ag22oeasmh5PmqZrzl/3FSeP4ydotrSvcr0wNClXUr+ipombsn6Kh7qSBi62rHGKYJKu
	 IW8VTiDtmKRuMuLanvo399ghfKenRtsRWTvO3Vsg48ESV0NXvQZMfy0z8E5u24SbnG3lR
	 CCbAPYRLs7padj25ZAaJkPUdVSna+fBMv+gjUtN/TLgV/WBtKXX+oHEN7Cak3RELd/eKT
	 UXJWVKjGEtudBPkVBf3OLJYOladbyOG02zdJihaXmCpNamUWVcZuzS33+LH1WCktVqsUX
	 gMkazintdAnzCD3hfqYiX20UwCjZlcY+ipnzdupl14GVeZzrrYqlgyGi1MpgAtFMbOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793049129;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=QkAGfe/UDsHGvMGKL2L3uZbprb9NTy21LdH6RR7axyA=;
	b=eCP6CbXiUFfhYmr+WzACnVtRNK+gmsTDz1RwD6pDHOdQ4BahJc1mTUgptkni8fBMtMBG
	 dbIGiyyxXWxniujnQt/PlA52Sko4p0t1O1s0brz7n6bobfVRFbXx2eIhYS3iVXaz2KDqR
	 XFO9DjrScRBtDmXhnvd5f0OnRusoFCILTM7fl7SUh+Q+LCJO25nVbwjutMwo9AU7tnUO4
	 PNJXrUWUuXones5bXTn2tvwnFiMNE4R/fLJqJpmRk7YMBtUNtRa9vVKCVIS7VgvsrchRk
	 ZYOOpFh+kSXvtB5ZQ7naE1KN6/mswsmAXdq1u+HrU1foFBL7zhE67uSclB+aGlLR05g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=PfhwGTgB;
	arc=none smtp.remote-ip=209.85.210.100
Received: from mail-ot1-f100.google.com (mail-ot1-f100.google.com [209.85.210.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A32606A32E
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 21:12:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53A32606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=PfhwGTgB
Received: by mail-ot1-f100.google.com with SMTP id 46e09a7af769-823e4047037so2759155a34.2
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 14:12:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793049128; x=1793653928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QkAGfe/UDsHGvMGKL2L3uZbprb9NTy21LdH6RR7axyA=;
        b=sZwx9pJsKCvaCqNZz992HU907jdLencxYJ61IriiBmC6ZEcJBokhjQuKisOpWQqvZe
         ewB0AdMqqsqU6k6r3Pc1MucOcIU0PWW9mcyBPTXLTnLUjGgp0dGCNNx8EejVaSeF/8aM
         QyB8qFfhGztGDBiqK9PY5OPwae04t3G8Noc8hHPIYO3I+Na4ksq6UIANeptEPrZFvC31
         UdWUkLCps/4rUQrtaVtyyNhqWHi6WnYIUlJfKjtVTUPb6AUn/J2JvACK/jR+hIkXeoNp
         kTXRyliB4b+B4waj6FQ1imMqcrvKxUCZ6D5b3e7/2JuKCQgHK60IMg6+DjKjk/X6tnpY
         Y+kw==
X-Forwarded-Encrypted: i=1; AKwUvBxXTahm2XjVVIdPrkhAcv2Aq/xEcNS6hCTmbQAcQfcSc3zYewc7NGbgQMTDrNEucfaUYsLaVePi/+Sa@vger.kernel.org
X-Gm-Message-State: AFq9FYIV6FfoPdLXrjeuGkMAxTQDaQrkP4Ods68d4jeOoWbD3kmPgHZ0
	t8I4MDR6EIHAt+slIMMm5m8RYVtHyzgL4up5w9ldunB47fuglaYTf++uQDTgcdEWGg7pbHfYba3
	eBscC2hRTv9QuXgV7BHHGeUIenCRudVNMYW0aBUeeFAKeO/TthjH1pR8zOSo62QqHxdxp3u92BS
	ipOuPR2Kfz4K3h1jsORpGHFfa2sN0N4UyKc1OocJkretuSBqAJ2PHzOasfD0XUmLCe6/GWsWKRb
	b742EtWBlAZkKRifnnYQKjk
X-Gm-Gg: AYBFou3BXqtsn9cEHTJARktWI8mXzhrKWJINeX7evHKYCek4Z3ooVxJpYXxHQ2Fraia
	8XwGT5LpbOVsQEvBrh2FnqIhsSIoQn3QvRt+2XiggVtpLOdd2Ce5FkRqK7252s2fyP3s4U1nHIO
	7IxZq9PdeFbLbwE6ZLQhR5ARMiMHbWdPPI9QrwbFAH8IE7BVng0LsZeCB+DP5XmzB88NUbiEJC6
	MJKwpfm5pXRCHTa8mPrG9e6dK9WMKtKwsx6ka02QWpYh3/h/d49oMojstAag00Sj+l1Of33PstH
	tmRtePds6wO1JxzdeNPrpZVhEe9Nr9Y2QktCWrT8b4eBXI+ffsB4aPp8rdR/X/kJ2dZMexer5BC
	hxO51XJcFi/XeCDEubWllxWCCKWQNSFQoOFh21+zVjdcBUd1Nh5oBn9BikrdbWqBLFR8Tf98b2g
	zZnytKHv+8110A41b3zw5ZBy8xMOWMGNVqJxSG2dqRnLQ=
X-Received: by 2002:a05:6830:6512:b0:80c:d34f:5f63 with SMTP id 46e09a7af769-850ff587241mr6330225a34.28.1793049128186;
        Mon, 26 Oct 2026 14:12:08 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 46e09a7af769-850faa931bdsm93542a34.9.2026.10.26.14.12.06
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2026 14:12:08 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33713e5e6daso6416101eec.0
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 14:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793049126; x=1793653926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QkAGfe/UDsHGvMGKL2L3uZbprb9NTy21LdH6RR7axyA=;
        b=PfhwGTgBUJ5zVQWhxz7I/MWHGTjwtEFi9lj8OhLboPwwYtWFCEHd6vrlAKSuoPTfNQ
         PVmETTYCdSTnH2Kn5A2I15wJ80v5D5POqMQVujnoUbNWV+cplC0XsBh9VxycTzpjOeTd
         7YXlmUeWiyFXpMMax+eVFNra0ZwM13Sq8eX9w=
X-Forwarded-Encrypted: i=1; AKwUvBwwLZHKl9SHqL8G4biM2S7VojYdMFN8EI4MNJESpA1nEVMCCuT6KNYJ+iaJKhaRZVbKB4EV93Q2bTX4@vger.kernel.org
X-Received: by 2002:a05:7022:eb50:10b0:191:a5b2:ef4a with SMTP id a92af1059eb24-1993677ac8fmr11277914c88.28.1793049125748;
        Mon, 26 Oct 2026 14:12:05 -0700 (PDT)
X-Received: by 2002:a05:7022:eb50:10b0:191:a5b2:ef4a with SMTP id a92af1059eb24-1993677ac8fmr11277868c88.28.1793049125085;
        Mon, 26 Oct 2026 14:12:05 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a0f81ea9sm31915678c88.11.2026.10.26.14.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 14:12:04 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Besar Wicaksono <bwicaksono@nvidia.com>,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-perf-users@vger.kernel.org (open list:ARM PMU PROFILING AND DEBUGGING),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
Subject: [PATCH 3/3] ARM: dts: BCM5301X: Enable AXI PMUs
Date: Mon, 26 Oct 2026 14:11:51 -0700
Message-ID: <20261026211151.3212237-4-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026211151.3212237-1-florian.fainelli@broadcom.com>
References: <20261026211151.3212237-1-florian.fainelli@broadcom.com>
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

Describe the three BCM5301X AXI Trace Modules and enable them on the
BCM5301X base DTS file.

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 arch/arm/boot/dts/broadcom/bcm5301x.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm5301x.dtsi b/arch/arm/boot/dts/broadcom/bcm5301x.dtsi
index f06a178a9240..dcae7cba37c4 100644
--- a/arch/arm/boot/dts/broadcom/bcm5301x.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm5301x.dtsi
@@ -10,6 +10,21 @@
 
 / {
 	mpcore-bus@19000000 {
+		axi_pmu_m0: pmu@3000 {
+			compatible = "brcm,bcm5301x-axi-pmu";
+			reg = <0x3000 0x1000>;
+		};
+
+		axi_pmu_m1: pmu@4000 {
+			compatible = "brcm,bcm5301x-axi-pmu";
+			reg = <0x4000 0x1000>;
+		};
+
+		axi_pmu_acp: pmu@7000 {
+			compatible = "brcm,bcm5301x-axi-pmu";
+			reg = <0x7000 0x1000>;
+		};
+
 		a9pll: arm_clk@0 {
 			#clock-cells = <0>;
 			compatible = "brcm,nsp-armpll";
-- 
2.53.0

