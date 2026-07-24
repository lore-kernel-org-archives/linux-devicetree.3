Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2CF1DF75A
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 12:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784896804; cv=none; b=O//qo6HW7Ehs5/DZk+046Ns/FYLXQzs9cme8z4g+tJjBMzkH5sB9KZbXkGPVq9JcNWrremw9lC6v+45v/LNdu9nXvmOFpb33f/EuO5wKCHrTN5Xw3C3INubLIPX9xe/RVvLY6hr0JrkpB6hiJlx5MLaO/HwLFdTxV9BfEFvkk9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784896804; c=relaxed/simple;
	bh=+LKKqb5ZqdPr77qli5tmJ/6wZb62O/rS93RulG8b1G8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fnuveF9jbHh3eAxE43JyEkBp+30gvQ/xLhksx0MlJazXdicjrL/iPN4I8uK3lrtWeGHGTnZbeP9yr1HLLFBck0wXlrMyiVPpSnvVodgx92Dv92l9vdKhilTFoJf/xqzyh6fU9lv/3logNa3FpBXTjES8W7LaHvCBitDKhsbtNLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bJpoj2DR; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bJpoj2DR"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso2969695e9.0
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 05:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784896800; x=1785501600; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NBrUSC1O0WOQ9emuFEGS5d8tSVoT5Yvw626g9QceW3U=;
        b=bJpoj2DRytSFGk6wepidoXxIL6r/tV1GZ/YFSrIPkjNVZF2+HSLWfGPFsbNtvLdirq
         DLcEUbFuMVHa1zc+eP21GYwdpzbbq8xu5mrm5Ft3mci+UX6c2g9LE4PmoIQ6WpdzKxYR
         cL5R3wVQQ7kk1pbpzzz6S4fKn4mWDFCFnlwy+n036gltntKLEfF0VLS42E3ommPdor0V
         AJDlmoYa2m4uZZDACg/YK+0d4qx2e57cwuf3UxIJAHFLZXKV1GjdmZzkCIfi8PvjZxQb
         L+6Rk80VgkWf/l067OcSqUYv9W6wTimpO/EtpHzkhk/nGdgLLdRRoz11EJkPLRZV9wzN
         uqnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784896800; x=1785501600;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NBrUSC1O0WOQ9emuFEGS5d8tSVoT5Yvw626g9QceW3U=;
        b=gD6r5T1k9rBqWJj1oTHhbInOx8qCmAnGyq0QJkyCtNqJzJhTV9/ExctWMORvmGRooT
         Z3faHKQTBp8loR05YzdjvxGsQjc1deJtDclYlrlcAYQrd2RDPPXpdgEaRzKB2GToYvQF
         YWUwcwJE9ygrF718szNAtF5Wny/X0XuHOUOOqMOY5Cxx1Car0V4zgSu/+J+T8rBvlRm5
         mpeelD2jhP5raTdxOkBnRlqvRSASDHjT2Fil3QiHjoVXldaYLUkQRN1x0iQAjhNPlPch
         sabhHxj/QM1JIm/K+OLTM4CMi/HfFGSoTyLUQKXrZJd8i53NaJ6LhVTG1o4JpEvbtWXe
         WRmQ==
X-Forwarded-Encrypted: i=1; AHgh+RrnExTgtXcsMJJxnUmwJzYrB5QSlXjUXx3SAXXolAMMpTMs8mw88YRsaXyurTkaOhtCmWW9COQLIp0+@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3VfCmncmU7zbeQMr90L86PNPhiyqcs3BORXYA7MUgVeuY19TC
	9NeXpz8Miseqgwe1uhh++59FdfOTS2msAJIIjH/KOKJ5unPbwk2nh9FRZ9h/pQTS+jI=
X-Gm-Gg: AR+sD112mQBSd6EKIu1abojr7feA4uCQHBtd8MaehuI3wH7i3nsAnKIwVMnzUP4g12k
	NyNHJmGy6pajFi3EWxVeML1oUjIvD8xdjKcSMN/vUlH+KYkNNR+3+JVD2t2irAh8yPnh4BUTXKy
	4dFRtNM3n7ozywptbO4/MS0kurFsQirCZszj77XNelpUYaDhIkdnxofPfFTI6lI5dbK7Y31E+lK
	Fpp+vwjUgnCgQDK36vBlYRaOUlv/hKGWJoa7/GNAADvy/TgldK21Wt1f2g0d/AN1ihNiYjfysHJ
	p+kW9jGpN4zqJyvMFsI9r8ke/UCJ6hp1ohlggVFb8VhtmPdH6yu8mib+8GRunz4fqme3fnTG5FO
	GYiYjn/YQqdE+xUu4uOwkrEkG7NeGHiUU3NqKOlwxCADd9djyrhWwYPqI5jJ7xH9Pf2kXqUaBMT
	GUG9+3gqtwF+5bpjNmN5rfEJliK2IDCGyvePc=
