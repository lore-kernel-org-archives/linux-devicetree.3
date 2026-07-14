Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8155B44160A
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 19:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784059128; cv=pass; b=EINZKhwOfd+PJbEgSMM/GzX0K2nWi6mOBrK9HnYiZk8DBRvP1MX0aOMa5+kU066BEJvlIHLO20zdSAt1jC0YZuivCnghwJztiEEPundlJKbNjKoq6ARZzYw58JcW0t6pkkJ6O2iRh/gg+N1hZv4guwensON24gKyS8j/5o/14+c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784059128; c=relaxed/simple;
	bh=XZ2kilMID1jdVFb3NXkl2ELqxMEbMA2hedlSLEWHaXE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kdO0pGj+VYYatEihku1gUI2oX0sBIAEeliAQWpSeaCCIwn24elB4bJoFXY5Z56E4J5LDVTHr7AofJ7oiRY5j1j/qej+jTlOu9OIrrvQHMiD0UX7ESE5Udvko0tylmF8yM02Gs9gFuh0roMZvcEO0n97Pvpwb/8GoyQ4YJdZ6BmE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fGi8qq/k; arc=pass smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fGi8qq/k"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-848643382fcso5281986b3a.1
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 12:58:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784059127; cv=none;
        d=google.com; s=arc-20260327;
        b=GF5ng524ojQ9mJcefCfBC7vtWTYzyW9MzLNAmxKsLoPfJ+s5gaYMmA2BN6uq0KK+9b
         CnG2Gojskpb5x+j27ojApgrafg1b2XOcRwXfDolUy1cSR3tSgEnQYdxO7u2s6QYMEuWi
         OI5WNnTEb26mkaaBShhiQogzUE82lYeKnNkHoOCtfpH9UOm794ddMmm1dt4u7PIqfHnN
         7FbJZW/NrP4HSX4eY4PBonM+Tl0qUh9h3JMPEIA46GXzJmPrWWlkAujV7etvbRZvtPZm
         WIfgJ6/mE8slCapDIhLBE2eOGewOBrugOlKuOS8Nn0FLyMffTqQhLf1oDMEZ0w+njScy
         xLZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XZ2kilMID1jdVFb3NXkl2ELqxMEbMA2hedlSLEWHaXE=;
        fh=SzVtZ2Ole2ZiHPFwpWSms2Bt/XcsZ007pe+0qwAFD80=;
        b=hvuMGys2gTwFvqSyc+UdgYGBEF2tSRUjRjIeIeUDoax7HvVzXxXNt3a/9Dp31tYd4s
         0TlFxaA2mU5uUfZQg/TNcKzQPfdOKdAzf3WUsbsywpztclnYT+imkPlRFVkCmT+wI8pB
         hngmlSwfCfF7se532nEhMqSelsTvxQD7uVrvEkYyk9psLnuEEcN2XCx1Yw3EMdAAPvJM
         nJ4h+pawYf41R9cHXoNIVfYPesQoPZ093uKd5lcxZ0JlP9741vDGyVYhVTklRRbNmyBf
         ldoiCjzTh0BL3anIRHjgDHeA7rYj0NA51Oat5iGGqrpkn80wWq2qERA4z0Sl13o7h4kO
         9b1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784059127; x=1784663927; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XZ2kilMID1jdVFb3NXkl2ELqxMEbMA2hedlSLEWHaXE=;
        b=fGi8qq/kucGNDnd6vWzk2Z/VuQZ/9XKp5am1B9qDjYWpOmmsGEfwjdNl5s8lBPBjVL
         08+s42vAuUqN0KRzeKyx/1PIxgt0r0TggPaZVCtenNPpzN9R0HIfoMw1VEl0rzLGrgWF
         T8PPSguM0JPFTI40QtsFSqVKZaINfwNNdqGzUskoyBIZLxa5R21Gke+wUerucpEbRQkq
         8LD84UiK3AcYIMkaAFd3u8tlhgRy/Qc2W3OGHSD1sFuKLSmFKzi5JSQyMW9t8SMWHp3x
         iIPOWiOIrGYjcDfysPccekvYlXqGbFQLL56JXcFwtSyTt/TPEKUgcabuq0t/YsUrJsyA
         g9fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784059127; x=1784663927;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XZ2kilMID1jdVFb3NXkl2ELqxMEbMA2hedlSLEWHaXE=;
        b=V4u8OCnaKE38GAflkGjaPK8WD603hHVsG7lLWw9gmO/LAk+koI9Xc2oqT2z3ZMc5hP
         0VZ57MPTEJjf7hBDrae1XUwNCBdKomzs2gAgmswJ9nrFE/SCCk8jfIlE5yXPX8HtpyWO
         Pv/Tpfla/TO9vOsEwpThrC1TbpuIwqY5wZbaIyH9JCyqr5+uvDJLQn9oW0eEXlmFtf/R
         pb4DChEg2HPexZAwjhPeN1z7UXM13UsCfJQxBfTd+Xy8G3REf0eLAx4ryyeNg4rN4oF9
         L1onsW5z/L2cL9qFwvR28WjSUZNqAR6I+CNBx4jl+xCZ6y7ZZN/PwV6qXfTpgFwFKShh
         S+6A==
