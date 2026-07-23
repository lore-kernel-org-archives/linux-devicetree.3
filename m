Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095BD448BBF
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 15:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784820595; cv=none; b=C26MvQvXDxeHhcNCNpUKymdrUiiSy3EyX0kILyeod5VVKaDVXqBtfIc7h0OsNLAsFEn8reTBh4nLq2zUVFqnmQ1XmuDiejWqeUYsz8sHPo+7p4Yo7adusyF/a7Xrc+tSWSoQ8uooBm6hudsK0Rio0zcVm+SMjqaXbHTf9jcT3j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784820595; c=relaxed/simple;
	bh=nY7f/xi5spwo7DlssABmzO20KeyENz5Bn4XAuA1GjC8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fiFd3pgmaOyuia3IeaPF/c8J2BTMqOiMpmYTZl5fg5KQIXc4A5Oc9UnQku8lHbTNnr4A4TQd4U6skyLvBcNyUD6b1OaTHulhPhYSJBHZSQEiU+qpLrRwhIF6OaidLijFgFs/YdP0GPC/rQNpi8F8/Sysj2H8v0ONgwo6QL8tRV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BssekyzZ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BssekyzZ"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49548e01d02so4748745e9.0
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 08:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784820592; x=1785425392; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MUe6DM8qKQE5dxOolqQrw2XXKMs3Lh0VGlvHRgfEXo8=;
        b=BssekyzZFjioSXV45QJkceRNhUlXlQ8iysc0tSeLmVidABUE0Lax9AdBmSOSomA7s0
         on+nyy4pyJ4PskHf+zA8f1jPkSz8rOdiwS8Ao/VKoBky2MrzQjt06yt0N1cWWc72bRh8
         b6e+IQabixV8yieZfVxIqEKFlakRGk/xGWzl/f5AfPgYM7nv/CDb8x4P4fIWUR+DjjMZ
         O0oedibfBkCOnYj/1Xhuww6OH8gCP4uxoZq5CQMJj0MD3ECl9zr/6j3ORg2ymMvumV5R
         XC9OTsagTNRHqns7zDyEVX3c84vdI5GZEhr2PhbxDmRpxTB9DIQuTOSkOYd03zApbRts
         7p0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784820592; x=1785425392;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MUe6DM8qKQE5dxOolqQrw2XXKMs3Lh0VGlvHRgfEXo8=;
        b=ngs3L1+0rYL3NfPnzjzLLbzPHhT9WXS/K7smCBT3eNFnkp0U4FO5jQ99KG7hj3ZjTc
         UI9MLU4M+siX9lVPOSFwld9WL2CsbgWIVCa3yVkOhKx4IIWXsRWJkEa1QAMZUH0Mi9M+
         whg1puuldqS7XSRjDKN/ohGA1/3d9wJDhxmOdxQI6jhlXYNow+3j1sglnodvfG6AyQuf
         MT+ikwo3fDJY+OPd3A+vx6QgjBd6/Zx0NOixCV2SB+1s4FJ0eXXrjizLTlvcqtC6aK7H
         zR5Idp+y6ogTv7e4UnPv5Bd63ckVlStOHuca1NWa+6Wr3URucpqKT71IYgUU8m09x/O/
         OrCg==
X-Forwarded-Encrypted: i=1; AHgh+Rpr0KgfvZW/xrlRFzr8c/rTU9U4ON6WML+VkxzPaxbEVr0O7mBuWs+T/RFv15rZ3bTX9hcacDszxbX7@vger.kernel.org
X-Gm-Message-State: AOJu0YwE4Q+4+z8nVjOObjHCbD2tMCgMgc2UOUcY1qBHCI1cWKdIyJ3A
	K7XLkH84oEHyTrhiFWpXT1Pk4mHaC4U9nuykq0iohltT0EUeoLOSs3hp/LJRLerIfcs=
