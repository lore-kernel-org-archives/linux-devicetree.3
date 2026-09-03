Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5F54503FF
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 15:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788448786; cv=none; b=DfBUsXdiZFF+meRqlVrvYC2xEUevTT8kjnP0cTf+CBQ1KLTEwcxZsFr7IDpzlDCqMAbMQNI81ZCXy3iJHttxurJ69MUBX8FOUeytC4/HxnhbMBRZE3NRYT0NIwxpjbvh5h+he79ZX4IFz5C1h6No8nmG3BXMbNTaXOSDIKct/xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788448786; c=relaxed/simple;
	bh=nbUSOnH/yAvzACxNcixvd9qpwb8O+QZ2GQHLOMzuIPY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lIaiEbJ2feb2l+0Jh6ysMLFj15p2HduuZm7VG4aJuw2OYOp+stHITG/9Hgkcjwvk48wo4Aa/XqO2OD2Z2PqdGY/NfZuEjquel3BaMwPuDvfqJ67c1PpKzkU4+0F8ZdqimMsj0d6jG9YAZaacqdQPfYl38YyLclXmrYB/3qF+srE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nJ7q/53U; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nJ7q/53U"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c2055573c8cso344731466b.3
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 08:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788448784; x=1789053584; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c/Qt/fPdwPC3wUdBHPi4+U/TKrcXHOgncT4srAq3Wek=;
        b=nJ7q/53URt/69k208sxM1yKudzlYB+L0/JyD4ElL255rqI9h+qVygVbjAAmMHxc2Fm
         jO3hmE1Sk/w3cfsVNFKERUWj4KkNj1lt1dyWZh4ZNPI/fu0gKOyJWk/kwAcSEEZrx52/
         oOlNtjE6LonmH6+llRBje4XOHbFQg6Az9LMaXoBiIg2663j6CGyQwb1cPMO1jwZ9Sx3V
         KFz/MNlkJJOuP4jWcTsZgkSc6Ds0NzZZ9ReG6hWXFxDv7hsa6HpcOsaNx3gE72sCvLPk
         6zS+u0TMTxGqSJEWWII2gkGS7REnC/ipy4RfNerlfXrxClD3L/XPlXqyCmWXGRawzSWe
         7onw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788448784; x=1789053584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c/Qt/fPdwPC3wUdBHPi4+U/TKrcXHOgncT4srAq3Wek=;
        b=sIZZRs0A/2bde8KmuzreC8BrDecrT7oH+RFfHTqYXsOvfsI6TLEka/L3oHKkxzeqzN
         Xyr0JRIYm7UbgIDmrkjqjax6e8euzefThLwu3hzh07+Gqfn0DKHzvClhKhm/U9QGL8XT
         zCubQobiRBPeMpMAN7F9lTOkjAe2J81fty5ULNu97CqJxyhuWWK5KfogshRkqTxiw2p7
         zZb06Gw2Fj85WNRiTi4Fp783A1TXEQpcUQTVHROK/wzqqyzvBODZMR6PdyCwJJMf0PZN
         Zupa6lY5YNNi2A5FBBYChOG1L6YH7eUaSE1tKbkMImFDI7JKmUFRMn8i4RTKp/tlWvZD
         b/NQ==
X-Forwarded-Encrypted: i=1; AKwUvBxwhFMPKbdAFWVmSGpJGb1ywvqr4qJrq+QrbhhnrUb3UP1Z2L3HEy+JG3a3B4Zjjvc6TiRDEp5ZosDg@vger.kernel.org
X-Gm-Message-State: AFuF++kqGqQPJZP2r7dFkd9cca2tgLyeB+LzxaeuF2QoWgMm6cNUeP/l
	ua4muc9DS6Dys2MJpZWoWmAvD5WgNrDLUtcxQ/vUyTQWXyaaO1vJHZQq
