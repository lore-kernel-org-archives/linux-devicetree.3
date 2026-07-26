Received: from mail-wm2-f4.google.com (mail-wm2-f4.google.com [74.125.225.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F5B3E2767
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 18:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785090133; cv=none; b=KjXvgwtDAklGNX/ZI8MFBMflkoLBEcwEJhSBFPOvZlgQEG8V1kQ19+l53vRhI8IegG0abrpxPJg4qeM2yZcVt02cCooJVIP5S7eixXTSZTobFKU42aLvPrOEtNyXS+ZFKD/WEf/ESibDAjXJYF1mT+6/k96MgyfJbwxlD+M7am8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785090133; c=relaxed/simple;
	bh=TtVUDOQQkYR8/OWJxLSBRc7kHWdoidQAQDGzJTFFDKY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O6m39WM9KdDuSSafipvcp1mKyL5mFZq/obBzF++SxfedZGsT1iDYg3hfX/MoKUlErjRbbGevvf/RB8B35m+SokLa6CoOS53+J7w63XRE6wQqlkmimf6E+sdTJLu6tiW830HxQlHRWOF6uXhbPAt8DKdv61eCdSMuTi0uMKnErUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tcpugs50; arc=none smtp.client-ip=74.125.225.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tcpugs50"
Received: by mail-wm2-f4.google.com with SMTP id 5b1f17b1804b1-4955f00e593so5942155e9.0
        for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 11:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785090128; x=1785694928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yup5bOkWn7IqJaUF5fjRsCEs3zex/YIAg6y/8ySFCqE=;
        b=Tcpugs50Yu7RNJNgt+8VZkFQvcAsMK9jsI196HGDWYJZUN0uC2P1bKe3lYx5Rf+PlP
         YVgTdQJRSfX01TNvt6JRBD4Abuksy42BJFWusCzYBxMLIDKCrdja2QDQKF4ZUpclUSPU
         A7z0PniLuFjCRpl9nyjxEknR1MOTcBwQ6vRbsKu+beWSbmi9PTm/8DQyWu8AOkasobqP
         LG4lUew7r0S/uHa9bNZJH9uBx2Qsr92uKxz7u7XMt1DNizaZv1khAcJf9YXBpZxWfysY
         D/OhYsLpTyvSAV15DFHDFjXb532k+kScjpNGCu0xZsKpG/MDEnv260tH31wJKMKvLzQv
         8MDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785090128; x=1785694928;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yup5bOkWn7IqJaUF5fjRsCEs3zex/YIAg6y/8ySFCqE=;
        b=QHtTaMk44P0qRHaSsMSU/u17aQdph789Dr/YmDONqVSYS/PhYYVO+7qdWn1IVCdn67
         dX6vKgC89eXB2pha7OWX1ILjGEhYopuNFwzvMNVuy7N54FwAnRsBdASyBsFvlv07NPKN
         6wwGFlFhM05wbzlLhpCEQo/ZuzWancsbBxI5GoiFsO8nclGAytvyZOFAsHWB0oMO9HfR
         +dtyzRPsUUQX8UpTcWRxDoffLr2MTwF/KzdXEv56Nkw+rIo0DiHEIntHPb6gmfDkibIk
         8BXdQ64Po50hH7+7n9pbo0n9/hiJXxwW+4MsQ2LEHw/Ul6dxVZb23wf1fmpmy/58n75v
         zAUA==
X-Forwarded-Encrypted: i=1; AHgh+RotN/v1iZdUSXZ7pzCyq/j0jddOeUEXfqVd4e4gFYv8jjktdKyHNgTN4/NJbT+vU1PKhD2+60D1puj9@vger.kernel.org
X-Gm-Message-State: AOJu0YzlfTvMKJXdxTx9SF+9kVeTyshpxdIt2ipoZ1dpx2iiJHqEaHz3
	CXqCOTXp1qrX+ogJ4sLCEwmoapnXwvXuHnQyr4FDSK/APR3WQhiouGF7EO2h4cOO
X-Gm-Gg: AR+sD10CpSeaeRKyjEAiKCIYm4hwwqEBIzJPFUt/i5lbKucUMOywqiTrdPYp+PbDs86
	2AkNaVzHOIXI+45EcfWRLYi+ruJxRsN7oGLm6ccXebq95R9SBj7reZZTZ6pUX8IP7BUgPa7AMyT
	G+DDEUUV2fWMbcUtUYfFDw+YHQ55cEzDMPxxebN9oaWRlqcwlb4Kgp4eRe1E0T/7yW91WImden2
	b0+3j4H3uoSH9+y1O1tSAtibtw3kQGZi22DHzRX/ouBQSaLH1EN1Bg1KpTPegxm8XOSCfgHyHqm
	BuIr39zXUMZYAnfQCyOWHgKtS8sVVMMs7P7vwbndAFBp1mcbrqTNXzxHlIy+q8uL2mcJujp5CaU
	xTGOkD2Iy9Wluhv30QVGWNA/JOHOezsGj0CuqhrxzgMIG2M4ybJQoSiVZHK0omaHh2aW/daYTzS
	wfF8C1z/K0uhqGxlR8Q9YCY6EWviNcolZaCG6UDA==
X-Received: by 2002:a05:600c:45d5:b0:495:52a5:8829 with SMTP id 5b1f17b1804b1-496b56c5ac6mr70333955e9.11.1785090127909;
        Sun, 26 Jul 2026 11:22:07 -0700 (PDT)
Received: from slackboot (93-34-145-231.ip50.fastwebnet.it. [93.34.145.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b52eec24sm150748045e9.3.2026.07.26.11.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 11:22:07 -0700 (PDT)
From: Alberto Robazza <robazzalberto@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	neil.armstrong@linaro.org,
	khilman@baylibre.com
Cc: robazza.alberto@proton.me,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 2/3] dt-bindings: arm: amlogic: document Orbbec Zora P1 board compatible
Date: Sun, 26 Jul 2026 20:21:57 +0200
Message-ID: <20260726182158.249449-3-robazzalberto@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260726182158.249449-1-robazzalberto@gmail.com>
References: <20260726182158.249449-1-robazzalberto@gmail.com>
Reply-To: robazza.alberto@proton.me
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alberto Robazza <robazza.alberto@proton.me>

Document the "orbbec,zora-p1" compatible for the Orbbec Zora P1 board,
which is based on the Amlogic A311D (Meson G12B) SoC. The corresponding
device tree is added in the follow-up patch.

The "orbbec" vendor prefix used here is added in the first patch of this
series

Signed-off-by: Alberto Robazza <robazza.alberto@proton.me>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 9f73a0054..2d6ecdada 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -167,6 +167,7 @@ properties:
               - bananapi,bpi-m2s
               - khadas,vim3
               - libretech,aml-a311d-cc
+              - orbbec,zora-p1
               - radxa,zero2
           - const: amlogic,a311d
           - const: amlogic,g12b
-- 
2.55.0

