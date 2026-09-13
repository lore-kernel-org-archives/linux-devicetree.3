Received: from mail-wm2-f10.google.com (mail-wm2-f10.google.com [74.125.225.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8F8385D9D
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 08:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789289633; cv=none; b=UDAsxLBWMBOCb4sQRlD41aiYxsXbpLpI5nKu4ypibv5fkziPwpN7nP1jVNTZTq9Rt3ek57mKYgw4VYJyR/tsldpU1EX6HlFPqiC14u7gtcp/tAS7fXnygaRr3y09E4IJ57IdIs+0j5QznIcQaPNpRntGIN97kPYeqWES/n0Quh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789289633; c=relaxed/simple;
	bh=8tYMLwTuWe8fYcGR09huCcpUaAb1MgVXwJPlzqSxY1I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qUTIxAuEMPJCNIfoXdIWRI2PeSGAhBLn9yoa6CCRekx3Q13hLjgSbb0A8VVxUYZaQUFs5IOdojzh3Xe98JrJl3UUMBQtquIGcfpfqduh1EaeXQud0o8ZY1lBnkxB1LGi/e6tSM17chVpXzYaEI6oRKevlC8dvr5UXDBTlpv4iDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WTx9s3pW; arc=none smtp.client-ip=74.125.225.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WTx9s3pW"
Received: by mail-wm2-f10.google.com with SMTP id 5b1f17b1804b1-49b963f51f6so8517465e9.1
        for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 01:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789289629; x=1789894429; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KSDgB+q40G0XD7B1gkgkSaOt7eTVxj8YhAlhk59D7iE=;
        b=WTx9s3pWY47qIOcvPnHGGFCYz+nqJ8h9z/Oa3CekhHIOthQR5BbCDjzNbwgGvWZ1fI
         mo6nSunbTUgvo7wwq2Gpk1knzjK+dWbNkKaWozaLgvDqjxmew0TfTlrGyRxTuRP4eCA0
         L1c5vBNt8XJuvXsQghs2ogoAMpQCrjNblqTHEbyVDJamSiv0GSZkNdiCuFTWIv2OSgpB
         HasisYFFafil2ybmgRQZIHbqnDyyIWmJsefWMIgpG/Xink/F1LwaYVmi46tM83o8dpqM
         DKDOf+2/PlC57mLIAtbRIxl2pMIrjknHCRaNnE0mLmAJNxjupfVDHMZNIlLah1v9G+Kq
         xk+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789289629; x=1789894429;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KSDgB+q40G0XD7B1gkgkSaOt7eTVxj8YhAlhk59D7iE=;
        b=nFXBb8qPuQ+qPstFPN4y6alDlCthFNq3pdw3LBqfuV3HvB73cJZJcKGAJtDj5qipCZ
         kpzeONtnRLhgPDZPTShcJzNcxN1fed0YwP2NV3IAKuPrd+b7DqzhS7MJb8Xlek0Pc52L
         8cyKtWdmiqtTe4NQ9FG71sssPr6kle+Ojm57POl1ZjKr/X8EiNPF9xNkg/svNIvbLOda
         lRudwfmxKaaRg1UggDyf73uDqwcgs0QMK5cC4kq1aaAr4OhpPEy7kJRkQwBr4UwgBf4A
         mpZ8MG44YZPMpeWoV5ZFDhqUvNEeVX0vUhgHSKFUUmu+GpD8sxHKUzgqckxBe3JMxkRV
         D/kw==
X-Forwarded-Encrypted: i=1; AKwUvBz8ljIrOvJaw38UQaTS2sWs16N/KTEsN29rl/nZ94Qrj9NHvo/m5VNJAwmt5yUfZZMlJVfjJhS0J5Gy@vger.kernel.org
X-Gm-Message-State: AFuF++kIIiwi5I9NuXoWsQeFym/s2lFP8NLlwpe7EM0PbELU8jkeAeM5
	vVT6OslW9RpmJdAn+NwTasF78DEexa2XlLWGe8FL+DeA6x64GHKZrO0s
X-Gm-Gg: AYBFou3TwqcQEEIXnjQ4yPSHkVYzULgwTLEX6NeIRg9EPmKi50X15OgPaFbqBjPhKxx
	pXms4jmWg16HzqH6HgFMAf81CQd9zCUwa5rUzqqax/ot5ek9LDotphaqTAHRK8E1YkNaBMDN4Hg
	kfunWgwXW+17oFrznayPMPuHO72WrFSuUVH/TaNfBEOmInq8HDxhukqr6tPfIeKoPxvqwQjmt5X
	IB9UVsjQon85Kwj65VDhVVTGOOru9hG772z1yc2mQInmJFHmANvZawfAXFCnqSTK9Dm2nysHH2p
	jl9n9ZmMH1vgbrr5n3VOpC/TzoRbPRwTucWN40EDeRH2qlvkUiqyGgN+hlX/4ZWRxDOMZIT6J2I
	aSFRWzpleil0c76gd9sInHv+pPj7AYvIQx/9qXZ4wm4Ud0zusuxRmjilo72BNBy7Y/Gzx/KtU5x
	WYup7ijREiY4DjxRFkl98MrBQg86WCNwj6mpeldDOWjASUbUVQ0dgJjsfT2Hs2JhyWf4yh1ahK5
	ccOXzgfAJUbNUVYJTc=
X-Received: by 2002:a05:6000:4024:b0:486:f4cf:59b2 with SMTP id ffacd0b85a97d-486f4cf59c0mr7888496f8f.4.1789289628683;
        Sun, 13 Sep 2026 01:53:48 -0700 (PDT)
Received: from DESKTOP-M0MLFVC.localdomain ([165.99.41.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32e7f5sm18228489f8f.9.2026.09.13.01.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 01:53:48 -0700 (PDT)
From: Shehryar Ahmad <shehryar.amd@gmail.com>
To: jic23@kernel.org
Cc: nuno.sa@analog.com,
	Michael.Hennerich@analog.com,
	dlechner@baylibre.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	gregkh@linuxfoundation.org,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	devicetree@vger.kernel.org,
	Shehryar Ahmad <shehryar.amd@gmail.com>
Subject: [PATCH v2 0/6] iio: accel: merge adis16203 into mainline adis16201 and remove from staging
Date: Sun, 13 Sep 2026 13:53:01 +0500
Message-ID: <20260913085307.13846-1-shehryar.amd@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This v2 series addresses review feedbacks on the previous attempt to
move ADIS16203 from staging into the mainline ADIS16201 driver [1].

Key changes from v1:
- Introduced adis16201_chip_info and adis16201_state infrastructure
- Added SPI and OF device ID tables with proper MODULE_DEVICE_TABLE
- Fixed adis_data stack lifetime issue in probe
- Fixed IIO_CHAN_SOFT_TIMESTAMP index collision in adis16203_channels

Patches 5 and 6 carry Reviewed-by tags from prior review.

[1] https://lore.kernel.org/all/20260831184201.34416-1-shehryar.amd@gmail.com/

Shehryar Ahmad (6):
  iio: accel: adis16201: add SPI device ID table
  iio: accel: adis16201: add OF device ID table
  iio: accel: adis16201: prepare driver to support additional parts
  iio: accel: adis16201: add ADIS16203 support
  staging: iio: accel: remove adis16203, merged into mainline adis16201
    driver
  dt-bindings: iio: accel: adi,adis16201: add adis16203 compatible

 .../bindings/iio/accel/adi,adis16201.yaml     |   6 +-
 drivers/iio/accel/Kconfig                     |   6 +-
 drivers/iio/accel/adis16201.c                 | 123 +++++--
 drivers/staging/iio/Kconfig                   |   1 -
 drivers/staging/iio/Makefile                  |   1 -
 drivers/staging/iio/accel/Kconfig             |  19 --
 drivers/staging/iio/accel/Makefile            |   6 -
 drivers/staging/iio/accel/adis16203.c         | 315 ------------------
 8 files changed, 106 insertions(+), 371 deletions(-)
 delete mode 100644 drivers/staging/iio/accel/Kconfig
 delete mode 100644 drivers/staging/iio/accel/Makefile
 delete mode 100644 drivers/staging/iio/accel/adis16203.c

-- 
2.43.0

