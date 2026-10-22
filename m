Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792678181;
	b=HOk8YznbDhDAsSQirM/iTZS8pbO/tKMcOcUgIvKFVfyUdn7xL089SjARNBABkyQqZByX
	 O3/CBu4oP8d+hqPuvwjEWs0gaVifRhJQ3/L9epS+1hdRbRH/qbLDOa3lHeng9EfggWTl7
	 e+DRpIMSS/rL4YC32v/Q2LBISsyEU3IJxyWG0zdzwb33Vd0rOvYZBQoIb5tfouZ1MUwyv
	 jS2w+ZS5b88Pee6XlPopVvUP2y2pgRYmWrX3JxNXX/Fasy2bXV/Pk0FphgIzjOyhx3gtq
	 ih97/t00OM3zBRMRYGDVadw4Si7xS2hcuBxNzlivl+VLUuvkYGKWmjojAp5BY4nZ0dQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792678181;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer;
	bh=YXago1OoE7za0flCz23UuKhtMvUqXuNpFfpj2dGF/2k=;
	b=HtxWXYG0jkASKG9NAuTDIf+kBd+YXwlo489J3haH5dJ6Ofm7v/dnT/7D6JkL3g0q4CmZ
	 orC0yikPj2A3XMd/lims55+XOD7tooMJWe+axy5Fybt+HSchYBWsZybADA17ZEMfbalFI
	 LNJ9vCZIahv5WrxQ/GZ2u1gGEAMr5pZM8o54XXzaAwm1V0PQdQx3LQnT/nOT45qCt9Bks
	 L8Ya7etzBJOPZ6RXcUgvGIzgy1eS/bbGzcAxZYuOYlsW/fnoErv0lnsY7G43U8quxtLJ+
	 trD5QuGfs9TrBkGGovaFGabEgRRg86RbVVTM2sI6G/ZEun+62KMuML5tKPK2dm/aIRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ELtSfocY;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCE6606A323
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 14:09:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FCE6606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ELtSfocY
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so6397855e9.2
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 07:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792678179; x=1793282979; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YXago1OoE7za0flCz23UuKhtMvUqXuNpFfpj2dGF/2k=;
        b=ELtSfocY0aSODrp9esPeQgfMoz+v7HKwjSI7sxm8uS43Yq+tTC6w/9itWvg+q4ZcnH
         piXssBMpqrcC37U8hGqIcJamdkS7f/U9nFMis8k8Npb8YSDJxEpimRGzpyIuHeauFbRl
         9KaxhD/YA0ASU68hxIjpcszXrStVERR4r/vwFghL1hzVYVIdPlV26LubQahrh045AnVZ
         P93A/ZJ8RrorLnEloI7FnkwQqWIJB+LroHl3VcsW33iDpuEKNtQrsdbtcGVeiIgrxTP8
         I5e1lA58OvL3cz2UAHeG25x1qWmuX4VGxGz3uaZSwqxrJqjPGHa+k4YriJ56Q7KkOdYg
         tnqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792678179; x=1793282979;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YXago1OoE7za0flCz23UuKhtMvUqXuNpFfpj2dGF/2k=;
        b=ml8/tQzE7abJ627pUSarZ8Q4zrnJtQPRk2I9CIgPi+iwuVi5fGm8jnkpYF/qdIVPFB
         Pi7UZjGPY80B7wxYD9g94VglR5iZQfmU33Sk90rzvOaXZg4aho5zEQJa4VQyFctJkYzO
         Y8qAbSKpD3OWuVClfRzuRnDv1QzdkCrXhAC9JGuqeOWHD+QLDASWMoIHobYQfrJzmxEi
         bvopXlOM2nD5KE5U5V17desxoLrLTJ87pezYWlgqzS+jSKWKGSObFpHBGD2CWYNUycfV
         42OY7n/DfHLy+PXQXbeH9Fz+AExvR1fPzoq+BN1v1G5qM+fvUfcw+By/rLJSv/85KXvk
         CoVQ==
X-Forwarded-Encrypted: i=1; AKwUvBwXvAPI970w50N3E9heCDTneYcMkLz1CTLkHO0aoCfKomDJE2pzQGCUnThrstc6qF9lYW0JJMKhzlPd@vger.kernel.org
X-Gm-Message-State: AFq9FYKxLgSs3fohU3c8bpM7l2eDdy3ROQjgZwLz5kpGLlGTKMlmr4zF
	y56asIHk1Kk2JFiwjKlgoR2Pcv9ohYtJTEijwzkf+k6Sp91UgVHmPwgB
