Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193A345FFA1
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 11:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787139790; cv=pass; b=LSYJRqomjyUrPa6WayuBwe4MUx2o5C9x0328D4a3xJxbwm5oBYi1keURw0rtbzaRo3m0Icd62/nD7LRnql5ceWg8pZfF0PA01iHlb/Chisnu9gfue6Wqc6zxI6Xnml8Cn52xGHZOd9cLDYmANPt9CxOWgNmhlqJ70kAWPGssJn4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787139790; c=relaxed/simple;
	bh=08kL7JbQEa8fJNQW+ej623AwIur83mUMehYAetGta8A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aqhL5cjTyHjy0A7KdZIXenc0lXmFiP/wf/EtDVS9DRzvr8yZEwtBpJ4WzgysrtXDuGDzHubFo2Qi82dOQKX7Qy2U7Sfjue8cySV6NNxFRWV9SW5OSLiXnEKg9xGqNyHE+cB5L9PklJ55rB4HKhGMPgksFd1RrPTc7VOs06R40nY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kB1u61St; arc=pass smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kB1u61St"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3a181e96cbeso8475781fa.1
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 04:43:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787139785; cv=none;
        d=google.com; s=arc-20260327;
        b=ARGVwNqfLOOsZVh3Nl6j5RVFJgp61KcaTaTm4QSGs7AbfPt+hSifAQi83Qi6z7yQoT
         P0aQm/WVLlkqfC3aZx3X0dgZylcirs0/sHO2A2FCD76mJW57RqSD6FfSYbJBXfqgJlWX
         OWsFNQydcOWcKlObeAS7huyw9Fe68IhOu4krjzV1dGsU//4o/rmlUk1+ut1LpWkWWHNm
         XdRTPDyDIeeZezk2vz2ONRvkRuh3y49vdFJ2IOsGjd8xkpNczQnAJxnXgU/J02B/ecwG
         9JY5hiL+44maqNP8hR6K/+xf2AvuGhKT98130VmXyhOVFJNoHa1pbwddWWI21Lgn7MDQ
         k6/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rruUpDInQvQQuqMyUIBpR8nVOpeVCVZSdKEK5ZtInD4=;
        fh=aO6jXoyzHSj9M5VJFZpqiACufVi6SO+adkJSOwNrZk4=;
        b=qcbaeQ0V5gtVfNTHuIG9JXFpIM16FOdfvELCunKLxBYCwXt/mRY3NIa9Pi/xczwJup
         IvFnaVk6F4sMTpQfWwQ20XF4/bbHFTtpBExJZSCuc6OwBGTiAxgqDgCVr8cPjVhPW9pV
         usTop5EXIcB7P36Ck+zGShTsmbmhlEEQGDbyQvcLNTT8q7k62Xkb6PTaqitiL89KOrW2
         Xqsva37pxnkq6xe+aXnkWYQM3tjQaGFwowyjkXtO4eh17/wEHDMYou0z+y2p6+qY7Xtc
         vD7jlQjB1GA1fFAWtVN35FXDN+DkLsh3z8criyCb6eI69NmNb1Js1+t88Do12fMNMZRf
         Ul9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787139785; x=1787744585; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rruUpDInQvQQuqMyUIBpR8nVOpeVCVZSdKEK5ZtInD4=;
        b=kB1u61StMBPj4ZUwlTwHo+rDCRoAE5H5sTiEx11AuTUvin8iPliLRtBKxaC05+2QNC
         8UCoND2pA8Rs7/VjUmE+YAy4z3Oi0aG/5+k04EQ6DnLfCcCRXfidCVAjYP8KeBUvWKNr
         dwiTBGKay8aNf/Vx9ewIF3VmaBVFTUvNsmyNI/liOafSUBX3lYUv6FJ63UtIUxmU0yaI
         wMCB8dzreVt/D1PCrSLbKFDhB2Tz8h5jQkvO/xIAnI8A88l2mkPtcZQ5fypWyZ7qpsAY
         6D8+0wrUe83CmR/almLB207xYt1t4X4dyEWNyuEJBYpWo+QhAfYKOakQM7qajdrRaADn
         Lehw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787139785; x=1787744585;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rruUpDInQvQQuqMyUIBpR8nVOpeVCVZSdKEK5ZtInD4=;
        b=WeEfGrKkGspSTZuCvAgHZx4Z4dejnig6jeajkalDtgrAH36vy40koKFoJmWGY0iLGz
         iXDC7KlI6+JcGbggDbm3PxQ5xD1eneWexY5y0b1QoCS++r0Y0lHUOGXCdxtlhHHL6c0c
         SyrwiKFpf0cvNCwu7+HG5ARh5M+aV8yonAY0NLDjgAdOkSzjtzX8x+J/RsyrZJ4N1L6E
         rJ9b8eeUIIDB3mroVnEM3KVNlQpETZaeYmMAy0KyG740xERCJ/fnXPWeHAWjTUUhy6qj
         w7grQo+TaXSoQkSYff/8KP8Y8rBBafO3CVnsflHEqoQwKfTYTmNSSgzImkwhoa94X08Q
         i2Mg==
X-Forwarded-Encrypted: i=1; AHgh+RqYJmtxBXPxpJg03ZU/XatIfaOLGqAMB48KqpDkmkenOVo+HwVF3GJRUoDJPfFINm7yL9Ksby0HXdyw@vger.kernel.org
X-Gm-Message-State: AOJu0YxTjGclj58AHUx7xXdmcnOuK2Q9a6fbUhIbzZ0voWLhvgxcSAXZ
	R8M/kQdiPKkjE9jRhOeK9tG7wkFEhNw0grwo4Bg7Cz2BDcS+IefYnd2IZRx17MNHM8c4ygb+lV9
	cxGEb1nADRa8g5LWnd37tmODf6UbWMDI=
