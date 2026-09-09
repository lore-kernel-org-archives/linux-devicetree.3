Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31BA1F12F8
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 11:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788953861; cv=none; b=Ah1zCUaEoRxcQ9UiGO2brZmUuRAoeVgMZ6i6UpuWltQo8vIHwMlzsdiJmN/ndf3IvERVcKI6CEjNhQSyGpBTAYBvnWQK5YcSn5aOaO+xBYr/SasD6NBg66iUIGZeBMi2V1GVUBAaINoUmLMpsT/fBxhnDtwUSFhfpcEapzsu+Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788953861; c=relaxed/simple;
	bh=JuQnapAhvZp0CN8+GfiQfqnFpJHWTmpa2IFU3aLBqpI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nasTWhCGz64WM0LA3ANtwONbXfXN8D7RO/dLj7rOlFdg4E/4z+XNnzOnmEnk8bNjsDJN9ohnjtCbPiEYE9onTz602iQV394pkp3ha+/mvUSOVuE8dUXoCmXvdYLw0/L2DwEOosbC2aRn+b5piA0bgGIgMszT2ahknwJMbNcdL/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PKGEG8JI; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PKGEG8JI"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-485850cf499so3942688f8f.3
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 04:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788953858; x=1789558658; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yzaOs9HiYT+48ZefYVd1sW8HRaJIRxb+CV+smGN/KOA=;
        b=PKGEG8JILrEBCoJrLKLmzj69hCVRk2KE51SObef8swMHZNljThXmMxC8Hk8Q1rFZN3
         V+eFGttMP9l9p4NPEdctsKW4hZmvj65XKywqJftiqQswsyt67PRYqG4jOTDF4+VvHVxB
         /aBd1L0pdD+2uzWcXCl+UOgT2YrAmTN6U5U1yGSyCZI+dA8LEGiLq2JrQWrub+8O9D3N
         XURkQi4iCykkYRBrpXmZ8dhFueGMod/2iyRgLh6Z8mb7QXKl6fD+SSLQ4UFntixRSmp5
         AmCV4oopXD09C4ZQETuAbD9fSzBTlFt+yt4rR8F9HLcYFtJ/ZmhzQMPDtti3RIcx38L7
         uEHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788953858; x=1789558658;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yzaOs9HiYT+48ZefYVd1sW8HRaJIRxb+CV+smGN/KOA=;
        b=Q3+uSRfe4AwbirclfvTSbf640DjkPVkxUljzIc5BpkQLD875ObuLhcLZd+BYc+LjmI
         RF+Cb6EWPaSihUdKvI6RZNOIsdL60YQUbj40OQnvL3n0oFq3UGv9n38Zj2bclzmiXuPK
         wd29Dx7RHJuP3gSFJFJAYnZGpO32IR8um5Qm2qNBlq+IV+VwWCQno2GP45I07LUVt44m
         cRJMVdTNaNPgjPr8Qj+2Twjlu+NoJLyasvEL+FXbI8puj9vmD9cgToj7fEoXvSSzzXPi
         5TVh1+qcZJQfFuhFtTqJu5YJ4/5rAcHZqEvYJhuLKDxa7QJJOQ3QDkc7xihlMvW6EoWr
         Nm1A==
X-Forwarded-Encrypted: i=1; AKwUvBz0f49zGAC533ufXKOkcHqgbCuidgqWSHOT7oDXLz47m/xXZW/5N3qcRI3AZMtGbnAfbvUU+Y3zyIfl@vger.kernel.org
X-Gm-Message-State: AFuF++lQ9x196I34T9j/KPqQrm4PxWIjEBgqPD9R5qXrDOuNUI5yygGf
	UVXY57Z6oryFT2Kt6AX8KEt2jYZ5DTVZA3YXYwOWi+zGbVxoYMQEgTtc
X-Gm-Gg: AYBFou0kpTdWBvE3kWw8sCFZTKIas1PEIYhOGSxMElmb5d5VIKt/8x2ZKfxwOsQAo1w
	1QaUMUxW7BsTlDAL5V3A1IB+v7ZfaiIIsNTxyWf37IpzqdEqc8cjBJEKoTOqrQTTaVr/EIcFZxp
	VAKMNfb3CjGvuu6dcATQ6fgvov4xqQ2vRWzUv4O25eopQl5uvueOw5lIzznIYxhN6JN7AiAW94l
	rDQVH4UMQiVWm90hxEuuTT3Mgta4dNfE+CIHwP/iyosRRzXL0ZdqZKCdw/QVSIs7GuQljFo9va7
	XtGlYCJsBsPKd2bKASG2fy8kwEfTUmBReaXxzsODE/WbnA/TWVTLVaonZFehk9Ms/NM1M7bkZrK
	N2VfOfhC8ouWnbe6zyrwOFXQncx6YVcVlWDftIi6rtzgSue07ew0QG9uNBKM4jDi4DdKo1gh7X7
	7PaWzYrIGIfbmCxHemJ/Crp0TeZDYpYma/qzcsWvMv0ddeV39+EZEYl3M26wOUGjn4M3KlAi5wf
	azb2SNDL3uFbA37f1U3E/xSEOu/IGintPUPfzDvSpcd/JMcgjbG7aFkRCA+HE6nA315ATF4wis2
	C9nmK2px9/CwnrsRP/SiY348Bx4GxOtNgyzCgxa8in5KfMek9gnMbtfMkNORixlfCZJVr/s9KUJ
	jv/NUivbE5Ht8D7eUqr4L8NJA5YUA3X5uH0VF7Kq70SBIMPa08SIRgJnEgwHAwgT95zEy8b7E7E
	Z9oMLAPuBXlYoTEOs=
X-Received: by 2002:a05:6000:644:b0:484:416f:9f0f with SMTP id ffacd0b85a97d-485870872d9mr38224650f8f.2.1788953857608;
        Wed, 09 Sep 2026 04:37:37 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858dd90e1fsm46092542f8f.28.2026.09.09.04.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 04:37:37 -0700 (PDT)
Date: Wed, 9 Sep 2026 13:37:35 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Kim Seer Paller <kimseer.paller@analog.com>
Cc: Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Michael Hennerich
 <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, "David
 Lechner" <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, <linux-iio@vger.kernel.org>,
 <linux@analog.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] iio: dac: ad3530r: add support for AD3536R
Message-ID: <20260909133735.000032f9@gmail.com>
In-Reply-To: <20260909-iio-ad3536r-upstream-v1-2-16ab930dcee3@analog.com>
References: <20260909-iio-ad3536r-upstream-v1-0-16ab930dcee3@analog.com>
	<20260909-iio-ad3536r-upstream-v1-2-16ab930dcee3@analog.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 9 Sep 2026 14:19:10 +0800
Kim Seer Paller <kimseer.paller@analog.com> wrote:

> The AD3536R is the 12-bit variant of the AD3532R, a 16-channel buffered
> voltage output DAC with an on-chip 2.5V reference and an identical
> register map. Add a chip_info entry for it and the corresponding SPI and
> OF device ID table entries.
> 
> Signed-off-by: Kim Seer Paller <kimseer.paller@analog.com>
> ---

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
