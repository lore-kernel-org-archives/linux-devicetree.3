Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792506704;
	b=NTKcifG2nco2vpW2blj6JPLZ9JyYcfIO69dVlIp5NwW6JPGV5v3N28nFvGnuWYFNSe5X
	 chypBvuB5vtDNjuyLU3M7v7VO4cZ96RveUmwoMNA48PmRoG41UyCdIMn+nVEeIPis8Cvl
	 jG/JxmNoDmUMhI/UmE/Jloteq875vCcyWptw0mv3v6hu2OlWmJSvMaCgSs+8zb2PAZScC
	 O7gJApBLRr6W9Bf0QdDb6eLLj+xodnveLRhSIxmlAYM3sBCQyivEow6JbLBmpMkwM7K2B
	 pEoHE1V23HCDfMBbJszHJG+jd5iGKMmg25+sR0pR+nTj+MeWg0oG5BliSGDDgF3bCAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792506704;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=79PDGBo/ROKE02Uy/sJRxhzs3FckYw8dDZ3wx3mZFZI=;
	b=TOKMxpKShX/750AM7pd4dMOx5XD5jWg8s3SO9XFbMtO1NFQ1TQiihjpYuQ0ecSd6BFWR
	 PM7grvGKpB0A99uEOh6cYh8HlXaa6H4unpvCrKGyEu+wyB3BLLuzvZJbywlpPQm49YOaa
	 A++g9tWjSy0nHVfHk/C249pGgG+EQvcTi9tVMTHFu4SE/oB37V3vUSf8FrHe7JAwgH3wt
	 jxX7w4ldmpHG0gYdAFbyjnYF2ngUvZhFVhoee4JbMRYjDvQVDSjSxXVe2x6OiSdiHfHTn
	 HGjNyUVViZunQ9dHB/+PFl+eNTgbRTCVwkmD0k7XT/piUq25UmMqo98qWisNA3VE/KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="oM4d/Kri";
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0450A606A31B
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 14:31:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0450A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oM4d/Kri
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8520161fdb9so1904651b3a.3
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 07:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792506703; x=1793111503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=79PDGBo/ROKE02Uy/sJRxhzs3FckYw8dDZ3wx3mZFZI=;
        b=oM4d/KriHS1CJeZrfVsVM/Ncn0aQPYiCz2FhG+VV75PK5Y75SD43lvlsP1cSSU5nVc
         FOmJfIjRRnat8deDz/Qkl5JdnDDizXXVqRzBbG2m5nO6ck5HOtuISAckWiVgpMDjmyuH
         Fkn+Zg8kmhU44YsoFNDczzMhr2Ipz4GZz1v3fUxQ5Vfk3JRNnkw7daNmI8wlYAd0/uFi
         mYf+Ijnnq7LRIuUpMaKV6ZrCj2sMR19xn0Sn/BEFMoMYr9R7PWfpqqdrDtiKfcldO9B5
         0g3yjuZIoKjKxLHYSO3WrqyswQov8l6R7xooPimWzKc6KRroVj7ydb7fC50UbI8ki7EG
         mkdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792506703; x=1793111503;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=79PDGBo/ROKE02Uy/sJRxhzs3FckYw8dDZ3wx3mZFZI=;
        b=lcvVUq00S6x9olh2Mr0DlSuWMv8RUbs+lXBEoEtggXjJ7NtarkwTsOo6aiO4hNKcpD
         R3U2eYwpgLEwtGM/ZXQsyNh7ycmm97nRDyLGPL/1LWTnjPB5EtCoQlAcXODMfgyJ+vvn
         XYS6H1AQHsRrJsgYtsU6bz7QTsV3CUhhRe372MH721pBUeYh43j3q8RV005lnHVZyf6r
         GUJ/Iw3C11UPpuhzthVmJgOSBAJRNRCawX55pdK0Usu7UOLSGMAB7NjbKlLYd8lSz/fl
         WRUl5xHBLVq+9aaN6FGLPIkdo7KsrXTenmGLIBrtHzsjaZNUD/7jPkH7EWC/Rxo+ZlIC
         u+NA==