X-Gm-Gg: AR+sD11n3OLbrUVU7zee1FwK2Ky8gHof9T+MDhLqyeYfhc+hmzocLIkwYYS4Li5s7tr
	VjsOqG3ccYMTX+5qubyQNwh/YTRzgVMYh0Q1r/gPi4td/ABGdNyuRT505XjoAs9qnq8ZY9ynGYH
	gbu+Tn1NpFKzt8l0tCRZ5Hqw6kGpxXoWVgPS8pSvwkCfrRvM0X2O5vEXJO9GdBMTK3sU6RHNJ3p
	48ytdp0XaocWGy1BOfl0W7niSUlNGkDZtF7WnMWY+D8HIsW0XPxh794GVVZy8oZzRclgIJc48V5
	THMyxAKFkW6jTUWAZCX0edXg6jPlXkrtoYSO4RFwA70Zxq57V2Ho26BTJ1w1LHvdBi+hIQbHNF6
	6p9FSOfBAYqjC75rQzKN9R7mlF/8OfxK2ivqoZQxI3rhFzpcy+G2bB0xp+UcYagEdvR007rkke7
	AsHSRq6hQSEjtok4kvDzZqeVs4EXDTMaKK7OoR5x+c8yRlFufncdsRSIYDajdENhTILg==
X-Received: by 2002:a05:600c:1897:b0:495:3f28:3f19 with SMTP id 5b1f17b1804b1-49573d21a4fmr26094335e9.37.1784820592056;
        Thu, 23 Jul 2026 08:29:52 -0700 (PDT)
Received: from [127.0.1.1] ([2.122.8.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49574653f83sm36952525e9.0.2026.07.23.08.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 08:29:51 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH v2 0/2] Exynos850 ACPM SRAM devicetree node
Date: Thu, 23 Jul 2026 16:29:45 +0100
Message-Id: <20260723-exynos850_sram-v2-0-c94968e52f42@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGkzYmoC/3XMywrCMBCF4VcpszaSxNZeVr6HFEmbSTugiUykt
 JS8u7F7l/+B8+0QkQkjdMUOjAtFCj6HPhUwzsZPKMjmBi31VZbqInDdfIhNJR+RzUuMRmkph7b
 FRkM+vRkdrQd473PPFD+Bt8Nf1G/9Sy1KKFE7a6qhdkNty9uTvOFwDjxBn1L6AoW9qw2tAAAA
X-Change-ID: 20260413-exynos850_sram-ca1200b99e82
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

Hi all,
this is a small series that tries to address comments provided here:
https://lore.kernel.org/linux-samsung-soc/DI6LNH2F0DP5.H1ZM8MTSDQJR@linaro.org/

Due to lack of responses I went with an idea to update sram
bindings to add new compatible "samsung,exynos850-acpm-sram" there and
exclude it from having child nodes and not required properties.
With this the node becomes a simple one:

apm_sram: sram@2039000 {
	compatible = "samsung,exynos850-acpm-sram";
	reg = <0x0 0x2039000 0x40000>;
}

The ACPM driver will just continue to parse shmem phandle, so
as far as I can see no updates there are required.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Changes in v2:
- small update of the initial commit message
  "Add SRAM node" -> "Add acpm SRAM node"
- new commit, updates dt bindings to exclude sram node to have child nodes
  and related properties, this adds new compatible
  samsung,exynos850-acpm-sram
- Link to v1: https://lore.kernel.org/r/20260413-exynos850_sram-v1-1-7fda5b7fb7d4@linaro.org

---
Alexey Klimov (2):
      dt-bindings: sram: Document samsung,exynos850-acpm-sram
      arm64: dts: exynos850: Add acpm SRAM node

 Documentation/devicetree/bindings/sram/sram.yaml | 2 ++
 arch/arm64/boot/dts/exynos/exynos850.dtsi        | 5 +++++
 2 files changed, 7 insertions(+)
---
base-commit: b4515cf4156356e8f4fe6e0fdc17f59adab9772f
change-id: 20260413-exynos850_sram-ca1200b99e82

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>

