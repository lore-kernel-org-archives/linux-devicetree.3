Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793309126;
	b=chxrjDJRRDh3qR7dsP6uB4iYFKej9mbeJLe/nUhxtSRfvETv7CnqGv83T06MkZPoOok2
	 /jhdDLmRFFgMO3BaPq4HDCL/wsbBmIrba2UQ8uVrEvO7HXwv7nYqHeiBpxUFzoDLUAouh
	 L5kEga83rMcyReT1Mf0ubbAUrEFYkGeqgxDYniHqEc6FUbCI5S4qhAamsXDIolXBQ9OBK
	 aYoRMoQRHxBM1q0aZfe1XaNTeaNmLJdp1UuHON4alBvvSITcTmCShZwVfoRwR1hchgxaV
	 AFdYT41j/iC+mozhhLhudaq12hEGJ740lqPpyBUSNGYupEZNChkxVus031ntYf86Z4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793309126;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=Hsj4il6cwMzAfFBtIiOor6rUHPJ7kpQPufbre1PFxQc=;
	b=ySTM9oTxy7LQtFnNRSkDLcN+o7mbCUgnl0anJeZmvYpWMHmNRqN08Ll28tZlWgPd5ejD
	 rGbaBt6JeXuzJz1j7dkt9vnG6SGaOiKUEQ3ARlHm2Vdq/iIkyiylMXprnSj3wn6dBf4yM
	 jC4NMtJkmg1DPh/2rGkjMZc5yh+vB0a0lG/PKS2T9Qv5Tgo9vDcomJhIO+dfd5rmB8Yk4
	 DxgZLvTtUmtea5Ywb+KfdHFtjchLCprPRyEI/q/2lNvYxWI0WR1G3W+NplpV7+pFxH5N8
	 zyURai6xAOuGNHWwTCsssZmKrdQ0VC0CuUwHERu1qCP3JgqLuviA7c0+HdtfR8xBW8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=VqBP6e8V;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29417606A31C
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 21:25:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29417606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=VqBP6e8V
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3ac77270fbfso14918a91.2
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 14:25:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793309125; x=1793913925;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Hsj4il6cwMzAfFBtIiOor6rUHPJ7kpQPufbre1PFxQc=;
        b=CQR07M/bT96SG6HhRGh/uyKO8lydiwSZe3GX23vCLD7OrjE8wP0DJG0GmEr11nwn5G
         Bt5So4YJwufzWcqZDRQIh4kvqhqbsPXJDMNal3uTd/wYlOHbKsh02OHrCg72EEi21sDR
         S1HiZQnPpxTJ+tixbbUhfWmePRqMnloETQLm1MurPXyDGIOzQYXy7RSC2bzJePdVI5g9
         TFIj6SFCXdxpvSkK01XvuzfALhOEETga/fwyzl1R7koPd2iHIeptU5202EZJM3crQXtZ
         +751RzIyaHku1GPJuMuzWpSJLvxc9JoOxLXja6NbP8tnniDIvqSIUsGPdFFccjatnPpv
         UGBg==
X-Forwarded-Encrypted: i=1; AKwUvBzPUxl1aMVjfdJhmk5ekHNstFxHRwZ0D/0NYKXag7WC0Yw74qWp5w6fapTbZaUkSj1dkaqbB/AUx7WZ@vger.kernel.org
X-Gm-Message-State: AFq9FYIqHVhU+hYuNwgEexGchvmcjstzJ+iK8UHqYH2ZAb7fiXW0Xw/X
	kGwXP64hWFqphO2COiSA8SCNLRLUoOIPeOEEoRizpHf5+8/Llin896EWVZie3LBGHavTzf1UnQE
	aqRpqCx2v2nBd0ubAzHrbeyZK9Uf0e1OEv3IGRSp1qr3uVnJ1wW7t8MXHbAZGCqeaku5krq4rHg
	sjbyo+tO+6X0m0HbPIww6zzzKDbHt23jHSHfwjU/8GoukKBp9rKdO3FhSzI6NsBX5AabB4BmKL5
	Qwd84ObgNePTn82RLnOmBgX
X-Gm-Gg: AYBFou2mgZedNYTUKY1HgD3lq1GQtR0T6zvRjPCoTea8F9O4yVmU11NEA0Pw/5s9UOK
	sY+DeynjEXXZZy4EHEm/mV8x1q0oBAz6k6hAcQZ8/qBe34wIvABIqPuStjl3AZS/TUBU3Ey5sX4
	JGbxkgCH0/7u8En4x1rO6R37sh38tFXQJYyBMFBbSj2+kDTucJtAuGNd8EJdFOPpuFhAY4R/b2j
	KlnNmbr7oREkZx0Fh+N+zzarb4TGh24+VPMrWk6BiLYCmnfwFw5xiNRekqaV3qgBAAwfh3typvr
	HMFe25d9kZLDzgvV46m10XP3Dcbo2Nai8ekq/t3AR3ccONvrXF63d0Nt25k4IjafYtJ69Q9XqFv
	EzXpE13vaiu2Do7PkVhiKr/kH/InCMIn3o3A7mNM3SHqRIR8CAKOmOsFFv0znHn8n8/g8iOetch
	Y7TJchajs/9Qs5jcRGqiqfQ6xghFOAc7cEQDKWRJO8
