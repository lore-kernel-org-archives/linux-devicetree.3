Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E5930F81A
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 04:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780461361; cv=none; b=HzBC2dVcSbZTXsWoIeiFRe9Bd98wXhVA2EQJjuRUNB8fpuPJfRqxq9yWyBAWstzg4kDTSF57BEnC7OWdjkm3M0Vyork695kHRBbYYbSYTXOOZ2yjSgIHjV4jSn0O3aABvwbk6TEWW9eL69jQ9JYJweBHIn7eeUmzzVHBm5s8/0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780461361; c=relaxed/simple;
	bh=68R74o9VrBEMJwdcK66v6DldbmYlGyNpbQtvPuKnu84=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fjucUw6IKASQ0PO+ioNFcsRLr7TbS1tUFftmkdZjMfJD4UpzgM1L80z8uuXp5U7j76+UogsgXbU4gcZW47nJVg0VXkOLMTSIE18QcWXpsGvOyxFTfosLPNCCBvesHU/GnFR7ynaYoHbzgfQQ55rFfHTAyT4b8cqHzGNey8vzFxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f526pfRu; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f526pfRu"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-842338c18e0so2200130b3a.1
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 21:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780461359; x=1781066159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iQaGls+cCUTlqsfODIVaPJ5QJAcFj3/QMHEsorpgOH4=;
        b=f526pfRubr1dhquordR3WbfrmXrdTN+5ILVhdmcfT8n5FjwWqZNiHrfw8nr2mIUKtZ
         xbfZkJSDIMcn+6n3fPbTYw1tDdw4sBtyJqAYv2HpT281+otOWu9bumWUr4664+aF4U/J
         HURXSrLgzBJYMcdQdbT4oISPaV/cHPJ0OQViwdBx8p+bI8T9Zv2rlPXa//soqT78ihFG
         E+5ZNbyos4jivbaeyrtxacRaRS+5oolX5aDv1eK22qf3zm/QFAhH1rpKHAI+tm1Sy98V
         2EgTvVwBd7f7riRXtjQhsI953vJJ1vF0HE4lcs6szGIPkPA8JsfwGSpbnKyyR9Y7l6eA
         OS2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780461359; x=1781066159;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iQaGls+cCUTlqsfODIVaPJ5QJAcFj3/QMHEsorpgOH4=;
        b=l5fNeIusNr1TYS53zPQyizShbuOXQqrz2AXXPTnCnmaMqVve5+452aB3/S557jqmbC
         dyagJEeCzYWuVv7mF4IkVyXWoooIeU7CJBH8/P0L4ILuF5gMTCGJ1uk32/W0SEEAVHG5
         f1bbOwx25illDWQVK8693qKkYfDCTtyvBtuHnj/K5d8xaIb23RZNuxpNOOyeYoElU2Ul
         kR6UCdZ7zAojrqu+83DFdEeYBKoW6NzV6WflRZN6NsiNrStN3EeXDMQTODLDwzpNa8no
         1bDzon2HXMjNyRWH3rqm1MQSd3omz2omG7IRoHH2k9cevxJCH9fNGN5VHKPsovhLRXfO
         ixzA==
X-Forwarded-Encrypted: i=1; AFNElJ/FXLcPVB3m9BA8ECnN8qytDIZrBM/eCZzhqp7whNBAIaq+zVPgomifoQ1CQ8xALjAwNb5ZFeGz1aMw@vger.kernel.org
X-Gm-Message-State: AOJu0YzkH0Cedbt3wopQ5afqBNlDcP/96nUjQJGpGjiEvzxZl9Uy8Hy3
	HoITvtdxaWUTWC4EgJ2pKeaTw40nlGShIg9xZiwrgo3qMRUwfHZ1vq/w
X-Gm-Gg: Acq92OFVRzaqJwfY+Zv5qJ95X8TdQda2tyrOCWWoygGNvmm8YgkiMwVGywoKcWI+RXz
	qHPwlqULQVcLiUEyd2M/Oq+F4I5k1udIMqMMbM7hwRQfz/wgqyFBaVnB+LIFwWjrcHvYSQEQ3ci
	qsuzDsag1GFYOGC/DbtAwAM11khZ4E5GvRhcyGOXaMGW1Ajsj9C4zwYmAPrEPd2vJrVaGyPGUeL
	GXMq5CmQJdUlPBNqkzAdB932uWpUpeKi4cMDXUF4y6EiKMak1bNnEDkSUoL7QP59h3uixE8STBU
	PJRXI0W5sWtUvsAyIcwwaZgPxdFl9SJNJbmt8ERGot1J5lrcG8EGmdJqmubBTIwPZ7JVdjN5qDY
	c3dTwzsLozTITZFENhrfKkKzbO6ySjJnqU1KcGtr8lRMevLGhLHqcJ+S1niB4k/wPqIJjgmPk6J
	WI5Wl0tAcvCXMcbSN34sBLzHQYZhhJzBOUTJh1DYoE9GZijvMrTJgc8yH2S1wmjyseglJIUpSNf
	C6ELVsk641Q4EvNQ30Laa7F
X-Received: by 2002:a05:6a00:4085:b0:835:443e:4bc7 with SMTP id d2e1a72fcca58-84284da6fd5mr1639543b3a.13.1780461358687;
        Tue, 02 Jun 2026 21:35:58 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282904889sm1478742b3a.55.2026.06.02.21.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 21:35:58 -0700 (PDT)
From: Chi-Wen Weng <cwweng.linux@gmail.com>
To: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cwweng@nuvoton.com,
	Chi-Wen Weng <cwweng.linux@gmail.com>
Subject: [PATCH 0/2] Add support for nuvoton ma35d1 qspi controller
Date: Wed,  3 Jun 2026 12:35:49 +0800
Message-Id: <20260603043551.1062112-1-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds qspi driver for the nuvoton ma35 ARMv8 SoC.
It includes DT binding documentation and the ma35d1 qspi driver.

Chi-Wen Weng (2):
  dt-bindings: spi: Add for Nuvoton MA35D1 SoC QSPI Controller
  spi: Add Nuvoton MA35D1 QSPI controller support

 .../bindings/spi/nuvoton,ma35d1-qspi.yaml     |  61 ++
 drivers/spi/Kconfig                           |   6 +
 drivers/spi/Makefile                          |   1 +
 drivers/spi/spi-ma35d1-qspi.c                 | 579 ++++++++++++++++++
 4 files changed, 647 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
 create mode 100644 drivers/spi/spi-ma35d1-qspi.c

-- 
2.25.1

