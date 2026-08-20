Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B85F3B19AA
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 06:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787208190; cv=pass; b=YB/VaiICmsGYIP7wMpbA/UzIKaibabDN9nnHYQKwTW2KDS1Huvc7PcrBTkSQqY/kmszUoOlFxwe0Wlc6VibP5PXdkgMIOjpcrtO8hxbKE6w8aSCq9RdepVr3/FzmapkP7svUmIEMxrSGvXgjNIOFRLzRS9jWxzUbZtXYsIAaqHg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787208190; c=relaxed/simple;
	bh=KfruKuf3bq97mGd1z4GYf0eUtHQK8orEQIL/xa/xHO4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e4CHikYMXnlGDlyDobA+un6mUfnkn6Q8lVBJCquvmMI6R7h+OxcWDs/t20oSeQL7tNaBZldfCMZ83n7gDuogLV42gfTyCwGbOEcK2gU3LSirQqCUX4YgIB1kdovwHmAQzB+vPGPSpREAAv6SHKIKCdAR4xZlXrKCBfSqamnutVM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Tuml5VvA; arc=pass smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Tuml5VvA"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-66c744a00edso1731631d50.2
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 23:43:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787208187; cv=none;
        d=google.com; s=arc-20260327;
        b=NoPOqa8bkGjqq7c5ZkMUd3UzYAGOs92st+k5f/k43eP8ZT9TptPDd0WM1QRIIfWynL
         Wg1IXHxknhWwwT3uH3TwFSP1RZuSvbWbb/JGJGspdqS27T1vokjQ+nIj/Xh5rJ1HRi1b
         1IMkfBAJykq5Kwzz9LO4U/D/hhe9almc4tcz+SZHzDZ7x5nj5Vp9tw2tf8FRMjX/EPQY
         ODWcn51sayhqZaAfA+ICNdqZfyG7P+qQw9P06LBM1r9i6cFj/lb1Hj2i3WwWm9XDh0nO
         v148Cy1dVSKENeMQk5NBLnz2XLm9TxauN0XR8uIR82/vwzyLqfANMiF/1UEXqNeKaZPv
         9fDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5DS3txWmnShWeOSkYZcCOb4QBbjc4rEfH1Wqk5hfTNM=;
        fh=kNOL6rcGhLLUJ1++jkpRLFdZEpEWQ+Rdh4rhvgb0jXQ=;
        b=QraeLtazNoWcUxLnpfV0lwEeysIy5szyx2kue5eVJAsh9VApFYTVQ/XZMjSa+qwP/O
         gW135Tbx8wfMeM4vLov6GxbpMh7oNDB8hXFAv8EzuiviXW4xsBWHniO//M8ACb+DHVmh
         xejZDq+bTP0ZPGPHUC3RA2zid1VTwAtvgL21iKu14JXkUdmltCD8Avn5bXCl3YjYwHY3
         AEJNSX6X9ITvY0Vhf4CupRdARrG23Y/UXlvrAHRVf5+D4yQywCq1IcwpbFEfzFaVpQZ5
         2wkVGn7xEYEbH5VXIDqmYES18FQlma1WXE7VmfQjw2y2qAbNQ1ZNjHieeEGrdKZwmJ2U
         yM6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787208187; x=1787812987; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5DS3txWmnShWeOSkYZcCOb4QBbjc4rEfH1Wqk5hfTNM=;
        b=Tuml5VvAkg0vtzDR7gQRKiTkdFzTbCyo++ZzrWv2tPqDzIn/VZmIAzls4ww8kbBjr1
         gBZZm0eosQqTupPf7Ne0IoH+v9wyGqvHXjwurr98hqqFDcoiz1om5xVcv7E0VUAynroK
         4BOcRbDBdjzFXQRStUJZoIyKi5R5esFpE+Hd4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787208187; x=1787812987;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5DS3txWmnShWeOSkYZcCOb4QBbjc4rEfH1Wqk5hfTNM=;
        b=Hpft6MY9K5lC9OPw/w1DVkIsEoWthIGyhDZRPN4T8NYNpXo6CMUHZx/6GzM0P05SbV
         BrpuDjDkn/S34u8sMhTmj6D5zUKfbSk1dx1YBBCofrPNs08P0Rg0O1s8aMh+YY16ZXrw
         ntrbUUSDdglLLN/xaqJdVoTN7D6mutywCjrEpY8QHMax/ayefHD2jjY+7ivyj9mZTvfE
         V2a8Wx7umFK/bSvPvqn7PfBarfJhkHmp4W3mv6RTcpZNURdssqYgJ2V/BlZCdEKsnDSP
         xKS28xWdTlNEqpN8rE16Xv0HPObmqqk0PmPUnaAtqrIoFsXi5iicGy/HCWqGSd3nkjWl
         xj5Q==
