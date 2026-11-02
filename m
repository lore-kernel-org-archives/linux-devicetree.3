Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793602644;
	b=bf2ztz6ZeZZ6sZ5o3YQVz43kxkdoae0dGf9RkJCLxTAWWNTYgmdnCXYmAqnaKO9es1Ia
	 e50ydufWdRBMdTtCjMKMpDDjMT9XmKCtZEydeKxBIfesvKtKClWSQRxaSwcW+aQrWDvNe
	 40Uzq7VZq4X+PXderV40PbFGOZk7a2TntKLCbPSJoVm0mytDli1SyfQfGJKN0Pj4Rc5Iu
	 E1yKLLuE6hbnpV+0w5xhUj2CJoRsQbE0kHKr53UoOYwgOtvKSM8vhNcMR4Y9rKFFR2p5L
	 eRfX8pOW+G3N3D8WWhS6KaZi9Hny6mj7fG+HnCprZ/R+KKc7rZO9sUDaIygetQyYwQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793602644;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/czB0+NxeiClWKKhtKr0SNwTuovPGhxvsx0Vin52hrY=;
	b=iYrmzPdIO0q0etj8b0lZt0+hnLfSWN2edsHmK3SX3eB6XH7aL4RRxoWn0VRwkn35SSwV
	 IDGfHf58urLYe5BUc8wz0W7bksyyGtKd5Mk3sjBOhwn6QQkxw3vPZ/riZ15ira8kI7cwa
	 ntRRRiQeTBMCrUTR82Cv05qaPWoffT3WM94ZwckP6j6X8dEwarQJ9GhTTa6prmufAUoXN
	 fQ1MSTXN8UGi053uxhC1A345go18KdWzincISiBFO/n6+gUu0oQppqFcjhiOeA7/FG3GL
	 m5yRaXoGl6KGjabVgUp8nqVi3+7Ze1pC5b79FEcPFLY8+3AtSeIKIFJwSeGY5YjnAew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KpWv+Elp;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5AAB606A329
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 06:57:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5AAB606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KpWv+Elp
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-369f33df08eso5389567eec.0
        for <devicetree@vger.kernel.org>; Sun, 01 Nov 2026 22:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793602643; x=1794207443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/czB0+NxeiClWKKhtKr0SNwTuovPGhxvsx0Vin52hrY=;
        b=KpWv+Elp4YKQ7EvvbB6VKDrBo6KvMX+LXXoXj+UPBbfiC7VZ3ODTE8Gep5TtQZKhUc
         ISdh/l9MLzple0FWLM7Q0tLoEa7iVcUk7hRJOheTD92u88pAA0bl+SzytZdVnwX/sTuK
         LMJGt3LsljTV9rzbmqcaq/h+uFAiZBQgkJJWx1+VR/3ZHoHR38F5yj102fWl3AMoP3KD
         NuMfWwLTW1zjG41Am4WBZzeVVg6FWMrLJ9dKFGMcW2rLUbh3W/Nie5RLAa1Y4cv/e9Py
         /dxbiIdabIzBn1L7zsTyg8Zr3IPmLAIOUAEqK2WqHk87/MpSYbky/ZYfBPpp2Ab3u/A/
         f+xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793602643; x=1794207443;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/czB0+NxeiClWKKhtKr0SNwTuovPGhxvsx0Vin52hrY=;
        b=D5E3/gLMXJFH+QaFjhZboeec+0NA9fY1qNnR3p7sGtGKjsT/WeOEJSo3tAF4Mo6r3y
         h1kumjF9Ii5jzv0dzq2fNq+egTSMSDV8z0RDa2ixcyftennsZFJGCTeRFE3O+FOXPASN
         N7ZyZOdcHewprcBZRWyfv/OtWWqPzTNUiv6hgYDIuD7B7aDjxtwSQjbehC3Xlr+BJFho
         AQdViu91nRmpmzRyyW05vuImaz+gygS8pgBQXd6PZxoyueP6pE6SRo/zycj4gJG0soka
         z5ujMSyu0FPWyM6IGdKAOLH7v/W2vYGSSnpcO71vNZtqG9w5FfJ7B8xUU75+a39zTUXr
         LXcw==
