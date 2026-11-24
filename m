Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795559103;
	b=t3e+LP9uyoi0Et1krbcx0Lhi4l6jVC1HKw7OPwR7OXGpjjTsds8ybgmPaD0JLdWbeaLr
	 NF+4QmlWe4yfg//Pac+yadchTmV6qFx/8qYNjbG1Rcqe6IHSmHlUFKX8I8gf85cPIPCPz
	 GTMxdFTNazEa5Dmc4e/MdvuzbH0s/AI5yzRrJomQ0EKqNbmgC/CUhzfYi3u2HBPwfRuRD
	 qEnD5SE/2ROpzTtrxiNzN5jRWsh1mLwsr8rVUmV+9B6B7NfoFAOyiHCu52dqhoJvNruie
	 G1/hN9oM9yp/U48TKfwCDzZYvtMlq/YlWi4I2yRTw3Lge3d5g+cPQEaPrnZf2GeM5pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795559103;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=s9MWtiGisD5ffcST4k+rFV/a48cpzRUFIKFiLqtSd0Q=;
	b=gUeqG2C2GaUOP+4w6QKky4tH5oId7mpLREcHRUCnHvWeFy1anQGYNxbkv8e+/lbyUHx8
	 Mp89aL7mdDqdWxRx4c0T9ZjULv3uD1WfLbqP7yXKw/8tC5r2qIQLoOIxsTwHP2Nb3vGw5
	 EOpZhCtN2alMUuZDQjQQHC+h5UaHxCYK00ykBK/RfwtqJJq2BOjWLbTArdeYEr9TBQxs8
	 /PZtBqG3eew5Ft2kQRoV8auA/T843USC11+lkmOwG4tH5XXBzdIWN3nT/V2tix4IV2Iex
	 lSwC6KjCLnrdOrlhHi3jiJWX325T3ss06cgV1iJmIYrC0AtcZIL4xvBrcawtj4t2Y7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pWDz3CVg;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64440606A33E
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 22:25:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64440606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pWDz3CVg
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb69f5b161so33181145e9.0
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 14:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795559102; x=1796163902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s9MWtiGisD5ffcST4k+rFV/a48cpzRUFIKFiLqtSd0Q=;
        b=pWDz3CVg5d+nfg4CruOyXugT00Ckw32IGIGSY6UI3c6vndOGC1/B5sZ66UL3xNthsA
         vA3miDdy2C2/QAx6+/Ac+8GWz74BJ4RpMvu4PlUXKNfR8+5V1STKMWlQj42FoDAdiyK3
         cYi3wm/iYhdGplXXLHQlIE/doc+UoPyrcRf0uDv/jJwOFJLLvarQaP+futDgXujRsFy8
         2lGyeU5mTekqvMCtJAoLkQahXsMsPgJ+sLcA3j9SDRiNxACQiP3YCjH7UDvQAsopFomI
         tIAcqoJRak947FzVg5Kv6LpNmyWE0FDJGJE1AbHIn/WuHcEm6OBKjbq85zgrfanKXVkx
         2u9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795559102; x=1796163902;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=s9MWtiGisD5ffcST4k+rFV/a48cpzRUFIKFiLqtSd0Q=;
        b=rx28gJhtdvFrx1gRSc7LIt9BbLApfI8S/pU0yAUmtrObdOxiWo4HC0Wvz052Zqy/tc
         U7eQMf+grI4DcpvgSbimJOzdKmi6QkX2KM0hKnB51z3s+SW9p+JVZKZuebF+S0bE5UpU
         qsUmyxe3vAq9CC4iTVWRCcCQeoc4eBK0xEAIpIc81CAKYVFz+TH1jJnV5S1FljCT0zVL
         6BrtXuF47vd6lM9sFQ0Y7ob26GLxQ34uk76P3mWXxs1bfZtJ5A469vTr9A0FCnV4Txv5
         4avKnuMUG5oVWWsKvZ29Wwa849C64NLb2fXQFCk2q3SfA4enD8RhmYOiS0eY+jaorn79
         61bg==
X-Forwarded-Encrypted: i=1; AL+hErGHK86rngIszQE5ah/x4H6xFbKKidf8C6xm1aJ+4WUfFCYcNR5ZTlTxkuvksVJ7NhsWFLoY8T2CFITg@vger.kernel.org
X-Gm-Message-State: APuU4Z/LYEkO2tnY/wvGOwtqXq+wLQ5n81fpEGYdMSeK3DFBhjsS8WY9
	aFjCCmZ35KCOQEL/MXQM27eXrDJwlTZkO9gbOjDSFnzRPB3aKm4M7r5o
