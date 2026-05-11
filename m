Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C637044D6BD
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 16:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778517078; cv=none; b=kEPluNpotYHAZdK7EGCPh+q7rYNSgSgjcXvP0VR5JskCsgVfdB2PsePA5x9q0+rckRfkB4zGMD7iym3epFXdbrCQhSG0lKDko2bCmR2Vx7M000kUDFGsrDiLt7HhRFNgRH9dIMdUdWiU/F7T+iqI/FOjK6bvDzv//OF2icW4t80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778517078; c=relaxed/simple;
	bh=IIU8wUeI0jxb5eXBdhbsfaDmibH8CEW4NJmO2Li21A8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f4rNyo4+3GxJCJAOd7NBbgCRKYf5Oe8QW4Ji8UR8pzI6Ry2n3Na6EdrNSjBPReN3Dg1uGzn8bm3kSvEMeo45cIfGcDD2lzKCoGq/cHY5qu34iZKU0AfIT50DHB5JbxIe2asmYIF9r5Gz9IQQkKTFK2fNpBP9A9qPV2+LGdXvJnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=HtNQXA+F; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="HtNQXA+F"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-435428c81a3so2302820fac.1
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 09:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778517076; x=1779121876; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EM/LUQ0z5ULIMOKs55kf8JAOorhzQl2aX18pg5yn5XQ=;
        b=HtNQXA+Fd+oMYulYia/J89/TYMJzXVgqIacHucQUi92FfqpG7GHLxHqv4pOuHspCYj
         K4BixEYYBdXYCUe1/qkZGdySdaDLB8SyhIHcBe4boJ0RVULrV855cMmv3Yrsb/DKSF27
         IhqE6mKNkjnuSHs4BkOGUokvqFh1EMiCDwK0FREQt4O8jkKiRRkuvL1hmDmfNY+qmuVz
         4V24EkbnFoy1peSh363VnhN8wZC0zrDDWv4mkJ6ktB0F15f3QC6Qy8lnVGwZU8PUC19f
         MQwqMszkSKfeyj+ECC3elhNrrlZyrcAd90nDX7NXPgfaD8yzTmbKwcsVtw8f57qKIog2
         eA2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778517076; x=1779121876;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EM/LUQ0z5ULIMOKs55kf8JAOorhzQl2aX18pg5yn5XQ=;
        b=VOHadR5gplCgXwompSYcaKCk81sNG1/ZFt1jwl2K2tUQTTFyGGPGUP5CVhNA7eRUEz
         OJEWCeL4DUeFMAim2rpTpsnY8/XMCm0bsKnQxpuWK5t5+8WdSLp2Y+XH/9uaRaXgFMki
         iI3xUSQ3Xme1xG0RdObadoNa+bjgrz1VdNUJghyXuWxJMv5toYiP/BWE4EF0xNA79+nf
         aaZbxAMezV5aM4CIVPkRjAYv2t8nCH++a7ewahPLGF8qwAcsvDVL6fjinL5r8wMvxhBz
         GsLArMhKGMIinJh+xpPnkZSf+QZk9VtGzyyAPfdhmbqThiRY8bTosUfmIq7FHL2dN5G/
         zzxg==
X-Forwarded-Encrypted: i=1; AFNElJ+8oCW1bREgB2oOqekARqjUalCb6aKI90GQ+vgvHT9fjXTu3200487LTK2uy0Lr/WvvtN0fqer1saq2@vger.kernel.org
X-Gm-Message-State: AOJu0YxKxAWTnL8sVV2qx4y9WiEO/Kugqp1ynBdO3t+ch+s1qxpRamwp
	X6slHIJJgi5XWfjssXmxcEexIQodwFvvlvYi+YAvOsw07zI0a24vPWSDG64I07R9bo8=
