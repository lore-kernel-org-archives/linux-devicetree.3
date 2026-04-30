Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A722340F8E4
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 12:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777553633; cv=none; b=GMPCjf2h1BaXc46z7HK1OsDnGPeol0yOB58wcNU7kU4421XwG6nnc0yVRjqV6vdori1QGju4GvLcqM9YnK3IdM97Ok4o02tOeh9HPiDuGmnIVvhbjUl9HTJtgPQNmKmCz/0UfuL/HYDdp6vbfpJIAkPo+TibkUt3YUo4HOe8Gbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777553633; c=relaxed/simple;
	bh=G0mT1x0tDvGdPeonFeTbaQx9eBvyLg9Be12Sllr9F0U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f0GkZUcFYBiw3IbBXiweGIpGCfM6VV0NCFAqqJDr2Al91XIEjun2l5997lduo6bDG4mWS5SUGZHULyAQ6kMDKYLwbYqhdT+vlc6JwGWRkgnPWDB3ROofokZebX4yEz5CO1vhbmvWBwNP4THaOPYVuQtyDDXOaTDw1rvmaKIX0xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CodCqSrD; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CodCqSrD"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48a563e4ef7so8808505e9.0
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 05:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777553628; x=1778158428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q5/c8Ct83SJKpAdR0Bd4iD5LrQUgDQEBElFL+L+8Gt0=;
        b=CodCqSrDDCVmpEjssQS+NSU+PZgYJNjV9GkwOnHB1z7HlUKh9nn/rCDxfrfvY/OKD7
         qTxOmTRSGNnAjlopZqrtHR2/sYpGP1BWlag+p1FFaFRNkTtkC5bG2OOOXo+ipiQItKMG
         O6pTPzNbfFTwjBvNI67K3p28WfYct63ZCKrZ/vdl6pYXRbGmMrZ3XM1yU/A5EgiOnYWq
         FzmdQ3r4/oXW1950jzTnHiWAfI3mC9yeLT3cCWneCAbk59HEAroOOIJ8BoZ9pEnScDUZ
         PZ4mhGEXKTjWfuu1IyQtvyW8a5W9oHXU1mACwOeIBZxkBVWjAl1io63zSQmpQwKlsPTB
         1gSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777553628; x=1778158428;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q5/c8Ct83SJKpAdR0Bd4iD5LrQUgDQEBElFL+L+8Gt0=;
        b=sG1QSVDwjZ1e6FYGGRMJlHqqy+IYOpDq83wg/iB2K2QEZ8ECkWuMNVu/z7GvK0OzNc
         OW1eSoI2X5GOrY7UtBSzvwGnTGitL7ZuVcUhw+zmfahv52+o/iruePdETjEVzGHsPniz
         ytCGtpSaPkAO+xk8kr9Qr6QENG4XEQvCJiOLtkI7KqBBAQWBY28Q5b5Q+WMQxM4XNl5v
         KrXUyHuDE8fONox5EoZxrWKvb0yOP4G3q768JTWp6y0j/9icdBv48uxU9hZfDluUzBdA
         WbEapbkFmAFi6scozmR49i9ZPOWHowDeKX/2+urHhvh8yVSWZNW6L70q2nz8xFHBFsIH
         peqQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Q/vY4vmXsguzefQAw8cAftAlK0fPgDLOLKr7gUFG6JNf3DqGgjjbJKj5RvZ3VyBWUejT50VuYfUqu@vger.kernel.org
X-Gm-Message-State: AOJu0YwIPv50B94hB3Ew+uX9KgBHx/6sEOze5XZyL1xvqH8T3t4sYFOn
	KLoPzUxtir43RxLmj0J4HfhNtJOdAhUmCm4UXfS7j+eOSSJ2L1TD8AOO
