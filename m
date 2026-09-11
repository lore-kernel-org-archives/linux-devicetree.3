Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B6943713C
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 22:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789164710; cv=pass; b=tjOWuKipRVjcTiheTfZcGW+4E7cOVDOiRYrwfvdX+jSgTr1B6sz3w4wu0+nmtEYgNQhMFJ9qgFD8u7xvqUMM36AV9rc9YLyrb02NFgSuVjZJqrVg4/7knBDh2gcN1NBi6/n4BVhIXQo9HPLxrqA15ev18imov2es6UkPeVW7uE8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789164710; c=relaxed/simple;
	bh=64DI/R3Fb3DmgLTAgL4BfcJDwxaJEMQAyDpP0IBKAGs=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=cizFV/V5RkVNOpcaQ0k+ntZFzO4vFjuzm1eQz0DjkHFdbKZrEOAIufFRVY1rXjdGAS97w1GNALDftPLY5xoNZcjjBHNDl6/LfFxNz6mupLMehBjBoMeEOfK9JwbVVcWAKe5HqH9+2D9icmjbvVJx1bpQr6fh8UHf5zdGykytLGo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=est.una.ac.cr; spf=pass smtp.mailfrom=est.una.ac.cr; dkim=pass (1024-bit key) header.d=est.una.ac.cr header.i=@est.una.ac.cr header.b=NZWQy7B7; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=est.una.ac.cr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=est.una.ac.cr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=est.una.ac.cr header.i=@est.una.ac.cr header.b="NZWQy7B7"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c29667ed561so186169066b.2
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:11:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789164706; cv=none;
        d=google.com; s=arc-20260327;
        b=BtZ2ztg4sr4kj2FTMLY8SdFYw66cdycP637xIx7/twkwqGfV8CwDb58TWRiwS5nU9s
         NzZF8HuHMr2XK+TK2uM7nAdJhc9ZViDAnmIWNj30v0WQr+41WRgFcK5fZfAj40SyF6+g
         NVwCEvpnUWUk6nCLHZZPdvXEXzqP1dlT9fKq1WpRaIgzXFJhCH6iacebXuJIXDNePDuO
         C/9EFPqiTFt6lJ+MbpHemNNb6PG8pRxSQ27TfnHve3CXHomYQCb8qNJzohAZ9TUaJjrp
         OaLNdg/SF5GhK7EcmY+fIXIc+rZtiSZRT65cY/Mm0+/k02PrSuCMc+XBn4YXfQb07QQq
         fpHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=jmcmRooIJWZcfOxhhMxU11ULm5mq/IM7NKssWyEliKc=;
        fh=I8LKTGFEBmDY9ClPyVxHtcJfVnNV627BlGsm1ekuKkk=;
        b=nAV38noVw9Lo2IJut2Rn6ZMIIh0rZUr9GCWMRsj+cZ/Ed/8NnS3pNM6ivVB9yNuGBr
         s/ili/aD7CN0e7NAVvqJ9V7UA1MiDH2Gp+txtcYNnz8WiYzjT8tC4ucH15JLWU0y6nkB
         fqSFh58pehT44eps/JMgKryg0shlk79tCFlX0XtxgRZWIUatbNg75SyF3fGGmWx6zj0M
         f90BYd1ZDG03G8ENW+NrgG1A+BqPsNh53fVH0pcIqtvrw5oOfWUM/JbJTWLK6JxxnJPB
         Ju52G1VLvw+/AKQY7kB4EUMkJO0pUazYE3DXYuxwFEJus3PLAO5hAGqv3fPHfcsNbMYK
         KAQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=est.una.ac.cr; s=google; t=1789164706; x=1789769506; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jmcmRooIJWZcfOxhhMxU11ULm5mq/IM7NKssWyEliKc=;
        b=NZWQy7B7P93Z9mSBPSH+yYNv5GOfYfJz9elcgc+dYbOUuy7ltpPx4xu3paNzLSfmNl
         gyS4D6gAGTcJuEwH35o2mGdoLJWESStdgahUVzNC5tZNFTR2nFjXthHK1QpyQ+DvrC1T
         c48CAYfJ7SjRNMn1OObgwrpELo8FjPI0hTmqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789164706; x=1789769506;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jmcmRooIJWZcfOxhhMxU11ULm5mq/IM7NKssWyEliKc=;
        b=I9tgyTFMN4CiufXa/1XW78VJxRVEL0AmFOB3e7ERlnVhBP6mO7I/jNqosMPcmDGuc5
         Dx5tqePc8Gb5Im/i6wsGfDXUNA2exKP9YHBJEw4Q1SNV+V+asQfEECNG1ZubOv7n5Zzz
         BTq3hMN9UPWSe03iZRiyWIiWQzmAIwaFZ1R9Ji++hfljkbmUcOufvoMSzPLFOckcZQWh
         AQDcSjq+j16ZiJ/503EuD7VIHSUuon95FduN4Da2fIEmoNzdUtugSofltBECdwlkYcDq
         y4/l0ZAISxRggjShHou29YcUWj4OKKrze46/b7gaa7i+HQ74v/T5a+nJKt3Mr/yVbziX
         vM0A==
