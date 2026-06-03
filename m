Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC54735F170
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 14:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780495857; cv=none; b=LdtBFDlpbe+06On7+0It+IhBf9y67qHFkM/wwbTFQkfENwhRsSzV5B1/qGdYxY861207W5jDwbDXwnfT6HWqWSr5YvxWTrnyx7vc6mlC5+i1WzqNPA7wFr+D3o+TOVQrwbpRj6J8V9+CtAObk9NFAQOTDHswlNkZUkVHW7Hg1FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780495857; c=relaxed/simple;
	bh=X/4LDAMoKZkMh4PAm7f3Ytwubin99iyLxf77BzywFhc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ikpTlGx5adOLYzS8vCqr93XxwQ71JvPDErBRQC/BySUvnEpamlzyJ58IL9mnnbaBDaUEYULkLlznouktY3ELIp3sSreS0wVai4qtO22qQqBaKuLc7VLdXXToQpCAJWIAoB/TRxHwBbp9sWuKCnsG4665CM3QcNFfwlKLQUjDA3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cCzGHXlt; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cCzGHXlt"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-45eeba68948so4996632f8f.1
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 07:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780495853; x=1781100653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I6uE/yj6yBBMDcnhynVadW7yV5ZE49OrcbTpAkFxMBQ=;
        b=cCzGHXltWJofqlJrjzS4dqMoUCcdbCXPab9M4G+KJSnnLBQ0gahNaBps4Pz1zNFNCC
         a+u9B5gvLb6wzBQ8puonc8dTF8R19PPeoRLKL+U+gHldpN8XoZexH46AR1qtA8+6mU4j
         5A9pSFmekpc2xAZ+gpU/hM19ocMA8yPH9q/t1taIUJ0PuyJ6x8aj2twhTSofnhkDCWeK
         85WsA/WNfOHNhXIVggjAvzXcWigj6wwha43HQdOMpLLHN/3lVndm4snAb9KCApCGg9Y+
         letw/z0dVgOdIX8oCdcWfRz9ZVT4mOeJ+h2t5l7JjHFQlFXxAODTxbUSMtcFfGv52Azi
         HshQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780495853; x=1781100653;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I6uE/yj6yBBMDcnhynVadW7yV5ZE49OrcbTpAkFxMBQ=;
        b=hgsouOdg0WiYu7apUwpkhrFd8DAt9su98FW918ZSqn5vN6EdGPG27JD1sHprNh6r1g
         +f9aPJQA9BelmM6A1bOLjEcABIjfCwgZ4R6hKE1REqNvon1IYlcRKOMFQHbB+0CkS8xp
         T0zFQhkeC0Tzxyf9Un/LeG4vqlH+Ou2vPV9a4DiRF/hZ0jnL0fRZiZ+UpPKaXYfy+GfM
         MS7IdkOJimkNR/tD7HUrJ2kbeOdyWTLSwW/Hp+HW0tt3uyKFTHQq68akm8k27BcqtJqo
         OKdsYDs8OIf3M0+UszApIe2G2qq1qnW4fK0gk6BcyyBn/vgHZ+svy6mhBIHa+8Wcni5E
         Pq7w==
X-Forwarded-Encrypted: i=1; AFNElJ+wsyc+eHASzbB3CnQy8lyEC9sqQGEgRIE4b0AXmIm0g7HKG8L6hGB7dEuYuthoGixGsaKdfuL5K9Ts@vger.kernel.org
X-Gm-Message-State: AOJu0YyZv9w5kqv6ZfWjOljiLa01Ek9PnF2LmZJxIFKrSOOzesmmRIZV
	yVjYw38BHgjaWRyKNexK69w3p9mf3V0wfQtFMGUAXXFWmDH49BBLUfRQ
X-Gm-Gg: Acq92OHysgIESzgXtrwie5SciB8YUTycK5YzFl7ZT+X5zzTX+ETijVAYBL/IahvfmhB
	YrrqDKsAmpxP7CZ0HfLbcBSFK0yIVcYA+ZUV81m6aZcra0KyKH4PpBlLcC5HnqA4LzmF+XkThup
	gxkssAdom6GVQjG260DAbMdzSAglVUCPbj6xGfCi3zif9vZabbO7oi7gzyC+BJ1r5s3VhB1eyq5
	oKmn1WwD+76zqqHnvoWD9xnI/gTm1puPm4YCKDGv/Z/zjRz0MQiSpuzOZ2RZKgwDflctKUfqy3r
	/IKUYWMkW7XkZCR6xucBY6dtCdn1oxKgkYUe2o0Ku0NvhI/Oh+zP+5XZkxtd4RpDLfpq/9Zn3qr
	fAay4J/0cEoy0kj0IJHhQ7Kjnawc0e+j46qzS4zMvLkaW6LdxD2a0lPwQP1p1PKwYX+s3BPldcr
	rm4XgS0A8GBDT4zQqTsb1FY4xIvEX/UNyM9w==
X-Received: by 2002:adf:f403:0:b0:460:2477:2284 with SMTP id ffacd0b85a97d-460247723f2mr2137513f8f.39.1780495852755;
        Wed, 03 Jun 2026 07:10:52 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcb13sm7217131f8f.2.2026.06.03.07.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:10:52 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/3] hwmon: emc1403: Convert to use OF bindings
Date: Wed,  3 Jun 2026 17:10:30 +0300
Message-ID: <20260603141033.111300-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Document and add OF support to this LM90 compatible thermal sensor
family.

Jonas Schwöbel (1):
  hwmon: (emc1403) Convert to use OF bindings

Svyatoslav Ryhel (2):
  dt-bindings: hwmon: lm90: Document SMSC EMC1402/1403/1404/1428
  hwmon: (emc1403) Add regulator support

 .../bindings/hwmon/national,lm90.yaml         | 109 +++++++++++++-----
 drivers/hwmon/emc1403.c                       |  25 +++-
 2 files changed, 100 insertions(+), 34 deletions(-)

-- 
2.53.0

