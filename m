Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29373DA7F1
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 13:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787836610; cv=none; b=sLt4D66dg5VxZFM+EuMxkzlReO4xUNOvEUZnZf2AKN+Q3ZY4MdLLxOfIUSynbQucjK8VUcMO4B/I/ecVfgLVOs+02XDLgXCUTso4T3bXGSXv3Ik+ppI+X9rHBpUTE3H0dhedgFtC6FXCICWKoHOfYF+1SqLTSCIcJ6iAlz2pXd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787836610; c=relaxed/simple;
	bh=d17alDKmCRuWwyfr1cSfkyALNGmVJjvcCEUPOg8gE3c=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=IVQrFm8aTDIm2bu2/ZeDSRYyLjGRs2jXtCMCrRyVRMv7dPuN1OCwQ3k9uRl5a7WSzUTnHnz9kSS39YqIKwSP1+w0zjbfcCbYJKokbXUHbyHJ6eIUTLx4MYRAccoDBouFlKskIUIdJgshMrjLqVEhJwQr/ng5CQ6kIo2VxQfyR5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DqIl4EHW; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DqIl4EHW"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47de0093c42so1730730f8f.3
        for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 06:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787836559; x=1788441359; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zau8axskQfgYwgId3j7+r2m2G5GC3NQebm9qgyCpq/Q=;
        b=DqIl4EHWPWchPYr4T5dXTZ6jOmSNMnLeh2hqT6CLXQ0KmnyIZIDV+z6hOu7ipDbmOh
         tmx8/iQaBAk7GoA5KQErxc5eYEzfkKauh91hhYOu4/sYOAifKpn50x6CLE4Pqa+EiNtH
         CrE534vmjX2uQM7EYa2D0IYbrsuJbgQTwo1Cs7dFeQVDD2WeK/0if0mtap2dsNEi9BHg
         MQVdQP5peoIP4JAgrWjRhmMl7u03Y8mg603b+6HQX9R2gHjf4x4tF5x2y9+Z/1caZ+LL
         C1Sd6hbUB8EoEDhy+0CEr83R4dG9bZFYNfdPJCg/NOYBCOUEjtbSoZfkALo+kjfVtVYF
         SmPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787836559; x=1788441359;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Zau8axskQfgYwgId3j7+r2m2G5GC3NQebm9qgyCpq/Q=;
        b=FYyOV2JpM/hoKexxe5D3NfGugdNgeOPbI+uWyQzu1fDvqUFZEmJJPMFdx+kLqbauX5
         Pzt2uoMpwMaNVdA1BIJgTBaZANYSqFy6VGaNhBMWbhAUrYIpcrZPSnZLCREKUkmh3ZeX
         9MJ9fMhG8nH7gSPfrZPPbUQsRZOJ0e6j5yESLPLRAd6HgG2Vs9lXhuztE4rE3JhiCyjV
         zn2rJesIdKqdKZX05CAym96Kn2SN4GZOXFxR3ozgaG77uipQba0wYy9KLAusNbnBUIwy
         WD8bJhhz+1DFkT0663+rA937Ye1hDb3FiJMHSenc+R2+Ixf6tj4gVb37vmIefCVvBWuB
         DePQ==
X-Forwarded-Encrypted: i=1; AHgh+RrNTYnfi4u7Y9CGaOIIGPGBLhs5hMg4YgWo9Y3RSrP0E4JkY1eQwGtgXRMlgQep9RsjuEPYF55QUIj2@vger.kernel.org
X-Gm-Message-State: AFuF++lL1pIG1meCMM2D/Y4IxRFn953exMFceprWYY7GqjLYmN3kpUWa
	TRI/6U9GpVAnaf3cacY9lUa9gTnXSrTtrlg0YdeFWf2G4c16s7iPQgaQ
X-Gm-Gg: AR+sD13j+MJXGFERZW5uo3Ab6IPZYmTvbY3U99yh9xJobWj/+qgWScXLyYaeUYEznzp
	AgFZtjQM9WTrtuBgLNsN3YvB+jzu3YadFagnjtxadnyO6od12S+qwS876kjpCG1WqQ6tluUz2BU
	g94R1Cathnsnfqp5dbsw+zqrdgle2JR5tDWA0jMZj0C7tOA8KIada7GUiYL9qx6WJdXXCTYE9cI
	RFCGCUQp5DabrH+U0vFJ6kLhEV2ntUH7QUzlYhQ8NSUs+3SH93GOaOjBzt2MMw2uOtxH74ZHF5a
	sRMfZedP7oca3oQq1ej3CdFhksp4kjT4EIT2D1r2/+bb93i9sfeLdOsd0hrZOkiumluc/3Pboo0
	NxJ4y2I4fdwvWGauEDjhesUwHOIJFdhzubyzPFsfP09yWwGvEkugiZH7gQsYNtq1f7nTBvw9osN
	fH0kqB4ttBTpSpVeMeNsaaYKfsuHmocFTAYs3Pn7kX+4Dk0tAJ0i+8kuNW03DNYUv4nxheI1qDL
	lvyko2YnJGe1u3JoBGDNO1yzzzT0otgpzRu/uZoeCLLKMtiDf0plA==
X-Received: by 2002:a05:6000:4808:b0:482:f435:76b7 with SMTP id ffacd0b85a97d-482f435781cmr5464065f8f.2.1787836559059;
        Thu, 27 Aug 2026 06:15:59 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-482e28dc3f5sm9367192f8f.21.2026.08.27.06.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 06:15:58 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] phy: Add support for Airoha AN7583 USB PHY
Date: Thu, 27 Aug 2026 15:15:44 +0200
Message-ID: <20260827131551.26725-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small series add support for Airoha USB PHY and Gen2 PCIe
PHY.

Changes v3:
- Fix broken patch for YAML patch
- Split the YAML for USB and PCIe
- Rework driver to direct node for PCIe PHY

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
 drivers/phy/Kconfig                           |    1 +
 drivers/phy/Makefile                          |    3 +-
 drivers/phy/airoha/Kconfig                    |   11 +
 drivers/phy/airoha/Makefile                   |    3 +
 drivers/phy/airoha/phy-an7583-usb.c           | 2016 +++++++++++++++++
 7 files changed, 2229 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen2-phy.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7583-usb-phy.yaml
 create mode 100644 drivers/phy/airoha/Kconfig
 create mode 100644 drivers/phy/airoha/Makefile
 create mode 100644 drivers/phy/airoha/phy-an7583-usb.c

-- 
2.53.0

