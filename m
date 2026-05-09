Received: from mail-dy1-f193.google.com (mail-dy1-f193.google.com [74.125.82.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B862C1595
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 02:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778293659; cv=none; b=Zj2xrGwssKrEXHbWETRoFapAhz+VMQneofQiWPZ3ydaIHUGROiUSF4fpkwXKCXwwNWwrkfJDIdvWRU6xSlTYP1ue3ho40FKTyu2XCMCUpoR/JqPNdf/IszslG7vqjd5xag4xS8SW9lVeGNLs0bTgJhlBtXaxGCjyL92lEI3/9nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778293659; c=relaxed/simple;
	bh=IgAQRV3Q3aq0oHVCdM+u/7DsWjzM7mluG5CGsC4diZA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dI0+PKCWSjXVKzcnTu0azBCDGM0ih2GVyMH35JJeazw7CT7cp4SAGmxoGBdxsCMQaArcqKJeRr0CKO49/WyGZ8T4Rj8JRY1DTyc/9g/cSGTQmOfCmLxFdRgShqtiaE20pzhQ7Ut5NnzUapD1sjPs/ylkJQNcLNfTO6Y6pWNuS6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qJEr+Ymn; arc=none smtp.client-ip=74.125.82.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qJEr+Ymn"
Received: by mail-dy1-f193.google.com with SMTP id 5a478bee46e88-2f36da5c8fbso2663860eec.0
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 19:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778293656; x=1778898456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kq9J8CDDfMky+oADAgeodMae7ri1gSkXKgoeSxG4RTo=;
        b=qJEr+YmnRqaPGcRAldozWHSG1Whyyls82VSP/GT3jHIuRE5ZL2v4y88MgvqJ+EIlwP
         UlxizdOlWxwqwq1TWpcN6OYOS1iUykr8Es8jectvauhGaTKRcNFPVTM8++hgoDtN6c1Q
         XrdREOpAGU1usWO+Rx2EN8EHxA6HQpPpdkEkNd2vJrXd0gNmD2eQ310LS1M56y/GsluU
         6/LMl7GyqgdCxbOdEMOJnKp9uzrxZANrpPHhz0Guxx6qwokDkqkadajgTqkbx/XmWKVl
         SqxUJPyEBEAc4j/sJr9CZKNLwa6BoX40ITlZIzAIPtaj1J11kgAQdfu8sv1Rh/lpM/M7
         h6Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778293656; x=1778898456;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kq9J8CDDfMky+oADAgeodMae7ri1gSkXKgoeSxG4RTo=;
        b=jyTgpvG2HHXC6MoNScNuLBFmuWXHaoJ1ADpqnF57ey9JFLzUb0CoZ+Zy4oEIT69Qv8
         mCaOeaQGggYvnA01O/DjgDvNcyAPtXXh6AOm+Zyqv1orY154JFD6N/V/us3FD1TgPP6H
         uz2ANBPVBqFxeOtWcNw5rCNCp1Z3TZjHy9JIFyRfSVJllL0rK08MYuVYugXTwXe7u1KZ
         zocAQyJHJCapEdpDXLFv3+ati/IaVYfxSIZRTBIz2dOJh23mBz6AdZj3QltON2PuPsPT
         mLd+UbOelPxiItxETCS8sBT3RPzLahJL73FT795iX4dcK28RCs5OUrVQcsOkjN1MVaKq
         iHIA==
X-Forwarded-Encrypted: i=1; AFNElJ/LAK/tvYM9EDt8eFywMQB2lJGeeUYA52kDxSm4IdHS5G30xBXcnq5j6zVlD2iT/sRz4wCoqGZ+6xd8@vger.kernel.org
X-Gm-Message-State: AOJu0YyoCnpFD6t16VtukLOOzKABoYF36WSJ5gwfudgKQwEJUeTKJX3p
	25q05IPlUX+X0RgVT1b8gytmGJBSeegGvQieI0/E2elzE8jPv6FanjRc
X-Gm-Gg: Acq92OG6DgBYiraW6MmkMicObDYGRbgvG/YGJ0W0rYuQ43wxFYRfYj7YDIrPqN6mlKF
	SGEQgjfiDDwkw/UiEim/ncAbmnqnYMmWR4LKbfwcW8ZGOtKhCGvW+tcKjhIAUf8gg3JY/mvZSOh
	WsoSN8pBDQ+soqmpcklfkYfbbkZ/Yg3A2CeN+jhny6Xa0d8ridCZeDhQto6YQSKF2Ett06ELW2k
	WB5vURtNe2UAoijoynCafP8yZ7E/xSDs71TIJlsLtJZALteiITMjT0wpSBCvH8AqqTJJRKD3JN4
	tGtgKxaIiu2oH/xEBhUf1XZDXXYVSQhDZYDPyapeGSPnYGx1f8ypFA2TMC/eKlxyh6yzKLSaLD1
	3HAP2i5UPWiLthjjr3DA0egjIGWqotD054XM430OXoNuFxN+VwSMwRdJkTQAbn3epUKoqTYcuTl
	frS2rqOWQBetrO4Dv0OsOfpZIZpyPMkCXg+sNazGQLU7wMIiWXCYIgcmqCGkf7Athe9w==
X-Received: by 2002:a05:693c:3b0a:b0:2ea:b975:3db1 with SMTP id 5a478bee46e88-2fb4dc6422dmr290307eec.23.1778293655670;
        Fri, 08 May 2026 19:27:35 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f88924af95sm4689640eec.30.2026.05.08.19.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 19:27:35 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: lars@metafoo.de,
	Michael.Hennerich@analog.com,
	jic23@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v3 0/1] dt-bindings: iio: adc: add AD7816/AD7817/AD7818 binding
Date: Sat,  9 May 2026 02:27:17 +0000
Message-Id: <20260509022718.82957-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v3:
- Fix commit message based on input from Sanjay Chitroda

Changes in v2:
- Fix commit message to match binding requirements

Hungyu Lin (1):
  dt-bindings: iio: adc: add AD7816/AD7817/AD7818 binding

 .../bindings/iio/adc/adi,ad7816.yaml          | 94 +++++++++++++++++++
 1 file changed, 94 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/adi,ad7816.yaml

-- 
2.34.1

