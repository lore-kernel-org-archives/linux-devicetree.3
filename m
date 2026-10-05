Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2BAD4BA1D8
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 15:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791214336; cv=pass; b=JLiWggV0yedMC7ONAZ0AbMqt2g6CmvFUhDgwDIoaIzv0xGzZVwcJUR53iqwZ18zGG8dBbc+JzPcnhnXKPCTQg3C0DLbck34DQa7+Zit5/l5B9kBXDYOgw2QDsXfpg4JFt2OPCYSSkWnx2jA7dFIdpSBy2sieZnHIWfFFdRFE54A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791214336; c=relaxed/simple;
	bh=DHbE/ZQrnN4lIbhz9d2lRY1XaGiqJgT56yvkXrJ87/I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EiQBvNkOqT5jndKFzwQ6cl4rmNtleUUHVLb/ff6a41wXiCFxcT5RNLjvoA9TEJqLBmVFenqle3MY15EEGX5kjey9maTj3Qks4abkbbGoeOQMhf18Rdm4L+7u+iWK762y6lnhqVH4dUbbuoldadbrtkYuitcPs9wQE9+MJqDBaBM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X72NKqqR; arc=pass smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X72NKqqR"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-917d595138fso11336916d6.3
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 08:32:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791214334; cv=none;
        d=google.com; s=arc-20260327;
        b=qwdp1Iv5GLQhdPZ6sHy6HNXYw5edvHWeF9nlMciQ2P6Vw6Giop3wFiw8mSrt90t4mQ
         9UCTFkoB9ggnEgb1mOFrnAys+HVTLoxel+TL0KUZFjHh6FIUkx30J9+xsX+udzYtU7O/
         zGQlZYjkbtZ0aavlihv7OZkk6aDSWfNIMBp6I+Du/NSktEStxJeEJ4MEr9PF5SceVp+/
         kZdSE0wDhNj9BxE6WoI+ZYQnfYwSBlzJCBNi4EH+H8Xsm/lbkvbw3jw1ZDcFKIvwEDDR
         O/LMw4Mduq7ox25MaMhbpzftjB8f4q3QEPKvHrYpmG/p2LEntmXGuhlXrcH0t/zCmXlh
         v9vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DHbE/ZQrnN4lIbhz9d2lRY1XaGiqJgT56yvkXrJ87/I=;
        fh=l+4PfgLXx0HNumT+9xDNHFx0F1NbUvQonHxhZNhvOSY=;
        b=Zeu3ORrtUUhPEoTMd2JqWuAI/TVN7R+c5J71z1ExcMtZqraXP0vCFGFzb8cdC3fcXH
         onzGVAZScf6W5vmNKUWr8YPTnl8JtI6e6KBk69POodP0mBrG+/INKhxLzeMS/b4+4e/J
         2G9XgjtjLtc91XPGc9q/+eima6cJcj8o5Z0wuLRUrGfucMc1lB7TstMjAAkyDWcoDraM
         xWzLIRGo9/YbPjsex6lfhrVmK9ZGy7FjLum8Rofjh8XVkzwuqweQTSXuzqXeUI1Jz5pT
         AfpipSkFumNFZHtEG0sA5UHEtoLAb2/XjK+mR5DE2wMWc1fLfwXM0OXm5gwTA6ZTUbP/
         ai+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791214334; x=1791819134; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DHbE/ZQrnN4lIbhz9d2lRY1XaGiqJgT56yvkXrJ87/I=;
        b=X72NKqqRKLlJ2z8yam1AyCl+5IY3PCOHzJ5eY5al/5SYeo7BuZ5JwwuC/38bLrskSR
         mPx9CWG9ytOGXqzv2BI+CbKtR43brdcoOVFjV9cLZxiSjMg4AbXA9ETwBh+V4ev+Ble1
         g3+Ko+p6N4295xvZwTO1UvHirOudRhP5C94lMBhWFZzYgAr/Z4hmuD/MB949p9jDpA6t
         k80VVxOK3BvwT1iln6L1dBqwWOcgNPHYceI4PPBdjhbQ9cNbFMd8UBfz7rPECesQppNQ
         9Ctu6mAWZ24XJO0jRt6rVzMpdBU1+QCv/gbnmKrIGGhYad9l4kDGi6TdJlrE8GHW553e
         KseA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791214334; x=1791819134;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DHbE/ZQrnN4lIbhz9d2lRY1XaGiqJgT56yvkXrJ87/I=;
        b=CXD0LCBITAnpPpyjCodBPuZ7/H4DLpO6EsTHPu1/i8uUmJPl+IorRP3v21OkyMrSO4
         wNI23B62jTKekeKcC7qduFv1bOZnE5UPIO9ewIwqsJ29ZQPz06B9MgFrKJj8kZ3FhGk2
         iEF3kFsbkKraXFajg9Ouk+X6nA6R4/j22uCnyQIc1+T+7Ey5bms6Ae2OFzqb6zShP4mK
         8J9wwIHSaoghTTnDvX2Hh/P+9k7EiAJMumAtoNLS52nMxdI/W4vXy8z1yHYEx2xcuOQ/
         uuzL03YeKsBNIfg4DpZD5W7mbbMbkDYhhs+vI48G7SiqDzSmPP7DzEJKme92AJHbnFQz
         IkFw==
