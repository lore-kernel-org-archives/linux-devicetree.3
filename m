Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C533736166A
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 12:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778244808; cv=none; b=T2Ny5oodqGue0hr5ylWevmyEHUHM765ugPYoriRe9qv6g5ZhWkoOZn8xRj1Ez+gGiUI0buCadtH35t+gmH1HbEkPNY/YuvqPipYJw04AXb9GFhQnWz/HHwcY11WeAjXUHiHyf0zpm5/ejTSV76Gp2u+kyov01a4UwwFy5VOKA/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778244808; c=relaxed/simple;
	bh=UyNlqKMM6jxuugzSOHKtl7TjL/HTQpOU8FeQj+AFrv0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LVKLZpx9eXJriWgCFUhEO80JEWcdYsk5EM4pJlBHOetPTi5RrCEuGAx6fpcOJ4nSdBloOULIcXdUmJLRwMinQX5Yh3EZNLKb3Vxp9JTBz6mSyOlqeEVgTs2FQ8SwHr68jO+WL7o4xfWhdLhn1K4O765JIBO3FEibaKA9LaO4MTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=suMoSycb; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="suMoSycb"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b9358bc9c50so323544666b.1
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 05:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1778244805; x=1778849605; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JHwS4Uc0l7hheA9OAcjg4DeynZW3gYZgbq5AyYeqW7k=;
        b=suMoSycbVVLo4wrV480BSj+9/LTIilQRcqZYOdJfGJJ7oTQIbrvJ+NSmgSEX/j219H
         1W+UrS2FM+Z86zf6ECO9InnIKmS4eHMAhSCYUfhFztsWAwS03agZjO9oeArJfwgflrCI
         33V2mnBbeSHOEnAVL0U8PyO0l7OKylwoNSrBowUS0SYYFYJkIR0YyItzZkQvz9Z/o3pt
         480DMRvrf87gavzYRIo4z2k5p7WzOFzlhQwjA7acmo6JNAY9MxsswaRVtg6GUHcQPxD+
         xPEFNYWlFFiEvi2nI4e0m7De/LiRPwVd+9yRFUo2EXdb/613Fs+T+Zq//rM+c6p/lqEL
         MQXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778244805; x=1778849605;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JHwS4Uc0l7hheA9OAcjg4DeynZW3gYZgbq5AyYeqW7k=;
        b=VNAvOipo7bbRKJKgH2aRbCVZyOxyCCt3isa0pH0QwVHv8cft0KjspKhfTGhX0HO07M
         OUQMoeKkAgV87PoZgg469xxmuY7EvaCoNSj1nu7XsXTP1X8lrMT7W5VMdKjdD4nYfaFB
         ICn+dLujdPWcTkeYKvDOJMfy1Y/RKDKKVjFDSCyMvFoYwdW6u4qSVkLpapfneyCk4Whj
         z6R8s3gqUahWR0Na2JtBWqaVexWQ4+oPkfhm/qctSNGa5jEFjWpS/MQakLB82Z14iiCZ
         8Y+sIpnjxUl53egpBc49r0qNYCFQRCaEASKB2uYN1JBVfxpPM/BKHPZuj3FQIZ1UbrhV
         BVCg==
X-Forwarded-Encrypted: i=1; AFNElJ8SzZsb5jPV1L9JRt3+Fw8YNS0oYcP0hQ9FMl7M68pFlicj1tqOuqCnYmIr6eEK9+sbHKcoPFAY1/Ma@vger.kernel.org
X-Gm-Message-State: AOJu0YzCBylvHVlcFdVAE7HVXO1M4cKCpB1D8+tbZrMciRS7cIGZsazS
	9IsQFRTxm5VBrAqUfDaEXWjmuKzYga/gjBtdC8eNT6z7IRdFxLTS1h+WY/W+7NcaoNE=