X-Gm-Gg: AZFdTZfTfBxcqHA+nLFvDXp2TZokBuHOxnjflyNgkocSb4CrJ2EiKSiLhRFRuMJihNx
	HC0SdEYG892DgPDYVv2YZ9+wJiDiBd89TpDIpGHEurLEq2vud6nhJEaAl8L7vNQhWJq9zjjZ+A9
	olYdUc77sVvwZo2ENZfF4yCVl4eYZtQvu2Uk7FOwgykoAe++Ouj3NIQaN2lpRdAtjB2GDulEVB0
	KiDN5I8Rmi1qZG8VvpHg4RG+exjk4XWBma0Y9eb84XzHy+aMyiGJyPWt/LbgV2IAiwnidMNVMOF
	yhl/7qBn0RFfg22pJYWtyhUXZIHusBXxAqiDm1SVdwp98457+8eGxhCtldVIyfLGbyeJmuISq8+
	X/qcEHeiZsumorh2Dd/KaXUhqtx1W0HZ8RJCS6dH6WTLfL4BOeFMZLdIFK44vTSZrr58qI7NHKd
	yYbI5Dea3M/+DEI0kx1Rd0fb4Z/jaoi2d/Cf6SAWnxX0UgRPhbLyxuck0PaMQi0v8+i5qRiuirN
	Ryq84QeVl+dLK75aKfxLaGIABKB5XsPS6Vsn7vvDCFpyLiOd4Bnv8/omFNbQKq0H+1vL5YAlV6Q
	T9OE8JcpisoqiMNn1sZqksvPAkXN73wxkMU/rSgcWU3j20ihAL+AJv53oIlJsIIHjjVfLHU8+JT
	9UmY=
X-Received: by 2002:a05:600c:1d09:b0:4bb:6fd3:5ac0 with SMTP id 5b1f17b1804b1-4bb88816c7emr352097065e9.28.1795559101478;
        Tue, 24 Nov 2026 14:25:01 -0800 (PST)
Received: from Ansuel-XPS24.localdomain ([87.13.246.159])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab69bf630esm31125711f8f.16.2026.11.24.14.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:25:01 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	John Crispin <john@phrozen.org>
Subject: [PATCH v5 0/3] phy: Add support for Airoha AN7583 USB PHY
Date: Tue, 24 Nov 2026 23:24:30 +0100
Message-ID: <20261124222452.219832-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small series add support for Airoha USB PHY and Gen2 PCIe
PHY.

Changes v5:
- Rebase on top of phy/next
- Add Tested-by tag

Changes v4:
- Fix typo for Documentation patch
- Fix wrong regex for usb subnode for Documentation patch
- Improve register example for Documentation patch
- Address bugs reported by bot (off-by one and xlate function)
  Link: https://lore.kernel.org/all/20260901123933.15388-1-ansuelsmth@gmail.com

Changes v3:
- Fix broken patch for YAML patch
- Split the YAML for USB and PCIe
- Rework driver to direct node for PCIe PHY
  Link: https://lore.kernel.org/all/20260827131551.26725-1-ansuelsmth@gmail.com/

Changes v2:
- Add Documentation
- Out of RFC
- Rework to Serdes PHY instead of SCU (following
  for consistency AN7581 implementation)
  Link: https://lore.kernel.org/all/20260811124724.702467-1-ansuelsmth@gmail.com/

Christian Marangi (3):
  dt-bindings: phy: airoha: Document support for AN7583 USB PHY
  dt-bindings: phy: airoha: Document support for AN7583 Gen2 PCIe PHY
  phy: airoha: Add support for Airoha AN7583 USB PHY

 .../phy/airoha,an7583-pcie-gen2-phy.yaml      |   63 +
 .../bindings/phy/airoha,an7583-usb-phy.yaml   |  133 ++
 drivers/phy/airoha/Kconfig                    |   11 +
 drivers/phy/airoha/Makefile                   |    1 +
 drivers/phy/airoha/phy-an7583-usb.c           | 2023 +++++++++++++++++
 5 files changed, 2231 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen2-phy.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7583-usb-phy.yaml
 create mode 100644 drivers/phy/airoha/phy-an7583-usb.c

-- 
2.55.0

