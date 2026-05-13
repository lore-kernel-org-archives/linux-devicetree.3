Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78EF93A6EEF
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 18:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778696037; cv=none; b=fdR4tw8sT8zKayxwys0I+X1b6TMPug5ShB7h5OE+ttBnz9D10BoH++++/n7EMr66lviQxt4GNRAQGDpQ2Ik1gypMtP71h2iSOY8KVx/JMUnG5Ut4cy9NzQeqp9syRtkWPO3UUcuUyfMozHgEUvYC6TdbQoLD57eLBP5ARx06bak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778696037; c=relaxed/simple;
	bh=ZFL+7Djcj0/DP230M4MM8TLXMhv1ojlFJLVRfsFJCjQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=MBIgBgDhr9lOpxhHoRHa9fPnsdLxvq58qZAlawmQMzszv0SLAIFU0E+rtCaSPsreWChY6rw8xJwzNA2sxMH+Ol1arXl0hkxhKbMv9GzxCybgBmo8eVm4R9VXCvOt+79jikV+TjnoF2Ad1RyNz8cdHE6c8LJFb/5jaDBKv1T0GO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eedpueA2; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eedpueA2"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-36523acb0c1so5106660a91.0
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 11:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778696036; x=1779300836; darn=vger.kernel.org;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QDI47/lyDeh2jyjuo/TfFuD9uBo+IMd4UEtvl0ZGglY=;
        b=eedpueA2CWtWZMuxpJG0eksFio0ZJxvbHSFP3b1e359kf4OyomE6hx1QSPlgNCKdo3
         yp85SlAHUhSM23t6itdgi9BdxnT8RBeVu8gArFR0aTXFs84RKuWHhgkhY2Qgr4ILVyMC
         YPiyWl6lNk9uS4vh0QNExu2U1cWNwZZoYCbiY/jdrqPWzoMLCdlK7OJqQUSbKdWYTc6M
         hesmwbSHC05d6RVjCkso+iP4uKStZmIuWGbPiGbdIBP1bIEj+S0nGvd1bDpcEuLeiMoK
         me0AMG1jQHARXRSg9uopfxUpi460E49il8K9qA+WAtPaWqroNSpqmRwzpdeziIEw2jKE
         9EBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778696036; x=1779300836;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QDI47/lyDeh2jyjuo/TfFuD9uBo+IMd4UEtvl0ZGglY=;
        b=TMWs2QPRHfSglLcsWY49gBweRyzivxTIpf1WpNQ/7XOuNFAF3ybKlmWCuGZRhKicw+
         q1d2hBvvjS/YbI/VYPNLCLJcoYacpxfU40pRo0WqzHr5+20G2+ZnQfTuVXtNRKVRK6XT
         Xc88cTel8E7xAIWe/lqbTLAk2f/refcteECo0ZTRCrdLdDIGXR1TkNMLn8u9yuc/2jG0
         DiG5poyAhz8Q8hB3Xe3ler/fgUQTffi7G+qIlCqhQVr3ziVThjodo6cwsc+qhjVHDbeI
         IpVpBao06GRJEwBt4OVtv/Zh+F/oo1d006belCKzSmZFGNUWI+xCVcuV0CCsG+MnPkF7
         oGCA==
X-Forwarded-Encrypted: i=1; AFNElJ+VtbWiPQD6Ev0pTJtJjDQj9zQEihtso2OXhRM/t6YHG4Bp9W7dYLDYd9Afn6pYp1hsH9qk75zH1G9r@vger.kernel.org
X-Gm-Message-State: AOJu0YzbpX29s7MQRe54McMLSbOPzmiKwL16dKAiIoeJOfXma8jXLIZ+
	26IgYPmIkFRfCTJ3WfZoA4l6WBYpkVe07UBsRcrFq2MUgALqqkjxhxn6
