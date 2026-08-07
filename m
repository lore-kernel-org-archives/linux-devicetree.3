Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40F63F23DB
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 10:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786097784; cv=none; b=uZ+U0IvjlJBpwr6e8pBXJNUdAhBAQXC9KE8Dqlz6GRwF8clk/yuc2RayMYyrj08nM/70UxU7h6JgRC7q7tBCwhDtPqvREZSTPqIo1Ied9SLaeuMw8yk6iDll96uvzpMMop67SGLVAEFEYhHVkkggSPrtOl9lEcLy56m+piwP85s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786097784; c=relaxed/simple;
	bh=tjuDIdXcHrXpHN+nqdQgulN8A1MZpSqxeFuirGPKwlw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z7PulXYRVOXqEDlnQlA+Bhzg6xZWIZzFdhFi3HohJCRIkq4DOkZQ4nVu5aXlDlAG9CsraUbNgY1gMwzVnj5DZPcc2lmIYQSxEtjHy8RbwPRkpHF018mXw41OJY7Ji6AeaPfTAhwiZomiUoMM4bab4BDpLaBGg7JazmuMZF7UP+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cl8Qti3l; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cl8Qti3l"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47fe89fb333so1956248f8f.3
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 03:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786097781; x=1786702581; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WsgVrGgvLQa6QkQgWXXH0NidSFfpFOJBXHIkDvCSO8Q=;
        b=cl8Qti3lkygYrfm7o36VS6AG0os0pF97e6vRLL++DyZ6KvODJubL6WBVTo0kESGhvY
         xTOXbRUp8Oa1KCpN5b0WkxNzH6Qvx8G6jjSUXdgjo37U0hhpI7Ko+aNFQl5cEUf7Z+lm
         i1iosLK3OxHb8xy6/gPqZ8BdfWfLdnxhsCB7J0AOesqhuRvaiG5s0jVnSEkpxvfCc2qY
         SELuoWwSvHbYE0hKWzyDZO+qLgXplf/OQzp7FUp9T7JhowJjO4PLxWTD4XzZdKX5/0i5
         +Nn8fCicJ62kwQ5vPb/Sd0qERryfgtc4JWQNu1AprLrcZPA2xHZxwpTbzg/nKOlzr744
         LlCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786097781; x=1786702581;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WsgVrGgvLQa6QkQgWXXH0NidSFfpFOJBXHIkDvCSO8Q=;
        b=RTquuGs1Rt+Gppg4vtF4rPlRQOISqaOf0rmOik9AgbMirDG15RSaarj8TU6C5eLHtf
         JBx8CrlLNxJX/4SLG0fXEJPJa5h1Wl415afe/zr/uGY8M+6DyHIE6YMNxwFxi/StumwZ
         TMxd9KRHtSLckE4gxYqMRnfiL5E78MARDC1XqB9Nb3m9Jp4IZomNXaUBTSp3eD8aSyBg
         tYqEUaxMvEnR13ucd+Z3cAaKO1BEZsZkQkSIFBXPB7PUhLJfYEy6KAwU+eSFb5ycvW0w
         FwHKx+GLWHvLq9HHlfwbB6aNyPb0Of/XEkjBtSI4PsTX1XaHYbWQyYkzEr20Hp2C+Bjk
         n4vw==
X-Forwarded-Encrypted: i=1; AHgh+RoiWTUY02jktdgslXltlk69Ym1cZXDLm2er4t5trobQENKhqC3BdajTFSD3fVrFVWKpICLUfFtuelCX@vger.kernel.org
X-Gm-Message-State: AOJu0YzCiCT/MkjEdOW6CyP6/K30ddnYihxMwrrRfwR6ikqVCPKlE315
	ob+4oSsgOpJ2bfKth7FPfQ4ibj3RYegIQA9QEaa/i5BWclEKqYcRSoya
X-Gm-Gg: AR+sD10G6J3ZzOFGTog/bhVkSWGPv6NWHvYXKIvgc0uvhYMbb3niYohmPgl2L11nnUu
	yBcJolMi0auFEyTKI96ITebCbYxO3C0SZBGZ30F6vCX65+PRiu4si+7zdqo7Ah7bsDCorTSJfFL
	WVB2b+Ei1P0C7q5gK9Bwu1q8pZW7D+twThq2uGFCnI8egzlEOXVZ5Fao/dbbuSK2c2fMF6wKIv6
	nFe3Lhcd0wt5OGZ2CAVfLiVmBfR/BNPwwYIp3aJXZYzgZBX5doQ/3JM1y8f56KMELqjJSb1hF2L
	zHhXvMvYDkTnVDsl4SgLjfHobm1G9T72fgbgb12unxpeOCkSSMHojmrCrUnHOagHitRyymfj4O/
	a00yAE390DF8wNwwVItg9PgrCTeR48+JBe9YeKeWnDkumI4vaVklviP4fGVdeIyTIlmvOLVu6J/
	BgD2Qlpq4m928ja9YpJ6fbiXV+Ma5Mcetdo4u3jvLKPShGNbAkWucCLhJZELT+O4TONKy3ETILk
	76mX4JyxxROkOwYTxqHAfaaatPwobW4DCaOIZm8j4CjWDdhFvSmcjEceCNBtlMA1ksetOat9Oyy
	Pe8tnhj8j0dxepfIZHwTRkeFT1a3dKXjYkUGH82/SFnfcpcpsT8PRv5F88Qu3WX6TYlMUcOOP6n
	uF4pQEVNZLCjMiAjU5hCzWBM0hS3fZwj83dK7WQGneN5/4PARGHmPl1TRy10D4phVyOPnt3C3uA
	o9R34GaGQ91msgO5nbIA==
X-Received: by 2002:a05:6000:1844:b0:47f:9c6f:8844 with SMTP id ffacd0b85a97d-47fec4f8017mr30356720f8f.9.1786097781292;
        Fri, 07 Aug 2026 03:16:21 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021e8b09sm4852936f8f.23.2026.08.07.03.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 03:16:21 -0700 (PDT)
Date: Fri, 7 Aug 2026 12:16:19 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Kanak Shilledar <kanak.shilledar@axis.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 "Andy Shevchenko" <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, "Henrik Grimler" <henrik.grimler@axis.com>,
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
 <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <kernel@axis.com>
Subject: Re: [PATCH 1/3] dt-bindings: Add InvenSense ICM-42370-p
 accelerometer
Message-ID: <20260807121619.000078c9@gmail.com>
In-Reply-To: <20260806-b4-inv_icm42370p-v1-1-670837f5842f@axis.com>
References: <20260806-b4-inv_icm42370p-v1-0-670837f5842f@axis.com>
	<20260806-b4-inv_icm42370p-v1-1-670837f5842f@axis.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 6 Aug 2026 14:46:27 +0200
Kanak Shilledar <kanak.shilledar@axis.com> wrote:

> +  vdd-supply:
> +    description: Regulator operating range between 1.71V to 3.6V.
> +
> +  vddio-supply:
> +    description: Regulator operating range between 1.71V to 3.6V.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts

vdd-supply and vddio-supply are definitely required.

...

> +INVENSENSE ICM-42370P ACCELEROMETER
> +M:	Kanak Shilledar <kanak.shilledar@axis.com>
> +M:	Henrik Grimler <henrik.grimler@axis.com>
> +L:	linux-iio@vger.kernel.org

No need to add the IIO list as get_maintainer will automatically find
it based on the file path. However I did notice that you have a
company kernel mailing list, perhaps add that here?

-- 
Kind regards,
Joshua Crofts
