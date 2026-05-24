Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19A531280C
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 19:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779651549; cv=none; b=SpS2l7khHHM2qd5P5WR+cb5CNhWVfOMq4SfaW6wSVbgwX8FQo+7hFXdXZlngDWV/Pn7RzDhwsx/EhDuSf54wUIwtYfBh0nvn41LGXpXag5ilwhjnugnE/y60SXqO31gFJNt8Zc7bNseujYovqv0GEj5tTLEa6xgmJ/uZrn9TZzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779651549; c=relaxed/simple;
	bh=espG1giy09QMAmnoJM4JhpCcS2lwzv+JRCSXuD5yl58=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MlRo7MF3aFQ7MFpZqjCF1VIMmDSKHHNSUdFdzl2+BmeTKFkXjD447PEatmyp1a+0rUlGY1eXwArQ1DM1GkEtX8Rul4mx9wkCXmsvvSOkQmiiFYNdh0OUD3tx19UCIu+QYoNNI61DhHU87V0hEyXlBF5ePS2jVbATBG621/DAGsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FHolo0BY; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FHolo0BY"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43d7645adbdso5796122f8f.1
        for <devicetree@vger.kernel.org>; Sun, 24 May 2026 12:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779651546; x=1780256346; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xqlk8DHxm4SFQTQHY9V2Fn+LxNR3BBgzQZu7nC7+rPo=;
        b=FHolo0BYz/NIR6ATpLhpFSFqrwlX5WXOXLUtzvzj797os9nkxygXTLadCAlqczRl3r
         k8vEzb/rfSx7X6kkmlkpljM655Et6qwFke0wPGovYCc5k33zriliMmTTDqBrymZRmR1M
         1+Mhj+YAR+2XzwVBAX1WB1UsfKQ9YZrYPGb+NyxnoSz2WSiqVSSOhefdXcIaBVEwqbHe
         Udladhvj1Ea67MFidvGjMKa5Jr/gOY5hIz2oFQ4PGzah79LqXYLdabVtPaTwj29BI5j3
         QG7JDUQaP59lfmlsFPCv2Q2Xx2GpaprtC65oiTjo3jvHn6EMfqr02ytks1RD/Wk25nm7
         EAwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779651546; x=1780256346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xqlk8DHxm4SFQTQHY9V2Fn+LxNR3BBgzQZu7nC7+rPo=;
        b=IHBGDTMvw611oHDB0GtC5Ie1ODCEyP+Ux4IuuE0q6BBHVDpsFs3BXjp+aOApgsdwnE
         rjq97sMQKuT3134kDNCr5d6vKx1gC0Hla6l+EVMKfYohDoi22sNobO/z35i0/ghyJj0C
         SRJLyx4C0h9DmL+3i1qG5eXIYwuNrMcICdR51QFuPsdSzCEXhD/YNwsKOFRKCEfHLA9Z
         QbPlZAsirBSFhQ7X2xz4Nmp1ikBWhse0fNscmO6hYqtt9M2Tl+oPd+iNVbzJnWbhR+MZ
         rv2ZbwShKbshF0pj4i8U1I77ImsSSP/pssC4BeqLCYfht9PrCyPSHKD2XGyuOyzSIt9z
         wn5A==
X-Forwarded-Encrypted: i=1; AFNElJ/C2/JiuRubdBWk2MJ3plI2j7w+s0CumOjDB+JZSFoIPc1ix2auEzPoLk2eDoCSyi8R16JDSnuWQdJ5@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1KXMyFtqmlZAqnAufUU/ROyLkUYwRrS3So37q8U8WsloR/1WH
	QlNSfiGSQBwdLVhoTTTJXA+4Riy1WhnXLzAo+7Y1xiCqRWBsS45bYDd3
X-Gm-Gg: Acq92OGmr/+aTFjGNy9P7sdKf8+hAHXkMRV6CYYeLcABR23wUURO9rlyYHySFZIDLWk
	aJJ+osu3xCEeJk3oi1zBmg0seKdT/O+CLT53x5WwQE7G9HKFvO9HnZoQnKmJ4Zv+gcB4EpJSTSF
	C9nz77oZmV5rI9PVtbbYf0wWNHMEYUa4CLuyYgVSBPCsHHGqqbx8AGa1Llc15url7GKfs9KEY2C
	ccnTH63BhlOXkMEd4AXUH6Ou4jYTXFzqoyulZR23glVwVKWBf1VGFXIphkKirBuWVJwQiep0JqG
	pbvNxN5UgMBmvXAWm3kXjBgYcYZOAxnSwxu9Dvc8RtgPLkX5HE2DkcDJviDSBFOEw/DeVa5rJU7
	NIKiekNmKV+VgC0gDH2OVUZ4q7rym52zCJDkwczoWCenBUMVbHH5ymZ94R6TK2keUZLYLhyyyBN
	NB4kfo
X-Received: by 2002:a05:6000:4b04:b0:45e:9420:ed16 with SMTP id ffacd0b85a97d-45eb38b0045mr19677817f8f.10.1779651545665;
        Sun, 24 May 2026 12:39:05 -0700 (PDT)
Received: from sefo-laptop ([2a02:8071:50c5:5c0::361b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6c9ba2esm22339674f8f.8.2026.05.24.12.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 12:39:04 -0700 (PDT)
From: Wadim Mueller <wafgo01@gmail.com>
To: wbg@kernel.org
Cc: krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wadim Mueller <wafgo01@gmail.com>
Subject: [PATCH v5 3/3] MAINTAINERS: add entry for GPIO counter driver
Date: Sun, 24 May 2026 21:38:46 +0200
Message-ID: <20260524193846.19216-4-wafgo01@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260524193846.19216-1-wafgo01@gmail.com>
References: <20260515153616.157605-1-wafgo01@gmail.com>
 <20260524193846.19216-1-wafgo01@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Cover the gpio-counter driver and its device-tree binding.

Signed-off-by: Wadim Mueller <wafgo01@gmail.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 06a8c7457..14f1a4e9f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10984,6 +10984,13 @@ S:	Supported
 F:	Documentation/admin-guide/gpio/gpio-aggregator.rst
 F:	drivers/gpio/gpio-aggregator.c
 
+GPIO COUNTER DRIVER
+M:	Wadim Mueller <wafgo01@gmail.com>
+L:	linux-iio@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/counter/gpio-counter.yaml
+F:	drivers/counter/gpio-counter.c
+
 GPIO IR Transmitter
 M:	Sean Young <sean@mess.org>
 L:	linux-media@vger.kernel.org
-- 
2.52.0

