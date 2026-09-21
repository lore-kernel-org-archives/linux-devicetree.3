Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD7445349C
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 08:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789980409; cv=none; b=m4SXCxh0cSXZRNByPLOI5y1q7HtAhg7e7KEWYhFbtUJ7gvoPib+ZKUxrzyqBnrprkAWQjwEbxOCYXHzzrXuevTTkE+lOU+SfKYSMeqA5VpbpPqlwoouvR9MhAGW4y1o9JUemFhKF70Qtax3EzKyOMpPLJowK1mbJKdQF5g4IjnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789980409; c=relaxed/simple;
	bh=KyBH7dhUVR4B0av3A00svT+cy5avMnDRCt6F/8hLFiQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AIXpqNEEDLRbX6nQ/4I+jNqfPQOWWZaIg68aa+OvRQb1kX/eKYF3CwWH9RqgewkUZtusclEhZP2iFGjZrxQD5Mv+9R2TnUw7dg8BlBJwoiT92tAH6O42OFaJcQykfjOlSN+G/mzHvCBsIFsQE7WdNNttpPwb20GRHD3cQqIcZKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xde7lvO7; arc=none smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xde7lvO7"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a985fba28bso3148794a12.3
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 01:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789980406; x=1790585206; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U83Tc5sQYnzc1MW72+9l9dJyYEc+FCbzixyfv/lGGEw=;
        b=Xde7lvO7wONq4WdJWo6Y4+36q0sugLQo7GicQlDObrmem8LfZ/gVLYU/J2MK+8WLTZ
         2ivBumskyL28bEmZAOVzELbUmX0SnMH2rRtgT8ZvVnuv9C+/LaB8PBlEvN25ATL+s6HL
         HAlIUK8ZHxacglxHdq09BfHLZi3O7HtmLllOlabGi8HV2sSF0qDwi4GiTMTSvu0XQFze
         /ALoNlmiU//wJL4Ff2F2H+fKfGxyYHQdxbD+vQG/CrRcMIgsedNa7QjQAlOUH5Mh31zI
         0WxL4FtQR5Ou2ds7yFd36eo+aXzqVdxNC8gcglkdlE1OnduVKtj+79o7rx0BNls/GL2A
         XFBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789980406; x=1790585206;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U83Tc5sQYnzc1MW72+9l9dJyYEc+FCbzixyfv/lGGEw=;
        b=NBnQUtmV0jP6pUxlUeJeQebyFykySa/PMBRA7q3TLqiprji7gr4RQWmQXzLsF7lvwF
         KL8nzxrOXKYEQnnLBdy6oxTB8ezTQ6t24WNt3TrsteGnT3yh3826hM6DE27nR9/IX3v1
         qQRenUd1hbM3w6d0ljS5vib/4R78RbXCPGOwGOa1ISSWMVxEdSomgRZe9Kj4Xf0H4pv5
         XZ+9lQYjWWKkb8njYuwq+88jZPgD8hWO93MrDbZs/SGeVdQf610rHo6+333no5B6SAmY
         fVaDTPm7egNpdsUq0alGYZnTdqh4g2HZ4pz/9vRROIlApHqBPVL21vwnaK0sOW/z2uDf
         wdCQ==
X-Forwarded-Encrypted: i=1; AKwUvBx76jU1wAEC3w28ykOFkPF6KoBO3tR6YrbXnDZPA2Sr4u+rd0/d//yO5tapYip9EarV2HkU6bTLiEiY@vger.kernel.org
X-Gm-Message-State: AFuF++lu1D+5NZKVWc9eyPyOQaNrOHr8pZioCaxh5oEcL28tv7b9Qvtm
	jV7cRpVZxECifcguObi7V6r2ex7c2yxvEkNd5sZ9OEzYt42QFU6VQFGw
X-Gm-Gg: AYBFou2RYJ5Ic80L1fAFRU4GRpXerE9viGR6dwn7pcr5jsnflvJMtjmHFiGd5OKEW09
	ydWlJSvWB21PjWoEDkxM6rY515lrj6U3lAmhjgOReuWjZ5AyWUJTxlV6EQ81wjWYO/EhPzLEQix
	v4Nf4FPO4DDm0/LIPs5OgPWrNOSslBiBrF75BTN7OhfNiLazwP3l14MMX6W0yP1FVENQSvBsKkH
	V71KTNYOZ1uD4/SkdWEHictynOcwboImvp1VOcgHcEG5LCh+5sQhVQ7DwlQtm9R5Mje6anUKf4q
	mw6okvJ7kFi++D1UdNQ+0NN6uaDVUEXq+/60XOm1mkQ4Acmnr7xofvHC9AfjkGa10Pjm5YaUUgq
	C1leiuz2qEB9B/bRyVwJhLYFbdKJHK1OqlNCIghkPR5FbLggS4HiHLoWWoo8SrXz3PRFKVnOuqK
	YpNP8p7Zz54RA11MoPh8fLBOREkTgo0Q18m3O6nTZ3tUw+/99LaxQ4WH7kVm3qMvh67iazIXqih
	08uoVbl8wE=
X-Received: by 2002:a05:6402:23c7:b0:6aa:4529:4cb7 with SMTP id 4fb4d7f45d1cf-6aa53135128mr7228644a12.16.1789980405879;
        Mon, 21 Sep 2026 01:46:45 -0700 (PDT)
Received: from [172.24.138.145] ([137.71.226.102])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa67d821efsm3882322a12.10.2026.09.21.01.46.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 01:46:44 -0700 (PDT)
Message-ID: <457da50e-a633-4508-a8e9-7e000933623c@gmail.com>
Date: Mon, 21 Sep 2026 10:46:41 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/17] iio: adc: Add AD7768/AD7768-4 ADC driver support
To: Jonathan Cameron <jic23@kernel.org>,
 Janani Sunil <janani.sunil@analog.com>
Cc: =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Michael Walle <mwalle@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux@analog.com,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-doc@vger.kernel.org, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>, Conor Dooley <conor.dooley@microchip.com>,
 Andy Shevchenko <andriy.shevchenko@intel.com>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260916-ad7768-driver-v8-0-27aa24db5225@analog.com>
 <20260921013732.6c5399e7@jic23-hlaptop>
Content-Language: en-US
From: Janani Sunil <jananisunil.dev@gmail.com>
In-Reply-To: <20260921013732.6c5399e7@jic23-hlaptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/21/26 02:37, Jonathan Cameron wrote:
> On Wed, 16 Sep 2026 13:13:49 +0200
> Janani Sunil <janani.sunil@analog.com> wrote:
>
>> Add support for Analog Devices AD7768 and AD7768-4, 24-bit simultaneous
>> sampling Sigma-Delta ADCs with automatic power mode selection.
>> Changes in v8:
>> - Introduce the DCLK divider helper in the core patch to avoid moving its
>>    register-programming logic later in the series.
>> - Document why register caching is not used
> Other than open question on regcache vs volatile registers
> this series looks good to me now.  So let us get that resolved
> nice and quickly.  If it turns out regcache can be used I don't mind
> just tweaking that comment for now and taking a follow up patch to
> turn regcache on when you have it ready.
>
> Jonathan

volatile_reg would handle the live GPIO and status registers. I will remove the regcache sentence from the comments, leaving just the SPI framing explanation. I'll look at enabling regcache in a separate patch.

Best Regards,
Jan

