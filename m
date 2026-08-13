Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0482D1931
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 23:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786665050; cv=pass; b=Fa1onNbN4IgXzB4nd1KBFXWR6siAo94oIWcd3vdoZM7jfx8rqESsrWkqAH9qmKUFcppFJFs6ytYmCf0Xmk93a51vCJQeV1+mhG4jm+EAsofpMh0845h/PigZmgq8jLaTkfmVwl0zQZLF9H3rcfVUNbzdMZzcOcRUbuGPAZluqrE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786665050; c=relaxed/simple;
	bh=T/dfQBLHu5s8TsHAIwVzyPX7PzgkH5dDnFw2MKqwf0g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sl9Bt/Q3ut+3Y2zLYxXa2EzqdynkiUB24USWptcvBbY/TXxls9Wi8xSYC+MP5d0RvUNiaktt4ZmSQuTHakoKtW1aIAe3gbO4LBrJUr1b+dGVyuKMHY295jfRmYTm1LIO5uPrx1Ed7FW5QY+4jQi6m1E71UcYa93TrhRmtQVq4FA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UHwwSk2y; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UHwwSk2y"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6a0794669a6so628937a12.2
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 16:50:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786665047; cv=none;
        d=google.com; s=arc-20260327;
        b=YTw4jOIzDIFQjIPpjoGzNJTWLMvMKRReZgLDsFelwgaq8dBdscZ+rEFvtRp09riMFq
         7tQqPxiDhFy8Z0+yy+fXU62rZXHFBgm+ueagKY8hNTbRj5lfXDjyI7kAi3kw9td6ENko
         tk7p270A6V55o07smMwHj4uFe+Afdc8uPZIkPjVKflsi2rYRAsVybRSzrjLdeaVtnqd6
         b76V/XIBBkjbPJqiWOV3/TlHc4RkyHrKXXBUT1sh/YC+hApAuPB+k+i3jvmiOuMRyI0g
         Djo/rbRT3VfGWzo1r7jAfwEPEzfBHBFT5pbYVXSZ98MD8WqoSNIUryaEyODBjVHD+CkN
         EkJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T/dfQBLHu5s8TsHAIwVzyPX7PzgkH5dDnFw2MKqwf0g=;
        fh=pOmahx8pKEBtBFHYKkPYlAhj3d7F6JHA8e+J3XknlLA=;
        b=WtUsJQ4IG0PRocdlXdpahgdAQIBRYGGvcLarnl5lqKqCU1xfgymeyNUuJNN0ZLZVnO
         CgRN5kJUWYQII15dBLI9cJD/5zX5M22xsZz3YnQ6T2RSeyyL3QM57pVmuBvGOsBPnwwS
         vAOugBEv8QYDUePbw3HNLQEV9BC/qL2NCEPCnd8aRiMrJB16naQqh/qsR7HwtVZmDAvJ
         x3bKhu6uL8nDeUjbfgvcScWcl3u77QVerQ4dtpxBmz/Qo6B2wTlMk6ml8BIwno3PM2Ht
         uHUuLzjOBsBUFCs1KRLhAhb3r1el00s1tMERogKbnLrs7+HOtAhGYD+7zDdoN4oFKF9z
         113g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786665047; x=1787269847; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T/dfQBLHu5s8TsHAIwVzyPX7PzgkH5dDnFw2MKqwf0g=;
        b=UHwwSk2yJD0iZQ4o/5JsmmYt6i/+LdGM1X5ymPM7+4cmg3oh6Ka0CjwaxxouEicWeg
         XaD6VGnj7l+CMzm6sBiVXsMCq+D3z9N9gGvBBNQMxiuZdfenA0BGiw86ir57xvSt+zTc
         Fcdz4q7eClGtKLF+hmFu/9V4RM12Sd4ObsnWQss6DtqgytCYLqRD51wkvr890fg5FOci
         UdPrni6lsE4fDDnqtT3VACWLNMAviuC5G1Bn3OAMZflKzk0GWPZ7mzmGy3ZutLwu8CMV
         4O6Dp4TzMkGx66vQ81AM1r5psvm8/2hIVhoGX9mthWeF8cB6Z0p6SwLLgk+pMx3rOkWp
         P7wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786665047; x=1787269847;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T/dfQBLHu5s8TsHAIwVzyPX7PzgkH5dDnFw2MKqwf0g=;
        b=kQrrCntZAgaMm1xUKCDUHSHkvDLk+ZU8SUAgwPUffiI63iBPTieA2tdEWhXKjQm93u
         LOSmSrgfMH96WOkFRm0VNR67kzEjj661iHXM8gxxroFS0NrIUEiZ8izcTKmQG50cEfcU
         ZIYKZxGrfaIUSegVxx8InRsk4OfRYo9TC+davu4sf5/TT+OqqxX30DrbB+uoYhNiXS4T
         l+FxR2E9dkJ9F+QYMhnakCkWDzup4h0O1uTRae5UjjXfZjQUDa/bl3jUT2Y0Hr3BI4ZM
         NbFdJ19SPKCD2xhHaJH5m09hgmZN9ZdYZ4K+nrd3N+QQywVQobHQiXd3qdM2BD8a+BUQ
         fN8g==
