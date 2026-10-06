Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2B73BCD17
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 11:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791287032; cv=pass; b=ec1ScOKp9STPDyPKbVoE+MEUMwlObxXYBHk6vX7Nzcc4bdFdWZMM4mdgLWTJKfh012tSGKECnfprW8LJy6zm6e38/wM0xoT9n1mph/rbNSedQAycY0JUZNKWdNpUrfTnQ207C+rKcP4dMH3b2ti3JFLhtZvptMSJsEZS0dmdcZs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791287032; c=relaxed/simple;
	bh=x3rZMdKi3vGTqXwDbjr6PJPvmHZfAQUVoS4iSMA9MB0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TH+V2O2wFFr3B6uOSO14fFQAL+Zux86eG5ojCMZ3nwQRN/WJGVMlEDo2q+316ka25w3if+II9hetgNxkcLjishpzO5odZh+dgTaCm0aoykYY0e7duFtUo+uKPNyg39VnWNMG6drQJsUQrfxI0ThwNpSR+FmduV2xkjxqYDYkrkc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lVS6Ld/A; arc=pass smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lVS6Ld/A"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1728d8dfcso18554165e9.1
        for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 04:43:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791287029; cv=none;
        d=google.com; s=arc-20260327;
        b=errAdbe1psNfWOs2buaLViNw0PX5SPwlM+JISb7z6Hk/SAsqMrNgUnxBdANhyKISRu
         OApQ/PvYAgantmQZbLceYOP2OOHcUC3sXf+1ItuiUGsRRmO8K5nwzBGEU9Vq71LGHR7k
         HpL+B1M9pfLqOM6iyu9UpdlISW//rkGkHf4xftF27mw2LJZw4B7WGXjUTPPgvFQtj4eM
         7ilcdWEUMGWDm02x28bdPJ5cl/172veIFPKD+cBWpmbnGrOtI3ZwxR3eVL4vs0oZ2qZu
         HPu7Q9gS4l4+PO54fbT9B5xVPFPZRvxwyYE64m1cXvEI+1XIErmvhTi8UdwhusCmMyMK
         arJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0IOK8vNrGs/AYi3igHXIRIEgzlu5V8i6x1q3/Az/h04=;
        fh=9SHh9NcGV7rNPcA0ANTxZt6AOSBW9xcKJG23igcrYY4=;
        b=rg2lFT8MCMv00y8ibWODEFs2qeXVev+KufikXwuvcUs7Gr6m3Fn+cagndbXlDhmuT6
         VAhwbf4CrUz0tvA8twAFDBomnJXcjL8iqzFhxH/HiK2Oc2aklyqI0D5kRtDQwdztOjLh
         x6nYLpYGpct2Y+ysnam/PHZY8chm2vTAFsJ6iWz0KJ5npNuQDKYQyAJEJRX58gM3hPhc
         8/8A+1D9Qd50D3x8Uw3SVVfgnj2ar1n919svCAS15WQcWYGBl1/JadWWjyL9xrZ54QT5
         VqGEKcZmOevrE3BtS0wqT4iYWATZOpGZbnN02Y6JYdNTKXRT0UJFujGCkbYU/1cM/ghs
         yvmQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791287029; x=1791891829; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0IOK8vNrGs/AYi3igHXIRIEgzlu5V8i6x1q3/Az/h04=;
        b=lVS6Ld/A+7Etdh5Ig9jEnV5cvxOl3AIKY03S5aXRvcWae1Ttb1+S5WFKNBikMH0eXd
         Gfratt2vdBCf7QylGUZg0oJ5HmwWFAI+uyxUQxIMcGqZt9qQG8e/R01G1Q1DfrGsGUA+
         a0svZqbDkEDYk4dbXFiDpmlbNtGyNFWvtl/fj4yHpgAG4WDgvzsw5zM9/rTozYEMCGdL
         UNqLkHeByNpAOTgF3pnLVrsoLkcGvwjU4UWAubh4NzQXt3zrMUEwnmmX/awfa3VUBfzW
         TfHXKHdEp434R9d+gvWhXDTdhYjmUQOP3hx7T9b5mO7qY0VG3pYjzs3dgSG2/UGmXF2X
         BCpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791287029; x=1791891829;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0IOK8vNrGs/AYi3igHXIRIEgzlu5V8i6x1q3/Az/h04=;
        b=CvfycmJdrpsRNOHDk0dEikxizlss29E2cl439INSXCFlee8CMRoxDqSBa670dmOvi+
         Z6c2od2WG5lJM7LMSaYwKetdkw+pxr/CibIDbKl7kdst8ZtbVZ45H5mVpj8ht4zRhpyM
         u0g0jm4DEvLUlNMiYnaWgYOdl1+yTT1Rtn+NREb/s2XQ6u2gmY/OQp7+EIUBGUKxPEYq
         bYmEqV/Bc0vGd8Bd6l1YS9lBftzuDqOJLl1KH7l2WWT6XA97RtDVKcwpS6+81yxxdedR
         yyjtOQ3CjB+/vaTH3BXhtILYbELr+0jwIx1gEGcAM56+LX+UMu3+uica/t8HTD/Rao84
         kmOg==
