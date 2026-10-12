Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C9A44684B
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 08:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791792933; cv=pass; b=Xcx1stac1rtKB81tj8sBetaejMIYz7vSU2Om/r+f48HyxQ+wntGpOc/7V+ZqIX928/cQdTkituUp7Vo+thpt5JonuwwMKIWwCNHuGnt9oH3gZl4xfRu9PcmulY2EBFWsSPo3rC2nOutcf5rHKznz2FTnh7r3kcTOhwDomhrBmZI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791792933; c=relaxed/simple;
	bh=MUFarNR2Fx2TCdhUD921tcirVOL9kOniGuETZ9wE1PQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cXap+vthNolu8wly1NtuxbYXg4N+qqAcSOVbA1yLBBLwl2XfuR/PWKrOIP8Jn9fs5p9nmgDEAp2qCAoJy5CQVeMyQEsm5WBjdl3aIdZJTqGNDtQKvjQ0yBnuHO7YHgnFUF0/R1gDXHxGnc4v8UXJlClQKs/h2UkQl/7HJDEZ2eU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cxKX8NZa; arc=pass smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cxKX8NZa"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b06c0794cfso11425397b3.0
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 01:15:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791792931; cv=none;
        d=google.com; s=arc-20260327;
        b=bJD32otIAoCtsec9Hr+r75/NZERdVAosuzL66MviWGAgOZpo/tL62xyYtCzQ4UPsnz
         wu053P2xjK4nTb2EqtvYpglXpghrMZkJoPL9WOB/9z/oMd5jQWztNO3zObefa4CoPfkJ
         SMVF+2evj6XWGSsWycebKB30FFtZdPNnnWuzFJR8FUwSfDSg5HR2T5jSEk4BqpjkOxRQ
         jLe4LHRq/qF4uTWQjnhJ+lq0qBW4deft9vj5ovlBbQFlaQfXsgOxicupnT29jdbZ0GrD
         yQNspOaNyy495Hjz1OBWQaiOrontmCoweFO7pOkgMRZmLR2PW0y+PKDhOFpHUrFTA7t4
         v+BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bXVhxdOwpdFW6/wCk6tmolLyGnY6hoIpXQSLDWS1A5A=;
        fh=WgP2SMphakup5HL8cYFpghknmm5o9VUPVXgt8IJdFok=;
        b=JVT2LpJBurUTw/xHBcpsWVS92vsMDmYJDYGeTb+eQWVOHqVFTQJqYGgDB0YpHTDz8b
         6vtWvhcR0NgNoRh7lWVsfuhpD5CCAbo6/hyNat6zRlg0XuD4hbPAFV41D21ZoMZwGPrK
         5DsJ4VPtVoFNMX1BakNDhtGL4PBgkG5V/X28tfsUSMfG2WJFVKPgZ4xs7Y93elx4Jbhd
         FBRP/q9OLiAQ6dlf7R6uy3DLJN/hnGUX6i1caHsCbuv78buLtygsOF+B92jEAEgOngAd
         n0LSLZXNijrCh6Ije1008LvpIOnCeRGJiJilA7vvW60JJDQLYA2oIaQRZCf7qeDf35Mt
         7kwA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791792931; x=1792397731; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bXVhxdOwpdFW6/wCk6tmolLyGnY6hoIpXQSLDWS1A5A=;
        b=cxKX8NZapzay2qVeuTMFwLZfQ/w+zKHy8VdioSIEXMp3SgOBrOOjJ9/HvHc3pJretk
         qd3ozyh1/xnLebbNiakQNPT+cCHixDuhIhA54q+4jzuUC4xs9IDUFfJ7RwPB5uos0dYa
         erJTq0WNzwAX/jNLKMY/5xorpQXLSowOhs2PFznnWn4lBee1U506fwjnMKvK9FxuhSBW
         j76ALT1uzMNhT5YYKFVL+5qwtgbqwEyM1Y/kNOh+KPVX1MfPIlz1DNie3vC2r+9/llVt
         iYdCWaBvymW4HqcAxAMWpA2Q0HfRmzSPxSCL8w7uQy9YDGMYH7Tb3vDBqrE6api08ICc
         ti8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791792931; x=1792397731;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bXVhxdOwpdFW6/wCk6tmolLyGnY6hoIpXQSLDWS1A5A=;
        b=JTOcVSPzJGcQjm5MG+mRWo2EYZVSzLErtSa0A4MoEUsoQtMWXjVUdVW11f9mOz8Hte
         +qz9I2dvj4X2CWpgJqy9taWP3F0eEnOl+rYondYpljZgRZTkqnmkhXCJ5mtf6kuOHRJB
         +bLRH00MjReytYIFI4IfBaSabtCX5Y5vyLBRgeSyp9bfYDZlTzB5XBFrTYcqJjqjKg2X
         e4xmA/JGgDw03GvgiGaPQ0LNNS83xe9ZhuK3YQvH4/pu3REoolcpY32aGQEbaGpoW5S8
         HByeHymmwBeZ9XeJsupekp45MW9h6PGMPXpIoneuoAHkyo9jJpNB1DMcDMzUB5E2HFMT
         PSiw==
