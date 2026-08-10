Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627AA3C3438;
	Mon, 10 Aug 2026 11:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786362402; cv=none; b=bJwHTaexojsk9KkdSYn+xiLQSWo48uWsTGClspqQR+f25n/DLmy+d80pv9cdZZ0m3zaJH/4jJOGefIeq/UlzfL0VSgTMjWTqmRRozuycE6P5Pxc4dG+lEqkPcwpFhG5dz/nXjscuStg/beYW+KCDGV5rscBtcqAR5uU3Vv5RVU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786362402; c=relaxed/simple;
	bh=kmLavogkIYMEuO8Njyz9QMRsfJVwk4khrRu3BW2LFkM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Wnryn3ai+0n7t+CunSzG1NZa1iI7pBlpmm9VF+a/Tl7PEazRqkHe2yGk4UcvtU6jAN7bkXHEr3H86Ic5BqE+3bsLqWhVwUBYmA8OILkZTWHID8sGw2ugeD7mhcXqoqtJ2fWiXto+PA1L0a7IIKozHX6c0rlgON0nWwy2O0pT8wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=4Kmf2TPs; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=qqNMBG5w; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="4Kmf2TPs";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="qqNMBG5w"
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1786362397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TDihv81nwZosO0Lvm/brs/h5gJzUSpTRLlPXHbBrogE=;
	b=4Kmf2TPsPIkMYvEgctWI9UQnq4jCr7TmgH/lZZ6yUn+8Axh0FI7T1S9GlbICk9AlERxi+7
	RF/OTnuLqbygBAHB8mG5JbetTOny/RK4WNijiOK2qt63LDPBKHvH/wDQlDO2ABuNw5tggR
	TKMmbzu4AnZFzoE1mXkKlk+3W2xgcTlBC8CHWqptOKumFay/edsOKL9vpNAhqAp6ZHSIX1
	nvtKuPK80rcuNvNo3lT7nVFcSmzjw/5xOwxm3/Oo6xx9UqB7watqc1/cCrhNTsp6IYLxLM
	34YuMhd/Deef8+1k/DYEvkpgTsnExRiOlb5KArKKTD+2PqdnkrwotQVrfEL1hw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1786362397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TDihv81nwZosO0Lvm/brs/h5gJzUSpTRLlPXHbBrogE=;
	b=qqNMBG5wrnQb+m+JTZDAoxzzirTAuCwjUpMkpN23LntKLOUiRNsraetWNcnjUcrpjjhT+3
	oaATtS2+q2s+ipBA==
Subject: [PATCH v4 0/2] arm64: dts: broadcom: bcm2712-d-rpi-5-b: add
 compatible
Date: Mon, 10 Aug 2026 13:46:32 +0200
Message-Id: <20260810-bcm2712-d-stepping-compatible-v4-0-73f74479539c@linutronix.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABi6eWoC/5XOwYoCMRAE0F+RnDdLJ2knoyf/QzwkmVZ70cyQx
 EGR+ffN6EVkQfZYULyqu8iUmLJYL+4i0ciZ+1gDfi1EOLp4IMldzUKDbsAaJX04a6u07GQuNAw
 cDzL058EV9ieS6BH2ENB3bimqMSTa8/Xhb3fPnC/+h0KZ0blx5Fz6dHscGNXce261YD5sjUqCR
 FArg2ZpHeLmxPFSUh/5+t2RmPdG/S9RV7HWQFlC76z7SzSvIn4STRVV2wCsENuG/Ls4TdMvchL
 yLoQBAAA=
X-Change-ID: 20260731-bcm2712-d-stepping-compatible-4b40f0c4bda5
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Gregor Herburger <gregor.herburger@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786362397; l=1560;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=kmLavogkIYMEuO8Njyz9QMRsfJVwk4khrRu3BW2LFkM=;
 b=V1zsineNCGPoq+W2/C2YG0oFWJ7rqF0TseK3Q8CUnOPr9ZX8El4Z58whZG7F/Z6SlB7hQxKRy
 zQ3u7Yx1hY5DBkPAReVYIXAevNAjarBXDN4dO+k3g3pD1gaMqQTYAJ/
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=

The bcm2712 found on the Raspberry Pi 5 is available in the d Stepping
and in a c Stepping. There are two separate dts files. The
bcm2712-rpi-5-b.dts for the c Stepping and the bcm2712-d-rpi-5-b.dts for
the d Stepping. The d stepping does not set its own compatible/model
string but uses "raspberrypi,5-model-b".

These two steppings are not compatible. Booting with the wrong dtb file
causes a crash at boot.

Add compatible strings "raspberrypi,5-model-b-d0" and "brcm2712-d0" to
allow us to distinguish between those two steppings.

---
Changes in v4:
- Add Fixes Tag
- Add SoC compatible string
- Link to v3: https://patch.msgid.link/20260804-bcm2712-d-stepping-compatible-v3-0-1860094486eb@linutronix.de

Changes in v3:
- Remove fallback compatible
- Link to v2: https://patch.msgid.link/20260803-bcm2712-d-stepping-compatible-v2-0-803017e4ba7a@linutronix.de

Changes in v2:
- Removed the wrong oneOf
- Link to v1: https://patch.msgid.link/20260803-bcm2712-d-stepping-compatible-v1-0-401934357a44@linutronix.de

---
Gregor Herburger (2):
      dt-bindings: arm: bcm2835: Add 2712-d0 Stepping
      arm64: dts: broadcom: bcm2712-d-rpi-5-b: add compatible

 Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml | 6 ++++++
 arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts     | 5 +++++
 2 files changed, 11 insertions(+)
---
base-commit: 8ba098e6b6ff0db8edf28528d1552be261af30d4
change-id: 20260731-bcm2712-d-stepping-compatible-4b40f0c4bda5

Best regards,
--  
Gregor Herburger <gregor.herburger@linutronix.de>

