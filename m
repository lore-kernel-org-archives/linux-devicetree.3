Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EEF3358B9
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 18:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774375460; cv=none; b=oEaRaWCorrrNPpmcjFwa0A6K+LM+GtETAPDHB2yBpbdeMMPxFTuUw9zXpyvChZWbk5rwB/FFEISIuFPp2qagBzrPgjSfIWGDXpk1cf7xtPCqCGKyy6yF9jp5B7905WaB6V+cxYPpA+3jIOR0i4AwA05OIU7aT+70f8oAJ6wKEwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774375460; c=relaxed/simple;
	bh=DqpRarMkcjYJnQFn7d42wtThvbJ7HIf2d50RwTXnK58=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OwWdv+49eU7RzkFTGqr9DvHdiQ1Qm8ARfpGrF7byG79dFE81aeRk3g1rfJBB0A0WQtJU+laivbpmq37rMM0SsdF987n8WdPJ3/7REXttt6Agj8t8h/5+hpAk3MN8/8saiKrOAmmfnNppdAn7PacNwqNvro2x56nDPIpOk1SQ4p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sirat.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sirat.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-78fc4425b6bso18499037b3.1
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 11:04:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774375458; x=1774980258;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DqpRarMkcjYJnQFn7d42wtThvbJ7HIf2d50RwTXnK58=;
        b=Cqs8C4MSn+YclBbkKVcVhTQdG/uncbema88f0f4pK17e4/qLP6BAEW8SvY/80qBP3b
         b5JG41Fq0/PAgTlD5rFCEeZG+SzgKnrsXSSKcsr2vta9Xo8dBj+EzgYL06tRDmbz25mC
         pXkKPgMQzvsRHEWRlm8I7DKgT1UghCLoepc78gR8A1CIm3WmIF2krxcxVbx41k+E3MpA
         f6iYeiRfK83MKxzxlkH4r0qEEIQKxm3trtYx9sBQURHHX82e3MCXZqPOU6TXv1a9HMdN
         DH000DYcyTFkNZ+1Uv7HRJVX85u86TBiDXyPM+yVw90wo7uYKVZ8IwnEbgTnO9+v+GTq
         sM5A==
X-Forwarded-Encrypted: i=1; AJvYcCWpljkUwFRZBM9TmmoSO10fLWcXHOl0UcjcmyfZBOz8MZeQQwauJlrDTQ4vrHB8Qc9EVVzrGdpZqVie@vger.kernel.org
X-Gm-Message-State: AOJu0YxbxoO1+MSYhjkyej1vfsmJo3EDR72KJqWdyRmjQnAvR+Zyamem
	NMHMEuooYoNv8rxfQMOOMylU/SRwzj26WHILk2wefvBNTI/+78kfpKLk1RyG7Amu
X-Gm-Gg: ATEYQzz+1cAYH9RSHkX1GhRUvG/n0qVGZZHfBZFuNvCS/5cs0PlRaH2ofBWXtRV9Chx
	6LjMimUa8YBGchrSq8AN6P4D6BVmED8LUiOnNrk4VpOe6PfmcEu2/YWL5xinM4HtrscIh3DAb3u
	xK2uBemxrEjUtXL3+jVpss8H5W+tpGrud7dPrMo6sf1exYDvrgUAVSajljTdwbtUuWm2z4wESn6
	R5PVum45zq0vokVDIsZO3EEAei4EPXdErUQIiCZBw5Sy35VTKz2dkY5N+YtrPt34oIqbnDeLHi3
	apKhMgAtmixaU16Sf2UE/klyoAjaMs3db2W1um8GCewk5hGb9zmNP0OIzhlbsPs6wbxadRH6BUG
	2Kl9+KcudnlxZblfM3OQ9S2u/kv4UVW5FUeQLdR1yMM/KHuV0+JoBtMz72vLOOtkV6uGEPmRFhv
	cQ5zOF/ot+PGGlv8kTQK5szx3oe2w5PW97RnpAIGJAMzW5IerMcx/f2T4RiUX8v+hFKLpcGxs7Y
	9MTVB0mCukJRBRnsT1/y3ZGD/i9CwKplgzXLm83jQ==