X-Received: by 2002:a05:600c:4f86:b0:495:6a24:a92d with SMTP id 5b1f17b1804b1-49573cd8af8mr83332165e9.22.1784896800602;
        Fri, 24 Jul 2026 05:40:00 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([2a00:23c7:314c:4601:a07c:a901:acc1:9287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957af6b10esm71556795e9.5.2026.07.24.05.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 05:39:59 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH 0/2] Add arm-smmu-v3 support for instcfg data override
 feature
Date: Fri, 24 Jul 2026 13:39:41 +0100
Message-Id: <20260724-arm-smmu-v3-instcfg-override-v1-0-e7acf4a8a525@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA1dY2oC/x3MSwqFMAwAwKtI1i9Q6w+8iryF2lSzaJVEiyDe3
 eJyNnODkjAp9MUNQomVt5hR/gqY1zEuhOyywRrbms7WOEpADeHEVCFHPWa/4JZIhB3h1LSN8W7
 yVNWQi13I8/X1w/95Xm9No+BuAAAA
X-Change-ID: 20260724-arm-smmu-v3-instcfg-override-b5650fdbfe34
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Pranjal Shrivastava <praan@google.com>, 
 Daniel Mentz <danielmentz@google.com>, Mostafa Saleh <smostafa@google.com>, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel-team@android.com, tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
 willmcvicker@google.com, jyescas@google.com, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2030;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=+LKKqb5ZqdPr77qli5tmJ/6wZb62O/rS93RulG8b1G8=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBqY10b8hqtiFJgZNPKKmccvQiXiJ207C2BIrxZG
 XX6WJTAaLqJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCamNdGwAKCRDO6LjWAjRy
 uuE8D/wJJ4iuiOHoo3Ba+E2kIrjoJF0Fvyyi8zfBoy0a23Ep3SQHV2ozGw44bn3MM+AnFDe0kQo
 K7n+PTewI3MkJc3c3ZQ0ERKIPmcEsiIsn2gX26ShPCn1rlmjJuEhpiBfXA7VU2++AVuTV07n6uc
 rLH6Zos/1Zuv6p/lZyzOd316J87sgMuNP+AYzfX8TWnGn0OYhxrltSPRBOuXFy2C/EG6CAlFMpE
 Myu8NAzTuIBjapLrJLT6JNILVZkAliNhmMZhXClskp7XqTcGxJrnu92RW0gq0zMndxQixO7AO3H
 se508EAQJvHN8sc+cHzOyV3PMsnX+6OmzWPf1ZZq5YcMFaec/bGJvHaSMCVE3zLSn53o41UL3q9
 McQs1kU7P0M3XH1COuT+ySU1KUbj96wW2bR4eDXmm9iJuk8nKGPP5EGeb9U8iAmz8zM3gv8z5MH
 TbABDCW574tZXzCJo5deKVsFzeIp6ea5zstz7iFiSAy34/IV9+520H5EjRtZFKI+MMszucOqiG7
 Zxr9bX8aw/T33kLylD6ih1LV0lW9Eabw7soCRVy9YF1Bn2r5GMIerZ/njASPT2lCLYv4193TXP8
 EH0i9rOUrX26e3ETtY1PY/4i5wSk8kTUR4Qz4x+Ge8KlX6MbADzr5auS6HEKqUnf5uJG/ULAM9l
 wtz0zmXjoy+6v8Q==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Hi folks,

These two patches add support for a new "arm,instdata-override" DT property
that enables the override of the instruction/data attribute of incoming
traffic to Data by setting the INSTCFG override bits.

It is intended to be specified when the smmu can't guarantee that these
attributes are provided correctly from the client device.

One SoC that requires this for some IP instances is the Google Laguna SoC
found in Pixel 10 phones. The initial device tree for the platform is
proposed in
https://lore.kernel.org/lkml/20260722-contrib-pg-pixel10-initial-dts-v2-0-3abae9717feb@linaro.org/
but other drivers like USB glue and phy are already merged upstream.

Downstream code has used "arm,instdata-override" DT property name, which I
have continued with in this series. Existing options upstream tend to use a
vendor property e.g. hisilicon,broken-prefetch-cmd or
cavium,cn9900-broken-page1-regspace. So an alternative name could be 
google,lga-instdata-override or possibly google,lga-instcfg-data-override.

So far I kept the original downstream name as the override feature is
specified in the Arm SMMU architecture specification and could potentially
be useful for other SoCs.

Arm SMMU spec that documents these registers can be found here:
https://developer.arm.com/documentation/ihi0070/ha/

regards,

Peter

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Peter Griffin (2):
      dt-bindings: iommu: add arm,instdata-override property documentation
      iommu/arm-smmu-v3: Override for Inst/Data attribute

 .../devicetree/bindings/iommu/arm,smmu-v3.yaml     |  9 ++++++++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c        | 26 ++++++++++++++++++----
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h        |  7 ++++++
 3 files changed, 38 insertions(+), 4 deletions(-)
---
base-commit: b4515cf4156356e8f4fe6e0fdc17f59adab9772f
change-id: 20260724-arm-smmu-v3-instcfg-override-b5650fdbfe34

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>

