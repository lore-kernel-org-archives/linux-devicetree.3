Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE79417A31C
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 03:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781493000; cv=none; b=TltFL7FG+kwAqEhEL0wFqZmKOyoYdBRecaaZerOlZcKc52mOCLJLsssoISkmzHLKxC6GUlpq5TwM+jEj9SrzWOZgJWCZmkggYJ1gJphqeFotzu76R/py5Dpif3Vj3+l0FjRydHbGp0RZFUb/KYeva55behCbh9nPxqoUpicfuiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781493000; c=relaxed/simple;
	bh=v0Z7PIY+mX/+RL3QyIzsYuLVn2ukFlDgmlMoLq5x8+g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gJ9RfeWrQtDTN0YFxW67sn++NAULCn7d1+Iw84YLIpiE6ImtN3fdfNoE01bHbXqtMLMo2BU0gJiG/01U20rkCR21vUrz3lL1tbZx+nL3466S1DhMhaAB6kxpKWvJfH9M9A7212255+bPeLCUGINk2+DzIdoDW1dx9RLpqXcqMHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XN49NFpn; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XN49NFpn"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2c0c3543590so18989015ad.2
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 20:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781492999; x=1782097799; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cSGwU+Hsjf+p3YpunxSqmiWp7EnaNjmp/qUqKeITdgE=;
        b=XN49NFpn6GSFIRpCk30yfK8GioTQnuRqMbY+z4G0+WYQQE1hzpTwDOy9khN7AmOs4i
         owkSTDGPTo00Zp7zyskxN9HRSLiPEL8bGozOTvuebZ/3B/z26G1khhuTamJ3O85Kqai2
         o9hR4MQcyhqahdn0Ido3pkXqEH/nYHSRhVSMcJ/n3PZlBFFvy00zjixmlf7Pc9q48aIt
         OYkkCLJzm+dPDa9beBYN7Mv2Fw4b7pCPMt85AdUau6uvwqLGh/sCFi6m16BtSr3iVidu
         S0qmM2k6YgHAUeb6N9NaAQ8KpLOOKQS6+wEQ65vux9hQubqxHqqr7jtBTIL9gePiTFxQ
         GTTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781492999; x=1782097799;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cSGwU+Hsjf+p3YpunxSqmiWp7EnaNjmp/qUqKeITdgE=;
        b=DZAWjd7ELlO/PrFau0QTsvTPGOXElKJRDUkpqKnDzk+uwNOIKk6DjNfvAi0BFp/opS
         jBCDR6yHkl00UVfbgWm2J35TopT9LNUrmNbTh2HZwFzhniNr9VHLQAOLU/lh7tvk9j7G
         o03Ja0ILhNrfxtpdQJ+bE90TeTSQ6VxRB51Jux6OTD+xVU30tCflk15R1JP+SEfcLA/d
         RLrwDKeNuft2WExjUAdQ716pEVOdykEtgs1JdF3VpJ5ldHHY184pKtZFnpRkSDjDvBGg
         o3YU1vHiA0lydMSVNZF3WRv1fHSO6V29tRVzPCmFBTfLKnK7p4bGHP2a5x0JetN4Og+Y
         6iZQ==
X-Forwarded-Encrypted: i=1; AFNElJ9AuM+MzG35in5IgWj7bk+RPGMSy1U5XffWIEThPzHL+MTGcQC5IN/CAeuZ0PxmQ3710xt0EZfUtqt1@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8ZRodE6Qp1OUuEGl7ETlPk91nuI/kaKgeJCLtas8rJZLrTqHZ
	cW1NCb9h8rdNSo4cj4vKvzqc/5mhGKR3CA4hhj/AUqbbUD8C30084+BC
X-Gm-Gg: Acq92OHVnDf2cTG0Izy4UVITx4k81rxp/eRp+QW9+RDmnN1t8XJIEJbkGpECNHg15CT
	rurbxbmT0umCvPdq4pswUUOSpZLdxQeZ16nAKaci5WBmHE2m0yVpHjqtBNiOFEFT4HyG91wIopb
	+Gn6TSv6jIZLNsswu2Bfe7n/NTW64h+DRvfjOAhlX9CotO+MkB2E+xPBL6Kyw9gJSR+a7Zszu+G
	wwnFare7eI0kxyyub2jpfWUWo7RkCU4FgnsvVARoPDZs03YPbPY8jCKcvTzchYuqWD59U0mOa79
	6Ix2HEUeI9C492fpCoS+vCpUFEUgkAZJi3BTQDRmSB2tS0yEzzueNhHUsH9ES/1d9v3+qk1Rgdc
	T20i8mldFXOFprvBoULl5MbD4BM4W9N+zQUkV2u44HtOCh4XIF1vttK0eEONm2oweY/5m79tOUH
	+VLGjGTl0SlAhj9eSqUCpN1G+3ENoMKwjGmVcQDFvTC9povC9oqfjRHewIbFX6qsVHNg==