X-Gm-Gg: AYBFou2ldCY+QD9Ge6C9oE7ShmsfaWRBy0bVYGtRY6WBIwCefKuymunGcpugtZ7Wue9
	2LLobTQIXnvHrErG9As8k1tM64NNV83JzUbgyU+juNXFN67TLYMCqo5Mg3bJ41AVxdRGC8K9oxX
	57fHDavHGnE1qMG5umR2i/XLgFFxVN40c2R79mCwcgnimNfGkdIEOVg0i6bmDR+TJusqxx5jvt7
	IgpNPq1oNHCeV9fV7wkAqfzCcNxCcpZeBTKJvmkup8xYqw9jpwwvtmPHBlbPwOhf35+WnvD0CUk
	amGdxsWmoudiwz/fw4zsLZ15l6Z6zLU32dbGzXy5sUNXTiYW8p0hwRkcO2BNyukuuUOIKmrQC5o
	pJfH6fVumYOUGwuU+UiCc9uiUbiI2O+OIPR98Do7nRYCUIJEnXFkVYw+23Qvct0j1is+TCxQXlg
	bg119ktZ8/QGcKHAmIhDswp3sjftS1Okvxq3ZB6I+cX6YGWOn4qREvOPa63R/ETRlVQtbFcC6Eb
	n16j1b4n11+H3WNRf26s2WOo6ZfEq7Hg+9RlFpKNrxLbObcmMFzY453L0MlfNVwVoG0gIkdFleS
	S/pH9PX9FyiUlNxYEMcyTrYyoAdCr+h6s9DprCId/USZYmWV69qJ1yw=
X-Received: by 2002:adf:e00e:0:20b0:48e:1e03:687f with SMTP id ffacd0b85a97d-48e264c3ffamr7880482f8f.31.1792678179143;
        Thu, 22 Oct 2026 07:09:39 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2584e760sm12368150f8f.59.2026.10.22.07.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:09:38 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Subject: [PATCH v2 0/5] arm64: dts: freescale: Share the Toradex Cortex-M
 UART overlay
Date: Thu, 22 Oct 2026 16:09:32 +0200
Message-Id: <20261022-v1-imx95-overlays-v2-0-c769d6eb54fd@toradex.com>
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
X-B4-Tracking: v=1; b=H4sIABwZ2moC/32NTQ6DIBBGr2JmXRrAnzhd9R6NC8CxTlKlgYZoD
 Hcv9QBdvpd87zsgUmCKcKsOCJQ4sl8L6EsFbjbrkwSPhUFL3UnUWiQleNmwFT5ReJk9ih5tbVD
 1rcUayu4daOLtbD6GwjPHjw/7eZHUz/6rFSNFh42S0ky2se5exmak7er8AkPO+QsnW9p3tAAAA
 A==
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

Several Toradex modules assign one UART to firmware running on their
Cortex-M core: Verdin UART_4 on Verdin iMX8M Mini, Verdin iMX8M Plus
and Verdin iMX95, Aquila UART_4 on Aquila iMX95 and SER0 on Toradex
SMARC iMX95. The overlays reserving it only differ in the UART
instance.

Label that UART uart_mcu in each module device tree and share one
overlay, imx-tdx-uart-mcu.dtso, which reserves the labelled UART. The
merged Verdin iMX8M Mini overlay becomes the shared one, and the
combined Verdin iMX8M Mini DTB keeps its name. NXP's imx9-mqs.dtso
uses the same pattern with its mqs1_conflict_dev board label.

The overlays mark the port as reserved so Linux does not claim it.
Firmware remains responsible for configuring the UART and its pads.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
Changes in v2:
- Share one overlay through a uart_mcu label instead of adding
  identical per-module overlays (Frank), and include the merged Verdin
  iMX8M Mini overlay
- Add Verdin iMX8M Plus, previously posted with the Verdin iMX8M OV5640
  series:
  https://lore.kernel.org/r/20261001-verdin-imx8mp-hmp-camera-ready-v2-2-7d1343ecd3ec@toradex.com
- Drop the Verdin iMX95 NAU8822 BTL patch, now covered by the shared
  NAU8822 BTL series:
  https://lore.kernel.org/all/20261022-imx-nau8822-btl-v2-0-b4221ed43650@toradex.com/
- Rebase onto imx/dt64
- Link to v1: https://lore.kernel.org/r/20260922-v1-imx95-overlays-v1-0-694100afb4bc@toradex.com

---
Ernest Van Hoecke (5):
      arm64: dts: freescale: imx8mm-verdin: Share the UART_4 MCU overlay
      arm64: dts: freescale: imx8mp-verdin: Add Cortex-M7 UART_4 overlay
      arm64: dts: freescale: imx95-verdin: Add Cortex-M7 UART_4 overlay
      arm64: dts: freescale: imx95-aquila: Add Cortex-M7 UART_4 overlay
      arm64: dts: freescale: imx95-toradex-smarc: Add Cortex-M7 SER0 overlay

 arch/arm64/boot/dts/freescale/Makefile                    | 15 +++++++++++++--
 arch/arm64/boot/dts/freescale/imx-tdx-uart-mcu.dtso       | 14 ++++++++++++++
 .../arm64/boot/dts/freescale/imx8mm-verdin-uart4-mcu.dtso | 14 --------------
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi          |  2 +-
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi          |  2 +-
 arch/arm64/boot/dts/freescale/imx95-aquila.dtsi           |  2 +-
 arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi    |  2 +-
 arch/arm64/boot/dts/freescale/imx95-verdin.dtsi           |  2 +-
 8 files changed, 32 insertions(+), 21 deletions(-)
---
base-commit: 7f47e8eafbf55a2ad0697e5d28f5e6cff2fa42f9
change-id: 20260922-v1-imx95-overlays-89b3a9185b93

Best regards,
-- 
Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

