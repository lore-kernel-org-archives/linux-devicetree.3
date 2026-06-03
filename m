Received: from outbound1.mail.transip.nl (outbound1.mail.transip.nl [149.210.149.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C1A408002;
	Wed,  3 Jun 2026 08:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.210.149.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780473789; cv=none; b=giKHwZb/Rasn92cY1A3QmgT0jEjPNLwF6hLcYGMzo8hnbZKSdCe+pbYKFgI5K9Vni2Tgk1A/8DIUcBuLiuH+bm+4wHuBRL7nMc6cypCK0ra5k4HrIW3fDS8XznnODyewCQDPRi+8Zti8WzdTSBOFl1X3mng2DPrbZiYykCni6W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780473789; c=relaxed/simple;
	bh=Agw9l21ZtDb/MAz5yYuOB8V3CbVUpSoO0z5f/WfepzE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C+nty1RtgYNFQUza/0yV+Kdvgha7zP9cvBKld/Y9wDAe5ngseNA4aXPaThYTDQCfejL+o0H/KNaXBsrkMKg4puETrnmxzpxlWIaLCPfr0FW4nuo/LXu2lFNoHJxANxe4ULzDfgawuSrtrIYh7KIhDK7dmiIpLIR1X59NgQqYy0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org; spf=pass smtp.mailfrom=herrie.org; dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b=c43LUuV1; arc=none smtp.client-ip=149.210.149.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=herrie.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b="c43LUuV1"
Received: from submission2.mail.transip.nl (unknown [10.100.4.71])
	by outbound1.mail.transip.nl (Postfix) with ESMTP id 4gVgDK18Q9zRjgD;
	Wed,  3 Jun 2026 10:02:57 +0200 (CEST)
Received: from herrie-desktop.. (180-93-184-31.ftth.glasoperator.nl [31.184.93.180])
	by submission2.mail.transip.nl (Postfix) with ESMTPA id 4gVgDJ3sKGzJjhXx;
	Wed,  3 Jun 2026 10:02:56 +0200 (CEST)
From: Herman van Hazendonk <github.com@herrie.org>
To: lee@kernel.org,
	robh@kernel.org
Cc: krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Herman van Hazendonk <github.com@herrie.org>
Subject: [PATCH 0/1] dt-bindings: mfd: add ti,lm8502 LED + haptic controller
Date: Wed,  3 Jun 2026 10:02:55 +0200
Message-ID: <20260603080256.853037-1-github.com@herrie.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: ClueGetter at submission2.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=herrie.org; t=1780473776; h=from:subject:to:cc:date:
 mime-version; bh=XpxoOXypKujHEFaS0dmObAuWtYIwFBV0BkETqy+dGpk=;
 b=c43LUuV1/zBi3lzbPy1NQKTu48jENmH3wb8eiBEbOmvSO7nwmYwtJHuCT35EMI70N5p2z7
 tKWUFdYtB4DzqGubB4WIVQt4nPjcWRUvOVvpOXKQrOVw7zbQ5IUy0OTGxYWszV8Z/PeFw8
 7Q2u1/x8pf2UFDI4F1lFikRqCYVsnFmA/yoa10cta8T1nOsxG15ZiuQcdPPae+OD+Jt+tn
 xLvk1gnnL2zEbkBxxivEt9vS2c8mCWRzsog/oGRAGGoFJPP05Qrmz1tmQdhG/dMSt5NDsI
 olyngxJs1xLhtCQ9JPOC0YK6+OQP2xwrNSkjyh+jm1yst8PxW4DHdwdJUZNyOQ==
X-Report-Abuse-To: abuse@transip.nl

Add a YAML binding for the TI LM8502, an I2C combo LED + haptic
controller used in the HP TouchPad (MSM8x60 / APQ8060) tablet.

The LM8502 exposes ten constant-current LED outputs (D1..D10) and an
internal H-bridge for driving a vibrator motor. Pin D10 is shared
between the tenth LED channel and the haptic output; the haptic child
driver mux's D10 to the H-bridge path at each FF_RUMBLE event.

The device is modelled as an MFD with two child sub-nodes:

  ti,lm8502-leds   - LED-class outputs D1..D10 (per-LED reg +
                     led-max-microamp properties)
  ti,lm8502-haptic - EV_FF / FF_RUMBLE input device for the
                     internal H-bridge, with optional
                     ti,invert-direction property

The MFD core driver was already sent separately:
  "[PATCH v2 0/1] mfd: lm8502: add core MFD driver for TI LM8502"
  Message-ID: <20260603040026.398009-1-github.com@herrie.org>

Child drivers (leds-lm8502, input-lm8502-haptic) will follow as
separate series once the binding and core are accepted.

Herman van Hazendonk (1):
  dt-bindings: mfd: add ti,lm8502 combo LED + haptic controller

 .../devicetree/bindings/mfd/ti,lm8502.yaml    | 160 ++++++++++++++++++
 1 file changed, 160 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/ti,lm8502.yaml

-- 
2.43.0

