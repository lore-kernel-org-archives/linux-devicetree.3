Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1F14CA26F
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 18:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781031475; cv=none; b=hyRqtncSwSRSloUC18+wAaXJrBqPeqrPuBNmMUMzm/PvbEHti6HIG6/oFRUvPRCEbajZL/RDlO4sfcmqGA2pDxAVgSt2rjth/kj+0m01uv+lfIpkEKXt1Li2S1HJArXV5tLuTRcHJehpOuo8Z6OZqrImInaCd+85yozaoC5fUFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781031475; c=relaxed/simple;
	bh=5Vs/P1kH8W3WWMwdKGloRidpstg2eGVpPTnXJh4QYNU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bq+HQvjusSKj++UPVSrU7wyJGmLqzcD/67B60Sej1m0V0c2qMC7z3KTz8N2WeWrUCJ60VBhPGxzxhUn1ku5n/XZOMBVK9UaH09xfRdSQOdYad8WHnlOLMGbZyXsmpJhNkXPHPBfrdhUutnmpooNH4WMv9MFpoRoXQY3kwIS3HlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=LDhUV3j7; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="LDhUV3j7"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490ace40f4bso68518815e9.3
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 11:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781031472; x=1781636272; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z9gerRr8/bGZ4SVtJ1fbui5Bt5MQZVRJLwoBqDR7WDI=;
        b=LDhUV3j7ZkNGfky0cgzqdsl7HbcTeAKkSVI6wch6ufdVSqIjIW0C+7AP7fTxa3BAQO
         ZMpU01lbydbwCrhdXlWdEnJOjZinMBUIj7l0CrXBrwsqo4/ZHsi7+P82M9MDdHNoXzhN
         hnFpoRSBqFCzyJdlpdKgb1JnmyTSnOVjhwjAUp5B0asjHrqnrq6f4rSUWEoopk4mn8a3
         VmdmkQb+V8n32RJx3R8ARYHYNW+00jLZlqmKM8XH3rfV1xlDw47C3wExe0dZSNPlxylQ
         bynmYvpowsoyqIiVCxVCo/fHpoSBnGWIiYgrrClOWO3k4Q9TbGveF+aPpR7ZZpIb4mkX
         daBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781031472; x=1781636272;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z9gerRr8/bGZ4SVtJ1fbui5Bt5MQZVRJLwoBqDR7WDI=;
        b=pyCz/1YuZP0IAlcmVLRpGdWzje/Tj2L7Hxpx4w+lQ6nH2Uu3OLxjD1TDAZc/h2Uzl8
         vJCwF+k7nfT1DV+YhPWPmyU3rD5y4cSE9sL7si6UAjn5wQFwF9CXXh6Gpy+mgVO78suZ
         grZ649xSPUwJOkWCZN51g5uv0N+12SS8QyPSFGbKmxtjfRyV1LsFe1FDWJlHCdAdePb+
         34LEcjyy+Oi0eJ6XY2KniPfvS9Svpb8ZEJjcDhCYGQNjVOm1JewYFql49To/RYNSRQ+k
         Jn9z73wTREY7H6GHd81jdZv7fo2aX6SqC4LuKKAh0MVxX64P1zFGCDYUAVXVCI2fMPm7
         RwQA==
X-Forwarded-Encrypted: i=1; AFNElJ+d56vxgJi71CkGMFSbGzl3i+slci9eeBQDmZGdjoQvQKitgz4O/e2fV2RCjLQef5acFiBzLO2u+svx@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc970LHwD4pT9wmcIr1KMT/maWgq2KwI05Zoo3B0w2OvwWvCbV
	DrVLdPC1rlFVai+z3PkDvS9YWEzwdWVOEPPqZwqp8fqGB3VwxiEvOXz2TXqe6RhiWOk=
