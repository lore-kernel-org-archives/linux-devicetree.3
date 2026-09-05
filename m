Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58232EEE62
	for <devicetree@vger.kernel.org>; Sat,  5 Sep 2026 21:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788642970; cv=none; b=s0j/t0svhhlutsIMziEany5cA6aSIeQDYbI7z61hYWn96dYzCglX/PorHaKEG2uTOw3KDDgPhC3YAFNFWLglYH0Uhzo3xhTLdkoBwveK9tnqbdWx2NZSM7AW6iyrsj3wYw9nuO252mnK0elLpIFzkMIrCopJEQMTBvammCCuEJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788642970; c=relaxed/simple;
	bh=7zs5e98dNzg56/13i3QVmPD5pAOk+Ih4sqhBkUg3GWA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DwW67a/2Sjj0ePxXtwIVyOyFyFbDaXbzECT+thXomyQcotdbHfIOHXJm8HVhjEJBJHFCZIFH7X9CxKRlvls7EB1wy7O41YTPypSqJLXHTbqRMitAnysjxuBYoLqKR8JUCMm2fTmoBpSkZaEJB693qDKrsyErVRF33O6vKm4bv6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at; spf=pass smtp.mailfrom=sigma-star.at; dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b=Rw3leCYU; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b="Rw3leCYU"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49b8687630fso18873575e9.3
        for <devicetree@vger.kernel.org>; Sat, 05 Sep 2026 14:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1788642966; x=1789247766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PlZSpK3Xz/4+7T/z4ljWfbg5RLow9iJYEfMwMkSMVQI=;
        b=Rw3leCYULqubFpsQU4p+wxLQdmvZ3x+qAbapd9nuFrE/KCtNZMqr/UBnZNuyqyNEBb
         q4HxZJ/+vLHMwdw0m94T4jS/ileSpb/EpT1R67b5bLU/qNdD12UuHgc0EMxUIyG4QIVI
         DHA/RHlIpWA5FmyNGEqYQD/X2+MEQ/4EIwi4eZVOw4EGvwqG4lA0WcJx0e4XxKxrXyVd
         pIBfA/SEUY1TN0LkOum9ueotutES9aC8VtbxVRW5e9ucTTdeNeW7JuJX9CIfR6w+zEuP
         21Z29WulWWOOCdy1C9+kJ/M4AvDsDCn712du9UTb4QXnKO/Q9jIVTsOMdR8KCMzHSviY
         EYAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788642966; x=1789247766;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PlZSpK3Xz/4+7T/z4ljWfbg5RLow9iJYEfMwMkSMVQI=;
        b=TdJBH+r4tC1+NcyeII4nKPd2kUn4qJq5JippxyptAY/hDEpYHOuYMFvEqrD7FaG8Fr
         xF7gJHBodGt1S0uKp0kmscfqaWT/0XPGecBR6GNGDbFdZHtxym9eVaqZ6w9t770YCLkW
         RcOZixjOJmQXxgxVFQxX5ftdvxlyHQ+IJ3Dwxi3rzhAFsK+g3Vr6mkbyXt1ez4TgFT1T
         1LrtBRlxS8fSo/FEPzp5P5/oWQK2NaT1kVAwcFsIp4n+TdkKOGuPE05H+cz1ipO3SfzC
         i/ofJrqph0eg5qs0po+p++ZLCUvJcSjpr//r+GfeATAsrL5UuRNt+QCsC76bN/aS0HS5
         8uaQ==
X-Forwarded-Encrypted: i=1; AKwUvBzfyMnV9QGMM9PjQuPzlF1fyqA0PP00Ak0w8KOLXihpGwaKKencZP/dhm02mDEUmYL2Xtx+2HKQHQkT@vger.kernel.org
X-Gm-Message-State: AFuF++mthbEp+Y0wyXinOZUA6FhJ/xGtWKlluKTJZ5jF8yKmnKrdATnT
	4UIsBrDYlBI1oo3EiKJ/QRU2SFeiDopeDsRzCKY0ssEAN6wVUiVvJAy/xgd0+RdmYOI=
