Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C2F30DEB2
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 19:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781207026; cv=none; b=HJANFC/ahbXsVnNKMfEHI6CyV9QU6467/gp6Sz6Qz11h8l8ZksEM6i/r2gKF1Me7HgDOMzwbi4rLCM+yCsBSrmUrBpTFoHz+OHXskxpxyWNOrH+mlcJL2YcaFIdzGUI640h1mqrCKJOrIlCbAewZHIFsGF7crlbhaneNfaqJ22k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781207026; c=relaxed/simple;
	bh=QjleCp4VyO35ivHHlQ0g5fkQ9JB1AsJoAloO8C5+uUg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DwJUvFtVro8w6ei9YY71aifmoKZ/gMzZagesooC1n6O+URZFNr1vNu2Nycg9uFcNt0LnBMMIiLfvV+VZ/apaTtA83eM9tKAlhgin077VQMxaUWCAXhOJ4hALKMYbcXVkTXFvfk9TEUElaeO89k1vOs3gKkT4UOsHRLuMxtefRqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sF9SEcdj; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sF9SEcdj"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-45ef56d9b67so149050f8f.2
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 12:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781207023; x=1781811823; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r1KQdWvhqEfny/utP9buNkNl2/nWXIxFcbLtKnInfxQ=;
        b=sF9SEcdjThrps97RL1+ivPFCGl3dxnEvfA6w9xR+ISPFzHGkee2cYyN0KCgCh1wJj5
         CfyrgPveEGhBwMgWumBWPK3aWHy/yEEa+7UdctR4KlW2SAvD1oC4rH3yw5v8oCVcFd7K
         RH3BG3g3fyNhWhwgKPMwA9JvPAJHgt5Z1Sro3S9gYcB5/9juONgHO0QTBYXsgKUGoNj8
         nQD2ntsBWswOYf4iZOqeL4xoHoQzOKYPD2o28uVb/XZjPgCBU289iaJpJ8bssDoon0yK
         bO+ixZ2M5EFdPUVAxfNHHkThTUfbuAKUjyvXclp2OrVmQ7xtn8Yu7y4+rz55YSPW60K0
         /x0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781207023; x=1781811823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r1KQdWvhqEfny/utP9buNkNl2/nWXIxFcbLtKnInfxQ=;
        b=l9k7Iuvsl+npTlAgUg9M4tx6KvLfaay8xncb2laP0MXYSX/CtM4yrX4Mh0Wv7X/7cy
         zHbltzABc2qm9GnyFSHo0pMJTEFegCzOURBcECxbjaf5TaDDWmF+eafhxl172EwW2poJ
         oKR3MTzVWfruW5FPa0rbGcObUyZvnyWF/WVI2i70Me1a4tSuDb8LuVtZcm4KjfnVDRAZ
         VDDM5y+vxtGuNncBPI/hljZxn59M0DpyeJ8hPpqyNabHIyLXAgvLqeUcciMK9iMBU3pw
         /qFVPhpySrILjpJuXgoCnTkHW7H1E6J0yThKKU2ByY/bOd7FwnfcX9ew+aeXra0NblrQ
         9/VA==
X-Forwarded-Encrypted: i=1; AFNElJ8+OgAwM1lVcTmyKuHh/2MTcE5HQS7m2+fVJnpU6NaDFzeygBOXDEPVuFptbL9sQOsh1OX6Dihd9UFS@vger.kernel.org
X-Gm-Message-State: AOJu0YwE1PP/PfGlEQo51+SQT5TWm1zs3wuOiTblaLAj4yO/B+OV4z1Q
	/RyjgmWpcHJRGSTHaSbWeY6CT6UsoA1MkqphcAQ3o+vsK7eXKnYmEcYQ
X-Gm-Gg: Acq92OFEYTYepyvElm2+lDYNVtVTewX4+Dn+VMov8hkaByoadvR/YJYsqf5BHrB3p67
	PNrvUkeNJLlT9E3iSmnkEwIeacPzCrNnGAcafDcMwE4SjSuxUOIO2WefIvp+M1Lo41eYg8aPPjN
	MWcj5/vd4JIQ16eW2JGf8an/bTDQwm9Z+yNILe6tqDDxZ79+BTrVS6b8mnmXBeFNk2Cmb+mON0/
	+K9YAGZghAmWNuSDNXgHeDpn08/uoLNQDazL/X+LiSylZ8+Mox5Xrd5XulRHgIr4oJ30aa3Xz9U
	OM3jLF+VonAx06T215W2sSZ+piXwBCkE77D7BvCPHdzuCvS3yBRTqCF9GrNSdjtCwPFOHnNGn0y
	GvXeVNKRyVfd5dGmGJZbVnr9kYXlKPhr3Ct8q5aezH+ixGIMHHdyPz37M6XBWhmeojgRS0mmL0j
	P9KIAnHwFQgQBhZy2omyDu3l+Q5coQr4jJ9YwH1wOVTu19B9SBchFfhnfzn7DY
X-Received: by 2002:a05:6000:2911:b0:45e:eec6:5023 with SMTP id ffacd0b85a97d-460677ed2f4mr6812673f8f.37.1781207023291;
        Thu, 11 Jun 2026 12:43:43 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606c0f5164sm1211937f8f.21.2026.06.11.12.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 12:43:43 -0700 (PDT)
Date: Thu, 11 Jun 2026 20:43:41 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Leonard
 =?UTF-8?B?R8O2aHJz?= <l.goehrs@pengutronix.de>, Marc Kleine-Budde
 <mkl@pengutronix.de>, Alexandre Torgue <alexandre.torgue@st.com>,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de
Subject: Re: [PATCH 0/3] ARM: dts: stm32: lxa: change stdout-path baud rate
 from 9600 to 115200
Message-ID: <20260611204341.147f1afb@pumpkin>
In-Reply-To: <20260611-lxa-stdout-path-baudrate-v1-0-59b60a5069ff@pengutronix.de>
References: <20260611-lxa-stdout-path-baudrate-v1-0-59b60a5069ff@pengutronix.de>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 11 Jun 2026 20:12:32 +0200
Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:

> The LXA boards are the only STM32 boards that set stdout-path = &uart*
> instead of explicitly specifying a baud rate.
> 
> This would mean the default of 9600 is used, but it goes unnoticed when
> booting normally as barebox fixes up a console= line that includes a
> baud rate.
> 
> When EFI booting GRUB however, GRUB will not pass along the console=
> line and thus the board ends up with a 9600 baud Linux console,
> confusing users.

Is it possible to determine the current baud rate (by reading the hardware
register) and default to that value.
Then if grub has initialised the uart the kernel will use the same
baud rate.

	David

> 
> This series fixes this. As the device trees were added at different
> times, they are fixed each in a separate commit with its own Fixes: tag.
> 
> ---
> Ahmad Fatoum (3):
>       ARM: dts: stm32: lxa-mc1: change stdout-path baud rate from 9600 to 115200
>       ARM: dts: stm32: lxa-tac: change stdout-path baud rate from 9600 to 115200
>       ARM: dts: stm32: fairytux2: change stdout-path baud rate from 9600 to 115200
> 
>  arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2.dtsi | 2 +-
>  arch/arm/boot/dts/st/stm32mp157c-lxa-mc1.dts        | 2 +-
>  arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi       | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> ---
> base-commit: 4549871118cf616eecdd2d939f78e3b9e1dddc48
> change-id: 20260611-lxa-stdout-path-baudrate-7cf454cdae07
> 
> Best regards,
> --  
> Ahmad Fatoum <a.fatoum@pengutronix.de>
> 
> 