X-Gm-Gg: AR+sD10EEoL0CFhp7ChR6luDlrOpOzIK0+Kizg+hTPwQTO7NDp1FaZ5OM0S+fhlTR/y
	TkeQBJkEPLjdJ/yCjw9Fm+wXRgQIXoHWAbhOEZg3WIJhHfK4vKfSqOF5gFHTUtxo1dBa7L3C/Kq
	Nb/f+sg4GgKNOgFEyYP6gutVLDg0Sqrz72JYtAdTt0KiqoBCzQvVS1Y1SwQVieZmbLrp/iaUNtc
	UY7O66tgY3IPz6k0TaUzc4jKJMzRrKiYjEi9QBMXEJGJATrPK3q2IdpAuh/XO1JkiWXTPWx+3yZ
	d5+6Zd3LhBwZSg9MYrEXiq5f6Ck3x6pVJrmZT0UpfZGu/pQpFbNopToxPb5vvpCyYqPlvmj60hy
	bfukHQpwMdx6CVByy+x1zlN2vlw==
X-Received: by 2002:a2e:bea5:0:b0:3a1:85a0:c5c1 with SMTP id
 38308e7fff4ca-3a1899c16f4mr8655901fa.11.1787139784486; Wed, 19 Aug 2026
 04:43:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CADOrJmbTyrGGkq+9OJDXCgTa2HvNo8BWxoE6yjafcrOq7WNamw@mail.gmail.com>
 <20260817215428.84740-1-gvalkov@gmail.com> <20260819-generous-nickel-dalmatian-b6bb08@quoll>
In-Reply-To: <20260819-generous-nickel-dalmatian-b6bb08@quoll>
From: George Valkov <gvalkov@gmail.com>
Date: Wed, 19 Aug 2026 14:42:52 +0300
X-Gm-Features: AcwNN1X_uzL9E44yhbWS_M41oClBHdMfV11eL6pc59WJx0lXGGLZ-ZZh_4cYzLM
Message-ID: <CADOrJmYfBe3ADun_kFjFSH6YOSTX7Vu3UsFsL57yuRdaQ=eJCA@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: net: wireless: add flag marvell,ignore-regulatory-hint
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: briannorris@chromium.org, johannes@sipsolutions.net, andrew@lunn.ch, 
	krzk+dt@kernel.org, francesco@dolcini.it, johannes.berg@intel.com, 
	kees@kernel.org, miriam.rachel.korenblit@intel.com, wenst@chromium.org, 
	rafael.beims@toradex.com, avraham.stern@intel.com, error27@gmail.com, 
	s.kerkmann@pengutronix.de, gregory.clement@bootlin.com, 
	sebastian.hesselbarth@gmail.com, robh@kernel.org, conor+dt@kernel.org, 
	Frank.Li@nxp.com, chunfan.chen@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 19 Aug 2026 at 12:42, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Tue, Aug 18, 2026 at 12:54:26AM +0300, Georgi Valkov wrote:
> >
> > diff --git a/Documentation/devicetree/bindings/net/wireless/marvell,sd8=
787.yaml b/Documentation/devicetree/bindings/net/wireless/marvell,sd8787.ya=
ml
> > index 930b700b73d0..5f235cb9f3e5 100644
> > --- a/Documentation/devicetree/bindings/net/wireless/marvell,sd8787.yam=
l
> > +++ b/Documentation/devicetree/bindings/net/wireless/marvell,sd8787.yam=
l
> > @@ -59,6 +59,12 @@ properties:
> >      description: Calibration data for sub-band 3 in the 5GHz band.
> >      maxItems: 502
> >
> > +  marvell,ignore-regulatory-hint:
> > +    $ref: /schemas/types.yaml#/definitions/flag
> > +    description:
> > +      Ignore an incorrect regulatory hint from ROM,
> > +      so userspace can set the correct regulatory domain.
> > +
>
> Same comments, so you just ignored entire feedback?

Do you mean this feedback? I already replied to it:
> > Anyway, property looks like SW choice. You must describe hardware
> > instead.
>
> I am sorry, I do not understand what you want me to do?
> Can you please send a diff or a clear description suitable for people
> who have way less experience than you?


> Again: you need to describe the hardware, in commit msg, in property
> name and in description. You cannot tell SW what to do, that's not the
> purpose of bindings.

I still don't understand what I should do?
Can you please show me an example of the changes you want?
Else I'm likely to make a wrong guess and implement it. That obviously
won't help.

The commit message already describes the issue with WRT3200ACM and WRT32x.

About the description, do you want me to do something like this?
    description:
      Ignore an incorrect regulatory hint from ROM,
      so userspace can set the correct regulatory domain.
+    WRT3200ACM and WRT32x are known to need this.

About the property name or flag, do you want me to add a separate flag
for each affected hardware device?
- wrt3200acm,ignore-regulatory-hint
- wrt3200x,ignore-regulatory-hint
- the list may grow if someone decides to add other devices
- and the driver will need to support all of them
- that doesn't make sense, because it isn't scalable

> How did you fix the threading problem I mentioned in v3?

How can I fix a threading problem?
I don't really know what the correct thing to do is, once I forgot to add
a version tag in v4. So I just added v5 in my next submission.
I'm new to sending mails using git. So far I've learned that I can do this:
git send-email --thread --in-reply-to=3D<Message-ID> =E2=80=A6
and I use the last Message-ID.

Krzysztof,
I am thankful when I receive criticism from you or anyone else, because
this helps improve my PR and it helps me learn. A clear communication
along with examples and links to documentation can make this process
easier and more productive. Thank you!

Georgi Valkov
