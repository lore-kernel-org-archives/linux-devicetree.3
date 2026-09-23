Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38F657C706
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 20:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790196467; cv=none; b=tAJ2y6iJGX6BjLoD/rMdVoNCF3mvL4rKKPxkMAzzTSXrhXhh6Pts0qEPai27U6Pkzov2mcEJj466yOarEHgTmgxZNx2h+yWOSVVSZPxvPwraIvPAtdukDeqP3mZ6Z2YxX5Ehob9UIh9UyTrA/zHRnq0k98shbO9L8eNFbTmi8lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790196467; c=relaxed/simple;
	bh=TdnLH5DwhqtG6C7m0a7hVRyfyRfRxyaegwP3kzUxBVU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OCpLODxZbsuH2FFIq3yxmj7Zp0xPzH/ebwSVkD0Z8tm+jAK1jsEMFyadS/toSUutzSMlKDBMmObIez58MTGZoICN626CYMxO+mMgeQpLhl6IHRkCc7LOO6zaS+mGeB1c83hWGd2gMXVstyKo1sxEzrk8c7S2wL2CsYDKkPghDCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=NQSTa6TF; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="NQSTa6TF"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cc9f581c4so5092525e9.0
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 13:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790196463; x=1790801263; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mslKy16LyiWKXxpmPMj1rH6QX6l6C4PGFHhAsJKIKZc=;
        b=NQSTa6TF5AiUkn+Z6Cr8OOYLyCzicJjRPccXkVFbJ/xY4hy4QQfOz3hx1E7r5WJprl
         7esdrRrjxsn7aDGzA6SMg9BGL6t6ify50jc3JbTmAceUDHv1oCcZls8l+GPPDNDUf3zb
         j8cwIrjukQ8J1J9UCJQZNNHT9ArJQOsTG8SySE5EwSv9kkFfXAEQNBunWs6A855Jqs40
         Fc2F1WZiT7AcmA6ZZ8tzFin9zr9frRGmlmEJMexpzbbf0Tfwl9ObpMvhbE3cIdNXrSav
         YnMGcdtHcF9Fq/lXiYPrqfHtL+OCjVIMMacFHZiuobcXkQz+pGi/gMTgURbCv3epqajx
         o8xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790196463; x=1790801263;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mslKy16LyiWKXxpmPMj1rH6QX6l6C4PGFHhAsJKIKZc=;
        b=X4kapkjoMOFRi2dxUe4qhY9hhLrjgS8SbrwPHFXhDrkA9YID+Q7u6LxSO/nUODGJLm
         SiRCySycrAXRIupFTAfv6gpKfFyIHSKvDmt5tc+ZeGjAZ4cDLhirD7643mJXFY6/OxLS
         SoyZmwbdlRRNSFnzCnMFa7NtACdWEShNYP7LEP4i6f7rfSW948PmDSO1X6ZutK7F4mYJ
         jjHnVtFscd+j7ovNpOqSJ3EM6NfSM9lM1mcHyT05dUNXiom6WxoNdz/RTGfmN44fQrnz
         3KV0qG/7eSOfjUfwyc8vCdoT4H1+sX/4Y2892LbcenJ3JXWig5eq95urkknDXoL4qlcF
         MhZg==
X-Forwarded-Encrypted: i=1; AKwUvByy1nnHywv94iSpqD2c5FZSHNjJuXYzff6bVK2NAoWahoDWW3ucjCYxBqE8xhu3aXs65ZZrZQj2wNx4@vger.kernel.org
X-Gm-Message-State: AFuF++kEVZIssyfe41hYpa2j8as3dh3hgNKufk7fsACUyngRNwKTvrc8
	1nyU5OP2PrSHdyH/DmyRddSToHqd9EqB59bSMyFjQoiUXMXVf6PoIxKQynQ8beKbhB4=
X-Gm-Gg: AYBFou0MiW58fd9YyL92dTIrP4N4tkwJtbnb8rRT8LEgYu0ZQ4V/k7cBvenRQwCtnuE
	xdxVxgtRlxcsTifi4Lakr0SBoMArQDB3i9HGsZdUYja1e2LmEzvwt2T6eKPh1nHdrS3xANAaLLN
	J1bvp6qXOnzVAM3Z+201ohcawXzy8w1rVuW+hjjvnKCQecUKoB5UNyp9hTl00pH3F2ItMPqbxvz
	QjkQcHeJbvCa3Vav/wQ62mO1PVUz8x7t8/+s91GvsB4yChMUtdAihHi4Li/2K7mxDlRZBAhh6Vn
	5YUzWLN4ansitRU+9xRWpGnh+CqW6p6PnmLQn53+WMfHPyvZiMwY6pKf2V3Bm3m2QIRS9zRmCvt
	jm2P8qwbBx7K0lktKWy2okceUXjKEk6lFh29Kjcgl8brdPS5LTtWYhlOl2FbvmOFqSnriPJBwZf
	9QVA4WYy0dPx0l3pBoNuBPs+q+I3jeLQAtUSceeog5Oo7qW1+8Z8v02NRqL1qoqVxVKmYK9Tllq
	IYL89tSWmRKHIX996S1Nb8g6rVRhwv1ijxbdI4=
X-Received: by 2002:a05:600c:3b01:b0:49f:ce79:7a8d with SMTP id 5b1f17b1804b1-49fe670b3e3mr6025275e9.17.1790196462747;
        Wed, 23 Sep 2026 13:47:42 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm10385455e9.13.2026.09.23.13.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 13:47:42 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH net-next v3 0/5] net: stmmac: Add support for Allwinner
 A733 GMAC210
