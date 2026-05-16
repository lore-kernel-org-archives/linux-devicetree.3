Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6365A374736
	for <devicetree@vger.kernel.org>; Sat, 16 May 2026 21:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778968266; cv=none; b=Y5G/3fRBdwXSti8zE6XokGzjCdQcDZ/eRgVg8UMRAfAIo48Kmkb5AxCXYiDi0UyVHJNXsKOFb/YqTpy7s/Y23UYqjeRZ4dgECwq5XugGRh9x++l2pIzU5HH5tiX67/qLDsvF/wBiMn/3c1TSR+Qa0IiYWnhVeJQyHGhWd+hCxac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778968266; c=relaxed/simple;
	bh=gT6XICHpMAC3xsYxIsUQVNDrHejCwTPOWCqbI0fjZRw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eaLLNOhx2iylcA1WcgTp+CqW8HmUrJQUCT4o+Uod2AAjnj0zdegwUqOrCp2kIXvsMDlJCZUnfqMwGEF9VDFhsMkjbXNtKkI5AH1seH9CZKGSBRE+oDhEhhvVmbuoZeDI7fgcOaCFVwiScVDur+a+7C81SzceLMyB4bQdfVD4LA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hZDHDei4; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hZDHDei4"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43d73422431so600498f8f.2
        for <devicetree@vger.kernel.org>; Sat, 16 May 2026 14:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778968264; x=1779573064; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H0Ibvrh10uhcctZ5pFOGwQIOfOXYmHIfcNc9VVPAHmc=;
        b=hZDHDei4JpZmxe7bplmM7bwTB8bWjw9gJHdlfGN/Q6c57WS6khZxbN+0PcUN8RjWlT
         gKwcvSgS8kTc1beP6dunEWiQ6AkCHVzCCEkg9VWrOuieROmJDJxEghyXm22hTOJc0hrx
         rtTfvFXA1c3oQXpiqbVOyW9LfOv8YVkt6kzf6ChtGaV+/8kiEJmIBfJVYq6cIiPwnM2S
         dQ7UzTpoReCDtX/V10DxDJS3HqPdag7ruRTXfegQ7wAOOPKa5kvcPh+/au8JlyY/7ZNW
         FzcAjOmE1hkYLw4vqNTB6xkMNKA474H7EnjcHaw5loCCi/XNyC1S9D9OPDmEGwBxzaQi
         v97Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778968264; x=1779573064;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H0Ibvrh10uhcctZ5pFOGwQIOfOXYmHIfcNc9VVPAHmc=;
        b=C+A9Y36Br/GrBiMmqWE5Y5IWMXynY2mfgaAtXBIjZNF6gOclnAwKRfYa0+TimN+T0G
         I46X/jenAjwnGRmnLTfOe128DMWCI903ev9gzJgU5uex2ZL0qvJdf96rapc7RERZzu08
         eck4jH41pUfM8k6ZBA1FrX4o2U61NfAVWhSGdc6mYIZZL4M3aOU9ozZCg03zzGqgyOI4
         UpgvneMRnzqh7fxImZl+t3kjIBKv/gIOs0gq5SnzD+zP2JCEyXTfP2UENDnL52W34w87
         iLdv1V5EaqE0mjCc+aJ9UqdnvQTQn86U6X0Wrbl3XD4F35spNBQfyO8A23RfmfgXvp1d
         u1hw==
X-Forwarded-Encrypted: i=1; AFNElJ+iKgkuHL37uk6a67VwbxZuR/DwdjpscCnMryxL+/D9MesW23fHY35jes5/apDJ/yB3dN9f0FjpjIa3@vger.kernel.org
X-Gm-Message-State: AOJu0Yzws3CPJXRPb04Jecnr7lbTsoERTvqZ+rDv3qT973YlfnUVXxMC
	Fk1IpgfncMQGJrqeQjkVfHhUEnP1MRiQi1YgkmWDzzJ8x/OHJMzsX44Y
