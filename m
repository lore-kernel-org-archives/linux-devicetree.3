Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1FD39B48D
	for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 21:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790543454; cv=pass; b=T9FBn8RKrstRLDQuyZtiQQJrmhYs4lsDuV303quNjdmBHO95oeOweqQsYqJyJvhtU/xBliVDaSV/UWRHoFafu0RLiF0ZYxGUggR66oTvj4PtK3TYoA3Hq2qAI/KPnYm+9BWhdOLq9w7aF6PJEVVlv35qdw++AAKbgjxjTUwR0pQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790543454; c=relaxed/simple;
	bh=K+JP+LPdxc4vpdnaEOF+IpoVDd3fTmu6ZNu6gMPY2s8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u2ss/KtS9HwBpF2Q2MIhU6xDfn0fgnPJNOCE+8637ZteoZZ0GhqOcgvkoFpwq7qBcduOZ0MPyidkJrfNujCavZ3zRYp9WevrftagnEOSmreMGQ1dsLnNCMQl08kR3/jK3cfZIL10ELyX+6XClqYPQmb4sdCO1/Q14KNH4RApZBo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oSwhkhlf; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oSwhkhlf"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a605c198fdso3753173a12.2
        for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 14:10:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790543451; cv=none;
        d=google.com; s=arc-20260327;
        b=hiDwoAllNyD+tC2NmkKhpAfzRDx7LZ+c8EzyTk9oxlP5kpRKU5UQBdRfGfx8TIyp/h
         hsoSzbcJ56XP1ql79R/OyT1XiD9l4zVnf85m0th7fW5UXai1U1D4+ZarXjTgZ/uqnnL6
         qB/yFTn6OLE3xr3Vm1pqfCiZfdzrkFFexn2A4rKrdL+nptYBWLk0iOTiihon6tzsrhvE
         aX+TGJJBAFGDmJ1qQDv10H8DiQl5afe0C1iAYfHpD6LLy2Ls87tqDIVAVSXgIly6C4PT
         Ws+KBidS1tp5KPMwyXH14W7GWzN2cvmr0RU31z+7klzlLBQZj+vADd9FyJMfNxPowy2q
         1l+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K+JP+LPdxc4vpdnaEOF+IpoVDd3fTmu6ZNu6gMPY2s8=;
        fh=2SEnQF6XQidqSW6ZP4nI1LlUIw0f0dbrJ90g7BH7kEo=;
        b=adicZ0/YvplqSOw2/fD8Ynx+tsiRE8O77eLRYpiQVCwM4BvgTY9CIwyrQqOffrHtF7
         hAEqf8jvpWSMgv8SGQYZqxideVnAdWTRjbUGep3SpvHcmQyR5A4Z9LDN3eBb7odnEohi
         vFY0rHVVFw8mfxz30lzQ0M9rVgX0X709uTAp5y48r1gUIXNaaV3w+dqqnpWW/a1KoEBk
         bfKvhoct32YlF8hV8LT+o5R3pg7a9/G96gfS3bTC0zdqDtrv8nAjhIkeMUCYRQjpjVzf
         lmv1A/LHGLwmIdtzZuNZVB0AeJ4U4r0k1lV38r4giKTGo6U9tFOVKtRIhz0MphoBQes+
         dVFQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790543451; x=1791148251; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K+JP+LPdxc4vpdnaEOF+IpoVDd3fTmu6ZNu6gMPY2s8=;
        b=oSwhkhlf5AxBUNHBP9ueBnjtMWNC2CFksnniRllzgebZw6iCtl3TTIv8ZjsUMJPLMh
         Qjse3mO5n1MNPjgtM8Hjq1jtuKXq3f/q+IQisE0iw2DaReXegMd1x8v0YHfI5Jh9Swy1
         QPGfOlkjzkdvHoz/lSbRY2+l5s0Y4EF106rQ5PqTGflvvJFlesu+WqE1ASShoRFvs96+
         Szo8TF6uS0yn3ORZTPuHe6aavRYQTp2CP194yJYPbKi7hvFY+unI3RHSRlJFr+kbZ0Nz
         EJ5IieKyOoQt1qfcXBbI1NiR6FEjoTEM4Qfr0eg6NkLhsUzwuomQw0cxyvtOfzUrQ6ua
         xbHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790543451; x=1791148251;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K+JP+LPdxc4vpdnaEOF+IpoVDd3fTmu6ZNu6gMPY2s8=;
        b=wnAYFPXsC0uA6rHQSpNO0ffAfSsSxCFdOsNY1AuLyIxbvkbXuNxxNRADSZ9PRAgMpp
         NHc5AL6s+eUHKK+Fp/Ra5q2uMDKP+DEycc4wYFzk/Eu8Zvp87X/0mNLnMkKy/YUTgiIj
         0Sl+ftFDkEC2kl+ibZNd0Any5ceJbqCzmQ6Dm7BEfowOfBXFWQDwDTj1C8FL6b+jvFPZ
         1nprI58uDN++MnO73a4TAyoAdwolJlaOzjQkEj7bfsFQ4fPnuxG30C7IQgz3XHT0v+vf
         pmuLSiNSp2VT55oPTjSPeVgQjvpOUSy3CtPywf9MchD9OTx3E9Xpg1UESjP8z8P24RXJ
         0Smw==