X-Gm-Gg: AeBDietdq1pQGDIh2GsGIyOWnIfY5P2KyceYpT3qJY4qnMh1USwLZ7zAnZDh05JfJeC
	DHKi36SaLbXVEwIEEtl/5AGiNX6Y/O7YIXZBCXayqK4AlUedxiqVO0IkvDmn/2Jc4rhg7UUXbnu
	6TL6GINFIYpzbWpnq3oKrNsU3k6mK/ws3KGAhjlLc5hvB+cPMmoGHx/5OvqWrwnoGB2RhA1L2+Z
	ZO/+8jeNUNfyvdnDU5Dmz7Dgl/5rrtjc7T9xGRRdKbo7BgygpWqC6aX/lSqmAskszlFqJOAjqIK
	va7Lp0hizTJgOcTE4cSkbQt88DqJBbfCrepZgS9D6svV8NZPTlUHwwY3qQ1c0rcrhqSZzVjiVkS
	UMqMZDfLlkB5NXx8Hbgre4BEpOKAFZVqYEMT6b+CjtbpdM2YSa4vijbpvx7sQA9YmsTYcRrUoTk
	IQznHX6BtgcWYRAjfZVLAfwNhMI8j8qQ/v6CnuWb37dFJvUbl34omLOHo0fzc+NLTpqVGOY1cve
	v1fSo7+DkJtIUBMdQ0t
X-Received: by 2002:a17:906:7305:b0:ba6:1412:9326 with SMTP id a640c23a62f3a-bc56cc26af1mr735858866b.19.1778244805154;
        Fri, 08 May 2026 05:53:25 -0700 (PDT)
Received: from [172.16.220.224] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcb94415c94sm800266b.53.2026.05.08.05.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 05:53:24 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Subject: [PATCH RFC 0/4] Add regulator support to gpio-keys
Date: Fri, 08 May 2026 14:53:12 +0200
Message-Id: <20260508-gpiokeys-vdd-supply-v1-0-0bb32e8e6428@fairphone.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALjc/WkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDE0MD3fSCzPzs1Mpi3bKUFN3i0oKCnEpdC1PTFLPkRAtTY5MkJaDOgqL
 UtMwKsKnRSkFuzkqxtbUAxXz4fWoAAAA=
X-Change-ID: 20260410-gpiokeys-vdd-supply-855d6ca8534b
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778244804; l=1461;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=UyNlqKMM6jxuugzSOHKtl7TjL/HTQpOU8FeQj+AFrv0=;
 b=SdqqAfe52S+/BdIS2Vl3iYr7jgDFH1N/kdT8Q0NQfw/xPPH/GfFgs7FjCMwrvjtA4jJ6DYNzf
 OY6YbQAkQBKCwCIAPk66yencQjLUKS7qlqIa4Ji3PU541vsxmaP2VeW
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

This patchset adds regulator support to gpio-keys to ensure that the
regulator powering the Hall Effect sensor IC ("flip cover sensor") is on
when the input device is used.

Marked as RFC because we may want to represent a Hall Effect sensor with
a separate compatible + driver, and not use gpio-keys.

There was also a comment around the usage of of_regulator_get() in the
follow thread:
https://lore.kernel.org/all/DI5HOWHCCKKD.1SQFAA3L4QFDI@fairphone.com/

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
Griffin Kroah-Hartman (4):
      regulator: add devm_fwnode family of functions
      dt-bindings: input: gpio-keys: Add vdd-supply
      Input: gpio-keys - add regulator to gpio_keys
      arm64: dts: qcom: milos-fairphone-fp6: add supply for Hall Effect sensor

 .../devicetree/bindings/input/gpio-keys.yaml       |  4 ++
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts   |  4 +-
 drivers/input/keyboard/gpio_keys.c                 | 41 ++++++++++++++
 drivers/regulator/devres.c                         | 66 ++++++++++++++++++++++
 include/linux/gpio_keys.h                          |  2 +
 include/linux/regulator/consumer.h                 | 30 ++++++++++
 6 files changed, 144 insertions(+), 3 deletions(-)
---
base-commit: 17c7841d09ee7d33557fd075562d9289b6018c90
change-id: 20260410-gpiokeys-vdd-supply-855d6ca8534b

Best regards,
-- 
Griffin Kroah-Hartman <griffin.kroah@fairphone.com>

