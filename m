Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794494288;
	b=JSTJmXsSow+VXu8VeoC8fwdfG/a/zVLeIFn5YmVd0mHwr8pagjSAd4rJ53LWilVO2/tv
	 IELUsSPJ+f3cOv7zWW7NtOG7OIcq/MSz+G56185ym5dYyK7vv/MJzztN1hGdXnk0eMMMU
	 6XCWq01N8evvrcGvaq9RxiXsSZVjTNb1qPvzbZEXURdoFp9IFBxJApVg7LAcD2fZRNdDa
	 FZqi0tmG1E54nFEQlRbMBr13kxIsYs1l97Yaug5pbxTTnDwIH6DfEiQx1r9bVlqxTurHQ
	 0MVrIUwWVpYEoGtv8ipp75Zt+C1SxRrsNZ8iZeHc01IlGVHO+nlXtdr+1z46ss09C/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794494288;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Y2IsT0Jg+TbimKFRjyF/8T2AxcX0fGduIv2EOCoI08Y=;
	b=fqFrh1Br3YbJv+41xVWxb00/xFBFL1qPl+HJiQZgh6uwbedhhfmvtds+3WXd4Hwlfp2+
	 XWlVyf/O73TD/DcIz3Q/MLhL0wX6nxk/8xEblYEvVSoN+JLvqfjkq3NY00F6a87zSC60Q
	 hqD0bnyhvL1qPRTBdWCIRmSi4cAHnuyvSJdJ8HFdUZxX4s0AyDaauGQZB/cX9E8cAqlgu
	 q/Ocr5zPic+7hykk+QzdTb7Z2vUx8WwG5jGyoomuA1S8IELp9v2XMK0ZjpyjN8DOiL8Uf
	 nWiHRYB4UTdv+yy6UyW2QbY+mtUyERS/rri5abGZH0CQAQmrDJWolh78wBoMcxtH7nA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UgbpnkMj;
	arc=none smtp.remote-ip=209.85.217.46
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8034606A31C
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 14:38:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8034606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UgbpnkMj
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-7d2dbe5c4b0so1465796137.0
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 06:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794494287; x=1795099087; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Y2IsT0Jg+TbimKFRjyF/8T2AxcX0fGduIv2EOCoI08Y=;
        b=UgbpnkMjKp/P9v1pdxKcUUylD2QK9AZ17IJVx+9nruvrpjN5xy59QGzuFP0jV73QD9
         5BPj0g/gNUqfS8JgeXuUo/DpDfuo0tP0pYIrVXkmwOnGK36eKtRN8kVGcNWpQMgoVgkm
         UiZ3ABIB6hoJw9mCRUzTCsbyRrFqAvB1eRDFIq0+X0UvGY8mqW91V+9eHEzlFR3YMPQC
         emoZr4VkA9Z33y7C6FtEC4INiloypFQGtxRthzfr6t7cXpR45HyxurlkvpG3wjHB/XDK
         DvMH60oy5H/yXwyU2GPl5gl9tGgshH5hLpWOICgd3Qw5A8LIvj60ImIKDq0y20g/341g
         vASA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794494287; x=1795099087;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Y2IsT0Jg+TbimKFRjyF/8T2AxcX0fGduIv2EOCoI08Y=;
        b=L3qH8W6zZZqXPmXlQrYoKY0u/wsPBEw14xYfPxWBTh1+RO9m3nNiTzxJeQ1tWJaw0P
         PJgqOdi+6a5ptJIp4NrGMMrjX07sGFQ6Y6R+DDNDULiy/LUQtmUJWZiWj9w9SLiceRPD
         2jy447QFUhxgsNC1597NBicQKMGB2Ed926A8tky/0+K49MwL0CYtYEBtHJoFwsfwN5t9
         nTuLVtGKX39zrMGzWr5Mw01UNKtphs6JyV3dK2JqRCVfAFmh9IAD3e78OC+jzT16ih0U
         1FZd90GS5og91mx3Ov6UU4eIKOqoZzhDvs5o1gL2U8jVs2Gr0EwXOl2BFctOkuBKYCRd
         IOIg==
X-Gm-Message-State: APuU4Z/lTFZqTK9ozLgirx8zHAdcMeb3gPX17NmgqttZVBhwILBfPbPb
	eMOJexKCTBpZQE/tb5svUdFY55nzatOJ4Ji503K1MRAk/bXwiE3AWrRm
