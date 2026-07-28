Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B664012D1F1
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 03:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785208923; cv=pass; b=kgZ2LNPWL/q/xBpERzD00UA826ij8S4EvIADFe4f1r/wHxJHCxXegEoA+V0eFTShaK27m+ieImy4J4da+fPTnMbU0d5rh2Smg1DEfXZzNQLgbcWDZjHwmwIe/6JWyx+4VoTFLnoZGLREx+cIThYBtEZKREo8W4arEcBXV2q3VFE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785208923; c=relaxed/simple;
	bh=Ik8XWNx14HMmHxgerEJvinOrG7Nu0p+W7KV/S0G2+X8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E3cUnJHhsS3N51RKeDoKxPisiC9d26Zj10K+pXc8ZHTFZR5yFF2Y6zI+mKE+fWSokEQ+6N+QS+ptIZZiyBxdY6VRokxhafDYoEJf7tDFH30vrhZvo9itppfYuEzdUlozO0y5aYYVQiuhbMTq66IwG6DAFIv/w3QhuSDIgXESRqc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bPVDr+97; arc=pass smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bPVDr+97"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-45691990234so2176792fac.3
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 20:22:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785208920; cv=none;
        d=google.com; s=arc-20260327;
        b=YlM+EJPqAXW+PUh9zzgf7PEJsvGGYOSRG8+6UrDdtRZeqkcz144VJu8flbmWXMdChi
         WFFDwRkw3NykZYT986vgI/0LvrfcfAZpHMx1bSTTYyJ+fNNxdg9MsQhXlo5xygjiq9Vv
         FxGD+nezjfTxD9pb1G4SFh6583Xjwzlcmxed8hCePN92pQmIavFslrEIjwCTJYFPwALZ
         ZxKDVAKDHN9n4XHggg6slMOPEfYYhQFYuGVmmaFZLFoXJQ1bBEdRBXl08nJwWR0mXRrW
         1VdnGFcMJYbaSimzbrpfQyGdkoGCTCM7nrXnDXGiTiZkeoGEcakNsk6q1wcJwxoCEz/f
         1Xuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Ik8XWNx14HMmHxgerEJvinOrG7Nu0p+W7KV/S0G2+X8=;
        fh=vxKMu2n3oH0I3Xm1Pr0mxpTwAD9E7kPE+O4lpGz6d3Q=;
        b=X3BlJjynChfK4mY31dRGA8+Z1feiXQVk35Ax9xnvPVmZtnhJMSpgTIsbr/icnqOsVP
         Y9ASS6yPpI4fLT7dO0yr/ai3FywcSBYxg1dvrDl4EOLHN5/0Ia01Gq1EyaAOz0OioHqv
         UCGsSsBy1JJoLLIRrOFlCqoDntV9f+Sq3wwfrBWm1ARO0mHDg0hg96nK6PoVFESnO7gB
         fF6PpPvqABkEi/G9Q+qTEMTURL52aPgnSMd7UrMYHD07AZGt3JP8T7/RXYYBZAzk1alX
         qdVovV0FLqz9P+5P8l800Gb0X4EiQyRNz0XTy/snuJEAVrGVaD/jWd9+TSl0PSTg4NBt
         Szww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785208920; x=1785813720; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ik8XWNx14HMmHxgerEJvinOrG7Nu0p+W7KV/S0G2+X8=;
        b=bPVDr+97Xt8w9k/bvOcIP4tno+Od0GqO0ILA0kXCxoQ7C0jctz+SFoHu3lndpTYTLc
         Nbkbp+VmYo0THdV8evH3AcyI2r3riOKyzD7O0vqpPKYIydkzdTGxrLi2LLtJaT6QRJUI
         pepT4Tt6lBMezscd7UQQPgKgazw/47i0M9CWYOL5h39QEoeap42ksmgHS+kcB4uxXJvS
         iV0O03Qv8vJy+RbV+8y6esRR0YDBDoqgjRCx/kEkQzBTtHlPPZ3cdlr8MTDw46phNvVU
         SfSej8NfrpmXT3lGhsnfA4v1MQ+Rrcr0jUzwLwcVUBQPFx8z0+MVbXETU2Z2F+YD5LHV
         PQjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785208920; x=1785813720;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ik8XWNx14HMmHxgerEJvinOrG7Nu0p+W7KV/S0G2+X8=;
        b=SmQJiCW80BjWCizeM45R93CXk4nWWzOmw520YEadzq5X9z1V+v67AKfKxMM01Fy50p
         01C38UTjWXtIgezelLuGzD4eZCnrVh0GY45fUBOR/PofnPZugGG5dOHSTK13Xa9+jocB
         yXloe5bFRSd3r33wtbVrwWZOrvLrshFWxk5WFIeJ87LwqTG7Ky0gtkZ4BxgbzAXrubiW
         09RZubfOlqicX+ltBTlaqZiGHxts3KZxLwUy3p3M4cHXuj0o+je6zD0BaKG8s9h6bVSd
         ADaMVC/Qmg8Feti3xxBGmriDkNarQGxP32sNQEoR6CiCwfKUKD8jzWjq9B1EkbRSNlwV
         mXdA==
