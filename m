Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29A929C33F
	for <devicetree@vger.kernel.org>; Sat, 18 Apr 2026 14:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776523668; cv=none; b=cOH8QB3gI12hX/uk7tkoeJhsVuNM/GofNbq7Vp1RvxGeZRur4sG50NUJnuDdteol6Jut8W/JWA71/6Y8lrrAbAnyaVsLGEn0FQNufPmtq7E5Z1O+dWlYiUvqVHEKad7O+aziISHdolSbZU8n8AUC3ARaAWaPqgx4ACLn+2OoJ9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776523668; c=relaxed/simple;
	bh=eM+cPPhTbWP6d8hZZnG0IroQxUq2NWVkL9wVoSPJ1mc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RyhHNUu9ko3oHd6romRVx/PdKgBji1Xv/L7aJ7udO0v8QBC8rmdc1cZeQIjoFHFZRfRmOwVqQS1zqHWo19b2wga3PQDZ5SAzJfPCOg8lxq2eMmvLtnedN4PvCmooze93IswuP0yd/eHd1oy86HuN3cJQUddcskrW3El+I3S8CYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QHPAOyQm; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QHPAOyQm"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-38e84ed22bdso16548341fa.2
        for <devicetree@vger.kernel.org>; Sat, 18 Apr 2026 07:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776523665; x=1777128465; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cWVfW/QUZR75njEVm2LPlYmg1wiyoY5+XXkPVMcr87c=;
        b=QHPAOyQmZAEx2oF5yYq1ftmp1Zua+DPzbyNlCF5DUFan0XjnafYesqP8laCeiTuN+N
         5Uj2RA/gxuScCcH4QQFc+4i+bECZz/NYzhvf5Nz9cpt3270zW+g8t6swsNTMCnioQvjK
         61rTlBLkvn5Df90QnrMaltkht7zjqwjgXWpb4S0uusNShbU3iS2e4g7IkInf6ITyTvdT
         SyTrTsTUt/d7MfsZ59bTzN5XD8FS8k9IgbFAfPeJoDXMOO8cY8uhm884EC5V35cLqShR
         k/IadaRklbeX6VVbz6xaKtJGvwkgmSUUocCLU4/Sgm8n3IkC46Zhc4WORBas0kbn0UBb
         q9tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776523665; x=1777128465;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cWVfW/QUZR75njEVm2LPlYmg1wiyoY5+XXkPVMcr87c=;
        b=MSjpkoEbY94TOs1npLL0xn0PwLWsMWZxEBD4iPs79kNsB2S+9pU3DCB+OQRksfKtIM
         7Xj/UD2Fhxjo1EKL5/E5w+g4tUuCqPZnF1HVeXOqGRDk2PsfpUDFHkpanMVNYqAf9bSt
         n35Mvg+o+vTGDUII3rHQ/GwHRPa2lxH157yi5iiOazS7ewRpvw/kFAgL42XWuTDChW2J
         T9Gf1/IYig/6Dy3zvcXQM8jpg90kgfNhs/mTlAT0xNlDS4Hy3V8oyeRCOCi83Xkr2shn
         sIsLzM4Nw2oDM2Gs6dZ63o2vwWD/lGubSk2GHfxo/kaJ2aWwpdhRwQjGXcK7b3hjtxec
         15yg==
X-Forwarded-Encrypted: i=1; AFNElJ+umYLWsHQ8vmxhrvr6qmT2TwVeo2Quo/6BFd6xEyOyfRUA9U9UcJv59JcJ9qMj5A6SQ+iSxI0I4pve@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+W7YFE3eqJZtIZYGXdywIbtDqi/U6W9EBnDW8LgYj9BgtfA9F
	Waw04lKlr/mjU+PJW67Ls969UbIfwaX5Z6kZWSQS+QOaFE6nhh1CL5rD
X-Gm-Gg: AeBDietn4x23dm3Y+zuDvLL4Eac0COVImf1CGyxcVpg7voj9Mz3Cpr0fOwDNbGKDlGE
	JYYmy76mWrh2GTbxOdD9o0fNS72Cc+OXrATVjNNjbLuQShfxjAz2ORLFnmE1hSzMgNJ1qAgKWiD
	fUhvRvbzKhmI2zNpcgx8l1J7UTpzopbj202l3XK0McQtQUMlcIpCNexTxMWAULld6b2jNJDS20x
	m0BXlvuw+LxhOrSi906SQhRr0nNRDbOtnz9mPOTcdmHw5Q9Ws6azPkVxwB9EUuJGVcmScwtXwdg
	a6Tee6cMVHgTfsGDsQYppthdxonx2u8UIujV93Xn1T48+DdhB3fTniaUN8fnQF9TbX/LwyRJtiJ
	luoy5PVl4RdxunGwG39V/8Dzc1/SsT0v6Yq8oT6TwQoKp0/HYVZw/5EOQteMo1tRiN0MQFT00Yb
	GVJarUnOmtSNWQzapGipZCo9g=
X-Received: by 2002:a05:651c:3259:b0:38e:7bf9:9835 with SMTP id 38308e7fff4ca-38ec7b09049mr22619261fa.25.1776523664375;
        Sat, 18 Apr 2026 07:47:44 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb4f51easm10901001fa.6.2026.04.18.07.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 07:47:43 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/5] Update APDS990x ALS to support device trees
Date: Sat, 18 Apr 2026 17:47:11 +0300
Message-ID: <20260418144716.132936-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document Avago APDS9900/9901 ALS/Proximity sensor in schema and modernize
its driver to support OF bindings.

Svyatoslav Ryhel (5):
  dt-bindings: iio: light: Document Avago APDS9900/9901 ALS/Proximity
    sensor
  misc: apds990x: Use more device managed approach in the probe
  misc: apds990x: Drop Vled supply
  misc: apds990x: Convert to use OF bindings
  misc: apds990x: Drop IRQF_TRIGGER_LOW trigger

 .../bindings/iio/light/avago,apds9900.yaml    |  83 ++++++++
 drivers/misc/apds990x.c                       | 197 +++++++++---------
 include/linux/platform_data/apds990x.h        |  65 ------
 3 files changed, 187 insertions(+), 158 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iio/light/avago,apds9900.yaml
 delete mode 100644 include/linux/platform_data/apds990x.h

-- 
2.51.0

