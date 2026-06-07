Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6904431F9B4
	for <devicetree@vger.kernel.org>; Sun,  7 Jun 2026 18:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780857455; cv=none; b=EAxPEhb8INsJdkD/RTZVSoYfT/u/cMpDhl8TotkRW4F0AYJ2IcJjQn1D21oAKkEbn9KhYGgMUjlU7vrdBbxCz+6oFhVV+4h+4rFlTqlwd5otNwZSa+REjaoSVLAtLFzYVZvK49AI8/byRo59dmLJFw9GpOFyScGEy4nBhhS6E10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780857455; c=relaxed/simple;
	bh=U9etQDu2cHlAvrebLmic68W6Lpjpo0kHXWaG1/vMhe4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p6PwQP1umBT0HEC8DDSBw02XOQGdagvLXezNQc2tKfAv+CrwZxDImJ1SscofiVXvBCV545XAMavc6i2JlDZ3RYnLVwaXdnb0vcysc7Ab6+o1S7KKf69rRPk6WI6PsZlLSg6FOnspeSAHQTTOPiEnNj6dx+Uup6mSAO4m0YNefMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QGuPVmjb; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QGuPVmjb"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5aa6cdebc33so3194644e87.2
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 11:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780857451; x=1781462251; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GS41SM5ONg/ebWQwreACsYq8O1fsTfsaNjMp6UVj45c=;
        b=QGuPVmjbZmNmGgnWwgFPSPWKhFWIPtzyWW+JTPiOZpHjLLXn3Spi2QWhw489SzqrvY
         80jkll21ENhAtKlzvmUKpQRGjaz7AlSvv0Vh55wCSXR9Uzs1pgQxhomwRJd6LPC/3Iwq
         laNWzuQKJgeh2kWqUWskT2tJDedby0pIzdE6dem2cLatZjjE6DGJcuoVq5jzhxsZWX9C
         WEyrJkYk1BxjTuSeeV5WENxQvKNNiJR2OAd0KYWRzBEdryYIVJdPiP8qJY73OpRwguTn
         4AMUkeahkGm8dm9DssvF9dvQjRtxonGSw0wbVyXa0r8vZHlNyTdEs5X4zINd0SmDAiY1
         ZRWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780857451; x=1781462251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GS41SM5ONg/ebWQwreACsYq8O1fsTfsaNjMp6UVj45c=;
        b=YTulG4X1rha/8KLkHZ9o+JUg4Rom+8Uccrpm0V5CZ5GuScDTydmSEqBjlqJvf3DBAA
         /GpTGUFO9Kv/5w6uzn9VXIiBv2yKcdBvPvWGUCnzjsGoR3DPXIqhVKj7Z/T/Z9anm/3u
         hqTUcQ5Dl9oLGb6tY+nnG3TfSEVbjxXxNHsXDfUyoswUXaNEV+HzRyp6lbxpbmWbYDlx
         O/2mEFsztIz1lUE4H2U6Y2Izqvyo1QdCGYcDuxK2RScVn2xTVv5aRqsl+7UxWNdnEjpb
         T5KFx0O2+rE+nvhMXGDOg2t9SvuZMasG75Il4tHw27wspuyI405/VgsGkjtlUIhVxvR7
         iWXw==
X-Forwarded-Encrypted: i=1; AFNElJ9q0uNkXJSQjJNuftNszXgPrwpaNXtn0o3kQM8sw4HSI7pdq3w3yk7odLaLMAm1MCiWpPxzNwzcl/ou@vger.kernel.org
X-Gm-Message-State: AOJu0YwiQmzkCTzVW6YzBYe74DGjwcOspxHQF/PD2xEkLLzfOZlYvHh3
	lXHtlss4QGiFJA3FFCKHALwQESkDMtzLy9fA9j/tZe/D7m6DiRH+vgBv
X-Gm-Gg: Acq92OFlvmZm4CVIll9McoaZ5Cs+crOmKnrx5DoC4T+ub3n/0aadDMZh1Z28nKwAp9U
	A/8CZPVfEyzyakMT3ntuyNIiK2Ifl908vRTcfFdkrnrrnh8G8gxpYAp3tpTXsDmsVAJ7aneFOO+
	Ynr0bAjvDo3Es9FTX1lmiQVv1znwH7lFqe8eXJB0uyCFPRgyfzKI1bB4CSqKLdS/6bZpbsELWT8
	dY9t137xnh1QsCExX2VgF6DsZ+IKj2+uGKTbnFFw6VOixmDhsv0IOQ25z8RAbSO+6JSp9ioS0/0
	UaeBXgZT5CTvWlI5JSRHBzroKXhUtOB9gVvHZuUTx/jg9yc0usPisRLN5cpxIMmQyM6TvSRPs6m
	xet28EzDSpGOUyvZ9K4xc9N/layE8eUa4WrPE5O1iiZyXpKCG5PZ3TJKJJ5bxw3+QFfRocdd+Jm
	6st43j1Xbo31UpGufM/ir+lxEFqf1yf3g3ucjMAUF303Uhi04JiNXc1AF4XaNioMfy1P8=
X-Received: by 2002:ac2:43b3:0:b0:5aa:6301:846b with SMTP id 2adb3069b0e04-5aa87b8c393mr2592129e87.5.1780857450652;
        Sun, 07 Jun 2026 11:37:30 -0700 (PDT)
Received: from MSI-LINUX.kielce.vectranet.pl ([2a02:2a40:27ec:2900:efe3:f920:63b7:5b7])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8fc426sm3240809e87.26.2026.06.07.11.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 11:37:28 -0700 (PDT)
From: Jakub Szczudlo <jakubszczudlo40@gmail.com>
To: linux-iio@vger.kernel.org
Cc: jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	marcelo.schmitt@analog.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mike.looijmans@topic.nl,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jorge.marques@analog.com,
	antoniu.miclaus@analog.com,
	mazziesaccount@gmail.com,
	jishnu.prakash@oss.qualcomm.com,
	duje@dujemihanovic.xyz,
	wens@kernel.org,
	sakari.ailus@linux.intel.com,
	linusw@kernel.org,
	jszczudlo <jakubszczudlo40@gmail.com>
Subject: [PATCH 2/3] iio: adc: Update Kconfig description for TI_ADS1100
Date: Sun,  7 Jun 2026 20:35:41 +0200
Message-ID: <20260607183542.368184-3-jakubszczudlo40@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260607183542.368184-1-jakubszczudlo40@gmail.com>
References: <20260607183542.368184-1-jakubszczudlo40@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: jszczudlo <jakubszczudlo40@gmail.com>

Add mention of ads1110 in Kconfig for TI_ADS1100

Signed-off-by: jszczudlo <jakubszczudlo40@gmail.com>
---
 drivers/iio/adc/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
index a9dedbb8eb46..ad2a276ce0f8 100644
--- a/drivers/iio/adc/Kconfig
+++ b/drivers/iio/adc/Kconfig
@@ -1747,11 +1747,11 @@ config TI_ADS1018
          called ti-ads1018.
 
 config TI_ADS1100
-	tristate "Texas Instruments ADS1100 and ADS1000 ADC"
+	tristate "Texas Instruments ADS1100, ADS1000 and ADS1110 ADC"
 	depends on I2C
 	help
-	  If you say yes here you get support for Texas Instruments ADS1100 and
-	  ADS1000 ADC chips.
+	  If you say yes here you get support for Texas Instruments ADS1100,
+	  ADS1000 and ADS1110 ADC chips.
 
 	  This driver can also be built as a module. If so, the module will be
 	  called ti-ads1100.
-- 
2.47.3

