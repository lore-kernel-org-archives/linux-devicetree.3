Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795160042;
	b=CLFTc0XrCASaurhXHOieOoawtvR/QKmO9zU459kBdm/dkdGU8OObCOBJqG37U6NJRQFx
	 9nfsXXLeUgMCwE35qCbtsxXiWDTkYlqOz1Ifhwp/ql/MRr1/qqTFI2/6NQ8Ki6zlgAf1Q
	 7IQ3+lxPPsrjyPDHJRqrMystKdAD/v/+4TDPZPXev2ulCmCvMhAJMTF44e5FrhKIl0DPh
	 QFsI3X+X01tL2siDfSErYvlns3TY5k9zpEBGIMFppSxzBzsY1C//Kiue8xLVPJw2NWHSr
	 nh+mmEtBRO0gZTdiEz0mQB0RzdNDDP9E90SRGasCfwvkLnjk3tr5A8VmAWfSSB61XyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795160042;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=2dmjNDN0Io3H696USfP/J2hOzQK1CyrceenVjfxqDUM=;
	b=koxS3H1qtJ/wWV7OCtCuE6nRUpNhBDzYyYcWbbDKb86XsteQIWNg2IdHAUmFYJTolgpH
	 quWbcDN3vlZeryAWiXseHuyjHziR0RKdblRM4Qisp9ymfHtMsXEgg5z9B0Re0UDVzjAbU
	 k2lCL6r2DfMfiC0yraWVucy8zeZanJz3tPRpG0c+eUZP/C+lZ7vJd5sMkUmkiGZiBZkEf
	 6CkE0rLMKTb/anLq11gSsQGUcqCXCYaVBMa30UaAwBub8RysWpWv9YNXSWuAl7i1MbDc9
	 BHHstLiX1+82N8q8AGggpofARKQrGhM/8AfEy8t1UbvLXCMN3sWEmMmzysQ1q3I23+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EI6YcmBs;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2097860A2613
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 07:34:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2097860A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EI6YcmBs
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so4550675e9.0
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 23:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795160040; x=1795764840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2dmjNDN0Io3H696USfP/J2hOzQK1CyrceenVjfxqDUM=;
        b=EI6YcmBs/SJAP/PMzNH5nIgd91UJ8s6teAoJ7aLIXG/zvpjwZG8MCXdf2NElFNbbPm
         Mad8sQWLsaiReBi+maiFxEqA0IRsGVmhPE3LHFamiZKQdWptX6kKQijP6+V3xQBLT4WS
         6n5oFgikC7UpScXdp0zHTvVt8l95wacBiP3hkqunWUsyaGVz5dux5eqS9KAzg5glzS+U
         WVaD9AOxd2QveT1N7G3Liy/mLPjXyy7vz9oD6JsQeXJAThwAG4Gcygl4yfo4jO4ozrC4
         KJPGqog1D8E0ZBb/uVo2lZmIg6L0fqQzpcmc0Fhi/2uEDqe2IWTTUTdXu1FfTrIJ0+NV
         QXCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795160040; x=1795764840;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2dmjNDN0Io3H696USfP/J2hOzQK1CyrceenVjfxqDUM=;
        b=Dv2Tn95AlD5BRZOEilPB1eRO6NOQrpyj9SAVesEbZBz3NyI3aDdi/MoiDCmIOq3Vqi
         xxVOI8NQ3ygmpMsNq7UlJcBKCNHCxnh4i08jQhIutv0Kv94NEi/fZKi/tPEOXAve0pCB
         U0YPqhcKjgZSvljrZSIIbkS9xuJis8fo7tMSfuJ5hb7GE77T8YVBsQuVwKF0G/dtAXPr
         Nz+dik7RMl+izWTZ64IID5b9McPqbGtDT237yU9RgM6B+W1APA5MY4+fn44wmD6p2/cD
         DnMDikedqvNCytH+U+usn5mXcSPLJ8S6JnIFnyGkV2w6gdqGeGiVY44Vgcuinx9cDrYe
         enEw==
X-Gm-Message-State: APuU4Z9XC4keq0rD2s01y3wqGPYlPPJBf9bKaAVMqTyLaZJPDh46/UQ5
	f2p7pJ1IFpPOcjX6yHXA6IMEha0V97TpdZkgQD80Tjswt0pYzvszB7Ic
X-Gm-Gg: AYBFou18Z8w6LdnyyorTF0C4YXG2ypccA4I4jq59pa6Ea+LEGEjKgZE1IZigy9rFlWd
	iicDEas865kTFLNgwv5Phek+XYwgga53BIOoo2Ryi+0HxMQrd7VxYiisryBp27hhlYBzQJp88di
	W+I4Aq07qDOt9X1MADMNcB/Swt3NCINhf+ovhvkTQJ4VjX858B5P1TQ494wAI9mjxnchMx4WKtp
	IAAM54JNnimr2Qn67acbvgIVwhlvvgsQSAwRHeG7yfb9FO5jCoqgJvjaUKahcjTKdJsTEARqPk/
	EBkTrwaWEin1Q0Mpo+SMr3gAOBq1WtIutQDOjoueaL7M6fMsGzR//IEJ9A1C+gt1iYaxqbU6bQ9
	n2fokRyCUxdAm5TqgW0hUbfnxKF1idp3ihLKLXGB5VZa9SU5ig4KqZ51d8ke3/hWS0006pqzkdU
	gvKgiWDr4oHGOxNaa1CRnUUrc0RQR6DyX+rkrHGm8iqYWhaaaxmN46WWRoOL7r860Kdy6Bo7LyZ
	jC5cFl19wxWZVt/yp13x0J6u0TL9yZn2RwdvrCQJv10N90+tc61AIY4n4o+bZP3q/hYRwHS6uih
	Hm1YCiWWV6nZg8dESdu7Rc8HGentqYSLTQtTrndex8JckJjpZUPSzOdhRBFDaDk4JAyBc8hgqvg
	=
