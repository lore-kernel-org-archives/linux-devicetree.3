Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2088C2BE7AB;
	Wed, 29 Apr 2026 03:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777434511; cv=none; b=gJLw36Zosly+jF80Samhf/1/+bxSgBQvtTQDci39xJ+q3ENWIn2MCojFBL1iTwxnGwBs4MCRdr77ZS7H15px/Ow3o0jO2BakuBu3FOMyMoVoD2SPxb7qNOHxkw9Xwv2nNIFk54m7KVjGd4fBo9Wtsn80jkSpNiNovLy3bVKJUFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777434511; c=relaxed/simple;
	bh=3jIVWGFwvlQbTsS5Iqod9cXpXkSd3pzV5v4RF8KFV44=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TYR3OIvRU4s3v5WDbXlZzHcWxCgh3y70hQLcKuNJWLBEHDxZprgEhd/fbqkmqiILvIC7DwL+pOk3C0F+TB1gC4WYFPDD3EZ4UMlI9CVqCwVOIlBhU9FWJ+ARgtKm4uAFX2mjfdrzqqcbP+vBFWwgc80PEsDkV7cYizMIa6sZHj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wHvuV-000000006Vk-34Wj;
	Wed, 29 Apr 2026 03:48:27 +0000
Date: Wed, 29 Apr 2026 04:48:23 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] dt-bindings: clean up tab and trailing whitespace from
 examples
Message-ID: <cover.1777434096.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The earlier RFC of an automated DTS example style checker [1] is being
respun. Its v2 will ship a default 'relaxed' rule set that is intended
to produce zero output on the current tree, so it can be wired into
make dt_binding_check without a tail of warnings.

These two patches fix the only existing violations of the relaxed
rules: a single trailing whitespace and 15 files with literal tabs in
their DTS examples. With these applied, the v2 checker passes treewide
in default mode.

Posting separately so the cleanup can land independently of the tool.

[1] https://lore.kernel.org/all/cover.1776700167.git.daniel@makrotopia.org/

Daniel Golle (2):
  dt-bindings: misc: fsl,qoriq-mc: drop trailing whitespace
  dt-bindings: drop tab characters from DTS examples

 .../bindings/i2c/opencores,i2c-ocores.yaml    |  8 ++---
 .../bindings/iio/adc/st,spear600-adc.yaml     |  2 +-
 .../devicetree/bindings/input/imx-keypad.yaml | 32 +++++++++----------
 .../bindings/input/microchip,cap11xx.yaml     | 12 +++----
 .../input/touchscreen/ti,ads7843.yaml         |  4 +--
 .../devicetree/bindings/leds/leds-lp55xx.yaml |  2 +-
 .../media/mediatek,vcodec-encoder.yaml        |  2 +-
 .../media/mediatek,vcodec-subdev-decoder.yaml |  2 +-
 .../memory-controllers/nvidia,tegra20-mc.yaml |  4 +--
 .../samsung,exynos5422-dmc.yaml               |  2 +-
 .../bindings/misc/fsl,qoriq-mc.yaml           |  2 +-
 .../bindings/pci/mediatek-pcie-mt7623.yaml    |  4 +--
 .../bindings/pci/samsung,exynos-pcie.yaml     |  2 +-
 .../bindings/sound/davinci-mcasp-audio.yaml   |  4 +--
 .../bindings/sound/simple-card.yaml           |  6 ++--
 .../devicetree/bindings/usb/ti,j721e-usb.yaml |  8 ++---
 16 files changed, 48 insertions(+), 48 deletions(-)

-- 
2.54.0
