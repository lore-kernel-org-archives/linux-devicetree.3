Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B34A37A4AF
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 07:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778226286; cv=none; b=Mr3Cs05qJuf0a2hSfzsUiEEr+r0hCAZtBmcSJHGit152bt6p1vsuAgqZ3QdPo/BPBO+tJlnHfbRZOagQm3zWvxK2E+aEIZ/YtVvlD0TczSOiBkqepXxbTd+07CIjfllhfTDcseXsOr9ZX/qXJUBK02LdDEoFRro6UA6KgC/BGtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778226286; c=relaxed/simple;
	bh=o15c3ZjdEV9em/vqcb+hF02R+chYCPmBw+qeMWlaJQg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Znu5vz+8pObQlp3IKczolPfbG2QKJ6+0Xtyit+DA6FwCyVVwpTBoC650zzp6MiYlXkXTFlXiktCropQp+91BiuFAQOI96Ybx2yTBYuj7l6jUTWCbxdTzaFCda2YGA0gXDdjBVW/Cttmg8LJ6U0gdEEPHTUEL64nemWbcB38NJag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=C7DmsEpC; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="C7DmsEpC"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ba699316b42so280678266b.3
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 00:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1778226282; x=1778831082; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nDjfGFQB/3KLdXokArqrjAXXqhWAtauRetXWKTzWGMw=;
        b=C7DmsEpC3ahphstpJ8EZ2kF1/Wg9T5KyigmO/ZMaEPmMmlD0AojXDRCP7x5uj/txq2
         laU50Lgn4qQ/xi+DOIzKnNTGFA8nL1baQONmNWho5SZmyNzpgwL/Vwotd6fQgPV8PVad
         l+XiYzHGlbC0MjhJKZrw4YtzQxHLOCRCszCRS+j2HTNFfwofdxbCG9wNbLRVPTdyKbXx
         solHBIQuUBG15YDjiHnN5uTjcOo3kgFTrFTStmeCz0B3Z1RcFdEZ0YneBrihlGs2PnWP
         2DTNkvYhrmR48P4/u1M4JZ/wNb+yEkbUO8xGcD6c46qTbhlBLxMqnfFfQnaIfmnkUlPs
         kmQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778226282; x=1778831082;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nDjfGFQB/3KLdXokArqrjAXXqhWAtauRetXWKTzWGMw=;
        b=lQ+K44Q9vGBJrebRYWv0KGoinzbzF9Aly/ifSaEYqFRF1Cd/SK+bHzLCt6JZ2WyOQ5
         jg+Wtr173PrewAVfswwktvaMeElqXiNcnfplx77xJV4jCE+n0q0a/jw5SH4qWdeQCpTB
         fWGyweDFaJ2cOXGAasgn5hBlIIco9XJVXFj1pjoOr3XeyVCP4zm2TkcR+nB90kRUNLrC
         +KySzCbyAmquu+Pl6K/kwEj9G7Hj1Iuie4+9DLon2SvX4x9nzFQ2NG1EDsGpoVcHjYEa
         hr3XZlgR+7N29r+lTukBmnhSy0xfZp/YU495zLp/rNH/or65u+IFIuiheARCHP2eM75i
         ISJQ==
X-Forwarded-Encrypted: i=1; AFNElJ/99ZBJbl5YOyEF7IAuslvvD+uaQyGO0M+4UdBimbgVzE/dQVxpTtEKoczIK8IYg7b1hnWnhNqU7i99@vger.kernel.org
X-Gm-Message-State: AOJu0YzRoacHnuqqNJSiTsTAOVmG4wcsdUnz4dh02L/EoJZYnVstzLv6
	h/CrxxrAP6HtskBsqcnuza4HAjzZL1yjE5L6t289VFqOgNHwwFrtx7Qnk3kUdY0rpNE=
X-Gm-Gg: Acq92OEuYcdZV0kW5SJeSv3HCtAWSR6oiloepwXHoXmyDAHzpcEUUBCcW0aEOZ6jSx/
	gc3RvYaKUsEIqBRRy1dMSnitEj5MskQelYmeYWVIBMVyyJSX/7CY5bIQOcEmtUWmfEQQbDFaq3b
	TGgqvKUxmGCV2R+kgeanWSydqqXE6/32ll19A/n0o4rjcohA5zXTNweEqjHqcjvW52fTLCG+m88
	kOP8dnqjuckbXK+9ET+jvhzrF0m9mjJLBlOAXgpVV3OMB/dI9Jx9TimW31MYj8SE5Rz2PLwiV5I
	bdmgY+Py22Q6hKczJaG8dGcID/rnHE2vWH0zUAl/5pRXr+qTEP0EwmTjEL9l7ZNuIEvnkZDok6h
	wIuCTC1E/f/jEkyIVUxubliyQvkLXNZqNnrt4UCiWcwDdQNG0EjwnIfP+eGyKMMMJ4NGGPPyfN7
	rY9UnHkjUkrTFPi+ztS+WQ2s4kSEdP7gx4f+PGsY01rFbbf45J7OLMClM48Aa+6DvsNf0E
