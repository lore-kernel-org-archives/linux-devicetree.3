Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794294741;
	b=UIENW25YgT7JyzRRi0vppLDlITYXev+u5vCmOA4z5bD43haxc0Cd/Lb8jNeXpRwYlIS8
	 yIvLYwHht6Lqmu3b492jjx+/Hkl681PEAMhIkadY3xj2PkIGIuN1oCsafOVsMpYECFrnt
	 x+x0HWbb77EI1j8K8llYetoncWPZhnASxDIagiQj68PXEI2EOf1AVJ67y17WfvqZzdCF5
	 o88KWWPEGyySM7eS9fj2WUOnpX6stFZXXnAUpwrcEYRhBmZeFuOX4Fum+3icBDLa8b828
	 3DAZHavnhZv5UlnJk5uphX1vCELIbzfkcUuGZxVOWF89JxsQONr7kapwifi5tax+wkw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794294741;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5yWyiPml5ZX8N8f2Jc7eehCBNHyPBXlyreXyhVWMAHE=;
	b=ncuDiCS65Rz3ztGLZi4OGStQsy67x3outgAKUFvgshBLU651ml/hEDW8MiHVMpjXTIr/
	 ad2B2IbvV3OEi2ks5w52E//wWKMB6jUf/0lr3o1BuEnV06KLmxGFlgroGrzfMftDg5hON
	 NEGqnILX7Z4dERJl1aUAtP5KwieqhRPFEonlNuY15V/h7LboIR65w/TMmiI8OmknX/Tyz
	 YlBNFqGm9MIv1TKEsXrq5i4PWvX7PtY6YZZIFJ9eYwZY8pKViCbAo04cSfZ3WV3HnAwYY
	 MT4gOxw5iFwLXN440uyO4txaWPEscLi4aliFQcuSZngKF6g0XWDLcxKbnx5G7zMcoFg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b="fbla/A9X";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.42
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2A4606A325
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 07:12:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B2A4606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=fbla/A9X
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-67921b515a7so1814591d50.2
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 23:12:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794294739; cv=none;
        d=google.com; s=arc-20260327;
        b=Ha4Qs7In9T0d9b6iEvMkVpRWePBhvdSRnp4Nkav7drwoexX8JDlpsHnlCg10XVcAJi
         wX1KT6nDZEamodNgCwfUdT7CDXSUfBsRIuyMHxQ/QYW47mWbKUd4/9v8oegoIwa0tUsa
         kLR6lnprUASN7yHiUDGaddJJZ1p9j61wAN9eleaOijOIppsTImWCwY+A/q4KZ98xDi1x
         XnHHZ1GVHh1attOxOz+WtYFQZnL5fF7wJC1ypjo1oNVGCg0h2FHqeR/IIo1yDVZ62nUs
         9vWRE6uAQqdZFSQhAuiDNWpkbyXeYsDONq2mWbxdURuKYVFeAM2xXbt9izBZkhoeIV3N
         4mXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5yWyiPml5ZX8N8f2Jc7eehCBNHyPBXlyreXyhVWMAHE=;
        fh=GvPa+mLOXSdVOZSnKkuGjQgIFxFX4Ql06CDwmHUldjk=;
        b=qJF+RzuzxvJnZj6xgM+NAfUXYIB95qCAgZY7PfmSPb7Dk1DhLbiFfNNL5Hr3scZNle
         lpjkm7PRa0H1WyHxo64KdYPyJYWMiwgIA2MuTRzUP6lh7RAAUu75o6w/VgM1v7FLprAZ
         d6R3QghArWFRs2kEJWsQKzRPN5XF9YNcOH7D043eHXm6KFx+d3M/L7toB6K1mktJQhoY
         cmrBftFcndUjnuMFA/58iwEApuG7NZ6Bnix34kAa7CWxDrPBOjES8ScPtuU3w7+RKCx4
         +UKu+MTCYWGXxvd6fT6LUwMlMNtzDOtgHNHMwJwL1VEfynAf7Qc/h//NojfpgPUwj2B+
         vRmQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794294739; x=1794899539; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5yWyiPml5ZX8N8f2Jc7eehCBNHyPBXlyreXyhVWMAHE=;
        b=fbla/A9XlF/lOq2bcG6iZJPCqOGC/emuDCdTn1krs+v0qAsMuaTyS80O3LxALZZmIb
         xjDBtyT5AkLFFP1fIRpXPJDwqGMFDo8KvTpFSfFW9kBZyhqqE+r6kjNTvb4m48XHzmar
         vDoxjsCGVnyLYnPDthxKh0nVIe+czDQ9Rx/E1sc4mzTpy07fjkputPxJk2GI45wlZV3y
         7muQnqIgNYGyAiny0chTZlUz5JSMyzsE7WbaSY8NqcuHN4Ucm8uMe2C/MVMKu+xgghP5
         Aoi2rVgCbW2QSyRxNa55wznfOwYZv64/7fGeGjO5sZ9Vgv7uAXur6s7ubM9VZMUCTPHZ
         EOOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794294739; x=1794899539;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5yWyiPml5ZX8N8f2Jc7eehCBNHyPBXlyreXyhVWMAHE=;
        b=B9SXl7uB2ZUuxv71S5igKprogpeNS8Lt6twF8SogtslelRH6E/lCAo9/n8KTUR+K4y
         q7WPmQFpSJ8ZN0ZdCxIAqbf3NFfiTc1ByBxbaeSxzLCioHFfI77mDtX/7qfzOF7RGnLJ
         MLyBfDJPyV9bsT3KGAmnGcYfkqEDwkZwPqkj3Vm3mHKVq2PJqwyPIXMMBFcyAif7gfR4
         p83geyLlOSk+6kZZwh+wlQsvoTwA18rKT0STcW4UldiLkX7RY9qU3YEFwEDnKTllsS6J
         GvcZnwsLZSUxEPC0S9m3NTp+9UFut4/F48lHCHnQsQ0sOHB0g6No0CLR1wyqF4JCHGlK
         lsuQ==
