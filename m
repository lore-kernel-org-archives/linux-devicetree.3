Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575823F8709
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 10:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786963428; cv=pass; b=AfT+Ib/6okpT8v2oM96alr/Ts0Fs9UThJfCLzGlC+W+DPonhBTTsPBgBxReGMBa3oxjoWOVFfjSnqziUsdchOnUJlvBr9y0VW3pyZTJGsm8YzyWfeahPwBpqWmuFtD61PhYLFJMQMSidMM0JruNa4exz0VIh2Wya296FOU0BgAQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786963428; c=relaxed/simple;
	bh=mS3Uur/ZQDFMzmjlcJ5SZiJWLd3W4kIodGJs78FCiq4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sW37kdaB1uQrJjbGBs3YUUiqKSSfvpPcnPrKEx5xwv5p+rBpqvpifsULhdHcqm+8F9ZU0b+063y3HxAlCIXELvZdJptuqrgr9Fd8myC7owaGk0g6YB4L65DsiRYjN9RrhuAaXSbNlu5t6CP7Go/tUAQBKb3RuyIZFKx6lzUSiPk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nOVEbcdp; arc=pass smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nOVEbcdp"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-39c86ce9e29so25615481fa.3
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 03:43:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786963424; cv=none;
        d=google.com; s=arc-20260327;
        b=EFsi15SuVNAQHrbtvJWn0Gh8iBI3OJjPH/ou1Nyk8RINGp9rBi7fBJ/tMRBje1agDq
         Dk66W+wvgBvwdp+ypDPeoA2tyu/LurjbZEcnZuLLDtT2EybU5DofY2Gcs7rqXvxqFt48
         rHVaGVVoYY8mawMx2+LAHgzLTUUoFBYVHVESfv0qZ9uOnRJpVdCzz5qLBIX2RG+l+fkT
         oOIT/pMI1lo9wGGmqQWCvl8la2s+5eKB4HqSA3HApYgMxxD9B4i03wQ1ZyFJc+8dSLFh
         U1loReON/nTycJ+djaSpGqV7PuiQXwjn0ShGszCBeZghrePmz0fq9VibmhblOC8mS3EF
         L63g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tfXrwhUEdtSGObkxJ4yfvMMbCGkxVNdt2ypMc+rYzxU=;
        fh=jMjLOTRa1d6fuw0m18+F39iK1p4V1x7Z2/kA8wnHdK4=;
        b=Kd7fBX+3ade+mKvNH9/TAouaZyZpNPh2cpgwWKQB56qsh5sRZuuU8PnOqmRdjXRCNS
         emoc5U0pzIrp8dur4VHy2dbSOwmmlBVTW1r3syWvHuRInLLffHV0BW4xPkp5MmpYfiDd
         1YcdOnrSkppPRBmZuVYmzRCJh2L2KXrkVedYQvJgb/3qfTZJX5571FNNULS8oHgQ06En
         m+v/X7VqLvh9/tHbNucYRmYtVmkh9eQ2nFEkA/m859tba8OL1qPZuCFnBGf4pF/nurgn
         1noyeY+ZeXlEsye4rrXeqvmrH/FKhvvDqwDyG0RH9ZSdBbh1FXAfk/Mke2gK6A3pDPf/
         utuA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786963424; x=1787568224; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tfXrwhUEdtSGObkxJ4yfvMMbCGkxVNdt2ypMc+rYzxU=;
        b=nOVEbcdpWCGlhabRUSQOCWqSZZEhKARMRxMMoDsCVztTc9JhkQHgtqc3WYOJHXLh5E
         kcyZ+6+2soma3YD/Ey2zubjV61T6/oXquRK1wghKSKlVpEp+q6dBbp0GCUJ7luAMHhbZ
         wPcNRTY8szAuHomZR9EHBS/0TJ6aEjHE2LwK5pNUTjThJ+qQZA6ZbAlPnqUqzJnOuYaV
         PZNPXLQLqbfgbVdD5Ev/T5ayRhkXxONRQaWXeLk8JmexCTKUSQY1cWBEQxIolpZmAu1o
         zYfM2CUo6ubGFigYhpdise+Wb8YmD/M8QtZkk9+13Nt4mFWfTPUoJ0a95XIc81nKrz7V
         0C7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786963424; x=1787568224;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tfXrwhUEdtSGObkxJ4yfvMMbCGkxVNdt2ypMc+rYzxU=;
        b=QtfuVqCJ+dkA4rGnehmp3KcvPSNc6MEewP/7MChTZiLQ5d4RQ82MNXMH4uRCBKZRbC
         H82A4VEFqd+TsHla6bnjoL1WhZgs3XxxFiQtmVm0l2qlQvu/CYtSQ6sy5reWWnbOG5SM
         y5kdv68LVTnNpGts4xrtnwuLmpYu0HBDQ2u1Cdg9jyOZBtQvfbpNGgbAC9bBEKxb6pAW
         7E+ByDubl6k3dfUZylKd+J3d44VT6tzBZi44mklq3whhN5E3PGPW+//lCViC8d6DwLT8
         GNr6Vp7VT9Ta2x/LBtEOa04S7BCqSvEXe5s+6QFYr8Xea2nL9gnjUnKVEGPp7hkbOGys
         3zzQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp993ux8R0hO29PRvG/T0e26vAY+AjFoO2aENUK+4w143iUaGe7E0R5CCpHXPRxUT1IV6h4d+PX3Uhj@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9/2XbRc5VI4oE8Y+CzqbphhLJwY3p9VbYiGK3XIFE4BeQZ3BT
	jH0cikBgRHFFA2XX4L6o6VU95+6vjb4NeY9rEPcjUAfwe5jExX3WJmoculfviWNam8YJeqWMSFr
	G5pM6LyKfeyPzjgdZGAehHNbASPymiLA=