X-Gm-Gg: AYBFou2lkbR1ykIIwi+hIWpM/8/vPyNJ3os14HqdDSAmLhOA3vM8TJb+v3nNd2Z7yDo
	y/SzIzkz6Llii17YXulVeQZtJA82FnBYq8PilROBR/UnE20HpX8jGHsKRFEdxLAfvwY//BnFv0x
	Pkrk0aAus1SdrINxswHqowxQ1JOSr2NrW/m11tcadZoRIeMts9xV5g1AIFknWnYMM4kp+THhuLP
	GExZPvsPbCr5NuR9KUoOC5SL09wil6lNCpPsUM1HO9Gp9XCezBZxsTzpHOc2l5BEdkjDmlfUcHQ
	y1o1TVXAslt5JjBiHhKmLQ4WizVo51ifd+1sO2JQZcmmR+VyqBs4nHKvT8OGI3V7WAyPTuqIvh6
	GGfwVzzlJRxZ8klfpz5xpDGFitfDAxcneffUgqZnQtAJ5B1zEtLy4+ZGU+/T/sa+XTeIUjbXn22
	cMHoG3JrYi+u9aVmXF82FY4uQCRtKfd20LeJPuu03GN9SpMnCvmj2Ebw33JlPnM+DzA2KbozXy/
	Al/ya97ugjaVnRFpxmh54fYYI1dSM1PEI0pXA==
X-Received: by 2002:a17:907:3f88:b0:c21:450d:cd7e with SMTP id a640c23a62f3a-c25d53be168mr861775766b.9.1788448783664;
        Thu, 03 Sep 2026 08:19:43 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([5.15.67.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e13db0sm14634897f8f.0.2026.09.03.08.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 08:19:43 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: David Lechner <dlechner@baylibre.com>
Cc: Andy Shevchenko <andy@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Nuno Sa <nuno.sa@analog.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Flaviu Nistor <flaviu.nistor@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: iio: adc: ti,ads1015: Add label property
Date: Thu,  3 Sep 2026 18:19:39 +0300
Message-ID: <20260903151939.5117-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <60dc58c6-dfe2-4377-9a73-f65cda56179c@baylibre.com>
References: <60dc58c6-dfe2-4377-9a73-f65cda56179c@baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 9:31 PM, David Lechner wrote:=0D
>On 9/2/26 12:22 PM, Flaviu Nistor wrote:=0D
>> Add support for an optional label property per channel similar to other =
adc=0D
>> chips. This allows assigning distinct names for each channel which can=0D
>> match the schematic signal name.=0D
>> =0D
>> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>=0D
>> ---=0D
>>  Documentation/devicetree/bindings/iio/adc/ti,ads1015.yaml | 6 ++++++=0D
>>  1 file changed, 6 insertions(+)=0D
>> =0D
>> diff --git a/Documentation/devicetree/bindings/iio/adc/ti,ads1015.yaml b=
/Documentation/devicetree/bindings/iio/adc/ti,ads1015.yaml=0D
>> index 718f633c6e04..777a75c21d7f 100644=0D
>> --- a/Documentation/devicetree/bindings/iio/adc/ti,ads1015.yaml=0D
>> +++ b/Documentation/devicetree/bindings/iio/adc/ti,ads1015.yaml=0D
>> @@ -66,6 +66,11 @@ patternProperties:=0D
>>            - minimum: 0=0D
>>              maximum: 7=0D
>>  =0D
>> +      label:=0D
>> +        $ref: /schemas/types.yaml#/definitions/string=0D
>> +        description:=0D
>> +          A descriptive name for this channel, like "vcc_ram" or "CH3".=
=0D
>> +=0D
>=0D
>Apparently this chip has quite old dt-bindings. Normally, we would have=0D
>included adc.yaml to get this and other channel properties.=0D
>=0D
>And we would have used diff-channels and single-channel from that to=0D
>describe which pins are associated with which channel rather than having=0D
>a magic number for reg. And the ti,datarate looks suspicious as sampling=0D
>frequency is usually we control at runtime.=0D
>=0D
>Anyway, none of that is really relevant to this patch. We'll see what=0D
>Jonathan says about using adc.yaml here vs. adding a label property.=0D
>=0D
=0D
Thanks for your feedback. I can also use:=0D
=0D
$ref: adc.yaml=0D
unevaluatedProperties: false=0D
=0D
and move additionalProperties: false at the end of patternProperties block.=
=0D
Any other idea?=0D
=0D
Best regards,=0D
Flaviu Nistor=0D
=0D
>>        ti,gain:=0D
>>          $ref: /schemas/types.yaml#/definitions/uint32=0D
>>          minimum: 0=0D
>> @@ -125,6 +130,7 @@ examples:=0D
>>                  reg =3D <4>;=0D
>>                  ti,gain =3D <3>;=0D
>>                  ti,datarate =3D <5>;=0D
>> +                label =3D "CH3";=0D
>>              };=0D
>>          };=0D
>>      };=0D
