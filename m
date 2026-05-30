Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C328839B4A6
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 17:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780160824; cv=none; b=HCaTJcqV9/VCulwKxX3TEfTiIY3r2y5XTfS1pF/N6PYrXyt+DiuSo+GHbRrnS7ssIDNPKFTS49W+A/z/yl88HzE0atEvWy1AF/7tQSLvhkEkaYBCvLxKuTq74v2zN3rED81P/aaZqVYPp6yAwzHrMtSfvSRuviBTDzEojqGkucI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780160824; c=relaxed/simple;
	bh=RY9vKjjH2HPzX3+giUftwXKWi2uiyKtdg4NCl5Jc4gw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YtUZ1175Co7o37kxPd4LASSgDnFRe3MUtMDXR9JfmjDmFDa2E9myLICWD2kcesKFtSOsng4MvADM/jYiuaB4fGxeTfLJ52qSD8JbSbxgIv6ADWEeEOTqzQlt7NxCNeKHdwL2PofSJ27HPnFzHD26/m2g4fD9GeraEfizNBh1hkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OSRBn+ih; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OSRBn+ih"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490426d72f7so78130565e9.3
        for <devicetree@vger.kernel.org>; Sat, 30 May 2026 10:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780160821; x=1780765621; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bZR+fQAcFxKrFj3YifAfsie0F74O9/87dA93BF7oVf4=;
        b=OSRBn+ihTzS9nDvkLwHSxNZ3qakCruS+W57I6IIiOuQ8wLYJ7deJRGfiv29AbHC5zX
         MTa3Ad43RaWmHIO23Vr7OlaLX9vWvhV7kZNbZw8JIbuTwE19hQWNkAgUN0kgDHm/b3Pw
         KkxTjkj0BWpH2tYg2Tf13mhFGg9f202TQxd1n9mtzKKqjt7LigqpOnLV0lWjJwKCb+ot
         xmCPlfVt3NtPvVADd1HEUwRN/bXR/WgjsfZCxHwF9xU1h1n/LkPT7cFWWIN9BDZPghTw
         r2JRlU2sHaD421klXaq0Y6sqQEyqfdvGD44che9axqD80pxfsmBh9I1hZBFQl9QCR2Mj
         /pQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780160821; x=1780765621;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bZR+fQAcFxKrFj3YifAfsie0F74O9/87dA93BF7oVf4=;
        b=KnPMd3mqBIpp39RSz6qfEx7q5N64BQDLyrlowakv/qnvMx1HUtyPUxxBf7R3ycMk8z
         4UPl/Oyz9D/5EUDwrsG6ChKdqmlCGYo70rfEs00lW6u4o4agMqU/xjJsMmrVoH/9KPLo
         Mr+ujW6Sx5fOMlOJUcAY8OZ83X9bZKfSk+XUYNZIR3xMrdLAAMUETuerP+9lqIGYIIb3
         sk/3tPzhHUCbC2bBrgSCIH7vWXktVMMelSrUdGumei9sMUg/HOmyrzGYQq7HEiSg89LP
         2liiXwHM8AYlSW33b8y42Mlo8IErguey1RDagRC+5hwOyvf5mLZcqmT09eU68m40TR/X
         1+cQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Y8BWOF3MaCxDvUsPoh4rAi6LiWbg/UBNv8x3w2tAYlwfGtF+zSgC94QhmDFprN6jA8PjpoLd58pBJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwlrIttgFmJ0AqCfFt1vZT8jOfKeMPAvlFDR//4/JQ7ybugwTRI
	nprghEmxSzr2XmN7esUCkuhiIbt9b4OarjlLKaDHzlJY4WQ2VnOYSlLR
X-Gm-Gg: Acq92OHrVflDRicn8iXV4GojJ96YUHkB+3vR/onauFUNmkEOgPESFRt6+UGzoIBbDcX
	O7Uy53d2YDPKmtUODJB8tiC+kXQs9AxU3gRX68Whmne3KYi4FXNaJiIk6YA3S7c7RHVCB7CFt1A
	TqeHyCratKOc3Dvd5jZ3CtEwu3aKeHVXwNnFrenYiYZW7o6F7So7ar3dcPUPZWnvKY60TzfMikf
	ytEjk7SGge7mnV6YpR/mEytCYF3+FcGP4yVv+m4b6PJGid92ws4+RLxlmxbRGze13h7ZXR1Ac7d
	Q+ONvr+lvNegyzXtTo7h9gxIZpypCg5CCCwiPY2+URyKL1KdY0Ti4oqF6CPw4LRivzg/R5rZGZb
	iSGfHZFWU30GhZ6WRDbxjQhzvAr+uDmslN51+M6Z8T2YatWBinGnCO2w7e2oCFIBWoB1Ik1ApTd
	TFyWoVJrD2265NWhwHda7niexWbVeuHLnXx96ehJ4pHkIacsMZ8BAgtiyc9jh0DJO+AkYukxcAy
	c/GgyDp3otjFVrxSjPvSNBx8n+3TPidQoxuE8xsd7TinGUt/fgtlfpshA6el8gfiqBQ+nBAECrU
	kBTjYEMNVR135TYWR64azY0DItwmkjTLVLd9EubW1lktOqItFOo=