X-Forwarded-Encrypted: i=1; AHgh+Rqz1WA2WyQASO/YSy97aibbmr6VoB0NA4KOb4hqF+1RLlA1ieGvRDFyTlsV5/0JOYKebhilXWqMZYsu@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5ZrCTY0mu3RVc27t6bNU/yiQ7G5/kRqa7Ds+6p3IFaPQq0JZq
	nNP67wUQo6Y/Iey7SinqreEWsy7JmIFA5p1BwrCt0b0Irx5ZDTv9DG/gKZYqLM4PxXmgn4Km74/
	aerzt0ZtozEXWf+8ELZ0EsiEYUEpSwFE=
X-Gm-Gg: AfdE7clkMdA0BVF29KIHbOkLcGwY2wm6XLQQNZMPApVACCLDFCi3BcfAYoKGFUVpF8+
	wkw3s0tx250rjP4JJpUD2cNj0oTMha9rm8qjJgu8nolIBQJC9IYLBD9JoMZ511GxYzekvwKqSz+
	4iVnFmRxTb8eTG9mpgmhkmnurYTjEfeiexqBfD1v/aHwctT+eXemcM7VIuj2XJfrmuBOceQtfXD
	uTk8VCXmeTBkGp5usT06SPfkA4dp8TbTMt2hsJRXg3Lm/8dJlopsXOu2gtsEE261ZJ5Q6EgWo1S
	HGz5LX6C49IbnF6T8D/N50nXdd7zSdU=
X-Received: by 2002:a05:6a00:812:b0:847:94bb:30e2 with SMTP id
 d2e1a72fcca58-84a516058f7mr4674736b3a.41.1784059126868; Tue, 14 Jul 2026
 12:58:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714194717.596193-1-jakubszczudlo40@gmail.com>
In-Reply-To: <20260714194717.596193-1-jakubszczudlo40@gmail.com>
From: =?UTF-8?Q?Jakub_Szczud=C5=82o?= <jakubszczudlo40@gmail.com>
Date: Tue, 14 Jul 2026 21:58:36 +0200
X-Gm-Features: AUfX_myzs711Ch5m3soe1aOBMfdRnDp2aINH4666i4uah2KBLUeUm9QYw3ctKVA
Message-ID: <CA+gq5JjVnLKW1WdEYzy279tqURXqqy+JNWn9zJPfXKGHUP5hCg@mail.gmail.com>
Subject: Re: [PATCH v7 0/3] iio: adc: ti-ads1100: Add support for TI ADS1110
 to ti-ads1100 driver
To: linux-iio@vger.kernel.org
Cc: jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com, 
	andy@kernel.org, marcelo.schmitt@analog.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, mike.looijmans@topic.nl, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	jorge.marques@analog.com, antoniu.miclaus@analog.com, 
	mazziesaccount@gmail.com, jishnu.prakash@oss.qualcomm.com, 
	duje@dujemihanovic.xyz, wens@kernel.org, sakari.ailus@linux.intel.com, 
	linusw@kernel.org
Content-Type: text/plain; charset="UTF-8"

sorry guys I need to resend because of some dumb error

Best regards,
Jakub Szczudlo
