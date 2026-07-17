Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4AA246BD5
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 22:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784327974; cv=pass; b=Jrl2tcW/C6o1rWib+3ICKwSShlxQsx/bLMzIEX7TAr3CEGEW8xFYXMYQg+hYUfBuDE6kybRGwQem5s0SF8pmP5KtmeQQBHq7z2WI3PyQFgIKxIgOqnM3xM/aMAjXHCcU/tF/e33gu8PFcYOEDhf2xayIVTAPV4jE3BMHRsjdBsg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784327974; c=relaxed/simple;
	bh=y+TWyXInq4P/xMgo1UQUkVHDyQMVAh5+9Kh3OArgRQ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pRNnLOMHwnBWVjzcq/D5ur2yfSPeOKbIoWaXuAOCoK97JyTwShmIWnkMF8FKwjWWVwO2V6gsmdFnD2y7AtDVrOS3A+Ah3VVmUHjH35pDRz9i3YHMq4bOOYImsOOFgLnLJbCt8Ryykz9PHH3rK14DT1dv3PXAU6lCMa1AtTsaTYU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HdNM32jD; arc=pass smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HdNM32jD"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5b0115b9e17so4826049e87.0
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 15:39:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784327971; cv=none;
        d=google.com; s=arc-20260327;
        b=F/IvJPVN4+FNKwGu+DD4fgXvWma5rnBHTheMgq1k3s77CHLVq+3duPeWubcrPf4ylG
         s0LwgrHFnO/Bp9n7vJiLCpqEtzZBebbxOiLsdOYqFpYKCovqZ0lgdez6qk8fYlI0HntP
         WfqB/4SHeDk6xvUG/oYL3xcXP8C1baRlL+7EpJ6QwHSLKWK+yzXLS/5wSElUKN2cYYfR
         Q6tmQfiYjzhPwM+ZajhcV+MAV6hYhCu5pUxr9w3laOZnyn4iauPex67+k6/2uihNktKg
         BOLGJZ9h/kj6anaD7/HfDmWMVXjr8jewuxKAGf7ht749Xp2R4dicF5/1dNmlODP75iCm
         qfMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LRkNSJZe2U19CYjgtrr82GDpwrQo6buI7ELWlIUz19c=;
        fh=N/RDmHPU+EoPvZaXLIhM8iNVjFmcvkoyhiZvNzf864s=;
        b=LRacppGCUjEJRaJU4gAG2DzlmCbaoIAAxVpLN2fU5lij2RzjqIxDUaa6jXoAHkAmFi
         JlfXV5VwOfGvRgv7DG04I9yCxn4hDGZscSCP5dpKKmodAn6MYnUZBoKBSBlZxyom9Ck5
         sL0uFYaxv1v49IpeaKTZ/GygCX6lRfhPnDFiCktHkafABrRtiMmDGVD2ryVBi5jGw4BO
         aIRcb2RwK26aj33BLXsdKHKx+cgtbUjeFSzSM5cjBZv7jRJQ8F+a0/sXX1o4YQSYizvk
         F6ztKiXviDBQk3l20YqEmjw12iyuvW3exHcqcHZUpLiMxnz08V+qUZyvhWZLkcI9YcUH
         lNfg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784327971; x=1784932771; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LRkNSJZe2U19CYjgtrr82GDpwrQo6buI7ELWlIUz19c=;
        b=HdNM32jDsN1P7CDs1ptkJkYUTJRwzJDGbPegpcGyVMoT+fD45SiwE7PtUrKPSobhqP
         VoP48TA0TIOFqcbVuRW5aFVkTLbzG/E7y+gyIQA855jG5s5ts39tntG7M/RdyKTXwnGG
         uvn4eVU35vfPwrYZwVi1ihmzKOKEeYZ3Wtb8MLBe+vo8q+7AA8klliTTVpZGyZ9OwYUV
         Zy8Su8QbPDIYRInv8H6mpjPnBF9Q/UMqq4MpDGCcahLkIbi8g2ytyftZc+QTAE/GXFBg
         jZCewEUPCVfrBIN6+nsBhI+0jxxmpH8Nz9jhtNK5tgbB/JUlBPgr9poJQGNW1hCR6U4m
         uM7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784327971; x=1784932771;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LRkNSJZe2U19CYjgtrr82GDpwrQo6buI7ELWlIUz19c=;
        b=raWJohX1DsXGcqmAzTdFzjjvZMrMkep5SPjGfR5KOneu0fldha3a+0HJeNH6JGyffU
         OIy2sE25qZAwzT12051ujavW1EPBwTqmD4OaBpHk/50nw3Xmusx+2TYgZ0DMnIlTYyd0
         5e18ZmXduM1cX+lTtfxKx3lNKCQjMsdS8erdfdeBEnNv0j5sIsLVee0TtewTPjtBbR+f
         iL7I3290VTgNNYGCJzNBAgyYpkyOMwWwgwvzC0kklErVlTn02Obj7qXOtks2kcznGgMg
         f/JWBFb9SM6iuKTd9yno6FQqQNBfPilNZvxm/m41dAfj577SFu6JbvCGhZ6DLh99phpr
         u/4A==