X-Forwarded-Encrypted: i=1; AKwUvBxHXj+GtR+h1HVzZLWt5f292rw0LsNEcyZxKyysn4mEFmyXRnKgblYI26zFZCEBi6KBQk4Kcnuc2ETs@vger.kernel.org
X-Gm-Message-State: AFq9FYKrUEtY3KFXPmzQZrAnThGQJ+OSRqd4PddpDi8EzdVkd3G1Cvvd
	XWpaonv/7cTC3c8cgd0P+mOQbsMS9j5rFAXhTE5YPu2q3eAqpS/IjQj3i2XpxTvdj+UFhf5jSJr
	puC8SE5TH9KvqL0r92okfZHH2VefpITs=
X-Gm-Gg: AYBFou3mtii6B5IjXz5eL0lPbHLJqFJM9GOJdw4OxGummkrgzFBlMXXF/4J2AlVJbaE
	68S3oLUgVrmjZ6EzbHsEIZqnpDuPI2PwDLJmCM3xrPmIhlsNiJlDb/7EObJ1ZzftBj8VxFqKX7p
	ewGKXor8uYEni69uC2abE6nVHUcy+DXv9ryRkv8cNUTPCzPrtM/WgVhNlfd8vP0gDI9o0NOOxBT
	KPtsXllcRyXx3OJJe27MTgjNLasrIkfcoF47cQUEs5Zwtq6Vg8BqgnC+kQCr74Yhj4UOEuqAGHE
	uWr+iYfSFRqFWBNxCc5OHutvbxuJbPBS8JaX9RI6/3E0W7xBWNU1bXt3u2ktAg==
X-Received: by 2002:a05:690c:e1c1:20b0:8b0:a6be:60db with SMTP id
 00721157ae682-8b0a6be8770mr4474387b3.65.1791792930760; Mon, 12 Oct 2026
 01:15:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006085425.40450-1-kaipeng94@gmail.com> <20261008103414.6170-1-liujianfeng1994@gmail.com>
In-Reply-To: <20261008103414.6170-1-liujianfeng1994@gmail.com>
From: Kaipeng Zeng <kaipeng94@gmail.com>
Date: Mon, 12 Oct 2026 16:15:19 +0800
X-Gm-Features: AclHuK9NX6Ud26EiLKELSwOXP_kj4inp8xiI9rSGYGFem1Rk7KZjITqsEVDSoAA
Message-ID: <CAHk8ZdsVK-n6u+KO5W0=7c_4_eQ2Aj0aqTg_tqU_x_58t0L6dQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] Add device tree for Acer Swift Go Pro AI (SFA14-11)
To: Jianfeng Liu <liujianfeng1994@gmail.com>
Cc: andersson@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	konradybcio@kernel.org, krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jianfeng,
Thanks for your review!

