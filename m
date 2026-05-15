Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE731DE8BE;
	Fri, 15 May 2026 01:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778807847; cv=none; b=bEz6JprkQ+cp5mCWZntPie8mhTS50hRlOgI+DMYF3olLAtwhAp3mSDNbemW2rjymGM4DQ9Br6lbhS/SQfF7yJS4KdIhPpJgLFJ/nHwhOx2LBQQ+MOBQVMGZWlhRoM6/EcH9RBqxcau77e+fHIl+tguz8MZjYZJnlUt2xxWGoC8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778807847; c=relaxed/simple;
	bh=SBhtUk5LxStn9uFGuOs1Bm4gzHoDQePMv+PnFCWJ4RY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Pcc0su4uanlIbpa6pdrwDkXl7E3JWlA3LeOV+vhKTIdc30SPtEGtna2aohZ5bHibAG1JAA0FIY4O4DYCZ2G0SmwRGQUJ+NROOYXXsvSl8qsKWkpzEKW4vYSNs24lEcrdbjafINpz5SL5M7P+e3S8Miv3nEnZ5ylCzoOax6hcDC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=VhKyTsrf; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="VhKyTsrf"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:1da4:3c70:f102:9ea:5df7])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3B7B763C;
	Fri, 15 May 2026 03:17:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778807833;
	bh=SBhtUk5LxStn9uFGuOs1Bm4gzHoDQePMv+PnFCWJ4RY=;
	h=From:Subject:Date:To:Cc:From;
	b=VhKyTsrfHKzmNBpoTCdjkj3IibBSzGlxDe1e0xi4dkzIvXupaijM7Gwi6jAakP939
	 uW4QXzdZRVTYM7Y0zoDByDH+sCEVx3iqAqu5l6W8F6SQtFyCCdZ5n3gzAFQnnGBZZI
	 sfyMWu4jKp0Qb+3WonLWazOqNITHUAtJdAMDTgmg=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [PATCH v2 0/4] arm64: dts: ti: BeagleY-AI camera overlays
Date: Fri, 15 May 2026 06:46:35 +0530
Message-Id: <20260515-beagley-cameras-v2-0-f6acb66c9995@ideasonboard.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNyw6DIBBFf8XMujSAQh+r/kfjYoRRJ6lioCE1x
 n8vdd/lOck9d4NEkSnBvdogUubEYS6gTxW4EeeBBPvCoKW20qhGdITDi1bhcKKISWjlyOLtipd
 eQVktkXr+HMVnW3jk9A5xPQ6y+tn/rayEFMbVRsrOYFPbB3vCFOYuYPRnFyZo933/AhO0Sti1A
 AAA
X-Change-ID: 20260514-beagley-cameras-21ce6a98a7f1
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Robert Nelson <robertcnelson@gmail.com>, Andrew Davis <afd@ti.com>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1402;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=SBhtUk5LxStn9uFGuOs1Bm4gzHoDQePMv+PnFCWJ4RY=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqBnQCZXKMi58q2DFuN5EE8FDoGtu4TVgM2YT1G
 0KYMxGFKxmJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCagZ0AgAKCRBD3pH5JJpx
 RewbD/9wSG+iuYpObc8Nycwy0qPw3c7N8yQimTzRFb50QUXJl/eS+JKg2hgpfNU87w9gxiG4pDP
 dPGKCdvF3FGXAozPpzhdofC1kPg4wQgd71yeA1gnrP4n99wKv05PgS7lHjBQJBGx9addBzQVVvO
 /bNkxgXUEZ0x4lYAq+CBXi4WLXzsbsQJsT1DGIZBJST2qXF4+u4v/dB0PV1E0YZQR1ki9MFPLlt
 dqhi5L3hmp67m56EcMqHkoxwVODj54DktoNQ/qj4QiTO2BYS+aqFHmFnG9Pa7/9TRV4cHn+CrCy
 3JLpUE+BJkgXMWxtsqc6aU35AHSDuCqE7St/DoQFDlkFeISSNA9thrUxRhvQJsxPswXjX+/96dZ
 1GPbaUV//LHXnjx4VVqps8QFGx4lsXW40HswW79LBQIiunIgwvYY3wgHqHwPxQ2M8opKtcjUUvb
 G/hmYBGHJdXxZbFdu+fdf2Uh09eCmN9LCjG+kVvxCo9qfKAGQTp8IN/SbqEPxHUjH3L41g4ClAd
 xraFseC8/NO2MHnng2ff/SzJkVHv6nOThVLLEwShVrQtfk8e0kyEQxGoike/TKxdNZ0OdS9EUUp
 8PQmlqqBFsKKeRFOEZ7+pdK9k5V900y06/acMZ+PTLrmeHagt61StmsfLEL39cKkqWazA1SuU3s
 j6J60IOrEohur3w==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

This series adds support for using RPi V2 camera module through the
22-pin CSI connectors present on BeagleY-AI.

The first two patches add support for I2C-2 (used by CSI0) and setup the
DSI0/CSI1 mux (used by CSI1) in the board devicetree.

Next two patches add two DT overlays, for CSI0 and CSI1 respectively.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Changes in v2:
- Use PIN_OUTPUT for the camera reset GPIO pins (I forgot to change the
  sysconfig generated line).
- Link to v1: https://lore.kernel.org/r/20260514-beagley-cameras-v1-0-5c3500b5a436@ideasonboard.com

---
Jai Luthra (4):
      arm64: dts: ti: k3-am67a-beagley-ai: Add I2C2 pinctrl
      arm64: dts: ti: k3-am67a-beagley-ai: Add DSI0/CSI1 mux
      arm64: dts: ti: k3-am67a-beagley-ai: Add overlay for IMX219 on CSI0
      arm64: dts: ti: k3-am67a-beagley-ai: Add overlay for IMX219 on CSI1

 arch/arm64/boot/dts/ti/Makefile                    |   8 ++
 .../dts/ti/k3-am67a-beagley-ai-csi0-imx219.dtso    | 121 +++++++++++++++++++++
 .../dts/ti/k3-am67a-beagley-ai-csi1-imx219.dtso    | 121 +++++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts     |  27 +++++
 4 files changed, 277 insertions(+)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260514-beagley-cameras-21ce6a98a7f1

Best regards,
-- 
Jai Luthra <jai.luthra@ideasonboard.com>

