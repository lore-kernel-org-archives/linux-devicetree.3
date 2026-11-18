Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795003639;
	b=ImNqNZM6BOP+GoNs4r+K8ne0S7zWYUf+te4Gu8ihpuz8/ZSDGar1RrA2i8tN0w7GBUiw
	 HR132Mff9cXUH1ul6E3bL0lksuqQkqAOoXSu+YhZL3BeExIoF7ZL5AjXdWA5bUa25xsLe
	 0QUi3QznOcohn3wiSXcSikpGlitOA8JJBgGnA73X0Bn2L+vjOeHPcVVQ+m7sFLvXudLB+
	 v4IKDC64EmMYea5gxgDU5dPqb+PtewmQ9Qzd4ecdehv17cNkWN5EjUdDBBq5mKmQOfz/g
	 UPasuG1g4JP6TNaNDPxI85bkmHuhHBfO3f9zrkADPhXuwXZJMYrjJ2H0hezidM6purQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795003639;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=9seoRhnpl2G4Qf4rk1mvdRgkYkYbj2TKHC5BtWjc5BE=;
	b=smOHtgs0OAlyuBltUBf59Svf8WVEsuyzZkjsp1ekfeZ2I+7VawKgRi3GR1aHHaSxqjaq
	 nuBhALeVTihEae/X2O94iluXL2dRGAoP4CjWfOBLTfM2xGJI3wwEbo5BIG/zr4xmkWBJr
	 Aw7fpoybQdrxOodAyHIj8z/u2W2hdgLaBPsz5WCJSTNoojGx+EQcl8V3KSurX+r/iAV07
	 E00Rb/CO5aLGpjShoBzEQlJDnhBoyol7gYLhy6k6r8Akn8Bj3ZJpXOaDpUUHJD5yCyG2D
	 5o8V6UPetz8uTi5/CqCDc37FKsuv1kSYTvE3Na9/ouPH3/A0LWmOnBVbNAVnr+WoD3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hBBIqFy6;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB0A606A32A
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 12:07:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DB0A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hBBIqFy6
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-491846221ffso708999f8f.3
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 04:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795003636; x=1795608436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9seoRhnpl2G4Qf4rk1mvdRgkYkYbj2TKHC5BtWjc5BE=;
        b=hBBIqFy6XG7BddvsgRBdoKAT+7KeUuUbyQxDLi6/EMwBfv2GEAJ5jfEJrHTuZtR03k
         bW0BXz8LIZCr8dZ7T6aNApsl1nPzAGkJ8P6kKm99JQHBxwhatTmQvLxGGNWIZAJCPV7r
         ykNpRzTWxGOPJqEnkdl/lsf376MbIDHpCak9ODqzHZBDWDWi/2m/mPPTwPiwGrPn9udA
         eTq54JooNiyjJgLax+9DwLRNcGQLFFvAVdSsdAWeMvzi5PLgElpETMlYerYFbm/vnws1
         S4BpnaYxFqMTzg73IBCkUp5nAIMChEFaj0lfwWG5a0Oy0Bm9zSdsSBa3QEgCW6LiQkLS
         D1pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795003636; x=1795608436;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9seoRhnpl2G4Qf4rk1mvdRgkYkYbj2TKHC5BtWjc5BE=;
        b=OO4h/IZFtJ5/iQHdAIOHS/1Wc0Hi/FfSbnsVkXbrd3RJHQhFXRFf6eB8OXGoPYn8GM
         NasbmGXxFOLY42ijTxjnNZa0iXDmIskpzqtDoncizICD5moCRHHB0e2KK8mwnhRq7sM1
         uoAliQYFBYDeTDQ0dbNcxpmdwjM4oLaCuuqBU3r6E8/NWgvbJOgHigpQQaKakmg5qy7p
         o46DnFF0osnIx33TwPIbMgxwRrr+tyubNxkqqt8YuXo2ic0RtYj/sxj9e7Japew/hdFy
         51e/Ele6CTDoKQdUk+z3CCiabajkWUe1y4qAdSl65kmTD43/Ic36RuAqxj/ovuA4olrw
         Gp/w==
X-Gm-Message-State: APuU4Z+4gomB/4Ze9IY8DAYzSI1H9C1dF3g2RDE20a1ovuuXR0RblQX9
	kAeVMADOZrz4YzUPDUrzlXmD/vUttJw/G1fWLrM6azGWzBqNTQOVVcZh
