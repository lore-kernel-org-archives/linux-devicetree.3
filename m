Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793039377;
	b=4VhXJ/DGUubi1Bmz2FCU5EELcylfdIdSSULmDrU1BzYygNANUZy+GpsGOUF5bG/9CUIj
	 luqOTj8XwIlHAlhgJPoGPnbW6w02lEUnUfrJpw4HgDFU4S8VTF/hsL3snkFpFZ7pjrzZ9
	 XAefpc0vGyJnDAlEgvOsc8PfdIYvDNgB/kB+Cw/zC8gNWruKxhioR2SfqI1WYmEj0NApM
	 AhoX5ZQm4YhX6jUeecGzX6tfVwtK7mCkcJN8vnXsWLAVoA415fYnU4aJe2kYoE0F4QOWn
	 WSHjOPX/+FfUd+/3clibugPDxc+/dDkHiLjPllNkF4LkEeautr6lByRwhrG+o+DJcKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793039377;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=LpNaT8q0SGvIEMd/N1soAJa02WC3uqlIifzAi5jpoGQ=;
	b=IskK3oGqh1JJ81kJ6EUASq6hW5PhBIf9JWTLSmhI9C8yibYh8yl4UF5p4hsIoFHYUhNy
	 eGnDoYBm8wwTMHVgEj/9foDy90TKrzuKUHwrH76kd8l1ItPLV2wzMBUbHwQm6EswMBwUO
	 T54kuPOsX+kgk7AgJ9RU3hkTkjg4G/AFafd4jxwA6TrbzSQPn27gv+XYOd37TSGx8pHV5
	 sAaggJwepf1FqL7Fyx4Vpv3zaNUmwxnHOx9wiwzz2Qi4CpMFjqkgsCURizE3wypCTWQ7s
	 UDyFbV4e/mokIaSfbZMydmh3SVk/Qa8b/sH2t/LOHk9BbRXGnURUQTNcGsJuGu2lUtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Z5Qc5eoF;
	arc=none smtp.remote-ip=209.85.215.228
