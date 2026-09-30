Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BC044F551
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 07:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790752537; cv=none; b=T9PYHdpVk6BiHsA46O5t7wb0RHhtJ9Wdkp78RPJUJhy/T5da2+hTiz1chO/ND+a/Zogq9sfGgtMLCqzZRGrTVdZgwNB2rlNvYTQyAn9IVtlPOFGWBT0pdbCP+a5ov0D1zIEzwZ5EZnoO3Q5P/PLldFjSDlsSwOBGQsSVEgWa4ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790752537; c=relaxed/simple;
	bh=9++OyGSJWEwT7/ctMO79NTROZZy/+9e80noaO28S9RA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IZM17bLV9WMcjqlZJu0owBbR2IQNXAoj0bgsR5gJssrpsHs+WrexQRYaEeh/5BfaSM6k8SUxets9lWZFdrra1FrIloIPjHCRQ+xMIJhPCNAbPWRkbRgmh9qaXfxcvDysWLhPezg7gTR0TN4rGFffQ4JBBsnS6b6ap8XO8Kzhapk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iO9Wd7u+; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iO9Wd7u+"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4885a1480a2so2951481f8f.3
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 00:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790752524; x=1791357324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2prECYlfUYJhHJY0ODA9AKxpvoyiJexfpX9S3WhkkKk=;
        b=iO9Wd7u+iqFXWGwmmsFge8nvX5Dvm3a/mif3zcYO03V6O3bEOxLoC8OONh2/XPzK4z
         k2HqKqPfP6H4gltXcEw5xt2nkL4ffhFNFpwhrARCmgIlZSfEVC+DkMw1Fhil8AOkMrkH
         dh3Zjy6NzZv4ppdWKUA5MfiPAKiQ/Od2eA/sKqewVoOKyNdYsiuYO4LLjBhASMVa0cSK
         3GDFMZfaN5zz/vPMcYHbyVXtTJMlQ3U+fZEMykzwFtw9Fi/FuLMm4ncENuP0l/CQ2pvI
         Qb39/faltsngUCqBf2wbRvwxmuGHlOLOK1vJ5pt+a83YHM0Z+O7A5jgZTKvb372ENKsb
         83MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790752524; x=1791357324;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2prECYlfUYJhHJY0ODA9AKxpvoyiJexfpX9S3WhkkKk=;
        b=0FThVT3o1l7ceoK9NIyqnxjNi2OoJ4pmhEr/ritLyXj/2uTXLVj5n4i29Muk0Ioynq
         QsI05odY3iiM9T8LxIZWX57mLXNHV5Vh9lYrXrQWle4mFB3IHhpHHGuBlKMV4RLTGzsb
         88aJHbCA5an9XCZ4LUIABZqPeN7FD8rhPYtRlilb8yktk3wDKh07EHRxDgJmOgBiuD01
         FLTx1vIaUkFqwSq0RxKG8i204dqLxXKYIzUs947E3zGkjGo0ILNcRQq5YjB21zSMx0eV
         MUzCiofrSQ+RGlGFKkJYtjBrtLY/2TvKoMggctdV6pN+W+EOM8fNFccm/SF44zYLpAx+
         JCyQ==
X-Forwarded-Encrypted: i=1; AKwUvBznvPUQBzUEonQHCwtUt+4sO0NVrkNfffc4ghqoek9jfRGFKe/GXXE5C6t96bjaeYl7TuR7l9iCjbjK@vger.kernel.org
X-Gm-Message-State: AFuF++kKGAxkrFXRUkbAAbqns/uLNBmVJbJf46yAF6Eb2l+ewdys0b0c
	jdBBiv7J9yL0DPef40zTfJ+JHraUUIbdEE+rini4ecZs/JfkHxkPXyQO
X-Gm-Gg: AYBFou2Q7uXuHbgd7E+qhuf7igFVN4rnT1V7cxpJH7+/wsKGTwcqvEMyjOPWQem6P72
	mRMfeDBMmdqnl1WvlEez+0XdDU+C6J2aUcIZK8DltpuzaMHEGZahbjWs8kluWjfSnbqbckpkjv3
	/Ox6pdX5vv6RgCEwCqJtnBppkpdef5t7KmhrQ2XJR+p+mP+MSCsVeS6U9P748QPVVA9oW7ZiSPl
	kH4VF1iVXy1Um1ux5LkYppWhJB50G+fCOvtmVhzARaRB58r+1TxixKQ4YoryYc4tFEtlUCQA3vu
	5rq1l9VKPov01gQdd1dxmLg8tSP0pGOkBTt0n5MtIwovEJKm/My2MPaiLbiJ6+4W55xUfkaz5YM
	awIDHm3iUWe++NxaN0VlssuUF8PArUUOX2bDFUEyuiqmfNIPWP5SF8arAcAGalt3ETRgJfboUx2
	bnB6dzzPzoGaSBdGvdOX9kKd8dUPWheHKRvSa/fhVbzRGXg94qjPUNuAuvuLuukLFTdJMded+7y
	7rQb5Iq2dd9EgWea50t
X-Received: by 2002:a05:600c:8b08:b0:4a0:4a8:d444 with SMTP id 5b1f17b1804b1-4a01b00226dmr7192805e9.33.1790752523915;
        Wed, 30 Sep 2026 00:15:23 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b029be7e4sm1256979f8f.12.2026.09.30.00.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:15:23 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v1 0/3] mfd: aat2870: Convert to use OF bindings
Date: Wed, 30 Sep 2026 10:15:10 +0300
Message-ID: <20260930071513.54697-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document Skyworks AAT2870 into schema, convert existing driver to
use OF bindings and remove platform data, add support for
in-supplies.

Svyatoslav Ryhel (3):
  dt-bindings: mfd: Document Skyworks AAT2870
  mfd: aat2870: Convert to use OF bindings
  mfd: aat2870: Add support for VIN and IN-LDO power supplies

 .../bindings/leds/skyworks,aat2870.yaml       | 127 ++++++++++++++++++
 drivers/mfd/aat2870-core.c                    | 120 +++++------------
 drivers/regulator/aat2870-regulator.c         |  71 +++++++---
 drivers/video/backlight/aat2870_bl.c          |  54 ++++----
 include/linux/mfd/aat2870.h                   |  95 +------------
 5 files changed, 237 insertions(+), 230 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/skyworks,aat2870.yaml

-- 
2.53.0

