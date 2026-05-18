Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E37405C33
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 20:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779135781; cv=none; b=Jezr56QH1S7mKcNyQhS0uAqjDULEg2In+dju5PZ8jnBTNDhGjXu9gcz8+1tQq4xSgK43xnfLH1pv56BN5TgB6RrAUljT3EW8eXNGKNgPfl07aJ2CRKJnr8O/CPb2eIwFuw02hLlzYivcFOnnmF7eCG3qWN+MRuUAiMyIwUimzag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779135781; c=relaxed/simple;
	bh=7wjz55g5It7D1iARd2kd9SG5ABYHwmZ+CNk27XYM0yk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IerQzZpesFc2ItIDJZO0KV2r9/yK54jfaNsnoSV8Wxx6n+4PDv+8bgHOisLmFfa4rR8AYW243KgpfwjedzXjPzdnu//dh+qtzn607dFbuLBskq/cXG9Zj6AvYo2o8D5SlGbvuUaPhEoWlLO7o9sgMt63sVWJ9MOdzPVzGfXyNh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JYWi7qrO; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JYWi7qrO"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-39556b00a85so25547441fa.0
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 13:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779135779; x=1779740579; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2hKEXdf7SpgU8S8EsSxa8nph73zmVb4ykhaEpQLdhQs=;
        b=JYWi7qrO1QGMYc4/kgccIhi5wzyqO7daO4KqRUfknPRvdgfN8F0cAj+glq2kTwHuSO
         FM/IoYgQl05303L1NVjsPudRPqexYRrr7XDivoCo4Z3ZzPuJn/Ui3W/hRpdk4Ik5N/dL
         vN+xJ3RORmCSo06GdwDLjz8VyPPlHDFiLr4cxSF5b/6h9Hd11T5zrqbTQMcYZ4dIWWPa
         G5hwj4hmtpNb+TmlH4KMvtG+lQLm9xsQQ37yYee93Ar3P6lFlF4TyIeHlykACFEG9cRc
         4ktCP7jmPqIZSlxqjDoeAVOpJyEWVSVclrRAxmSTEW15myYJxfXE7BNWp5KzJHUo0CjJ
         s2QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779135779; x=1779740579;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2hKEXdf7SpgU8S8EsSxa8nph73zmVb4ykhaEpQLdhQs=;
        b=YyTNCwapRZgj/vHzUqE4uB5tCzh9EdROJbzsCDU2zHqp1uuCixmj36DU8stMlgQpzS
         0L9dAjDr0YgxgF+XRw24lLb3k7ve6BhMkkT8GpFlA/hKMSULCZHKjuOIN+O/fNQG/2Px
         ywuYOig+fnGraZFRFHOtzCBCyGeIYbAbGFuAMxwoceWwCE7Nw4yi79524G3LxyCS0Bpx
         leWwfpNEXSXZOp+otzwylbgeCzQpDheVBKCKdavPXAvAo+/uWEU1TJsokNI47d3Gupgm
         uGQMmB2bNfhJ9UdVV3d86jI/3p7hGFGGllzJ5joF3E3/62svQcRSiWGUJuDpNAj+g/AE
         4EdA==
X-Forwarded-Encrypted: i=1; AFNElJ+qTa7bL2EKoPbMwh6QI3SAQAlZShUHJ0Xfsy9nftSbNLnx+KVMxb1MW6FCNp7e4bZZN5me/OfT9tkq@vger.kernel.org
X-Gm-Message-State: AOJu0YxYieIMnGpvoY7/em4gWIIyYTLl8SWae2TkNx7G9IEoQGCyryxF
	wpm1w02EesIqat5ybc4fkDUpGzwnyKxSRjQHT8LZj3mwUsk6/u85gJfl
X-Gm-Gg: Acq92OFuc/9+IFWubLynCIN3ejlh4ZbkSUWRVImKwK7St4dwfKtGDcKxEKEqa8AO1me
	E5BSXvMR8l40Q2RJ5H8+LJ513U5Rcz6USrFd4RgZkFEqo0pUOUWHCiv7MsfKfWPgnyW7f5vbCH7
	vtKDHcMJdmhTJw9mwn5jXxNJ4FcH1lUAiFrBcs7t8ixsqAsFnAvtsBnhnFd1SOTfBV019K9wFRy
	rr94zxj5BnSUBpg5j8fYTfym9rUC0BZ+cXe8cUMW7ZTvK6jUNltAiakEqwWGfFHp7jqe1KbG7jr
	ulZMCKL8TTqz5AXOCzuyEwNcTRFeGDR6SNumeL7yYtNbHzBwDxXP++CF4pXc8oPoemzo5rRi9xr
	LSJUGlShq1UebsYA0NWVrHN732q3b/XiVZhClvHnFcpI7jE/E8RemmwmVW+r36S52r6QI9YPvLe
	D25wE2nDTzvK7t60laOIzd1uNxQoNsNimPkVfGyjg/
