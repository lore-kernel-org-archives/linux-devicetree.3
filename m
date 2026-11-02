Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793655361;
	b=suYJbxbweKsJIBnMjBoL+T/t/5EVYsI6fp/bQOZq4xBylM6WMRltGVipn9iMtYlLKhkA
	 XUjaZBqh3zmW1YrVlR3uKaEqrKLFk4pC1c60l9CoOLp8AM+bGxaO/Y/HwX5fw553KEoE5
	 IjbVUEd+s+YRKQ7oRJ6rzGJMUf21JSNWjeStOTAptI1FiWBoVh+Ukems+jiGrYYwYgLUe
	 upEActX3iXet0xgL66bHzplEnR1Ijkn6E8+n3MxLE/HZlE51EISQ0O1nqXf7dSvijpCn5
	 xRTudnKzOzbTZWBY6Auz+IULFCMKkKO8Atyz6x0XjDBStHnK2YTnORFUOzJYcxUrh3g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793655361;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=VHV6XZXV3oT+cCr5eIzbFOalP1E93sRXCTUPESAW1N8=;
	b=Ao8Iy4LS+epveWFKH9E2DJfPJ9NUYX9zTASR8uFYcS9opXUm4T/n4SPLJoLc1QKs9rFs
	 KYVvypVCw0OOSktl2PD/wQIZOzDalAB7tqPxh4qLwtCIndBu5/SgRJovhl4vMrjax2d/c
	 mbyXxQ4wRvFwoyxwewEwFPaRiTYjp7NmhnyfAHQc9R1Msek5+3bHs5vxAOdMof4W4rK6f
	 fePOgDPzOQ4+plsalQI1jZcSrQcfR70S88OQO/7AK96jPz5SbTfY8Q8YX10ws8DXWWDWk
	 Eg/sup7rju6m81UW6qb3Jnf583Jm7OAbC6sq76rYBhukhKaBcJW9XNd66nKnIpeuMLw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DSzfSyJH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAF4606A326
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 21:36:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BAF4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DSzfSyJH
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-5365b48238dso33977091cf.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 13:36:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793655360; cv=none;
        d=google.com; s=arc-20260327;
        b=jKzDDpkbte5e5qwnV2bHE+CaXfgQSGCGrFA0MTpkHuyeHwe1hGbyKLCQjCt10RA2LD
         DRLbS7MoQIrsYFoS6960ZE+J7dgZ5YUllVBUeb81J+Fi0f5iFHPrRyef+TdXz0aXK6mt
         tmnQuRevzdt9cDJMnYjKUcpR08ThVVwOtScVCZFBHhnXXr8oPw08PcX8+ZZC8/0CpQxa
         LJvXA2b4/yMoR2Qfc12w1FGYpTgKbWRDzcNHHdcyDcNVnN8OtkcZlGI3ckddC2yAN44S
         XkL+sNHBWoA+GgjErl0ZotqRVHBA5yZkNfBRn853u3W2KI7C2W5gTcoZ1X7o/cMo9u7D
         GmXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VHV6XZXV3oT+cCr5eIzbFOalP1E93sRXCTUPESAW1N8=;
        fh=DtYcvMTTDuvCq9x9PTweabBXGfz9UxkY9QR9wgm4ALk=;
        b=pITTkExxzMebnlkyFHkwzrCJ+EqIvXRlZJNrfzsuSxxqdPnliQ4wTCIYSeYzWA5UnO
         BTc8gZ85p3NDzP8L5GjqkimY/u2N21kn1giGXLUOwDIBzFRAegv1H2hhgEbU0HRMlvgg
         0wLZDPT98ZyzfvWlM1qB+GQNWLlydF9WLfg1pQgNKl7vSGp4ygKxcLuv8ma/vY3kqPuC
         g+V4KqSABASyGb3WVe6fV2jAKOzcalQF9c77wI3rjG9/0WDxtT9S89L2M6kR9EXiprJc
         eJDZvpiCXAv+INkW0NLc7WZPinu+pzhuJcOmwsTJRMgZxXy1R2Ds9GUly8haeG3e+PLL
         xVEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793655360; x=1794260160; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VHV6XZXV3oT+cCr5eIzbFOalP1E93sRXCTUPESAW1N8=;
        b=DSzfSyJHVupjsqzVXsjHvmmI5zMAo3+qhFy8bWOl8SLjNC7Wb+eqr9xN47R06NkFlu
         0urlZBeRkiHxuKH2lL0x+ktcFBoqk6bq7waiMvb/quyzv+3PVLMyNWjeQUwoWTT3J6PS
         pgz2evpgZrJFLh6Yep6MA2ux9c2Vb9JSKWkXf/Ks8jdFM6M3h5hqKcyVW37qOYD2jbpD
         CV8RdhYraJUS/ESsMtx2JrUYQ+4E5kFMWv27PO07SKwEF0VPQRBBp2ehPlUu49P3qYaA
         utwufyW7pLBmhPupxlY4U14wGQneUPlGTzDv171/FzoqLoeWXMs+U79kwyMXC/hlwRW5
         VWvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793655360; x=1794260160;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VHV6XZXV3oT+cCr5eIzbFOalP1E93sRXCTUPESAW1N8=;
        b=iVdbQ/ma7iya8B2gKr3hT65SAg+vnTQY9Gbv5PwoZGz+Xa0sp8zVN497Q9roGwEGFb
         /nLZlIqui2Reg06KQ3jMpEnxxSlk5/LctYBS0yvHP/5zxrtCWK4er+CXw0gYQnwy2k3I
         vqeSfrXeurCutdvv1LUd5c8P5cN2Su9Il33cmNMuByTHNhIl+MuvdUW4wQIMNZFSo4O/
         IqcSrvkHod1CbzQe0JTTHbB25OaEtHPS9Sj6a8FZi1GEYqSLy2Nu6l8POvRf9VDGyIzR
         2cnadmbF+uC9oeOhJ9YHbDkXm26t4KqGEl4yrO9r55B2c4NbUzfWUiee3aV+1SDYkzUl
         IhtQ==
