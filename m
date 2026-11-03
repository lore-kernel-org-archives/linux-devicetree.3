Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793725818;
	b=pFtzS19uChQl9ePbq77M6EtAV+QoArVHTH6CQtAQvTF6M/MrvPLprlKefy+KP1oCCNE2
	 XjvvtO2wwgHNihMZdT0Nb6JEF5s0ZOGftKNSNE6GaXdXD3UJi0T/t3hMryfMjg1Ek42WM
	 A0r5bZMpCrZgp231iymoqWDjhgCb9kIsTc/C+SEvKGjk7gZUSBD2tfb1f+HsWm3gPmS7k
	 YriGzTZ33uZodIvVVgcGf4Kn/ywg7b2u4wTRq0grlf8pafFkLJ7LJPIZG0xx6EiQ024KQ
	 MUGj4fxMRhYBkJ7e6ihfVHJ2Mab12U782p4F6m2YqZ+Czb/Vsgb5giZKRWXYfo1UAOQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793725818;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=dVyIeRQJHeB49FS4amSNOfxSQ+jsE+/JpXBqaJR89vk=;
	b=jaQLxAqRiZukw6otepOvwJrVP5AMmVqciv7nOA1SV2oDyhoASlY8no+kPTHzSZMWGbdk
	 JDlRBW2ffRaEc6xoir9O+//bnN8vwuAVrMgmWGJ/MwHcv5YJn1ONnd0FD2cCFQS1szAw5
	 fIJM4Z1RXa6H+2dXF6Jby4YlPr50Kkgu0qux83nUNCIklqdA7bfuaG0YVAHtxFxalaRvt
	 p0LA/+N2uxEXbRI08i7JjnrTbFpyTOnPWEkolU4ZBa3EuXo9kdaZP2aDOG3bEC4FC8WnY
	 i5S4OLovIIjyabIzgncvtZWv1uHxnmL3OeGZl6GIS4+Qz79R0wElYAOaB1WYIT3rLeg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=JxILHW9o;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE3C606A327
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 17:10:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FE3C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=JxILHW9o
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c450ab1483cso727774166b.3
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 09:10:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793725811; cv=none;
        d=google.com; s=arc-20260327;
        b=bk4ZBk1IqP8qAIMY6ku21lPIqKrU+E73npBBcAzAAHtvrAL+jVEqtyBsQcIVR2hGYN
         K+LGn6Eaq5KAHCTEyfQbdPTx/To9YcKJ7cM/4+Iil8Q0FPOamG1/iwzbuIbyJ06geDKa
         /rsfSQxHEcETrTSTUu0/VYc+vR8WQSLYv6+4dz3ksAWVEa2fqr+l0Ynw4XZ72P5UP7Km
         KeeQ2bMhtrpu4pLC6a7Nzkfev8UMbvfKXYbCMClYq9zN1n/iHAeH05GT8rkDx2KsFiie
         MdLeqCgqXLW/I+HgvrzJy9moOCZLQsBniSwa2ns4z3ktMwCDPt9KNLMU62th5qBfqQ9u
         o/vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dVyIeRQJHeB49FS4amSNOfxSQ+jsE+/JpXBqaJR89vk=;
        fh=p7thBn6HOarrokwmTCSyfUxoO2ec9bJ9S8zI8eR9w3U=;
        b=lWbRXaiABQyyMlvmgI3qXMMF0pmn3m9B1z/CdrBM6ih/wXWHIDtCRDpwJ/pdvd6DMq
         lKyFYEphGArVzP+Pi5eHL07aUg1eh8eTkVO4Zc4J+62cQwSw0CNH8cfAObMDEbhBzzJo
         O0lNWsU9b3k2LnyLJnNVlpoZb09KmWZMQ6H3XuvjuoR3ODMZj4g916bm2BA9z51jba8+
         AjCJPDA/Vew15wpxN1O0DwwofKUbCJmWYmpLx7RfoGbu8WnRO4TiCD0CHgTPv0a2iRvo
         J/ikypsbRQk/4J7EXHMobfz3zlrYqyLqHk4JoL0DovLTZmt0eyGHGyXqZXi+dD43TzCY
         7lRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1793725811; x=1794330611; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dVyIeRQJHeB49FS4amSNOfxSQ+jsE+/JpXBqaJR89vk=;
        b=JxILHW9oYQyXUYBtKv5mOLzWifmwbFU5MNI6Mp4YODeYAzXlF6FwKyKkebHtzdDUmP
         oXoW2e5P8WnYVZNz7WHUyIFENfwIZI1SD3j4wlgld63bqHDUfuqwCyjVM6tGZg095Ar9
         ou5iZ8mvEHPtc2qB9uYv3hztIjJReuw1mOKug0C9yGfIIPj2AFQN+pOenpQvaxSV+5tK
         AKHy1yYC/IEtbdkJ94EYKQoYPFQ76GClEv0y75JPclIa+KUBpLBVQ8VkgaAFCPVhV70e
         yPtYJX87NNuZpHnwgo7/tkA2MJwTZ1Uz4tZ7JzvmBzB2IsQM+S/v9DwgE4cYVMCDibu2
         Tt/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793725811; x=1794330611;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dVyIeRQJHeB49FS4amSNOfxSQ+jsE+/JpXBqaJR89vk=;
        b=o/dnuGtWHkZe11adzJl6L5wuqp1d7tm07ImeEpqIcZ4mKKKKJjR78FwpKZmBQlshqS
         ys3qQVLoGtBv7mrlCCNEKAFrX4CbwjyS0e0CMWceoOTsmaon7u1RsvQfG6fLfLO9+/Up
         2ky4GVhA0C0AL2Jrk0Ws8yrJhb/mdP/UYojo7zuNC6CRxrv5Qn6+uG+Ag1MU8LyIgWEf
         Jp6a8r25ohXaosHP2Z0Xr/9Hd4UglAXjvZELc5WDqcSkEu6mozSHcqAkpZ02BuDDNOBB
         JqQBuAZ8CbrLXTO3U0FXF4R4o3Kd8ifqlzzebvZLbAtIRMWtpxGU1c8Kyow1xo+mDAda
         pYXA==