X-Forwarded-Encrypted: i=1; AHgh+RqN64jfBKv+QgUIoGibexksiB48LTV1Q+hCwbPzoeSbJKTnGNC75OQvbdkyZMha/B5JgeVK2suZlres@vger.kernel.org
X-Gm-Message-State: AOJu0Yx35I7KM/CjnZOVWuKnoxJz2z6wrFvIp8jt+JRWMJ2czVl5Y7Pg
	pJHGTMjGRUrcGnrqA1s9ZG59Usd3B3dQoiBM+nYpkwGvYSopGkeH/Cb1iJObLdCIhUInSE12q6g
	qXYxKE8vZBWLPd515UfjVKLG+lHhcEC0=
X-Gm-Gg: AR+sD11GbZZjNwkUbqe+Eqhh+lDertyGYXX1IqVlcvS/p1asUYG1BuJcCxEGCKJkHb+
	FyQ/ebLEGXFMPbkZuolh5yaoOD2WyLW3aetNrcFgOnFpgby7QjUmJcL707yrLo9HSeh8F6uCz08
	ed44CYpTbOiQXYnv/NXH3mrwO1IrMxIEXJRMcD1IvIkQ419oEamzpjjf/eaMn7XtzX5gg2hv0Jp
	SKPwUvtihyHGn66I3YHZXwXKgkC0CcX06Tt7o7ixou65Dwrc5qtMI3A3mSqaJ8HxkVm4GU43WYt
	hP6vdRZRgarQt+rFVHh42O9zmjOaShXinrqSP/mQtRkw
X-Received: by 2002:a05:6402:504a:b0:698:ad4b:abf4 with SMTP id
 4fb4d7f45d1cf-6a38a8d7c48mr896349a12.3.1786665046571; Thu, 13 Aug 2026
 16:50:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260731215043.30392-1-maximpedraza@gmail.com>
 <am2mvECnCcO9IxuI@monoceros> <0219df57-06e3-4776-afb1-d167cad2e795@gmx.de>
 <CAEUXW=GUY+x1A72n99i1Cpgy03jTYv3FPAX5nY3DCHqmeq9YVg@mail.gmail.com>
 <20260810-devout-pig-of-performance-595ccc@houat> <CAEUXW=GuHypVE5Xre8AQBmkrcUbPQxh03Lq8os=kjcLeGahOgw@mail.gmail.com>
 <20260812-neon-asp-of-completion-e9349e@houat> <CAEUXW=H-o+fqBjH1UQG7=UTm5x1a9Cj++XJM7twvFU4vJC4UrQ@mail.gmail.com>
 <20260813-ethereal-sawfish-of-downpour-c23da9@houat>
In-Reply-To: <20260813-ethereal-sawfish-of-downpour-c23da9@houat>
From: =?UTF-8?Q?M=C3=A0xim_Pedraza_Padilla?= <maximpedraza@gmail.com>
Date: Fri, 14 Aug 2026 01:50:34 +0200
X-Gm-Features: AUfX_myW-QMGZXXJ8a5tVXZ3ZTxXNko9mUPevusA5ZZV81bVlEs6TTsn0To5954
Message-ID: <CAEUXW=GE1atEpG3=SHZhZR4cAXvyMBp-K2n967MVY0YS9AwcWA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/6] Boot logo supplied by the device tree
To: Maxime Ripard <mripard@kernel.org>
Cc: Helge Deller <deller@gmx.de>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, linux-fbdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

You're right, on essentially all of it, and I owe you a clearer account
than I gave.

The 3.4s I put up was our 4.19 product kernel: not an SPL/Falcon build,
and not one that has ever been optimized for boot time. I should have
said which system it was instead of holding it up as if it were the
floor. "Suboptimal" is fair.

Reaching for an initramfs purely to paint a splash early isn't free on
my side either: it pushes the start of the actual application out a
little, so it's a trade rather than a clean win. But that's a detail,
not a rebuttal.

The case I actually care about is simpler than the one I was making. As
someone building products on top of the kernel, I reach for the simplest
thing that works, and the kernel already draws a boot logo =E2=80=94 so tha=
t is
what I used, the built-in CLUT224 image, from day one. What pushed me
past it was not speed: it was one kernel image feeding four panel
variants (two sizes, two orientations), where a single compiled-in logo
no longer fits. Describing the logo per board rather than per build is
the whole of it.

I'm well aware that "convenient for the product engineer" and "worth
carrying in the kernel forever" are different questions, and that the
second one is yours and Helge's to answer, not mine. If the verdict is
that this belongs in userspace or the bootloader, I'll take it =E2=80=94 I =
would
just rather have it decided than keep guessing downstream.

Thanks for taking the time to push back. It was the useful kind.

Max
