Received: from va-2-58.ptr.blmpb.com (va-2-58.ptr.blmpb.com [209.127.231.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286EF37C908
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 02:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.58
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789611631; cv=none; b=Hm7L8hEEWw8J86MyoyMoXsexe0tUDDQZn56uF6bVKLnPBS22xtPFZIvbXoBzsrwStrjTzVV+VqRLc0ELMN1QE7TjqmnWJe9ZVQkGQIs/Gqg02oW2qOhcgk5db/N15uOGAQ5XW0G82E0RfKD4o01AQnFbHF2UJTDGi81VCL149B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789611631; c=relaxed/simple;
	bh=YGqD+IFDIEdV8dvU4ixpK9NRMwtXwxwTm7PUXqf0dWA=;
	h=Date:Mime-Version:To:Cc:Message-Id:Content-Type:From:Subject; b=Bu2V8gZ5jyGv2ga1ETK/5UwbrOXd3Q3QliMAlSGwl3hfn08/Pn3vrDZ4hoM0Fg24qjyZvlt1VK1fMlkKdgcsJuN9arkOAiWr/9/LYKMuJDoI43DStFPrdAjlUXtvL8QDqISB7UZh8Zmg6Py57QEDqLdexOxb+oabzTwKcvXBxJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bedmex.com; spf=none smtp.mailfrom=bedmex.com; dkim=pass (2048-bit key) header.d=bedmex-com.20200927.dkim.feishu.cn header.i=@bedmex-com.20200927.dkim.feishu.cn header.b=s/9hsa22; arc=none smtp.client-ip=209.127.231.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bedmex.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bedmex.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bedmex-com.20200927.dkim.feishu.cn header.i=@bedmex-com.20200927.dkim.feishu.cn header.b="s/9hsa22"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=bedmex-com.20200927.dkim.feishu.cn; t=1789611618;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=oHh/5s3M6pXOjbNy0GxQxoiOTw0NvL602oW8qlAiArM=;
 b=s/9hsa22XuH7vMCVCHZRvYyg9pf/QR2N/2l7LxjwXM+Fju2PZ7QNV41APQtGIVM3X0xaAd
 3Y6U8nfCP75H5GJn2zJ5DMLB6FeH+1rM9JAXjG2M8GptcHE9T8a/35tNxX1T/5d2QmA037
 Znf1yotxLroEI8UD9+QdjPTTAIoHK0OTRw0n7TVPoZgbDBPbrBLduPP8tYBzl81MMGBD+Y
 gmehbTt59ojX2G0jIQBc0PLnUMnKkc9jbwYbjfQGjygiM1UhYBiTQ5BZQrQKgXqdregN76
 d3WT3zVY9YO6BiRAeNx5YG2sF7frFtO9SNgFUjUXKVTuNcnlFl1h6jU6D+eD5w==
Date: Wed, 16 Sep 2026 16:12:38 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Received: from [127.0.1.1] ([36.141.79.164]) by smtp.feishu.cn with ESMTPS; Thu, 17 Sep 2026 10:20:16 +0800
X-Original-From: Yanli Yang <yanli.yang@bedmex.com>
X-Lms-Return-Path: <lba+26aab4e61+cb756a+vger.kernel.org+yanli.yang@bedmex.com>
Content-Transfer-Encoding: 7bit
To: <linux-bluetooth@vger.kernel.org>
Cc: <marcel@holtmann.org>, <luiz.dentz@gmail.com>, 
	<devicetree@vger.kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>, 
	<conor+dt@kernel.org>, <linux-kernel@vger.kernel.org>, 
	<zhirunliu@aicsemi.com>, <dijiaxu@aicsemi.com>, <chunqiuliu@aicsemi.com>, 
	<liheng.wei@bedmex.com>, <yanli.yang@bedmex.com>
Message-Id: <cover.1789546358.git.yanli.yang@bedmex.com>
Content-Type: text/plain; charset=UTF-8
From: "Yanli Yang" <yanli.yang@bedmex.com>
Subject: [RFC PATCH bluetooth-next 0/3] Bluetooth: Add AIC8800D80 SDIO firmware loader and UART HCI

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

This copy is sent to my own mailbox for private review.

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