X-Forwarded-Encrypted: i=1; AHgh+RoiXOSTbCT1ijGS8m3+khzHS5mjU8MHNNmiUwgwReGiIY1tJ3VXNudgxQPUkjCu/9otk7/K080rzq6z@vger.kernel.org
X-Gm-Message-State: AFuF++mWl8QUpEAFkh9WZaNgAwjR0Sx9qWZLCwyMNGUKBwk4UHIvd3mq
	3ye6yjz34tJh6EYMKVNruDRduTXQDLATBEomT7fDKDpP24knjuTM3+HThO3+vih37rLPfmfF+Q2
	3j/XhSYx42l5+VvK87+V8aLss65VZFIK223+09Lfq
X-Gm-Gg: AR+sD13DA12OnDi8N+qwFlqjQ3CpJOVF/0PjIUVIE8XJ03ShgXFVhJi4IAeKExpYAKL
	hB3kV4YS9vPHpgrrbv0Gtk8IpowULOGN+KW0ytq9NowejLyQppcUldpLJinZJzbnJKWVymvMuNk
	aD4JuGOjol9TwDQmcMoaIhu4CrNISWSyQuyCHZci+enRyxHbwm+32ZUiUu41cW0e9LHgQSAOuYf
	pv5N36eLVDR9J/XdG9MSlFA/ypt8PcOf2hASISso3zf2BOIGQU8ifL2174jE5ysYSY8tVJDbzdk
	Fhpy97feAMKaWNFbHRCWPZCcHHvXqWhZhBA0B5jQcFY1W77HY/j7c6xtHSKUKPuZGcyv1ptgwo4
	=
X-Received: by 2002:a05:690e:161b:b0:667:debe:494f with SMTP id
 956f58d0204a3-66ccb6baa16mr2792320d50.44.1787208187320; Wed, 19 Aug 2026
 23:43:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CADOrJmbTyrGGkq+9OJDXCgTa2HvNo8BWxoE6yjafcrOq7WNamw@mail.gmail.com>
 <20260817215428.84740-1-gvalkov@gmail.com> <20260819-generous-nickel-dalmatian-b6bb08@quoll>
 <CADOrJmYfBe3ADun_kFjFSH6YOSTX7Vu3UsFsL57yuRdaQ=eJCA@mail.gmail.com> <e554c007-67e3-4fbf-b85e-5de02f649e83@kernel.org>
In-Reply-To: <e554c007-67e3-4fbf-b85e-5de02f649e83@kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 20 Aug 2026 14:42:56 +0800
X-Gm-Features: AcwNN1VnLR1aHYarg7cpxijdC4GmIDA-AAePy3yNd-kTz7zpQyFEH66e6jDxZZE
Message-ID: <CAGXv+5H7AhZgZ06r9KO3HLZ9Cymkai+Cv9SgVTuSC1PjgGf8hg@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: net: wireless: add flag marvell,ignore-regulatory-hint
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: George Valkov <gvalkov@gmail.com>, briannorris@chromium.org, johannes@sipsolutions.net, 
	andrew@lunn.ch, krzk+dt@kernel.org, francesco@dolcini.it, 
	johannes.berg@intel.com, kees@kernel.org, miriam.rachel.korenblit@intel.com, 
	rafael.beims@toradex.com, avraham.stern@intel.com, error27@gmail.com, 
	s.kerkmann@pengutronix.de, gregory.clement@bootlin.com, 
	sebastian.hesselbarth@gmail.com, robh@kernel.org, conor+dt@kernel.org, 
	Frank.Li@nxp.com, chunfan.chen@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 19, 2026 at 8:27=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 19/08/2026 13:42, George Valkov wrote:
