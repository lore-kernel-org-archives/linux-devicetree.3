Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792823892;
	b=DuTeEmw2PBN0uhe9pa/2VVpwhn1O3QwWTWe/mGkVSXZA63hKPmZheEDCIr0WpDboWjGI
	 Xhd7lUXzVQSndGVQjppHsLpM6MURPOZjvQg7QHsyEzYx5cJAt08V1WTeBfWJJcxyyNoCi
	 lHdn0ngJnJcyoTn+21Kux2poTRADMpUaR9Aa5B/V3zq3irFvWg1k/1yR4ngJ5ukLHjvkP
	 u+lF07uFktb8FQyu6oJgsWGnf9mvx7o+iNE97fOEQS/WgXyckAih2MPE7T03OAPcti98N
	 AsCq7DvbfUctSvpbcQMrFkYeHj/oHbskfyjrNhEQGbGVCYXi6wH1BoZysVhMsCFVsFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792823892;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Eo/uDup4KcaVJ1mR+rT1i9h2PRHKpBooRZboT0Neq5k=;
	b=T1woWMIbTfdslbFys1avvUnUw7d/qP7k9aiVQlltrzzzAv9gbsCExTNWjF/FQeZlsnET
	 glAQnhc3nvf0iMUgvDMkjfHgScut+r8bfyNeAIUXCOTojDQQA9asxB4su6HkQyybK31wA
	 81qUD/mkltbNm51W17nN8zAjS65dqHVAU9fkR3bAiORw1a/qUn7BHoam75iDTNuyJ0UgD
	 4I+bPwYJChI92xLAb83MoA68u/zxuYYTx/rv/KAdF25wDAiHuzf32+Mr6smv1Q1mIjo/h
	 4UFyt50w2WWx/kbJgeWWEmpvkJYgY1vndAVoM0Vs0UNtyDJkjL8kTZG5Zb1yIyXQPvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JSq5usht;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B543606A31B
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 06:38:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B543606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JSq5usht
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so13940585e9.2
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 23:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792823891; x=1793428691; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Eo/uDup4KcaVJ1mR+rT1i9h2PRHKpBooRZboT0Neq5k=;
        b=JSq5ushtKCOp88C6tHvh//K5tNcwrAAwAHXEk/x9OnSeJ/X9kmdoR7O5qQ51NAbMXf
         PDaoU5tQ3bQOy7RkA2Xe7tSu0TgTxjIWtZtnmhxMaxVIaDhauDuYTTPB2D18kW6LOa3a
         copeaz0+6y2herGTsVGoBl7nU6YdW+c7qmbS+/scTzCXantPYa/AvOTu/rTxxN54c4qE
         snedA8EKU068xKbI0cT9dOgtk8ora/IKMl1pQ4flfYz4RbMahCMzNBarV6gMV4Ykz0ML
         4HPLYq1EZhhqGGrzUvGIvCDclZGXCB3FeqgdzY8PTbLg491oCK9Z7fai5d1OPScoiC1j
         2m8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792823891; x=1793428691;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Eo/uDup4KcaVJ1mR+rT1i9h2PRHKpBooRZboT0Neq5k=;
        b=vcgO4Whw8PbhsWl8p7wcB/otexeFVFNRsC3E+U65HWSHL1N6s+nq2xZKOMbWM/iSaU
         EbXOJgiiIXOdLysoS1cVukU41Z4E9fMvOGtmxsGZY5A4kXKDHVW1cR3HS6TRynzNSP6r
         /meQzVWkQeEHUfTHUc14ul0p4rWxfJIy8tX6ul/l/7xcZW9leF5lLUNk4781lQGkRHlw
         clTtZr1q6vIsH9k4ibREGtRRHBF212c3oUVlpckfgsKMAQFOIHUUKmkkQbOoN9DHw5Vc
         r49Wars4i9ksaW/YdiI7vFyOy0c8aaisFgyC4an+K3FbTKeV1MsiLvhQEmhnzamknxlk
         LrWw==
