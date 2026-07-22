Received: from mail-qv1-f100.google.com (mail-qv1-f100.google.com [209.85.219.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE7B3CFF66
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 21:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784754863; cv=none; b=OfjpRAhqM4SguD+okA1/CiGux2DNcuZxmzVLGSN+7x2SLwW2cAZZVytdAlt2j2bpJvqQHM/CSwr/7G+ABdL8GnOpQz58KyyUChQs489N5K+UYRk7QcJtR2+6N72zwSYFMX0teCQCYsAsQ2Jw5jrxj5kAqgWrk/pNL5bAJQllmSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784754863; c=relaxed/simple;
	bh=oJnIH0MtAzAIGJzqiw1ldDwDrauYNCmdAhG67LsyA04=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EUPS4qWGN6j8u1NbKG4mj1TfNUvtXApSptxGY51eWPZMOOrhB49v/h2ENHrskRhHEqw07gFHmAw4qDR5m/4tGyUwIJ+qoU6sarqAXn+U8H2ssWWuzyHK1a2drgD5OUhJI3bRMo9yEnx703fsZqFDc+xAzejkq5z/dnHacDKk+oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=cbHqQscw; arc=none smtp.client-ip=209.85.219.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="cbHqQscw"
Received: by mail-qv1-f100.google.com with SMTP id 6a1803df08f44-8edda5d56a5so142542286d6.3
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 14:14:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784754861; x=1785359661;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XNV5oaBeVpbugjgZQ41Bj0CNzlC166ofdHQsjDEoBTA=;
        b=p/H5fCeT2j2GlMLEfjO8ITouskC/JSi+yHv2iKGHEHC7pTaF2dTuTFx2Gtq5Y5Bgz4
         LK95fpX74RVXKD4sUoC5bYNtnIEDYdae+GTZqOVTlUmhI0CzSGDYsOSQN3UBMJIkdNhm
         XG84Af8TsweplshV3cu+xxJfuPENNvQvGOmXgROTJkQGT5K9LGiGZv7O31v9q0Qmv8rE
         AMBymgpGSZcYuPozrLtaVpENSG33OW16HOOj0QlS1Y7WeCRYPx8B+UgzefaOR5inASb7
         uQ1N6fq5Ufew69Rn2PBgktMOxnupWABU3JBKscP0NjA6nL3HE0hluuC1h2qViUsj7TYY
         5DZw==
X-Forwarded-Encrypted: i=1; AHgh+Rpxzqs7V52KkbrZsUy65c2vX2InOq63CvaSE36pFMabOPcA3N+dGEJd9724UDOYmRSrZRl+eDXOP6AT@vger.kernel.org
X-Gm-Message-State: AOJu0YyXcRDOkcxZX6aWr+pryL9n+I6Od3SMCrLXKYwkOCg4i94jlRIa
	unvbDXd2WSTPAXxPQx03PO54V8oERDx1aYyqLiQ4PrtaWKghvj4ERBSsgr6Qedzv4QXwjd1gAeU
	CdAcLCuH4isZZTLt40j1UmScWbMg7ZRPzShmofDHd8nOTAl1MekII0dh6WJYg4Ss3pnk8tHzWjQ
	KX1qs/EXvcSDlWT3OoRED1izY8uRTLvxjUhSopHjIFFZFXe0XRoIiRGycDFt0p0cFiXHION7xJc
	tAEbFTdlJCX+A==
X-Gm-Gg: AR+sD10rGL+OZ05423hSSFZ9yJ10DA3iImy7izlihX+GdizEg62tmcZBW361D8DlHRG
	bsNDwVLlL1jBYnTvkl+MCgBP0ePGyXfhmCq5q58W+UbxOPHZmajYzhkOwb0LGUp/PhWOc+beVUn
	JtLumizW9mj/5k6dfuAFmev2Z86iTYlCPH483s8Q1m+7pRNW17XfsC7xKiA/JoPUqM6ogJd+jOk
	Jp3UQfypPoT8FwW79S02BFWtiiiMKnOdJNWxFnGkFYhE6UjzizGn2zdWUwSxc5uCLPVV+j9XrZ/
	deKN4dNnEQDwmQJd6ozVrVi4FDHgpqJRW+LVXdzR+v/cnvczIOyVd7A3FVjdWUVPUcgw+cHFvcN
	phN1cdmv0iwhyy+5TeYaTX/tUrYXiv1ziwuAsRzD1Y+iq7Nd1aIxPRIPWp+pSOMnglTH6vyvgGc
	1xm+gdGCmiokR3CTP/tQHzEYL2fIn3b2c+
X-Received: by 2002:a05:6214:2243:b0:8ef:24e9:4258 with SMTP id 6a1803df08f44-907ca3562d4mr7450056d6.39.1784754861184;
        Wed, 22 Jul 2026 14:14:21 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-907baa270d3sm2194916d6.28.2026.07.22.14.14.20
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 Jul 2026 14:14:21 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e6ed4fe99so2956625985a.0
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 14:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1784754860; x=1785359660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XNV5oaBeVpbugjgZQ41Bj0CNzlC166ofdHQsjDEoBTA=;
        b=cbHqQscwn5K+fklloam3qISVIFryElrZpy4OTjQAY3kTCVjAxCL0Wj/mKYd/5xcXkV
         QVoxoSHfLnCMfTZSoBhnCoG2Sutnkue9PLLbNRYlYILG5UVdP7bSm4DcHgy+f1FIFaNP
         jEZX/6nYITirbDY3kAPvYg05SUoKpqxXsmbU0=
X-Forwarded-Encrypted: i=1; AHgh+RrP86rFTwv0VxbgfDaaMle4Qc+dj/g/pI68NyFF83NXCm/ZrAPyPfky15g2Aybb+djwFL5FpIBBQIDX@vger.kernel.org
X-Received: by 2002:a05:620a:4043:b0:92e:c118:18b5 with SMTP id af79cd13be357-93103b4cdf1mr33078885a.84.1784754860124;
        Wed, 22 Jul 2026 14:14:20 -0700 (PDT)
X-Received: by 2002:a05:620a:4043:b0:92e:c118:18b5 with SMTP id af79cd13be357-93103b4cdf1mr33075385a.84.1784754859567;
        Wed, 22 Jul 2026 14:14:19 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930f68a7fffsm253004785a.11.2026.07.22.14.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 14:14:19 -0700 (PDT)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Kamal Dasu <kamal.dasu@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Avri Altman <avri.altman@sandisk.com>,
	Pedro Demarchi Gomes <pedrodemargomes@gmail.com>,
	Erick Shepherd <erick.shepherd@ni.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] mmc: core: Keep the card powered across suspend when firmware needs it live
Date: Wed, 22 Jul 2026 17:14:15 -0400
Message-Id: <20260722211417.3702709-1-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

This is v3, following Ulf's review of v2:

  Link: https://lore.kernel.org/r/20260413180551.3683969-1-florian.fainelli@broadcom.com/

Background: on brcmstb boards with a Kioxia 016G01 eMMC, firmware
accesses the card directly during resume from Suspend-to-DRAM, before
the kernel's own resume path runs, in order to load boot code using
hard wired logic that is not field updatable. The card needs to stay
powered and responsive for that access to succeed.

Changes in v3:
  - Reworked the fix in _mmc_suspend() (drivers/mmc/core/mmc.c) to
    skip the poweroff-notify/sleep/power-off sequence entirely.
  - Renamed no-mmc-sleep/MMC_CAP2_NO_SLEEP_CMD to
    no-mmc-poweroff-suspend/MMC_CAP2_NO_POWEROFF_SUSPEND.

Changes in v2:
  - Replaced v1's card-level MMC_QUIRK_BROKEN_SLEEP quirk with a host
    capability and matching DT property, per Ulf's suggestion.
  - Added Reported-by/Closes tags crediting Florian.

Kamal Dasu (2):
  dt-bindings: mmc: Document no-mmc-poweroff-suspend property
  mmc: core: Add MMC_CAP2_NO_POWEROFF_SUSPEND host capability

 .../bindings/mmc/mmc-controller-common.yaml       | 10 ++++++++++
 drivers/mmc/core/host.c                           |  2 ++
 drivers/mmc/core/mmc.c                            | 15 +++++++++++++++
 include/linux/mmc/host.h                          |  1 +
 4 files changed, 28 insertions(+)

-- 
2.34.1