X-Received: by 2002:a05:690c:6b12:b0:79a:8e1f:25f5 with SMTP id 00721157ae682-79acf6d0aebmr6926377b3.47.1774375457959;
        Tue, 24 Mar 2026 11:04:17 -0700 (PDT)
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com. [74.125.224.41])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a90580d7csm75038927b3.37.2026.03.24.11.04.16
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 11:04:17 -0700 (PDT)
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-64ad79dfb6eso2104805d50.0
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 11:04:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUs95RlO5tS+f1P7XKuXhrF8zmQGdE37NJ88rR1cT0Px30IJtlR4Dk2lMUKPOCR4FUsAKlIR/DKZBwW@vger.kernel.org
X-Received: by 2002:a05:690e:434d:b0:64e:a30f:e67e with SMTP id
 956f58d0204a3-64ee6166545mr392009d50.67.1774375456606; Tue, 24 Mar 2026
 11:04:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319190738.151614-1-email@sirat.me> <20260319190738.151614-3-email@sirat.me>
 <8502eb51-53c9-4f1b-92d0-21b06fa4802e@baylibre.com> <CANn+LWJEJJoGQU7p2P2GrOcA_g2x7jEnvjcTJYG1hDRUnRw3UA@mail.gmail.com>
 <b1da32d2-e1f7-4fea-82a7-a40e8073a100@baylibre.com> <20260322110319.7d7558f3@jic23-huawei>
 <CANn+LWJwPUiCkz_godEeBvZnXEXzNmCW_-ou=wHL+kjfn0zF_Q@mail.gmail.com>
 <CANn+LW+OPP2riP1d=zZKz8MnTk2yo2CL3qn17_LYD=1SmCAQgw@mail.gmail.com> <c1d99a64-ea4e-4cd5-9b1e-0972a5e0d61c@baylibre.com>
In-Reply-To: <c1d99a64-ea4e-4cd5-9b1e-0972a5e0d61c@baylibre.com>
From: Sirat <email@sirat.me>
Date: Wed, 25 Mar 2026 00:04:05 +0600
X-Gmail-Original-Message-ID: <CANn+LW+aUhGRMJUmZ8um2uf=a+b1sUx7P3nruxeUbK7Z9ezOFg@mail.gmail.com>
X-Gm-Features: AQROBzDXT9oI5nYjcAVZ-dcUoSSKziBDDF9I0zkXnoSwc36QQZqLk-uB4ApvdCs
Message-ID: <CANn+LW+aUhGRMJUmZ8um2uf=a+b1sUx7P3nruxeUbK7Z9ezOFg@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] iio: proximity: add driver for ST VL53L1X ToF sensor
To: David Lechner <dlechner@baylibre.com>
Cc: Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	nuno.sa@analog.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 24, 2026 at 11:29=E2=80=AFPM David Lechner <dlechner@baylibre.c=
om> wrote:
>
> On 3/24/26 10:17 AM, Sirat wrote:
> > On Sun, Mar 22, 2026 at 7:52=E2=80=AFPM Sirat <email@sirat.me> wrote:
> >>
> >> On Sun, Mar 22, 2026 at 5:03=E2=80=AFPM Jonathan Cameron <jic23@kernel=
.org> wrote:
> >>>
> >>> On Sat, 21 Mar 2026 19:37:58 -0500
> >>> David Lechner <dlechner@baylibre.com> wrote:
> >>>
> >>>> On 3/21/26 5:39 PM, Sirat wrote:
> >>>>> On Sat, Mar 21, 2026 at 11:09=E2=80=AFPM David Lechner <dlechner@ba=
ylibre.com> wrote:
> >>>>>>
> >>>>>> On 3/19/26 2:07 PM, Siratul Islam wrote:
> >> ...
> >>>>
> >>>> If you do a buffered read, which stop ranging when it is done,
> >>>> then how can the direct read work after that?
> >>>>
> >>>> Can we just start and stop ranging momentarily for a direct
> >>>> read?
> >>> If the latency is high, then worth considering whether autosuspend
> >>> and runtime pm can help. That way a burst of reads will see low
> >>> latency after the first one but we won't be wasting power when
> >>> no one cares.
> >>>
> >>> J
> >>>>
> >>>> Otherwise, is seems like we would want to have ranging always
> >>>> enabled.
> >>>>
> >> Maybe we should go with continuous ranging then since it's the
> >> vendor-intended behaviour.
> >> Since there is no hardware single-shot mode, by design, I think the
> >> driver should just behave
> >> as the hardware intended.
> >>>>
> >>>
> > Just for the record, I'm dropping postenable, and keeping predisable
> > for only the cleanup.
> >
> > Thanks,
> > Sirat
>
> predisable must clean up anything done in postenable. So it doesn't
> make sense to have predisable without a postenable.
>
> If there is something unusual going on here, it will need comments
> with a clear explanation of why it still works when it is breaking
> the convention.
>
>
I was thinking about the drain logic. But looks like it is not needed.
Dropping predisable too.
Thanks for the insight!

Sirat