X-Received: by 2002:a17:90b:1811:b0:3aa:fc22:8ab4 with SMTP id 98e67ed59e1d1-3ae897bae6fmr167373a91.29.1793309125367;
        Thu, 29 Oct 2026 14:25:25 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae841ee0ddsm624982a91.0.2026.10.29.14.25.24
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Oct 2026 14:25:25 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91c7a26f892so1919676d6.0
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 14:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793309124; x=1793913924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hsj4il6cwMzAfFBtIiOor6rUHPJ7kpQPufbre1PFxQc=;
        b=VqBP6e8VEQ2KEiAgBWT6S1gLO6pIB9FkID86wAbT75o2ugVvv/tDkJ62/ahYWSTiRz
         9rI5s5UpE9IW6LMP9RXLg5z3/AI28Someu0k7JsQSpWDAhD9HGIb6UHIyoyEDs4Ud2NU
         UKDDGlGhb2xXVR4eQDvul39j/4vMhcCNREuLw=
X-Forwarded-Encrypted: i=1; AKwUvBwHrZSdEtPA0rUjXmFYLyoRBngB6JNfR6sodopxCcy26wSCql8n35Xt645VLXtDEEI0Ur9eav7wne+Z@vger.kernel.org
X-Received: by 2002:a05:6214:ca2:b0:91b:d948:c415 with SMTP id 6a1803df08f44-91ca4b78b78mr3774436d6.44.1793309124165;
        Thu, 29 Oct 2026 14:25:24 -0700 (PDT)
X-Received: by 2002:a05:6214:ca2:b0:91b:d948:c415 with SMTP id 6a1803df08f44-91ca4b78b78mr3774056d6.44.1793309123730;
        Thu, 29 Oct 2026 14:25:23 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca314fb6csm6384936d6.34.2026.10.29.14.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 14:25:23 -0700 (PDT)
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
Subject: [PATCH v4 0/6] Fix SATA support for NSP SoCs
Date: Thu, 29 Oct 2026 14:25:07 -0700
Message-ID: <20261029212513.4126083-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
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

This patch series fixes SATA on the Northstar Plus (BCM58xxx/8831x)
which was broken due to a number of things:

- the SATA PHY assumed separate PCB windows when a shared one is used
  for this generation of SoCs
- the clock/reset (IDM) was not being configured by the driver which
  meant that depending upon what the boot loader did, or did not, we
  could have had the AHCI controller still in reset by then
- on some reference boards, the AHCI controller is not DMA coherent,
  assuming so leads to all sorts of timeouts, data corruption, etc.

Since this touches several subsystems: DT, PHY, AHCI and DTS, I would be
keen on having Damien merge all of those via his tree if acceptable by
the DT and PHY maintainers, I am OK either way for Broadcom SoC.

Thanks!

Changes in v4:

- move entire allOf to the bottom, before "unevaluatedProperties" per
  Krzysztof's feedback

Changes in v3:

- actually submit the addressed feedback

Changes in v2:

- addressed Damien's comment: comment line too long, imbalanced IDM call
  sequence in suspend/resume compared to probe

Florian Fainelli (6):
  phy: broadcom: brcm-sata: Keep NSP ports in the shared PCB window
  dt-bindings: ata: sata-brcm: Describe the NSP IDM registers
  ata: ahci_brcm: Initialize the NSP interface clock and reset
  ARM: dts: broadcom: Add the NSP SATA IDM registers
  ARM: dts: broadcom: Use noncoherent SATA DMA on BCM958625HR
  ARM: dts: broadcom: Enable SATA on BCM958625HR

 .../bindings/ata/brcm,sata-brcm.yaml          | 57 ++++++++++++-------
 arch/arm/boot/dts/broadcom/bcm-nsp.dtsi       |  7 ++-
 arch/arm/boot/dts/broadcom/bcm958625hr.dts    |  5 ++
 drivers/ata/ahci_brcm.c                       | 36 ++++++++++++
 drivers/phy/broadcom/phy-brcm-sata.c          |  5 +-
 5 files changed, 85 insertions(+), 25 deletions(-)

-- 
2.53.0

