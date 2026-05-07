Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F5C3D34A9
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 11:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778153642; cv=pass; b=FDV5W0lmm9onwXouwhqGpKo2D3cu3uxs+5UwE1NWOBj+9M5aJAHYVdxoD6WS88EXOLEP14UyrX/7qzoWefsAlPDhocWDFUNup3UVycbY6BHMim9FxP3W+PdgfI46JIcOxsuL94twDnQXwoxsKQ6PdfehuwH5V2UzCh2dsTTJc7I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778153642; c=relaxed/simple;
	bh=Q20QDhJ+CkHOOmRsGydUBGFCEJTPn38DBqlv7TfBNIw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tr/97Lzagw5BhpQMlvLvKZKnKjoU/R7O48o9rteN2UsuIfdS7xQkUjFf1+ll7+1Gpyr+Hsv0/jPLeE3oT4jskCH06BKBruPvhmRYJmxWIzcUD3vk86LYJ7lFt4CKb/1sfg1ovfouKdXOPMygAnnuQsqbzid1eKmED/AqKtRuzek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RMxFMFEw; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RMxFMFEw"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a865004748so2089659e87.0
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 04:34:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778153639; cv=none;
        d=google.com; s=arc-20240605;
        b=HWEGwXhJwmWPDBowt0MBDtcfUGGHun291izsMZkNwWjLTPQ0/mC2F+C9eXvO227r1j
         hvGRGTwTX99n3peNLgCn3MhuYau0Tep6fFa8PxUPuVIZAUA6Ny1GuhhqO3zm2RSxyhSN
         /IEb8qMWYX3EDY0YhDuY9xoVgwndpsgN11HG7Rlpg9R4T3MxZhpJqf4Ms/+Jz2fT5uOp
         U3/gCfOuEykFky4ToBGjFO6398R+xyVjNMgGSFNcHy7Ys6aEdgweodB9Ot454UjDL+iH
         4jj49DvA7dG7iz9/Ed3gbTj/xngMV5FeVhBg/eremzOBYfQNgTibRLy68BpzQL/4QJqy
         5PIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Kp9wAzzJsJF4EUW0K6lSQvm+ZX1IeOPyDmz+JSnwJb8=;
        fh=jhWy4FnL3WMBs6Cs0WX9+AO/LUJgYsioV9aOVN2RoFk=;
        b=OLOhXWDmEgt0S3gB2JSXxBvcMxtt7JCzY7b1NlI5cl4O74/2e61VNTD+/Ox1Z9Rfnc
         ixTPWOs06Ys/Tf2OE7jJcoEsTuw1tUQ1B5gs+/GOKA/r5mcXXHCnfkYyVYhIRO5/BqYm
         aZcjg+p3Ewp1/MpJxTeWHVYHk15Tby0u6zkyj5uM66iaPcee5OqkQXdrAvBaeBAeAFo3
         3l5dQzRLPqk9okpmfjd00WQR1hvl0dMaC/h9rxsgRQdcg1nwLs3sZFCR7fty856Syiez
         YN1wClR64rmBJpQCIdPnidOCuN4+AigO90obSBz/Scn7jVh3A7Ekr5cURgLgbPXLZgMd
         GOZw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778153639; x=1778758439; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kp9wAzzJsJF4EUW0K6lSQvm+ZX1IeOPyDmz+JSnwJb8=;
        b=RMxFMFEw+fBfSK2LX/lGJYUYSq+p+xhFLxp9tzwnHgnwORRh6BDdhNRtX8S84/KrYu
         YNNJDpaRXum/UmdOmZH4UwG+mvB19sgHknjTjKu1NTE5BP1LwQiHMdceLDPM9OF9aDPc
         hBKK5z+xMpn7PV4lutackvCZ2e7z9BLtr+lleE3CWOz0/22Jz8nZG5DqeoTR6UlpxOxp
         fhiZPE8TbspiBc7gl/kDVloBzhpsrI7t43iIOoNgbswrZEBIsYBh7NUmGvLRcCO+17fw
         oJW8BKIoKsSfQfd0yt+vzHVXZtk2Hbhns6xYAsloccMFWUt2bKvCC4WzDce559JPVLv0
         NQQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778153639; x=1778758439;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Kp9wAzzJsJF4EUW0K6lSQvm+ZX1IeOPyDmz+JSnwJb8=;
        b=WXOk0eV2TSJ5q8nXitAqjY6vxtjexeiIsSlJFSzVWhktqCCzMDlzqMu9pu7wYP23Ki
         M3XNsKBQ6IU3z/L2e0R7cp36YyS4J9inV8fMfrjV0GFUVY/NDZEoJLMAjGGsu+PyPTs+
         tiKPKWaYWGu3gcf/BjNlxMbRCEW3HUf1DmNfsPCKYLi7A7g9yF3RHsYrAKkYZ9+s1HDL
         j46OuFUDSUJZg4PnmIcBDyOJarku2Sl870KArhn05+9RC9xVc2uGWE2kLrYJBNlpWdtK
         j36ARUdQDJtwGnECVMlSRz/WoIc23ezxNE3cQxE5zOEQqnYewfbJMJb+wDuAUmUB4/3g
         tcaA==