X-Gm-Gg: Acq92OGm+QEpoNZmznfO4S/QhAsAqsG256HkxemzXwSoufE0SeUrBXaJJpBawWNJPTT
	6krmCq+8wKLstpWxOBK/inLgPOXbZVS9CZeJLmivqfrW+cab/Yv7lcxpeH94NqlWAxbVLIe4/h5
	cqC/Ty+PdFwNttyTEYw9qN9wzohi0L5ULOG3R/liU+5wYtqMxkwBiYoXFm3RN2MvU57/doaCfOj
	hXhFl4G98HIT0q47EYIMjb+r65N13UFo7sRxt6CsmKg2zTmSUGMpXoJ0/f+5l4cYEicsjeA/XLZ
	IWesFBPYBkAdH34/Qd3Kj/gh3X2fpwhOm9bbryzxvFWnbvLKUS+p4QXxfz+YPD4paNtD9K8/98B
	zAc0GUP9Vi6syY68dUvEYn0UegOVsgJaDwbjmaBQFEaPMT2QiO6ueOixbgIA8aZuOGJtm/vt6th
	4aU9oDbSwzBbePUAy3SbQx84Ij2GPRArM=
X-Received: by 2002:a05:600c:1f90:b0:490:b00c:8e6a with SMTP id 5b1f17b1804b1-490c2602971mr362579095e9.28.1781031469438;
        Tue, 09 Jun 2026 11:57:49 -0700 (PDT)
Received: from localhost ([2001:4091:a245:857c:bd97:47c2:83e4:8d45])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3918fcsm577657565e9.3.2026.06.09.11.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 11:57:49 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Tue, 09 Jun 2026 20:56:15 +0200
Subject: [PATCH v6 03/11] arm64: dts: ti: k3-am62a7-sk: Fix wkup R5F memory
 region size
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-topic-am62a-ioddr-dt-v6-19-v6-3-16afba97fbe0@baylibre.com>
References: <20260609-topic-am62a-ioddr-dt-v6-19-v6-0-16afba97fbe0@baylibre.com>
In-Reply-To: <20260609-topic-am62a-ioddr-dt-v6-19-v6-0-16afba97fbe0@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Judith Mendez <jm@ti.com>, Daniel Schultz <d.schultz@phytec.de>, 
 Andrew Davis <afd@ti.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Paresh Bhagat <p-bhagat@ti.com>, Bryan Brattlof <bb@ti.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, Devarsh Thakkar <devarsht@ti.com>, 
 Beleswar Padhi <b-padhi@ti.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Sebin Francis <sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Hari Nagalla <hnagalla@ti.com>, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1490; i=msp@baylibre.com;
 h=from:subject:message-id; bh=5Vs/P1kH8W3WWMwdKGloRidpstg2eGVpPTnXJh4QYNU=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhiyNxKfSkWfNci98W+m35S9XUqn88h9NH5dqnjzMfPiH0
 vOkq2JyHaUsDGJcDLJiiiydiaFp/+V3HktetGwzzBxWJpAhDFycAjCR9U6MDNuUpXQcnjLHvbil
 uclJfPH+7yfuzele/fhkRVtBNq+qSBvDf6+VZ41THFYzaD75ZfrBWpVz+Z0fNrumRc9sv3o8ao5
 jNwMA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

The wkup_r5fss0_core0_memory_region was reserved with only
0x0f00000 but the MCU SDK linker for the wkup R5F firmware on
AM62A defines the DM code/data DDR footprint differently:

    /* DDR for DM R5F code/data [ size 27 MiB + 364 KB ] */
    DDR                         : ORIGIN = 0x9CAA5000 LENGTH = 0x1B5B000

which results in an end at 0x9e600000. For this memory region which
starts at 0x9c900000 this means a length of:

    0x9e600000 - 0x9c900000 = 0x1d00000

Link: https://github.com/TexasInstruments/mcupsdk-core-k3/blob/k3_main/examples/drivers/ipc/ipc_rpmsg_echo_linux/am62ax-sk/r5fss0-0_freertos/ti-arm-clang/linker.cmd
Fixes: 77c29ebe76d8 ("arm64: dts: ti: k3-am62a7-sk: Enable IPC with remote processors")
Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index c1e9067b3bdd5ab0591541d4685bb17a5dac4f65..63a4fb03dc0acac63bc573e290ec613617f492f0 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -61,7 +61,7 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 
 		wkup_r5fss0_core0_memory_region: memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0xf00000>;
+			reg = <0x00 0x9c900000 0x00 0x01d00000>;
 			no-map;
 		};
 

-- 
2.53.0

