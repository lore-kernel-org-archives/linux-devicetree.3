Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF4D346A1D
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 19:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783453029; cv=pass; b=RxSgUNMMrtqb0PnNIjTxlKRbd3X8Py6zl9mVayEQH5PjdVyfg2js8DA3JyOJtKrstM4oeZvu7Jge3XPNcQ7yGkgXwiu0L7MSgGf2sWhH4UvRNK91XG6Dswm3lIPVWxX8m7rciCgTnw6Z7UzlOIoDXV4A5sESA3mYS1w07ECLof4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783453029; c=relaxed/simple;
	bh=QzuQavQKc4mdVC+7oXwG28ZoqFmPWm0/w5LBLFtSdog=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dpj+qaoR1aiR7F25FcYLwi5WnVs9d/EIs3gcnTtZ6yeJbFZ4jItSc1atr2B9Qtlar7N/WfZ/QruxbQfkFDVHs0XpF7gb2Pb/XjMym+03MU4HaxpfGhb8F0wb+uaE1HbwkDvy5Dl/xvfcnAXC8w+Lmm9qLO+pBQI3Jn9DH/RhEX4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=JgiAq2AL; arc=pass smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="JgiAq2AL"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2c9b1edf2bdso58209915ad.1
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 12:37:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783453027; cv=none;
        d=google.com; s=arc-20260327;
        b=hp6Zu+XrlpMQCb+iQjnCZoOWO3zbrUKSLcbtqx74X04CkVqOZQOatv0v6u/aDfh1DZ
         /pCF1cFiQlX2Qu3ls/PUVO6wGaflalucfPanwIpMUxSaQNMIAUapRHgorxGVvOXvc8Gw
         dL+dKfGFR5uarugOFKUSMCqP177A77VFGeAWWwu2SL6a48x2uB5WjM+kA+lBbaodMQgo
         o3cL2aUaHMUwpjbrRyUeVrQI8rWvUpnEHlVEfWqaxSomTSuMox7cVAgxGsMccCCtPuyM
         8Kizbt8CqimCXgGEfLPnjbHuw9eaAtxRUHvG+AGi6ITnHXH5oxNNtXZ8In6D2huGpalu
         LU5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QzuQavQKc4mdVC+7oXwG28ZoqFmPWm0/w5LBLFtSdog=;
        fh=cs4Xmz0c9rAA3AivpW5zCrSL5r/LuvNHufYVDWNVvdI=;
        b=LZniuV2EhXfLIWkCPe0kT8wsnIHdWeQGo2JiqnqcZuS0N6Cp10IVoy+TGiVCeqTZpw
         7d5YmkSmZPrKXH9n9Mdj3luCM+PiBHEKQqW9Pv4CVMfPI+tvSC1PTkgY1ea0zYcNzgQz
         52i0jRUEQ1CGgelAfTywUjdmveAgQ8rKH4V4Q0/1azhYADaxI1MHWe/pQdb1wqyF/3+r
         Jl3xjV3NcluWgX4D/BTs67gpylbig9jia2KgwuMpX1pC7oYqJtTPtmcx2MPWz9ZvNWw1
         453rRcgW0tvwQ8xiPj+7ymhzAFjT/oXvUvOZpgSPsVe5ZF7Wic1ZmAJMrPlOkOHJPRjY
         tEWQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1783453027; x=1784057827; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QzuQavQKc4mdVC+7oXwG28ZoqFmPWm0/w5LBLFtSdog=;
        b=JgiAq2ALNFDnhk7sH9O00TC5TUULfXJ7V+jOCpXn7mFCrPdWiEJ43EvKsH0XvVIUAm
         V20OXTN9/0RB8xP+Wnj/oq7Z2aGX33FjumLE9sE8dZJQsbGzwWC7aN35jS2bsgs+dENP
         /D5To24/RCAlTMH01Cc8sKKVNXVSJbq8yANbR6a5dv0sdcRD3RFnMgvKZCI8KvoQFjuE
         9ow+x3lZDcGm9uwFVIqMmQEmjYz5lY7h0ynLLFjCyg73Ovmo/cTqml/e+8gQROBZuwvM
         wtSKt8QGT+4fAwKedoz4TRbYCXmV9tXXnDXuKQHj99ihqavEXL0fPTUEf2aJRR0OvmjJ
         /y0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783453027; x=1784057827;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QzuQavQKc4mdVC+7oXwG28ZoqFmPWm0/w5LBLFtSdog=;
        b=dhQK+mUuolSJfr+tCwBq0Mhzzr5g4uoz5XAA3cMzlNJkz8I2uPPtXZuJc/wSpeRvQs
         K1vSz3prvmJ4V/Rb9ysddBMaAK0OEK1PkPbKSpMx+EaoaA3vuzALPFBFUNP/1zTeOycM
         rE5wzz4w7V0ig9keUQbRoEKFq8ISwDNOjdrkGAuS4xlKQa7nXCL4rva5/BMJuhOAZSNY
         6CbmNtSmsefVj0PvzAUt4ueTJVAqu/SS9rdFv7Anbg//DtgKrnCjNMtGbZt984V+cRXA
         kz86jqdDAbl0mdUcsdsh7Y9UmQhcT9B9sChw96Gh511kWhf3zHyPIcHovh2EAzRjBYvE
         04Yg==
