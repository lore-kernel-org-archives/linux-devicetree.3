Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FEE947CC82
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 14:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784038711; cv=none; b=jesQbHKXcXN7yF9FQMHd10Pxb83I/Sx1UPXoae+LGlWEVysNQONGeJ04tkBIjGNoeY+BkRVSIwH7zWC6wu51WDm7Sb9EOMPhNSSiGM74f59UGUSw6rCfyHB8aXdh5nXZIh9CwY9/drloQT1AkMYYt9qkAlHVbaedUP6ERHB0YyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784038711; c=relaxed/simple;
	bh=0DKG2To6jCVPnZRJ2L+oO8w7P5y+YqwjWTPKkHTL7CU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GUgukAG7aTsyXlvhEafAG+6gABuHLkaRtf71lgIgE8O3R4gJOlucxXHyFWqMDaby2LFZV5NdGvl2OhNZR6Lil4T6/mCGlfLZPuMcgSQxgcKbqvkETrPm5gYl1dB4yf2NbM00eZGXgC3zbb/QjBCTKBXAN9ph23bYaLbDRo3Nd4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rCNYjfqJ; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rCNYjfqJ"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c12614b81c9so815474966b.3
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 07:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784038708; x=1784643508; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lZB9rfFkhOTFphdLGR6TyG9TjcpFUip/IJVahTcTdLg=;
        b=rCNYjfqJEzBdbv652WV30QWwA2LgBr0pVAD1wzBiaswK7omi9pocA3wJjjcecykjC2
         IHB2Xtqi6vIH5UoMxzAmV1VQs/VWLMsqCpJ/Eh2u3f/1eIIGIFfbOkKu22BvY57YbhPY
         KL3EWDh4ZOl1Rosam/maNvWAUmYChjWAY84LonhCeltJ5qigSq+nqu0jKseqCI3TFmTo
         x6Dlhm80cUzqpq2pIwqI/o70c/oEQWawZQVH/6eBOPWjJFCwEb/s6H/+HdjHSfgr9HK5
         M338OIPwzRhuwWmGNhSzhDzVjs5s5JG2OCDAOf82nzPJd4ikbw4YKjWKEUlMh4hMyNwz
         iQ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784038708; x=1784643508;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lZB9rfFkhOTFphdLGR6TyG9TjcpFUip/IJVahTcTdLg=;
        b=h3/xAWc4GK8K47EoM1jcsg5ITv/lZwJslGd7oJOTzQUOrbT4VqY0QkO5eYNzauzihT
         m+/o3xjbAxKef0/Aokw+9xNEo9f9Y2+AP3wBrby5q6ViqOmhQBXA8wND+Wbgp1cBKnVt
         U0qRY6zOpRCJh/9n2UUQ/ZneCT9eynfrbl7E3sDx9emijKcNOECMQSqzs20vtyrH9zv+
         E2848WhnOkKVys9tdCQRHWmJ/GwKh0uOWXN7XANshf3EHSzHLP9LrF46XBbp8uuY39oQ
         ffAruGsUGP9+odv2WBY6CQrmPb58sz0sNS4I7Lb6H75P2WIzmJ7hDKdHxijL/X0ykKte
         Ke+g==
X-Forwarded-Encrypted: i=1; AHgh+RoEeFGvYN0ZrbCZLqqutZBSxcvsCr8W9CZgt8O8DwRkZV0PTWAGrb2JSYkvKb3HqcwsfiUreaXKBMH6@vger.kernel.org
X-Gm-Message-State: AOJu0YyyG0181h0gHa9oVWNte20xWZx5riZNN2oT+E96PKftYBZgbcL1
	vUXqK+/c5z+3J9iJltxLtaJjCZ5CcK69tJrZGMJVjUHIn9JCgfqawbD1
X-Gm-Gg: AfdE7cnl9Vw39jAd6o5BM2QTjArcL5riuAipyVlKgGx0kh1IBZ3mVDbJqYeJzPD9i17
	h99v5UI87xlTAKMFiC7qgw7y1wOtlut5DQIXNcozu8Q6RD5CYZhl0oimUETS1tQ6wUXntijvUx3
	wqoyH677JolWWIhWNrHpi3KpWRZvHonfmFurLD0lJXpTFbGSl0YZBGqrtK1EoeW86aQ4XT4YLHf
	1vK7rIwsv1jggB1PdUfIuZLrlI7g7IzbAbHhXeGZiBuOzEMhSq74iEbOdQByxDeFia8ZeXsKVI3
	Rq6oHy6fFCmyg6Zs3gINtgeTbeFJAfIU2v1AgNoEH4t0plBoyt5zh0YozMXQUuk4xYBAm2s02oJ
	TSJD8LUETawmctLG9aC0wpV7yqU9l5RGUh4LTVpPpNXO+4/r0K0Eb7VxJXIfPgaCHiEMr5ZikQU
	jWbnpKBujlWkGJAhjsx/aPL3J6feA=
X-Received: by 2002:a17:907:d58c:b0:c15:c290:ca8c with SMTP id a640c23a62f3a-c161f58f09amr573359466b.39.1784038708083;
        Tue, 14 Jul 2026 07:18:28 -0700 (PDT)
Received: from NSA-L02.ad.analog.com ([137.71.226.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15deea5cf6sm853090966b.16.2026.07.14.07.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 07:18:27 -0700 (PDT)
Date: Tue, 14 Jul 2026 16:18:24 +0200
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Janani Sunil <janani.sunil@analog.com>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Olivier Moysan <olivier.moysan@foss.st.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, linux@analog.com, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, jananisunil.dev@gmail.com
Subject: Re: [PATCH 3/6] iio: adc: adi-axi-adc: Add support for CRC
Message-ID: <ucrlt75xiwbv3rrc4gvgdop24u54eizhuqzf2av2qsa6ceymdp@kfkuiwuvakhl>
References: <20260709-ad7768-driver-v1-0-44e1194fd96a@analog.com>
 <20260709-ad7768-driver-v1-3-44e1194fd96a@analog.com>
 <20260710014617.323acf6e@jic23-huawei>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260710014617.323acf6e@jic23-huawei>

On Fri, Jul 10, 2026 at 01:46:17AM +0100, Jonathan Cameron wrote:
> On Thu, 9 Jul 2026 10:50:14 +0200
> Janani Sunil <janani.sunil@analog.com> wrote:
> 
> > Add support for enabling and disabling Cyclic Redundancy Check (CRC)
> > processing in the AXI ADC backend. CRC provides data integrity verification
> > for high-speed ADC data streams, ensuring reliable data transfer between
> > the ADC frontend and backend processing systems.
> > 
> > Signed-off-by: Janani Sunil <janani.sunil@analog.com>
> The 'other things' I found bit from Sashiko is interesting. Far as I can
> tell it is right and [devm_]mutex_init() is missing for lock
> in struct adi_axi_adc_state().  
> 

Ouch! Yes, I was also wondering about the lock comment.

> Nuno, looks like it was from:
> 7ecb8ee5c93b ("iio: adc: adi-axi-adc: support digital interface calibration")
> 
> Which indeed adds the lock with a mutex_init()

You mean without :)?

I'll send a patch fixing it!

- Nuno Sá
> 
> Jonathan
> 
> >  static const struct iio_backend_info adi_axi_adc_generic = {
> > 
> 
