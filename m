Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BEDE35F193
	for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 09:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781344434; cv=none; b=iCwCJH6mD2Peu1lwXjlWAZ3GzbpnuLxOJF0cVFZHMlep5kH2vCzoPWitlwTYa12v2e39zhAABTrinIWGPhxsVQ91Lhee/ptxtcHzrdLMDxyNZ3Xu1gXy3L5dKQxYf2YWS9cnBUFt9jqgSXQS5HWO+ATXqAesqM6kh8dKTgv4qbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781344434; c=relaxed/simple;
	bh=qqmQu9QhFJihloVV9kpv6ZGS1lV3EON/Kf/ZG2EwbAY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PAmzd7RyadQ/5cIEoPRCg3lLnhNP5k5enfZt5acCpxNnRByVDw/w7upcIhLV72KfJHGYWa9jYlOZiFoYusuoG0syOVtWKQyYKVw7TkblTf3iYi++Dm8MrFPuQewo/GqXSyDTR4JplIvjV3Zi1QkmzXFUFAHWF4nSHxDf4/jQVkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IE7wsLLK; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IE7wsLLK"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490aebf33e9so7972835e9.3
        for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 02:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781344431; x=1781949231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fkuHdTMnoVgs/0eBa7wSJv5oJQ1ELoL7/5JUPgvuaJA=;
        b=IE7wsLLKvI5taKf2UOC8wk4A1Z9+tkF8HfdZQ0W39gXrF5+CnFcIzUtvrvYKZ55f0A
         BXimRYqg9Wsnb/bJnMYMYyfiWBUyWWDj/cfmczcg/yyyAj6mcYJzrtumXVbs1Tqfj3l7
         mjKFJtDnXn9ncH1hbkTNg6OiZ5eZFOrcDlwQ42nTYDVnTup5TxEiDhqge3NY1qFole1T
         9cJXtXwC5/to5XjI4JmkBrPCGb+v3PImsidRJEPEwkF+N9nE9KB0XkYihXR82PzUbaYc
         ojH68u895x56iR8DXBk5X0F2n+vqtGhdZQCoVPqX/REzgFCCKF8ON5mZw2q8ztvfQK6+
         aasw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781344431; x=1781949231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fkuHdTMnoVgs/0eBa7wSJv5oJQ1ELoL7/5JUPgvuaJA=;
        b=k5HxDTMow8lDcDv9QuquY4xUTVDGvVaJrrEGgTDOlXjaZuJjVEjDTgvKxaieE47/Wr
         kquBwe3rDhZCtj0IgealxTXM/3KYtvHsPPsToHZQ1F15TX4qOkf3lhg0kVWCeU0OoyeE
         eFKlS316p3NNaLGekbWsg7o8sQeTDbnj2bs4Wsom6j7lIQE1ZJiEM7UJq+RNQGaVsRqF
         kftxW+jGF+pZz9ffqNluOfQtD3GVm2Tb8Re2KnOf0cqep3vxlY+TGBatLoBQ/L1naqAK
         Yz7BY0QWI498mgWuuQ+nVoFywW/V3R9EGgYGjbxCjejzhNEAJjGzJswVbF2a9mzJJqp6
         Syzw==
X-Forwarded-Encrypted: i=1; AFNElJ+VmPYAGZM8y3tedKh5uME9IaTx5MQ82HBgsYfLL4ZybaRWmDGV0T3d+aNJJfvCemTycQhuR2VOyqul@vger.kernel.org
X-Gm-Message-State: AOJu0YyTX7IK/J9B8gf9H2YBvlCdQGljrpIXl343qkAQmQdXu4baK7hx
	mP3t285aObtVn3gVT4q/xT3w1FgHIUJMm7wUbms6yf51v9yNiICRuwoR3smRuzUUUWY=
X-Gm-Gg: Acq92OEk3oepQZX6rW0c86Qm5uV6V25KWkLDuGNMnb4ckxpqrcM1rUmCGr3o/+TklwG
	2uk01YVppRxD5i6nLJikU+KXv2eiO8XHHNypxhZdRs2P6AJXsxcYZqSq8/x/ZH6JcIkcLPfVo7o
	C2HhM4XsipeA4Pw3w6xp5PkB7yEbAK0nhW5W7vdFMsU14z6+QzanHmlT9zt4INV7s0D8J7MF0+q
	KI5DvkNbwfLf3gV+1kH5czESiR2geM0OPC28YF0YJNaA0XMV3mqJ7B7YPTGhzG224kEJzooLYLc
	TMBQH0zynsDCe+g2uMr64tcMQc2Pke7SsqYo6yvQP7j5yjVzFEApH9TNbByDkplfTsEy7HNwXl3
	N2cwWRcshCOwz1aar0ZAWWy/Fs7OoMi1LiHxk0K2gT3HQL8R7+BkDKD7KPoafodUVuYTmuo8FYC
	P3fnALqeiVRcfBe6hk6Mjh