> > On Wed, 19 Aug 2026 at 12:42, Krzysztof Kozlowski <krzk@kernel.org> wro=
te:
> >>
> >> On Tue, Aug 18, 2026 at 12:54:26AM +0300, Georgi Valkov wrote:
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/net/wireless/marvell,s=
d8787.yaml b/Documentation/devicetree/bindings/net/wireless/marvell,sd8787.=
yaml
> >>> index 930b700b73d0..5f235cb9f3e5 100644
> >>> --- a/Documentation/devicetree/bindings/net/wireless/marvell,sd8787.y=
aml
> >>> +++ b/Documentation/devicetree/bindings/net/wireless/marvell,sd8787.y=
aml
> >>> @@ -59,6 +59,12 @@ properties:
> >>>      description: Calibration data for sub-band 3 in the 5GHz band.
> >>>      maxItems: 502
> >>>
> >>> +  marvell,ignore-regulatory-hint:
> >>> +    $ref: /schemas/types.yaml#/definitions/flag
> >>> +    description:
> >>> +      Ignore an incorrect regulatory hint from ROM,
> >>> +      so userspace can set the correct regulatory domain.
> >>> +
> >>
> >> Same comments, so you just ignored entire feedback?
> >
> > Do you mean this feedback? I already replied to it:
> >>> Anyway, property looks like SW choice. You must describe hardware
> >>> instead.
> >>
> >> I am sorry, I do not understand what you want me to do?
> >> Can you please send a diff or a clear description suitable for people
> >> who have way less experience than you?
> >
> >
> >> Again: you need to describe the hardware, in commit msg, in property
> >> name and in description. You cannot tell SW what to do, that's not the
> >> purpose of bindings.
> >
> > I still don't understand what I should do?
> > Can you please show me an example of the changes you want?
> > Else I'm likely to make a wrong guess and implement it. That obviously
> > won't help.
> >
> > The commit message already describes the issue with WRT3200ACM and WRT3=
2x.
> >
> > About the description, do you want me to do something like this?
> >     description:
> >       Ignore an incorrect regulatory hint from ROM,
> >       so userspace can set the correct regulatory domain.
> > +    WRT3200ACM and WRT32x are known to need this.
> >
> > About the property name or flag, do you want me to add a separate flag
> > for each affected hardware device?
> > - wrt3200acm,ignore-regulatory-hint
> > - wrt3200x,ignore-regulatory-hint
> > - the list may grow if someone decides to add other devices
> > - and the driver will need to support all of them
> > - that doesn't make sense, because it isn't scalable
>
> You need to describe the actual problem in the hardware or firmware, and
> then name the property and description accordingly. "Ignore regulatory
> hint" is clear instruction to the OS what it should do - ignore the
> wireless-regdb package/instruction etc.

You probably have it backwards. The driver is taking the hint from the
hardware ROM, which is fixed and thus wrong once someone carries the
device to a different country. I.e. it is a quirk saying the _hardware_
region should not be used.

Whether one should override the certified settings, or be able to do that,
is a whole different discussion.


ChenYu

> >
> >> How did you fix the threading problem I mentioned in v3?
> >
> > How can I fix a threading problem?
> > I don't really know what the correct thing to do is, once I forgot to a=
dd
> > a version tag in v4. So I just added v5 in my next submission.
> > I'm new to sending mails using git. So far I've learned that I can do t=
his:
> > git send-email --thread --in-reply-to=3D<Message-ID> =E2=80=A6
> > and I use the last Message-ID.
>
> Do not attach (thread) your patchsets to some other threads (unrelated
> or older versions). This buries them deep in the mailbox and might
> interfere with applying entire sets. See also:
> https://elixir.bootlin.com/linux/v6.16-rc2/source/Documentation/process/s=
ubmitting-patches.rst#L830
>
> Look how correct thread looks like for v37:
> https://lore.kernel.org/linux-devicetree/20260819-imx-se-if-v37-0-5ef5de9=
ff1dc@nxp.com/#r
>
> Look at this v5 thread - it is one huge chain:
> https://lore.kernel.org/linux-devicetree/20260817215428.84740-1-gvalkov@g=
mail.com/#r
>
>
> Best regards,
> Krzysztof