X-Gm-Gg: AeBDievTC77Zf1Pxd6VwvGYIFmuQCSJCgkthOOP/ZQkxw44/PPm/WLWhllN+e1DEvjh
	3uVjUW6IxRgd4vI9SSwu0bSaVmiXdqYiSgjq2gxVia593n959csPpCPt9Aqdu14AidXy1ZODGDa
	bxSmtMclzgolmGV9JH86+rCZ4Ucd/u1S+BGWsJ/9DzxQDJaed56ALiHgEH4Lt2JhN7FMgE5z0X1
	+C14NENtf3T1LXGoKuViavMqrD+lJoV15EuWtXri6J0AQB60nqH/18O89qo5gg989yZ45pfnS97
	ODdJvns/FjLVFuH7jneXy0Ya4TfdFQnyKnucZ3MvhUtZWjvJuJa3CEhkt3vK0BNVChXrZHBW564
	Qv7Tix+RsUUpfrprqH314lcOjHnb/v2cYAWzbiRqIYI/BIE82tJyFePscK7a8JqzzJEfvv54V3w
	M1XFHr/2kz1+6/eMNo/MAh7zBdK5wG3AsTmIva5WD1TYW+LJkApw==
X-Received: by 2002:a05:600c:4e05:b0:486:fbd1:9dc0 with SMTP id 5b1f17b1804b1-48a84473724mr48644605e9.22.1777553627693;
        Thu, 30 Apr 2026 05:53:47 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a758:8a01:342:901:e785:f7d2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c3057ecsm40995825e9.20.2026.04.30.05.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 05:53:47 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 0/6] Add more support to Renesas RZ/G3L SMARC EVK
Date: Thu, 30 Apr 2026 13:53:04 +0100
Message-ID: <20260430125342.439755-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

This patch series extends the RZ/G3L SMARC EVK platform to add OPP
table, IA55 and pin control support for Ethernet and SCIF0.

Patch 1 adds an OPP table for the RZ/G3L SoC, defining six operating
points ranging from 37.5 MHz to 1.2 GHz, and links each of the four
CA55 CPU cores to the OPP table along with their respective clocks.

Patch 2 adds the Interrupt Control Unit node to the RZ/G3L SoC DTSI,
wiring up the NMI, IRQ, TINT, and other interrupt sources to the GIC.

Patch 3 completes the pin controller node by adding the compatible
string, GPIO ranges, interrupt controller properties, clock, resets,
and the clone channel reference, and sets the ICU as the
interrupt-parent of the pin controller.

Patch 4 adds SCIF0 pin control configuration to the RZ/G3L SMARC board
DTS.

Patch 5 adds pin control configuration for the ETH0 Gigabit Ethernet
interface on the RZ/G3L SMARC SoM, including RGMII pin muxing and
hotplug interrupt support via the ICU.

Patch 6 enables the second Gigabit Ethernet interface (GBETH1/ETH1) on
the RZ/G3L SMARC SoM, adding its pin control configuration and PHY
settings mirroring those of ETH0.

This patch series depends upon [1], which has no further dependencies as
all the prerequisite patches have been accepted.

v2->v3:
 * Split from [2].
 * Added ICU node and set ICU as the interrupt-parent of the pin
   controller.
 * Moved ETH0 pin control support to a separate patch.
 * Dropped ethernet-phy-ieee802.3-c22 from mdio1 device node.
 * Fixed typo txdv-skew-psec -> txen-skew-psec.
 * Added hotplug support for ethernet.
 * Renamed SCIF_{RXD,TXD} -> SCIF0_{RXD,TXD} pins.
 * Added patch for OPP table support for RZ/G3L SoC
v1->v2:
  * Split DTSI patches from bindings
  * Fix typo maxItems->minItems in bindings
  * Collected the tag

[1] https://lore.kernel.org/all/20260326111953.31024-1-biju.das.jz@bp.renesas.com/
[2] https://lore.kernel.org/all/20260203131048.421708-1-biju.das.jz@bp.renesas.com/

Biju Das (6):
  arm64: dts: renesas: r9a08g046: Add OPP table
  arm64: dts: renesas: r9a08g046: Add ICU node
  arm64: dts: renesas: r9a08g046: Add pincontrol node
  arm64: dts: renesas: r9a08g046l48-smarc: Add SCIF0 pincontrol
  arm64: dts: renesas: rzg3l-smarc-som: Add pinctrl configuration for
    ETH0
  arm64: dts: renesas: rzg3l-smarc-som: Enable eth1 (GBETH1) interface

 arch/arm64/boot/dts/renesas/r9a08g046.dtsi    | 147 +++++++++++++++++-
 .../boot/dts/renesas/r9a08g046l48-smarc.dts   |  13 ++
 .../boot/dts/renesas/rzg3l-smarc-som.dtsi     |  93 +++++++++++
 3 files changed, 252 insertions(+), 1 deletion(-)

-- 
2.43.0

