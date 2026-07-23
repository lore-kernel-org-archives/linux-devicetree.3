Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511AB1A0BF3
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 02:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784774914; cv=pass; b=GDXZj+7z7YSzgO0O56rlyj9DDby/BRwdgqzOO4SG29fWcG+T9aIeUMlvtvjs0poub5AYuJHGAgAvx1JMgE6SkAo4e7nPV2X/++jUAk8EvphLeotmEOdUW5AAYKWhgsykC6iEgiaST8mU6qLRXOVF1+1r9fA0t6YhUQvxT0WBm5M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784774914; c=relaxed/simple;
	bh=ke7GuAFVu437cGSyxYRHXKBdtjCTY1U8R29Cxj1Ke88=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CgG6Kff48QO2m1yId3ZuHNRTKbhuIHhSJXvExicet9oLgVPSDxr5xwWtFrHlMpxxSOUUFox+R77baZfuJ09AHXENiF3X6ljXKbCtT7UmdAEJNfSezh1HrFgiIbNPkC5qZtgx74gZ1FUEAeC9i65/2bIEXDUUWwR9Of+SwhqdYWI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g/naGK3a; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g/naGK3a"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c197eaaab00so32730366b.0
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 19:48:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784774911; cv=none;
        d=google.com; s=arc-20260327;
        b=QQrPkGPsbt7jxLfL1PiFMzOcFSPfiHNkXz+/Jgz4OjxDs0dQAlFbKsBHArcwDcK4ju
         yaCKsaD1dl2WCeGKFVY2Az3JiuN/NG4GcnhwFCEvrMLKKHdydf6ZQaAmIadvmnzcAn3j
         54pwN/WJAJgyrpHaT14hzP93nTlP8XwX/4UrTc75E+o6VOHP7dzbwL/iF1QGTkCdZ58T
         PezBt9/TyKRmy0E+Huq4q5jKSHm6pXZtIJiIHyZ+9wk0CktmMa6bMvJZYZYwXQzA8CfA
         32j8YGNebZbg1NHiyFHhu8N+TvpqpQjFRypLO9617aMz5EKRc5YgmhBIKIAayQ/vmIND
         DCYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YXTUY4hlZVOZQ6Ng/x5Zh4USeJPKiqRMjOwBWZGBJKI=;
        fh=u6EXtIfwsPJBrFgynAv5oBqRaLYyXVI+wjlHHJbarTs=;
        b=nn2pCN76WbjqcMjBBztP2I1c5klY5iCEO2Rk9aVKhkHcuHD1inL4PXsWz0d8km+oPy
         lqf/UBXS1S7LDxw+v0bBWXoD/cFcemtHHPVn/8bBSqjdX++UO5TbrcD2hmzW2qU0KSFo
         mNPbWEsgftKpLMcjvxdpzx1iAabucAB9mHg5+6nztj/5aWi5WYjHXFXx/IkoZP9PmH6c
         2VhAH6rKj9V54twdvjLcVLYSNcAec9ulGd8GYEopmq/6/ndKekKPouoYG4IcJMf2SVfw
         R3T3Oz9duEWrOh7nwD0h3/RLrZjRC1QRUfRAhPtiB9Z2IUyxYP7gHyNgfazEl6Mx0GEw
         Gp3Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784774911; x=1785379711; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YXTUY4hlZVOZQ6Ng/x5Zh4USeJPKiqRMjOwBWZGBJKI=;
        b=g/naGK3avTabE5114tTgCShzUmBWRcbzEf+vhG+zFbs3JPuqAPtNOvwKI60HCMrU0O
         vNjPm7lomimMBIFMTWQV3VxKgJDGOQBOu4Q+IIANY7VlQ5LTyDdl6uk9qW0vRVGnsIVb
         bQM7vZVKfcvmatIYoQXBWwl81u77XEMyY0oFnt02WS6r49b8sH77X183w0xiHx17CxBs
         IQZCi6cWSR1GbxTac28wbhvutGyVblXecNe+vaJ4IDizddNdYR8RllEWdJgPamIVk7QY
         EImkhuA/5rVbHoXpNtOCXXJXb21kCuTCh9UKH5JrS+ub9GN8ReOl8HjWpRPqkK5Mk09c
         iPXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784774911; x=1785379711;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YXTUY4hlZVOZQ6Ng/x5Zh4USeJPKiqRMjOwBWZGBJKI=;
        b=Y7JBDtAEcwSO+LSu6rj6op0KaOAIt0WDX8Y4tW5+AqoG7Lwo7CNi4agNhZjvjLmmOd
         SkH1k7ruMUN/H+nkkpHJQCvEXOoHWMZIhWkcczHm1E7snag9XCzquMOE/XmkB6nNV+2M
         Rit3X8s05mzxZXahPk8UX2o5Z/VB+t+H1iaHQhDKGDWsnqSOmQoBOM0TOG/IptkS6vDq
         XdPxT0xj4oSt9jQXZtBH5v1JLc0W3hpFSwdPgMyt0NtZzFd3merXF/aJMriiSf5ROPNp
         V0FFaPYyb7p/qzjoE5zgB7B8xJoRY+0KWlOHXg9hQjre8cCvcHWmvBIgOPbrWbk6Xhml
         SFUA==