X-Received: by 2002:a17:902:e78e:b0:2bc:b80f:677e with SMTP id d9443c01a7336-2c4137e49c1mr124323815ad.25.1781492999119;
        Sun, 14 Jun 2026 20:09:59 -0700 (PDT)
Received: from [10.10.15.228] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c433460a60sm99211095ad.76.2026.06.14.20.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 20:09:58 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Subject: [PATCH v2 0/2] hwmon: (pmbus/lm25066) Support SMBus Current Limit
 configuration
Date: Mon, 15 Jun 2026 11:07:12 +0800
Message-Id: <20260615-lm25066-cl-config-v2-0-59be46e67d5a@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGBsL2oC/32Nyw6CMBBFf4XM2jF9pEVc+R+GBZQpjAFqWiQaw
 r8LuHd5knPPXSBRZEpwzRaINHPiMG6gThm4rhpbQm42BiWUFVZK7AdlhLXoenRh9Nyiv8hCGZ9
 rnRNsu2ckz++jeS9/nF71g9y0h3aj4zSF+DlOZ7l7//qzRIFCkbF57XVTyFs7VNyfXRigXNf1C
 z55Q2bEAAAA
X-Change-ID: 20260611-lm25066-cl-config-f81925f7337e
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Zev Weiss <zev@bewilderbeest.net>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Cosmo Chou <cosmo.chou@quantatw.com>, 
 Mike Hsieh <Mike_Hsieh@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, 
 Potin Lai <potin.lai.pt@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781492996; l=2017;
 i=potin.lai.pt@gmail.com; s=20260522; h=from:subject:message-id;
 bh=v0Z7PIY+mX/+RL3QyIzsYuLVn2ukFlDgmlMoLq5x8+g=;
 b=8jBjNoDgtbqIn10yoWlK5lI5bjsbBBXfQ4gJjoqlc79NBqxy/3tkuYX8cREOx9pVmkO7kEeAE
 83IGcT80yJJA0zAmJr9lcFxwIIVUmHCpvI875Yb+XERQ0ec61zYfkBw
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=j3/nMxzz1ZPpp1revghyZ8IqOnwi6RWfuxXN2XrNMRE=

This series adds support for configuring the current limit behavior via
software override on LM25066-compatible devices (excluding LM25056) using
the DEVICE_SETUP (0xD9) register.

When the 'ti,current-limit' property is specified in the device tree,
the driver configures the DEVICE_SETUP register's Current Limit Configuration
bit (bit 2) to activate SMBus/software override and sets the Current Limit

Setting bit (bit 4) to "low" or "high" threshold accordingly.
Since LM25056 does not support software override (bit 2 of DEVICE_SETUP is
reserved), it is explicitly excluded from this support in both the device
tree binding schema and the driver.

---
Changes in v2:
- Replaced the boolean properties ('ti,cl-smbus-high' and 'ti,cl-smbus-low')
  with a single string property 'ti,current-limit' ('low' or 'high')
- Excluded lm25056 in the driver from parsing/setting the current limit property.
- Link to v1: https://patch.msgid.link/20260611-lm25066-cl-config-v1-0-02e567bf3d91@gmail.com

To: Guenter Roeck <linux@roeck-us.net>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Zev Weiss <zev@bewilderbeest.net>
Cc: linux-hwmon@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Cosmo Chou <cosmo.chou@quantatw.com>
Cc: Mike Hsieh <Mike_Hsieh@quantatw.com>
Cc: Potin Lai <potin.lai@quantatw.com>
Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>

---
Potin Lai (2):
      dt-bindings: hwmon: pmbus: ti,lm25066: add current limit properties
      hwmon: (pmbus/lm25066) add current limit configuration support

 .../bindings/hwmon/pmbus/ti,lm25066.yaml           | 18 +++++++++++
 drivers/hwmon/pmbus/lm25066.c                      | 37 ++++++++++++++++++++++
 2 files changed, 55 insertions(+)
---
base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
change-id: 20260611-lm25066-cl-config-f81925f7337e

Best regards,
--  
Potin Lai <potin.lai.pt@gmail.com>

