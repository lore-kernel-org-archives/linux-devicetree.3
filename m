Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65FFE3749E8;
	Mon,  3 Aug 2026 10:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785751610; cv=none; b=FqD6xcPmm8yC1kPfY+cb255CvCIAnK9hQBb1Q7Yv1f7nYojf27vBqJ3sA1fX8UFZuBIIYluB9PbExVSpUKghCJYd/fuNcUJcZPJqBnAz8oV9HdpFTESMa0sfpOOdD6fyxXlNToe6TEnjVzwxPxM4KwBmfz54Lw3MaQLLP1Qn6yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785751610; c=relaxed/simple;
	bh=Z6bjOAc+VesJ09Rh3jKGmkudCEj95FEUNIdMg+ymMnM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=J6JREi8TdgauKi5xTc515TZ967Wgt1nJ+pUYy2BF4H2vKbwSkiQJRBTeAnuwZ/7kOhkd5IOpJCiva+InbLgp9d4DHnJ0RspbVFkdk99yz5GhO6TigJmfVNffV1a5NXG2xpJ8Wo3dHfW38mOBof2yahqmgSuhb4GOkkLJB+Z45zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=EBzd9YJf; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Z1/Zq1i5; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="EBzd9YJf";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Z1/Zq1i5"
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785751607;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2fN6ntjrESShwh7QN9tna8NHQ9oGxG+wl6dsfHUeOEw=;
	b=EBzd9YJfRxnyN5mEdCw4Jzyo80PuCND9p3mD920nis8D24c3SiHNKCvi0tDm4JdpkXSMoD
	8Gq/oFid5uOT1vZ2Pnzaby1F9cScFx1stvMaOlhS/wPSAG+ZoqReE3vsvdxaRH0lbUyvGh
	R+5Tlne52F7Kpe0zPhY0+7AJHXZlJyBMr5ifkYyAiq1gyvp/pIRWPp08PPGWlWX4n82UJU
	HF6O6skXNOe0mEhbyiWPgKiU+VqSyW+pyXHqPcNhZT6j30rkczJii4eZbkV0YEgxHmOVcd
	gzzcxptg7Ovo4jLuysQfylmMMKHa55reDYHpvSr6tMRLVDdWJSPbjQXpzgxjTQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785751607;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2fN6ntjrESShwh7QN9tna8NHQ9oGxG+wl6dsfHUeOEw=;
	b=Z1/Zq1i5EICbdDU11F5KL/SR2alYyp1rZZjwvrvhSHTlSbeSPhtJLvsYoIk7Ppkr+FjT/3
	5BndHVLKJQ8fT2CA==
Subject: [PATCH 0/2] arm64: dts: broadcom: bcm2712-d-rpi-5-b: add
 compatible
Date: Mon, 03 Aug 2026 12:06:40 +0200
Message-Id: <20260803-bcm2712-d-stepping-compatible-v1-0-401934357a44@linutronix.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADBocGoC/yXMSwrCMBAA0KuUWTuQxGjBq4iLfKZ1xKYhk4pQe
 ndTu3ybt4JQYRK4dSsU+rDwnBr0qYPwdGkk5NgMRpmr6s8afZhMrw1GlEo5cxoxzFN2lf2b0Hq
 rBhWsj+4C7ciFBv7+//vjsCz+RaHuKWzbD46xMeeBAAAA
X-Change-ID: 20260731-bcm2712-d-stepping-compatible-4b40f0c4bda5
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Gregor Herburger <gregor.herburger@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785751607; l=1082;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=Z6bjOAc+VesJ09Rh3jKGmkudCEj95FEUNIdMg+ymMnM=;
 b=JqGd9SEdRpx8wmAytjUfYiV4RQ8yx+/xrP3HG2mMSbBp93i7YyBu1LfvzEBjqXCLGF16Bxsgt
 YB35wTnrB2xBu/A8Jljl33VSAEWy6mqfiRp/curybTW+RqDGMuNQIBG
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=

The bcm2712 found on the Raspberry Pi 5 is available in the d Stepping
and in a c Stepping. There are two separate dts files. The
bcm2712-rpi-5-b.dts for the c Stepping and the bcm2712-d-rpi-5-b.dts for
the d Stepping. The d stepping does not set its own compatible/model
string but uses "raspberrypi,5-model-b".

These two steppings are not compatible. Booting with the wrong dtb file
causes a crash at boot.

Add a compatibles string "raspberrypi,5-model-b-d0" to allow us to
distinguish between those two steppings.

---
Gregor Herburger (2):
      dt-bindings: arm: bcm2835: Add Raspberry Pi 5 d0 Stepping
      arm64: dts: broadcom: bcm2712-d-rpi-5-b: add compatible

 Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml | 11 +++++++++--
 arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts     |  5 +++++
 2 files changed, 14 insertions(+), 2 deletions(-)
---
base-commit: 8ba098e6b6ff0db8edf28528d1552be261af30d4
change-id: 20260731-bcm2712-d-stepping-compatible-4b40f0c4bda5

Best regards,
--  
Gregor Herburger <gregor.herburger@linutronix.de>

