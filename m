Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532CF3D3CEA
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 10:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781174134; cv=none; b=Lu5OlBtEZiBVwWhDMciOffrQomv73fhcaGx1jYYK/LZgMhW46WQuiASMY0a7VtUIOpnSBmNOPIt2kb5BKrriyWql5YlwtAGIcmMKp0Cd9VZwboRTnVF39wMkgcB0pA2vlxZEYFbDPzzJXgBaLkPwHElttoP8RExoCKm4aLoX/YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781174134; c=relaxed/simple;
	bh=Kc6nqqZ8KTmCbRIQk35GRmpjW/WdYqsKqWzv8+3CRww=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uLhunp4LT9LyB56jQ8Jmv19D2Zj0riNs0i9F0UH6EgdzLaPyy/k/Q9zW1JCwSAQf+VQDjYKqrSQluhQk3OUjOD3fFAkRolrplew/Z9vkJ7nfPH6l4eyQ8fVN+4SYfU2Bk9sZEAWQEhk4V6d7GJW8aV1ZhZmtcGsZ+NVfm6Pb814=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ioidWlQm; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ioidWlQm"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-bebc80100efso835227566b.1
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 03:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781174132; x=1781778932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kc6nqqZ8KTmCbRIQk35GRmpjW/WdYqsKqWzv8+3CRww=;
        b=ioidWlQmm3AjdBzgQFWjIMQ+ZIZnX/vijygeiC5xX6r4r/5qfqCXMLJJyukuB6exuF
         iYLmsaYnIYSsG5eQcn8vyr8YaojtfJBaxJT6RWEjX6VH5WQ01xhgrFtbCz+CC1bPPvCT
         1ozCCpXDIojuXiwxk6Nqsx/xFozBYNvSUKNA+mrE4zIUEkKoEkm+3e9VBns1ibEiNdNi
         C/0awOQrj35+f1RFwtockQNuRfn2yU0KjKoIMY3RRx5IC65Lnhowx7HA7pkUuAIHMRUh
         9u8fXuFqt5CNGklJpAi5OlNzBIQL9E8H8JMARH10DQcM2LczWpI2iNCgtEktwjq6Rfoh
         L95w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781174132; x=1781778932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Kc6nqqZ8KTmCbRIQk35GRmpjW/WdYqsKqWzv8+3CRww=;
        b=Kt5xNpu8I4UJuR2C1P6QMnq7IeK0BAzMhGVt6ZSJ+1XsF6yKJhxxVq5B/BhfINDMeo
         A7YzfmeLYAkWk+Bt+NaS9kuvQUNga+ScIVTUjM8CTKu3yOjIB5VPnmrNMK7FXkkE4AaB
         NQIcS2gfdA30NMsskCmBQ/H5/KK04pVU+pVnK3PjeLULNEpE0IKzbyD+ICSUCcu4H3BG
         5PqpfQthaKHgHRbxotb3YfHc1het9hIQdMb9K5akaUnga54f7DoiPZx96Re4F2QPfeVW
         gItyT71KPnlKosq+5uWwGz3vDk57zBZ9KCkdwmWD9IshiMo1BkvlGf3WEumEnpi8r5or
         rITg==
X-Forwarded-Encrypted: i=1; AFNElJ9xLKWxzhf25ZQsfQVi1Vi+bZgdY/C9/cBe6SY+0XV4mhjF0F7JZO5cbWL9/v5Fg8H+3HULH5UfEhi8@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk+zkBoYdbTnDvGhoYHQ82+6YUu3/aMcPhde91ZarwU0f9bhsM
	9OKdINGmm/38xmoRifAvYsY+MUnRx8tgkG1KB5gxjnna8eQ9i4O5dFHw
X-Gm-Gg: Acq92OHs5okQKjBBYCNqrlAbEbUzugyAPUVXZtsUWpYtPvgemi6/6wA+h/TgPcyEbJ4
	8UqcmjffAfYCEgiii63RU+r7tdlDHRdZWuv3quSii0YYI2vTM7lJrQkcidRhhrNQcInI0XK2TJX
	JtPI9jnMasIapMjx5kCuniGW3Y2uMjk34Y4LQMpjmkxgCiiO7ycaRcVZ15JbaqO7tRL2eGpNZ+j
	PM96cCAvBTFZphs+1/F+VZIF+K/A2ly4CfRkBk5mGCe6sBnJah+1p2ghAuzgt/V8MwXNpanQx/D
	z38e8nX3zauRxURFOQ/es8HuJe6ukcSZJ6HuuYn1GRWAhN9eBTbaykhg1YYW6f1uJDpDvQZ9aK6
	Itj6iaViOowR5ukTdLGN6yE3mRaDvxyuO3ToCRWzvvu81M6LvBzn9r5UzW5TY4WqEiiXD0DtdHl
	iO8Qo27jqf/f8EJyrNBfb1TTIG5XpgVVFX21aFPmlvjgwziY/sRZ0hvYm22f7GWWztLxNrfU4NP
	lw/
X-Received: by 2002:a17:907:72c4:b0:bec:f580:8ee3 with SMTP id a640c23a62f3a-bfc88c40bbamr102422666b.46.1781174131567;
        Thu, 11 Jun 2026 03:35:31 -0700 (PDT)
Received: from fedora.clients.cmblu.de (p5df027fc.dip0.t-ipconnect.de. [93.240.39.252])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb0f14ef1sm49020166b.4.2026.06.11.03.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 03:35:31 -0700 (PDT)
From: Wadim Mueller <wafgo01@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>
Cc: Wadim Mueller <wafgo01@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Maxwell Doose <m32285159@gmail.com>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] dt-bindings: iio: flow: add Sensirion SLF3S liquid flow sensor
Date: Thu, 11 Jun 2026 12:35:26 +0200
Message-ID: <20260611-slf3s-v3-reply-compatibles-decision-wafgo01@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260607-quixotic-steel-puma-133410@quoll>
References: <20260530205435.37326-1-wafgo01@gmail.com> <20260530205435.37326-3-wafgo01@gmail.com> <20260601-banana-narwhal-of-music-0b4d3a@quoll> <20260601150959.49bbf125@jic23-huawei> <1dbd3ab3-de6c-44dd-8100-e8ee60f558c8@kernel.org> <20260604100304.11d0e003@jic23-huawei> <200a6c34-3321-4c2c-9746-52348e700cd9@kernel.org> <20260605132135.141422d8@jic23-huawei> <20260607-quixotic-steel-puma-133410@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Krzysztof, Jonathan,

for v4 I'd like to keep the three specific per-variant compatibles from
v3 (sensirion,slf3s-0600f / -1300f / -4000b) and no generic fallback,
since the flow scale differs per sub-type.

Krzysztof, is that ok for you?

Thanks,
Wadim
