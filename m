Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DEA8548564
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 15:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790089321; cv=none; b=reb0YntYGxSvoT/QaJ7o9ZT9x7qxJLYLybnL6CxtNgtG+mbViQJGPfbJy+0Mq6VlP5hDrrJQ6jNj6am5i32fpXO67JfklMavcVkMu9BFTQ8wZ8yjqN9DcrHysf1X1SzIotejqYcFRJ4qo3sRQCXo5MK9i3B5xZ4/oUYwxRkqQMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790089321; c=relaxed/simple;
	bh=nJaInej20W9dzeQHSkKI/1OjjvnAws+MmFssGn7W3Nk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K9mhg6JRYh391D2rx4YJOn+wgb2F2je/nUGqINFXr1CrixIALo41yn4SowTK5NS5KO8Gg6WnuYv7iLujL9SimvAFjvxxThvUpCi62Z9R588TrzSq3An/7q/IKspPUCO1iTWyUdd3bliQoJoDVLfOhFfF4w/UCslzw0h2xricqcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hTwAL2XI; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hTwAL2XI"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b91369d18so31954015e9.0
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 08:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790089318; x=1790694118; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LPDTkB0QGhdPj3hyMEadxYVUHPg+JvQ6bPrYQoaa3EA=;
        b=hTwAL2XI+1Q2PWSsIRnU+1NhMqw6409K+azDUXGp5ONJwU2xqXBFSzE4CeG1EczfUS
         bJXSwgVQJmRgjWk4b4LTr0U251LoZbzIfkObUP/G3PTNz8jDRqSLCbvTpwPHP5fmWqee
         i9LJlFQ36i9rIGgbhaV9cqbZWuvMFXtKgfimamfE+/yKye9zhv5g+g/owN+R9h7QR3QF
         EfEkxvazVUMI79a7GZyaNnXZkTzSpydAHYYvu22Idu7D66JmlvEwmc1LMExYBDwVaorN
         th9fzRKDAByp1q7B99aXWRDUWWWpKsPFlUa4RfyIJp0EKV6mj9HlA2oiWiPrWHqzRH2E
         hOaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790089318; x=1790694118;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LPDTkB0QGhdPj3hyMEadxYVUHPg+JvQ6bPrYQoaa3EA=;
        b=Wf/u2tl0pCR+73XKXSAwL2umoWLyuXmNGGcdH12jh/8NVQvxwNBbRRu3AuOjv9oRF8
         OSPlIclOmzTjMFm6eZZCZdJoMWDUYX7DRpi/Ril+p/iIJnx2sii6iVSHl4TTJalG15Cr
         3YmOEjh+L/e6+fcV5M1rTWbLUguV41nTGmS/Vfa24RGwmG1twdkW460+wgEt+ZOE7pTk
         8JlRpattYMk+UwTrFHfb7pRXvkNItsfdB8fMO+NP2qrgwJLscqHsaZ9Pq3gECqbi71jz
         6rdDMRjwMUtibQeLyuokfGevB4Ve6FqFG3TDIPvwYZg4g9R5tH/SFDHXZNjxNONp4Fan
         4UHg==
X-Forwarded-Encrypted: i=1; AKwUvBxxkpFFzvoqAD8C0nxI3ZxrXdNw0+5sAQtTvV8v80udeAYzVpM4Dok9MzwAg+Yv3BstDtf4tb4+wsoz@vger.kernel.org
X-Gm-Message-State: AFuF++nzBNUWzaD0qBl7HKE5SLC7mgTZUVsSxWyKh483AmaOOTW8l0cr
	k7xYhDTy7huyyneK5ggziZAefH3gUMlpr2Cr16Nzn8zrDdZT1e3v22qis8QRKw==
X-Gm-Gg: AYBFou0N/njc6zLDV1B19lPx1okuPKU6nHrV1BHMvgJZcMy5PRgqIOBIAUuBimZfr5e
	75xSksh/UgJtwjzYFdDWo0+FGtKj+m0ME+xba4u07IE504Cn2EnG4uWY5yI5gJ0dVEwJS4z+8io
	VrOqqMFyN8m3UfE7qLHaKfbTSUNnJblhIjiN+gZzclc/OG+sGa78Ii21uWxfXsiFytZ3NJXTV1/
	Gj1YiUGO+dfj+pY8AC8ZObXJMCSpPOyZsplIXHyCTv2gGEdiSdIDbDkEMr9e4kf0bK+grBC4wKh
	FGVB+RJPDFwIjk9GA/e2G6KXWAo2YIGarK1amcHpfwh5v1dVkE9a0+RJyyxQqsTE10RK4xImBXi
	5RfC3q0h0goglmTRSu84eQMqYZLpTqcqqHE8ndM8YAzCVklxzfbTreHbBbPKidZsbzrp0Hz+CAR
	KKi8f7xvq7+sa56278fHxlC0yvm+LIhi1YA50wEiCze4629TvrnUw429GpoDNE00zMvlJVbAsQJ
	MfwBE6jCtCE9q8RKa8ANiKZe8CN/eRJznZE1UvA2cIhEoF8BW+c1b2y5iEXyRfCHSYLY6TfheWm
	tgswUpuBZRTSIDeL9W5ANgfdB1biGKk+eREpPP4iTYtWW78eJ4/0PzICgt8tAJMl8w3gMjY+viB
	juSt+SDxmIW/HCZalnA6KDokL2Lo12XjrxkywJpUSyCW0M04dLG+Fv0cxPG8z2S0F0km65BtRwu
	ynxZAu
X-Received: by 2002:a05:600c:4712:b0:49f:dd10:3c71 with SMTP id 5b1f17b1804b1-49fdd103ccfmr19072185e9.11.1790089318256;
        Tue, 22 Sep 2026 08:01:58 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdaa9dbd6sm62767365e9.2.2026.09.22.08.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 08:01:57 -0700 (PDT)
Date: Tue, 22 Sep 2026 17:01:56 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Kevin Tsai
 <ktsai@capellamicro.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: iio: Add dedicated CM32181 schema
Message-ID: <20260922170156.00001c8b@gmail.com>
In-Reply-To: <20260921232752.3136129-1-robh@kernel.org>
References: <20260921232752.3136129-1-robh@kernel.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 21 Sep 2026 18:27:51 -0500
"Rob Herring (Arm)" <robh@kernel.org> wrote:

> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false

Why not additionalProperties?

-- 
Kind regards,
Joshua Crofts