X-Received: by 2002:a05:600c:1911:b0:4ba:38a9:85e3 with SMTP id 5b1f17b1804b1-4bb8880eecbmr48162345e9.12.1795160040163;
        Thu, 19 Nov 2026 23:34:00 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a3a3dsm54154045e9.10.2026.11.19.23.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 23:33:59 -0800 (PST)
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
	Abdur Rofik <rofikcoga@gmail.com>
Subject: [PATCH v4 00/10] arm64: dts: qcom: add LG V60 ThinQ 5G (timelm) support
Date: Fri, 20 Nov 2026 08:33:48 +0100
Message-Id: <20261120073358.10267-1-rofikcoga@gmail.com>
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
- GPIO keys (Volume Down, Assistant) and PON keys (Power, Volume Up)
- Simple framebuffer (continuous splash handed off from bootloader)
- Adreno 650 GPU with GMU and zap shader
- LG SW43103 1080x2460 DSI command mode AMOLED panel with DSC
- Silicon Works SW42902 I2C touchscreen controller
- PM8150B USB Type-C controller in sink mode with USB-PD and
  orientation switch
- QCA6390 Bluetooth HCI controller on UART6

Changes in v4:
- Base Device Tree (arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts):
  - Drop vendor brand prefix "Google" from the assistant key description
    per review feedback: rename google-assist-state to assist-state,
    google_assist_state to assist_state, and update label to "Assistant".

Changes in v3:
- Base Device Tree (arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts):
  - Model PM8150L SMPS6 as top-level fixed regulator smpc6-regulator
    (0.88V) rather than in regulators-1, because PM8150L SMPS6 is an ARC
    level resource (ebi.lvl) and querying it via VRM causes
    rpmh_regulator_probe() to fail with -ENODEV.
  - Drop conflicting memory-region reference from framebuffer@9c000000 to
    prevent simple-framebuffer/simpledrm driver warning and mapping size
    mismatch with reserved memory.
  - Add board-specific firmware paths for CDSP
    (qcom/sm8250/LG/timelm/cdsp.mbn) and GPU ZAP shader
    (qcom/sm8250/LG/timelm/a650_zap.mbn).
  - Drop duplicate sdc2_sleep_state pin configuration from &tlmm (already
    defined in sm8250.dtsi) and redundant &pon { status = "okay"; }.
  - Adjust ramoops pmsg-size to 0x100000 (1MB, power-of-two) to prevent
    kernel round-down.
  - Drop unused <dt-bindings/phy/phy.h> header.
- Touchscreen driver (drivers/input/touchscreen/sw42902.c):
  - Fix potential unbalanced regulator disable in error and unbind paths
    by registering devm_add_action_or_reset() after sw42902_power_on()
    succeeds.
  - Guard sw42902_power_off() when suspended to avoid calling
    regulator_bulk_disable() while supplies are already turned off.

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
  - Ramoops: adjusted size allocations ensuring panic dump space is kept.
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
  - Cleaned up unused dt-bindings headers and enforced strict alphabetical
    ordering of all referenced label nodes.
- Panel driver (drivers/gpu/drm/panel/panel-lg-sw43103.c):
  - Removed redundant manual unprepare call in sw43103_remove().
  - Guarded sw43103_backlight_update_status() against execution when
    unprepared, avoiding unsynchronized DSI DCS writes.
  - Removed hardcoded full brightness writes in sw43103_enable().
  - Expanded Kconfig help paragraph to 4 lines.
- Touchscreen driver (drivers/input/touchscreen/sw42902.c):
  - Converted GPIO power controls to standard regulator bulk supplies
    (vcl and vdd).
  - Pre-scanned for palm touch reports before queueing MT slots.
  - Used named initializer in struct i2c_device_id table.
  - Followed input subsystem error naming conventions.
- MAINTAINERS:
  - Added entries for LG V60 ThinQ 5G, LG SW43103 panel driver, and
    Silicon Works SW42902 touchscreen driver in strict alphabetical
    order.

---

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
 arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts | 815 ++++++++++++++++++
 drivers/gpu/drm/panel/Kconfig                 |  13 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-lg-sw43103.c      | 587 +++++++++++++
 drivers/input/touchscreen/Kconfig             |  13 +
 drivers/input/touchscreen/Makefile            |   1 +
 drivers/input/touchscreen/sw42902.c           | 360 ++++++++
 12 files changed, 1953 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/lg,sw43103.yaml
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml
 create mode 100644 arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
 create mode 100644 drivers/gpu/drm/panel/panel-lg-sw43103.c
 create mode 100644 drivers/input/touchscreen/sw42902.c

-- 
2.39.5
