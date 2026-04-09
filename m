Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2DA337F01F
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 07:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775720658; cv=pass; b=VR5jO40Xhv9x9XokIGLZsvq8V/ppjjnGINoqt1B0otcGN77zg6zA7OfUAJCDEG+p7V7IM8gu/o9yQcGTKkb0CZrWzeuF1rrCCCBotsns+HKGxx/wsgccU6KYDaXC4BEP3o3AQnkS2WkW+G592jecxfuiEh8veDDQYiUaTIRar9o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775720658; c=relaxed/simple;
	bh=unXet/iL5/aNElFYjzBuKW9iIKfPTLg2m6eG/z4if7g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iL8/WcxbtPj0m9m3P2ZmbRTc9m7znjxDvfdgLUzxEJ77FKRr3OiHbrGCpK75w27Hw12FyZdB4gf3q2LyHeG5P9RV8Tdk7kCDhxd3OnvB6fyU+142KQ/0+ZfWRQAq5OraDozp1rKLcUo/gwhn+VhX02tLdP4tccCFhJMasWVsTU8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gIXs5aku; arc=pass smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gIXs5aku"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8cbb6d5f780so44430785a.1
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 00:44:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775720656; cv=none;
        d=google.com; s=arc-20240605;
        b=IXZnyvXw7UVvZkLBxZhLtlvtTVGEQzqSn6jSWa0k2qwHnws5FgZVYEKRq7vNZs9gd9
         iYyy58XMkp21ZAFZdXp0oFyQA89NM6Eks/X+XnD5SDOxiNHcRhNSwRuyIsAM7YUVU50o
         0DXEMFYzE22oBv1AfDgytSbNcM3d+3NK7JY6ZOl0J8eR4XRKNyYiHSJH4GyZVMPDXBrL
         qRtDe/JsKGcKQuzVeneuXa7K4FSp4JWS3Praddgz4GfPbgLonw/yoRiMIAX+huqm8DQM
         lPHeNwSqXz7rCHRxX7lRgYXsC70BhvSlDC8atjOCIoV4RcQO3TDCtPqsditQO3f9bZ3/
         c9qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mjKb6EN/rzrknJzk+ZEcHNzKcWRM5K86to8xhtDCCyE=;
        fh=57tNYuYoK9i5yqrGajYGJeuglJe/AZOLqheHFekcfT4=;
        b=OjWX0dAnVf7caEsVCpyqPPgrPHaQtP/L9XeMAPYBrkXCn424lOEzypniOJXlLOY1s0
         HQZwVK/SlSWLm/vuUs70oz1whIOxaaLQGrKUsKCTN4KvdZeu5vEKv4REz2F/IiAIG1Jr
         AY+sWBAvg1ULlw5wUqUeDPN6QW7Sm+cwZh+uFpDRg7ZGaa3EZHZO3qhdTPpPy3Qs/z2K
         i7o7xC/TTys/ZuV1MQXU9VGCY5TEj75nDH0aIceBQ6OuiYQC9+gQFpfYnh6rzuCYU8QF
         mhu0jASlRJEwXwNbtFT0+YzemowpOO3kJWLsj4a7FPGH29J0EiYWco6XUcKJgRH0O9vl
         1xJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775720656; x=1776325456; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mjKb6EN/rzrknJzk+ZEcHNzKcWRM5K86to8xhtDCCyE=;
        b=gIXs5akurQP6oDT41+MkhC6fVFMI7zrGMibpLyVitNr/47sRQU/S7tYg6oQX37YOQR
         Yq1J04o48fN00/1nPyKI/omWp/dAjqjVmQSqUXbgJcM7XSORJWa636ybtxeE4gWnqwvQ
         Hd5QsZbvLP9z6dRLi1C+ClexzwTvHhmhkoyLDsvSFJhaKvpIEUg43YOkG3aZOZTTgpPO
         iwOWyUYZigRya9uN7lFGHBDpHYVKE329GCNeEyxLa7MKd2f0xMtcP2hBTwJNVK2Io1CN
         Gh80REQ5KCnzySSF0Fzd9k5eGSlHve9FxXdMMChJ1YNuNiwT8pPVIqr1R6zopmN44+nU
         SJGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775720656; x=1776325456;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mjKb6EN/rzrknJzk+ZEcHNzKcWRM5K86to8xhtDCCyE=;
        b=NUCL1tT7zbvtLAE1kgZlphmhln1kKDIY8x9zIxrtq/KfiX//ww5wlwrylOd1KbmEDy
         WKqzmhA20ASIxZ4mBIAIvSLThnMV1ZUAi2vQkwJIYeIo46lVKFl2vPUyLCTzEo4O0wMW
         gN0gdV2hCEdYeEcCWLVJ4UoXGmd0RiJ//CAsmqaE32p04xyfRXZIxynme2RjmoFlqB3X
         M2XcZ5IxNR6mje8OC2KWMbyY2ihnvmJPoniut1vcWzzFBEow0banMcZ6MTz02TttDTWf
         qFsgx4QsLgc6MooUOVD6lpce/96G9YvinldXhvHPJ2uB87PSK9U39Awfcn9vo0GSfE4o
         RzrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWm/OYc/eF063N0dNnNl/t9PfAew/hwh5emlU31Ncp+UtqEItiqlHt//7hVK7cvqdpkMPX3+FI8pxK0@vger.kernel.org
