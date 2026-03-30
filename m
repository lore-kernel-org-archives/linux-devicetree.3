Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C1A3A380D
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 21:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774907700; cv=pass; b=evDuO7MSGHBJ4hgUDnOOBu7rzLBu+IVCt8QAXEmfnrWWXEyssur6PcRzXnVuPv03RW36uagY9kKJf6YH8L5uATF9kTE2GGmacEGZe9UlDnNk9RTpBKe6EQCVBQp1vEqM1IOnG2iXx+UXYlFj6R1Fy7SpK+T6Q54Q+iKlTVmivMM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774907700; c=relaxed/simple;
	bh=xN/QkzMYPIlbhAvsrH44ktU+4AeFHj8GPyLj9MABI9Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k+6JTNMZqI9v1zfBVc2JlGuXoquzBOIvYydeLUnRjziI7lI1TpmfZ2bF5ScnGs/frHbW8my4aZ2nx4R+MbfivLtthEDU/fufFkz9urfab2U3UKvpy3g+ldMvLciSOFQNNsSHA203XYgjHBU096oz3aePtMGywua/oLG5wx74wog=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=G2QozNkI; arc=pass smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="G2QozNkI"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2b2503753efso13421995ad.0
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 14:54:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774907699; cv=none;
        d=google.com; s=arc-20240605;
        b=YNBhZdTD9lrYjwzZ2Vtm1ZkO28LNyxZBmADso755VwjEVuI0cMQud+yuV/A5k6g9D8
         ezXIBWaSvWHOxThwmh1GepGnE67wMwFNb1TfXFUDKB8iIZerk4s34N6/cL1g0xi8U1+v
         NlDlRmwJHh4BVY5c7t9Z/oJiZ7P37KkrjzZMlJkEZnsCs0VqFR2YDCiPdOByo/5CoCD+
         lQR9Vn/DDhCUe8K6sSoyXhrAHdDrPWgdp3ls19eps/ugdWhFqU/kWNegyFTbFtU4q0b7
         sk2G/yd6EavNgAlVcxhwtdf6410Uqq49QQIDAWR8V3k2bNoVJuzGAZFBeLBeD44B4OKB
         NrWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xN/QkzMYPIlbhAvsrH44ktU+4AeFHj8GPyLj9MABI9Q=;
        fh=XMbeoZCXMRBSoI6hjq+odG/QLxLIp99yTMhudfvTmQ4=;
        b=c+dBNdCtUs4EjnoWj9PtArePKi4T0jm2qqlbu1U7XGdMWAFvu6PIVDa1W4F00DlPjY
         bQxQ3fnLgd9zi0o0Q5xHmafLTlZhs4C6R7XyYpO5n3pomzfWfS60ukfQVuO6/IwpFOOz
         Ee59lGCSZUWMRhVwjvkj4ukxAuDilYtni2hghjQd4VhYVBjPgq3eNv44AqPFqtglkHYx
         lwbPomMFGYe8Y6wdbp8dy3PBgVuuFh+6ExasT+nhtPbnIx0K3+xVtq1zTpxDUyP8NtIF
         bzrnsUi/JevRmR8edJSV8umFvokp8AqWCA8a3wo6vtu05v2kmL9L7in9U07KCLaokotb
         Ezcw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1774907699; x=1775512499; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xN/QkzMYPIlbhAvsrH44ktU+4AeFHj8GPyLj9MABI9Q=;
        b=G2QozNkIg4zrjrvYO2TT9ExjgSfTjtuK0Qa3IXbWjX3/e9CDFEMbYRSb8TAcLUlaNR
         qAfcSsA8JMl1DgRhJXVKG0ri5D7QTgOM+CA3OSxbWzHScT1ioDLdVxoO5SXuyvpC5ymX
         p8lt19k8rZdGzZEiUQLf2UO0qaKHN/+h9u6bPBUos/bP8Eyl1n0egE+LomzSb5Ls+Gct
         7PazMxxxArwfUdj9VAA7WihLdBZvGb7l9h16sqDeBRirT9EmTjxZH1q68l38mzZn5806
         yElO/ET8Vy8ojtQkyN0EaDxpTfjACoeYmZqzgWpMlAWTnTuady8PnJ5BFaPKJp5PqrOJ
         ZIKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774907699; x=1775512499;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xN/QkzMYPIlbhAvsrH44ktU+4AeFHj8GPyLj9MABI9Q=;
        b=K67q/cup8gBv1mrOF2wSmRdZFe2FN0hC+20EcJtGE0OMLd9ldxCt8aWzd0XC18pRvg
         OuikYs4lYkIvGDYoAGh6ANe13r0VQDpO0ZGBtuO/L5oLhSvOl+rCTdE8YZmSe+ryVHrH
         /tUzcyc/Wg8xZf2vzYduP/ijuvThmG92Lerkvlcw6fJsCqez7m/3PGzrtyyboda6ELO0
         1qDCbBiu0G/mv1hthSaF1Bhlq6PC/ZqIEiWhh9eIp/ONctLikwj5gAG2RYSjxQfvord5
         Y8emzmWDN9O4E7oV+z9VWpJhE1iYViL/1gk9y1vtthcUL+qKHDwkh5Y4jN/eYVzRGao3
         IrzA==