Date: Wed, 23 Sep 2026 22:47:30 +0200
Message-Id: <20260923-allwinner-a733-gmac-support-v3-0-15735155a789@baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43OwQ7CIAwG4FcxnK2Bok49+R7GA7Buw0y2AMMZs
 3cX58HEg/H4p+3398ECeUuBHRYP5inZYDuXg1wumGmUqwlsmTNDjlteSAGqbW/WOfKgCimhvio
 DYej7zkcQW6lLEtyIDbIs9J4qO876iTmK4GiM7PyehEFfyMQX/tptbIidv8+PJDFf/NWZBHAou
 doVEnWldnjU6t5a7WlluutclvDD7QX/zWHm1tVaCdogNyi/uGmanqgCvJY0AQAA
X-Change-ID: 20260731-allwinner-a733-gmac-support-163bde10c152
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 Andre Przywara <andre.przywara@arm.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3884; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=TdnLH5DwhqtG6C7m0a7hVRyfyRfRxyaegwP3kzUxBVU=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlbrN48fSmf7CLPEqlgcOnr/5A/UQJdgZVMKk6nBOyuF
 Uwpk+/oKGVhEONikBVTZKnhrhZ/J6n1ZdZ0ndswc1iZQIYwcHEKwEQkTzAyXOTkLmJ1DtOOvbUv
 /Lr3O7mNz1P8zxoc38NzMyLJbIJmOSPDrosPAxyOvBaYnrPVbdbh22Wvs3y3XCh/aX/+t662b0o
 CLwA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

The A733 GMAC210 is a DesignWare MAC 5.20 with an Allwinner glue close to
the A523 GMAC200 already supported by dwmac-sun55i, but with a few
significant differences:

 * The glue configuration registers are a dedicated MMIO region of the
   controller instead of a syscon register.
 * That region is in the AHB reset domain, so the AHB reset must be
   released before the configuration is written. The configuration
   is sampled by the dwmac when the other reset is deasserted.
 * The DMA channels have their own interrupt lines.
 * A PTP reference clock and an AHB reset are needed.
 * The controllers do not require a power domain (AFAIK).
 * The TX clock delay value is 5 bits wide instead of 3, split over 2
   register fields, and both TX and RX delays use a 180ps step.

The DT changes for the A733 and the Cubie A7A board are not part of this
series and will be sent separately through the sunxi tree.

Tested on a Cubie A7A, RGMII with a MAXIO external PHY on GMAC0.

Problems found while testing (none impacting this driver directly):
 * Unstable EEE/LPI: If the device stays in LPI mode long enough, the
   link sometimes (but not always) goes down, coming back up when the
   device exits LPI mode. This is apparently due to the PHY; the vendor
   driver disables this feature. The solution is to use genphy with the
   eee-broken-* DT properties or wait for the upcoming mainline driver:
   https://lore.kernel.org/all/MN0PR19MB609154F210DF84DCB29D3696ACC62@MN0PR19MB6091.namprd19.prod.outlook.com
 * Tx-delay: The vendor kernel ships with a Tx delay of 2.16ns. It may seem
   to work at first but breaks under heavy load. The vendor kernel is
   configured for an external RGMII clock, which cannot work on the A7A:
   the 125MHz input and 25MHz reference output are not wired to the PHY.
   It was most likely not tested on this board. A 1.62ns Tx delay works
   well.

DT example is available here (gated on CCU and pinctrl mainline support
currently):
https://github.com/jbrun3t/linux/commit/aa6f3a5ce4cd6e09ff9be1828915bfe8e87c57df

Maxime, I've tried adding a new init callback as you suggested but it
did not work out. The config needs to be written before the 'stmmaceth'
reset is deasserted to be properly sampled, but it can only be written
once the 'ahb' reset is deasserted. A new callback would not help.
However, tweaking the stmmac platform data as I did in v2 is not
necessary since the reset is shared. I've corrected that.

Changes in v3:
- Split the driver changes into preparatory patches and the A733 addition
- Use a 180ps TX and RX delay step on the A733, allowing up to 5580ps
- Release the shared AHB reset before writing the glue registers instead of
  taking over the stmmaceth reset from the stmmac core
- Link to v2: https://patch.msgid.link/20260910-allwinner-a733-gmac-support-v2-0-4f4a1e520c23@baylibre.com

Changes in v2:
- No driver change since RFC, just more tests.
- Rebase on net-next/main - proper prefix added
- Link to v1: https://patch.msgid.link/20260731-allwinner-a733-gmac-support-v1-0-d0a8732bfa82@baylibre.com

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
Jerome Brunet (5):
      dt-bindings: net: sun8i-emac: Add A733 GMAC210 compatible
      net: stmmac: sun55i: Add per-compatible match data
      net: stmmac: sun55i: Make the delay step configurable
      net: stmmac: sun55i: Support TX delay extension bits
      net: stmmac: sun55i: Add support for Allwinner A733 GMAC210

 .../bindings/net/allwinner,sun8i-a83t-emac.yaml    | 142 ++++++++++++++--
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c | 184 +++++++++++++++++----
 2 files changed, 276 insertions(+), 50 deletions(-)
---
base-commit: 944ae66642b726bd6b25ae71b1e9ff88a0e0bdb0
change-id: 20260731-allwinner-a733-gmac-support-163bde10c152

Best regards,
--  
Jerome