Received: from mail-pg1-f228.google.com (mail-pg1-f228.google.com [209.85.215.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C085606A32D
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 18:29:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C085606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Z5Qc5eoF
Received: by mail-pg1-f228.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso1245968a12.0
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 11:29:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793039377; x=1793644177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LpNaT8q0SGvIEMd/N1soAJa02WC3uqlIifzAi5jpoGQ=;
        b=ht0xAGa/fCWr6d85hp9KbKf9izq0PrHncNmBaTt6zl4p6QeSE1Q5cCJrDo0FozjAyj
         nQej8kb/ORcqpjUxYegZ8kAQfv/6m8L9HD2jvuOYV9Yc73lT03VYBc+ZatkBcc261dyg
         c/taT57OjQqCAMfbj2xP5aY4ED+6fK919VcsqLmJgk2Gp2qYKma42ye7DqlW+TMqiCjv
         5xGGJoXCcd3GJk5BN3Mw+3s+5S8LTDi/bAN5ATRqAsshCQnJNm+OK4Rs7LulujNwkK8J
         QL4WpcVMBC9nE8w2AFxBMfRmh/aYTO2dpn9wnPz6GLf9+XP/W5keWTkIwQaS2bkUH4Qg
         729Q==
X-Forwarded-Encrypted: i=1; AKwUvBxGvP6ZsCgtOXU73FLyIqVt9uf0oSDgO1QVbQyqvjNFc4Dbqh4nyCenyTy7H3bOnybxcMpPakkx++a1@vger.kernel.org
X-Gm-Message-State: AFq9FYJXLrDaNJDwzBwHHOetEjzeG+K8Hr6uAuO82TpA1HnDZDNffaA0
	z17KW53bjDwhrOcQB4It8xCTnkTcrh5FWUUGq5XKDhQOeaAEOE9wxkdFqa8SrGFRBh9Vis/FFg9
	vqkvsBng6m8bEILfRcK9/uIsM7aTrpnJymQFl7C32UIggAWiqUm2izhGOuHD7AD/jlLjo3o4G3D
	QJJO50OJrcSNjOZnt4yOQqW46gZ0segcAybbWfXAcN4dHruHvXMXD+wWRRE5EBh0P+zsBHcFRQt
	Mvxr8gTIsBBL+X+RsopJA==
X-Gm-Gg: AYBFou11l4ALOZqCIfzuehgXRQwhY5dTwbg6HmHL2ZZ5gTZSHNz/3CPLsO9xkNFk0jC
	jOhjb7sLZ0kOeSTinGaF58xNVmEjSi5VY+C8791jBmOhUoj1nEFI24yf1fffSoOl6Eq2mryc51e
	MzNHjQ6Ly1QMHbMikAvPN9rbM0GQ8LD5+QMR2TU6ZVTb2lgM75Crbm/KjKl3Z7VE1L3g7jRiW8r
	eE+qpz92zB93WpaFsRPlam1nbrI4VqY3FVooxxN29vMxOS1J6u98HPzHZD3J/cimdotx9zRQu4/
	dtUopvXci46CJSSYdPiKIOV5j15mYawxZb0Ju9HSwViZQFB9WY9R6iDjcaiMomyaxkAryUVvTfh
	MM7FXzqY4Q7Xz3i5lJocrJI1Ph9KH34tuwqpkexkcOW75fKiugFqFi6zkvaxBiwNb8rduBsvkzh
	V4BouGqPO90L0yDA937vQf7mPTih14vu1/kC3aWhT/
X-Received: by 2002:a17:90b:4fc2:b0:3ac:9a5e:9ce7 with SMTP id 98e67ed59e1d1-3adeae70fc6mr6142600a91.49.1793039376936;
        Mon, 26 Oct 2026 11:29:36 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-23.dlp.protect.broadcom.com. [144.49.247.23])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3adebb37c12sm3470265a91.5.2026.10.26.11.29.36
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2026 11:29:36 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3692c5b061bso16940eec.1
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 11:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793039375; x=1793644175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LpNaT8q0SGvIEMd/N1soAJa02WC3uqlIifzAi5jpoGQ=;
        b=Z5Qc5eoFJ4yTzUPCzin8xMh/jZ2htI+0wdsdhJjzUK4MoQJ7oy0AgTTx8ItpkwKe7z
         OBiudo4wQiTgrzwHBHkSJzfyQ8IuCmDz4t8ato16mGpzTl/n6DQ0AGNIKROJcn2UDimn
         b4TQypDjMBTmsz0LYaXbHk79qv2rCuVkTxbvQ=
X-Forwarded-Encrypted: i=1; AKwUvBwbxU5lxCK2haYhDXpzftAAetlf0ZfahIFarx1s9n7qxKSIl84GCn/iUi0xO8ad0TfyT/rZpuWtoZIZ@vger.kernel.org
X-Received: by 2002:a05:7301:6189:20b0:369:f291:49da with SMTP id 5a478bee46e88-369f2914cd0mr8027363eec.40.1793039374740;
        Mon, 26 Oct 2026 11:29:34 -0700 (PDT)
X-Received: by 2002:a05:7301:6189:20b0:369:f291:49da with SMTP id 5a478bee46e88-369f2914cd0mr8027323eec.40.1793039374121;
        Mon, 26 Oct 2026 11:29:34 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a01fa4c58sm24657259eec.21.2026.10.26.11.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 11:29:32 -0700 (PDT)
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
Subject: [PATCH v2 5/6] ARM: dts: broadcom: Use noncoherent SATA DMA on BCM958625HR
Date: Mon, 26 Oct 2026 11:28:55 -0700
Message-ID: <20261026182856.3168686-6-florian.fainelli@broadcom.com>
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

The AHCI controller on BCM958625HR fails with the dma-coherent property
inherited from bcm-nsp.dtsi. Soft reset times out waiting for the first
FIS command, subsequent engine resets fail, and the disk is not detected.

AHCI allocates its command tables and received-FIS buffers with the DMA
API. Declaring the controller coherent bypasses the cache handling that
these buffers require on this board. Removing the property restores
hard disk detection and operation, as confirmed with a diagnostic DTB
that changed only this property.

Use noncoherent DMA for SATA on BCM958625HR, matching the downstream SDK.

Fixes: 56e2ff0346a3 ("ARM: dts: NSP: Add dma-coherent to relevant DT entries")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 arch/arm/boot/dts/broadcom/bcm958625hr.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm958625hr.dts b/arch/arm/boot/dts/broadcom/bcm958625hr.dts
index a9b6aa04d573..53acae385822 100644
--- a/arch/arm/boot/dts/broadcom/bcm958625hr.dts
+++ b/arch/arm/boot/dts/broadcom/bcm958625hr.dts
@@ -182,6 +182,10 @@ partition@700000 {
 	};
 };
 
+&sata {
+	/delete-property/ dma-coherent;
+};
+
 &sata_phy0 {
 	status = "okay";
 };
-- 
2.53.0