X-Gm-Message-State: AOJu0YxLampmUgu3gvhdmyLz/4qfhMBfIaSVd4PG8xCGukeSyrXdCnT6
	+WNhZWtopdsHpGeUxg/faOTShwmCv2HY8nWvzASBQm5G+9Tu6Px7D4Ebzl5njp/fXkMJ9nS+Q1f
	F0SVXidx0RedEnq0Z31mbn34+jdt+QBQ=
X-Gm-Gg: AeBDieshtq4E/V7TYBW+IzODkPOTXOlAqPBcSrhdGlKgqRLRkKyDcutYIR7+1mMf4bC
	UrmocTIDLWYvQNFWlq9cgTrVcLedA+o+PnXbe2iMJqMsM6p5gi/sTlcIVImVRXWGthlcTGjTSrh
	j1VHPtkmpQUNfU36xNPAdEn9xM8Nj4v+nSAP51x52ppUak12MEGpuTX8TRiH3paHR/vzrX3nYQ6
	/Nc6wK80S9DhpewsjE3STXixkJEFTXgdHUxqoCYp0UEv1f5x72VHCasLW6Y7Yd4n3qheiKb+Ul3
	EHLBUbM7yPX4WvT2UtE=
X-Received: by 2002:a05:620a:448e:b0:8d5:26e2:661f with SMTP id
 af79cd13be357-8dc3d65d215mr363217385a.42.1775720655867; Thu, 09 Apr 2026
 00:44:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1775717959.git.tomato1220@gmail.com> <ba0845c590eda42a28b3799a6f40294ba74a726e.1775717959.git.tomato1220@gmail.com>
 <a1e24b69-b90a-47d7-b952-bca45fcc6281@kernel.org>
In-Reply-To: <a1e24b69-b90a-47d7-b952-bca45fcc6281@kernel.org>
From: David Wang <tomato1220@gmail.com>
Date: Thu, 9 Apr 2026 15:44:43 +0800
X-Gm-Features: AQROBzCF7F3D8qQZzH4nVF7DtpNul6eHMhQM5j4hlrJJj6BRCmL9I0ox9rpAVNY
Message-ID: <CADSQSY1rAnZ69JAjosV_AWBw9OL77dyzHkewW5YGvpCZRwXq5A@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: rtc: nct3018y: add nuvoton,ctrl-reg-val property
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: a.zummo@towertech.it, alexandre.belloni@bootlin.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, andrew@aj.id.au, 
	avi.fishman@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com, 
	venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	ctcchien@nuvoton.com, mimi05633@gmail.com, openbmc@lists.ozlabs.org, 
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, davidwang@quantatw.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Apr 9, 2026, at 15:23, Krzysztof Kozlowski wrote:
>
> On 09/04/2026 09:21, David Wang wrote:
> > Add "nuvoton,ctrl-reg-val" vendor property to allow optional
> > initialization of the RTC control register (0x0A).
> >
> > This allows platform-specific configurations like 24h mode and
> > write ownership to be defined via Device Tree.
> >
> > Signed-off-by: David Wang <tomato1220@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yam=
l b/Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml
> > index 4f9b5604acd9..0984dfb77170 100644
> > --- a/Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml
> > +++ b/Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml
> > @@ -24,6 +24,10 @@ properties:
> >
> >    reset-source: true
> >
> > +  nuvoton,ctrl-reg-val:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: Initial value for the control register (0x0A).
>
> 24h mode is not a property of a board. I don't know what "write
> ownership" is.
>
> Best regards,
> Krzysztof

Hi Krzysztof,

Thanks for your feedback. Let me clarify these two points based on the
NCT3018Y datasheet:
1. Regarding "write ownership": The NCT3018Y features two I2C
interfaces (Primary and Secondary). The TWO (Time Write Ownership) bit
in the control register determines which interface has the authority
to write to the RTC. We need to ensure the interface connected to our
SoC is granted this ownership during probe=E2=80=94especially for factory-n=
ew
chips=E2=80=94to ensure the RTC is writable.
2. Regarding "24h mode": This bit determines the internal data format
in which time is stored within the RTC hardware. Setting this ensures
the hardware's internal storage layout matches the driver's
expectation from the start.

Best regards,
David Wang
