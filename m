Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794426278;
	b=bNR1ZRk1KDBB5F9GQEEmc7RDib58iG+Vi03IyparpVj6D1wo2axQOeSbzpZmc6grG7bA
	 sdy6aXIShAUCvJftDOmf4neSKPtesTOCgLqL+CdVjJkfE8HyrhujBa8B1zTObiLvgCUVh
	 +eUoI5xzGTTn32iT3hLLURCR4ffdKmyz47ihUi3p6xVMdUJnBgj761QuirjhD7EjJaEBl
	 qWwfg0n08UfZ5Ir0OyJO4QkkH1VRN2JSdY9ulkUjjl4ucA9xT/5NkFux1bDzCMCVgyUf3
	 NtdWY/A4o1i0t21tkdSL2eDyp481atymHw1XXmf2XuLUZIJfzpZ8Vv/CEQKHiGCsTAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794426278;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=xyDSRZr2KlKUM6APRuIaI7oeA3fNNRMSJmTHG+3kfzQ=;
	b=vpfkUZla6qN8TdbKEhhP7LudDAHFWc32Dj1xdzcGy9F3h+PgepAtui62QNhQFEIYlrXu
	 zbWrdM7v6lIekUmB+h0VcmhZ+NjomIQmn310tq7vujrPfGI1cp3p9ljVwv+KgCBsM8LnB
	 6k0y3856ZWxArz5DMZolcmi3hb2oOFvALRCat+6xCgiUUPkED2aZYFiUYtamlIPQmUo3H
	 Ljnq4ZZ0yP6AewOttxIF7g/DXCl7KP8CytgOza7O6TH7ciKtInuHhDVsG53i+60VyTkmd
	 JYcTqW0LtSHaYaFR3h2QPd3vUEEEfuoV93fSbk068GCu8njFpy4tEd0SntBE2xIaqvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=EbFI4J5+;
	arc=none smtp.remote-ip=209.85.161.97
