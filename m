Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83764CCDFB
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 18:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788201956; cv=none; b=VEdhEPDAZr2Oss5OzQlgEg9h4wwkFSMh1XyruqwEkOjyX4T9a57rsOJn+GANunAhOZ1dVAvcRl/5YWW9HNF6m9oiKHYHnIHDFV1wThe1vdDMOhQ614OvgexI2hbMq4ru1vCOUjnurNtfNgNwu/MagehljvyCgF6gTAN6pXnPnSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788201956; c=relaxed/simple;
	bh=gOdMOlsXmXX38oBAS7XFGOJoRmhlChqbGSNBwd2N6Gs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IXo0t2JTdZuQONbkOjlIghGpkcuoKn7BN1mvkMfcY1fmulWoKitsdvHnUqsyq3WZgNBPoZmSCLHxqfwQhr8AL4ddVm5cowa/v2s6bpaWqURwM5Mm0JOUrS4TQ8fK69oHmSy6Z5Qh1XTg1WIifvVp1XYTEa0erWN8YYOvdSMdXRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TwOL3DIL; arc=none smtp.client-ip=74.125.227.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TwOL3DIL"
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-398a0a87595so72450a91.1
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 11:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788201954; x=1788806754; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ibz8/jF/Lx7KPFMOOYUTs3vW1cvNeIhgyAw0sqrv9B8=;
        b=TwOL3DILeFBFevjvOYeNxYo5LG+gCCxQZQxM7jAFKBgEwz9nWzE68ounWDKemSDkAw
         Wuw7WZmId+cUatZO7WNPsQ1AiGr3pH+el1fZwpsXTI+TA9Hr2Eh9lOMS4W1qR9UEW/9d
         ulXnEcSz3hOQP55ZOlYlvrW7/Rk2ofTYJazuQJelf+0TGuw8q2jiYxjYXaReu6pKrCt7
         CUlfoSZOfEy95DT7Q47c7FDthS7ua2AlObcxzwtc5MD7l0BWGE7GrGvv5g9D3KCIF1dV
         8rS/NN++nlyRzYumfOdup7VnFojshibUcK+MvYUzbPk6Xr/t9hZ5wtNqzOaq50jqCmku
         dIAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788201954; x=1788806754;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ibz8/jF/Lx7KPFMOOYUTs3vW1cvNeIhgyAw0sqrv9B8=;
        b=tB/kLpfhfo/U5Vmxes37KnnXDOEW0ni0yyiGd3uI9CNvg5dtLaV3X5bHV3wByf+i0U
         xvZdQcvXIWtjZKQLTyrC7I3HcbT69pUSSdilEPdwGTho6CwI15zaShKyqiV4oKAp1Qtz
         86d3nqPCufBzPtxOTzoY2WWR/Ua1gQNeLNoygnzX4eoKwj2YC5NxJRyEn/sH2sToKXlb
         lsnuJOGvnPIFs4i+e9Fl8RvsfgT0V6CwRNRmXEAblwtvnV7cs/EQ00SN1FDwhTdstY8Y
         eHVVLDldzroONlOXPeK9QlohgMMvT7kx6WhXfRgmhz5RmBra6+i3yoXl5Is0fjJMLX37
         BBxA==
X-Forwarded-Encrypted: i=1; AKwUvBz2JCVjhvhLhC0deRBTs0ZxM7bpL3Wi2jQG7Yye3578cvbguSiPgYuc3Xb/FjwPLuRogPK7LpJRuoI0@vger.kernel.org
X-Gm-Message-State: AFuF++l7Sr5G3UnIomB5MB8WdQT+kSqiNEx2vZYoqeMfpt2wPS81HGGz
	Vi5KEVN+3f6UZhXZexAgm6JLsaAcyO0RztV54zWhif6ntC7jtYSHWfe5