X-Gm-Gg: Acq92OGFRKhm1yW60D4w/1ab9hd/v2ipMsLyBF3ag9hENWNPjFLvJmXbfv0kyWilnWK
	4xJyWy0jE8dRI6x45FhslXMXewzThWNC4qC/Kp37ALk391CktkB4oDbWKdPJSgSrMiQWXBRImSQ
	pqIHA9kGfmTQmVYJH0GIGxci3nhHGshpHPy5uvBL3mfm0jpBDfDAJ6u/mmhuF9W5P0DDe774uI+
	IRMmFjFtJV4709FcdEc1yh/oHVFiJesKRh9NsLrarGWOiw9oU7PbyLF5FzJcC8AITIxiA4JnM2x
	2x29JaN01rOUaZDaek23PyYHdnhlxhYczFs/1YJbONLTybeZHBrjeOT7BC0VgEAiiI7BxfA4q1Z
	ZoDRyn3Ual6IInJY+iwuKwfJZqxfIn3GQ71qzf63tJJhc0iIEFJdkxHquKypGShOAYNHuztWGX8
	26jSeVLW/K8B9c5I3SKgckz/gemhn9rwuiUIm9FW4I4MeSPGn0daPAmWB8qAxnIrUjFBkgaNU=
X-Received: by 2002:a05:6870:242:b0:430:2b69:8e9a with SMTP id 586e51a60fabf-43556b27e81mr8020446fac.5.1778517074483;
        Mon, 11 May 2026 09:31:14 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:591:4577:3439:3a1e? ([2600:8803:e7e4:500:591:4577:3439:3a1e])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-435570ad8f4sm10106250fac.4.2026.05.11.09.31.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 09:31:13 -0700 (PDT)
Message-ID: <f9469c48-ea67-4106-a577-4818cf3dd51d@baylibre.com>
Date: Mon, 11 May 2026 11:31:13 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] dt-bindings: iio: adc: add AD7816/AD7817/AD7818
 binding
To: Denny Lin <dennylin0707@gmail.com>
Cc: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 nuno.sa@analog.com, andy@kernel.org, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260509022718.82957-1-dennylin0707@gmail.com>
 <20260509022718.82957-2-dennylin0707@gmail.com>
 <f6e2a4de-4c1d-46ef-b383-db62091fd0f4@baylibre.com>
 <CAGEkeHfeZWi99TMvkXHhMSrUS8PshuekqjszBXaS39VsLUZ4eA@mail.gmail.com>
 <3493d6ef-5f02-4eb1-b81a-89597045acbb@baylibre.com>
 <CAGEkeHcA+aJ_h5APbL_bG3vpyY+rSGEVn=Dk1Abe76MKDdyVpg@mail.gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <CAGEkeHcA+aJ_h5APbL_bG3vpyY+rSGEVn=Dk1Abe76MKDdyVpg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 5/11/26 11:23 AM, Denny Lin wrote:
> On Mon, May 11, 2026 at 7:51 AM David Lechner <dlechner@baylibre.com> wrote:
>>
>> Usually, we want to be moving the drivers out of staging when
>> adding the DT bindings so that it all gets reviewed for correctness
>> at the same time.
>>
>> Drivers in staging are usually there because they are doing things
>> that are not actually acceptable for the final stable mainline
>> version of a driver and need more work.
>>
> 
> Thanks for the explanation.
> 
> I took a look at the driver and noticed it still uses the older
> IIO sysfs-based interface rather than the iio_chan_spec + read_raw
> model.
> 
> Would you recommend updating the driver first, or is it okay to
> proceed with the binding separately?
> 
> Thanks,
> Hungyu

ADI's website says that these parts are obsolete, so unless anyone is
actually still using these with a mainline kernel, I would suggest that
we drop the driver rather than spending time fixing it up.

In any case, unless you have the hardware for testing, it would be
best not to make significant changes. There is a non-standard "oti"
attribute that we would need to figure out what to do with. This is
likely why the driver is in staging in the first place.
