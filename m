Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793650733;
	b=Fw7Og0RQhq6u1l5dMvUe1sac8/sT3oX7Po4vnB2/9S9xlcPiIQHpXGqE+r/zCJv64w5b
	 7VYfxn1N9mJ1Tz54i1xOxbX5emEld0PjXRWN62aY71k5LAvBktrAOjUegRnI+G2VBY9HM
	 FOo/Qs9qFQg1zOl1hMK8yPe2RY1cf3t1sKXnksg57QvtGSwJi0nNMaVK9r2V3jUIf65hG
	 0CAcHiOsDTLKrHr6zk0Ci7IPfnQTEd29WIrXHzMMkkrpcFVWvyPNK6AZChhObcAWN/ZVv
	 YTzzxhV+NlfvsWF7Xndh23qaYFMott5tbGikbq4n1cY3UFcoI4JvSWyfjdC+KqMPCJg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793650733;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=hDWK+Q0RgQULL2IquEpArVAHCBy27pTWj8B5yBS/mvg=;
	b=biy1Y1CIiX0fzkqgTttMZIWqRkKpfnLJb3OK5wFYWJcTefdUKrfGJILjUYsVtumLtgjj
	 tGK2nbF5OdJnqirE2gf6ZJy5c/qT403ergiSTTOYvoCPsx3cX609hW0HPt4J/fH7pMDxN
	 ux7oUltVTiIrP6oQwNTb9PSNa2WGG7vEVoL+uhh4Z1jfxzU4zUGLhHOicxqzUdPEG+FgF
	 M1E6nvtrHzkU6bLexiEN+zuwwIqzNLJegSs9Lhg9dT68RCPxvNrjcRF+CkGOEjHtufOsB
	 ICPyr0wrjPi+ZLhKZruMmmcxqVY51hZzfzbUg6xsrOk/Mdz5fRScyeFgn/KECPU6BUA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qR7u5LvF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B7B606A32C
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 20:18:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76B7B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qR7u5LvF
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-53644b28706so55098521cf.3
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 12:18:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793650731; cv=none;
        d=google.com; s=arc-20260327;
        b=nh4P2Zz/di1WDd/ihfcqwJfHCGOsJxu/Iwg8Q/N47vdCmGPuZLyRyzd+Ms12B00UF+
         BlcMv91iLDAF6NLjaYlh16MmEGl8kms2tLcNn3zJWji2iiAa6AqPHnvZuMudXbJpGpas
         qhtg695In4k7U671AVGBztuKLSMI5d/GJ45rd3INyv0ANKPlS+mwaO1udK4GJT0/7J2M
         XEU9yCtLED/+4s16rMLoSv3mtGQHXky2Fx1ZRyqdC0gCvaZAEkAp0Fiw98i1CGZWuaUE
         O1GnntopxxfcZ5ioEw+aF6tvUIyjHNUiLuW9xeoKD3fkLKqBdWEbhRHWDwcSjz8zKSb2
         Ju8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hDWK+Q0RgQULL2IquEpArVAHCBy27pTWj8B5yBS/mvg=;
        fh=efT+5X2L7ULRxg2GOqri2+Pj+fIp27VMPZnRuxABurc=;
        b=XZYakDJ+fUyH9+YX59zG2crptHlUSW/FN3OqrnYlqJZlT0ChfcBtWeReGsDeEQrFSz
         nHWrnyRc6XMnY5cSef7W6riTbPk7OSyF7XuizHz23vXlnz2VqOJJHyU677a+RLUs99hb
         RWhDVsTQnk7d6tnQACYJW30tAl18780LlDwNgzMIfyt8/3fBw7E3iMA3oTMFdLhjabjZ
         5ZDIZRlZALKH3wLrNCxZdYKLieew8+TwFcRvoh8cUtTGi5DjcqDSsGRZN2OoH/lEAdzs
         9PtOegGgL+3JA7ANZtWMVDZ/eKDQUWRKR6P+uzGSkquqI/jt2lMaFV1ZkL0kUTxNJmN5
         bBBA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793650731; x=1794255531; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hDWK+Q0RgQULL2IquEpArVAHCBy27pTWj8B5yBS/mvg=;
        b=qR7u5LvF+BmZ6p/A2VqUeOsFcv/wzEN9CWzDu5fT/Xg4LUIINw3waXbPipr/mfIF8L
         EzsbmKEy+uqevJtgzcUvbF0FXwRIGJnSIgBY7LJUW60YfDqKw2dq27MOXrMlCs/5vhBd
         mONFhIxNgyp70fCUpJMgOeJFRK6+YxvpTrRBE08bwQnBfIh4fxw8OWTASVxjTW3VYsVR
         PfHfVMXacR4kudnJXbxlebn9o5spjfNrLge7MX+/mXNE0YHC2hAYFPCXxG85deL15xGK
         0/YnUgkztKIgI0RGOemPYht9y5S13RMFHxa1FME48jjwla+rnAzNl/ynjmVlck/jGKBL
         VRdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793650731; x=1794255531;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hDWK+Q0RgQULL2IquEpArVAHCBy27pTWj8B5yBS/mvg=;
        b=jzsmtyk/Z332AnupYYC7wNN5/0uyPrjoZYCv7IUTr4PHN8rjB4qvZzxHOUBBhABW49
         49Qe2R1KSVEXiS8RPKRAdUPfjfEePktqXDcjE5cqVGRl5xbWpx0NSENntEuY7iS5iTw7
         QxpH8L90C1udwwkxyhbjM7KWJEwtw/bZMf2IE7oTNVr+cUlsFpsz4d1TTx6aHU4CRiu2
         QtjvsgmCP9Vv9vYqp6x616jVot5Z/3DtrNo0qbvrvQ+QTPBrECBVEgBgkepJwIr1DItr
         Kl2JUJcrEOObEg3ygvTqarwNRtnbXZFb4mDmAYLotS2kkpu0Z2giMjj6FEfa1/ezVlB1
         Q1qw==