X-Forwarded-Encrypted: i=1; AKwUvBz+p0MPZnWbAIM1bClEqlhDtUySqFpOe+Z7AmvFW6y+fhcrSdc2uYgppvUGPeLCa6c7cq93DdUTwdqt@vger.kernel.org
X-Gm-Message-State: APuU4Z9Yp/HnRGxFst3GFZP8zObeuDZLwDq0UmblofDDrUvXJSjGYXue
	K/nY6CdZhWBL2+ea52Sp+pxRgId9MJ+Qf76DHLx8erE1y7KHdb9t7fYd
X-Gm-Gg: AYBFou37Oyuc8EZiENH9kk6wO5SuWSBO5oB0KWB12G6fl1g2Cf8739hp9uPi3057kRz
	0k2GEtdAEMRiqJYQXfoYYGDWzjulC60RdSof/5l75i6QGbLP3vJDyV/bRO7jgi9oH6fe+iTdwgd
	LKsu6HX0tJnzNZ79iAyNF+keht9y+SIAGHP0H9oSWLuWE6le4sfi/dp/EEo6WEaZmUgKlBtVjtb
	6WR66U0/NwyheSAwd2B3x638oBEqM05r5xdfoFgB3Gql+9VDSZNxsmWt8IuNGVOJ3nThDRclOFG
	ejLtgcJezz4+x5MbuuH1InkkLSAP5SDjnu8Bw/FW7tMntqNdJ4MAZBlUOCL2sR6EU2GuSEB5gE5
	eU7Lzu5jgYLw+untq9RXwwcw3VOxBZWhVwwMrNOA1eavCSl8PUYyAlgBsXoyn027B0cgrNAu8CB
	jdd3NuXEBql8crYJ5rMEnbeD5YPhyCDziCYHAfNDbpI7caNoO3f8/AVGr2BoNf1mvsihW8q+cNK
	kCYBELlBzht4CEu81h2BYzZXBV7gLZmFUuLhZDdR+COhis4o+vGbJ2uga/3+fo3QQkrfOY6KaEd
	4Hm7dXD2AR4/cXk7FmaK+ZIFeiEETmQgT7VzCbOLnOjWTATEj0snmSu5eLozXdeV7w==
X-Received: by 2002:a05:7301:716:b0:36a:31b2:8643 with SMTP id 5a478bee46e88-36a42453282mr12430597eec.38.1793602642851;
        Sun, 01 Nov 2026 22:57:22 -0800 (PST)
Received: from localhost.localdomain ([14.97.230.66])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af4e6sm29169317eec.4.2026.11.01.22.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 22:57:22 -0800 (PST)
From: Dinesh kumar v <dineshkumarv85@gmail.com>
X-Google-Original-From: Dinesh kumar v <dinesh.v@adlinktech.com>
To: Frank.Li@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	s.hauer@pengutronix.de
Cc: imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	festevam@gmail.com,
	Dinesh kumar v <dinesh.v@adlinktech.com>
Subject: [PATCH 0/2] Add ADLINK LEC-iMX95 board support
Date: Mon,  2 Nov 2026 12:26:43 +0530
Message-Id: <20261102065645.121046-1-dinesh.v@adlinktech.com>
X-Mailer: git-send-email 2.25.1
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

This patch series adds device tree support for the ADLINK LEC-iMX95
module on the I-Pi SMARC Plus carrier board.

The series includes:

- Add the ADLINK LEC-iMX95 compatible strings to the Freescale i.MX
  device tree binding.

- Add the common device tree description for the LEC-iMX95 module.

- Add the I-Pi SMARC Plus carrier board device tree.

- Add the new board DTB to the Freescale device tree Makefile.

The module device tree describes the onboard peripherals and interfaces,
while the carrier board device tree describes the carrier-specific
hardware connections.

The device tree has been compiled and validated using DT schema checks.

Hardware: ADLINK LEC-iMX95
Carrier board: I-Pi SMARC Plus
SoC: NXP i.MX95

Signed-off-by: Dinesh kumar v <dinesh.v@adlinktech.com>

Dinesh kumar v (2):
  dt-bindings: arm: fsl: Add ADLINK LEC-iMX95
  arm64: dts: imx95: Add ADLINK LEC-iMX95 board support

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx95-lec-ipi-smarc.dts     | 237 ++++++++++
 arch/arm64/boot/dts/freescale/imx95-lec.dtsi  | 414 ++++++++++++++++++
 4 files changed, 658 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-lec-ipi-smarc.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-lec.dtsi

-- 
2.25.1

