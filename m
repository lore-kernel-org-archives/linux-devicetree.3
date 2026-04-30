Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5363A3E6F
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 09:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777541669; cv=none; b=IBe8L76n+sza51hw7Gvzu4fnBOhbIEe2w0ajoLPtTBzuSXtUog4y5gTiPx+/OJHykBohwU+RJIMQHLxdRwhei4zAGeaGdtXzbbTyh31SCdSsR7IL3T/p7C0ACDE+tspYSBNuOClP4UpWl/SmVqm8mYbSqXhwgeIoLgyxyEOte1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777541669; c=relaxed/simple;
	bh=6jA2TVd5eEOSJX75sMck6m6Y4y4DMXDpaG1GvHZkuTk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qcoCFROx4kpIGcK2cNmgk8emDrq4hjeE/a3CPIzCoE3SIBgAVnCWQcBbGmiKFpcwyFYQbfjnzaBLX6NW41iHNAlLzxe6sK8ocfknsfz9LA+UuZknax9E3IFCeQraOCalPsJQ6e5Wm+QBXZr3fGqp5LG1ZHmEiTvGfR5OOElZUYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aJr1URz4; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aJr1URz4"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43eb05b1875so375482f8f.3
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 02:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777541666; x=1778146466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UvUyUorr1MRTDJfdV4+jBpLC3bms0Zaxx62BaefmQJ0=;
        b=aJr1URz4ts9xKuMcuWLmGq53U5h7G3ZSeEUdjWwkmfbEmSRKQCaksH6Fd0CnK6ef8G
         ijQNKjJ5okRQ3lA4+2yb9wo1a0nqa1QsXZ+jbcM+pTerQL/dr2F7NnE2ZUnFAv6ERdOy
         EnWsk6uq4fpPAegYEifKm5+xIH08T4lKCrZ/WCerRHEFneWFBp43lMDBHL3V5a8kz7Ig
         eRaWOBdePvkZndTC7wJH8uNRlp79kAYJl+Y5DJDSAoV3LngRSlyQLr2CWbUUWy6nh0Db
         wpGx9NdmG16oWBva+MNr1kc2PPO0pFCD+bcZFBP/VgdMOUVzFs+LCxudqOApc+TnHZ3L
         5n5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777541666; x=1778146466;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UvUyUorr1MRTDJfdV4+jBpLC3bms0Zaxx62BaefmQJ0=;
        b=HTwaIJtb8S2S9zQ6rOQCiavVxx/a+ZaUPyP6K68Te7juSrQXRdHugrJ4PoRifZt5ui
         9cRKq8kLc1d862WeJEMdKUOPFkQTwjnm4ZwkZXoZo5VCfmwoP+UmV6jD9B0cUlk5Txmb
         gG4zOzhfounopJFT8LAvExpNmIT0luU+AtBwuZ2tjy/b3MKU4mlL0K+sQu6HDyvhipLf
         Fh4fKzY1dAaQnoTwV+vGfuZYUQ90iX9Y6+ajuMXDCjnp2eXYU5KX2A+vmfE4ZLFSkocs
         kozcsU61Djhp3kvPVuYFpYhIBnN0uF9rM33NDvn9s5BFsF1bRFJcYfrOZZMZVBcC2lp8
         wVOg==
X-Forwarded-Encrypted: i=1; AFNElJ8+W3vEJ6Rd4sXEiggSQestSibDSOrM1z3H1duKAJX0v7Mf6VWDnXygblXfNVfGdeRJQxrL7oRnvhIL@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4p62nbIZfnd/+eCaSXErbk1YPyLZ+Q060d3Cj0JDvMqiFaBlP
	JaVZoVqE0nQqVAdGjtS3UrjCFThwcZ0k86QMcrnNeUiyKAPA8gXLbh6s
X-Gm-Gg: AeBDietAT2q4BmwD7lsX2MDpZ84kx1pXHZMNjHKvsxDRkRjj15LjLv0uUSA3iONS3PX
	06hx9DbqYZvMNMOjURg1vgA/Wc9Be75UZXHyZr6CCvMmPhZWqkuueS2/I0lNGDBybRZ1ae/vwMZ
	UlpUUW3sjtrfC128Gz4wP3HTuuStxdc8wx0bg8xhRyiqjXgsSWXIBOfHpn/a9/A3NB9ZdAovSet
	64Y+JKDlFSHCDvyLdz/GqwaPhbhFPqrd8BZsFYQbzhWO2r6lECUO1s5DEqyl5/ZTI4dSs3ceRW/
	Cj0CqRxaNgVg7yD8sooFzLd6AdM/G2hSUc260RhI6/qyJMX6CzMVIA9XhKyvsuT2xbsllfqEpoV
	WwTP6OtY/N2OZ3Wp1yJ8BQlCYOuAblZfvsy111F6qfzj4WlpdM5bIfWic5YAVAwp6GIbnxHLaLO
	pGUqjavHTwJpotdV5QQxWuDoRX/geUInbLft9cWPuqJvB/iOji6zOPX3+PBYTc740aRlQ=
X-Received: by 2002:a5d:64e3:0:b0:43d:242:b9bb with SMTP id ffacd0b85a97d-4493e1c18edmr3288079f8f.18.1777541665576;
        Thu, 30 Apr 2026 02:34:25 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:342:901:e785:f7d2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b76e5c22sm11953913f8f.28.2026.04.30.02.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 02:34:25 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v4 0/7] Add Renesas RZ/G3L PINCONTROL support
Date: Thu, 30 Apr 2026 10:34:05 +0100
Message-ID: <20260430093422.74812-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Hi All,

