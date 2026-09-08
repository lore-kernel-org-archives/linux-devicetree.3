Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7EE9524B01
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 11:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788865825; cv=none; b=SGQi2rtgJf0m7Pg5p662gnySbjAuFAgn61osL4UfJp8sXJPTG+ego+cvNsOSEeSmRO5clk38CIHZNvgplEQjLMptZ+2+aZCeVZnxmn5Mji6NnSK88qdBJU3sEhEhBrWjEqwaWAwBRt9+zAdYjCkMJybqSJUcfk56JY0uEmhJ5HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788865825; c=relaxed/simple;
	bh=oqSDhFf73aL5+BlWTbjr8MdQCyWd9kcTHGdxvnv6FWc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=vEswh4CMB6aBx5Mb6kbkUXDYV+H42QY0Cvry3vbDxhP5PiUfXibd9s3iHty/Ile/YMxK4rgt5YMhtsYkbJThnebjWHGsb1H/E4QkeJAH4ePdQ7hmyt+ZwIaRZbsiCERpOUH9zNFWhmwFT91oKNI0Qo1X8u2AK28ZQPBU90nR43A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=UThMrAZ3; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="UThMrAZ3"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48444ec4fe2so2796276f8f.0
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 04:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1788865820; x=1789470620; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gcn9aLAAZo7wqesym8j61ULNO9k3Gwxg2yqdzb1whoQ=;
        b=UThMrAZ39Rdm6u0zCYYww48RcovwiYNPAJ0EYinf+j920Lm1rZV9GUJKb5OgnK+oLG
         w2x+vFsurhdrB5plHhSswhD0YPdYf1JsgBhbnv6cWehQ3BubXz9Iv46lHiafafwNc0fF
         sfk0y/dAOlAg9djWLI+kkOWXlExd9R4aExKCA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788865820; x=1789470620;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gcn9aLAAZo7wqesym8j61ULNO9k3Gwxg2yqdzb1whoQ=;
        b=VkC6y/EQzZD84DCRXV9zlNl1WG5kIrhVeHlvhGk8jOSeoDlvNl9RGNgJpU+lsGkqBZ
         m0Yce5VtDCZBKlituXYGlx4y3uvDbo+WSaR4OruEkVNVoryhz/z5dHXCZQnFKGkUsN7U
         zFhKpHUlSoOdLB2+Z3FHFtHZAlDNvkhrHkTP8ZmmyjJXAp5/zU2ZYckm0/WlcPAlJ2JW
         5wiXdaqfyHxgra0PVtl9A57Un64oM2VJpv+PyiK6AcbzCybTFTgdj7Y/XTaupPIZbDRu
         MF48Y1lXnoaL2N02v1Uf/eg165IiysKfwWge0JZQsY7fbwSG0IEv2wC1hwUCT1XyhcTW
         6ZZQ==
X-Gm-Message-State: AFuF++mKUI9BeqQtran6kf2P81pF28O5G0O3OnZZtTEzABTwy3RxePND
	peb8VY6Py2+QXZ6KYwsJDQEmJhBQuGygtjzeU4YEBpgZu9sYy2KXNTYk/oLo+BaPNfk=
X-Gm-Gg: AYBFou1otHIg5FaODWlOZPvcAtHhxVUBGff5kl1wpEenqngAnLpZM4EbMIeIFrM3wgn
	sCdSQG0swvu6Nv6XY7nRyGHVUwn6fsAjoXcGAjykOIt2Z0Wqt3gapoC1EvaYHDFGG65VQ8rGoHF
	v7mTrg29ypGTQlr1wrRzPqcbLnalVy4qgftoKnBk2Lxl2EsW6Zx7D7mXpfqZ8EMuruUg9Eq2zqN
	NqPaRdwC22r7iy0DqT+dTBijJKq5mH1F1lnbrFsQp4a98XCvLZGBdUr1vxH4d239h6TmBrJXBZG
	LLf90sWr83nrAOFhvjoa3jJ7v9ST0Pjc14NjEBSxz4sWRvYWzpLhH+iHJjQZn1RKkjEK8emlFd/
	1hd4OEg1BlNDG9iF3TPzDzkCUIM1a2sYiPYl8uEADlPVi5nIk2ns6lue2G9flT3tScHccXUxiMi
	4We8hlgW0PohjsNTaatoctKPjYg0bBLITpgaxC5O5Y84KMo6FzoQSCJ9bnyVwHGybM0IjhdVt3f
	eZFHXplvQZrOPVB
X-Received: by 2002:a5d:5f89:0:b0:485:892b:bdad with SMTP id ffacd0b85a97d-485892bbf0bmr51682730f8f.12.1788865820340;
        Tue, 08 Sep 2026 04:10:20 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48594172546sm26855073f8f.15.2026.09.08.04.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 04:10:19 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dinguyen@kernel.org,
	Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v2 0/1] ARM: dts: draeger: Add socfpga devicetree for Draeger's M48 board.
Date: Tue,  8 Sep 2026 14:09:59 +0300
Message-ID: <20260908111011.960876-1-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Adding the device trees for “Dräger M48 on NXP i.MX6 (Q) and Intel/Altera
SoCFPGA Cyclone V” board variant.  It has both (the SoC and FPGA) on the same
carrier and they are cross-monitoring each other.

This is the SoCFPGA devicetree part.

Petko Manolov (1):
  ARM: dts: draeger: Add socfpga devicetree for Draeger's M48 board.

 .../devicetree/bindings/arm/altera.yaml       |   1 +
 arch/arm/boot/dts/intel/socfpga/Makefile      |   1 +
 .../socfpga/socfpga_cyclone5_draeger_m48.dts  | 130 ++++++++++++++++++
 3 files changed, 132 insertions(+)
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts

-- 
2.47.3