Received: from mail-oo1-f97.google.com (mail-oo1-f97.google.com [209.85.161.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE2E606A32D
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 19:44:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AE2E606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=EbFI4J5+
Received: by mail-oo1-f97.google.com with SMTP id 006d021491bc7-6f74f6b46abso1524090eaf.0
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 11:44:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794426277; x=1795031077;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xyDSRZr2KlKUM6APRuIaI7oeA3fNNRMSJmTHG+3kfzQ=;
        b=VsH5lNcSen883zfaUfAHaaDmauLoUu2GQ6ctm3RMAIcsIpWrmaUAAjxYoXKlkw5aCr
         ZjyC5apvuJQPQKBEEDyGrVnfLa1klcUjixHt6p7dJQ7yKB2I8DSnftt6zEEf/Dwo1LBV
         vI6NcbMObrLyhvwMF+7GX45ce7CH67Jv1uSjm7O2gh17nRkaH26eJJii5WnV3RQm1lPt
         DrwYfG1kJoUGuAymfJ2/DQClea2g4d71Jh1lgLjiALUEiBGp5+/WAudbfpVm5ANSX5GO
         n383ugaFJG2YVRx2rdm/u979HJ18tFyHlTDA2sOSDmkdJI9TWahCGxUu31U4Lpzs3TvQ
         5Fxw==
X-Forwarded-Encrypted: i=1; AL+hErE9U6iSQUye/or1TKc4TbsoNk23GEP3Zo/Z+rShMFLigEAKa+NCjY58+12Wg/L/Y2T5B1Y8XSYv97u9@vger.kernel.org
X-Gm-Message-State: APuU4Z+hhBYuXsAS1GIRthYIVlS/38kTlYm3Q6LWP98qvod3siXjn7dH
	FAqItr+TnMGUSi0PIlHBQrAK1M6Qg8GGm/aa+V6Me3HWQTQOIdOKgNIakJZemDuBuJzJO8rdatE
	1OCGK9Gdu4xh8/2OV66jD7kELW3lsC7Td8ZArhzvmBTxCGkA3B40ufJzBqjHJlnhkAOuZwqFsBl
	RqNghi73QtL+qj7U15OcCLxxqnewbhvcQgghLiPMcwxr4k5hkFxZKG6ErSAqk8tzZZzCec9G0LQ
	bsylA4YF+fe9w==
X-Gm-Gg: AYBFou35PCtHN3jlg3nxXCgI8A3YKrCBJS0uWfjuCIxaPEL3BfvIYtZAL4m/iRLAL2X
	WLFFTWgAtIjMdm8OoqxgpoxOpyBacQ3TP4NSj6lTBNqAyq1/7xZfRBgzdDZW06YlbHLeLxdUV8D
	Nbd5k9OiTEXFTtEc6lgYFLULKYDHu7aI6SzvkLyT3qtmxO+IOmVIpJokGC5NBNoARU6oELw4NJR
	Gv2kAeF+4lIn/4zHJ0PvJBZK2sjVstQ2Kg1TMIs3ZGh2GfOCR6IsSLFlBmWKEX2IRIx+vgDsMNu
	h1DlxQ9UErOBudrtZH+oVfdjDPXxkZqmUb64QMqp4E63jV/cl6gEM08Kw8uilRcNzxe13aB6LEW
	BlqKbUWky/m0nweyc6b+AG3/oCTGAVylNbbpqk0lpq/uZ5NM+JsVldIpqDKW+TLxHtKuX0VTeU+
	DV69EUSZqDCgvGoGmXY+0HZfhygsuQPwp1
X-Received: by 2002:a05:6820:1381:b0:719:1ad8:a352 with SMTP id 006d021491bc7-7191ad8a7aemr1674407eaf.27.1794426277005;
        Wed, 11 Nov 2026 11:44:37 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 586e51a60fabf-4ae22f79febsm75149fac.10.2026.11.11.11.44.36
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Nov 2026 11:44:36 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36ecd5db581so7133609eec.0
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 11:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794426275; x=1795031075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xyDSRZr2KlKUM6APRuIaI7oeA3fNNRMSJmTHG+3kfzQ=;
        b=EbFI4J5+mQB00rb8/c7a5KiKo22EjCWRSwFJ6OnPnJj976fixBoPIHHd7210gEsRF8
         sVpedTOFZQuNc1uTGSBE8fQKwVVh5kInsaDD1HADhi2uP0P/M0LpRmNxAVYLvEn9qM7Q
         sF88Hq0v2xGqgauwKW3AVAAMKYuxyrsRq12KY=
X-Forwarded-Encrypted: i=1; AL+hErHETmEmcDCBegIvOwRQMwiNh2IJ1KMOqiLLoh8ALqpQ5m92bpERP8WKW92cuMyynAQHZwZtkswKS6W3@vger.kernel.org
X-Received: by 2002:a05:7301:4908:b0:36e:3a0a:2953 with SMTP id 5a478bee46e88-37687512f63mr3469164eec.41.1794426274801;
        Wed, 11 Nov 2026 11:44:34 -0800 (PST)
X-Received: by 2002:a05:7301:4908:b0:36e:3a0a:2953 with SMTP id 5a478bee46e88-37687512f63mr3469133eec.41.1794426273979;
        Wed, 11 Nov 2026 11:44:33 -0800 (PST)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3752060899asm17948013eec.11.2026.11.11.11.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 11:44:33 -0800 (PST)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: linux-mmc@vger.kernel.org,
	Ulf Hansson <ulfh@kernel.org>
Cc: Kamal Dasu <kamal.dasu@broadcom.com>,
	Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Shawn Lin <shawn.lin@linux.dev>
Subject: [PATCH v12 0/6] mmc: core: Keep the card powered across suspend when firmware needs it live
Date: Wed, 11 Nov 2026 14:44:20 -0500
Message-Id: <20261111194426.1652644-1-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
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

Background: on brcmstb boards with a Kioxia 016G01 eMMC, firmware accesses the
card directly during resume from Suspend-to-DRAM, before the kernel's own
resume path runs, in order to load boot code using hard wired logic that is not
field updatable. The card needs to stay powered and responsive for that access
to succeed, and since it is never power-cycled, it also needs to be reset
before the kernel reuses it after resume.

v11: https://lore.kernel.org/linux-mmc/20261030181034.3811225-1-kamal.dasu@broadcom.com/

Changes in v12:
	- Patch 4: Added Shawn Lin's Reviewed-by.
	- Patch 6: Moved the check for reset-card-at-resume without
	keep-power-in-suspend from mmc_of_parse() to mmc_validate_host_caps(),
	so that the host probe fails on such a misconfiguration instead of only
	warning (Ulf).
	- Patch 6: Propagate the error from _mmc_hw_reset() in mmc_resume(),
	instead of always returning 0 (reported by Sashiko).

Kamal Dasu (2):
  dt-bindings: mmc: Extend keep-power-in-suspend beyond SDIO
  dt-bindings: mmc: Add reset-card-at-resume property

Ulf Hansson (4):
  mmc: core: Add option to keep an eMMC powered on at system suspend
  mmc: core: Split sdio_set_host_pm_flags()
  mmc: core: Move and split reset functions for eMMC
  mmc: core: Add support for resetting an eMMC at system resume

 .../bindings/mmc/mmc-controller-common.yaml   |  10 +-
 drivers/mmc/core/core.c                       |  10 ++
 drivers/mmc/core/core.h                       |   1 +
 drivers/mmc/core/host.c                       |  17 +++
 drivers/mmc/core/mmc.c                        | 109 ++++++++++++------
 drivers/mmc/core/sdio_io.c                    |   7 +-
 include/linux/mmc/host.h                      |   1 +
 7 files changed, 112 insertions(+), 43 deletions(-)