X-Gm-Gg: AZFdTZcrOSjBMzeVjIJBJO0a9JMoBpBzJrXRyrsIDwfExk6fZpa203aQ8k16mSGAmKo
	M77UQnp05oIkN0HEg5nFmUnl8nXvZKIfA6HKTxijFlcsk+jIj7qoQc0iYqjfI18G/V1Dsln/BNh
	nys/mC09N3EOp3N3ViMdXuolf+6tTSt4ggv3GzTGf3XQPDy+vzuwD4wyK2IMBANH7/knQPQedFB
	PbpjiM/MOM54999kYnmKl8JOL+urU3wexzxfsLszG3BR2kwYIuyucWK+3Fir+KYAB0wzmzRL/2j
	kXjy8dIJPxz4vcX2eWSnH8lhbXQfB3LvqibMjDAulpr21TQcJt4rD/Yv8l9T/LMBGbjAA5qx/9a
	WsdW3vwC2NwSgBPwjXhZeBNCqPxxAoGpw/DYJ97msiDDn188xVURQ2mTsm0jOj9zIDBoDNnilm6
	yHeWO+e2BfQ7Z7Yg5qXwiOmyG7s6Z+4gaNMu4J15wzrJ836qJnkeRP7iBqvgEje9IN0x04ZHS6n
	ihcLQNrGuhebYaV6RObK6X6ULt3GdY1bNPwY7XK/zqPMNlswM6wu3QZZBaX+fJ3ZDHS4ZfEowOU
	5/avrZtO/9LNGQoUOya+vUL/umKga3az71bBR++vw4eMhJ7A4lxNeCP/VWocENP2gcEri6B7E1d
	9pv46tY3cPRr9zqaL4ciw
X-Received: by 2002:a05:6000:1ace:b0:490:88e5:92d6 with SMTP id ffacd0b85a97d-4a63ce07af1mr5436523f8f.49.1795003636236;
        Wed, 18 Nov 2026 04:07:16 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c37fsm4382583f8f.18.2026.11.18.04.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 04:07:15 -0800 (PST)
From: Abdur Rofik <rofikcoga@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Ivon Argel <ivonargel13@gmail.com>,
	Abdur Rofik <rofikcoga@gmail.com>
Subject: [PATCH v2 00/10] arm64: dts: qcom: add LG V60 ThinQ 5G (timelm) support
Date: Wed, 18 Nov 2026 13:07:04 +0100
Message-Id: <20261118120714.31505-1-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
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

This series adds initial mainline device tree and driver support for the
Qualcomm SM8250-based LG V60 ThinQ 5G (timelm / LM-V600) smartphone.

Hardware features supported in this stage:
- Base board devicetree (sm8250-lg-timelm.dts)
- PM8150, PM8150B, PM8150L, and PM8009 PMICs and regulators
- UFS 3.0 storage and MicroSD card slot
- GPIO keys (Volume Down, Google Assistant) and PON keys (Power, Volume Up)
- Simple framebuffer (continuous splash handed off from bootloader)
- Adreno 650 GPU with GMU and zap shader
- LG SW43103 1080x2460 DSI command mode AMOLED panel with DSC
- Silicon Works SW42902 I2C touchscreen controller
- PM8150B USB Type-C controller in sink mode with USB-PD and
  orientation switch
- QCA6390 Bluetooth HCI controller on UART6

Changes in v2:
- General / DCO & Identity:
  - Replaced account handle "rofikkerneldev" with real name
    "Abdur Rofik <rofikcoga@gmail.com>" across all commit authors,
    Signed-off-by trailers, MAINTAINERS entries, and copyright headers
    per Documentation/process/submitting-patches.rst.
  - Replaced un-documented "lge" vendor prefix with documented "lg"
    prefix across devicetree bindings, compatible strings, and dts files.
- Devicetree bindings:
  - Added lg,timelm compatible in arm/qcom.yaml.
  - Added lg,sw43103 panel binding with enable-gpios and
    vddi/vpnl supplies.
  - Added lg,sw42902 touchscreen binding with vcl-supply and
    vdd-supply.