X-Received: by 2002:a05:651c:41d7:b0:38d:e220:8dc2 with SMTP id 38308e7fff4ca-39561dbd27dmr49775531fa.20.1779135778324;
        Mon, 18 May 2026 13:22:58 -0700 (PDT)
Received: from localhost.localdomain ([90.157.113.57])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395887b42f8sm15225061fa.36.2026.05.18.13.22.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 18 May 2026 13:22:57 -0700 (PDT)
From: taygoth <taygoth@gmail.com>
To: linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Casey Connolly <casey.connolly@linaro.org>
Subject: [PATCH 0/6] usb: typec: add Qualcomm PMI8998 USB Type-C role-switch support
Date: Tue, 19 May 2026 01:22:45 +0500
Message-ID: <cover.1779127507.git.taygoth@gmail.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds USB Type-C role-switch support for the PMI8998 PMIC
used on SDM845 phones (OnePlus 6/6T, Xiaomi Poco F1, SHIFT 6mq), which
have been locked to USB peripheral mode under mainline kernels until
now.

The PMI8998 SMB2 charger block integrates a Type-C detection unit at
SPMI offset 0x1300 that performs CC sensing, debounce and Rp/Rd
resolution entirely in hardware. The state is exposed through the
TYPE_C_STATUS_4 register and reported via a single consolidated
"type-c-change" interrupt. The new driver reads that status on every
interrupt and pushes the negotiated role to a usb_role_switch consumer
(dwc3), enabling automatic peripheral/host switching on cable change.
Because the hardware handles the Type-C state machine natively, no
software TCPM port manager is required.

The Type-C block shares the SMB2 USBIN region with the already
mainlined qcom_pmi8998-charger driver. The two coexist on the shared
SPMI regmap without write conflict: the typec driver only reads
TYPE_C_STATUS_* and touches the IRQ enable bits at offsets
0x130b-0x130f and 0x1367-0x1368.

The PMI8998 USB OTG VBUS boost converter at offset 0x1100 has the
same CMD_OTG / OTG_CFG / OTG_CURRENT_LIMIT register layout as PM8150B,
so the existing drivers/regulator/qcom_usb_vbus-regulator can drive it
through a compatible cascade -- only the DT binding needs the new
compatible string added.

Power Delivery is not implemented. The PMI8998 PDPHY block at offset
0x1700 is register-identical to PM8150B and could be wired through
the existing drivers/usb/typec/tcpm/qcom code in a follow-up if PD
negotiation becomes a requirement.

Tested-on: OnePlus 6T (sdm845-oneplus-fajita) running Mobian
6.12-sdm845. A USB flash drive, USB ethernet adapter, USB WiFi
adapter (TP-Link Archer T2) and a self-powered USB-C dock with
downstream ethernet all enumerate through xHCI after the role
transitions from peripheral to host. Repeat plug/unplug cycles drive
the role through device -> none -> host -> none -> device cleanly
with no IRQ stalls or stale role-switch state.

Series mirror:
  https://github.com/taygoth/linux/tree/pmi8998-typec

taygoth (6):
  dt-bindings: regulator: qcom,usb-vbus-regulator: add PMI8998
  dt-bindings: usb: add Qualcomm PMI8998 Type-C controller
  usb: typec: add Qualcomm PMI8998 role-switch driver
  arm64: dts: qcom: pmi8998: add USB Type-C and VBUS regulator nodes
  arm64: dts: qcom: sdm845-oneplus-common: enable USB Type-C role
    switching
  MAINTAINERS: add entry for Qualcomm PMI8998 USB Type-C driver

 .../regulator/qcom,usb-vbus-regulator.yaml    |   1 +
 .../bindings/usb/qcom,pmi8998-typec.yaml      |  97 ++++++++
 MAINTAINERS                                   |   8 +
 arch/arm64/boot/dts/qcom/pmi8998.dtsi         |  19 ++
 .../boot/dts/qcom/sdm845-oneplus-common.dtsi  |  43 +++-
 drivers/usb/typec/Kconfig                     |  17 ++
 drivers/usb/typec/Makefile                    |   1 +
 drivers/usb/typec/qcom_pmi8998_typec.c        | 213 ++++++++++++++++++
 8 files changed, 392 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/qcom,pmi8998-typec.yaml
 create mode 100644 drivers/usb/typec/qcom_pmi8998_typec.c


base-commit: 5200f5f493f79f14bbdc349e402a40dfb32f23c8
-- 
2.47.3

