Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCD33FF8AC
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 02:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784599986; cv=pass; b=Ybpsb3fkaz/6Mr5SY1LdEiT6chpkgnZyCbn7pjE8WZdwsumorXRG5J31TUEUZkwrQNM/QMqgLyD8G7oRVoXTB4YyeSdCU2aewP0+HzeMrtZdH7F2zPoRaoVEdKPIyepn9FXeX903wTAKgReK9JvhOX0Zi1Mulw0qPyC3XsFOok0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784599986; c=relaxed/simple;
	bh=Ks4hlPwjiSSqgNz3Ei+KPrG/m6doz7SbHxytNQOm61g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pKQYge6t94EF0tqgYFSwGn1w6OIt+tiwUr51dLagtb4LErDLUnHL3gHNYko+zC8pCo6snB4FTCFIoK8fonIjoXabfhtKaNJPm4VaIAcMjzq/13qcemBMM2RXY5VG24OTy0CLNGd7F8C+iFcQ6TmDsFEZD8v4G0SEO/3tzCRtW/U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hZLPxgzY; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hZLPxgzY"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c167aa9500dso783080866b.3
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 19:13:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784599983; cv=none;
        d=google.com; s=arc-20260327;
        b=EOsXcnYPfftdLMH0b2BiqmUnVBx3FNIaz9RZSbN9tDMA59C5zznprcu8pHmqGji3DD
         Ri6y5T/AjEnMoZI7OFHzOzGJxl1T3ObrKsfUfaokYDISsIXfsCP+L2fPIyHABR/HCFNM
         d/0c51ASp0UIBQLXohsi7Kk7tUbYyBbGFChVjNoC101G6oDEDLUF7jNl7KG4IyY9mkw/
         FNb2mWhr9tawSX8U1AoxxXAlpFaddqOB4cH9Bzu6qrmhyZXuMoO54k7vEyfckjt/CSZ1
         oBFzedfWtDRKZToNBc4rVMXAmH3lqQh9dcIYBW/HBCxqQICjEx/ZM8Q3ycKtXMRk/l3p
         jKPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Kod/uxXV0+IwWSdU1EXXNkwfBulsiSvEkeGxFmls+yM=;
        fh=bJq2wFhKd/pqjKie4KLosBe525TcSrhRKlb3e/HSi7k=;
        b=o3SO6gk4QNF5bcmgNghZZj0Tf1QXekUwsvHEErLN72Lg/W2b03bP7y71LuFdq37fDc
         OSgkATpOfUgyk36fofsblxNR5yJij3C8GAOvOhbZYq8QBcLd4qWu2N70mJIvXG2JNwnh
         guHLmr1xvnoDozSKUFfKItRDjxribAUFPsK7QXI3ucQBGQW2sdroZ3WlwbvUM1nZb419
         gPKtMI9Efa+4dK2rAZUA6gaP/aoVpKnjK7Lp2dnkllBYos9BGBF2ipLb4Vb4TkEOIIhY
         lhxeevxN8jIxke4RqNeZsLg4HqMEKsqVRhl2URoLa4Y4FKrKQ804o1NAEeSJCE1XObhU
         astw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784599983; x=1785204783; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kod/uxXV0+IwWSdU1EXXNkwfBulsiSvEkeGxFmls+yM=;
        b=hZLPxgzYAY10fGqW7FAPnvqZTmPAZjzeZoiDPT5m8bIvk3AsHKGZarLV4vz5RrNWs5
         zoIj+uHLuf25n69oZ8YLcfIIxmrL1Dr38yzy8dgPE/b8RtfC18PWfLL72tcJphOA+lSP
         Uu4ULlWicgxAeVMzAQ/NlEfQKVkvhWrB+lQgdtGt60y43fKliA12IQyht/O6UsGIFJrJ
         lCM+T6GCsRWy6NIGDRyIClyUSsZ1HFOR99oLNoGxhEilX1CZDdHnWflv5Qwb1omykbc9
         1PAUMPJ6NLKgRScMvAiByJ7pWco94gLs+4nZ/ZXMFi/3fIgB9jGvW4zz0uhMbyjxw1HJ
         tOng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784599983; x=1785204783;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Kod/uxXV0+IwWSdU1EXXNkwfBulsiSvEkeGxFmls+yM=;
        b=KxPbiHSGEcIWX01X17l3EjaOtXY2AFEzqDR+wkQ88AsZzBRDXHVj+cwHWpEW37dGrf
         znoczIfWGLi2fZIKxn5wJeTA+bK5uSTnwR1Gk++KTnWtmogOWDC4Pe1f9JfXl3fndauA
         E9NT/fHQMeZ/nzGfH0bezBkBGiXhCuVI4N/fx/YRSj/HDwV/eBIxnKSt5nCaCs/tD65p
         D2G8kyBjk5/ezofeo1SrXnZby5bSizaCFQBS7z/4Dt+GnKiKuu4M5j/9YbynXV8ZmzCI
         CZAIYkQRrFLTYErInZlgpBIco9birsU0hf+fFTKwGIx67iewSb1iBJzu5iFO46b29/Ip
         Azkg==