X-Forwarded-Encrypted: i=1; AHgh+RrWb/OkafWv8J2X1Awkc0bxolz5GD4+y+/sUv747mwCTQZvavv3ayxotz9FU9C3mjzRfUtfkm6+VR+B@vger.kernel.org
X-Gm-Message-State: AOJu0YwXxAW0OdxSvW3D+y0OZX902STmSPdzysQZLMT3gPR8l9Dj6C0A
	RJXUA/Gj92poeNBQNrJuQcpVQ1rfaxEAkCS3/T4dFmX0JxeXuVY8eR2pIITXF1tIrSK6Ek+MmEX
	3ZwpVETnif5r8aor8r1HqvU8pvNLyurIz+3lp
X-Gm-Gg: AR+sD11kYbcyh4PZRB3dn5/Itz1BGR8C7PNihGeOyUAA1q/9PI5CPkwEqpHcjshdDty
	xPTaSsVGhKJ5rTkjvp/sGo11oOMqID92Wg7fdILkNzslocjKypDThVRMz+S2/UGfwBJldsD6vCX
	g0Z9XqmeKjNEyUkdDAuy/G+F3zVo4fnN22/uEYXw1fFiXQ+kVEjrTlasQ3dT5kEdc9X7/+DEPnj
	v2XtggEG7qfE3QO6vAzepnCSQj4eMHpKxJcR/kI1eI1AGL3QqFiv2rcuFbuxzAt0jNZ124ECoK1
	1dSPOSZMjxB11L9jIN68
X-Received: by 2002:a17:907:a4d:b0:c16:2dc0:e1ed with SMTP id
 a640c23a62f3a-c1c5092a1e9mr61858566b.4.1784774911324; Wed, 22 Jul 2026
 19:48:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260717-adt7470_thermalzone-v2-0-a55147958fad@gmail.com>
 <20260717-adt7470_thermalzone-v2-1-a55147958fad@gmail.com> <al3yFHvlzQuIywEj@monoceros>
In-Reply-To: <al3yFHvlzQuIywEj@monoceros>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Wed, 22 Jul 2026 23:48:19 -0300
X-Gm-Features: AUfX_mzkrTPcnkr7ItIXKDS6UZlJkREqRBtsmkpKmefnqjNZVsCZyHSowWgwH7Q
Message-ID: <CAJq09z7z13hO33xpfQNYc=eHec3yN3H2yVy=oqXhuvhRZhvX3g@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] dt-bindings: hwmon: add binding for adi,adt7470
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chris Packham <chris.packham@alliedtelesis.co.nz>, 
	Andrew Morton <akpm@linux-foundation.org>, "Darrick J. Wong" <djwong@us.ibm.com>, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Uwe,

> On Fri, Jul 17, 2026 at 05:59:14PM -0300, Luiz Angelo Daros de Luca wrote:
> > +  "#pwm-cells":
> > +    const: 2
> > +    description: |
> > +      Number of cells in a PWM specifier.
> > +      - The first cell is the PWM channel (0 to 3).
> > +      - The second cell is the PWM period in nanoseconds.
>
> Please use #pwm-cells = <3> and $ref: pwm.yaml#

Thanks for the review. I already switched to #pwm-cells = <3> for
the next version, so that part is settled.

Regarding $ref: /schemas/pwm/pwm.yaml#, it doesn't quite work here.
When I added it and ran
dt_binding_check, it started rejecting the example node:

hwmon@2f (adi,adt7470): $nodename:0: 'hwmon@2f' does not match
'^pwm(@.*|-([0-9]|[1-9][0-9]+))?$'

It turns out pwm.yaml also constrains $nodename as part of the
allOf, so referencing it forces the node name into the pwm@...
pattern. That's not right for this device: the ADT7470 is primarily a
hwmon chip (10 temperature inputs, 4 fan/PWM outputs), and the PWM
channels are just one of the interfaces it exposes, so hwmon@2f is
the correct node name here, not pwm@2f.

So, for the next version, I'm declaring #pwm-cells and
#thermal-sensor-cells directly in the binding instead of pulling in
pwm.yaml via $ref, and pointing to pwm.yaml only in the description
for context:

"#pwm-cells":
const: 3
description:
See Documentation/devicetree/bindings/pwm/pwm.yaml for the
generic PWM binding description.

Let me know if you'd rather see this handled differently (e.g. keeping
the $ref and accepting the pwm@ node name), but I think keeping the
node name aligned with the device's primary function is the more
correct approach.

Regards,

Luiz