X-Forwarded-Encrypted: i=1; AKwUvBzBSoTrhbxrS1Owy5QG0A1QJMO046XYeJXLEDtcWdsNbokZlofMSi2gAvadmyzJCAkOvVegBSDNWxJv@vger.kernel.org
X-Gm-Message-State: AFuF++kvphqq4PwAUzOgWun8CjZ6o77Te+SZHoA5fcOhlsun6bw66b44
	xRMCaHYydXN/yU9YMDuIlC8/pKsvN5Xy9S/Wtwo2JFdHQ4aKQR0/qkbVe6BMctRYlNr2uE2CRgp
	eSwX0XgIdsZ5q/Sk+J61Vfn7FvhKqJ3s=
X-Gm-Gg: AYBFou2Qn08TwQcu4VPce3jJ/rAkwY/EnobUjfxuyOLlshUNAocwuoUTq+IlwRibLo2
	j+h9rGAYu7L7bBQN9BAcvfqKgRC7ZrIkZzdq4ZiypxrnLLjEcsPkKsioWM/5zbNNfVKoQdV+6Y2
	HK5Fj3cOjLqmWjqzX2g7cFsMbXNygsw2/lbOPa/96oeAdZMljW6WuPjdEE4LBXDPF1as1wVLeKx
	2raEQjBUe8+nLiy9DcjXsz+qP6u7N5pKkP5gBrR00ksWDRMJVKrPnl7DMedb8RaxhTLq7JuyGFg
	bJqoorfX0h94IUWGAvA5BwsOtjERiSC16qszGqHyqW16xqVg65QzlKk=
X-Received: by 2002:a05:6214:4906:b0:915:e9af:3145 with SMTP id
 6a1803df08f44-9195d07bd1amr138006566d6.12.1791214333390; Mon, 05 Oct 2026
 08:32:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005105535.2472-1-ansuelsmth@gmail.com> <asPCFDMXyntAV6lx@parshuram>
In-Reply-To: <asPCFDMXyntAV6lx@parshuram>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Mon, 5 Oct 2026 17:31:59 +0200
X-Gm-Features: AclHuK9sfRTTob9cejo5rJV-vGSG3XFEFgdIAL7ikLesT7uwwOKne_JE24bBBNs
Message-ID: <CA+_ehUx_B2K3WgLYkt2fz5jzDRB24LQRB3uX_VScZ2QSxCojPg@mail.gmail.com>
Subject: Re: [PATCH v13 0/3] airoha: an7581: USB support
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Il giorno lun 5 ott 2026 alle ore 17:28 Vinod Koul <vkoul@kernel.org>
ha scritto:
>
> On 05-10-26, 12:55, Christian Marangi wrote:
> > This is a major rework of the old v2 series.
> >
> > The SoC always support USB 2.0 but for USB 3.0 it needs additional
> > configuration for the Serdes port. Such port can be either configured
> > for USB usage or for PCIe lines or HSGMII and these are configured
> > in the SCU space.
> >
> > The previous implementation of a dedicated SSR driver was too
> > complex and fragile for the simple task of configuring a register
> > hence it was dropped and the handling is entirely in the PHY driver.
> >
> > Everything was reducted to the dt-bindings to describe the Serdes line.
> >
> > Also the property for the PHY are renamed to a more suitable name and
> > everything is now mandatory to simplify the implementation.
> > (the PHY are always present and active on the SoC)
> >
> > Also other unrelated patch are dropped from this series.
> >
> > Changes v13:
> > - Rebase on top of phy next
>
> Pls fix the chechpatch issues. There is new blank line at EOF, SPDX
> format mismatches and many more. Make sure you pass --strict flag to it
>

My checkpatch doesn't report the blank line. Am I missing something?
For SPDX, is it ok to change it? The commit just move file. I would
like to fix that in a separate commit after. (I can include in this
series if you
want)

The other warning are about Kconfig description where I can
artificially make the help text longer (no idea if it's OK...)

And the line too long for the define but making the line shorter
would result in a disaster for the register.

Up to you what I should fix but I guess the real important one
is the blank line but my checkpatch script is not detecting that...

Can you help?
