Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794382305;
	b=mXoptdYWrdb2zZy1+k57rimy3CvQv7uMyhA0UV3ORcOd7M6MuY554F1K8f3kaCYQINED
	 qnRjxcjPqVQZFC4ubae/TSnAknRR4U0dyx0ox9JMWZRqbXAVzzNGfso8hTB8uDfAPsaZA
	 vC3X068dp2DiVoVSweCv97vw/fMqZA56woF2KRWg8u6hyCYCm1X/ff+XnAi2Wk+7okdz9
	 dw0XN68XHbbWmoVMH9YONtGZRgObIhCwiNH2K2Baaf+VHtt/RH1Opmh5cKKMPADyE4RLU
	 5kzzNj+v9tFetNre1lT/wvqKd3jJCJIDQMjdtrFF1R/g3BVue1CzQkAtUPjZ2hK67dQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794382305;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8NGJF2GluLUXT5n0TBAtOAqoo1zFr6A4uWG8k4Arcrg=;
	b=oCSXe48DfMkMCj2Z/OPqK2uGlv1aLlCFhaIC1vAPR6O9qzuOKL18YPBiEP676FIBLXDd
	 O/PcOTR8Fm/KUYT5C2lPa4WcqEvww+wUMDZGYHzkONEtkUFqF6OtpH0JTrbwo//6NSha1
	 sK4mknWe2gLi1PFSF3VsZ510ljNA5+Rs+22c4ggCgOC1Vqt1/rdkus261mbfFrJ78Lzd/
	 xJ++uWmXpBWd6x5ZYnaFu4VcrdhhAYZb1+ij6fQVhnGWzaoNF2ODORInsRQeSsz/e8Xsl
	 +wYBkBunA5Ht7jg7Emlgo1q09wgcmsKaQtkBY4vAu/gAcEro8tRn8OsEEtWOm0sI3fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=POBHpjgW;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7EB606A324
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 07:31:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC7EB606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=POBHpjgW
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3704d30b84fso3684386eec.1
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 23:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794382304; x=1794987104; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8NGJF2GluLUXT5n0TBAtOAqoo1zFr6A4uWG8k4Arcrg=;
        b=POBHpjgWKutWrj0vlhgfSILkVOELfl8bF815uz1giarrjJe2IJjQrnYXSNHzlrCRhp
         23KvuDunKN3OHSJPvl3IBkvKRHpnfQUAnOlbYTo78spWsndzQW26MjmiVDTMPo6itnxj
         6kAcOfZDJqH/mZhdZj4ceAWvs7nQW+Tthc95Z4s8IZpKyFyNWRGzpiAQREjv/00cVqfK
         6rLIQchypvAKppsNraKUfzE5gsraXCW7UF9IuoTc1eizzc0STkupEtRi2NncNkh5PeZF
         qbZHFf9ZZGSq+YVYAr0mnWZs6DFErVBIW8HeIcQxR5KdRqoog1cf2EkMMLwNjUnnzFR+
         jDuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794382304; x=1794987104;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8NGJF2GluLUXT5n0TBAtOAqoo1zFr6A4uWG8k4Arcrg=;
        b=2cH1/eZSYAPyPHmQ+8kkVEFPxdRF9fRZd8s0Q7LPFiCHO/wwTJ3ojGwuGjDYLFXrmO
         7y9xsAYVLp0TS+6x26riTJb6GvtdlA576i8nm4GPCz+TtqyVgjUKSkeMOD3jRFtjI+yT
         xl+3K4/vZIv8ZuU7IPU2QF/q5abXeh+67Hp8w1hdFnqZvytBG4xcasRxlbshox2kcJzv
         7WBxiwAW40H7X2uWPENXWGblRuO/mgQj0dfcTOQqJBIFcpkLLihgARTosAEXyv0fgQtf
         hDkOLzK5hA86FXgDartjuSC/gVh+YPnQne++3pclG3hn+LEga/0Y/1xP9J5ukqICkP1u
         pGOA==
X-Forwarded-Encrypted: i=1; AL+hErGChsN2UfPNnniv4JIo0J0ZzBsGfBNVbfZTreH9lZTXm22cz8SZbQfGK4IMQGUqBEOO8luTLy3vR5BP@vger.kernel.org
X-Gm-Message-State: APuU4Z+hx1RqBo23szkMhdg6urPLJXagKXS9kV71ALp+SoGUDXNMtQsP
	tzAVeVVcmOXV/6sXN+tj9n4aPcilSxak7zVhbKOrHfuOzIHgOJZvams6