X-Forwarded-Encrypted: i=1; AHgh+Ro4veVh9sSWvmyjE+7//9FeA0oR2CONFOs8wSHhfDDIvr/Dqi014vFiFVZfc0sY5c+9mw37XPZi0bbR@vger.kernel.org
X-Gm-Message-State: AOJu0YwL25atJ8eUp9uUvvPWTmU9CdEBSO68Xo8vU6idrmp+IJ5kH6jj
	iY2ikm/YkbS5Rtj9Y2F65p0ZBMtMx+zhcI35a7ueRhIWQlua5DPDO5gP6xqy/uTOwzJaJ0kZMRu
	CPPDTm6cEP8f/Fe8wxY+C8if/rZ18K74=
X-Gm-Gg: AfdE7clcmzjIqcisKCn4p9G6dPeengxA4t7YV2eYBnUGiLUWzHgcIQ/5kqq3HDOPVAx
	KiYZgrsftJWm/rP6ug8nkheSK44ogNo4VAfRRFGWqKt8QrTtu9EwdfoqDm4deWpPwmbLcimKzci
	kZxOqpbxQR53yuJLDe6WS6SpkgR5lvNZuRX1h7eoaB5xOM34MEgHr/8ZihJfS3HUD4mKPs7kB9Q
	CuoKhFnbQ6SY279XhouquRvl4DwZxCHuWiSq/omib8HM3X02QTd0iae+BKUKcIxk5knMx+h+Z+R
	hXJJSLM2G2hqhA6nmmCQkBJ3zvpiZQnX7mfx8Z139yL9EzC4M9CJavJxbwknEHapOEB4lCTYwVD
	FewJy
X-Received: by 2002:a05:6512:61a2:b0:5ae:cf16:489d with SMTP id
 2adb3069b0e04-5b28f9b7c24mr956500e87.32.1784327970524; Fri, 17 Jul 2026
 15:39:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714101146.200416-1-kieweg.leander@gmail.com>
 <20260714101146.200416-2-kieweg.leander@gmail.com> <20260716-decidable-tingle-175efaf36540@spud>
In-Reply-To: <20260716-decidable-tingle-175efaf36540@spud>
From: Leander Kieweg <kieweg.leander@gmail.com>
Date: Sat, 18 Jul 2026 00:39:19 +0200
X-Gm-Features: AUfX_mxpQfuaZHTtcrria-kK0Gc7mvWWjVQ6o1S-g3N_SXZuZJUJKjEKnEsiiRA
Message-ID: <CAMwcS0hBc_ruk_r+F6cQHQzO+jZagi3M9_AHQ3fpT7cbSUqeOg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] dt-bindings: display: Add GlandaGPU binding
To: Conor Dooley <conor@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Conor,

Thanks for the review.

> Sadly googling this device only shows up Phoronix and other copy-paste
> reporting sites. I think it'd probably be good to include a link to your
> project either here or in the commit message.

Good point either way. The link was in the cover letter, but I agree
it makes sense to have it directly in the description too, so it's
not something you have to go dig up separately when looking at just
this patch.

> This clock sounds like it is actually required? Doubt the device works
> without it!
> pw-bot: changes-requested

You're right, I'll move clocks into the required list.

> Usually I would say do not include things if you don't have to, but I
> would much rather you did if the alternative is an interrupts property
> like this that doesn't resemble anything used in devicetrees.

The example was actually taken from my DE10-Standard DTS, just
shortened, since I understood examples are generally expected to be
minimal. For v2 I'll add interrupt-parent back in and use the
GIC_SPI/IRQ_TYPE_LEVEL_HIGH macros from
dt-bindings/interrupt-controller/arm-gic.h instead of raw numbers:

#include <dt-bindings/interrupt-controller/arm-gic.h>
gpu@c0000000 {
    compatible = "glanda,gpu-1.0";
    reg = <0xc0000000 0x1000000>;
    interrupt-parent = <&intc>;
    interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
    clocks = <&osc1>;
};

Thanks again,
Leander