X-Received: by 2002:a05:600c:e556:20b0:490:bde3:d112 with SMTP id 5b1f17b1804b1-490ec5088b6mr57347065e9.30.1781344430713;
        Sat, 13 Jun 2026 02:53:50 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a54:e741::1003])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49220304180sm61050235e9.4.2026.06.13.02.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 02:53:50 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: conor@kernel.org
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	jerrysteve1101@gmail.com,
	krzk+dt@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org
Subject: Re: [PATCH v2 8/9] dt-bindings: input: microchip,cap11xx: Add CAP1114 support
Date: Sat, 13 Jun 2026 17:53:43 +0800
Message-ID: <20260613095343.6489-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260612-plethora-debatable-d00cb679277b@spud>
References: <20260612-plethora-debatable-d00cb679277b@spud>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> On Fri, Jun 12, 2026 at 03:22:14PM +0800, Jun Yan wrote:
> > CAP1114 is a 14-channel capacitive touch sensor with 11 LED outputs
> > and hardware reset support.
> >=20
> > Add the compatible string for CAP1114, add its datasheet URL,
> > update the maximum of LED channel reg, and add constraint for
> > linux,keycodes.
> >=20
> > Previously, the LED reg property had a default maximum of 7 for CAP1188.
> > With the addition of CAP1114, the default maximum is now 11.
> > An if-then constraint is added to limit the LED count for CAP1188.
> >=20
> > Update description for microchip,input-threshold: CAP1114 only provides
> > eight threshold entries, which does not match its total channel count.
> >=20
> > CAP1114 does not support microchip,signal-guard and
> > microchip,calib-sensitivity.
> >=20
> > Add CAP1114 to the unsupported enum list.
> >=20
> > Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
> > ---
> >  .../bindings/input/microchip,cap11xx.yaml     | 32 ++++++++++++++++++-
> >  1 file changed, 31 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/input/microchip,cap11xx.ya=
> ml b/Documentation/devicetree/bindings/input/microchip,cap11xx.yaml
> > index 778ec6d659a8..0e9a1a8a3f3e 100644
> > --- a/Documentation/devicetree/bindings/input/microchip,cap11xx.yaml
> > +++ b/Documentation/devicetree/bindings/input/microchip,cap11xx.yaml
> > @@ -12,6 +12,7 @@ description: |
> > =20
> >    For more product information please see the links below:
> >      CAP1106: https://ww1.microchip.com/downloads/en/DeviceDoc/00001624B.=
> pdf
> > +    CAP1114: https://ww1.microchip.com/downloads/en/DeviceDoc/00002444A.=
> pdf
> >      CAP1126: https://ww1.microchip.com/downloads/en/DeviceDoc/00001623B.=
> pdf
> >      CAP1188: https://ww1.microchip.com/downloads/en/DeviceDoc/00001620C.=
> pdf
> >      CAP1203: https://ww1.microchip.com/downloads/en/DeviceDoc/00001572B.=
> pdf
> > @@ -26,6 +27,7 @@ properties:
> >    compatible:
> >      enum:
> >        - microchip,cap1106
> > +      - microchip,cap1114
> >        - microchip,cap1126
> >        - microchip,cap1188
> >        - microchip,cap1203
> > @@ -122,6 +124,8 @@ properties:
> >        is required for a touch to be registered, making the touch sensor =
> less
> >        sensitive.
> >        The number of entries must correspond to the number of channels.
> > +      CAP1114 is an exception where channels 8~14 reuse the eighth entry=
> 's
> > +      threshold, so counts differ.
> > =20
> >    microchip,calib-sensitivity:
> >      $ref: /schemas/types.yaml#/definitions/uint32-array
> > @@ -149,7 +153,7 @@ patternProperties:
> >        reg:
> >          description: LED channel number
> >          minimum: 0
> > -        maximum: 7
> > +        maximum: 10
> > =20
> >        label: true
> > =20
> > @@ -178,6 +182,18 @@ allOf:
> >        properties:
> >          reset-gpios: false
> > =20
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - microchip,cap1114
> > +    then:
> > +      properties:
> > +        linux,keycodes:
> > +          minItems: 14
> > +          maxItems: 14
> 
> Sashiko complaint here is valid.
> You need to increase the outer constraint to max 14, and only set the
> min here.
> Then you need to add an else that sets maxitems to 8.

Thanks for the review. I'll fix this in v3.

> pw-bot: changes-requested
> 
> Cheers,
> Conor.
