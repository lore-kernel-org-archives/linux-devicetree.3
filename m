Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08521EFFB7
	for <devicetree@vger.kernel.org>; Sun,  7 Jun 2026 18:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780857438; cv=none; b=UMNmtrL92gcjgfi3wgYNHxtsToGJO/ggBEuQzLIogxRYU/6gPR3NXU4SuVBUO3v2ZpbuvzMsr9OF06Gr+UzjUGgWTuKyhWMUwaCLqimP6QUBgFu+BzJxedk6rtSyGm+GOLGAikaDt/Lo0NUUbJSzsVu1dU9Bj/V6BW+g5dsAa4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780857438; c=relaxed/simple;
	bh=12QKhw9u5pwrqF99zfY9pLn7KRj4JE4SboM6uGGpOj8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d5d8GF4Y4RDN742wo53ad5BvZ7bbTi34A4lgC9rAqzI6hFGUW53S38xOMEN+bLYnZtWrbknC/uzuw35KqO2LXKjf/PjZhM4Oz0giNgVwaYTMfh77myEi8sfgTwZfajUeogZZF+llPTVWFEpQpbpsSQiQRliEApUmvXuT40zgbp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mSGRj76Z; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mSGRj76Z"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5aa7a70c0aaso3581191e87.0
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 11:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780857436; x=1781462236; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sn+CljYu5ixflRA1SgmEgER7JwRLqObGFjigh04bFJg=;
        b=mSGRj76Z6JoehNOsk7do8eQvZQKuC72DhS4gRfVbQt4YfEz7SxXWAlHftwSjMHIWZp
         fcMSw0/sdzFSCMweDWWhVlSpjuN4ZpUoNZQ2zC9mwPdwyAr5OfwW1aEliN1L4Q1o/jnn
         V3ojSd2N6e6GUJPbZ6w/ZskxhRpzL7otVqoMx2Wq1aMml6gvYn5wVKAVXkk/spFuo11Q
         qd5yfROiB17NA3PiX4fOyqGAi4wmPPptbSSD8uSjlYOV3eYjK/Nl6HZ55NHsUAsu2oZu
         uK42PLVbMBl5mGv49jAsXo774LhTiDqBHu6/3POSGz9pQ4PFhsUmr9bZ6H7MxnaVkbNT
         MFAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780857436; x=1781462236;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sn+CljYu5ixflRA1SgmEgER7JwRLqObGFjigh04bFJg=;
        b=fpEcu5g/31Yx0sIqBLl2uHw6nmMkv4dHvoyImMl2qyGP8z5jEA+JmpB5tKYBhOFq0d
         rXUNQYMSUsi6gWqGLptVkQf6mRKQuAaHXgEDnnIGzqTs/PZr89uBE8Rd4tLZissnTbjg
         PbrGPQ48sQLDR9OpTrgTlGDqmzn+bO8g54w5JgcTNWBQC0Oxq6/kCK8q/Ekv6/zUP6Nk
         0tUpjeUTr7R4MwoQUOAvzGLIoQq4wnEoHDWO7bXo16nMiB/xAmKYiNxZP2c/pU/Ysl8w
         pDrrI3mFgM5gLh+I8aYHFEePSJ49VgFvv+JyERqiL2XHsngleVi0exSPosyXaOmZ9tvV
         Feqw==
X-Forwarded-Encrypted: i=1; AFNElJ8ZkiteFSp5Dfps+Q6oFtecQGB226kJRxipw0oNr5+G0PDi0LbNUgIeReZ119qlAN5Pix58XeeVyRzX@vger.kernel.org
X-Gm-Message-State: AOJu0YwXtvUD3YImEpK8JWWfCd9V82SqRwTAUYjKJxQKV3OCqPfot4KB
	3HBO1zQh1Lmh3r3djeBi0NJo2sbHGhBdwgS3jXA79YCteFNZBIFXzoJb
X-Gm-Gg: Acq92OGC4bmUERqd3lhU5G1U1gjHPuGAGbzdO1oXIEYZ6750p4vNo/JcDwuvgz61yLp
	GNEdKiyZ+CYeT9MUEL0JER6Y1FCpG1wDVyWj99poREHT0Z/P+AzKqACL9pAhOOet87OSznd3pVR
	rvKlxlQzzbNjK/WniRLDO6MXi5Y8+zDd2MTC58+6NyU0Vt+8El+PjdYXnRn+VEj/Bc/HJ58eY2h
	XySQwVgCU5mvCIYxNJM9cR8AV572PwPPJl4Nqx8cK1B77vUxeYaeD3CylmO2+y/j0mTRHyPIMKB
	hgAH5X/TKzpzqhWDdloxaUvM01nYep7C/k1cUMr288QqQHEiEUACuqGRb2clB83u98glPn8cZ/3
	9uPw3E7QoCxiN+MsWl1jTuQyQ4X0ah+ETS9w21CTIUb24O35duFaQCjBDCDwbmK8ROIBij5ywjp
	GzAhNvkdm1vKfdNEwVKd57VMjS/rPguVhnh1VstlEPbdCr+irEh5tjNoxmsT9mWgd/FVw=
X-Received: by 2002:ac2:51c9:0:b0:5aa:265f:acd0 with SMTP id 2adb3069b0e04-5aa87c1a006mr3168512e87.39.1780857435867;
        Sun, 07 Jun 2026 11:37:15 -0700 (PDT)
Received: from MSI-LINUX.kielce.vectranet.pl ([2a02:2a40:27ec:2900:efe3:f920:63b7:5b7])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8fc426sm3240809e87.26.2026.06.07.11.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 11:37:15 -0700 (PDT)
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
	Jakub Szczudlo <jakubszczudlo40@gmail.com>
Subject: [PATCH 0/3] iio: adc: Extend ti-ads1100 driver
Date: Sun,  7 Jun 2026 20:35:39 +0200
Message-ID: <20260607183542.368184-1-jakubszczudlo40@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend ADS 1100 driver to support ADS1110, which is a pin-to-pin 
compatible device with higher resolution. This patch also updates the 
device tree bindings and Kconfig description to reflect the new 
supported device.

Signed-off-by: jszczudlo <jakubszczudlo40@gmail.com>
---
jszczudlo (3):
  dt-bindings: iio: adc: Update title and enum
  iio: adc: Update Kconfig description for TI_ADS1100
  iio: adc: Add ti-ads1110 support to ti-ads1100 driver

 .../bindings/iio/adc/ti,ads1100.yaml          |   3 +-
 drivers/iio/adc/Kconfig                       |   6 +-
 drivers/iio/adc/ti-ads1100.c                  | 165 +++++++++++++-----
 3 files changed, 131 insertions(+), 43 deletions(-)

-- 
2.47.3