X-Gm-Gg: AYBFou0CHdMqx9dQWOfiiN80PkN8bEFwainOPiLe9ELywVnekA3GBjIcH7Ed+CTtJDh
	VzjV89WKVUay3B1JcLO0B1wu7ntssqRLWdSGVd3IwBlaz7dJ5epeRQoiGCDBRixHW9fQG1RIdXa
	8UPLMYBGG7MbTA9RUL9WfBUYNsRYSWsWN6UPudHGBPESnoey06yAv8xj6IEJvrbMxCUlvHw3+z1
	AxEqbfwWJl6BcUCPT5sR52cc6xNOGOuhV1euE4exrINE/vf1ly7iMVhuFpjr0i5P/niDURuHubh
	jT/0isMfhDpDrfUDoWfzh9/LlBoWlSPfymwKutQjc+NLgI1/QlvlbqaX4h+ryG6vZawtojIzkV3
	vA0rlPva9zMlWLDx9ND1qm2fpM2HhO4vGneNuVH/5a/TLZW/GV3vCLXL6Ir6aEeXKJjySZwWZ7o
	20r8ifxi26g/NHXfUPc31dvrmICznvs94/Uh361NOPtDQjN/huwuLq7qAPbKQLcItfrk5Q7iHxu
	AfnlL1fuRrggL7VuWCeLBdme8NcjtD84CbngleNzadogYgxaFS35OI1d1JKTF70dSBJTvHvn3lK
	My7H9mggbr2neepPzs+ee+rG9Bc0tveZiA==
X-Received: by 2002:a05:6102:149a:b0:7d2:d194:3de6 with SMTP id ada2fe7eead31-7d5061175femr2125294137.35.1794494286681;
        Thu, 12 Nov 2026 06:38:06 -0800 (PST)
Received: from [127.0.1.1] ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c1fffe12dsm5177230241.5.2026.11.12.06.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 06:38:06 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Subject: [PATCH 0/3] Add Lotus Carrier Board with Aquila iMX95
Date: Thu, 12 Nov 2026 11:37:32 -0300
Message-Id: <20261112-b4-v1-aquila-lotus-dtbs-v1-0-ca150bb4b0f9@toradex.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACzP9WoC/x3MQQqEMAxA0atI1hNoSu3Cq8gsokYNFJ1pVITi3
 afM8i3+L2CSVQy6pkCWS033rYJeDYwrb4ugTtXgnY9ELuAQ8CLk76mJMe3HaTgdg6Fzo5fQMnG
 MUOtPllnv/7l/P88PWp6GYmkAAAA=
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794494281; l=1750;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=Fyhoh2gvGk3Ft2hHZ7zQnpX2e5GJIorXgz24xXGeA8c=;
 b=wJ/LS0jpHT8LcyyR5TSXkc6mSkonP1SS8IhsBv4qtGJ5gdoAYFflJJigSL5SExYpGh6YgMZ1U
 yfhxpkJMDaqDqYK8caPbJ0/huMKaV14HbWGQ3RhMaeUGivztiMEcHxk
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

This patch series adds support for the Lotus Carrier Board with the
Toradex Aquila iMX95 SoM. Lotus is a carrier board for the Aquila family
featuring a small form factor (Nano-ITX 120mm x 120mm) and built for
volume production.

The board features:

- 1x 1Gbit/s Ethernet
- 1x 10Gbit/s SFP+ cage
- 2x RS-485 (Isolated and Non-Isolated)
- 4x CAN (3x Non-Isolated, 1x Isolated)
- 3x isolated digital I/O
- 1x CSI
- 1x DSI
- 1x TPM 2.0 chip
- 1x microSD slot
- 1x USB-C DRP
- 1x USB 3 hub
- DisplayPort through a Mini DP connector
- A mini PCIe slot with USB / SIM card connector for a modem

Additionally, this series adds pinctrl groups to the Aquila iMX95 SoM
dtsi, muxing the I2S_1 and PWM_4_DP pins to their GPIO functions. On
Lotus, these pins carry the SFP+ low-speed control and status signals
and the isolated digital I/O readback signals.

Link: https://www.toradex.com/products/carrier-board/lotus
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
Leonardo Costa (3):
      dt-bindings: arm: fsl: Add Aquila iMX95 with Lotus board
      arm64: dts: freescale: imx95-aquila: Add GPIO pingroups for the Lotus Carrier Board
      arm64: dts: freescale: imx95-aquila: Add Lotus Carrier Board

 Documentation/devicetree/bindings/arm/fsl.yaml     |   1 +
 arch/arm64/boot/dts/freescale/Makefile             |   1 +
 .../boot/dts/freescale/imx95-aquila-lotus.dts      | 365 +++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx95-aquila.dtsi    |  61 +++-
 4 files changed, 422 insertions(+), 6 deletions(-)
---
base-commit: d6bcfc94eb4da6e089c5473970cd96727292fd97
change-id: 20261104-b4-v1-aquila-lotus-dtbs-00c2e45a1a66

Best regards,
-- 
Leonardo Costa <leonardo.costa@toradex.com>