X-Forwarded-Encrypted: i=1; AKwUvBzoiYgtpQqkZlQ2nruZwL6W5H7rgMZasvBghTnZMF58Ju11Yhz44mTVVzzSxKL4K45A3qnPqPohY0dh@vger.kernel.org
X-Gm-Message-State: AFq9FYJnUhSK1V+gdO8kJLN01T2M8ydX1o69M4W1iUZ+y3IkEGW+QrYB
	hi1pMVcH0iubN/AbCRwYAVNX8OvbLNF4b6Nw09cHRi96bABCnV9lkXXxqE0MLygVjE1QyJoJdd3
	+yn6gC+MkWKqznxrrHAWn+Ne0PVmCM7U=
X-Gm-Gg: AYBFou3ts22Wvbr9E++B5kEYnrp9E9lsJlj7l9SpvZDMSGQM0tiKHqaxaSEeq/9yDi/
	kDf7ksW13SZA8sDQvFzE+aQEa97FVi+XqW9u/uI4dL2mi0uoSccDVGIUywnvMf7eqprDz8UO2kb
	f9Fc6zdPUaQXVN+GR5i0oGh1ZEpwPcnad5TL4kK7yto6xoQ/5bUnScGUMaQcMVcgLTLPxs80Mcb
	Vc2Jovv9OrzgnDhFEW4O9Iw/y49woSMkLSehIuCjHq37NfXLmsX7QHmpVyBBRZyXlsGLPZdck7q
	449xqoG5c5EjcFCKxIq4KvdlyZ2VTwU3SDWOvKro9eImjpLsdBk+XrbpzPK4dvb6k8dfk1ShRBg
	/L9Do+razTLo9+yFl7xCbC18/0TC6E3Fp35S+0I7Pydo7/0/2zNfOtvmXIGRvmb4S/fUgAHgGzu
	YS3JZFcs9kNRPlS0CKM5xbO/sIwDZg/cdFf0LdgiU3hRCm1vaqrSPNUqA1FMQIXDgHPpeA1zWYA
	XWhYj3FWBoUc/Uz9H0zsJtcG+P9JWwiPoA=