X-Forwarded-Encrypted: i=1; AHgh+RrO637uoEPWZSOVSGF7AwISXLsBEQBiTW/Ocl0lAoznvnqf7UNR/HSSyY5P5HD/OS+p+YioThfBQoDO@vger.kernel.org
X-Gm-Message-State: AOJu0YyIREweqaEB9f3pvrMbRiliDBDoOIomGtxpogP4sqRDIjKwK6Ad
	CeofNnpKgU9G3VIDoMzoEzfOcA0kEAbVOEwPRtOo1mo4L43BbMg7/VRXYsdk41Fey9t/WXKlhoa
	UCADuLK+KaoJfUdqF7n/Caw0PBMuxQlw=
X-Gm-Gg: AfdE7cmD9eGPllUhexCvLxl9IKRLDIKU7LacW0/34M4CH1+Y5fEj6oZoDEVNn35iEzw
	4S230jCwJ+R8oYP2PzEjL4Jrdm6rqtsf/44B3PHyg663X0k+IBOFLXV0ZfXZfNBtYHkRg5TioIT
	sv+7n/B2BkFk6b2Qf2JxU0VnCKyF1vQ+rF1WcpHw4MKT5Jxz3c7qDaHRbGZ+sVrG2oiXCkpAEl2
	OM2vBpGL6bnXWoakUuCKE7dUk2Ynd9gk+UPo6CtBpC41tE991mKYSwW/qaU52Ritei/GUcRGj6l
	e+Hp+dLCugBdH9Ysnvo=
X-Received: by 2002:a17:906:9f84:b0:c15:ee0d:9a32 with SMTP id
 a640c23a62f3a-c16b46c2d56mr670202466b.21.1784599982941; Mon, 20 Jul 2026
 19:13:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260717-adt7470_thermalzone-v2-0-a55147958fad@gmail.com>
 <20260717-adt7470_thermalzone-v2-1-a55147958fad@gmail.com>
 <20260720-placid-fanatic-shrimp-d2bcd2@quoll> <a8fba49c-bb72-4b3b-b598-4972304e0b4c@roeck-us.net>
In-Reply-To: <a8fba49c-bb72-4b3b-b598-4972304e0b4c@roeck-us.net>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Mon, 20 Jul 2026 23:12:49 -0300
X-Gm-Features: AUfX_myLShn4fOD2j01TxsjJLkkvEv0DLVF494Hq8Z0mAimraTmy0Vm02ScO--c
Message-ID: <CAJq09z6qQnKXgBnQKCey4u47hsJTjpYXPDvDZj76sXHZuj2emQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] dt-bindings: hwmon: add binding for adi,adt7470
To: Guenter Roeck <linux@roeck-us.net>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chris Packham <chris.packham@alliedtelesis.co.nz>, 
	Andrew Morton <akpm@linux-foundation.org>, "Darrick J. Wong" <djwong@us.ibm.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>  From the datasheet: "The ADT74701 controller is a multichannel
> temperature sensor and PWM fan controller and fan speed monitor".
>
> It is a fan controller which happens to use pwm signals to control
> fan speeds. It is not a PWM controller, and its pwm outputs are not
> intended to be used for anything but controlling fan speeds.
>
> Technically it is _possible_ to use the pwm outputs to control
> something else. But that does not mean that chip is a pwm controller.
> It is still a fan controller. I don't mind modeling outputs as
> non-fan-control pwm channels if that is what they are used for,
> but that must be clearly distinguished in both the driver code
> and the bindings.

Hi Guenter,

You are absolutely right. The datasheet explicitly defines the ADT7470
as a "PWM fan controller and fan speed monitor," and its internal
features (like tachometer inputs and thermal acoustic enhancement) are
heavily tailored for fan control. I agree that calling it a generic
PWM controller is technically inaccurate. I will revert the change and
describe it as a PWM Fan Controller, provided everyone is on board
with that.

Initially, I modeled the driver purely as a cooling device. However,
following Sashiko-dev's suggestion in a previous review, I converted
it to expose PWM channels so it could be used with the generic pwm-fan
driver (which indeed makes the code cleaner). My primary experience is
with DSA switches, so hwmon is a new area for me.

Whatever you and the DT maintainers agree on, I will gladly adjust for v3.

Best regards,

Luiz