X-Gm-Gg: Acq92OH+EpSssA1+AmHekkpIvYk+EABtCeLB9EIW8ftj2dAL1q2zWU4FRm6LkU4Nee0
	JGhle/aJ5xTgd2ZAMPmuzgDWLIHSI15CiH73NiZkUsg9GgtEn8WPH+5ZNODFMfhUIO2KeRtDIU9
	Surh64Y+siOEljWXGzKZ6Cpnu1kx0n7VmL//1/6/h5oXKHsn4Fi1+FafmR9LpvL6xnS5mFXOiKd
	vD4CCRTJmnAFvSSZl1n88YwSATvtvdeGQx8Nc5OOnaPQhfPkYxWc5kyhYpppW1o0l1lLA87filh
	RqnFOP1PGpYha3ol7ALQizprE/f2UAOwJS3fe33HAjHChUm5aJqPRv8JbTUfvvCe1Rya3Zb2N8e
	6iV5mD7ukSwrUNadCBHqeZ7ZU64agye/4ZeGqFHIKElWGDlnyQtlGsxHJg8aeeF/ZQG9esQENw5
	8VF4m+tL7kgbxr4dfQQnUeh9Ky8y2A0yrwPg==
X-Received: by 2002:a17:90b:28cf:b0:366:7dbd:cd50 with SMTP id 98e67ed59e1d1-368f40a3a66mr5027615a91.27.1778696035612;
        Wed, 13 May 2026 11:13:55 -0700 (PDT)
Received: from localhost ([203.99.159.235])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3692accfe37sm15072a91.14.2026.05.13.11.13.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 11:13:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 14 May 2026 07:13:41 +1300
Message-Id: <DIHR47ZGCUOK.2CNX05W0I8F6F@gmail.com>
To: "Andy Shevchenko" <andriy.shevchenko@intel.com>
From: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
Subject: Re: [PATCH v2 2/4] iio: light: veml6030: fix channel type when
 pushing events
Cc: "Jonathan Cameron" <jic23@kernel.org>, "Lars-Peter Clausen"
 <lars@metafoo.de>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Rishi Gupta"
 <gupt21@gmail.com>, "David Lechner" <dlechner@baylibre.com>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy Shevchenko"
 <andy@kernel.org>, "Matti Vaittinen" <mazziesaccount@gmail.com>,
 <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.1-4-g02324e9d9cab
References: <20260513-veml6031x00-v2-0-4703ca661a1d@gmail.com>
 <20260513-veml6031x00-v2-2-4703ca661a1d@gmail.com>
 <agS5Xu8ORtEwuwOB@ashevche-desk.local>
In-Reply-To: <agS5Xu8ORtEwuwOB@ashevche-desk.local>

On Thu May 14, 2026 at 6:48 AM +13, Andy Shevchenko wrote:
> On Wed, May 13, 2026 at 05:49:42PM +1300, Javier Carrasco wrote:
>> The events are registered for IIO_LIGHT and not for IIO_INTENSITY.
>> Use the correct channel type.
>
>> This bug was introduced in the first version of the driver.
>
> Unneeded detail, if it's a bug, use Fixes tag.
>



>> When at it, fix minor checkpatch code style warning (alignment).
>
> ...
>
>> -	iio_push_event(indio_dev, IIO_UNMOD_EVENT_CODE(IIO_INTENSITY,
>> -					0, IIO_EV_TYPE_THRESH, evtdir),
>> -					iio_get_time_ns(indio_dev));
>> +	iio_push_event(indio_dev, IIO_UNMOD_EVENT_CODE(IIO_LIGHT,
>> +						       0,
>> +						       IIO_EV_TYPE_THRESH,
>> +						       evtdir),
>> +			iio_get_time_ns(indio_dev));
>
> AFAICS the indentation is still broken. Why not doing like this:
>
> 	iio_push_event(indio_dev,
> 		       IIO_UNMOD_EVENT_CODE(IIO_LIGHT, 0, IIO_EV_TYPE_THRESH, evtdir),
> 		       iio_get_time_ns(indio_dev));

Hi Andy,

Thank you for your feedback. According to checkpatch.pl, both variants
are fine. Mine takes into account the indentation within
IIO_UNMOD_EVENT_CODE(), and yours only accounts for the indentation for
the arguments of iio_push_event(). Moreover, your suggestion goes beyond
80 characters and mine does not, so I would prefer sticking to mine if
possible. As I said, it passes checkpatch --strict without warnings
in both cases.

I will send a new version adding the Fixes tag and removing the comment.

Best regards,
Javier