X-Gm-Gg: Acq92OHtqP6XsouRTQmLfe4WeQiDmk+0a53V1IxV/GBndn0ZGd4+TwOrrtb+pPQohvR
	saE7kUR8qh+GY+uv+M1KsmQHYt2XiPt8bg0mk/Zj718hGaqhOdVBFpS80J97trTVr4VKueW3h6x
	x1hDmT+4YwL55H2GPmvblEKyZxYqriQsFVfgjlHnK1akzfWdzQO/kDK+gXn6/q1Y6UjvuEN3Xbs
	gaB8cofguSvR05axmiedpbVgUd4pk9tVIxX8NX0R0p8+phfnCYTe30fCIp9D5Iu88sqRCFzDiKQ
	fflm0fqc07gSi3D+PfF1rmvwfigQK2cJpvUuj/dq9j7cotWtErq99n2+rgqevZY45f7YP2OZSRf
	0m/B33p5UyLVLbsQ6oPNmewn+7RjQzgK+abpphW0DQhfE5FSkBozIUKVrd3V+plpYwZ7vov06Ip
	ujLldRxS/R5JdJtjXaU+d8ew8lON9fGKvDIZf8rBGvIXERX3aK7dU4n7BwemmagTvHKnPsTZX3M
	X9Ks5f8lwli7gAlrF1ayVovTWH/KYRaW83nVd8dUCQfIBZHcDgTkxJjtifscv97T6gP9dYiQySb
	h4RIOsJggL6ji7lTUBooFCqDl9wZ6GEb5QZQx8VKDGAjbCXD
X-Received: by 2002:a05:6000:2dc2:b0:45d:4c20:7285 with SMTP id ffacd0b85a97d-45e5c5bbe46mr13893624f8f.6.1778968263443;
        Sat, 16 May 2026 14:51:03 -0700 (PDT)
Received: from systembl0wer.localdomain ([213.194.212.155])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a5653sm25819528f8f.35.2026.05.16.14.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 14:51:03 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
Subject: [PATCH 0/2] iio: light: veml3328: add support for new sensor
Date: Sat, 16 May 2026 23:50:52 +0200
Message-Id: <20260516-veml3328-v1-0-1d4b663e2fe3@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALzmCGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDEyMz3bLU3BxjYyMLXdOkNEvjNAtTQ0uLVCWg8oKi1LTMCrBR0bEQfnF
 pUlZqcglIv1JtLQA8PZSDbAAAAA==
X-Change-ID: 20260426-veml3328-5bf93f85198e
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joshua Crofts <joshua.crofts1@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778968262; l=1340;
 i=joshua.crofts1@gmail.com; s=20260516; h=from:subject:message-id;
 bh=gT6XICHpMAC3xsYxIsUQVNDrHejCwTPOWCqbI0fjZRw=;
 b=rNJZ9uDZG7S2Cm0fg+Cdo75lKl5vgAev7X77MLtkLSkHdYy32sEULWOkJjFgOSUv4o0x3EvJP
 6k/GmWCmuDOAg7xnoueIYRhyNH9+t2bAjxt1R+4v4kjvOou5mZxB/yE
X-Developer-Key: i=joshua.crofts1@gmail.com; a=ed25519;
 pk=d2X8EVKEB2uF4AaPPi3iSSI+IJF3/9kOoDYVVmc+G1o=

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
Joshua Crofts (2):
      iio: light: veml3328: add devicetree binding for new sensor
      iio: light: veml3328: add support for new device

 .../bindings/iio/light/vishay,veml3328.yaml        |  45 +++
 MAINTAINERS                                        |   6 +
 drivers/iio/light/Kconfig                          |  11 +
 drivers/iio/light/Makefile                         |   1 +
 drivers/iio/light/veml3328.c                       | 405 +++++++++++++++++++++
 5 files changed, 468 insertions(+)
---
base-commit: 74d173f29572951629d1e0b7456b424006e51b87
change-id: 20260426-veml3328-5bf93f85198e

Best regards,
--  
Joshua Crofts <joshua.crofts1@gmail.com>