X-Forwarded-Encrypted: i=1; AJvYcCUWuYCap6x8CDT6+CrpFX+tOvhpUFxHc/5KLdnbNfC/GiNcjd8H6h6/y5efL1ADOoVQGegCGclS0aqe@vger.kernel.org
X-Gm-Message-State: AOJu0YwAh+lHMytc5s10yD/HSk2WOuQMi+S1uLA1jnD91cgYFJ7O/I89
	5WtFTzRQURRlNJ3QAu6hroYF8+iI277kT8xn+UdHBlseBeCEeIIwStyxWWqDcR9rtaLcgm2+V0D
	q6a9sb3T6LsihKPg4TqUq6tCWl8WMG40=
X-Gm-Gg: ATEYQzyhynR63dK8+FZ2jwC1hTbhWrHTALmNiZ+GNha7/CzId/9yJye7SxzNgjOcvwJ
	Vk0Mqgq6lgOofG/0mCrGepmFb3ElPCEbwxX4YdF/l+MbGBAUJlRwWPKH/FK/aHEfZab2wpv6cIo
	di7b14qJ0F2rKMfAnB3hu5JaYOKDvhQhzghtq2KIC4LA4VzOuXEjA5FFxbk4QfaTC4PtW5F6Ntb
	vTvrJg+CONGjJUzndD/rCgqJK7a9hF+zHv7RjxtwL1yxOkmeEtdRWb00hdG9tHvi2kUh4xEOdRx
	CAOnfO2NzU2M+BxJFqbHdct3qidmm5r3zApBxTMk2VVzPoEyHuw=
X-Received: by 2002:a17:903:98d:b0:2b0:60f1:de58 with SMTP id
 d9443c01a7336-2b0cdcfae43mr147607145ad.45.1774907698891; Mon, 30 Mar 2026
 14:54:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326-s6-s7-pwm-v1-0-67e2f72b98bc@amlogic.com>
In-Reply-To: <20260326-s6-s7-pwm-v1-0-67e2f72b98bc@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 30 Mar 2026 23:54:47 +0200
X-Gm-Features: AQROBzC2-9WP_iYu993gr4kZhNfXgWBsXWt6220pBOvgiFbgiwhI3kcyG0LtR-E
Message-ID: <CAFBinCD1GPP82MEBDHg3BwCJg6JY5k2HksEt+kCB=YjnYTO7Tw@mail.gmail.com>
Subject: Re: [PATCH 0/2] Add PWM support Amlogic S7 S7D S6
To: xianwei.zhao@amlogic.com
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	Junyi Zhao <junyi.zhao@amlogic.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Xianwei Zhao,

thanks for your contribution!

On Thu, Mar 26, 2026 at 7:35=E2=80=AFAM Xianwei Zhao via B4 Relay
<devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:
>
> Add bindings and driver support Amlogic S7/S7D/S6 SoCs.
There is an old report that got lost, stating that the current
pwm-meson driver has an off-by-one error with the hi and lo fields:
[0]
Since you are working on bringing up a new platform: is this something
you can verify in your lab?
To be clear: I'm not expecting you to work on this ad-hoc or bring a
patch into this series. However, it would be great if you could verify
if the findings from [0] are correct and send an updated patch in
future.

Thank you and best regards
Martin


[0] https://lore.kernel.org/all/20241225105639.1787237-3-gnstark@salutedevi=
ces.com/
