Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04DED3A874B
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 05:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784611887; cv=pass; b=uUcA14voAC402Zyet7YyWivmbyyOSmUH6a0AiZXf9ZZTbi6t2wbFmpfB6f4LYyE3HHCW2corsJH3rLRayC3mfMUZyxX+V0lBWHdciOdX9ZGGM2BoM9jqLmXCyWguVGRX7Eage4KL8Z8hxyyEV4znTCl4t+b4APHknbloTONDpv8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784611887; c=relaxed/simple;
	bh=2TB196GaR66SwyFsnNzabKS/+vodO/WvG61qZe4uFOY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QCFpURM9Uda7WmsxtiYWUkRWfkx9cBO2a6SpwC3mBlylOxftAGCcIxELfU9w7+YJy2Q0MmKcTOlu6UTn5LcIfJzLU/f2Uqs6JdIJUXrKw0fbCjRqTSuTdZ4ABGxtyJSnWSh/IgCYxhZGVVXp4g8tzoUFeTW41NY3GUeh79vvv1k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UVx17kWp; arc=pass smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UVx17kWp"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-6646fd19d8cso1288841d50.2
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 22:31:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784611885; cv=none;
        d=google.com; s=arc-20260327;
        b=bcStRu1ZAcgFTC1mlqgMQQlVEyuLZzdg6aeoo2NJTCIFT3Liimuvj0ytDMaD8emuDr
         KWbWR9HOs6yPsN94Yi2TSEZXENcEWUgJtv1jT8PhGUhT6MCnjB5vhanL/N9q6BVUnXJO
         GTUrCb4TFRvFztfbsyeK+jQDAtANcm8oahFbDPOAflrHmKE/ldy8YFS98hywIqhErSLS
         OJe7jwQIq0pGYe/lVsXyvwGTVD8Ry1WVZ8YWWhkpeCxh6peJMVN8R7Dmf/UDryIfi4GS
         uoZ2nxGBU6ZK+q1pCUqq5wuAl6m0t5kb4/C75oc0r7PUAVLu45O5awEkNOya3m8P+Y0c
         7lJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2TB196GaR66SwyFsnNzabKS/+vodO/WvG61qZe4uFOY=;
        fh=pvDdtbXrd9kOnFScRmdjyRDNa082J8y2p44mFWXadhU=;
        b=g3lLPmqhtz4AtdyrG0+j+/87w6ANl3uigTezwu+SI1uZy4kzftTwKhCgGgJfTa78fr
         Idesk8sN3hdhOfv8CSuan7bsfO+4TmwCJseROAdOEXQk9c42OnHamaTe8r5BwrsLgnVF
         dx3sYS48F07f7jYzKhNlrAskfWfmgwD8ZkvfbSKYZCuu/t6oAOUOHZFfJ6y8diEnkyCX
         bf2fCPeZHuXbuat5kC4w7gYKcZcYcS1+IZ/xU0UYDVUOSUfoOGPMohq1JIN2giQ8eGz0
         ikKOYZEYQ/4k7EnutmjVhAvOJr8rXCev42r5yXbky1rloeWwKbTe7kCf9Vo4J+NWpLTi
         77Aw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784611885; x=1785216685; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2TB196GaR66SwyFsnNzabKS/+vodO/WvG61qZe4uFOY=;
        b=UVx17kWprd1A0hwIg/+8+jMQ1y/KJW3JNnrpqXE+igyI5bz/PdmD8FSq5/2lM3qHrQ
         ihyGGh619Z7iPulsibOexOm52HKXUo92rYKw44x5oK2rT8Sga47gZn2FfcJCfu0hQzjq
         9/GcTRBTLQxdEO36/kiMmhVbX3vVBVhSxOA01/rhEuzrOXIQ4vXW1vekyLZ6IK5XAPry
         Xme/DzIpHVaMgTguh5r6G9CoJ4DQzMa5baMfvxWoSsOwxUeY2/0yT+2FmxMXqd+Di3Kk
         IgXZzmMm0owmeenjMtWnnqAKB3EmrsYkuTlE8y0Iw2KAEOYpKgOCwx0JkprQu9L5kR4W
         xdqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784611885; x=1785216685;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2TB196GaR66SwyFsnNzabKS/+vodO/WvG61qZe4uFOY=;
        b=IaX66XKNjOZ6wEqGh90X4UakOAQktPXIbuvuRvPmySq5P1ZZ8csq+KxFaUSDrUv+/R
         nJgLFdyFWDFOSIwRSX6Uvb3zEHpQYnkwbvOcSPbRA7rGScYDW+qhy2X654SwHnkSWIW1
         gAP1T1XSMBM0pP+5plBYSfKq8bRaTBH+K8saIH0G9VK/3vTNb+TJUlSEWDVVE9Kqib/9
         48pC16Upe5Jk1lmcjClMQ86EkqdmDD3pgxU3sRYfFoPQ7kaRVQj+9SOuOfE1bzHn+Daa
         oU300K9hj7vVrsADaI1nPKcwZSHdAOYMT1ME/jqI8VdZtiYwT8JcPylIH23TJl08GD8/
         PG5g==
X-Forwarded-Encrypted: i=1; AHgh+Rri96Lz/PP+U+M3ASWLEn+NxlnWe33Pn58QQBvONx1WhlRyUYIJz10+1YFCNjwt2VJg9CjHy1ZTBsjx@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0iYJDSmjzYc4pXnBII+grM/NPTM/iyBNri3HTeOJ6pLU0HP9f
	uizeJPGcPg9O58TrdhmtTNsxHUm0RVU9DsghAh/AsXRNVW0jHUQUaxUWEQPBb8RjfNgUfH7yoaC
	xj5ty858GFBedUPb40QCB3FWdvOEndPk=
