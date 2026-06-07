Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7723B257855
	for <devicetree@vger.kernel.org>; Sun,  7 Jun 2026 11:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780832233; cv=none; b=AT76Bhr4r7H8njkcp17v8bTs2kYrZ8EBxYqd/ovEvaadYTaw+LcATGIadI6N7EXbcggC40UwDb0SaEu35/HeNJieOhRaUtFmcuqiAMUHPX3R9MjUQdwNCTNgN47KCsW9ODSH2/GGlNEEWEl5mOUIO1ajGcmiRTw6TcxeGp8MUqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780832233; c=relaxed/simple;
	bh=UkilVZ6L5qYNGf5OkHZ73UaA5FJBXCP4ssHkfm9A6Bw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TCqaQYrWFShsIQsWtSqfYWpgpU/bGy9q2i2Th9jKda8zAnj7lEPz3XDG+GeiJl0vdEE+Gu2vF9Td3qfkaGeJrrEguBe4QMWU88ciTY9NQ8IkPw1jKDEH66SFoC9JOcxTcUv916s1PbidTrb+cwdsFfUXp/VCPij9IKQySNPbyjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eXOG06aB; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eXOG06aB"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2c0c2c7d45eso29982685ad.1
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 04:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780832231; x=1781437031; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E2qBSVXHU8kFXauvXxCaj7xA3mOOH97xQiwoWavb5pY=;
        b=eXOG06aByr6zUseVHK4gfgtYZkmfzGUWtWHgNzL05VtynNpfFSAEUZLrVI8N1BizOZ
         AJTNKyXnocqc6gz23Ibp1wjQgq048qbZ6UPvvWxLO6yJJO9UOAtumDjNSDVL93OeCvIk
         tB41rZNy/sqG9fc5V9CTk15um2TM5dPmltoongOWYuobdjmzgN/Bv2Ns1kD2awNVAII0
         dOGOjcx/1Y/oOw97KFKmgsMpkC72FhhX8sFsO21cZei4P79qclo7/mCgZrTiP/npQYtw
         AceP1awIT8GsLud+KDUTLliaFg52ziUTsjT5dF67KqUzjmdoEl+3o2gzgEIPMxZOhmtQ
         Ryfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780832231; x=1781437031;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E2qBSVXHU8kFXauvXxCaj7xA3mOOH97xQiwoWavb5pY=;
        b=dKkOc8Q/NS/fO4mezARh76bYNkArmL85wzjE8YUzKmPNK6ypSZTlOkQ3Mw0+bITCX4
         1A+d6MJSxRAIFMSccjoa6KTu9k+a/eR2ZJb/SYgOX8uqoJbC83E9rehZPRathbKCHSqd
         XTrLEdnQ9yOHXqFkm6M2opksmvJKO1UYo7Xc9eegGnFjCxju3JC5VpOi2Us1OWuMcaUo
         nYOj/Xb71alWXpZ3vG1QVzoc/3+mLGqzSCu/O0+HhhGKWB6D1FNreg9nk/pkc3q3wBQi
         wLNcOTnXF9LZspNr+H/acWZQ/fwfuSDTwVxL6tkaPGQo4eGencsf7HyLbSgs1fPigO06
         kb5g==
X-Forwarded-Encrypted: i=1; AFNElJ+jq+y2TSVFC5waIZpVjmKceLMOfN8ktaxionfddK3c3POZKQ+V5pI1FV0c8+YCtR5zKLYCeBqmQZWn@vger.kernel.org
X-Gm-Message-State: AOJu0YzxnqlbzZ0gQ+BWS6ofX0eIaeWZtvidaUXCrm0ASdEcYvqI4d4Q
	7FVvD6g9+53PsSQGw6jLio99YbccEkTpaRJwquB3mv5rXkQ/CqHKQtkA
X-Gm-Gg: Acq92OHiv2tHsP6Xh0QDUsRDa1ddOht5MyMlrQLyEArO0ugz/2Eo6tfOvMujRNeYAFK
	Hx2yRTnUJKXfMttv7ymMrGtfYy48MJTIeWwbkuC9I5pR55zOZPWTGxNAfq9ECmJ1Tk9f5zJvnbo
	m+IhwrqZlP4NYlrmPcN0tObdKDTunQWbFlAE24IowBgrj1NVNwDWDesj7UjI2TUEp+/3MR8QZ5v
	NDFpBw/QKRZNlLUVs/zoKhiUMZRqLcPPZF9BHenZEDYa+H5PF0ZHH1IYYEKh5RFNzEeKXWm1h1E
	VROznmrLYlkVHQnlLTuCrlIh6SURSzL0c8UsictCFFFXwec53febgzjJ5MD4SpD4hSkc8J2S/OK
	3w587vuoamxMcMIwYjZnN7b4Ok7fu6aaBCJQJHcBvzuQmHnnc0MpgrlbAxEVRUlqXwJaQ3hb1Jr
	BuzQNUDI4sHtmiL3bVCKHCXro8oedD6xhaSZR3/U+luOz0auOePynFp0cYjtuPC3Uu9Mpxgt8=
X-Received: by 2002:a17:903:1206:b0:2c0:bb2d:a314 with SMTP id d9443c01a7336-2c1e85aad3cmr126401255ad.28.1780832230663;
        Sun, 07 Jun 2026 04:37:10 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:88b6:5847:b159:e15f:b4ca:e80d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649c302sm144144165ad.73.2026.06.07.04.37.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 07 Jun 2026 04:37:10 -0700 (PDT)
From: Ajit Singh <blfizzyy@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ajit Singh <blfizzyy@gmail.com>
Subject: [PATCH v4 0/3] arm64: dts: qcom: Add Vicharak Axon Mini
Date: Sun,  7 Jun 2026 17:06:55 +0530
Message-ID: <20260607113658.25117-1-blfizzyy@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add initial support for the Vicharak Axon Mini, a QCS6490-based
single-board computer.

This series adds the Vicharak vendor prefix, documents the board
compatible, and adds the initial board DTS.

Tested:
- debug UART
- eMMC
- UFS
- SDIO WLAN
- USB 2.0 host
- PCIe

---
v3: https://lore.kernel.org/all/20260519125655.23796-1-blfizzyy@gmail.com/

Changes in v4:
- Move pinctrl-related changes under a /* pinctrl */ section.
- Explain why UFS ICE is kept disabled in commit msg.
- Add a comment describing the USB 2.0 host-only board routing.

Changes in v3:
- Dropped unused regulators.
- Pick up Acked-by tags for the binding patches.

Changes in v2:
- Drop unused Type-C VBUS regulator.
- Drop invalid camera thermal zone.
- Drop incorrect PM8350C thermal alarm override.
- Fix PCIe1 3.3 V regulator name.
- Drop redundant EUD disable override.
- Keep ICE disabled due to fatal SError during qcom_ice_create().
- Fix pinctrl property ordering.
- Sort top-level label references.
- Add blank lines before status properties.


Ajit Singh (3):
  dt-bindings: vendor-prefixes: Add prefix for Vicharak
  dt-bindings: arm: qcom: Add Vicharak Axon Mini
  arm64: dts: qcom: Add Vicharak Axon Mini

 .../devicetree/bindings/arm/qcom.yaml         |    1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 .../dts/qcom/qcs6490-vicharak-axon-mini.dts   | 1027 +++++++++++++++++
 4 files changed, 1031 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-vicharak-axon-mini.dts

-- 
2.50.1 (Apple Git-155)

