Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBB23A257C
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 18:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790705013; cv=none; b=AIe10dB/P4VpZ+8/TTEOMpBBgLA2glszJRCEe7jM5ZSao36PhmTwXEiC1VOdA5mekvMyZO4CPu7PXHXVf+YJIMcEk3SRomjBrv51V64QAggv4fipCogMBHGVY5KBi1YYWoYa2wvL8amyyCqy3yvYjOMSUCDoAT0iut2pSP+j4WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790705013; c=relaxed/simple;
	bh=t0us02vORB4Jz7dlERRWOJMbBxMt7gj0S+kDlcLt7Is=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WDrH36tHj8PxlezZt4LUiBWk6jWGX/BVZfHXM2NUfKWPQ+gashLQ0j+wBlg40yUKcB99ZwD7n+O27vljpfP5S4awFjXaaav59dBUX2QfhaboCEfnJ++1ZKSj8zM2FytIZcHJyqS4SviqgcBHvM3wvxKZ6z81zGRBBuLocW6Qudo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=P28wBM8/; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="P28wBM8/"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6c0fce17so24083245e9.1
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 11:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790705010; x=1791309810; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t0us02vORB4Jz7dlERRWOJMbBxMt7gj0S+kDlcLt7Is=;
        b=P28wBM8/xUsO3wSg7/3jXmhdIyBEWuXqJBB2rU+IJpsXpHmBgP8Fa01+p8LE0T8zWV
         5Bfv4g2AEx6pAs3WquG19kyWUutG/3uU1bPrloUIcBiTIr/KDF8H8ZZ/figb7g17QqJ5
         zcNAKL/55oxL3zTgQ1G4x8HH1kHBzINZwJkppRvDYfBzDctMF3UwAeook/oRX1TbzBd4
         OwU3IuhcVN7hFWQHsKlvX07IBaKViJKHjshkqt84H187bfk2DIU5q+j7awTviohvl9zj
         OMs5N/4iy2lYPSF9n70oJ5WUigQVrKivlxFIaAGoUZS4UnXCwnED2fC5C9IOGy5Oz3UH
         G/hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790705010; x=1791309810;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t0us02vORB4Jz7dlERRWOJMbBxMt7gj0S+kDlcLt7Is=;
        b=o/qvNAzDw6JdfWHMSxu6jNhNLIY3PgPOfgxf9Es2IaKNJwHDp/beI5Q4wiYfUhO7Hx
         tvrj84z0t4TL+5z+ULigl/MBSGw171ZK/NT6zaoAtrWqltI4Wtp7X6y+rpwxKlWpBV3s
         O5dPv1PbEKdRW7CDZMIKAN+ortjFGv0+P+yvjwwfmMTlVnDOWWlBS7gkj8ATNtO38hE/
         6DWpUbUu3FfChlNjELQJaJ/CApf+6nwoURtykFTqikHQYwPDxFAUHfF+gyplKVu3wbRD
         62gnyAj+FWvNB4G8ABYMU/7rSVQ1ojShVqhsqSWpuHZHVNwdjiXKsB6LAhTMvZuuCk2D
         SJsQ==
X-Forwarded-Encrypted: i=1; AKwUvBzs8Aay4+McaH/GfQaC6FMh3E+PzYlfQokrYjb3YQ9IR2VHSeNF7bLTV7t8drUwrU5Kg3xqR7y+WCRp@vger.kernel.org
X-Gm-Message-State: AFuF++l+P4jntDepdl2Dra79g10r8Ub37I0VkTA9Dpd5JtvphndeYKzB
	2cgidHOnut9j2+YVgGWXHR0nadRxj0GkImvZERF99feoKUqTuil4OUgDzZicUhGGyOMmx/k+D71
	5LzDW
X-Gm-Gg: AYBFou0AC4gNOZBXmZaBAsHJt7+C3MfBZ5wi5q/ImMvxveioP3P5pDeTD7qiHXOc4XT
	Co5NDRUPnPWq3uxZ1Ld4LqTd5e2Bs5Eg1+IVZ7yEYlJbpgrh7CNy/Wd4bfH52bB8lhZK/Am8dZ6
	IIpIkK/w2EAaZd/2GuTJFBNyvvVLO8EwJWuKZFL+oM3W4IERfyNtu3rUDaN47gAgmFgL+g4XJGP
	w+71FtugWqtUi/uvz3Qh5j+4ffQBr3sS5n66vo5cdC8PAdlfTzqB40SQKqJcQkVkwGEOT9R/RYO
	lwIILSajxTifEtJEI1uS2BKBj2vrtxtACTszrxCixJMn3+jO0vz208JG1iJhg15JtKhesss9mER
	w7vHtn9l17m7xMlJP6F5A8QNoGT3teV5lfVNv9n89KH+ddxh2Evsv6+6O+is0WXmXtKck3L1fp8
	gSlb/amrxf012/OdhhdEuVc4nAle9mY6eBIyQgvzB+RJYaY+jGycjztpfxy5NOlQxBr7ByATlG6
	djjJzvhGLcUAm91YA==
X-Received: by 2002:a05:600c:8b86:b0:49f:ce73:7a9 with SMTP id 5b1f17b1804b1-49fe6701ed1mr295156035e9.34.1790705009663;
        Tue, 29 Sep 2026 11:03:29 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0148b0590sm5696925e9.2.2026.09.29.11.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 11:03:29 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Junhui Liu
 <junhui.liu@pigmoral.tech>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
 <alex@ghiti.fr>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, Troy Mitchell
 <troy.mitchell@linux.spacemit.com>, Brian Masney <bmasney@redhat.com>
Subject: Re: [PATCH v5 1/6] clk: correct clk_div_mask() return value for
 width == 32
In-Reply-To: <20260514-dr1v90-cru-v5-1-34f3021aab51@pigmoral.tech>
References: <20260514-dr1v90-cru-v5-0-34f3021aab51@pigmoral.tech>
 <20260514-dr1v90-cru-v5-1-34f3021aab51@pigmoral.tech>
Date: Tue, 29 Sep 2026 20:03:28 +0200
Message-ID: <1j7bk43pfz.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On jeu. 14 mai 2026 at 17:27, Junhui Liu <junhui.liu@pigmoral.tech> wrote:

> The macro clk_div_mask() currently wraps to zero when width is 32 due to
> 1 << 32 being undefined behavior. This leads to incorrect mask generation
> and prevents correct retrieval of register field values for 32-bit-wide
> dividers.
>
> Although it is unlikely to exhaust all U32_MAX div, some clock IPs may rely
> on a 32-bit val entry in their div_table to match a div, so providing a
> full 32-bit mask is necessary.
>
> Fix this by using the standard GENMASK() macro. This safely resolves the
> undefined behavior on both 32-bit and 64-bit architectures, while also
> benefiting from the built-in compile-time type and bounds checking
> provided by the GENMASK() macro.
>
> Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> Cc: Brian Masney <bmasney@redhat.com>
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
>

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
