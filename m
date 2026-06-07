Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6050286A4
	for <devicetree@vger.kernel.org>; Sun,  7 Jun 2026 10:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780829161; cv=none; b=KEsFH+S15wyhcK81F9raGzhsVVhiviSu41Yznqvrjyh95VD33ZeQo3r5kVfMhEDl/BwTtKVKF+JvMwz765hUX+uq8rNzief+D6+x6rlF6MfGu4UEoZ4aerIpi/6V8OCN6fFP/hEchNEWZlydnHK9iMdrNMGRCMoQufh0zhOwNsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780829161; c=relaxed/simple;
	bh=BXAsDyuxsLXh4hF0W2y5DY0RyBDHG49rrrSpvd4OiX0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ONDk5uTIAMHoz7p97xzvI+6WxMaajSIzl3oS7HHgNZ3cPadbBlxw09n+ZTttWlDuqNTBre48QmsOXU5vtyo2e/D1fyv2r2GXXr9AlcOE8sOzuiwgy5VmgChfHlI1E7W9zOFWJa8UuMWz4+HzbG5ytBpUf4TvY+mKgW5gbzyrhSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZYTIU/14; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZYTIU/14"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490be03d47bso27264325e9.0
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 03:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780829158; x=1781433958; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KTS3KA2QIMmx3fkHZTX2l429tqGzc+KDmPG9U8abWwU=;
        b=ZYTIU/14MQr9HhqlprJNx9VwKdgQK8IGZBt1RbeTfRIqraLJMxkkEz7timTmzxO815
         +9ZfCO36vvw2T2t2PL8Es/J84Yq9PNxTkP00WUmu+E+n5s7//OYACKtynNYPNZ3ku5p0
         ngcr9DdGzGA7wD96mR6ZB5uXSOZavKeL753jIqul7hEw6YHZxzoL27C2Em0lnNxwRlEU
         uP8ICwKYE1SNdcPCPA3devgC+rMHK+uHhdhiJ8NGXTBFxYzSUxZlYFHDJX2Egc2P7tay
         fqxLaRc9lg8RhdsVT1NZixBassVFFm4Hm2FafCIQyFMiaGmAlossbYwQw5Oa+74YQnsV
         nmpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780829158; x=1781433958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KTS3KA2QIMmx3fkHZTX2l429tqGzc+KDmPG9U8abWwU=;
        b=QiWJHDSuUrYAj/5iKNibTblMSYD4F8RfQcgVhUQWjmQtDi6vTFYtLlG+OmhQoXbPY0
         637/P+FBT60B9Xk11o8EQC9tx9peZ3rpta+kqF14g8flMKOUPsBNNh2acFtBEdgFkush
         8hmRCogjTWNN5nx1ZHmYG7PzWmXMM57Jphr+Rk2XucxiW7fYpasxQ4bvvqOOjiQqvZJZ
         EWg5p+lUkBlrn0AjnmMhwbg/2iybAnRsGKLKb1g5Sr5Z73D5tQovcxdJLQHPah2EctoV
         ZbX7CPqv5xtH2xnxacgRvTELt1Wd7zM4R+NWMcMYbaRPbWbNla97e5421inl7bvMA1N7
         XrMA==
X-Forwarded-Encrypted: i=1; AFNElJ9B3R1IRPrqY9qdMHIItew1vu90JN2mVIMfeZFMj/jfmrnXhyuSXHOI2mhyAAjRW6iwZ6o7wIPrfYb7@vger.kernel.org
X-Gm-Message-State: AOJu0YzuP/iiiy8QU82qXgOrqAvBiyMrTNE9Runl0NcQf90t2jQbvtzJ
	fUDqLwnjvpigvYkq3hR4voXWX2tSBl1M+AicaNm8Ki/6jNH+gUuqluN+
