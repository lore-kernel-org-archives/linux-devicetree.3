Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D75037A840
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 07:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786346630; cv=none; b=pQQN2I7XtDbatbA2O2oYIRNk9+AgA7ZKP91PRHiq8zlP6waXu8xAbzxVkxhdGSnvMQT1t8tmSmWTiHT60UYrhF+7Sypw+5qyuQMfMNW3NTyld+Teq38IcHq4CvVqv3nIO5uiqHjWnY6pg+59/630ehTlfui9tZ8E1BKq4cHvhNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786346630; c=relaxed/simple;
	bh=RAeuVNDlXVzlcPVekDi8Zkv4zj4wB4GslTAeUXqwGCE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=RKt2QV3ksMxERrwU1Reqwyk5h3PbMPEJo0zhTR8sm6ATtzaupCoi/ZwSljBrnKM87Rt4d9QFmKP9k0NmxEdGeOaNyZRFrC+doJc7bjJIRkya+sFZ/mfTni2CVdNEdVVXOUmx3hKNkPM4CojE1kKHAH6Bu8Ah3SOt/Jroi+fUgTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Chti+nVo; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Chti+nVo"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-495757ccbc1so19321325e9.2
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 00:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786346626; x=1786951426; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BRjUUSnNgm7jqLnK+/bmC9h4VmDtCkXgTMIeumbOV34=;
        b=Chti+nVohMF8C/yQkoLn1sPGAjYIxv5DhRT5ozVnv0SuVQtmScSS+lZMe74cZKh0mY
         NVk6n8Mf2GQFOlxd75QTSCK4fhfPcjYqYpzwIP3qezESRWxwvToxKEJCZgIX4s9LB00N
         qmpmrlA9FtEg1A/Gc3AOQJvVbbF6Ij3RiYQaIfyZPPbJhG2fnHwyyuWuCwEMqYFeuF0v
         W5TMBX0YS+frTfM023+/+Spgi+IgM3oGHikGA5Y0z6/CFumw5wUEIEPWy7ErO3+XD5fS
         uwVn+1omGvQQUrZ3w4da8fSBM85GEPdXa7OODf8cggJPGqsdmK/Eq01mvPeDFp5jE4/e
         EA0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786346626; x=1786951426;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BRjUUSnNgm7jqLnK+/bmC9h4VmDtCkXgTMIeumbOV34=;
        b=EC771ClRXa4A0y8eoqR3VT8003Q8Xqf2o6NOXL3NVYF10JPxmXqvw8OmUDyVOcpqgD
         Q1Epp3Skea5jk3EBIuiAXZl5vSWznqBJfOUhzC81CrX1PMjeX6X2ihoDuVWcfWvV7Vca
         0kN0lwHlfbAXfdXrH1YBZiq5NswnbWqO6JFpRKU9AdJks8Q61GHzarSNW2EAwMk2+P9i
         +oYrI114loc9bjMwHN/6RcRfZg9e8MToOq9eEw1XEErDd8805X3fDDJqDn7WmHJAAjpP
         eXnYyBWSNNihsEzIGa2kpEXBgvIQ/vexXvjEtIf38iv6G4TXD9iGyMRAvDc10k7BOlrL
         MY0Q==
X-Forwarded-Encrypted: i=1; AHgh+RoQGAY0xu+pnrYZcMqP6e+f+Wo6zdbClKjl6EVTc5oV0aY73CJkg2GJhfltzdFMXJnYBOCuzJTf9Uvi@vger.kernel.org
X-Gm-Message-State: AOJu0YznIVs3OQKyjh/nB5/FuOCcGYqSxNnGkuSAvpU1ML+WtJxC7Qi9
	ribcWMW1R9fev6Unfc7Kin/i1kARxKOZvmiSJVRogTc7PSrRXs9Q74CF