On Thu, Oct 8, 2026 at 6:34=E2=80=AFPM Jianfeng Liu <liujianfeng1994@gmail.=
com> wrote:
>
> Hi Kaipeng,
>
> A few things I noticed in your v4:
>
> The vdda-phy/vdda-pll supplies appear to be swapped on all four QMP PHYs
> (usb_1_ss0_qmpphy, usb_1_ss2_qmpphy, usb_mp_qmpphy0/1). The QMP PHY expec=
ts
> vdda-phy at ~0.88 V and vdda-pll at 1.2 V. The same issue was fixed
> recently on the Purwa boards in commit 7c1d0ef2969e1 ("arm64: dts: qcom:
> purwa: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies"), which
> includes the reference mapping used by the other X1E boards.
>
> The &tcsr QREF supplies are missing. The qcom,x1e80100-tcsr binding now
> requires the vdda-qref*/vdda-refgen* supplies, so DTBS_CHECK reports 18
> warnings without them. All other Hamoa boards have been updated with this
> block.
>

These are some updates in x1-crd.dtsi.
Since my first submission was earlier, and my work is based on
x1-crd.dtsi, I didn't
rebase to newest Linux-next this version, because I am not sure if
it's necessary.
Thank you for pointing out the differences.
I would rebase to the newest Linux-next in the future version.

>
> The three PTN3222 eUSB2 repeaters on i2c5 (addresses 0x47/0x4b/0x4f) are
> not described. They are present on this board and feed usb_2 (webcam) and
> the usb_mp ports.
>

I actually missed describing these repeaters.
When I started porting x1-crd.dtsi to SFA14-11, I encountered hangs or
a black screen
during boot when some no-exist I2C device nodes were enabled, I remove them=
 as
possible.
In my testing, USB devices work well, without issue in this case.
Maybe they are initialized by UEFI, and kept during Linux kernel boot?
So, I missed describing these i2c devices.

After you point out, I found these i2c devices can be detected by i2cdetect=
.
I would describe in the next version.

BTW, could you let me know, how can you know which usb devices use
which repeater?
It would be very appreciated!

> The displayport-2 DAI link is missing, so audio over the HDMI bridge
> doesn't work. My version also sets sound-name-prefix on mdss_dp0/mdss_dp2=
,
> which is needed for the DP audio links.
>

Currently, the audio of my dts can only work partially.
I suspect there is something wrong in my ALSA configuration, and
adding sound-name-prefix
can improve nothing in my case.
I still need time to try to solve this problem (also dmic23 / "VA
DMIC2/3" routing problem
you point out).
I notice you list that your audio totally works, if your
alsa-ucm-config is your customized or
just using X1E80100-CRD.conf?

> Two nodes look like they may have been carried over from x1-crd.dtsi
> without being verified on this laptop =E2=80=94 could you double-check th=
em?
>
>   - key-vol-up: as far as I can tell this laptop has no physical volume
>     key (volume is an Fn combo on the keyboard).
>

I think this should be removed. I would remove it in the next version.

>
> On the naming: upstream asked me to change my compatible to
> "acer,swift-sfa14-11" (my v1 used "acer,sfa14-11", following the DMI
> product name). Acer's support site calls the machine "Swift SFA14-11", an=
d
> I couldn't find "Swift Go Pro AI" as an official product line anywhere.
> Since our series use different compatible strings, file names and models,
> we'll need to align on one either way =E2=80=94 I'm happy to go with what=
ever
> the maintainers prefer.

Acer had a page about "Acer Swift Go Pro AI" but it was deleted,
fortunately here is
a snapshot:
https://web.archive.org/web/20260314171131/https://www.acer.com.cn/product_=
list.html?parentid=3D323
It's sold in China using the name "Acer =E9=9D=9E=E5=87=A1 Go Pro AI".
There is some discussion in the thread of my previous version:
https://lore.kernel.org/linux-devicetree/20260729064538.19564-3-kaipeng94@g=
mail.com/
I have no idea if your "swift SFA14-11" is the same as my "Acer swift
Go Pro AI".

> One question: you enable usb_1_ss1 with its QMP PHY in USB3-only mode
> (DP input port deleted). Could you share what it is wired to on this
> machine? The only USB-C port is on usb_1_ss0 and the HDMI bridge is fed
> from usb_1_ss2_qmpphy, so I wasn't sure what ss1 connects to.
>

It may be an unused USB root hub device, can be found via lsusb or sysfs.
I didn't verify if there is any device wired to it before.
I verified after you point out this, and I couldn't find any device is
wired to it.
All USB devices I tested still worked when I disabled it.
If so, I think it could be removed.
But, I can't confirm if this USB device would be used by SoC internal.

> By the way, your EL2-mode testing is a valuable data point =E2=80=94 I ha=
ven't
> tested that configuration. On my side the following is verified working
> on hardware: eDP display with PWM backlight, I2C keyboard and touchpad,
> USB-A ports, USB-C with DP alt mode (video + audio), HDMI video + audio,
> speakers and headphone jack, WiFi and Bluetooth (UART), webcam, NVMe,
> GPU and battery charging.
>

Seems that your Makefile have the el2 as well, but you didn't test it
under EL2-mode?
Please check my changelog, it includes my testing status and
parameters of kernel.
I am not sure if you would run into the same problem, hope it can help you.

> Happy to integrate any findings from your testing into my series, or to
> review and help with yours if you prefer to carry it forward =E2=80=94 wh=
ichever
> way the maintainers would like to handle it.
>

You have pointed out a lot details, which is very helpful for my work.
Thanks very much!
I will fix the above issue and continue to send the next version.
Your review would be very appreciated!
