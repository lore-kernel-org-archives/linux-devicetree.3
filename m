Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795199586;
	b=rszrpclk8PqYQ4ULjBb5ETxc4aG4OG8sp1QpSJCm1nrKaB68YG02/f7sCV8Jq5L81QaR
	 Qz0lwTGNrqmW8WsS7EZfFeNCj4BdnXXyft3ilFLCOmbtFs9TnnwPlVUM+dNDQCakuUKOx
	 HYLvqlmErbDK98IqVySshynqpeqLpqSoeZxs7CqcmZn4xHGcQVfZaPU+JYfnVnDSqnr2X
	 YtG9Rk6ptVuYKO4Of/tH4MidBfnmt6lTSs31RIh+BgqgVx48lULAvqFpi0g9fhco04vEV
	 57CnUBxSDS/tTj/j23C+dCCKsGNfB8Tyt8RXUOUqKS5KhvjBwhr3V0oLIIP0VBp+IIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795199586;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GI03jlm6wghRp7o/prx2Jk3c/vuwKISJcgA3BS1S1P8=;
	b=JxK4MoVSPxqm3dlcWZzN+vU7HMmlmo6/z3cfEANsC3DkU5jDLTY3tiEsB1KQ7nULr4Cf
	 CTMw09HOXKbWhRm1e57vFk+2V73dHWy1NPfwJ9ik7aTkRjSyJ+QyEGKjzjUj7edTgFFCq
	 qE5VUNr+XOfPXCaP6KJhtUcSVFz1/HhHHDDIrfbvkc+yNsz5/m6xzjmprrt0AWuGaTpmy
	 K5WCuhPaPMOUxoKbJV+od1tQKqiNKOIpPRg/PgzKU5qi5YjxzKm0BfL9HDsJ62ji3CFrH
	 G2jR/QoqKGdrlvVZBjkX2Nk8vchjD8b3Xc0C3JWGgDEsb042w2xYovm4ZQnLDnMkuiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JUOFNvqx;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F3E60A2605
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 18:33:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81F3E60A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JUOFNvqx
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-49d64a88222so1531666f8f.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 10:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795199585; x=1795804385; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GI03jlm6wghRp7o/prx2Jk3c/vuwKISJcgA3BS1S1P8=;
        b=JUOFNvqxr2F9hFrMFKFGqDX0kyqm4QqIooPOIBVGXhHRxyYspXyRlj6Ac/9gTLQUNE
         Mvr8zszCTHQ4Zks9zsL3JvVxMrNpsRgpDiI3LDZelsCsKhUigBCcl06YtbH9rh9OODq1
         hd0LCI8WtZJTKyaeADRa6EyhG3gASKCyxO5V0j3WKgGprLeriYVOLD5ew2WITO84rUhP
         TadgH7tIbMvbXqz7Vd203I15iRC+r2eQpb6fcVqt1Yx6VJFCKukPmoJ/6onvnZoHl0dS
         p8bAOs+DnWz/XllCSOe2FPkPN3/+9t2k0ERu7IqO0QTLOuUl6/VqaJZWP/yZWsiTGb8b
         tvSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795199585; x=1795804385;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GI03jlm6wghRp7o/prx2Jk3c/vuwKISJcgA3BS1S1P8=;
        b=oinZV5l7opltbj3BNkw3vzcnRYzHkCjibh2tUEuFOlhhulXuqzL555rucv7suNcqAE
         Tjt1ZTFpbx2t1hur6ZP65rmzsTZxlLPhTwMC+ETL0ztCSj2a4EO3If4eTdAAX9/UvV1B
         2FqoSYfdec5lxmhD7bBtBNoSz6av8TaWu8/yaQyiwR6z1rWwE5W5IJGjL2BScFJZcFcr
         l10ZWxovTCQAiGFOsQddHh5gIo/wb5fRZudZsl7hq646LHCk51Y3pKu1zZ3YFi7r0AbL
         NcmAu4hT2U6zs5me8A88Vqc0XmrhhD3XVVJsPQaaXyF+AUvXTwJaP9P0G8kUrfnEHAg8
         9o0Q==
X-Forwarded-Encrypted: i=1; AL+hErEA5Dbk0HXrzlVRR96rQDp4ke56SEo9TRX+0QD+UHHmLpieBEEq8aJZo94LmOyFnoigXrO+C6i4NUMN@vger.kernel.org
X-Gm-Message-State: APuU4Z+8cdaGSu8aMB4AgZebgWC6aTiBO3j69n0gn0NGKoqVgT5dKQMA
	RcibQvHD411g1GzuPt0wU/ZlTJjDHJpGIcW23Kh+sjCOqPBBwH6NXH2j
