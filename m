Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51ED91DFDE
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 00:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782086964; cv=pass; b=ukStCKAEo2q2PxAlm2vUwKN+fKVrMNw48KeJB7gMBtuvJLxtP7DUtRRVzvbfUIFwqV89SUt4aY9tS1INg/uZ5Y9j3d6FuA+qjwZ+TK9L3wkmDp5TF4BWybb2449KOQgna6q3LG0AaJnWH1u9Ph5PKX3rkxvaJhQlnEWoxW1NVwE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782086964; c=relaxed/simple;
	bh=tJWgxbnhAq81DwIaWo6hvawWv37dgX0prh89deKA6hs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ffvqli+Oh6h2dSvCYAf1hBG3XlJmfWyHdTeMJjjfn4emSqe0RlumT86HXYqdYXKXWiYFwaW/tVpSXOeNVHV+kM4E5jlWu/e9D2vtiRsCQiEzTvSC6vVEsa+a0Zf+nAwIirjh2syAhd0wh8XN3ZV0YMdgKeVjN3giqJv7U4Q5sGs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m1fHexGG; arc=pass smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m1fHexGG"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-7ffbc4d8b8eso39059337b3.2
        for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 17:09:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782086962; cv=none;
        d=google.com; s=arc-20240605;
        b=An6+ZyGYqRfL6yNihmgl5BjNqAEiuDrmp5hzDHmtAyuY3RBehQiQ+EnMTa7jdMZYJS
         chWnrpr5nawG869Iih4WxUABqceJl2lb2P5d2zdhDyf8fxbIIp1CwJxuI8q1hlTtcoLC
         2gviFgO6EgJlD4+EWF1H4q7Jrzgw07/nG1SBPv4e/kiqSGMjNEvYQVzGKh/i7R3kzCS+
         Vnd1UfGJaUbYNxq5af5/5OwFlh0Sq0cT97Ad/Lll0NcKIF8hGe0/COR57f5NExbVVA7F
         iQqWq7lJmcx7rK5SkDrExAD0KTDTfpjwxkf8MV6BfdTXNUxp+byVmqhcHI63njIh386e
         La8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tJWgxbnhAq81DwIaWo6hvawWv37dgX0prh89deKA6hs=;
        fh=XBxSGySObShvvcmLVH8nh1kxUUfIkDXigw6i3E4tjDc=;
        b=Q6fdduB+ADB+5N6R5TmkwH+VC9P2WJHrwWL3ZxPEbK8P+Ea9RRlzZ+mELvJgZUCvUK
         +ed1RMMR5PNK/mo2po3FV3Ll2SSTJLyhnoYbJZ98HlBarUX6WgsQ7aCQeHxZFD6J/abT
         h+yV7cf3UhAQ3mg0kJ9ils7SF6OzWAAtVxIBYcUirjrEFQAorSPNF1OPfHBibRYoyqeN
         OmEPrk7+u7WdL7TwGbLNUA3J8rZSfcE8k+Q+E5/dF6kryrxVYP3raEa65JEwMwy+dVla
         KG6DUKsZjqISbKNlh6BTKYlHkBNXLWnr2ZjxhlYBLoBRDSUQzJPbAqYbTCaJ45WHZW41
         gYkw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782086962; x=1782691762; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tJWgxbnhAq81DwIaWo6hvawWv37dgX0prh89deKA6hs=;
        b=m1fHexGG2lZZw1yhJqXXsAU2YR2MWlWYlI4hiNWVvWezqFiCs30RpfWuiYs4zrpQUX
         uJjLZ4OCyH9JBWFPiIcfAYhzEC1/CypREVyCCL/2NKF0T9HUcE8e9EpLZirUkl3pTU+p
         5dNi9LyXCBGvVluMSD6MjXQmWNzKNMG4SY2EPmURayQhfJ9MIqH5VU3rWTSZS+nk2Idy
         EDdyYKwMSlTUc41PVoYlzYkSLf8cRBTDhnPMrapejBGnVW2IpjLnZiCrLDvfee8GH3VJ
         +tx+Dpi9cb9YHGSmdlsV1CVC9Tkl1jCtKzEXLvZHI2VUpp6MXVIRTDC0nvvXCtFZj0KI
         vyIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782086962; x=1782691762;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tJWgxbnhAq81DwIaWo6hvawWv37dgX0prh89deKA6hs=;
        b=nzFmfuGljLGOsOE3lunipDyxFIQJNj99pM5VuWiFcVTANkjVjU8Zsd4g3o8eCVKLvE
         sR54YemuNcxj+V+IFX2doCjNdV0HuHQETJAniy+1AzfaR/9usW2FjnbW/dMQfhZQstpK
         hM4DR0vV5EWMUuPE+iStaSrBw7qgI8MnBwgUgbRqZ9ZtG8lSTao3GS/oLgJFzSktotyn
         Ps6vLOycbHVkhQwHvmHMVFdwVEEmPNp6Oz9t8tL4AwBpUhi1CwBbhG23UccXDflMfA+6
         ixNsr3x1biXJFG0LyX/HKszzW/NXg+DPU1XgcXtC5Us7gRQ0z5xzSUmzP0LIgoy7gSuA
         fzSw==