X-Gm-Gg: AR+sD12Jm587DQQv/BEjquBTRHQxtM9/9wtkjpffR2ZJFD4RdwxG8bbL0p0gWCYEgnl
	HqW1L0siatlwyQHvEaCyw4KzNuCuHvInZQ/7mZ4AWLP7EKfNUYchbACduZ/nB3pdL1AulkuSYnM
	16Ts1DTLjws8ZZFKVvMCyTUfLLNjYmjufsLMjQgxwD3pwuAZUjoIov9EqgVcAw2KOeYjhqN3bl+
	kOiLnbcKqWT1VSpvNaBaGZtXyGsENyoOoofT9RHqGSolQsZ6JoI6QX79hrKYbplluc3FPZNQk8O
	jEO+Yh5uY0LYo0rsN+e6qDykKcZWoVbPLr3wRuhhqqqr+bvwNT7yFjc/I6g1eNpVF9oQhORI/DH
	QQ2y0ZuvSXMHOSQXPk0+xUA2q
X-Received: by 2002:a05:6512:b94:b0:5b2:a1fe:5e86 with SMTP id
 2adb3069b0e04-5b459139605mr3519047e87.1.1786963424020; Mon, 17 Aug 2026
 03:43:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <anoYr9H4KojJv-aZ@google.com> <20260814125025.90522-1-gvalkov@gmail.com>
 <20260817-hairy-serval-of-refinement-49039a@quoll>
In-Reply-To: <20260817-hairy-serval-of-refinement-49039a@quoll>
From: George Valkov <gvalkov@gmail.com>
Date: Mon, 17 Aug 2026 13:43:32 +0300
X-Gm-Features: AcwNN1Wb4hk7Y6VXWg-VU6GgBLtF3C0paYqmgk3rIoJzQ18A47YrPXh_NP66Nso
Message-ID: <CADOrJmb3uJPpYR481rB-CnL0A9B_5PQ683XP+Gdis47uihqMBw@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: net: wireless: add flag marvell,ignore-regulatory-hint
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: briannorris@chromium.org, johannes@sipsolutions.net, andrew@lunn.ch, 
	francesco@dolcini.it, johannes.berg@intel.com, kees@kernel.org, 
	miriam.rachel.korenblit@intel.com, wenst@chromium.org, 
	rafael.beims@toradex.com, avraham.stern@intel.com, error27@gmail.com, 
	s.kerkmann@pengutronix.de, gregory.clement@bootlin.com, 
	sebastian.hesselbarth@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, Frank.Li@nxp.com, chunfan.chen@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 17 Aug 2026 at 11:54, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Fri, Aug 14, 2026 at 03:50:23PM +0300, Georgi Valkov wrote:
> > WRT3200ACM and WRT32x routers always report a fixed US regulatory domain
> > from the mwifiex ROM, which conflicts with the platform regulatory
> > configuration on units sold outside the US market. For example:
> > - phy0 mwlwifi 5 GHz, hard-coded region 98 EU mapped to FR
> > - phy1 mwlwifi 2.4 GHz, hard-coded region 98 EU mapped to FR
> > - phy2 mwifiex 2.4 and 5 GHz, hard-coded region US
>
> v1 as reply to v3 in big thread. How tools can parse that?

Hello Krzysztof,
I apologise, I forgot to add the v4 tag to the subject.
I have documented the changes between each revision.
I saw my mistake after sending the mail. But I wasn't sure
what to do? I will make sure to add v5 to my next revision.

> Does b4 diff work?
>
> b4 diff '20260814125025.90522-1-gvalkov@gmail.com'

What is b4?


> > When the system boots, it detects a conflict between the user selected
> > region and the radios, e.g. BG FR US, and applies extreme restrictions,
> > preventing use of 5 GHz and DFS channels. This also affects phy0.
> >
> > Add a device-tree flag, which allows affected platforms to ignore
> > an incorrect regulatory hint from ROM, so userspace can set the
> > correct platform regulatory domain.
> >
> > [1] https://github.com/kaloz/mwlwifi/issues/173#issuecomment-307879699
> > [2] https://github.com/openwrt/openwrt/issues/9956
> >
> > Tested-on: WRT3200ACM, OpenWrt
>
> Not a valid tag, drop.

I believe the tag is helpful because it describes that my changes
have been tested on a certain device and platform. It's a common
practice in OpenWrt contributions. My last two accepted patches
have this tag. Should I still remove it?


> And you cannot even do that, otherwise explain me
> how did your device execute THIS (exactly THIS) code?

I am not used to your terminology and this gets me completely confused.
You have not quoted any particular code change, so I'm not sure what
you are referring to. Here is a summary of the patch series:

Patch 1 documents a new flag: marvell,ignore-regulatory-hint.
Patch 2 adds a device-tree node with the radio and the flag.
Patch 3 skips the regulatory_hint() call when the flag is set.

> > Cc: stable@vger.kernel.org
>
> Drop, what is the bug being fixed here?

Without these patch series:
- all 5 GHz radios are unusable and DFS channels do not work

With the fix applied:
- all 5 GHz radios work correctly, the platform is allowed to use
  the correct regulatory domain for which the device is certified

So this is indeed a bug fix and a very important one too.
I thought the commit description and forum links make this clear enough.
I can send more links if you wish, or just search: WRT3200ACM DFS.
There are endless conversations and many people looking for a fix.

> Anyway, property looks like SW choice. You must describe hardware
> instead.

I am sorry, I do not understand what you want me to do?
Can you please send a diff or a clear description suitable for people
who have way less experience than you?

Georgi Valkov
