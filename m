Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795686511;
	b=gt+gLImBG24B3pBPs+d0zXX0Ad0fiyzYcYpIBYBn5cK8GO1EDxq9XBfDnP+TtYyYfZlW
	 OawyjFArmw40blZEi7IL5tbWmab2SjWUaEd4uDYelyGXsIOyPBYMwUB//xVt/vJD2GpnS
	 6yHYSo1HXD53pvtk1bgcJEC9ekkaLO08K//a1Mw7ppCbUmfdatXyulPSPDjJe9TUXj+ko
	 yJUFvA2yVLoc69u/fWkSRiX9b0plNKsWarQyoC7w+mCq7zOdwOyaZnBmp6dTcM0cZ3KjZ
	 gRm4S/21tCkDgQxCytZKdh2bAbiOuiccc+MkLJCR0Er6WkNxeG46VZu0VxBF4LNcPGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686511;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2Za6MacJG/4uYb3nMvFDyzid4e9GAP1DjcxkycMoIOM=;
	b=2dVsvX91CHWIlLOVku/CIX2xogHFDlKpYa9CoW1GduC95KzaeYTmh6vMufOTcautDam1
	 R2MDebTkMM5nWY/1VWSV83RiEAgmO0QmLn211nbI/TArEAuatvYpePPIc521RVTjXAl7a
	 U1y7E6zbnFdXIjIsLmnIw6LfmMhka2XwoNJw+2pGUFx2wSJhOt1HCTYUpNIN2jKvgfeB4
	 HAYkQjRdp6liBUMzP3Bh+8Cm6n0GHzNtDR9pQJiZhBbn4TXrOGvQblqUt4NJaoSc5lBY9
	 EnIF30TQHfyh/nGLOKEgrxdRg1LVLvFgVCIypaWVi3aC+QGDYci3IlHSMAfFymhB6+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DMxaLUjL;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8716606A323
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 09:48:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8716606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DMxaLUjL
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1b563e5cbc3so402163c88.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 01:48:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795686510; x=1796291310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2Za6MacJG/4uYb3nMvFDyzid4e9GAP1DjcxkycMoIOM=;
        b=DMxaLUjLA5BlKaT6YX+N2yYET838u0pZcFVXo+fjXewh8keajOCnUP+WEalIa0pm4M
         scCx4aQLbdiRKGI3dAts5WvNvtN92ADRV+PDuZKBKnZte2uCb7aUcwwNosGaUhGfFbou
         /4fGB2k9MpVzhDxUhhd/f774mnw7RoeSuszx/XksflzDlHUMar4VDueO2H9wpvl05r97
         Ds52aKW7qa8CoDQOhKF/FafV+zawzdjTjllz7buM6pwiIQCqs0ULFzR41yvedG+idzlB
         yrqIN192zJFzz3mnlsRxNP6w3qq+ySVLKCM73/zH8wkZ46oihXrjSwEY/SeQNTveXDzg
         VrFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795686510; x=1796291310;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Za6MacJG/4uYb3nMvFDyzid4e9GAP1DjcxkycMoIOM=;
        b=Bmrs8YaIhe3YewN8VnUPF4Fm+C+aQSDogGMLOLBUJl/vCc5Rp3CEnfhUSaAo/kGixA
         N9kMiYA6nGnyIFOXdjUK6/cywu3gfR42YOwYDpxTtutbq7YmkjnZy0wBoenl0snLSX6v
         R7bH1544EXt+6vOw2sVLXMBsS24xbcQmJhAjt4eJErKpZy9vLBTZSBYEshL294yd5Q07
         zFMIDXRwso8naVEjkl3kZ5t33/nUv0/+4KChw2I4zr9wmkeCXY5aGyrlmB2XiGsdmq8V
         cDgvLtbt2169yvI9oi+RGQ4m95HUuYywS7vWERsgV9inAMqhfL2gbfIbczY3knbXOB98
         v11Q==