X-Forwarded-Encrypted: i=1; AKwUvBx/2WhDQvvTjGPZCMF6DPEPuAbc006meXSp+qnYQqyADJ5BM/K30OUpGHk7SYRCkqz7HIofqCQDnhp7@vger.kernel.org
X-Gm-Message-State: AFq9FYJqiSjexED1BU+71uWRP3lAHKfPZo6uz3Y2+Fat/jlNISeBV3Fb
	5AUptIsUO/Prjl/YXSy8bEEH540dxCGCkCOzJpFFz8y0bvK4Es5z+vIrweLas2/VXUB63Mm5zqZ
	s3iC2CbjbyssMzwRzYrCzg7afyO0Mlv4=
X-Gm-Gg: AYBFou1hyXAFqazlsPTFTL4UaISzYDD9e1P0u44p6A6foR9MMbmhSQ3wtYq95InWNxr
	8Ttja+pPc1pvJ6Uf6YJ2n6/DpZ3pXLruyLxpHCZroqJHape5pjNDDV8qZSqdiouMRftU+VLRRwG
	EC1bAEvYWRRfMd06woy9zNDQleNiU2Fj+f0Cf27SCGHYFK6MEmGP0ko8z5JeOECxrh2MYhzdIcp
	JKUK5SL21gnki0Bal/drNZJfD5VS1+52gcEdeVfNpqVeWkFmHoWT44m1f/lCeDnAvQjKpuNf/ro
	uF1V6cgWTUfvbsXSPP7cmRcze3MDvjOhXIdV/j44oS35B1m05G1hjwYQ+pNodTESsmOF+cPX+6+
	9Q5GVJ+KBQjggyiDVR64J8NRHksd+99HsTGlrPkaVDIg2jd7W6TInsdOQH0L/yW4Y3XCaTdbztj
	sCHQMvQIqxPJJyScqNUdKwp+GFCb/CH0H4/RavPbcAMh5JR56HnO8fLo52RCyFWnX5d9jq7E7ZX
	Ch0sAPdN/b2QNPVf4lMIyRZDLiOnHgbG1Y=