X-Received: by 2002:a05:620a:3708:b0:93f:d27:c89e with SMTP id
 af79cd13be357-9442175c185mr1940666385a.75.1793655360542; Mon, 02 Nov 2026
 13:36:00 -0800 (PST)
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
 <20261102-email-target-d3191584d234@spud> <CALeDE9Ncz=6jo_1VxdCJgSVV+fCTgkUvci-=e4MQYFYo_O9M0Q@mail.gmail.com>
 <5bd67c8d-41ee-40e7-ab75-031e1520758f@gmail.com>
In-Reply-To: <5bd67c8d-41ee-40e7-ab75-031e1520758f@gmail.com>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Mon, 2 Nov 2026 21:35:48 +0000
X-Gm-Features: AclHuK9c_iqft5lz_6jUeAVYzMiPhlLMeoYQ4TVGFVp9pkGtrtWvK0tM_qVXpc8
Message-ID: <CALeDE9NhPa3V4jJ-Lc1sOujdrSAtkOuoeLW98NBxUai2qZFoLw@mail.gmail.com>
Subject: Re: [PATCH 1/9] dt-bindings: dma: brcm,bcm2835-dma: Add BCM2711 and BCM2712
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Conor Dooley <conor@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	bcm-kernel-feedback-list@broadcom.com, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 2 Nov 2026 at 20:38, Florian Fainelli <f.fainelli@gmail.com> wrote:
>
> On 11/2/26 12:18, Peter Robinson wrote:
> > On Mon, 2 Nov 2026 at 19:39, Conor Dooley <conor@kernel.org> wrote:
> >>
> >> On Mon, Nov 02, 2026 at 09:06:51AM +0000, Peter Robinson wrote:
> >>> Add compatibles for the BCM2711 40-bit DMA4 channels, which are
> >>> described by a separate node covering channels 11-14, and for the
> >>> BCM2712 DMA controllers. The register address of a node identifies its
> >>> first channel, allowing a controller to be split across nodes.
> >>>
> >>> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> >>> Cc: Rob Herring <robh@kernel.org>
> >>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> >>> Cc: Conor Dooley <conor+dt@kernel.org>
> >>>
> >>> ---
> >>>   .../bindings/dma/brcm,bcm2835-dma.yaml        | 31 +++++++++++++++++--
> >>>   1 file changed, 29 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
> >>> index c9b9a5490826c..31d97a10a0ea9 100644
> >>> --- a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
> >>> +++ b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
> >>> @@ -9,18 +9,27 @@ title: BCM2835 DMA controller
> >>>   maintainers:
> >>>     - Nicolas Saenz Julienne <nsaenz@kernel.org>
> >>>
> >>> -description:
> >>> +description: |
> >>>     The BCM2835 DMA controller has 16 channels in total. Only the lower
> >>>     13 channels have an associated IRQ. Some arbitrary channels are used by the
> >>>     VideoCore firmware (1,3,6,7 in the current firmware version). The channels
> >>>     0, 2 and 3 have special functionality and should not be used by the driver.
> >>>
> >>> +  BCM2711 channels 11 to 14 are 40-bit capable DMA4 channels, described by a
> >>> +  separate brcm,bcm2711-dma node. BCM2712 has 40-bit addressing on all
> >>> +  channels, with channels 6 to 11 being DMA4 channels. A controller may be
> >>> +  split across several nodes, the register address identifies the first
> >>> +  channel of a node.
> >>
> >> Uh no, a device should not be split across different nodes. This should
> >> not be needed, why can't your driver handle the upper channels having
> >> different capabilities?
> >
> > This is the way it's done in the downstream kernel, unfortunately
> > Broadcom doesn't publish the HW details so either they'd need to
> > contribute the support (which they've not done since the RPi4 was
> > available) or I'm not sure what the other options would be. Open to
> > suggestions.
>
> Neither here nor there, IMHO, yes it would be nice if documentation was
> published (and a customer like Raspberry Pi is probably one of the few
> that can get the needle to move there).
>
> You have the bcm2711 and bcm2712 compatible strings which should be
> enough for you to know which channels are 40-bit capable and which are
> not, yet keep the same Device Tree node.

From reading the downstream commits though it reads like the different
channels have different capabilities? Or am I reading that wrong and
it's the different generations of the HW that have different
capabilities?

Peter
