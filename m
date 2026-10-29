Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793309141;
	b=Xx5b7NY7hGS6coymFRpWhfqCWNVAnthCzxiZm2Gc+ccyLAtzkdT2vlKj2mKvSayZpLN+
	 n2GOxYjQwOgb+F9dEb4Bde0e7kNOcHxL7spoTTPhQxkM7bAtnMgoaoupE2CwWRF4tgALW
	 rMe4jxZEo7NVyqhmGUjPR7L1PgRpCuGAq2LXELnn0eKO/hDjFw5t8J1dz1O+lXVqnZ1hY
	 4Po+wzkqqZTdxvyL+4VrjxS1K83gAf9QM6cYk5GOTjLRCnbmQ9PNAU0HZwt2tO7dcKoEm
	 uiqaYVKLXkavh8wNnwLUwWKDMv9xsOddi6gqCb0mYfNpYYs5M5vhAXxBq83It4I5AdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793309141;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=LpNaT8q0SGvIEMd/N1soAJa02WC3uqlIifzAi5jpoGQ=;
	b=T+Rlj7URATsKZw7HXZc7AkJz51WHuAWnlPISy69ZFEROYUfNFPOuQdkK88QsNY2BDgGI
	 maBUuRg6WPMii0vcd8lebsGzplKGVe3U1L+07jDuj9j9CaUaWFV5gYWUpE7TBKMe6PDUm
	 hpH5rk/7nWQ4fW0RYrUAKY+O7wEA/TsAqsALutT5DeSGTmfRjjaIZJ3SYCJ4LwPR+iC+M
	 Jgx2sXO8QyRyKc8Gt2tabBfM/BRUGurr/J36RoWu1A9g5YzZrYY7mwguIgVCFdajSy2Kr
	 jGa3VGAWOZb2kSpJf1AwSHj4JlHsyfVA2FS/X45TTtDQpbnjA5PgGPLsH81NXU4A5zQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=WUvQjBbA;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6E4606A327
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 21:25:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC6E4606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=WUvQjBbA
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3adc4590de4so29573a91.2
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 14:25:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793309140; x=1793913940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LpNaT8q0SGvIEMd/N1soAJa02WC3uqlIifzAi5jpoGQ=;
        b=1XfXON6PT1ZnQFoLZXYv5IMl59hBvkatlGbIBbswv7DR9htjQwgm/E1Atm4lXdhC9H
         tjAiFZwakDMBqIYIc6+sMsnfAzZuvrdN9Z3YdS/uERlsB+aE75MJh1iT2DBOys2/edMH
         /f/4dgYd5AMDLv4w43MzH/04yNujLtAsfOAaxrbEa2smzaclUiOWtxSfuwFyMEeeGxFE
         OP1SMcHSSEJoZXweC/OAURGVhpIkth5tB3B0rrFFX8Isb+2wsHigEvYktZt6+eQqtaiF
         s94HUsR9aYiydm7ZAsi0PM9dyvspIC2Sz7lZ8gx8rw5SLOZlLTqCYrqOs87WOG0QCLoH
         fuyA==
X-Forwarded-Encrypted: i=1; AKwUvBwBQpVQLlZn6mrsSclFQarP4qpBZtmCPggRcCvGQR83P1YX3Zh6UQOIG/GTKDU+SixW4od56uaJ2wvK@vger.kernel.org
X-Gm-Message-State: AFq9FYKg7LqwsTjLTKWuwyXyUympmdoASNLfzLw8RPrIG/fGq2jRuOch
	K6P10Fo28eDGzyU0+kR8DEcf4SS74XQ8E06RBf5Mnzrwk7Tpn4WW9dx8xPd3SkscPGaDLEQQM3p
	u2SxtC2gn+C6AD1Cye+/ayLT8u6TakMuUA90yS93tfKD+w9fCNlRRkFreKfCg/h95DppQcBV07c
	aPuG6SAbbsoLVZHhek86QoemT7QrZWCakLRpLOel6lIVdvdZDJvlVpdeF+Xz1Gs+f2IxUiMcsV4
	IcfOM89PligOPoXNCrxR2kw
X-Gm-Gg: AYBFou2UV6TeCdrQUY8PkWEh1FkJqgnxW3GuFUAiLqPvkLfZ0l0ldbigGb2F3lnVWP9
	rJV93cAZClcPqZXnOJ+22gEfeynWNAOZYOt+xAHgs2wI2h4wb6FzZ2LUOaJ7OScnXTpkjIPvxHe
	sWzHUgQY1TdV5sex68KyPBoYi1KGu3T9d9tToNhNlJGpQSTJguyTJJ+vnl08djm25Sf3cp6FSrY
	QE3b84OxN8hh3LciIXdh7xFLSPFhsQ3f1lenpYGAZScOPiuHdKk8+ArJY1MUhKdzpPMOkZNIIU7
	kUKjhi9ByHiI8hCaYNUM4y1Qc4xD6+Imaq9Cfj0s2y54grpxwVZFFMFiLWkPS3E7lQrBcxs/17t
	9dxrcVS9+JSR/r5luqhWfWpudwjokxXka3IrndpzzJ3gvtrdQ9xHNWIEUaCwqg7OjPJvMLgj1hZ
	YcC5qWA1l5a3hOR5s8cf3tAlhFnOKjngs5wqUrgziu
X-Received: by 2002:a17:90b:33ce:b0:3ac:8897:7b92 with SMTP id 98e67ed59e1d1-3ae89866572mr164565a91.57.1793309140263;
        Thu, 29 Oct 2026 14:25:40 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 41be03b00d2f7-cdb0726e458sm1735a12.25.2026.10.29.14.25.39
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Oct 2026 14:25:40 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91c75523074so1868816d6.0
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 14:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793309139; x=1793913939; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LpNaT8q0SGvIEMd/N1soAJa02WC3uqlIifzAi5jpoGQ=;
        b=WUvQjBbAg4yqi9P7UGCdvrxfdHIKMQMOWf90VpYxh6JjrSAdqAz7Jrjkdzk9Vcgpa7
         dzCdjhmcSqaYsEhR7PL4PuFyNRBQmbfkNOWYw5mmJxv3+a3wJddLsG6nD+lzePjD9kUj
         N0FwnX+JWSs5+tT9M9WconiPGTD4ir+cWu1D8=
X-Forwarded-Encrypted: i=1; AKwUvBzM1MNH3of4ecIwLfgYc+/ZRfdz2BGSR9UsWv0OdNnO5arisG4dVUsrZdqnSMXrELjWBQK5wzQHttbC@vger.kernel.org
X-Received: by 2002:a05:6214:5f10:b0:91b:8296:3b88 with SMTP id 6a1803df08f44-91ca4ae90b0mr3372326d6.15.1793309138755;
        Thu, 29 Oct 2026 14:25:38 -0700 (PDT)
X-Received: by 2002:a05:6214:5f10:b0:91b:8296:3b88 with SMTP id 6a1803df08f44-91ca4ae90b0mr3371906d6.15.1793309138161;
        Thu, 29 Oct 2026 14:25:38 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca314fb6csm6384936d6.34.2026.10.29.14.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 14:25:37 -0700 (PDT)
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
Subject: [PATCH v4 5/6] ARM: dts: broadcom: Use noncoherent SATA DMA on BCM958625HR
Date: Thu, 29 Oct 2026 14:25:12 -0700
Message-ID: <20261029212513.4126083-6-florian.fainelli@broadcom.com>
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