X-Gm-Gg: AYBFou0IA66g3Pk0jebU/GzOmdlLzm9CbiJXCmCC6PIMToF/eQ8Qy8syvoetMaJ8pq+
	umdCmnjRCV81VN0eDin409iEZbsriKpbpmy4c0HjSf6n1qn0NGA5VDO/bso01oNyyznWTmY9ipi
	PNYnBg8mxLgmPgYiaC5btYPznxCbeziampNB9TwF1g4dYwf+gF4v5PSQfnrDuz3yz3MwWfNpONA
	Ln+sSrvyzJdPYsbFgpfCK74oze5y4rsaoBkvULCWbZxkhkLZX3uKKGh+jOMgH3MxMNJM0A6rphc
	AdfpMTpD+lpfFuVqTI0wNkz4rM2dbQbTqFYRIIOvkCPEs3Ni0n74Ui1+9FpN2MLYY3zj96Is+XJ
	aTAtef8qShoVqN2jRPxRutbbuvEniFzDjzdh85/OtVyFXTGqKu9XexEEpxaAqUjz6MpYPW29xjQ
	svHz3s3ylUIxmMGf7mXu/MhhsVooOKgJ/M57kJFHwXil9Xdb+hKOQnU+M795hu+bx6RO+UX9Z5+
	lW5I1dGHwF9ZQEN+biSbo9/c1o4fUGu4E9s8MYxK40=
X-Received: by 2002:a05:600c:c1c8:10b0:49c:fa21:e749 with SMTP id 5b1f17b1804b1-49cfa21e8f3mr85554955e9.31.1788642965679;
        Sat, 05 Sep 2026 14:16:05 -0700 (PDT)
Received: from localtoast.fritz.box (clnet-p04-043.ikbnet.co.at. [83.175.81.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5952560sm261416695e9.3.2026.09.05.14.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 14:16:05 -0700 (PDT)
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
To: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	vkoul@kernel.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	johan@kernel.org,
	rogerq@ti.com
Cc: Julian.FRIEDRICH@frequentis.com,
	upstream+omap@sigma-star.at,
	David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: [PATCH v3 0/2] phy: ti: ti-pipe3: allow configuring ACSPCIe TX/RX mode
Date: Sat,  5 Sep 2026 23:15:53 +0200
Message-ID: <20260905211555.15944-1-david.oberhollenzer@sigma-star.at>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch set adds a device tree setting to the PIPE3 PHY for
the reference clock selection of the ACSPCIe clock buffer stage.

The clock buffer can operate in either RX mode (clock pins are input,
recover the clock from the bus) or in TX mode (generate the reference
clock for the bus).

This was tested on a board using a phyCORE-AM57x SoM.

Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>

---
Changes in v3:
 - Cleanup device tree property schema

---
Changes in v2:
 - Add ti vendor prefix to property name
 - Reorder patch set to add the device tree documentation first
 - Add a property description to the device tree schema
 - Add an example to the device tree documentation
 - Make the property exclusive to the PCIe PHY in the device tree schema

---
Sashiko:
 - syscon_regmap_lookup_by_phandle_args() does not return -EPROBE_DEFER,
   there is no broken probe deferral here
 - logging but ignoring a failure of ti_pipe3_acspcie_tx_rx_mode() is
   intentional, following implementations of related properties,
   e.g. dra7xx_pcie_unaligned_memaccess()

---

David Oberhollenzer (2):
  dt-bindings: phy: ti,phy-usb3: Add aspcie reference clock setting
  phy: ti: ti-pipe3: allow configuring ACSPCIe TX/RX mode

 .../devicetree/bindings/phy/ti,phy-usb3.yaml  | 38 +++++++++++++++++++
 drivers/phy/ti/phy-ti-pipe3.c                 | 27 +++++++++++++
 2 files changed, 65 insertions(+)

-- 
2.55.0