- Device Tree (arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts):
  - Renamed file to sm8250-lg-timelm.dts matching vendor prefix.
  - Reserved memory: folded cont_splash_mem and log regions into base dts;
    sorted all nodes by ascending unit-address.
  - Ramoops: adjusted size allocations (record-size 0x40000, pmsg-size
    0x1c0000) ensuring 256KB is available for dmesg panic dumps.
  - Regulators: dropped unused LDO4 from PM8009 regulators-2 node,
    resolving the invalid 1.05V constraint failure.
  - USB QMP PHY: corrected swapped supplies (vdda-phy to 0.9V l18a_0p9,
    vdda-pll to 1.2V l9a_1p2).
  - GPU: enabled &gmu alongside &gpu to ensure MSM DRM component
    binding succeeds without -ENODEV in a6xx_gmu_init().
  - SDHC: added complete pinctrl states (sdc2_default_state,
    sdc2_sleep_state, sdc2_card_det_n) to &sdhc_2.
  - UFS: added regulator-allow-set-load and regulator-allowed-modes for
    dynamic load scaling.
  - Panel: added enable-gpios to panel@0 node; sorted display nodes
    alphabetically.
  - Touchscreen: used fixed regulators reg_ts_vcl and reg_ts_vdd for
    power supplies instead of raw GPIO toggles.
  - USB Type-C: replaced PDO_BATT with PDO_VAR(5000, 9000, 3000) to
    ensure valid 9V/3A PD sink requests without clamping to 600mA;
    added OF graph ports connecting DWC3 HS and SuperSpeed QMP PHY
    orientation switch.
  - Bluetooth: corrected QCA6390 PMU voltages by setting smps6 (0.95V)
    and smps8 (1.35V) constraints.
  - Cleaned up unused dt-bindings headers and enforced strict
    alphabetical ordering of all referenced label nodes.
- Panel driver (drivers/gpu/drm/panel/panel-lg-sw43103.c):
  - Removed redundant manual unprepare call in sw43103_remove().
  - Guarded sw43103_backlight_update_status() against execution when
    unprepared, avoiding unsynchronized DSI DCS writes.
  - Removed hardcoded full brightness writes in sw43103_enable().
  - Expanded Kconfig help paragraph to 4 lines.
- Touchscreen driver (drivers/input/touchscreen/sw42902.c):
  - Converted GPIO power controls to standard regulator bulk supplies
    (vcl and vdd).
  - Added suspended flag guarding resume and I2C operations to prevent
    IRQ disable imbalance on resume error.
  - Pre-scanned for palm touch reports before queueing MT slots.
  - Used named initializer in struct i2c_device_id table.
  - Followed input subsystem error naming conventions.
- MAINTAINERS:
  - Added entries for LG V60 ThinQ 5G, LG SW43103 panel driver, and
    Silicon Works SW42902 touchscreen driver in strict alphabetical
    order.

Abdur Rofik (10):
  dt-bindings: arm: qcom: add LG V60 ThinQ 5G (timelm)
  arm64: dts: qcom: add LG V60 ThinQ 5G (timelm) support
  dt-bindings: display: panel: add LG SW43103
  drm/panel: add LG SW43103 panel driver
  dt-bindings: input: touchscreen: add Silicon Works SW42902
  Input: touchscreen: add Silicon Works SW42902 support
  arm64: dts: qcom: sm8250-lg-timelm: enable SW43103 panel
  arm64: dts: qcom: sm8250-lg-timelm: add SW42902 touchscreen
  arm64: dts: qcom: sm8250-lg-timelm: enable USB Type-C
  arm64: dts: qcom: sm8250-lg-timelm: add QCA6390 Bluetooth

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 .../bindings/display/panel/lg,sw43103.yaml    |  69 ++
 .../input/touchscreen/lg,sw42902.yaml         |  73 ++
 MAINTAINERS                                   |  19 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts | 840 ++++++++++++++++++
 drivers/gpu/drm/panel/Kconfig                 |  13 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-lg-sw43103.c      | 587 ++++++++++++
 drivers/input/touchscreen/Kconfig             |  13 +
 drivers/input/touchscreen/Makefile            |   1 +
 drivers/input/touchscreen/sw42902.c           | 355 ++++++++
 12 files changed, 1973 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/lg,sw43103.yaml
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml
 create mode 100644 arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
 create mode 100644 drivers/gpu/drm/panel/panel-lg-sw43103.c
 create mode 100644 drivers/input/touchscreen/sw42902.c

-- 
2.39.5