This patch series aims to add basic pin-control support for the Renesas
RZ/G3L SoC. The RZ/G3L pinctrl has an OTHER_POC register compared to other
SoCs for setting the IO domain voltage for AWO, ISO, and WDT.

Document the bindings for the RZ/G3L SoC and add pinctrl definitions in
the driver. Some IPs need to set the register IPCONT_SEL_CLONECH in SYSC
to control the clone channel of the IP.

v3->v4:
 * Dropped patch#1 and #3 from the series as it is accepted.
 * Dropped Port P4 from binding header as it does not exist on RZ/G3L SoC.
 * Retained the tag for bindings as it is trivial change.
 * Added a patch to make QSPI register handling conditional.
 * Updated commit description for patch#3.
 * Updated rzg2l_caps_to_pwr_reg() to return mask in addition to register
   offset.
 * Dropped ffs(), using field_get() instead to get PoC offset in
   rzg2l_get_power_source().
 * Simplified rzg2l_set_power_source() by using mask from
   rzg2l_caps_to_pwr_reg().
 * Added scoped_guard() for RMW operation in rzg2l_set_power_source().
 * Added a patch to update rzg2l_pin_to_oen_bit() so that it can reuse on
   RZ/G3L.
 * Dropped extra white spaces in SD0_CLK and SD0_DATA0 entries.
 * Renamed SD0_DATA* → SD0_DAT* to match the pin function spreadsheet.
 * Renamed SCIF_{RXD,TXD} → SCIF0_{RXD,TXD} to match the pin function
   spreadsheet.
 * .pin_to_oen_bit = rzg2l_pin_to_oen_bit() and dropped oen_max_port from
   rzg3l_hwcfg.
 * Updated the data type of func varaible from u8 to unsigned int.
 * Collected the tag.
 * Started using an 8-bit pin mask instead of start and end pin indices,
   and combined multiple entries with the same port number and config
   using ORed values of BIT() and GENMASK(), thereby reducing table size.
 * Started using an 8-bit function mask instead of a function index, and
   got rid of the shared pin bit. This also provides info about the
   possible functions.
 * Dropped RZG3L_CLONE_CHANNEL_{PACK,DTAT,SHARED_PIN_MASK} macros.
 * Replaced RZG3L_CLONE_CHANNEL_CFG_PIN_{START,END}_MASK macro with
   RZG3L_CLONE_CHANNEL_PIN_MASK.
 * Replaced RZG3L_CLONE_CHANNEL_CFG_PORT_MASK macro with
   RZG3L_CLONE_CHANNEL_PORT_MASK.
 * Updated kernel doc comment for clone register from 'registers' to
   'register'.
 * Dropped dynamic allocation for the clone register cache, instead using
   static allocation in struct rzg2l_pinctrl_reg_cache, as it is a single
   32-bit register.
 * Replaced the LUT and for loop in rzg2l_pinctrl_set_clone_mode() with a
   simple switch statement.
 * Dropped the complex check to find the func match in
   rzg2l_pinctrl_set_clone_mode() by using pin_func_mask & BIT(func).
 * Dropped the inner for loop for finding a pin match in
   rzg2l_pinctrl_set_clone_mode() by using pin_mask & BIT(pin).
 * Dropped field_prep with "val << bit" in rzg2l_pinctrl_set_clone_mode()
   as val is just 0 or 1.
 * In rzg2l_pinctrl_probe(), replaced the temporary variable offset with
   &pctrl->clone_offset.
 * Replaced RZG3L_CLONE_CHANNEL_PIN_CFG_PACK with RZG3L_CLONE_CHANNEL_DATA,
   and replaced clone_pin_configs, n_clone_pins,
   r9a08g046_clone_channel_pin_cfg with clone_channel_data,
   n_clone_channel_data, and r9a08g046_clone_channel_data.
v2->v3:
 * Dropped clk, pincontrol device node and pincontrol support for SCIF0
   and GBETH nodes from this series. Will add this later.
 * Documented renesas,clonech property for controlling clone channel
   control register located on SYSC IP block on RZ/G3L SoC.
 * Retained the tag as it is similar change for RZ/G3E thermal bindings.
 * Updated r9a08g046_gpio_configs[] by replacing the typo AWO->ISO.
 * Added PIN_CFG_PUPD to RZG3L_MPXED_ETH_PIN_FUNCS macro
 * Replaced RZG2L_MPXED_COMMON_PIN_FUNCS->RZG3L_MPXED_PIN_FUNCS in 
   RZG3L_MPXED_PIN_FUNCS_POC macro for setting power source for pins.
 * Added clone channel control support in the driver
v1->v2:
 * Split DTSI patches from bindings
 * Fix typo maxItems->minItems in bindings
 * Collected the tag

Biju Das (7):
  dt-bindings: pinctrl: renesas: Document RZ/G3L SoC
  pinctrl: renesas: rzg2l: Make QSPI register handling conditional
  pinctrl: renesas: rzg2l: Add support for selecting power source for
    {WDT,AWO,ISO}
  pinctrl: renesas: rzg2l: Update OEN pin validation to use exact match
  pinctrl: renesas: rzg2l: Add support for RZ/G3L SoC
  pinctrl: renesas: rzg2l: Simplify rzg2l_pinctrl_set_mux()
  pinctrl: renesas: rzg2l: Add support for clone channel control

 .../pinctrl/renesas,rzg2l-pinctrl.yaml        |  20 +
 drivers/pinctrl/renesas/pinctrl-rzg2l.c       | 485 +++++++++++++++++-
 .../pinctrl/renesas,r9a08g046-pinctrl.h       |  38 ++
 3 files changed, 526 insertions(+), 17 deletions(-)
 create mode 100644 include/dt-bindings/pinctrl/renesas,r9a08g046-pinctrl.h

-- 
2.43.0

