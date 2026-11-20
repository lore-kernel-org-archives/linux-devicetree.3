Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795190094;
	b=zLYPIpzhnmBXoZ/Q2bs+X7HusYg1ZElGsWJZKtyK91LZvXgKiXMA6Ux/T45Jog9R33nh
	 7y+xwGyqJMjKCNNoQ4OUPzuqABPpd50AzNAwYxsvr8Jk2AlAFh+IZh/uyzu1TNdYsyATL
	 rr9iqj/nNkXf3Ae7wGZ/wBD1g46CQrTGt5UnpH+hs9lA2GXFeWF1Zz2AI0XPoInBbxvHg
	 XWLP49rGqEalA4kp+Ndbl5DgcRyznM8IBaGbaBqEOXHm/NwdEhC8I7jFtqSGeIIMsbELu
	 EX2Fsf+TqsviUAZEVTNuvc5CX0VNggzp/nthRDxRtU0n10TAtaRoncZCQ0cTaw8xajQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190094;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=3+aCHgVYgy4GxhOiFEAFYeoXQcQ3nMSgt2tm+XSQojA=;
	b=bLuhlAQ5AOQVgmhRBvQrxi34Cy7J7+zjl5otKl96WdEgcWGgUQY8MeCsa0t+7HsuKnNq
	 jv+p3o4fwE2DpFEctbLH/NxVo1Em7yzD1s7qJxHn92D7eio8OcD9uLwKAI+tsdWH4dAom
	 iM9i4LB/Z+ABG/1/GAL0hJLmtzeK//gdTuVGmbeBvsFydprDz0OzauccZHAq8cfyigC+G
	 CLTQ0q1MSv3dKHSO7Y9BrviYoZkVcx9Tm4VBXjH2/amMqS82pZSmXkqVPz4m7iThuKBAe
	 dXrj+hhhhQXaVT2qN9fYjIwBKLpw1WSpvZisIr0o2jAzBGLDkk0GQrgdqxndoqh4Ikg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="RD5/lCtn";
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC97606A335
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 15:54:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECC97606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RD5/lCtn
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4a5024b3c28so1443376f8f.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 07:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795190092; x=1795794892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3+aCHgVYgy4GxhOiFEAFYeoXQcQ3nMSgt2tm+XSQojA=;
        b=RD5/lCtnOo+RVTTI7oVZaKgd9Q6AkBDr/99U8FJkjIF5smpOcyVCzuMQxHGfar6mJP
         37JcniEPoUaZpTyUdt7yOTWPLtrvvu8AzDXr/L34n/+/Nc9nXYOPlfV4w2V781MMQM8G
         53Na36tf6jUaKgxhT0zm5Wm3KIMtVpSTLF9W5oh/1KR1iwQmFF+qHaWV8PVJ+kHJX1iX
         RPoDVVb4F+Eh7tSV8FPxMIWWzu8Zhcdj03O6TponxyFSrrZ9YPmtJdT7HnrqNxKkFDQf
         7ojn0P8k9fkZxWsWkHoFIirgqk+ylgTPwXP7F3bPNM7Qc/OO+JHnYCtfr3DUp3YIo8zH
         gQig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795190092; x=1795794892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3+aCHgVYgy4GxhOiFEAFYeoXQcQ3nMSgt2tm+XSQojA=;
        b=b2vQ5ggZbyGCM99dfMhmaHYN5/KZh7j6Bkt95+b6ghZzuVR/Cn/wUnPnbD8Alymvj3
         OJXezuZdXxTkCRhcFhLCTTYM0TkyQ20Ua5YVM/J8dJdcxvBOqz1Yrw+LaVi3AgKm9U6c
         IUas5JHtc8aNo2b45skaW3UnuAdQGGmx+aZYx/bqkp7/J1crzS1rKg2Wf6njPeubqusQ
         MzMniuWdjNRhfbhWNBwQWbh878O9QRKkmAuxiq0IMi+l7AGLXgOdX/qVzGdRvSpMszeG
         A/lxfTBp6oVf1g5J/FYljA+fFVPOT7U4uI7S0EHTO+Wo+XMMwuO9XlplclymvCmJNsf6
         cqKQ==