X-Gm-Gg: AYBFou2Lz5VTuhyw+pMOAFKQRzqzTVLY16EAVvie1yCYxUgN8de2pnYztXPmswIZZaX
	t8GVIaaQh3fm4IFdXs2GW9f9FXSQoH1ZYe9ypl8esvrDNklrKyISjlpJrTGXmDvk3dP3RSgcNmb
	PhWwya3brWLcJq9Ne6kdYSX4g0YMs5T9bXEE+KoHLll+wu+Bq8tuJfs0d5A23m5J2RWFcGhQnte
	dl4uYrck6/vBj7F4sDI91yOVhBZj5eAbS4HqR49vLxoqrqtdvd6Yev+HqSvpTBwhl3id22i8Wei
	ypehTJO9HCVhIrN7GBMyYAPN1Xrvwzy6pvZo/mr28B6gMOZeo5QbJeOmGbo+QP3lK+HHmpoNuCV
	m82xq1sdq+ErK2ScVaYmNO/3FyZtQFzjGld/NVpIa3QtZ/xfIgqDkBsWV6LqThrU7uGLen9D3qM
	kiiJbkcgBswWgFFrYki5wPr13ei4i4L1elFRzkI9j9M2grsigzyhtyq27K3JjEofmH2nkpompbG
	OLcsOwAIihY43SKynv3NAGk0xHuvRLIcXDg6aQqiubmQAhhw6jQjc45bMeEacqQH2cjS+q1lobX
	AhP+PmZYpe1VtRkatwJh70fr7X353FXbfo34APuMFumaywpeLK4A5Th/fMGEWhiMMgJ4KUk8pxR
	P4iPy44MbQqxAM/ko6uAFatFdh/jYUz/Hk3TejfzjI1y3Rqk=
X-Received: by 2002:a7b:c4d2:0:b0:4a1:d291:d863 with SMTP id 5b1f17b1804b1-4bb861394f1mr97174585e9.4.1795199584794;
        Fri, 20 Nov 2026 10:33:04 -0800 (PST)
Received: from GLaDOS.station ([193.207.36.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb98b4dsm7467718f8f.53.2026.11.20.10.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 10:33:03 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Mathieu Othacehe <othacehe@gnu.org>
Subject: [PATCH v4 0/3] arm64: dts: freescale: imx93-var: Add Cortex-M33 configurations
Date: Fri, 20 Nov 2026 19:32:27 +0100
Message-ID: <cover.1795197853.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
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

This series adds Cortex-M33 overlays and combined DTBs for DART-MX93 on
Sonata and VAR-SOM-MX93 on Symphony.

The first patch corrects the Symphony resource table address. The second
moves the M33 reserved memory and remoteproc configuration into a common
include shared by both modules. The third adds the M33 overlays and
combined DTBs, and moves the common include from the module DTSI files to
the overlays. M33 memory is then reserved and remoteproc and MU1 are
enabled only in the M33 variants. The overlays also reserve the firmware's
peripherals and disable dependent devices.

Changes in v4:
- Add a separate fix for the Symphony resource table address, changing
  it from 0x2021f000 to 0x2021e000 to match the firmware.
- Move all M33 reserved memory from both carrier DTS files into the
  common include, using generic memory@ node names.
- Move memory-region-names into the common configuration extraction
  patch and include the common file from both module DTSI files.
- Let the overlays provide the M33 memory reservations as well as the
  remoteproc configuration by removing both module-level includes.

Changes in v3:
- Split the common configuration extraction and the M33 overlays into two
  patches
- Use "reserved" for peripherals assigned to the M33 firmware; keep
  "disabled" for dependent devices.

Changes in v2:
- Enable cm33 and MU1 only through the M33 overlay on DART-MX93.

Patch 2 uses the following binding and driver commits, already in
linux-next:

- ebb21cc5d1c0 ("dt-bindings: remoteproc: imx_rproc: Document
  memory-region-names to avoid implicit ABI")
- 8396089f91fa ("remoteproc: imx_rpoc: Use memory-region-names to avoid
  implicit ABI")

Stefano Radaelli (3):
  arm64: dts: freescale: imx93-var-som: Fix resource table address
  arm64: dts: freescale: imx93-var: Extract common Cortex-M33
    configuration
  arm64: dts: freescale: imx93-var: Add Cortex-M33 configurations

 arch/arm64/boot/dts/freescale/Makefile        |  9 +++
 .../dts/freescale/imx93-var-common-m33.dtsi   | 65 +++++++++++++++++++
 .../freescale/imx93-var-dart-sonata-m33.dtso  | 55 ++++++++++++++++
 .../dts/freescale/imx93-var-dart-sonata.dts   | 33 +---------
 .../boot/dts/freescale/imx93-var-dart.dtsi    | 14 ----
 .../freescale/imx93-var-som-symphony-m33.dtso | 50 ++++++++++++++
 .../dts/freescale/imx93-var-som-symphony.dts  | 31 ---------
 7 files changed, 180 insertions(+), 77 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-var-common-m33.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-var-dart-sonata-m33.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-var-som-symphony-m33.dtso


base-commit: 33adc96ac217d6e95b7c44ac383c19ca4ae2ff52
-- 
2.47.3

