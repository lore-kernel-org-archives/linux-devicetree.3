Received: from va-2-60.ptr.blmpb.com (va-2-60.ptr.blmpb.com [209.127.231.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21AFD384CD6
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 02:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.60
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789611966; cv=none; b=lSUZcJmHy/j2GiCO6yoGBbbuNSoZDauaZPhz3p+zpM+nTvgFIuLBIUtRmB3xrIUReMfW4Hp7WKBlqUjCYXMzNvUq5tkXUajVfVunrS0P5l4pYY7+tjwjshAtbYH5f0KU4ZpX+6VXQeIS4Q2XitRJDuwTr0FOiLi3SSKrmB/1k/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789611966; c=relaxed/simple;
	bh=r2vkKfuGogED/FVa+F4aRO9Fs20LMU7kBHebZ75J9iU=;
	h=Subject:Date:Content-Type:Cc:From:Message-Id:Mime-Version:To; b=n7gGp8Yk01L9ClD7RbcQ3oYd22C4FUHn/Wfy4Ad5XFnKSffBCUk48yVAykJw9RYzZOAeTOR9QCxVgvEj9SWSPOpJElO06gkhD8kge4eYH7olP9uF7wyIJOkKkozP3nHQsdOD8wWovCXQkb7e2qkK1eS+el20f+SL9hS+cXDDV40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bedmex.com; spf=none smtp.mailfrom=bedmex.com; dkim=pass (2048-bit key) header.d=bedmex-com.20200927.dkim.feishu.cn header.i=@bedmex-com.20200927.dkim.feishu.cn header.b=L5jCgYYC; arc=none smtp.client-ip=209.127.231.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bedmex.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bedmex.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bedmex-com.20200927.dkim.feishu.cn header.i=@bedmex-com.20200927.dkim.feishu.cn header.b="L5jCgYYC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=bedmex-com.20200927.dkim.feishu.cn; t=1789611959;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=eWaAESNMzsoOoTdpS5OvMuubfk9TTP0c1hBQ9qvYmE8=;
 b=L5jCgYYC5aGzR4DWAQkUNpj0CHYJldM36EsJ4/zIzRhliGi9tBrxwQAvdVTyUL9v6xrRy3
 62XRT8o9KnpdN2jErh8HerXSlvzjmRXX0dAf7xQeKVYX0Hsuumw8P8HMQZt1XXQVsbIUAN
 3FmqiJd009sg5vy8Y2cNABzZd7sRFciwnrqkwUa1uYqnEmZM73gpEtePo+3F3ZyFq2Ywyk
 a35V4Pvnlig0+GU92z+xPMN8pPAo0FPbN+63gO1kI790/AmZ8E5Lg7nrun55Kk5JHVEnMX
 IfjGj84oW73Ox8V/+14Qa4POVnrl1UNUfya5ICs2Lo2FvkX/cc+85mXsW0ao+w==
Subject: [RFC PATCH bluetooth-next 0/3] Bluetooth: Add AIC8800D80 SDIO firmware loader and UART HCI
Date: Wed, 16 Sep 2026 16:35:37 +0800
X-Original-From: Yanli Yang <yanli.yang@bedmex.com>
X-Lms-Return-Path: <lba+26aab4fb5+82f9e8+vger.kernel.org+yanli.yang@bedmex.com>
Content-Type: text/plain; charset=UTF-8
Cc: <marcel@holtmann.org>, <luiz.dentz@gmail.com>, 
	<devicetree@vger.kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>, 
	<conor+dt@kernel.org>, <linux-kernel@vger.kernel.org>, 
	<zhirunliu@aicsemi.com>, <dijiaxu@aicsemi.com>, <chunqiuliu@aicsemi.com>, 
	<liheng.wei@bedmex.com>, <yanli.yang@bedmex.com>
From: "Yanli Yang" <yanli.yang@bedmex.com>
Message-Id: <178954773705.2.3446471521233620446@bedmex.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Received: from [127.0.1.1] ([36.141.79.164]) by smtp.feishu.cn with ESMTPS; Thu, 17 Sep 2026 10:25:56 +0800
Content-Transfer-Encoding: 7bit
To: <linux-bluetooth@vger.kernel.org>

Hi,

This RFC series adds initial Bluetooth support for the AIC8800D80.
SDIO function 1 loads the Bluetooth firmware; HCI traffic uses a separate
UART interface with H4 framing at 1500000 baud and hardware flow control.

The series adds the AIC vendor prefix, Device Tree bindings for the two
interfaces, and the btaic driver with build and maintainer integration.
The UART node references its SDIO firmware provider through the
aic,firmware-sdio property.

Validation status:
- The vendor has confirmed that SDIO firmware loading works.
- UART HCI communication, controller initialization, scanning, pairing,
  connections and data transfer have not yet been validated.
- Suspend/resume and Wi-Fi/Bluetooth coexistence have not been validated.
- No hardware functionality beyond firmware loading is claimed.

This is an RFC for implementation and binding review, not a request for
merging at this stage. Feedback is particularly welcome on the SDIO/UART
split, the firmware-provider association and the device lifetime handling.

The driver requests the following external firmware files:
  aic/aic8800d80/fw_adid_8800d80_u02.bin
  aic/aic8800d80/fw_patch_8800d80_u02.bin
  aic/aic8800d80/fw_patch_table_8800d80_u02.bin
Firmware binaries are not included in this kernel patch series.

Thanks,
Yanli

Yanli Yang (3):
  dt-bindings: vendor-prefixes: Add AIC Semiconductor
  dt-bindings: net: bluetooth: Add AIC8800D80
  Bluetooth: btaic: Add AIC8800D80 SDIO loader and UART transport

 .../net/bluetooth/aic,aic8800d80-bt.yaml      |  87 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |  11 +
 drivers/bluetooth/Kconfig                     |  16 +
 drivers/bluetooth/Makefile                    |   3 +
 drivers/bluetooth/btaic.h                     |  26 +
 drivers/bluetooth/btaic_core.c                | 180 ++++
 drivers/bluetooth/btaic_sdio.c                | 886 ++++++++++++++++++
 drivers/bluetooth/btaic_uart.c                | 331 +++++++
 9 files changed, 1542 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/bluetooth/aic,aic8800d80-bt.yaml
 create mode 100644 drivers/bluetooth/btaic.h
 create mode 100644 drivers/bluetooth/btaic_core.c
 create mode 100644 drivers/bluetooth/btaic_sdio.c
 create mode 100644 drivers/bluetooth/btaic_uart.c


base-commit: 6696072ffe07205255cf83621a95a1aa2f9f6e62
-- 
2.34.1
