Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E6842317A
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 19:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777489233; cv=none; b=Rdhl2m4VtWo+QNprA3kKx5eRqyn4DUD8YAVEPtzfs44L3wpMvU3ZpRiJ6roTqEZ9MchRLA1GvEz+BX2zBOtkRj2S/hAMqCumv6TELDRl5HJAewpl+jSheQY3+3Btxlj+xYbNlrRn3ur39oZ/lHB1q5Xia3aWUtO/jMdcfJPtPzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777489233; c=relaxed/simple;
	bh=gcPg21n+7REDjhleiyZxccUDctqNVYz8CCfBfgzqIGo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pg58wD4aHxkZwBFfJ/ljzt5yVkIsj53sEWZFN0NfTHJFpmS8ZAJwYRGMkCS5W8sm2+WeEDtqpqMqcl7OdGtIyoto7LniuNZxudIpj7lGc84fWHBXyrY9LKX+cS0wNpIBE+dR3qTE9hIunMvUk6TYXnVEAnou84do/uUDHX7nO8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Sij1a/Sh; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Sij1a/Sh"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48a7fe4f40bso1008145e9.0
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 12:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777489230; x=1778094030; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EeSG/sU57dwGrdaXnh7xf6O7BK0V9sIBOT8z7/4RP5o=;
        b=Sij1a/Sh0c7YITDCLtAb8A0pkcudvYgMGDetRq7U+crpWYYZ66iKl4bKJZ9MLiEEa5
         Y4DJwDRaFrI3xP3vJbuXzKAidducW2AkBEahJS/ySwxWChoET9s8y9eT6V7azFhVqHnz
         i6IpGZT1Pf1xR/VXTJ8l6OSbfiYSyAQOD67XJNH1QsWyqtpbilySkqKDvSupV4RuNeMt
         gsXGUJggPni1xPc8oDfljO5gp2VmoaYpFt5jy+jNSWLPREW8fueVFbJ2e0PtWCbSS/cn
         Ec9BoyV5Rq0MRzPcoHjpOmNnoqc4spRlEg8Z2QNMuDuEC3POnwQtMfzLL8HTYEOGb77a
         SoAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777489230; x=1778094030;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EeSG/sU57dwGrdaXnh7xf6O7BK0V9sIBOT8z7/4RP5o=;
        b=b/Q/SvVf5lPqyG6Dds2hbf7E5uhAr4GP/Ye1Ptdb23/pdOxMPSW2cCMfKah0c/g8am
         7z8sSNlg/P6BA16C4/fHHC2IUGlnRExs4/J+rTKHDtAkBgYfcjCTrUvsjx7TZNJqKnDZ
         pFTCL8/h/6LBjDJ/xttvb0/n677uuB6++OvOhxEIMjQ8g3BOPj8MniP6FRQE8wfpuA8k
         XrCs5G12/CVKtQZlwsM7VTWwxoPYCQSnCuZhgZKNfUmUpuQiliJQYzBGgB8Ffr/jOA8J
         FKKJ0Ti+Y3h7twT6jh/bnor1BuYLYTL+BRJjm1sxMiTTQ+RB/bHDZm3aQnmdvSpdE8kc
         aT5w==
X-Forwarded-Encrypted: i=1; AFNElJ8O5MrRRQHwOlZ1FOUUETfogOra2Wc+HpulZrKbtuVp7sYfvCzJV74lnH8UulEorD/EsRdWfriJZTT2@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo9sY713KVaAZs/YbrGilBGlkAnj1B5ldGyMTfH0lAN20mdDk8
	t3Eag/OivnL1C6HEroalwyzmA9XRzS7TuMCc0W7RmvCEkNNWU5z2ACuZ9f/OJr8KZLw=