X-Forwarded-Encrypted: i=1; AKwUvBycqhTtuFjzTPQs79zqd/peDFe0S+rQnpIiA8SGvMp12qBhZgbqq6qud+23T+FIbprbir1FAJIDpbRj@vger.kernel.org
X-Gm-Message-State: AFq9FYJSnlrApP3gPyfPl4G2pd3xD8N4e18unKwY9K/6EKHH4OT7BHM2
	bsZsZFSWWhJaLsbDB2J5fp4Jh8eeeVwg6Ur0o0RAKXSdQuATmKVNmoUAYqT7J+zbmkVNPD8XPmp
	xzW+GsKyNCvqqNwh68fMwXzfe71e1+OMfemdU
X-Gm-Gg: AYBFou3w63YpAI9Q2IVyrCn9vPs99ZMJMmQB+bn9KNI5Rb46YAlKlp0/IMq9qOedIky
	TxWFaCxndOAuZ0r8htbPXMFTAbENBPYLxvo9ltDi1QWn7ah+jO8fRaMDY/7juqYuSLW40AOCA2u
	bbNERVgbtxdvxImYrH/YjbMoiNQhzHbcjdbJxa4le3nFN5LdA/ix1U9OtT65JFC5R+oRG6gJ5zL
	RCzUqa/aODTguPmCUZvmM1TxJbygMWaUo/KZBwD0MvFNW4unoR7n0ARiM/iiWu6pmN8x+4Xs1lP
	ULb6WrsmO+AhFm1y5XlNn9G7m5TH0AfW85Zo1BfUa2HtpSKzaFAt/J0jk+74u22jIsM2gzJGXIc
	Yqi2XP0aVZhBDaft7PVmOYJZSyAWbjhvdSLuiXLq4RLGii5dI+WlJJIXNXSkdCgaB6VwCJBGV8D
	K11aQm35QQ2fS3unslCroapmEgloW+L/dZItVUEH18Xnw/sV1XoJND9sCnRA/jEXzBmA==
X-Received: by 2002:a05:6402:1e93:b0:6a6:37a3:2b0f with SMTP id
 4fb4d7f45d1cf-6aac8ecf40cmr8425968a12.8.1790543451233; Sun, 27 Sep 2026
 14:10:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924233831.127617-1-rosenp@gmail.com> <feeed1f5-0e82-4b6f-8640-f38f3a892d20@kernel.org>
In-Reply-To: <feeed1f5-0e82-4b6f-8640-f38f3a892d20@kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Sun, 27 Sep 2026 14:10:40 -0700
X-Gm-Features: AclHuK9nXtwhKZKT8OEvWTXnJF3sAiZwWnAZputjHhM41eg1WXS42W-4ztR4xkU
Message-ID: <CAKxU2N8JeJi=cNkXKKdCS7HChvhGHziCTz3j-wm27Nr04RMD-g@mail.gmail.com>
Subject: Re: [PATCHv3 0/2] usb: bcma: control VBUS via a regulator
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-usb@vger.kernel.org, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Hauke Mehrtens <hauke@hauke-m.de>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"moderated list:BROADCOM BCM5301X ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 11:54=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 25/09/2026 01:38, Rosen Penev wrote:
> > bcma-hcd currently drives the USB power line by grabbing the
> > undocumented "vcc-gpio" property from the controller node and poking
> > it through gpiolib. Besides relying on a non-standard binding, this
> > cannot work on boards such as the NETGEAR R7000 and R8000 where one
> > chipcommon GPIO powers both the USB2 and USB3 cores: the two
> > controllers each request that GPIO exclusively, so the second one
> > fails with -EBUSY and its port stays dead.
> >
> > Instead, switch the driver to the standard regulator interface and
> > express the power rails as regulator-fixed nodes bound to the
> > chipcommon GPIOs. The regulator core reference-counts enable/disable
> > requests, letting both controllers share one GPIO without conflicts.
>
> Please use standard email subjects, so with the PATCH keyword in the
> title. `git format-patch -vX` helps here to create proper versioned
> patches. Another useful tool is b4. Skipping the PATCH keyword makes
> filtering of emails more difficult thus making the review process less
> convenient.
I will make this change going forward.
>
> Almost all your patches for months now do everything to escape my filters=
.
That explains a lot.
>
> Best regards,
> Krzysztof