X-Forwarded-Encrypted: i=1; AHgh+Rrb+z7RBGbFu9qlMMOTsyo3YiZFLHZUwpq5JjQ0Dlp+u/oRBtRkxOtDNRD+gfXDU8geSEGcIclasCWY@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0ZKMd3X5BnxX1XOb+P+ZXM905C+r/5LZSE4nFbQftu9tqssqI
	tZQEbVLhFD2zFbSRsksPjApbNqg5eQlVHtt2yXVoADi//fCEcXz4y9CAgBujGkCZXU6LARGHfY4
	KUsjZuwggklvpA5ZPB3Vr0HpKs8xsIY4=
X-Gm-Gg: AfdE7cnur4vg7mY8LkxOnCuoECJ2XzD6qO4syqp9T9TMiDnfwrUpz08TJ6Zd8LwjTrd
	DOGYkVQZEMwH20fhdiFyun88BYdRT6egg+rBGAFnvpJCMzfC5eOcHEZQFK3Pn1T7zHY/Iow4VWo
	qL0ZB+fsZwE99AgsyG1gCZg9ARE31q9R9VS9rMKKBrVMXC36OwKJa1JygxkmhpUuvRinT9+zK6t
	fuMjKPBorI9w9cwnzd0fEuWLDsa7zQnQ0e7ykD101Ii96K46nnlB03qj4rb3jAXmEEKyfU2djE7
	DDYfC8VGAyZDvRbqAo48HXsh0Q==
X-Received: by 2002:a17:902:d2c8:b0:2cc:90aa:878b with SMTP id
 d9443c01a7336-2ccbe728946mr63686975ad.10.1783453027559; Tue, 07 Jul 2026
 12:37:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260624135650.727077-1-jerrysteve1101@gmail.com> <20260624135650.727077-2-jerrysteve1101@gmail.com>
In-Reply-To: <20260624135650.727077-2-jerrysteve1101@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 7 Jul 2026 21:36:56 +0200
X-Gm-Features: AVVi8Cf-yuy-zDtbpT62GueylgVb7F5kepgWe3Xe-FkNm7a-D4HMWegM9GI0Nag
Message-ID: <CAFBinCAz7nDsXc80LQH+f2yC=o79E3nBhzL6OAUwYk2r3n_n1A@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] arm64: dts: amlogic: meson-axg: Disable nfc node
 by default
To: Jun Yan <jerrysteve1101@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Arseniy Krasnov <avkrasnov@salutedevices.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 24, 2026 at 3:57=E2=80=AFPM Jun Yan <jerrysteve1101@gmail.com> =
wrote:
>
> nand_rb0 and emmc_ds share one pad. Before enabling nand_rb0 for nfc,
> disable nfc nodes by default to resolve pinctrl resource contention.
>
> No mainline AXG boards enable nfc currently thus no extra DTS adjustments
> are needed.
>
> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
