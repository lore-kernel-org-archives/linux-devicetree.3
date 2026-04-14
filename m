Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F0F3D5225
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 10:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776162563; cv=pass; b=TwgOpG/qVk1XVTgCFyYsb60lshNqEZeDUP6PVBz17ygaQi6MMarvNufmAhHTHg1MIRWyTsnPHRvd0S2Pu8D0Yh8W0oIG3ixs9Vdf9P46p2VYTqxbYDgGAmPot/A6aSIdNsWhMi7KJ2gJu2v6mR62fkP3wim7FawVWv62nTeAv8I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776162563; c=relaxed/simple;
	bh=Ido82lTsBObPiLyE+cnbnYTa5RnXovthshiMl4cqqxw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LfvLuXxA6dKwlJomwLcA2lCp7QAPxfTTXqh+SfnS633hD/eXqu0UgDrGh8dUNypmTn3Q6asDGg4YUMQU6HSEkoHol8hNhs5PwrFCEcBTlUgxEwP2JgLZQcX3RKS02Ib3max6THdPVf0mCblo/fRYq7Oms9LspO2XfD7gsSKACv4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CAg1W+YC; arc=pass smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CAg1W+YC"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-59e4a04f059so5019103e87.2
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 03:29:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776162554; cv=none;
        d=google.com; s=arc-20240605;
        b=XRnhOO84KPxdEcUIdgZyyxXVOB6DOH3RrwN1CVYxdINfXNTzgMcSt+A18/d4UUyJzr
         LTQMtnIRnZiLLuaJWw58+OdCzxzGiJh6Z/i5SD+ikjmQfmNojOwQoYXJV2k8ZjjgQCok
         xNWS9I89H9ZxNKjGosX1KiqJ0jx0HUaNAgImpnqH+zY5qPW0tOuGJndeo/N8+wZ24y1m
         lW/j45npnqhXyurhRnkjiYC51qn1QEkdiV5sL5OKb7wSDd5cPB3SvBRle4MlLp1rEc9V
         0UKRKYaYFkYHrOyuw6st3wuwy0uc/SbSlGPwvd16IbZZ4j/eOHGoZv1k7s3neXRzYLHz
         nzqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=obCwu9OJRNTUN7BsZbzZ8PH73jQ+TTI+BXXfuHZowXE=;
        fh=T/Y6Vu0OhEMju14XCZBJssddhZBO3tSAGoRutSlQx1I=;
        b=TcRoNflyqSYCG+Xtv4Ex7T8PGnaBs3BbwjAw/R6lRpVTnklnK8EZAptNa0iBAL2LQ6
         cgV8u2IQQweBujKeZlqcADV0J85bPheSqWsjM5nJ0CYVdDBdQk8VrIbtTs72fqaubXZg
         8IULoY0uJl2fv+ZzLee0Vtm+HHZIuu2ZofRDzuHNh0lFWvd2tuS0xTIS0PIWEA645H3W
         8DfjrZJk8g/svujQlsHuziQiV9qQug4Q9JKh7kiWzhaWWqbFNyI//osvhI+iOArhEPj+
         +tQJy5Drr8yxtM6qUIt5qCtgVg/qayZQxzDxNQhyw2UD8wTWyiJC/bqZaqKPRK+/L3Ww
         BH+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1776162554; x=1776767354; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=obCwu9OJRNTUN7BsZbzZ8PH73jQ+TTI+BXXfuHZowXE=;
        b=CAg1W+YCDWa+7hMyoFTX9wrJnea3anbAiHdxWmpDFPNhe7kCyRPxDRCs4+n9KcUSjl
         w6nzvTJigwS7oM6UFv5A3HKxmii0VyJz1d3VSyhkRHh9KbLCHy+zvkfyRpySbb5xZhZu
         JuL3QYV3wyDOI2wfxl8ehTcAnuZZDMlWKsh4c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776162554; x=1776767354;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=obCwu9OJRNTUN7BsZbzZ8PH73jQ+TTI+BXXfuHZowXE=;
        b=o9NeMiZ/bo+uorYchFHoJ2WmiO2lo1ykZIrFfIrU9k9xz+moeN5lGAtREJUOVPni7I
         vFl+9mK9I5J/LwkLT6KADhvn1yY9fgPlGppbDnms+XdUgByi3SaPfY3LIOBYM3YkRxBQ
         u1HHjoDt4+ghsOzbsrtyz9Ek31oD3b5iaYkgPIssBA66+2MJC3I+D1P7/FfPZwJKOrWx
         0gvORlQkV+TZzPgSZW5zXKEXo1lq0GDngdEc92BGbh3Y/s2ba0W6E85I01nw/uQkCrlZ
         N9nKBn6LE/6hfGPv5LEjG6oWxHsaKED94lh9shkgAE5NjjdvB6H7waQCzeCD+/+5uIiE
         VEbw==
