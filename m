Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44093D648C
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 13:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783084709; cv=none; b=t5+IQVQ3jJgFkVfwMw86EjWErgr8U3hG1cm0hNzLmx8UU+PnaoM/HLg05DOf4haIzJTv8RX6Z/5EWsWffmRgo9TFFmTCwztfZbIbGkMwiEl6I1hXLoRB5/ZNl8hNQWSQN18KjqX+GGcucXA0R8s3gvuxnWBlCGbRzfFIEIr2Ok8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783084709; c=relaxed/simple;
	bh=9L0/uB6Gsh2WFeSkmmU3h8J0rHkOmOpn4iPX3EYXWqE=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=blVzlfbl9RXcpPmBlO3oc2qZa3zU4hJNGHFMIv6Yi0PX4Aj8/x1f1izydm23MN9dqc/eJ2E6LkfyoHZUfx3mB7szvtWv8lU8X3+GkG2r2HY4y0Vw/0Sm7bAc3tAuupxaDqak5I2wq6bDKRra3a2wOTyF5H/RI6g+yhtUJRl7s/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YRosel6D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YRosel6D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60AF31F01561
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 13:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783084707;
	bh=9L0/uB6Gsh2WFeSkmmU3h8J0rHkOmOpn4iPX3EYXWqE=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=YRosel6DL0wuQ3cHV1RuS0LWqVF+wHgTey96RxdDguwdPWjCPEmcEVNg+3lzchLpF
	 zJCz1r0N408OKfSTBpp7ZdSs+pf2uYqFlvo2dUnXNsc0Byhdc5f+aYJfBDo1iNWHFu
	 OulZtD74u1SUNB8QRx6Cnt1C8tT9+cnei7CZCFl4mnrsJfK714jaFqEwg/LVjFvK5G
	 Ntg1aPssH7xYyguGcG04IeAkND81Ssy/v6w5yMIlarZYEDMoyoDy4s6+A7xbpEYTC3
	 FwSD46lNWA/TMorv7nj4uXce+jiAewdndoZqXVCtpZ+SwvgwJOcY0AFbpeRwguulRi
	 C6mUoCr4o8sIg==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-39b1f588471so5160981fa.0
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 06:18:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrrngaeCYRIO0hVv7gZ/k+WhndVCFFOKaAbV4fTddkWvXprRhARyJQcnlE19lh+VHekmJUcKSABYRmM@vger.kernel.org
X-Gm-Message-State: AOJu0YyPBwNdgX/m0eWYqBs3X3DTvtaeG/Xz2mCin/GLGxNrsGM55Lv6
	mzVyjFCYBuFqtesj7b97lzjjmOdU6Tj+25r8LB5gEbDQW6tQSiD/EVPR7VJqzDWf67gwwHUlRiO
	Pla/ga+wfBGgBka+5qhXvv7vcvAR5f2iYR08I1zQ74w==
X-Received: by 2002:a2e:a907:0:b0:39b:100e:a582 with SMTP id
 38308e7fff4ca-39b34102a63mr21058111fa.38.1783084706034; Fri, 03 Jul 2026
 06:18:26 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 3 Jul 2026 08:18:25 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 3 Jul 2026 08:18:24 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAGXv+5HMVaERvte8YJDJ0fq0zoMvO7-7caAGQhsAB-9sUHoGtQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260703110317.1283411-1-wenst@chromium.org> <20260703110317.1283411-4-wenst@chromium.org>
 <CAMRc=MfPC=Jm6RFkCYG6vsYQiWHxBeNq0L59rwahF_6Fu2Ledw@mail.gmail.com> <CAGXv+5HMVaERvte8YJDJ0fq0zoMvO7-7caAGQhsAB-9sUHoGtQ@mail.gmail.com>
Date: Fri, 3 Jul 2026 08:18:24 -0500
X-Gmail-Original-Message-ID: <CAMRc=MdO-9qd2-YqaCusAtYB1qqGezs5vzAdaf+Jrxv+namYng@mail.gmail.com>
X-Gm-Features: AVVi8CdQC2c9zpmPe432u2VDpFaMO7YKToWQLqvYb4D_WqYuh_dkKQK1wPiDll4
Message-ID: <CAMRc=MdO-9qd2-YqaCusAtYB1qqGezs5vzAdaf+Jrxv+namYng@mail.gmail.com>
Subject: Re: [PATCH v3 03/13] power: sequencing: Add pwrseq_power_is_on()
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Manivannan Sadhasivam <mani@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 3 Jul 2026 14:17:19 +0200, Chen-Yu Tsai <wenst@chromium.org> said:
> On Fri, Jul 3, 2026 at 8:07=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.o=
rg> wrote:
>>
>> On Fri, 3 Jul 2026 13:03:04 +0200, Chen-Yu Tsai <wenst@chromium.org> sai=
d:
>> > The power sequencing consumer API already does power on state tracking
>> > internally. Expose the state to consumers through pwrseq_power_is_on()
>> > so that they don't have to reimplement it locally.
>> >
>>
>> They wouldn't be able to do it as the field is private to pwrseq core an=
yway.
>
> Which is why a helper is added? Note this is returning the requested stat=
e
> on the consumer side, not the actual state.
>
>> In what situation would consumers need this? Typically you know what sta=
te the
>> handle is in if you control it.
>
> Mostly just to avoid extra tracking in the USB port device. For the hub's
> port power feature flag, the hub driver actually queries the hub for the
> current state; no in-kernel tracking is involved, i.e. the consumer doesn=
't
> actually know what state it is currently in.
>

Fair enough, thanks.

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