X-Forwarded-Encrypted: i=1; AHgh+Rqnj1mnjV2DOWG2D1AEGmR1Y3ewB3kzZcolN0kGccXTZ+r/+DdHcezmFoTY9x4YmqGByTCom2UyZ31e@vger.kernel.org
X-Gm-Message-State: AOJu0YzUHHDTcHMS8rfxkXKzau6YjDnJiwGWnL/Vhsc9vWHOwMFwGkPX
	EBHsfyNikH2vMlEfyda85uKJ8RUTWhE3RAWbhBww6GF2oxFFDipBT8g58bDF5lFN9vlSbjrtlcd
	aUsr67m3mgfqGXL3pdj9oUTi7XWzvYtY=
X-Gm-Gg: AfdE7cnPcNtyD8ZES7FXz35pe8xBBujCjihXuINsyt4DkuxLhygd7eV6Q6n206Er/G5
	fh3VqT9tdFk6btOYh25iawIfKK8anEGgYqz30Y5cGw/fdqb84uZ0VCwyVi6Rg2Z0fJZXZZZzFEW
	Jcf9/UXhaIB32M3zDMlmN/W4XuiXQ9irlrzE0RF2v4LDDBKcXVgXKg1nO/3amXqdTOe1G49OltH
	1NVW5fpFPksQkAn7gATWOwYfx13kYi+9PvwA15WCXeROT5wE+NRz4r1Q4j6wY6bt57O4g==
X-Received: by 2002:a05:690c:6e89:b0:7e1:fbf:aa7f with SMTP id
 00721157ae682-80135258384mr123232397b3.34.1782086962289; Sun, 21 Jun 2026
 17:09:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260621004626.66629-1-m32285159@gmail.com> <20260621004626.66629-3-m32285159@gmail.com>
 <20260621203303.0f8c5d08@systembl0wer> <CAKqfh0HUih0q9PEh+5pwwMuBBkm6nsaZP9e2yPjHO3+Yccuvgw@mail.gmail.com>
In-Reply-To: <CAKqfh0HUih0q9PEh+5pwwMuBBkm6nsaZP9e2yPjHO3+Yccuvgw@mail.gmail.com>
From: Maxwell Doose <m32285159@gmail.com>
Date: Sun, 21 Jun 2026 19:09:11 -0500
X-Gm-Features: AVVi8CeBoDXrbtClH1kwVIj7-gXFLAcOq-X0zP7Ou8EwKuQ0ysQLks4_-xoHIkc
Message-ID: <CAKqfh0G1dcn4MLQ5jxjM8aDHVu=z-NEAR-y=xMjfOiW7M_HF-Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] iio: temperature: Add STS30 temperature sensor driver
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 21, 2026 at 7:05=E2=80=AFPM Maxwell Doose <m32285159@gmail.com>=
 wrote:
>
> On Sun, Jun 21, 2026 at 1:33=E2=80=AFPM Joshua Crofts <joshua.crofts1@gma=
il.com> wrote:
> >
> > On Sat, 20 Jun 2026 19:46:24 -0500
> > Maxwell Doose <m32285159@gmail.com> wrote:
> > > +#include <linux/array_size.h>
> > > +#include <linux/bits.h>
> > > +#include <linux/cleanup.h>
> > > +#include <linux/crc8.h>
> > > +#include <linux/delay.h>
> > > +#include <linux/device.h>
> > > +#include <linux/errno.h>
> > > +#include <linux/export.h>
> > > +#include <linux/i2c.h>
> >
> > I am a numpty as I also forgot to mention a missing
> > mod_devicetable.h header.
> >
>
> D'oh, I ought to look at my includes a lot more closely as well.

Forgot to mention, I'll be away for 2 weeks starting tomorrow so it'll
have to wait :(