X-Forwarded-Encrypted: i=1; AFNElJ/jgydrm9API4SsKxrJa/WyAE3m1Jo42CUT00J1MvtUTQxVkOG8suCBe6+SYqyymQvBbgrZeOeONCPR@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8DSd/7qPG7y4zCLF2KrqRVdUsZXZGuXsxSJoJgyBcXwspLYnX
	i/O0tPh1f0PJgya000xSQlqeV7l0ERVUcPsOcLklsPOUvB5p9yOEhQQE8VTkYRoFaom05I0XxeP
	/wQAz0r06E3p7cGTSI6WAsjO9eCenoWE=
X-Gm-Gg: AeBDievCWylM322zzgDE71EkmJtrNfs0JxM1519Cfh4DBRVUP61tm3pG+lPIhfVmnJA
	9UvuRsv8cO75g6BnnPM6ZvpBmxEgBW/hPyMRZ3FwTtUQzOwFtZk2Cr3iZxFpFlZ4HZlBcRZL4ky
	lOYunt/nO9+xj7jXoR9pchtUdxPAEcqHAaXxtZ1dEpnTZXh290iEhzdsySnw1lS4F1vIEqXweqc
	3mMBg7KjNt0CKZ3PfkXfJhIR+wWzmQ9m0VcBFDSDDUAnWFcMul6KF7Yp6JqNOsogoiICNI3bvc6
	PaUyuPv1+f12eiNwti0yixI/uvEQ2+EZklDxsBTjcAw5iRXmS3UxRgfk3yny9TToK6a1brf3JPY
	cQRNOalehTEXkPuKs+DSW4mgxqH2u
X-Received: by 2002:a05:6512:114f:b0:5a8:6cd7:3203 with SMTP id
 2adb3069b0e04-5a899b90511mr884078e87.3.1778153638701; Thu, 07 May 2026
 04:33:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310002040.417424-1-festevam@gmail.com> <CAOMZO5DFWYUPN9sPzBr-W7fy8ZbrXP7u1sx=HrmUAQVCLrsdjQ@mail.gmail.com>
 <066e3058-5ba8-4695-9f45-523c7d43ab76@roeck-us.net> <5466403.V25eIC5XRa@phil>
In-Reply-To: <5466403.V25eIC5XRa@phil>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 7 May 2026 08:33:47 -0300
X-Gm-Features: AVHnY4KXTC7TNhYmV-3I_G0S9oGAnT32r1vGc65wUrsc3DDxUO6SVYL40eT0UMM
Message-ID: <CAOMZO5AqJJVPKPRXGXEZC_b-rbmuV-futX9efKw+wSUGN=R3Dg@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: watchdog: rockchip: Add RV1103B compatible
To: Heiko Stuebner <heiko@sntech.de>
Cc: Guenter Roeck <linux@roeck-us.net>, wim@linux-watchdog.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Fabio Estevam <festevam@nabladev.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Heiko,

On Thu, May 7, 2026 at 8:22=E2=80=AFAM Heiko Stuebner <heiko@sntech.de> wro=
te:

> seems to have changed, as it was applied as
>   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.gi=
t/commit/?h=3Dwatchdog-next&id=3D882fc25d868fbd0d71751df4df49c4b55e3fa230
>
> @Fabio, I guess you can send that rv1103b watchdog devicetree
> node now.

Thanks for the heads up.

I'll submit it soon.

Thanks