X-Forwarded-Encrypted: i=1; AKwUvBx+ymZcs3Q8uedAfoD09LRatmEY+GwCSYMo8TEDaUtRURFSrDJltjVoLnkceGAKRQlugiHyOTjpB6rg@vger.kernel.org
X-Gm-Message-State: AFuF++lrrTTsLGb+DnEfv/SnknjZN+sFxr9D6EC1XnKSIBqsrPVBLn9m
	ysGirdDiMqIDGgVXVoyC6g/zvzDISZBlcWSZrNDmmLREwzprKYBKC7WR/ZQ3qBSZItz2DVba9pd
	TwHNUtOl7E77Wlz431UndTASn3GPm9Co69szAcZrG3A==
X-Gm-Gg: AYBFou25UfFCKfELvWWqlFskjK3eiEAH+89ZZvc5cGFiiW7oWPeHMuK4MMKcFFkmUHd
	RR+khT3QjjREtzkKYoHo2Z0judJRuIiAkjm/etGvdfYpPTzoTJcCfXovG0efp/L60S9DQ3zMKrf
	7An4U/pqfgFF2kXeE7sROl8P735MD6OGuTztqzU034gKLtZNPUS1Y344Y+D1PVXE1UysdO/JMwD
	Icf3i4oOWlaZDbmSV3E3HjM58sC1dIP94QKM9gb80lGg4UhVY/03DR7RZgdOGBNdb7i7PWFIr8B
	XQFOmsw5SEMqUs7GQveF5e/gWWD7Kecp1tjmSAFNB82lCEhSiW7TNSz0chdCCh28LELqAkvtce5
	4MqHPLN8oay4=
X-Received: by 2002:a17:907:1c10:b0:c29:286e:2e3e with SMTP id
 a640c23a62f3a-c29666d5f9dmr280604466b.38.1789164706055; Fri, 11 Sep 2026
 15:11:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Avalon Vargas Centeno <avalon.vargas.centeno@est.una.ac.cr>
Date: Fri, 11 Sep 2026 16:11:34 -0600
X-Gm-Features: AcwNN1UKz1EzNqNrYibLG4EW7is5QWZ2Va82YNgb4e5YpYrggY_-TnFTnLexsys
Message-ID: <CAGXpr54Bn9Wf24asY2RcXgBNLy1A16=U1mtFx7mKeNK4CCOCYQ@mail.gmail.com>
Subject: [RFC] Dell Inspiron 7441 AUO0BA4 panel backlight: PWM configuration
To: linux-arm-msm@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, neil.armstrong@linaro.org, val@packett.cool, 
	bryan.odonoghue@linaro.org
Content-Type: text/plain; charset="UTF-8"

Hello,

On my Dell Inspiron 14 Plus 7441 (BIOS 2.16.0, aarch64 Linux 7.2.4,
NixOS), the AUO B140QAX01.H / AUO0BA4 panel originally exposed an unusable
dp_aux_backlight with max_brightness 0. GNOME could not adjust brightness.

Panel DPCD bytes at 0x700-0x72f:

  05 9b 91 00 00 00 00 00 00 00 00 00 00 00 00 00
  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  00 00 02 00 0a 04 0a 00 1b 00 0d 2f 03 ff ff 03

The capability bits indicate PWM brightness setting rather than AUX
brightness setting. Inspection of the local panel-edp and DP helper code
suggests that this capability combination can leave the AUX backlight
maximum at zero. This is a code-path inference, not a separately verified
generic DRM driver bug.

A privileged GPIO snapshot showed PMK8550 GPIO5 already routed to func3
by firmware, with no Linux PWM provider registered. VREG_EDP_3P3 was enabled.

A local DT overlay enables pmk8550_pwm, configures PMK8550 GPIO5 func3,
adds a pwm-backlight using channel 0 and vreg_edp_3p3, and connects it to
the existing eDP panel. The existing panel enable GPIO is preserved.
The chosen period is 4266537 ns, borrowed from the upstream ThinkPad T14s
LCD setup; it is not a measured Dell firmware period. The brightness curve
is linear with 101 values and default index 80.

Validation status: the overlay compiled and applied, and its connection
was checked in the compiled DTB. Physical brightness adjustment and
suspend/resume have been tested successfully on this laptop. But I have not
measured the PWM waveform or tested other panel variants.

I can provide the small overlay and further test results. I would also
appreciate advice on the correct Dell PWM period and whether the
zero-range AUX backlight
behavior should be handled separately in the display helpers. Thanks