X-Received: by 2002:a05:622a:2510:b0:536:72b4:b835 with SMTP id
 d75a77b69052e-542b7141e17mr189658521cf.46.1793650731219; Mon, 02 Nov 2026
 12:18:51 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102090713.896324-1-pbrobinson@gmail.com> <20261102090713.896324-2-pbrobinson@gmail.com>
 <20261102-email-target-d3191584d234@spud>
In-Reply-To: <20261102-email-target-d3191584d234@spud>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Mon, 2 Nov 2026 20:18:38 +0000
X-Gm-Features: AclHuK9-yjv7ad1RizN3tUZLE_u9kHWCoEZqwdsahJwce9NtT6g6vb4WuuUHq4E
Message-ID: <CALeDE9Ncz=6jo_1VxdCJgSVV+fCTgkUvci-=e4MQYFYo_O9M0Q@mail.gmail.com>
Subject: Re: [PATCH 1/9] dt-bindings: dma: brcm,bcm2835-dma: Add BCM2711 and BCM2712
To: Conor Dooley <conor@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	bcm-kernel-feedback-list@broadcom.com, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 2 Nov 2026 at 19:39, Conor Dooley <conor@kernel.org> wrote:
>
> On Mon, Nov 02, 2026 at 09:06:51AM +0000, Peter Robinson wrote:
> > Add compatibles for the BCM2711 40-bit DMA4 channels, which are
> > described by a separate node covering channels 11-14, and for the
> > BCM2712 DMA controllers. The register address of a node identifies its
> > first channel, allowing a controller to be split across nodes.
> >
> > Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > Cc: Conor Dooley <conor+dt@kernel.org>
> >
> > ---
> >  .../bindings/dma/brcm,bcm2835-dma.yaml        | 31 +++++++++++++++++--
> >  1 file changed, 29 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
> > index c9b9a5490826c..31d97a10a0ea9 100644
> > --- a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
> > +++ b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
> > @@ -9,18 +9,27 @@ title: BCM2835 DMA controller
> >  maintainers:
> >    - Nicolas Saenz Julienne <nsaenz@kernel.org>
> >
> > -description:
> > +description: |
> >    The BCM2835 DMA controller has 16 channels in total. Only the lower
> >    13 channels have an associated IRQ. Some arbitrary channels are used by the
> >    VideoCore firmware (1,3,6,7 in the current firmware version). The channels
> >    0, 2 and 3 have special functionality and should not be used by the driver.
> >
> > +  BCM2711 channels 11 to 14 are 40-bit capable DMA4 channels, described by a
> > +  separate brcm,bcm2711-dma node. BCM2712 has 40-bit addressing on all
> > +  channels, with channels 6 to 11 being DMA4 channels. A controller may be
> > +  split across several nodes, the register address identifies the first
> > +  channel of a node.
>
> Uh no, a device should not be split across different nodes. This should
> not be needed, why can't your driver handle the upper channels having
> different capabilities?

This is the way it's done in the downstream kernel, unfortunately
Broadcom doesn't publish the HW details so either they'd need to
contribute the support (which they've not done since the RPi4 was
available) or I'm not sure what the other options would be. Open to
suggestions.

> Thanks,
> Conor.
>
> > +
> >  allOf:
> >    - $ref: dma-controller.yaml#
> >
> >  properties:
> >    compatible:
> > -    const: brcm,bcm2835-dma
> > +    enum:
> > +      - brcm,bcm2835-dma
> > +      - brcm,bcm2711-dma
> > +      - brcm,bcm2712-dma
> >
> >    reg:
> >      maxItems: 1
> > @@ -99,4 +108,22 @@ examples:
> >          brcm,dma-channel-mask = <0x7f35>;
> >      };
> >
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> > +    dma-controller@7e007b00 {
> > +      compatible = "brcm,bcm2711-dma";
> > +      reg = <0x7e007b00 0x400>;
> > +      interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>,
> > +                   <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>,
> > +                   <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>,
> > +                   <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
> > +      interrupt-names = "dma11",
> > +                        "dma12",
> > +                        "dma13",
> > +                        "dma14";
> > +      #dma-cells = <1>;
> > +      brcm,dma-channel-mask = <0x7000>;
> > +    };
> > +
> >  ...
> > --
> > 2.56.0
> >