X-Forwarded-Encrypted: i=1; AHgh+Rrc9LTp0jc4/pOyAAIsfsW7QBYurx3IJg7QwggmMlAqA3nX/hiOwrW7evAdnhNjQs5LqvY08vLJBo6+@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4hHYn2qiOSB/npLpla7ZsgR4H6UvDjqTgS2UBI88vw5Y0kyPi
	mv6O88djMNNZjYCrZTH5fwR+Wo1j6cDM7HIhGTAgMZv8Zu7we/F/S9lS5vTV7nUlFnqZN5XO+Bw
	qo+B3RCaSUsQNp+aRgvu4WXnWzYDFIWI=
X-Gm-Gg: AR+sD12DDj8KhW/7cbk4ve7UJI/1ja/zkVs9V00bZk2msRrL6jZ3HaXFSPUxh3Z5CQ5
	OqnN6lDVg+9uqChedbIKSRxnPHAUpUGWSFwZuTANP39IH2Nf2i/+gWb7N/tc3x6OjwwdACZQazD
	f7bCZAsvhsLkSmjn4BcbapDO5r8nIulJat2TDFIsmyjki5szK8CyowH291UdKAtGGRQDS/2JLq5
	6E5eaqShiiDuSRAY+I2mRBIDIpJUaolaCm+BAYDbxaDZCRKaqkzcPOJXDQrQHHKr7cPXccDTNYL
	IP9e1UXkyjtkucu/FG4=
X-Received: by 2002:a05:6871:2316:b0:448:558c:d837 with SMTP id
 586e51a60fabf-4586cbb8717mr479845fac.38.1785208920617; Mon, 27 Jul 2026
 20:22:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260728-adt7470_thermalzone-v3-0-d4586478cdba@gmail.com>
In-Reply-To: <20260728-adt7470_thermalzone-v3-0-d4586478cdba@gmail.com>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Tue, 28 Jul 2026 00:21:38 -0300
X-Gm-Features: AUfX_mzWrjQTB8lo_f1yOAHZ-Zd-6CRFAeENsJ4M1pAoIOVy5YxIU51oRTujI7U
Message-ID: <CAJq09z7QtzTxucEvcKa6zXjhGyuqDjpLHiD8A=EJXshpoV_vvA@mail.gmail.com>
Subject: Re: [hwmon-next PATCH v3 0/4] hwmon: (adt7470) Add PWM provider and
 thermal sensor support
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chris Packham <chris.packham@alliedtelesis.co.nz>, 
	Andrew Morton <akpm@linux-foundation.org>, "Darrick J. Wong" <djwong@us.ibm.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

It looks like Sashiko had trouble applying the patchset on top of
hwmon-next. I likely should have used a base commit that's available
across other trees, such as linux-next. I'll double-check whether I
misconfigured the prerequisites (it was my first time using them),
though b4 validated everything fine locally.

In any case, I can resend the series without prerequisites once the
necessary hwmon patches sync to hwmon-next.

Regards,

Luiz
