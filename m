Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E492444CAFB;
	Tue, 11 Aug 2026 16:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786464264; cv=none; b=gNVCC76lP793Jy9oFm+FVGc/pxgDBGaZasJjLb73Ng46sJMpjdfXy+fwbqbOFkq+bg+OOtStI9RWYw7pYVLDvfAAGmlGPK10dnmaTRGbxRjOBv8akpwQr0aMSsmjZ7LqJ2aZfoocT6+IAkH4rtYVLOk+aDLcsbmS+vbVo+G9YXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786464264; c=relaxed/simple;
	bh=XgsT4Q3MstgcyMrNRJFYMGnErGnNKp2g6tLPRWScjO0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Q7AQLuK3g3ApmMCt/qi2Y5APVkihdAENC5+4Y0NPEvkmHWAsbikZv+fmR7C5c8qzKMIW0kD+VlbS2QXy0lYtlBrom/qoOB7JNsH5UGYG9yrEpa3+ERnny/AbW+g8dynMwOt1UlO0lOwGtNBPD0LmonK1j9op3TCxEQlHsqloEDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=OId5a8Yq; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=jQ6iH8Kw; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="OId5a8Yq";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="jQ6iH8Kw"
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1786464260;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=u6qNz38/JdB9Y/D41x0YpIgRaUHYTP+PD4EDIH15nEo=;
	b=OId5a8Yq1enVRNT3bskCUVeMX3rWX32hC2w7AFr8gSW6JbrxK/E1nsnu1fMRkR0Nt9+00U
	EPiYhTQL7Nqi2cUvHYuFC081H98+bqgIy/XrVGwVtJdyRxHHATfvLndFNYv1d7kNQFDhxs
	wcxuwCEpqmMrk/0R1D+/A6jW5dsdlndEo2c9lIgupV+9pNOwewQ7CZ8CnDCNMjXVJ+PJ6y
	mgppWOf4sUIcNH67cgq2yic+2MBXCMDp/fhb+T2G87QdAlM0N7l7cMbFlqRoN73B8uFOV9
	pVmVX8YnYoyWwk+b3Vq5v6rRaTag8/e6Gsv4mOm7ojIPNHGVIzK6F+FguFJd3A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1786464260;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=u6qNz38/JdB9Y/D41x0YpIgRaUHYTP+PD4EDIH15nEo=;
	b=jQ6iH8KwHh1hpn7TNnfZIcyyny4e2XrA64JMtd4QQlvQz5tCVJGKjxCu5hx2fIqUTgO73T
	FOw3iDV0hXA9c4Ag==
Subject: [PATCH 0/2] arm64: dts: broadcom: bcm2712: Enable SPI
Date: Tue, 11 Aug 2026 18:04:14 +0200
Message-Id: <20260811-bcm2712-spi-v1-0-4c1708d354bb@linutronix.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP5He2oC/yXMTQ5AMBBA4avIrDVpSxBXEQutKSPxkw4iadxds
 fwW7wVg9IQMdRLA40lM6xKh0gTs2C0DCuqjQUtdyEopYeysS6UFbySKPDeldIiZcRCLzaOj67s
 17W8+zIR2fxdw3w+6HxIRbwAAAA==
X-Change-ID: 20260811-bcm2712-spi-644b70fee3bf
To: Andrea della Porta <andrea.porta@suse.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Gregor Herburger <gregor.herburger@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786464260; l=675;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=XgsT4Q3MstgcyMrNRJFYMGnErGnNKp2g6tLPRWScjO0=;
 b=DpSf4Bt9IChZwuV9jEDPS6n6iFE9Fjcqi52tpXTSG7hjlI1v2Irrvu7XHRDZydC+AtxExQnMG
 xqCstc1nKvLDvcv3LMzLbWfwWLUFFxBanF8ajQdOjcoFUpVkv30o0if
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=

The RP1 chip, found on the raspberry Pi 5, has nine spi controllers. The
spi0 is routed to the pin header. Add the rp1 nodes and enable it for
the Raspberry Pi 5.

---
Gregor Herburger (2):
      arm64: dts: broadcom: rp1: add spi controller
      arm64: dts: broadcom: bcm2712-rpi-5-b: add spi0 interface

 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts |  16 +++
 arch/arm64/boot/dts/broadcom/rp1-common.dtsi     | 119 +++++++++++++++++++++++
 2 files changed, 135 insertions(+)
---
base-commit: db2ddb87143519e20a95aa36c60b36107b736a58
change-id: 20260811-bcm2712-spi-644b70fee3bf

Best regards,
--  
Gregor Herburger <gregor.herburger@linutronix.de>