X-Gm-Gg: AYBFou2LPV1FTicZLH4rSW7uT3uXRD45UJwtrDWblob8me1FxyKsAsLAxgAi1qZ5HGZ
	uePgiVGVNULXRi/5GAeMzRSwzHYEAeWzkDsnUq9c7nR/6mPRCvPEu0rHVORmxYG9011jhvjv+N8
	G/FW+Wl+9SDPKP4HaVNJy4UXb7FC+JLiW4xN9bEH6yj3Jc55tz1ts1fZcgSU63pCY5L8KxeHVRP
	0Oui4mQPkQMRaTjenflEGspDCl++jQQ7qBal0dVDtr3hquQCagDEIkvpGhhamXrcaEzVesx1KjO
	JAzG/3HOUH5XQoevJqEKLymFF5IZnDWwgbf55/zEybcol8IzCfBiFDCcAy7lGkPz3aLPwjd1PzQ
	ANsj9Spooyb4dUXaMQ92/Dhlrq+yF7nBjCs5Jqjuiwwud44TUKqqRHUWGyKkErPZJLoMJOjnkZZ
	SHGeiZ3C7VpX/n/uf3Z73EvMv5ldmG2I1bEwrq/YVzMo7HWu6H2nof1APwaPgfImRFw91Co88uA
	yWdhOM4
X-Received: by 2002:a17:90a:4cc2:b0:396:d27b:89b9 with SMTP id 98e67ed59e1d1-396d27bb20fmr21407728a91.10.1788201954154;
        Mon, 31 Aug 2026 11:45:54 -0700 (PDT)
Received: from DESKTOP-M0MLFVC.localdomain ([165.99.41.159])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0dc854dsm29459223c88.10.2026.08.31.11.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:45:53 -0700 (PDT)
From: Shehryar Ahmad <shehryar.amd@gmail.com>
To: jic23@kernel.org
Cc: nuno.sa@analog.com,
	Michael.Hennerich@analog.com,
	dlechner@baylibre.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	devicetree@vger.kernel.org,
	marcelo.schmitt1@gmail.com,
	danascape@gmail.com,
	Shehryar Ahmad <shehryar.amd@gmail.com>
Subject: [PATCH 0/3] iio: accel: merge adis16203 into mainline adis16201 and remove from staging
Date: Mon, 31 Aug 2026 23:41:58 +0500
Message-ID: <20260831184201.34416-1-shehryar.amd@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series merges the adis16203 staging driver into the mainline
adis16201 driver and removes staging copy. Following discussion at [1].

Register addresses are identical between both parts (SUPPLY_OUT,
AUX_ADC, TEMP_OUT, inclination regs all match). Pin config is identical
too, all 16 pins, same names/types (Table 5, both datasheets). SPI
protocol is identical as well (Figure 3, both datasheets, Phase = 1,
Polarity = 1). adis16203's second (180-degree) inclination channel is
dropped, since userspace can trivially compute it from the first channel
anyway.[2]

Differences between chips selected per-device via a new struct
differ_info, picked in probe() off of_device_id match, same pattern as
adis16475.c, similar thing in adis16480 but different mechanism.

Don't have hardware for either part, only tested locally with KUnit that
the sign_extend32 and SCALE/OFFSET paths of real read_raw behave
correctly for both chips. Register read/write and probe aren't tested.

Patch 3's binding content is unchanged from [3].

If this isn't the right direction, guidance would be appreciated.

Link: https://lore.kernel.org/all/20250308144239.0442f1a7@jic23-huawei/
Link: https://lore.kernel.org/linux-iio/20180204163124.67234ae5@archlinux/
Link: https://lore.kernel.org/all/20260812043506.456ced6d@jic23-huawei/

Shehryar Ahmad (3):
  iio: accel: adis16201: merge adis16203 support from staging
  staging: iio: accel: remove adis16203, merged into mainline adis16201
    driver
  dt-bindings: iio: accel: adi,adis16201: add adis16203 compatible

 .../bindings/iio/accel/adi,adis16201.yaml     |   6 +-
 drivers/iio/accel/adis16201.c                 | 289 +++++++++-------
 drivers/staging/iio/Kconfig                   |   1 -
 drivers/staging/iio/Makefile                  |   1 -
 drivers/staging/iio/accel/Kconfig             |  19 --
 drivers/staging/iio/accel/Makefile            |   6 -
 drivers/staging/iio/accel/adis16203.c         | 315 ------------------
 7 files changed, 178 insertions(+), 459 deletions(-)
 delete mode 100644 drivers/staging/iio/accel/Kconfig
 delete mode 100644 drivers/staging/iio/accel/Makefile
 delete mode 100644 drivers/staging/iio/accel/adis16203.c

-- 
2.43.0