X-Forwarded-Encrypted: i=1; AKwUvBxkcmawb0Am3KQls3MCHrGxYGC3LjUoEl9S+ik4azD9Zty2MO4w9nvetxqrx5LvUpM2pQ2izlp6oyEC@vger.kernel.org
X-Gm-Message-State: AFq9FYLnMgUgTpKpOZWpLn4xdplhGHSrrrI7Z4wxLyYjwg0Mok7ssFGf
	s5LiUBTDiCTP+7e/CkWSp5mIOA7rM5VswPXF5RCLKm4Z8g2i5d7HopNO
X-Gm-Gg: AYBFou2EQpTgQ8MnkIQPPvQ0wTUml+3VMBdD4oaWDwOaNFFU0mA//HQhieeUDk1e6U7
	Ujqp+KksTQUEm3zCork3wCp4nKkMDBFzP7ugmiDR31ZdUKUnP9FzOcE0FHPgfkm2IuKw3p9GO3c
	DPphVWViG3L/9MyJAjK1eH/4Byz+3yANf9eFK0KrzFl6qCMTDzzKz1yYsna08JrT98CL+7HGBhF
	6xjr/G8SPwJq+k/m7hadXcH94ZjHkzShpzEdqohroXXchZHD0QdX+nA68kIJ4HPYeb7TuK4QjB4
	WRPF2x0Ihf/srk5ub5TVBmD11V4EGUAlJSAAm37YDRMFC4S3AExmLNQaZzOiAt2ElYjjLUp20ZV
	3cB4EmHieZ3XwisxuOP1FxMiOQhXznHcpjK8sN0NrElsj3VVxS4pJ2ttriu5qpRF8Zph2sHEvMB
	dbLSLYItGgqcjSdRkz5GyPzYRwQXAkO1kP4dOKQjJRs0JzzX0iU+LPAG00ETZodW4WCNL3lqImu
	VQt8JxmJqVeWr3KJIl4U/EcOjd+5cXwOA==
X-Received: by 2002:a05:6a00:4b49:b0:869:84b4:4b36 with SMTP id d2e1a72fcca58-8a04be69ef6mr8251834b3a.16.1792506703265;
        Tue, 20 Oct 2026 07:31:43 -0700 (PDT)
Received: from arch.localdomain (123202092053.ctinets.com. [123.202.92.53])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f580173efsm4789001b3a.50.2026.10.20.07.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:31:42 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	heiko@sntech.de
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Jun Yan <jerrysteve1101@gmail.com>
Subject: [PATCH 0/2] ASoC: codecs: Add Everest ES7202 support
Date: Tue, 20 Oct 2026 22:31:30 +0800
Message-ID: <20261020143135.623897-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.56.0
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

This series adds support for the Everest ES7202, a 2-channel PDM
analog-to-digital converter controlled over I2C. Patch 1 adds the DT
bindings and patch 2 the ASoC codec driver.

The driver is based on the Rockchip BSP driver, reworked for mainline to
use regmap and devm_ helpers, probe the device ID, and report the actual
per-step PGA gain.

Jun Yan (2):
  dt-bindings: sound: add Everest ES7202
  ASoC: codecs: add support for Everest ES7202 PDM ADC

 .../bindings/sound/everest,es7202.yaml        |  56 +++
 sound/soc/codecs/Kconfig                      |  10 +
 sound/soc/codecs/Makefile                     |   2 +
 sound/soc/codecs/es7202.c                     | 372 ++++++++++++++++++
 sound/soc/codecs/es7202.h                     | 133 +++++++
 5 files changed, 573 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/everest,es7202.yaml
 create mode 100644 sound/soc/codecs/es7202.c
 create mode 100644 sound/soc/codecs/es7202.h

--
2.56.0