X-Forwarded-Encrypted: i=1; AL+hErG+40EQ7Mmc2qJR+2eniH7D+29gfBpmzadRcpy/L0xPe68i5SxKm1Ukj5r1KtwD3/103+4OB+Ym9xNS@vger.kernel.org
X-Gm-Message-State: APuU4Z+JtVmJbCPHwqvjEFBAxCxCWgn21Ney/jhm3r+j1drCcoxk8kms
	HzR/tR3ROO4l5PgVzoZHKGKqQp6szTybCYcK6A1L1mYRe/sL/e75nu4ZHapqQZCb/0T1OsadHST
	aBAYLOhHBEtIcuJD3CB8C7LEbXMI2FOI=
X-Gm-Gg: AYBFou0T+dbhAINs1voF1dyEX/IWqWoG416mnZPsEYrbMIVA8fXjTX/ESbWfOFiMz2l
	7Z6Knt4pmM8VWaqEp2eghpTSx5M23WTMZHD14VHJOJ83g6Q3RdFwaexERxPpybgfPSs2VikoWet
	QdhBtzsRsHu/2KKW3iFbCd2L+plKUzqdPJs0mvMKWKcnllcTaiNJBWCRA4zMsH8NaLLuQAto+TT
	EILU18IUWqTkmF9oLMHE+P02WKCwY65E9xn3wCHao+0cq7I5no2ACkxoys/nSi3IOZO0h4ZOWj4
	DO3+QWZQjyeRAy511EbfzJBDBsrFosTU3cYAMEUbZRDH0KOJxeQk1NWN2SowJ1L/n0mwdf1F2OH
	ZUQlfXd7o/xaSHtPLRZK6+QQIRyrgutoXzUJg
X-Received: by 2002:a05:690e:c81:b0:679:96af:e306 with SMTP id
 956f58d0204a3-67c568269e8mr1104943d50.56.1794294739207; Mon, 09 Nov 2026
 23:12:19 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106101954.46907-1-christian.koever-draxl@student.uibk.ac.at> <20261106101954.46907-3-christian.koever-draxl@student.uibk.ac.at>
In-Reply-To: <20261106101954.46907-3-christian.koever-draxl@student.uibk.ac.at>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 10 Nov 2026 08:12:07 +0100
X-Gm-Features: AclHuK-NNQu1JbIxB1uGpolHVv_SmZbveDQeysJSYIv9CiWjgRe7D4MXv9gg7C8
Message-ID: <CAFBinCD5aQ_AsNxELgUd5yzXsghUVQg1tuGtVvF-bmPx+AjaUA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] media: rc: meson-ir: allow the receiver to wake
 the system
To: christian.koever-draxl@student.uibk.ac.at
Cc: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, neil.armstrong@linaro.org, khilman@baylibre.com, 
	jbrunet@baylibre.com, sean@mess.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	=?UTF-8?B?Q2hyaXN0aWFuIFN0ZWZhbiBLw7Z2w6lyLURyYXhs?= <ckoever@outlook.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 11:20=E2=80=AFAM
<christian.koever-draxl@student.uibk.ac.at> wrote:
>
> From: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>
>
> The suspend callback switches the decoder off, so nothing is left to
> notice the remote and the receiver can never wake the system from
> s2idle, where only Linux interrupts can wake the CPUs.
>
> When the device is a wakeup source, keep the decoder running and arm
> its interrupt as a wake interrupt instead. Boards without the
> wakeup-source property keep the existing behaviour.
>
> This does not affect suspend to RAM on boards whose firmware watches
> the IR receiver itself while the SoC is down, as on S4 where BL31 wakes
> the board on the remote's power key.
>
> Tested on an S905W2 board in s2idle: the power key on the remote wakes
> it; with wakeup disabled for the receiver it does not.
>
> Signed-off-by: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de=
>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