X-Gm-Gg: AeBDietU7PXOE6017XEnketR/dKLkhSafY4UsVudBibClgxsleuyesVwZUm9qYupjvX
	Pb2ILQT73zMmgUtIXBu+8aC+CZ+pbuPyLC49z3b3kWbAOC9MKSt+mrEzpdbbKPG2TLNAU4ZEc7S
	yW4j5W/KrBPOWKBSYoNpfKeyPCr5F+L7wp1DU3om/9ZbsKpqs9tnX01P947bonor5038J6pPWMn
	Jqhua3s1oE9ntW3M9dRanQMs4gOZpEkRZotupjQegl1mGVt8picJDYPg6KMXEo9filYdXxmuX23
	juJiodo42LAURuPul3Yf3gmWpRfyzBV+6IoXuz/BRIg2hBwqEb9KAFhvJsjdVeYoHkz0Rgr02CE
	9phRMgwXANh66iw9c5qMbDeXSEk3dV9xVxPqbwmn0fQl3I97l1Q7vPUmIh+Abonx1hXy1JzEWCa
	axfgQGZGWsjRzD9n5bj4yd4A5rR6q7a8mmk1EL/2QyHxUD01FRNVtfjZbQDiZLmLnwiiNjdVOMf
	6jl+zF6ZqcVUrMeaYHSZFeijRg=
X-Received: by 2002:a05:600c:1f13:b0:48a:7772:c26b with SMTP id 5b1f17b1804b1-48a7b546cf4mr85601935e9.26.1777489228834;
        Wed, 29 Apr 2026 12:00:28 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7b900b40sm26187785e9.2.2026.04.29.12.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 12:00:27 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH v3 0/2] Exynos850 AP-to-APM mailbox support
Date: Wed, 29 Apr 2026 20:00:23 +0100
Message-Id: <20260429-exynos850-ap2apm-mailbox-v3-0-8e2719608c46@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEdV8mkC/43NQQ6DIBCF4asY1qVBUANd9R5NFwiMTqJgoDEa4
 92Lbppumi7/l8w3G0kuokvkVmwkuhkTBp9DXApieu07R9HmJpzxhgnOqFtWH5KsGdUT19NIR41
 DGxZqAJiRtlFSSZLPp+gAl5N+PHP3mF4hruenuTzWP9C5pIwqKVwrgKsGzH1Ar2O4htiRQ535R
 6oY/yHxLBldA1gApWz1Je37/gZAfZJrCwEAAA==
X-Change-ID: 20260320-exynos850-ap2apm-mailbox-cff0c8d69898
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Klimov <alexey.klimov@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3

This patch series introduces support for the AP-to-APM mailbox on the 
Exynos850 SoC. This mailbox is required for communicating with the APM 
co-processor using ACPM.

The Exynos850 mailbox operates similarly to the existing gs101 
implementation, but the register offsets and IRQ mask bits differ. 
This series abstracts these differences into platform-specific data 
structures matched via the device tree.

Also, it requires APM-to-AP mailbox clock in CMU_APM block (which was
already merged). I also dropped clk-list emails from this series.

Will be appreciated if it can be tested on gs101 to make sure that I
didn't break anything.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Changes in v3:
- exynos850 dts change is split out to a separate patch;
- updated commit messages to a proper name AP-to-APM;
- added comment "ring the doorbell" right before generating an IRQ to APM;
- renamed regs callback names to intgr, intgr_shift, intmr, intmr_mask;
- Link to v2: https://lore.kernel.org/r/20260402-exynos850-ap2apm-mailbox-v2-0-ca5ffdff99d4@linaro.org

Changes in v2:
- dropped clock patches (they seem to be merged);
- patch 3: updated commit description mentioning that
  exynos850 is not compatible to gs101 mbox (as suggested by Krzysztof);
- fixed comment description for struct exynos_mbox_driver_data
  (reported by kernel test robot <lkp@intel.com>);
- Link to v1: https://lore.kernel.org/r/20260320-exynos850-ap2apm-mailbox-v1-0-983eb3f296fc@linaro.org

---
Alexey Klimov (2):
      dt-bindings: mailbox: google,gs101-mbox: Add samsung,exynos850-mbox
      mailbox: exynos: Add support for Exynos850 mailbox

 .../bindings/mailbox/google,gs101-mbox.yaml        |  4 +-
 drivers/mailbox/exynos-mailbox.c                   | 59 ++++++++++++++++++++--
 2 files changed, 59 insertions(+), 4 deletions(-)
---
base-commit: 0787c45ea08a13b5482e701fabc741877cf681f6
change-id: 20260320-exynos850-ap2apm-mailbox-cff0c8d69898

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>

