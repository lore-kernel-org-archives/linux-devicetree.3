Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC7340681E
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 20:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784750437; cv=none; b=ZnsqUFVuZWMENtHjZa2x+ruQMoVcdPxWg6brtqt/P+kfbP5PdgufRdRahhpbE0d801oDTiMemk0/5LHetq1OmDL3iaXk4AVMtsCBAcZcu6NBvtgdoYNBCu8PoQ47uPWr9MxmRbAQXcuzci0k8lHB0muFby/8uiCSzg/K/eRZ7h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784750437; c=relaxed/simple;
	bh=pEkIRxRWvYHz+dz3NpwZqKpLPS9hkD79MDfEkwAeZf4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NaQAGMEjF2lIar4D8v0qtNEB45pHCXBfBxP7wtFftcUT9nL04AH3XWBisFkCBz04rUqkrMMb5J20T6+5JNoYdoyFWOdVEJeGK2sBj71r1Y9pUraYtpagKh0sF3yETU/oyhj+ppnO6S6SB9kXkUA0Pu8/lJ9HAJ1scTpMQzUy6Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gh+M1znx; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gh+M1znx"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4799b3f7c83so9336798f8f.2
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 13:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784750430; x=1785355230; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5mORs65Yll7OpCDVibb83AtzmBXkayu+8iC2S0zkHp8=;
        b=Gh+M1znxjfE7LPSzSb4ODyw4g16NjjZPV0Ge94iee2jC1vQZ/r97iW+7HVYmbg3Oes
         kqavOYquPi+AwO2s1aWh2lPZUL6z6d2Al8cK1vAEp47elLdoIUAGBTcWTFutUgfnh6Jz
         LxHAjiuBdPqB0UuMe5tNpgj1fBObJcFt7GhiWdOVfSFiVZuYzu49vXrgFCEx7386JWbY
         LHBh76xk1HrJ3kX2hq7vb17gum/6zLnCHLqicrtqtc/gP+eefpKxYHN3MtaVfhbxuoK6
         kHHiXzNQ2J4yT1TxnJ5wvrt91llZqBzsele+nu7LoX/7W+m3nJgyOSGZVWOaTwdHQ8h0
         KXNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784750430; x=1785355230;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5mORs65Yll7OpCDVibb83AtzmBXkayu+8iC2S0zkHp8=;
        b=TI1DcqzVq12DWE7TQ/V2Byg1LkkbhXMGRFk+q+M0qvaBxTSvJn8PHT6kF98kRxAmZ9
         JMX7ZEpQKUaL2edQAqrgkTE90g2a6F1QnYCMw2T1qYeh2wBm+TFLciRVPP08BWbXq6ei
         xSbYXND15Bsa1PGGMQnF2gA4FHvVUKkn2JDw4L5xpt1Q3VHEh+YUDlaE34nYQ3Oc4rsF
         aYSCZgY2Cdh79k0/NueIZt1k82iMap/R3lMNdrjYNdP6EBkurQVoSOE/tI+DMbVdPnUf
         90NAvaG31F82e5lHbt6Qqe0y3Q0gorjhJilmecEceBW5MZOzvvCNfoYjBSbxmN0KOd3v
         3D4w==
X-Forwarded-Encrypted: i=1; AHgh+RrcFP7tU+Bk40DEtS+OaYlfGp3ghfrBqXdG5VaTf2pgOyqMYeaBwKfaYB+Fo9yjOUGmibGQBpVmKl55@vger.kernel.org
X-Gm-Message-State: AOJu0YwiAAry/zJ7c/iZXKwBZ3kMe/YyvJYArlU0Flb2ev26qpcM5LGf
	vgGvGEPwjJjS5MK97kKuYGyhyWuUjUSnbxv72v7xjJtFsO7C76svVTeI
X-Gm-Gg: AR+sD12aOLFlvfQ2yw3ShkNC1phBLRVZ5WHKcw7HUgtvv+tClNGNmOYk+bLX/LMTFdT
	E8pE8Di4ediXBhCwxzLgIAHcU0kX6A5H4sQTI+EUSC6oCV5d1vu8/YGmLaOI3W7KJUh/Qr3bMIG
	829UnVket1SI5gpbmOewOiTrdTpG1QsKcASuxlsYtp02nl1bUeQ0qgb5ZlkJZnP6E/LFHNF1Gn3
	taNpCszx+9vEpMYiTp6sQ+O8l0ofbYnCJFpTHu16wnRzALxiAuTR2N77wvdcqLyM1O1q5E0WEe6
	gOha9ItjXizzzePL35GEKaJMgI+jdR8v+L5xSnL9gg4SVLOOHHJJ1XxoHx36sDA5A/mYCkntE8s
	5wmOqD6xOdQnud4Jv3ShzDG+qX1sN/JJoi103PHndhAFBsloAIYECCDeGEimu2T2E2P1G6OyWUH
	7u0V5y4w==
X-Received: by 2002:a05:6000:2509:b0:47d:fc45:8589 with SMTP id ffacd0b85a97d-47f8d4b6b89mr380482f8f.0.1784750430345;
        Wed, 22 Jul 2026 13:00:30 -0700 (PDT)
Received: from antoniarch ([78.210.252.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c52fa9sm9532851f8f.20.2026.07.22.13.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 13:00:29 -0700 (PDT)
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Antoni Pokusinski <apokusinski01@gmail.com>
Subject: [PATCH 0/6] rtc: abx80x: add support for ABX81X
Date: Wed, 22 Jul 2026 21:58:08 +0200
Message-ID: <20260722195814.298552-1-apokusinski01@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,
This patch series adds support for the ABX81X RTCs, which are essentially
SPI versions of the ABX80X RTCs. The first patches contain cleanup and
reorganization changes (converting the driver to use the regmap API was
needed for this), followed by the actual ABX81X support.

Kind regards,
Antoni Pokusinski

Antoni Pokusinski (6):
  dt-bindings: rtc: abx80x: document ABX81X RTCs
  rtc: abx80x: add irq to struct abx80x_priv
  rtc: abx80x: use regmap instead of I2C specific API
  rtc: abx80x: replace read-modify-write pattern with regmap helpers
  rtc: abx80x: create abx80x_i2c_probe()
  rtc: abx80x: add support for ABX81X

 .../bindings/rtc/abracon,abx80x.yaml          |  15 +-
 drivers/rtc/Kconfig                           |  25 +-
 drivers/rtc/rtc-abx80x.c                      | 595 +++++++++++-------
 3 files changed, 384 insertions(+), 251 deletions(-)

-- 
2.55.0