X-Gm-Gg: AR+sD12QB8EY5nZAn7uIWgNCwQTdsSwgiSKeWR+7M0HGOVWRFVR6TUrCyJIahD8beVR
	2EFVY2UzN8qVwv59qsOf3zWA+YE3Iboh+3zuczPmUHBdNydrEOL9gCLQ0IAo2WDORGRBKnCr9xD
	X5tUq3sU6PmShzo3wrtmo+pJ1D8c23/dsQklQn/0eqp0Vx3Earkz3iQYTDnOaVbcXoaPdXyOQLF
	Qap1IpHdFIaRo5Q7T+BcHY6E1z6RQ5qgEVmGhyyvPqP4P4AJhDO7FFTNrqp6cb3Zjv4TwHI/mO7
	WkpdCmqxS1iAmt6aa/3+
X-Received: by 2002:a05:690e:e26:b0:664:ae68:33d7 with SMTP id
 956f58d0204a3-6683bdaf398mr3367592d50.9.1784611884801; Mon, 20 Jul 2026
 22:31:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260718085728.6797-1-royalnet026@gmail.com> <20260718085728.6797-3-royalnet026@gmail.com>
 <25922edc-4ff1-4d28-9a64-2c28b2b690cb@collabora.com> <CAEWPSH70FecQRuGtA=S8+_CnLY5sMyf1j57Uwzwv54zceS1HZg@mail.gmail.com>
 <b8d63f61-b73e-412e-8119-ced1afdd4551@collabora.com>
In-Reply-To: <b8d63f61-b73e-412e-8119-ced1afdd4551@collabora.com>
From: Igor Paunovic <royalnet026@gmail.com>
Date: Tue, 21 Jul 2026 07:31:13 +0200
X-Gm-Features: AUfX_mxmfnzPqEwa71ax-VO-JiPM0c52nSKLc5Ko0WZ2ScXDIi8A0Y6FL5e5p2A
Message-ID: <CAEWPSH5j3tYNb1JKRGwa00PVnYAgCKS+B-Qz07D8Z7TJea5cMw@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] media: synopsys: hdmirx: add HDMI audio capture support
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	kernel@collabora.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

> Re-arming will be best option if it works properly.

Went back to it and made it work properly -- with one honest caveat
at the end.

Plain cancel/re-arm could not have been enough as previously
written: hdmirx_resume() fully resets the controller via
reset_control_bulk_assert/deassert in hdmirx_enable(), wiping the
audio configuration (I2S_EN, AUDIO_ENABLE, FIFO thresholds), and
the worker's error path never re-programs those -- it only resyncs
the clock rate and reinits the FIFO. So v4 does:

- suspend: cancel_delayed_work_sync() on the audio worker before
the clocks are gated (audio_streaming stays set);
- resume: if a capture stream is active, re-program the whole
audio path (clock from the last known sample rate, FIFO
thresholds, I2S_EN, AUDIO_ENABLE) and re-arm the worker.

The programming is factored out of hw_params() into a shared
hdmirx_audio_setup() helper so resume and hw_params cannot drift.
I also checked that nothing in the post-resume hotplug re-init path
(plugout/plugin/submodule_init/controller_init) touches the audio
bits, so the restore survives the replug dance resume triggers.

Measured on the Orange Pi 5 Plus (pm_test=3Ddevices, i.e. full device
suspend/resume callbacks, active capture stream with live audio
through the whole cycle): on resume the capture simply continues --
audio was flowing again the moment the display came back, no
userspace intervention, clean dmesg, no oops in any of the ~6
cycles exercised tonight.

The caveat: a *second* suspend/resume cycle in the same boot leaves
the audio datapath silent (the I2S slave sees no bit clock, so
capture reads time out) even though the resume restore re-programs
everything, and a fresh stream open does not recover it -- only a
reboot does. Notably this happens with plain no-stream suspend
cycles as well, so it is not caused by (and would not be prevented
by) either the re-arm or the -EBUSY approach -- it looks like more
controller state lost on repeated reset that neither hw_params nor
resume currently covers, likely the same warm-up state machine I
described in the v3 testing note (audio needing a video STREAMON
after a replug). I am instrumenting the register state next to
root-cause it; I'd treat it as a follow-up rather than a v4
blocker, but happy to hear if you see it differently -- and curious
whether the 5B shows the same second-cycle behavior.

v4 follows with the re-arm plus the dts and binding changes already
mentioned.

One more small thing the audio bit exposes, for a possible
follow-up: hdmirx_cec_update_bits() is a non-atomic RMW (the read
and the write each take rst_lock separately), and with audio added
there are now two writers of GLOBAL_SWENABLE, so a CEC adapter
enable racing an audio enable/disable could in theory lose the
other side's bit. Mainline today has a single writer, so it is not
a bug there. Can send a small patch making it atomic if you think
it is worth it.

Best regards,
Igor

On Mon, Jul 20, 2026 at 4:37=E2=80=AFPM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> On 7/20/26 15:30, Igor Paunovic wrote:
> > Hi Dmitry,
> >
> > Great to hear it works on the 5B -- thanks for testing!
> >
> > Agreed on the -EBUSY guard, done in my tree exactly as you wrote it.
> > It also supersedes the suspend cancel/re-arm I had queued from the
> > bot review: with suspend refused while audio_streaming is set, the
> > worker can never be armed at suspend time, so those hunks are
> > dropped.
> >
> > v4 follows shortly with this plus Sebastian's dts restructuring
> > (shared disabled-by-default card in rk3588-extra.dtsi, renamed to
> > "RK3588 HDMI-IN") and Krzysztof's binding comments (dai-common.yaml
> > reference + unevaluatedProperties).
>
> Re-arming will be best option if it works properly.
>
> --
> Best regards,
> Dmitry