X-Gm-Gg: AR+sD12iAYUgB2Mj/mPRlNOeLWiK618nXBg4TAtf/yYRQcfYZOm8zfcY2FRY1w/ulmC
	BP84nKqXHQjNMZu2TQBqHyqhx/3tCdvk+Zy7BRholZG7ymUNSOo01xjlX8Jcyt8Bk1/RFry0qJ8
	P3v2KSmEVYjgXU31r+6gOCuZYP585yeWdLd4oKyqnFiZXpR130MvbD6n8Q3REyyZlT0cvKyqjwT
	JBGTNmmI1JD5SdvwdpoHibLyoO1BgzUdbIjkea2Mwq1OTyOqspIr9aFL1CPyvoF+TeOaXenrNPq
	VloDj3Aj/cvJy/voDtQ/+EIcj5GAkjuhetsnnYdJYm4Ni2XagHUM8lcgFJSZXMjuUjRn5FuppE9
	oHCvA7TQdmd0bqx+U3em68mipZ9RbnJyK8YRkeDyo35Pp9/4xLJv7GafMDfsUm9T7oPaLKDAFJp
	65/wose3SX7jcEl1W8OABJy8eOSfd+kUUEgspMlZZnbFAlbP1twxdcPi+7QPSA9EYAuHWPoTaLh
	/4=
X-Received: by 2002:a05:600c:4594:b0:499:5f7a:7ea2 with SMTP id 5b1f17b1804b1-4995f7a7ec4mr269156765e9.12.1786346626226;
        Mon, 10 Aug 2026 00:23:46 -0700 (PDT)
Received: from localhost ([2001:4bb8:16f:15e0:1fea:d6bb:2a18:69a3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995dee21dcsm274995515e9.0.2026.08.10.00.23.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 00:23:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 10 Aug 2026 09:23:42 +0200
Message-Id: <DKL311AVLOJQ.OEZKZRL7ABKS@gmail.com>
Subject: Re: [PATCH v5 1/4] dt-bindings: iio: light: veml6030: add
 veml6031x00 ALS series
Cc: <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Javier Carrasco"
 <javier.carrasco.cruz@gmail.com>, "Jonathan Cameron" <jic23@kernel.org>,
 "Lars-Peter Clausen" <lars@metafoo.de>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "David Lechner" <dlechner@baylibre.com>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy Shevchenko"
 <andy@kernel.org>
From: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
X-Mailer: aerc 0.21.0-143-g2f3a2e260c09
References: <20260807-veml6031x00-v5-0-e60876fb3640@gmail.com>
 <20260807-veml6031x00-v5-1-e60876fb3640@gmail.com>
 <24817802-5fc1-4961-b0ee-c6e9f6e763e2@kernel.org>
In-Reply-To: <24817802-5fc1-4961-b0ee-c6e9f6e763e2@kernel.org>

On Mon Aug 10, 2026 at 8:23 AM CEST, Krzysztof Kozlowski wrote:
> On 07/08/2026 15:51, Javier Carrasco wrote:
>> These ambient light sensors share their properties with the ones
>> from the same manufacturer that are supported by this bindings.
>>
>> Note that only two datasheets are provided as every one of them covers
>> two devices (veml6031x00/veml60311x00 and veml6031x01/veml60311x01).
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
>> ---
>>  .../devicetree/bindings/iio/light/vishay,veml6030.yaml      | 13 ++++++=
++++++-
>>  MAINTAINERS                                                 |  5 +++++
>>  2 files changed, 17 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/iio/light/vishay,veml6030=
.yaml b/Documentation/devicetree/bindings/iio/light/vishay,veml6030.yaml
>> index 0041e1db6838..6a387c76df35 100644
>> --- a/Documentation/devicetree/bindings/iio/light/vishay,veml6030.yaml
>> +++ b/Documentation/devicetree/bindings/iio/light/vishay,veml6030.yaml
>> @@ -4,7 +4,8 @@
>>  $id: http://devicetree.org/schemas/iio/light/vishay,veml6030.yaml#
>>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>>
>> -title: VEML3235, VEML3328, VEML6030, VEML6035 and VEML7700 Ambient Ligh=
t Sensors (ALS)
>> +title: VEML3235, VEML3328, VEML6030, VEML6031x00 series, VEML6035
>> +and VEML7700 Ambient Light Sensors (ALS)
>
> This was correct, now is broken. And was not even tested before sending..=
.
>
> Best regards,
> Krzysztof

Yes, it is. I replied to the Sashiko email before this one arrived that
a new device was added to the binding between versions and I just
extended the title without further thinking. My bad, I have added the
missing white spaces at the beginning of the second line for V6,
validated the result, and included dt_binding_check in my CI pipeline
to keep this from happening again.

Thanks and best regards,
Javier