X-Gm-Message-State: APuU4Z+EfFx3fg1Mv1aG9RBouvbSim1V97NSp8hcrQQ1TzJxMLuJ7qQ4
	uENVy1fpIQ1fHcyUuDcHsxN4UrtwgVNd+1u7FRdyckjIDy8gsf8ybpEZ
X-Gm-Gg: AYBFou12RJeFhaR/OqWrEhqU5wuOXP+nVDMjxys3VyrBuc65IzmPHFBuNGyd4sS78ZH
	HQUXhnEdfgsrFUZebnJmi8OsHbJPJaAABCbZ16AB+NLvwGZqOCRR5R496ieAmO7sDvbtM7c/0FQ
	3M5Q4MZmssG0Ckfa5biWxMdGzhXE8A1sXpnBrNDOtL/Wiudi3m0bz6QGrHRCvsv1Maq+Xjy5MD1
	OoZDyh1w7KcMCG8HaD03eWXuOTHgUTacfbXVykTf2DJNM7qWx5/YIn6AJ4CvX+DQX8Ul2kUniiO
	LcesG1jzaeVDHBqd1FczcQN2WD5HsEB3aPWSJP0uHv+v9YBm52xVySf1mJIX/7kW8uxGxvEVy1W
	8WWfoef7hYlkwgdJQyZ99QZ2UbkJ7e82+FEFxC4VHbtXYB6Eo/8TCHXvBPMSc+C6nh05oR7X85B
	/inhMEPwL4mT3WOUnOfJhecCAxy/jNyiQ4+MFme3L0CszxhvHwdSVuhp6kaxJIvO/kJaeEhbdIR
	Mn+JplA6jlCugld6rWc//yVLVmYHqnmGydTW+mJvovG1T7F4YD0CQQjyYmyR1g7KiXtuvYO+zaz
	7OwXc4JRUedj603ihtPqQ1y+FZP7rckISMA9azncwbHSVnre5qmCAMDM9cE5d4HXhLfXXG0WYof
	pR6vLx2kIFxgMSy+kGjoq
X-Received: by 2002:a05:600c:4504:b0:4b4:a551:681a with SMTP id 5b1f17b1804b1-4bb887fc396mr78640565e9.3.1795190092017;
        Fri, 20 Nov 2026 07:54:52 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a15absm83982635e9.9.2026.11.20.07.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:54:51 -0800 (PST)
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
Subject: [PATCH v5 00/10] arm64: dts: qcom: add LG V60 ThinQ 5G (timelm) support
Date: Fri, 20 Nov 2026 16:54:39 +0100
Message-Id: <20261120155450.7719-1-rofikcoga@gmail.com>
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

Changes in v5:
- Touchscreen binding & DTS:
  - Replace separate interrupt-parent and interrupts properties with
    interrupts-extended in the lg,sw42902 binding example and the
    touchscreen@48 DTS node.

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
 .../input/touchscreen/lg,sw42902.yaml         |  72 ++
 MAINTAINERS                                   |  19 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts | 814 ++++++++++++++++++
 drivers/gpu/drm/panel/Kconfig                 |  13 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-lg-sw43103.c      | 587 +++++++++++++
 drivers/input/touchscreen/Kconfig             |  13 +
 drivers/input/touchscreen/Makefile            |   1 +
 drivers/input/touchscreen/sw42902.c           | 360 ++++++++
 12 files changed, 1951 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/lg,sw43103.yaml
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml
 create mode 100644 arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
 create mode 100644 drivers/gpu/drm/panel/panel-lg-sw43103.c
 create mode 100644 drivers/input/touchscreen/sw42902.c

-- 
2.39.5