X-Forwarded-Encrypted: i=1; AL+hErFyBRbHnAMAzS42pe3Sf7SFoAuA2ume5UbhhI3Enrq48NpdeFYpBJCaLMhz4jW3Ux4USTmIqXmxNvrO@vger.kernel.org
X-Gm-Message-State: APuU4Z856pJxPDsASrC/CrXJNF5fZLZtzVRKWZAHfV37kneugkgd2zNb
	+z45W4tv0zLlV/GvVpxQRFuRFKMPfUAhnsBZM1JN9+Fs+15kqSEk1u8K
X-Gm-Gg: AZFdTZfk7qY+0IofIEY/1FDviltAE/Ej1mYDR6psyGLsylJIB83XjC32u1EbSbKvxwl
	mHDNf4p+64rJ+ne6Q4XkzPLIRSWExmqO04HCjc1qepSdsUnIZQgau4LUVvU2JOvKaye8crZ30RC
	kyGMO5gK0hFZKETNeGJO74rLvmJlNbtEUGnQ3QFvMOwKwmBwFuJtfI1SpEziZd9ae1qln0/2+tj
	hW5/t3wwH+PDP/h2OoDYz0R9P3Bc3rqbAsAfg52EbOuJ4WYJEZZxuaUNu/LMWi5nsltm+EhLWVQ
	oOn6CHyimwygC0lrdBHk5ROdsw4NfQqtipOvRchYNLfd1SilrDEAbhnd5bU0CGA3Ahx1b1vog54
	62aYRdjebjpMLp7W9oqJEcFsIcAGtO/gWsAH/cPbM0faXKAmjJtLt80cP44E91eg46G2zS1Eqhb
	Igb8uEr0XwCVVcUTnsMk0OSDOATyxTBWkiMB27aUYSprEQ/RKKI4B/gbBctYKwqv9FeDFsRT1kT
	Z0UoI6h1n3odzVnPSygoxnIhArEbJYqi0NNX1/EJ4HPIAtgx32hFZFqiMeJraP6ThPt/hEv2ubM
	znINLvb9pHVDamcoY1TNxWiJ6GRUJMlDkVfFfRcwj5YZRL9lrX1rvJHzZpOJQpLDMU2nJNic5w=
	=
X-Received: by 2002:a05:701b:21cd:b0:1b3:be0d:696c with SMTP id a92af1059eb24-1b5567e661emr20009355c88.1.1795686509781;
        Thu, 26 Nov 2026 01:48:29 -0800 (PST)
Received: from 192.168.1.36 ([2402:a00:163:2ce9:ad38:eaaf:b00d:c452])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55684c85fsm71781172c88.14.2026.11.26.01.48.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 01:48:29 -0800 (PST)
From: Ajit Singh <blfizzyy@gmail.com>
To: andersson@kernel.org
Cc: konradybcio@kernel.org,
	abelvesa@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ajit Singh <blfizzyy@gmail.com>
Subject: [PATCH v4 0/1] arm64: dts: qcom: Add Vicharak Axon Pro
Date: Thu, 26 Nov 2026 15:18:17 +0530
Message-ID: <20261126094818.77473-1-blfizzyy@gmail.com>
X-Mailer: git-send-email 2.50.1
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

Add initial devicetree support for the Vicharak Axon Pro SBC based on
the Qualcomm QCS9075 platform.

The board description includes the debug UART, UFS, USB 2.0 host with
an onboard hub, PCIe1 (NVMe), GPIO LEDs, GPU and DSPs.

The compatible string was merged separately as a917cf9dc0e9
("dt-bindings: arm: qcom: Add Vicharak Axon Pro").

Changes in v4:
- Move the PCIe1 PERST# and WAKE# GPIOs to the root-port node.
- Describe WAKE# as active low.

Changes in v3:
- Rebase on linux-next and include lemans-embedded.dtsi after the
  platform resource split in 1f90a2bab7f6.
- Drop the binding patch, which is already merged.

Ajit Singh (1):
  arm64: dts: qcom: lemans: Add Vicharak Axon Pro

 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../dts/qcom/lemans-vicharak-axon-pro.dts     | 517 ++++++++++++++++++
 2 files changed, 518 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-vicharak-axon-pro.dts

-- 
2.50.1 (Apple Git-155)