X-Forwarded-Encrypted: i=1; AKwUvBwUO+8YixYYL9/qz1qeoSxfCmrAuQku/7TBNhh44WE68JoUu2dkJOwxd6pD9xJx+zFu9vixPdcoN8bU@vger.kernel.org
X-Gm-Message-State: AFuF++n5/8fLFDRi8pq0+iiawBtwCn5DgM3YZVXL7n+EIeu/2nD8xh0h
	Zz9MDnLfsMMR1ezB5p/B59MEIXOY7SBsKLzgS/hXWcHQPEPaKE/2YaL1RttYX8f7793GYAqZVx+
	xvfZDhkCGJog8rupU43Bw/SNOogxjNyc=
X-Gm-Gg: AYBFou2eQFtZkCKGWafyyISsn3d59XDpI4OnhEAN7+Fr2bCShJPrmf/ejUSmUW2id2D
	y/1+xne4fEkgT+8AOi+b1um9W629fp8S1gTiMQEI2QkxIi8J/hufjwj+hH/WjYZhzCL3E1Kq2jA
	rfrUefG/YYbpzxYWW4CfhVAlfocwkYqWg8KvG6pF5jRruE6HxoXaSouh3/YamBniHxy3hMrP4f+
	RqJZ3t4wSaEldJBwAyQ9Yp6HUCX/MoBXNhz7ooqSkQnNIOR2qIlp+8/J1ElKtmfXyXReTBcB0sf
	Hliim8YYb0nqLJrUsJ0W1y/rkt/knmhco4fiO3HFG15RtdEbsQA/tyyqEXXt4eM6/h/kRbCBDyu
	Ot8t6sjz0sbkqqVnqGgZ6bGZJSNBwyi1oujCFBAhgl//DDt4uj3Dp8BTekF1QMNixj0MZYlq8OR
	YmiS6YKLs=
X-Received: by 2002:a05:600c:45c3:b0:4a0:2540:b46 with SMTP id
 5b1f17b1804b1-4a1680e5babmr175664345e9.12.1791287029030; Tue, 06 Oct 2026
 04:43:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929-mali-c55-irq-supend-resume-v1-0-e3af34afff12@kernel.org>
In-Reply-To: <20260929-mali-c55-irq-supend-resume-v1-0-e3af34afff12@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 6 Oct 2026 12:43:23 +0100
X-Gm-Features: AclHuK8EEYHZRufa5Q70T_3oX3Ok7xh0rXwO38lzCRt9fe8SDgh9FN1A00CzUvk
Message-ID: <CA+V-a8sSaGYcMUpXhX+mr2C44zLj2Hgnwj4pQS1t5YrZN1ejqQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] media: mali-c55: Fix IRQ lifetime and wake handling
To: Linus Walleij <linusw@kernel.org>
Cc: Li Youhong <dayou5941@163.com>, Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, Nayden Kanchev <nayden.kanchev@arm.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Tue, Sep 29, 2026 at 1:08=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:
>
> This is essentially my reply with the "proper fix" for:
> https://lore.kernel.org/linux-media/20260903025526.2657105-1-dayou5941@16=
3.com/
>
> Keep the Mali-C55 interrupt requested for the driver's lifetime instead
> of changing interrupt ownership along with the runtime power state.
> Synchronize and disable the IRQ before power-off, and enable it after
> power-on. Hold a PM reference until probe installs the IRQ, and stop
> runtime PM and drain the IRQ before removing the media entities.
>
> Allow platforms to mark the ISP as a wakeup source. Hold a runtime PM
> reference while IRQ wake is armed, resuming an idle ISP if needed and
> preserving an active ISP's configuration. Balance the reference on resume
> and failure. Hibernation still uses the power-down path.
>
> Wake events require a configured stream and an input that remains active
> during system sleep. The internal TPG shares the ISP's power state;
> external sensors and receivers need their own wake support. An idle
> pipeline is not started by this series. Hardware wake remains untested.
>
> The first patch extends the binding with the standard wakeup-source
> property. The second patch updates the driver IRQ and PM handling. The
> third patch retains ISP power while IRQ wake is armed.
>
> Tested on the Renesas RZ/V2H board with the other in-flight patches
> (DTS changes and the TPG enablement) doing full suspend/resume cycles
> with wakeup from RTC and NMI and capturing images before and
> after the test.
>
Can you please share the dependency patches or branch, as these don't
apply cleanly. I tried the latest 'next' and 'media/next' branches
with no luck.

Cheers,
Prabhakar

> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
> Linus Walleij (3):
>       dt-bindings: media: mali-c55: Allow wakeup source
>       media: mali-c55: Keep IRQ requested during suspend
>       media: mali-c55: Keep ISP powered while IRQ wake is armed
>
>  .../devicetree/bindings/media/arm,mali-c55.yaml    |  2 +
>  .../media/platform/arm/mali-c55/mali-c55-core.c    | 96 ++++++++++++++++=
+-----
>  2 files changed, 78 insertions(+), 20 deletions(-)
> ---
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> change-id: 20260918-mali-c55-irq-supend-resume-30b507a20011
>
> Best regards,
> --
> Linus Walleij <linusw@kernel.org>
>
>