X-Forwarded-Encrypted: i=1; AKwUvBxA1GSDU0M8ONaulr2TQY1CvH553+dBPwXNz3W9L8zDblHLSy8b9M0hh8J/cjdpJMlKt+lOuJRCVpz/@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZA1KEofo5BXs68q0Si3kLj4p7Io7U17OgCvrU/LuS2eWCrgeQ
	aacKhaP61MTq4WBLoBWPTZ28T1152pU6895/cY1n3hTy/qCtN5KHwao0A7fNGYTbknl9f1Gb3sT
	qfYRYKkphd/VhuaTcuHrTmSGqdxwD0mmFiigUzsILRQ==
X-Gm-Gg: AYBFou3S6g8/s6deubzYfUP/ZLDkiNS8HO3GHZwsIGRkgtCAffzmS/elGz1w/MWS65e
	T6Vhf1KdIztfBm+Kju+fbrcwO82MNOUS+pXYl0hrPn8MrVTg4A+EWLAUyC77UopG4uxxE08JOqM
	bDYd5UGi/msjqXQqusxT7uY+y1SbUIYu4o+Y1Zju0UNvUluJy0Eql2r5/de5dGYEoB8TF9xixFo
	JnOcaVQ2hvIJnnAfhOPeeAh0eW2uDuG8OYXmqlXKJuGXnhsB9/0iXZS6sAszVD9972Rf1nUgiNp
	qTpHjxtvxJlL6j9oiYrDkpUZfobGooMijNSG4k37yqaMokWByUMLBRDTNWrv9RtbEOTCipGNLLQ
	Qfw0mPnNAaRq90wAlIek0dTDGs9gG159jNZOTM6aMQ7mUBQt9pHHLEExWgfqDaMDtJ3uP
X-Received: by 2002:a17:907:9811:b0:c25:2688:8212 with SMTP id
 a640c23a62f3a-c4ca74209fcmr1138335066b.0.1793725810499; Tue, 03 Nov 2026
 09:10:10 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102090713.896324-1-pbrobinson@gmail.com> <CAPY8ntCZgp4_aaYim__XrmfL=gW-e1dnu2CjBG3n-VzbghYgNQ@mail.gmail.com>
In-Reply-To: <CAPY8ntCZgp4_aaYim__XrmfL=gW-e1dnu2CjBG3n-VzbghYgNQ@mail.gmail.com>
From: Phil Elwell <phil@raspberrypi.com>
Date: Tue, 3 Nov 2026 17:09:33 +0000
X-Gm-Features: AclHuK8tMj1QOQ1uafVmUFnYp2xZaTUAkPNNAv0ydPYWKPLq44x8qXFWk7k_EBs
Message-ID: <CAMEGJJ2ro0s0ZvQRgNneZZKTictbQcWzfLAT9fc9d62uA1cS3g@mail.gmail.com>
Subject: Re: [PATCH 0/9] dma: Add BCM2711 and BCM2712 support to bcm2835-dma
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Peter Robinson <pbrobinson@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	bcm-kernel-feedback-list@broadcom.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 3 Nov 2026 at 16:49, Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> Hi Peter
>
> On Mon, 2 Nov 2026 at 09:07, Peter Robinson <pbrobinson@gmail.com> wrote:
> >
> > The upstream bcm2835-dma driver only handles the older BCM2835 SoCs
> > up to the Raspberry Pi 3. The later BCM2711/BCM2712 add extra channels
> > that support 40-bit DMA4 channels so add support so this works upstream.
> >
> > The first patch updates the bindings, them patches 2-5 do some
> > refactoring and add the support for the newer SoCs.
> >
> > Finally patches 6 and 7 add the nodes to the base device tree and
> > patches 8 and 9 enable it and configure HDMI audio to use them as
> > per the down stream device trees.
> >
> > The series was assisted considerably by Claude Opus 5.5 based on the
> > various downstream Raspberry Pi patches and tested on a number of
> > RPi5B revC/D, RPi4B and a RPi3B+ all running Fedora 45. Checkpatch
> > and dtbs_check pass clean.
>
> cc Phil Elwell as he knows far more about DMA on the Pi than I do.

Let me answer some of the questions that have arisen:

1. The downstream bcm2711 dtsi has 2 nodes for the DMA channels for 2 reasons:
   i. It is an accurate reflection of the hardware, and which bus the
DMA controller's bus master interface appears on.
   ii. It allows us to use the address translation provided by the
dma-ranges property - we do no explicit address munging in the
downstream driver.

2. This driver does know about each channel's capabilities - see how
is_lite_channel and is_40bit_channel are initialised independently of
the DT node where it is declared.

I hope that clears things up a bit.

Phil