X-Received: by 2002:a17:906:c394:b0:bc5:cff4:8e3c with SMTP id a640c23a62f3a-bc5cff4af34mr446060566b.40.1778226282237;
        Fri, 08 May 2026 00:44:42 -0700 (PDT)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac43581bfsm42651566b.46.2026.05.08.00.44.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 00:44:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 08 May 2026 09:44:41 +0200
Message-Id: <DID4LW3GMLDV.338VDV2L2IPL@fairphone.com>
Cc: "Neil Armstrong" <neil.armstrong@linaro.org>, "Jessica Zhang"
 <jesszhan0024@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: display: panel: Add Novatek NT37705
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Conor Dooley" <conor@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260501-fp6-panel-v1-0-e09cb05651cc@fairphone.com>
 <20260501-fp6-panel-v1-1-e09cb05651cc@fairphone.com>
 <20260501-yogurt-wise-2a2884e3ec59@spud>
 <DI9XL1VYYTY7.19IRSM8VIDO53@fairphone.com>
 <a2444df4-abf1-4b56-8556-7efb238bc677@kernel.org>
 <DIAJCURQ37FA.1CNEKX6QM6ZO8@fairphone.com>
 <dd7ebb25-014c-4983-ae31-6a6cbd24e628@kernel.org>
In-Reply-To: <dd7ebb25-014c-4983-ae31-6a6cbd24e628@kernel.org>

Hi Krzysztof,

On Tue May 5, 2026 at 9:25 AM CEST, Krzysztof Kozlowski wrote:
> On 05/05/2026 08:40, Luca Weiss wrote:
>>>>>> +  compatible:
>>>>>> +    contains:
>>>>>> +      const: boe,bj631jhm-t71-d900
>>>>>
>>>>> Compatible doesn't match the filename, nor does the commit message ma=
tch
>>>>> what you've got here. Sounds like you're missing a fallback to
>>>>> $filename.
>>>>
>>>> The last times I was upstreaming panel drivers (Feb 2024 and June 2025=
),
>>>> this was the requested way of doing things.
>>>
>>> So this was requested that time and is requested now. What is here
>>> uncertain?
>>>
>>>>
>>>> Compatible being the company and model number making the actual panel
>>>> assembly (driver IC + touchscreen + glass etc), while the rest being
>>>> named after the driver IC manufacturer & number.
>>>
>>> So exactly what was asked for...
>>=20
>> I don't quite understand what is asked for now, that's my issue.
>>=20
>> 1. Change the filename to boe,bj631jhm-t71-d900.yaml and leave the rest
>>    as-is.
>>=20
>> 2. Add a fallback compatible for novatek,nt37705. IIRC last time it was
>>    argued that a "generic" nt37705 driver will never be correct for a
>>    specific panel since it's missing a bunch of panel-specific init. So
>>    that's why there should not be a fallback to nt37705.
>
> To my limited knowledge the (2) with fallback describing the specific IC
> is preferred, because that compatible although not currently usable is
> still specific and describes actual IC used. I imagine that such
> fallback still could be useful to some SW implementation to determine
> the IC and act based on that.
>
> If you have sources of other preference, please share, but I just gave
> same review to Neil for his ayaneo,wt0600-2k panels.

I found the discussion from 2024 for the Fairphone 4 panel:

https://lore.kernel.org/lkml/f9164049-6529-42c1-a35a-e91132c823b9@linaro.or=
g/

(quoting)

'''
  Not sure if "himax,hx83112a" is needed here, the "djn,9a-3r063-1102b"
  is enough to know the IC is hx83112a.

  I don't think you'll ever find a "djn,9a-3r063-1102b" with another
  controller IC ?

  And "himax,hx83112a" alone as fallback is not enough to describe the
  panel hardware, so I think it should be dropped.
'''

With Konrad replying "+1" to that.

Regards
Luca
