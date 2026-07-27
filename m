Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ECDE41378A
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 13:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785158628; cv=none; b=OBR2DmJ+E93eeCqL/5wnmX53Lnqy11NRRM8jMrh1L3SK2yuM6cO2M3g7L/9SxEYdQy0sfsnhUZQ8cdn5Y6vH30NeGJEur0XNbQbvWLOR97wOOH8JqZjaH8HTDTdDOtcBMzch5k8z8POSp9nYbzX5wnbNu/X+7NMAuugjh/gXLvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785158628; c=relaxed/simple;
	bh=2Gkm3zhVv+H/E0YS9izygnoyW01pYJOB2E79t/lSi2s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eWxLf6tkw1NlsW2nqLChfGVVYoK7Ivw+EFf/siB5xI9Q7+zIse4Yz6fWSJcmfS1N2478YYosUaUe7ByrO4Q153By1f5YadgOolSqaFtMHQ2r3wMVZALbFM/++v2gsG1UQ1S+Y6+d9yk/D1kwQbdeSy6T9S5Dm7E2Od5f21ROU3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C1gwkuoy; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C1gwkuoy"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4955aa106b1so27133925e9.0
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 06:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785158623; x=1785763423; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qGWRiSQ7MtvjqqkrwlBWfRgghASFQFhWthLwwwGGRZg=;
        b=C1gwkuoyf97TcrI+PCWJwfVDmthXpwbgx28fzOw3Gwh8Po79sh1eBRREayDodl/wqG
         EID+yd1wIWxyalgJ4p64oHnUuh6x1CvmsAal4KYA8eyVdeuyiqRudYSrpN4ViDHQpzKG
         Y2QX56trP3ePvwCqOD68tMoFzHJ4pfKw2zUWC8JsK/EsWaclMKCyIp7HnH7oXd6EU/8R
         dGriQj00lA7CzlYMbYf27hoHzYHv5MQYMDSxTJMeaKaZvWvpleL401rZ7j0FyXOEAADg
         dmYD/szFc7Iwa6HHaK496/UjO+avZ84O/LazVkN9eUmBTErzVW41ghJZr3RRoTE3X26y
         I9Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785158623; x=1785763423;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qGWRiSQ7MtvjqqkrwlBWfRgghASFQFhWthLwwwGGRZg=;
        b=bwf8qDoVFlSuyYJeW0Za/KMM373jfgvJwk9r6PKWb1+yBxwiQ59/MphpfbzWWBM4N7
         PXheSWeTf6EX/MYTZzjoiwQbB4CQ52qvEokcHZOHpa3u2zE3jYXzh/t3qYsTiVgXNxOq
         FVHYYKQNXAdt3wQsLUr+LnRB7x3LVxr0FoEOZEp6yS+29BkcTC06zCEpeS0PoATVAYIp
         3Fo21yA+X2MtzrA+PWJcWat6XolG7qvGAt3G1OkpuZ6g5/CllhYaypmyC8DY0sMazyTQ
         OOvkLvhAeTt4m9mqN02QhL10kiB0YSfhz+hjG4A+LCzheIuPBq3wWNOVKqoE1fGgrWYm
         6+yw==
X-Forwarded-Encrypted: i=1; AHgh+Rq73sVWaOuRrCHkgIojnJv0QdzUeHajoSLGUcPylyH9lKTD3P7t8EInj5e8CdeaQ6xu29UJ+9VHXSOw@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2mpUl2yD3n+Vff7mdw6tdtyCPKJc+FYnGJw4dCqAe36J/qUDn
	G78xN+NbiStnGNGlxeuNboGMivVAQ0WtkCTLi52ZRXGo3zY5hDfT7KKWRwYn8EUeTfg=
X-Gm-Gg: AR+sD134EXanBv9JuIiYnf0D9NmdvPhgqs1Yj7QAHBzxlUdDDD5K45su1rOnSg4kMnI
	K6vxSncxxOT91UDP1WSPaUSpH6/QQvDDri2VvnP2axpqc1JoSud5veUDFQXqH8hRZHFPCwYabgt
	tCpazWTS3JoW+A5XLf5zUSpaNfACpXIvt7TFUaY48CIajkrHaQdFz/TRBoAxfEFhLmrYvSQdvFA
	HMLtRQXgtk2JV7QhrGO4yhV7CZsvfuFv6XHXqmxCmrSij9D7z+hCTJoN+t0rKizwumbGgWmtuS3
	+gw0zUeO2e6QCxGVi993+klsG63Lmvp0H9i9jT+N6coWYpp3Nk0++fiOOu1rWrAwrXy3MOu9v9q
	FAlIJMWs+vFsvkV/hdWqr+hfHMnJLwxX5Uiv5luyT1webSn8AGgl8QUsZ3PmJWrEctzDV97bTEm
	+5rcqGmGfYb6rFst0dXTFRT4zn3AaeH5Hi9UR1Ton/c5y7agYkNTUMm6/HDAUe6S4EEKmbn4j0n
	yM2TUARt/74miQ=
X-Received: by 2002:a05:600c:4444:b0:495:7757:f467 with SMTP id 5b1f17b1804b1-496b56fe1a6mr99305345e9.24.1785158623435;
        Mon, 27 Jul 2026 06:23:43 -0700 (PDT)
Received: from [127.0.1.1] ([2.122.8.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4ee4504sm224730055e9.6.2026.07.27.06.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 06:23:42 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH v3 0/2] Exynos850 ACPM SRAM devicetree node
Date: Mon, 27 Jul 2026 14:23:25 +0100
Message-Id: <20260727-exynos850_sram-v3-0-8627a49188ec@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM1bZ2oC/3WM0QqDIBRAfyV8nkNvlrmn/ccYw+pawqZDhxTRv
 896GWPs8Rw4ZyERg8VITsVCAiYbrXcZykNBulG7AantMxNgUDPBS4rT7HxsKnaLQT9opzkw1iq
 FDZAcPQMaO+3DyzXzaOPLh3n/J77Zv6vEKafS9LpqpWllL85363TwRx8Gsr0SfHoJvz1QRjslV
 N1gBUbAV7+u6xvJq0Cp7QAAAA==
X-Change-ID: 20260413-exynos850_sram-ca1200b99e82
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3

Hi all,

this is a small series that adds sram node required for ACPM communication.
Bindings update adds new compatible "samsung,exynos850-acpm-sram" there and
excludes it from having child nodes and not required properties.
The node becomes a simple one:

apm_sram: sram@2039000 {
	compatible = "samsung,exynos850-acpm-sram";
	reg = <0x2039000 0x40000>;
}

The ACPM driver will just continue to parse shmem phandle, so
as far as I can see no updates there are required.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Changes in v3:
- sram node moved to the beginning of SoC section in DT change,
  reg property updated to match section requirement address-cells=1;
- updated trailers;
- Link to v2: https://lore.kernel.org/r/20260723-exynos850_sram-v2-0-c94968e52f42@linaro.org

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