X-Gm-Gg: AYBFou2j2P/AeDkpyWc5hXl1SgsHrp8k5DnAXXl0j79ltZOY6RNXzsSN1VBP33ofkPC
	XxBjS458o9Hx2spJQLnoQCfZzv4ZzlGs+0VcrWUbkI8w79QBQTEEIXtL+SwWIgj6bipvSx6MZpT
	+eU/gnmb8++o7sAIfpOEOCQ84+c0cO3ef+onCS5YX/ety+TP1JKvdDBGJVnEbEW6lLLWfqhdq93
	x0uFb50yHVDuyU/1lgX1oxIysQdAClBaX9aqFLdc9d3Uvir/1ChHsGgJFzae4Aw2XlmIWxStEn7
	qhiOfCtcHV6H9nwHkqbZ//S1AV/G9ch/zF3o9AOIi/mhfASmFCIoO/Re5cDy6X/yYY9FfbQW9BX
	Imqpe/ZgJVe6O9ygq0zIup0uNTlt9yAPs9lCVRbeY+UxyxgYPOaJOmOK95IPDMSYeNGTNWitZUc
	25YKxMVSpD72lyOBVd6ZMUSxr+cHwCbk8AEJIwNM6dTTdgRGYbN9EnFCNI16YX6NKsm6qO+lQ//
	wo1cvLqYHfSSDtqE4X9svmbpmskFDaIA8md59PKVneaGD3YRgTox6HcWVwsXSeOthyDngx6RaJU
	mZPbVffDYn2yqwcLgsdyK8EkxQoO4Kvl3j0CCOKXhtiTdv+ha+JDwph04B3obKngzesPjRq4LkK
	t7GnWORgbylhaxHW9Zw==
X-Received: by 2002:a05:693c:42d3:b0:366:9f06:3c4c with SMTP id 5a478bee46e88-3768694ff22mr1816814eec.32.1794382303560;
        Tue, 10 Nov 2026 23:31:43 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe32276sm12640655eec.8.2026.11.10.23.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 23:31:42 -0800 (PST)
From: Joey Lu <a0987203069@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Hui-Ping Chen <hpchen0nvt@gmail.com>,
	Joey Lu <yclu4@nuvoton.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v9 0/4] phy: nuvoton: extend MA35D1 USB2 PHY driver for dual-port OTG support
Date: Wed, 11 Nov 2026 15:31:33 +0800
Message-ID: <20261111073137.381966-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
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

The MA35D1 SoC has two USB PHY ports managed by a shared hardware block:

  - PHY0 (USB0): OTG port shared between the DWC2 gadget controller and
    the EHCI0/OHCI0 host controllers.  A hardware mux automatically routes
    USB0 signals to the correct controller based on the USB ID pin state.

  - PHY1 (USB1): dedicated host-only port for EHCI1/OHCI1.

This series extends the existing phy-ma35d1-usb2.c driver and its binding
to cover both ports and add OTG role-switch support, while keeping full
backward compatibility with existing device trees.

Changes since v8:

  - dts: set the DWC2 (USB0) register window to 0x40000
    (0x4020_0000-0x4024_0000, per the MA35D1 spec) instead of 0x1000, so
    that it covers the per-endpoint FIFO region at 0x1000 + n * 0x1000.
    The EHCI/OHCI windows were checked against the spec and are
    unchanged.

  - phy: select MFD_SYSCON in PHY_MA35_USB, as the driver depends on
    syscon_regmap_lookup_by_phandle().

  - Patches 1 and 3 are unchanged.

Changes since v7:

  - phy: add "depends on USB_ROLE_SWITCH || !USB_ROLE_SWITCH" to
    PHY_MA35_USB, so a built-in PHY driver cannot be combined with a
    modular role switch core (link failure on usb_role_switch_register()).

  - phy: restore the PHY reset fallback.  If the PHY is already in
    operation mode but its clocks do not become stable, reset it and poll
    again instead of failing immediately.  The reset is still skipped when
    the already-running PHY reports stable clocks.

  - phy: gate the HUSBH0_GATE clock dynamically again.  The clock is no
    longer enabled for the whole lifetime of the driver (devm_clk_get()
    instead of devm_clk_get_enabled()); .power_on/.power_off enable and
    disable it, and .init enables it around its register accesses.  The
    gate can therefore close when neither port is powered.

  - phy: nuvoton,oc-active-high: keep writing the polarity bit
    unconditionally, so that an absent property means active-low as
    documented in the binding, regardless of what the bootloader left in
    MISCFCR0.  The bit only affects the EHCI/OHCI host ports' VBUS
    switch and is irrelevant to the gadget use of PHY0.  This is a new
    property in this series, and no mainline DT depends on a
    bootloader-programmed polarity.

  - Patches 1-3 are unchanged.

Changes since v6:

  - phy: update the copyright notice in the rewritten driver header to
    "2024-2026" instead of "2026", preserving the original 2024 date
    rather than dropping it.

  - phy: split the unused linux/io.h removal out of patch 4 into its
    own patch (3/4), since it's unrelated cleanup that predates this
    series (the driver has never done direct MMIO access; all register
    access goes through regmap via syscon_regmap_lookup_by_phandle()).
    Placed immediately before patch 4 since that is the first patch in
    the series to touch this file.


Joey Lu (4):
  dt-bindings: phy: nuvoton,ma35d1-usb2-phy: extend for dual-port and
    OTG
  arm64: dts: nuvoton: ma35d1: add USB controllers and dual-port PHY
    node
  phy: nuvoton: phy-ma35d1-usb2: remove unused linux/io.h include
  phy: nuvoton: phy-ma35d1-usb2: extend to dual-port with OTG support

 .../bindings/phy/nuvoton,ma35d1-usb2-phy.yaml |  44 ++-
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      |  36 ++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      |  36 ++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |  65 ++++
 drivers/phy/nuvoton/Kconfig                   |   2 +
 drivers/phy/nuvoton/phy-ma35d1-usb2.c         | 313 +++++++++++++-----
 6 files changed, 420 insertions(+), 76 deletions(-)


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.43.0

