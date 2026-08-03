Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628E03B7B8C;
	Mon,  3 Aug 2026 12:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785758972; cv=none; b=uWlhEPGWeM8nHTXFfj5Y7NiOQ3Goj90V9G1Uj1x1X2RIWhOQLp5hH+JJQzE8O768s8IzHNlytf92ObTGqeExrAVpOn/BNultJTYo9vJjXLHu6eofCbiy1tRwINNCbOoTvLZERyW/9uqnqv49U+oatSX4V8CXQpOhubttf0+lkk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785758972; c=relaxed/simple;
	bh=DSPSDoGviOFyo8k3qvSQl5w8Jy3UBcbhVpFibB9/rT0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dtBUjts9Ht0S6WSpnx3RKFuqckhiN4dql41j3F66lZlNkxdqVQF893JPbk1/LRy09qSKMORE0gzKkSsRDu4Tin+riYTEsnyzILPBJ3Qx1PxA10ZcLpS6sBEmgOMdkWKgGxJb7NKrTQUwqaWCYjDMOL6kvNy1hBmJffUW4ulHO8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=RSr+EuCq; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=HNp72QlF; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="RSr+EuCq";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="HNp72QlF"
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785758969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9P9bubSjejExvocqDDS92y3ppWHsNSy9m2WTpszexZM=;
	b=RSr+EuCq+yptKngLpYYlfcOmMZL3vXigh5X7FD/nfhs1O6uH5xpTsQvhp1bXKgkTU7pEML
	STUWY9BezYCnNYrMZZ0rQiNYYEx5pJoWGqvxOeKqAku6hyHrQtJ8J2B6XOavk6KoMW91kY
	G0ht5QYiY2nipoqUotEWESxeB+uGwNT3umumF7yr1vSZLf5qgy+fUfePsBdMNZHiue2KRa
	k42Kt2tXLMnjXyDcIspjT1gCdSTn9P1YvcjoY0BcFZTCGHNQntPSdI4NYgJCkpFSz/b9ur
	iTmkFsOhlN3ACMkFhNNQgqfNfuulj2wAy25qVbcdJnLFV3RqolD9TY6sot4jgg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785758969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9P9bubSjejExvocqDDS92y3ppWHsNSy9m2WTpszexZM=;
	b=HNp72QlFJfRZcOl5+c6kkvHqZGIivOfZmA+6dCTxHZX+cmiPhRYJfS66Y8CJpmLbGGwVKr
	gqb8sEvMKFtBJnAA==
Date: Mon, 03 Aug 2026 14:09:25 +0200
Subject: [PATCH v2 2/2] arm64: dts: broadcom: bcm2712-d-rpi-5-b: add
 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-bcm2712-d-stepping-compatible-v2-2-803017e4ba7a@linutronix.de>
References: <20260803-bcm2712-d-stepping-compatible-v2-0-803017e4ba7a@linutronix.de>
In-Reply-To: <20260803-bcm2712-d-stepping-compatible-v2-0-803017e4ba7a@linutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Gregor Herburger <gregor.herburger@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785758968; l=1240;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=DSPSDoGviOFyo8k3qvSQl5w8Jy3UBcbhVpFibB9/rT0=;
 b=UXJkRE6rP6HIDotcOWiaYWjId5rj2+yfA+gQ4NT6v446bhuMZP0jCSvEVYi/2/ffeMtvIm0Xh
 CMUi2Z2e3q1A7z2UWi/uJixavo2vbLQhLlQM4Rn6f+nHjaakmKQp4hH
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

Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
---
 arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
index 127be0fc27c2..11a38cd53401 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
@@ -3,6 +3,11 @@
 
 #include "bcm2712-rpi-5-b.dts"
 
+/ {
+	compatible = "raspberrypi,5-model-b-d0", "raspberrypi,5-model-b", "brcm,bcm2712";
+	model = "Raspberry Pi 5 d0 Stepping";
+};
+
 &gio_aon {
 	brcm,gpio-bank-widths = <15 6>;
 

-- 
2.47.3