X-Forwarded-Encrypted: i=1; AKwUvBwu3lU+/961eKPfvm3+1YHH+BnM2FHzNO8fcFBFWV2OUoyuKX8H/ubxrDavxbgh0UiQoHQOI4xKy7IT@vger.kernel.org
X-Gm-Message-State: AFq9FYJqDB67GCLqXKqUzT/RC/3IuQCDCMAvBGdNQD5xmgI4V0Tf4VJH
	7JIrOMc5j2DQxKt380+USiieqh1MH95EynGR9cJq0fuDOYjNcd0KNERW
X-Gm-Gg: AYBFou2+VJMae83/iyLvfcpkXjlOzwl9HIzySl5UeU44yAvOpPXfjUckNXcVRlILBmM
	iI8f6uatCvcBrHNF3Kgj+RtSjRFZGe/9DWutaCnGMxZ0SP1/600HVg/FPe+D8p4Hgt5BNgQFzCv
	Mzzb/vy4NNsaFHawjCgDh3bG623zMJ+sWXvq3abqkBsjKyB1eG0C4lVF7TQ0oxJSZbb4YP9wgec
	NuH0/9qCQ5gGjGosN633j7QXhYJoMQ34doAZT23XpgvscMxAKOUoYypWB/R7L6obRLjulrxtMH7
	wIwmT3uw/QRJFRES9hJVBk+s+zJJObMrqsPeoQ4Va2LdJz7+0XwN3gHqfZcmEo8jAdcq9x4ZbEB
	RQqmr0FaWp5QOy+MR8ORFRCq8Khs3iubxugOFHDJiYkNl06Fgw1yzDqvg80c00Ox07aUxPhiwy1
	BqC1Evlu6zifY75j+wnVtMBGfTXqwd0oQdGsTJHL7mMUDx7yA+4fyhNGnUD4w0KY37+3gfNDi+Q
	9D/b5PvKAB2/od63WLLt/SH4sK4tF+3lift97crnvr265b7yxEd+DQm+P2q5shfDqF0+7YOJRu4
	0MDwCqKFxHY7olzRIMNmR6ISUCYjDGo4R1Owomwv+rIOGekGH6KoPViQ7CjZ/0iAeosd9ik9iLA
	AMVywB5I3mZKr7RxtmqK4d7T74XX3+oZ1fqs1ebRUC0c1V/oeRX7qPD4N1ZqhhrUrKXzJpf5fTj
	4wRuetJcLVxTsAspA7Pdavu6Jdy/Di
X-Received: by 2002:a05:600c:5308:b0:4a2:86b8:7e9 with SMTP id 5b1f17b1804b1-4a35ac9d077mr14744425e9.16.1792823890868;
        Fri, 23 Oct 2026 23:38:10 -0700 (PDT)
Received: from localhost ([2001:718:1202:45:44bf:6db8:6c32:23e1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0bdd59sm22278075e9.4.2026.10.23.23.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 23:38:10 -0700 (PDT)
Date: Sat, 24 Oct 2026 08:38:09 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Olivier Louvignes <olivier@mgcrea.io>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul
 Cercueil <paul@crapouillou.net>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: iio: adc: Add the Ingenic X1600 ADC
Message-ID: <20261024083809.000026e5@gmail.com>
In-Reply-To: <20261024041357.34346-1-olivier@mgcrea.io>
References: <20261024041357.34346-1-olivier@mgcrea.io>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 24 Oct 2026 06:13:56 +0200
Olivier Louvignes <olivier@mgcrea.io> wrote:

> The X1600's SAR ADC has four auxiliary channels and none of the
> touchscreen or battery engines of the JZ47xx ADCs in
> ingenic,adc.yaml, so it gets a binding of its own.
> 
> Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
> ---

Please use a cover letter when submitting a patch series.

-- 
Kind regards,
Joshua Crofts