X-Received: by 2002:a05:600d:848a:b0:490:9d1b:f06b with SMTP id 5b1f17b1804b1-490a2943afamr54056005e9.26.1780160821033;
        Sat, 30 May 2026 10:07:01 -0700 (PDT)
Received: from [192.168.1.187] ([2a02:8308:4092:11f0:c287:187e:fb7a:66a4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909cab0e79sm229144675e9.13.2026.05.30.10.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 10:07:00 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
Subject: [PATCH v3 0/2] iio: light: veml3328: add support for new sensor
Date: Sat, 30 May 2026 19:06:45 +0200
Message-Id: <20260530-veml3328-v3-0-dd562eaee8d9@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHUUlJIzE
 vPSU3UzU4B8JSMDIzMDU2MD3bLU3BxjYyML3RSj5OQkI7MUA6NkcyWg8oKi1LTMCrBR0bG1tQC
 no7UhWgAAAA==
X-Change-ID: 20260530-veml3328-d2ccb26d02c7
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Rishi Gupta <gupt21@gmail.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joshua Crofts <joshua.crofts1@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780160820; l=2085;
 i=joshua.crofts1@gmail.com; s=20260530; h=from:subject:message-id;
 bh=RY9vKjjH2HPzX3+giUftwXKWi2uiyKtdg4NCl5Jc4gw=;
 b=nPIdZ7OP6yjVCIS3jbqM0ibgWAaJdqvQVXR00foy/zhZe6JV1lE94lCMfnlMTah4R40oHDgGh
 UoOk8XOQsLDBq2ee+uWk2RfXo9dlqZrn6IHyYDUE3TevXwsFZ7jRrs1
X-Developer-Key: i=joshua.crofts1@gmail.com; a=ed25519;
 pk=RTDOoVwgeL4oFdASj9U+cxJuIjXuXk73zkjnGOJKbEo=

This patch series adds support for the Vishay VEML3328 RGBCIR light
sensor. The sensor communicates via I2C (SMBus compatible) and provides
5 types of 16-bit measurements: red, green, blue, clear and infrared.

Reasons for adding a new driver:
- Existing Vishay drivers in the kernel do not cover sensors that
  handle RGBC and IR simultaneously.
- The register map and configuration differ from other Vishay light
  sensors currently supported by IIO.

Testing:
- Tested on a Raspberry Pi 4 using a VEML3328 breakout board.

Datasheet:
https://www.vishay.com/docs/84968/veml3328.pdf

Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
Changes in v2:
- Add additional IIO_LIGHT channel for ambient light sensing
- Remove separate dt binding file and added veml3328 entry to veml6030
  yaml
- Move driver to PM_RUNTIME_ACQUIRE_AUTOSUSPEND() macro
- Add missing headers
- Remov redundant mutex as regmap handles it itself
- Use regmap_set/clear_bits() instead of regmap_update_bits()
- Removed redundant dev pointer
- Edit commit messages
- Various code style cleanups
- Link to v1: https://patch.msgid.link/20260516-veml3328-v1-0-1d4b663e2fe3@gmail.com

Changes in v3:
- Add 2D array of precomputed scale values based on integration time
- Fix chan_spec masks
- Simplify read/write/avail callbacks

Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>

---
Joshua Crofts (2):
      dt-bindings: iio: light: veml6030: add veml3328
      iio: light: veml3328: add support for new device

 .../bindings/iio/light/vishay,veml6030.yaml        |   5 +-
 MAINTAINERS                                        |   5 +
 drivers/iio/light/Kconfig                          |  11 +
 drivers/iio/light/Makefile                         |   1 +
 drivers/iio/light/veml3328.c                       | 413 +++++++++++++++++++++
 5 files changed, 434 insertions(+), 1 deletion(-)
---
base-commit: 7b84b1e9dd850a5c9b55e27daa4ecdc2dd5b3431
change-id: 20260530-veml3328-d2ccb26d02c7

Best regards,
-- 
Joshua Crofts <joshua.crofts1@gmail.com>