X-Forwarded-Encrypted: i=1; AFNElJ/3QczfS1J/XLeY7ofJxOEdS6Ny2ryU7shZjGgLpLbJaT+l/7Ozv8xIiUjBdJX8Gi9TOtQYe2WII+6L@vger.kernel.org
X-Gm-Message-State: AOJu0YzKxWzourr6ZSQc0PMAbLBZuz8dVSqh+ld9eczfj977wJ2YvBCg
	9RpbQ61du6K99jKo/+SfChLmO9yRc4570vi00sn4YvZKpEYDSeKsW0sD2pzR3//xIQmLWR29pt+
	cxgSi1ndbce1Si7wH5Phgk/MTM/S22n/WLeVT2VYn
X-Gm-Gg: AeBDievOyKurQyE3G29JF34N/rEnd4yFGtcaJWSxgTejtTW4W7MpFoKQ/8Np1B90k+s
	BWy4YpsI7wP/NOVpe/P8JTveQXOZO15PjMLAykTpJhaZjoefl6lADmH1U536ld7wkoAxiYUqXue
	AFaUeJ9svN5IYXTuliaqAgyO3NBKHAyyF+9ZDkvL8+xrzl/EmpBi+RZzwITU2W8BpRcNMAgnAxl
	PZGPMe1DdhxizTJyCXm5VgOMnwK2zwuSD62sZXzGJastTTDeloIfOKWaKZ0tiGcmKdqrMoL1oSH
	Ht9qFpl2qhc6djSaFmV6vnICIj30F8xCPs3MhodElowVV7+9
X-Received: by 2002:a05:6512:68e:b0:5a2:ae27:c879 with SMTP id
 2adb3069b0e04-5a3efd7f0d8mr4850095e87.29.1776162554447; Tue, 14 Apr 2026
 03:29:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326-pci-m2-e-v7-0-43324a7866e6@oss.qualcomm.com>
 <20260413075459.GA2626902@google.com> <fpcs4p62f35a5qyqwgm5ysa73stbysxcr62tkmmkrrcvsuf4t4@4ivukyqjey57>
 <eeytuhqpgdz4do4tgtbmfntub2femtyq7bij7svhodpyjwaylx@j3gmvq2a2zqc>
 <CAGXv+5E=tujhtZjwi6Qm7hk3Ks74UzTQHWq82NiTEw1+vYod5g@mail.gmail.com> <ad36pIu-0dutL7Nk@ashevche-desk.local>
In-Reply-To: <ad36pIu-0dutL7Nk@ashevche-desk.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 14 Apr 2026 18:29:02 +0800
X-Gm-Features: AQROBzDHB_HCwto4iaprIWgL7mrQWt62yIrtGAtxckKlX4EUkJwTT3ZqPu-YslU
Message-ID: <CAGXv+5EGe59nJctLweEdZjb3MNmMvjuCHngGSfptzN985OiLdg@mail.gmail.com>
Subject: Re: [PATCH v7 0/8] Add support for handling PCIe M.2 Key E connectors
 in devicetree
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Bartosz Golaszewski <brgl@kernel.org>, linux-serial@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, linux-pm@vger.kernel.org, 
	Stephan Gerhold <stephan.gerhold@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, linux-acpi@vger.kernel.org, 
	Hans de Goede <johannes.goede@oss.qualcomm.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 14, 2026 at 4:28=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Apr 14, 2026 at 01:03:19PM +0800, Chen-Yu Tsai wrote:
> > On Tue, Apr 14, 2026 at 12:08=E2=80=AFAM Manivannan Sadhasivam <mani@ke=
rnel.org> wrote:
> > > On Mon, Apr 13, 2026 at 07:33:12PM +0530, Manivannan Sadhasivam wrote=
:
> > > > On Mon, Apr 13, 2026 at 03:54:59PM +0800, Chen-Yu Tsai wrote:
> > > > > On Thu, Mar 26, 2026 at 01:36:28PM +0530, Manivannan Sadhasivam w=
rote:
>
> ...
>
> > > > > - Given that this connector actually represents two devices, how =
do I
> > > > >   say I want the BT part to be a wakeup source, but not the WiFi =
part?
> > > > >   Does wakeup-source even work at this point?
> > > >
> > > > You can't use the DT property since the devices are not described i=
n DT
> > > > statically. But you can still use the per-device 'wakeup' sysfs kno=
b to enable
> > > > wakeup.
> >
> > I see. I think not being able to specify generic properties for the dev=
ices
> > on the connector is going to be a bit problematic.
>
> This is nature of the open-connectors, especially on the busses that are
> hotpluggable, like PCIe. We never know what is connected there _ahead_.

I believe what you mean by "hotpluggable" is "user replaceable".

> In other words you can't describe in DT something that may not exist.

But this is actually doable with the PCIe slot representation. The
properties are put in the device node for the slot. If no card is
actually inserted in the slot, then no device is created, and the
device node is left as not associated with anything.

It's just that for this new M.2 E-key connector, there aren't separate
nodes for each interface. And the system doesn't associate the device
node with the device, because it's no longer a child node of the
controller or hierarchy, but connected over the OF graph.

Moving over to the E-key connector representation seems like one step
forward and one step backward in descriptive ability. We gain proper
power sequencing, but lose generic properties.

The latter part is solvable, but we likely need child nodes under the
connector for the different interfaces. Properties that make sense for
one type might not make sense for another.


Thanks
ChenYu

P.S. We could also just add child device nodes under the controller to
put the generic properties, but that's splitting the description into
multiple parts. Let's not go there if at all possible.