X-Gm-Gg: Acq92OHKg7RtwVSygIUkDV7Oz2YjNFdz5pPSwkm8b7qMOTjlXEyi2FRzrFhruL8qnpk
	lYJDSUDbWjTzc9SiwggWo2tkdAWFdIY2vOvKCQBTnWfN0djjtBOBivAHCkW6HiNIoURaLfHE79s
	VH+EA0ZsatnfMWO2n8yPEqGT6ZgdjFIjRGrWyoASOsv8Ai3oQzE3k2YyYqMSeECKpEneu7qpS3+
	byIp4PVOQk4smoYcCwx1misJB5d1KLIlHI4KN/JgEHxtT9KSgfM4BH5ylZiQczLKQbLxZb5iWEW
	Ol+hjKqslYrLQAkkLuzLbEIXUIWNHaSEgM+bxKcvVMkSliAGwxveSjCMkuLF6KG/KvKgr02ep/y
	ZXzjIGJcG0ADSMwT57pZTzsqnwUa0CB93UTpnvZ/Pd/RkVQjqjF9p/1PMpjWZ6J4/KcccrbgqyO
	lQxwJcr5MWXrEJo7iwmqZ2go5aJQ==
X-Received: by 2002:a05:600c:19d2:b0:490:bb45:79da with SMTP id 5b1f17b1804b1-490c25af9a3mr187900425e9.13.1780829158228;
        Sun, 07 Jun 2026 03:45:58 -0700 (PDT)
Received: from sefo-laptop ([2a02:8071:50c5:5c0::361b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3918d7sm280337895e9.2.2026.06.07.03.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 03:45:57 -0700 (PDT)
From: Wadim Mueller <wafgo01@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Wadim Mueller <wafgo01@gmail.com>,
	Rodrigo Alencar <455.rodrigo.alencar@gmail.com>,
	Marcelo Schmitt <marcelo.schmitt1@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Maxwell Doose <m32285159@gmail.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/3] iio: types: add IIO_VOLUMEFLOW channel type
Date: Sun,  7 Jun 2026 12:45:39 +0200
Message-ID: <20260607-slf3s-v3-reply-femto-wafgo01@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260604094436.3c50f123@jic23-huawei>
References: <20260530205435.37326-1-wafgo01@gmail.com> <20260530205435.37326-2-wafgo01@gmail.com> <ahx5cuM1xlOVP6DT@debian-BULLSEYE-live-builder-AMD64> <20260601104233.310ac930@jic23-huawei> <20260602-slf3s-v3-reply-03-wafgo01@gmail.com> <20260604094436.3c50f123@jic23-huawei>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, 4 Jun 2026 09:44:36 +0100
Jonathan Cameron <jic23@kernel.org> wrote:

> Yes, I'd prefer that for consistency (m^3/sec).  Hopefully the scaling is
> fine with the new forms that are happy with more leading zeros.

Ok for m^3/s if you prefer SI, but two things before i switch:

1) The scaling is not quite fine with pico. In m^3/s the SLF3S-0600F scale
   is ~1.667e-12, so IIO_VAL_DECIMAL64_PICO keeps only a single digit
   again. It would need IIO_VAL_DECIMAL64_FEMTO, which Rodrigo's series
   does not define yet (only MILLI..PICO). Rodrigo, you offered FEMTO
   earlier - could you add it? Then i base v4 on top of it.

2) Honestly m^3/s feels quite far from reality for these parts. They are
   liquid flow sensors; even the largest variant (4000B) tops out at
   600 ml/min = 1e-5 m^3/s, so no value is ever close to 1 - everything
   sits between ~1e-12 and ~1e-5. l/s keeps the numbers in a saner range
   and pico is enough (no new core type needed). IIO also uses practical
   units in a few places already (kPa, milli-degC) instead of strict SI.

So i'm fine either way, but m^3/s costs us a new FEMTO core type for a
mostly cosmetic unit choice, while l/s works with what Rodrigo already
has. What do you prefer?

Wadim
