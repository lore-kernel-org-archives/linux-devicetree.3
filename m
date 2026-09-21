Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6704AC17D
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 15:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790002949; cv=none; b=F/9wE6KAYI8KyovsYXmvof0K2oG256EDgoR96cgO4yptQ9BsCLgYyl5j1ZM0u+nn+4x06L5Un8QEHRlp9TeCi6H7s+OJg48o3kTCJGGgP3R3qAnb4AK0ZmdZ+mUcENoT0jUDgbhDBu/Yxn76Co/cMcuSdhhtDUVghftRujlJo08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790002949; c=relaxed/simple;
	bh=lLDssI3Ig9cvLyC9Gnf2t/ppG8752TKcbDmH4uKVMvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=heZEwveFEKlDZyQfDUYazC9ikAnWRzTaPKzxfzFttujLqD2XB337eIl61jUfT8p36IyJiRMq/GQ0OiZH1rPqE2yG4LJEJghui7MCapp1qS8MXjossitEboV8seTmIUzPs63U9fdcaNFy+J4Io2yFAAS1GPSqGISSV2hXD5UqQ+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dy4bYq0d; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dy4bYq0d"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-8692a8568e9so2620306b3a.3
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 08:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790002946; x=1790607746; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=scSu49n0yZs/NkIL79oefwB1Fce7usaOArd+rmA6NfU=;
        b=dy4bYq0dogCqoDDOLnkmopm4wwSvKTdy9hHoG5AN64SzPhq7XFt0Mkur7PqNXp1sQ6
         SJZG6Y9rXr/oh6Gja4H1ZyP3QTmi9T4fVdWA3RY4AbPV1T1cej4NbyFEEWhYfNgLSkH2
         4ONzSkd+0ytqpRYXYfl8quJcu20UnCPGktGpsBW/rFI0kEEJt52S1IemxIZYWPxjJ5aE
         YBV7wm8Eek57Q29kO+awD91/7sFh4kyKDwVjYiXOL/9x2tOxOVdPIY++f3kKQpTQdBlH
         gxKirNPg32mFyQvGGvVCerLfH1CD9kY0E0E5c+KAHpM0ajuq9AkvJqOKt3WHreJ4DBQ8
         G8pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790002946; x=1790607746;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=scSu49n0yZs/NkIL79oefwB1Fce7usaOArd+rmA6NfU=;
        b=K7q215//aXdQzt5ipSBO/Hbh1EHvPowiiUWBO9PuifXbRn4HEkgQjTq4RcMa52o35X
         zBUTFBoGYr0GV2eNZGnWewvE3UG6yIpM2D7BAHoc+RWvPmCe7ffIE0/yGfFaaJJR1LNN
         /avAuld5YuXLJ6p7kEgDA5aTNdwZx3FUR9wdozQoNRbCoMU0n1Rb5jfYtTZNmoRzymt2
         lWgfaFyl6xhHklgx03RSkfGJ95S3vH95bQ/DpH2fXlaCa3nq0xkckurXCoiRpp0M9abH
         /biHJiUXnE2IgK/tnCeF+Fskpl9SSvSg6KALhIoHDEXVTJVGgTl4eDbqgKwu6Tb29QFX
         iYNg==
X-Forwarded-Encrypted: i=1; AKwUvBzBkUtiKpIqX/PY3wOai0+rCJIN+QeKHsjcPVh3MZIIe6UcgSN0aRPBOQnJCDyaB4prvJ1rsk8vv7Mi@vger.kernel.org
X-Gm-Message-State: AFuF++mJTz/wj8vEHQN3NgptUu5L+O1UMjj/PiyIaJaKoxpPZVf1g/v/
	DiBIBH0sFmaWq8pXabt3+E1xnlNW7jRz/ffvYF8FElkta4+ukdAVvQFT
X-Gm-Gg: AYBFou0Ok4ysSvZXteGkxq9kfx2NyfOXQ0+vii1edlT+xJwHy53fmI55w45lGU9scbf
	xHfFPbXHzcEgyYvWQ0GL+uC12nRVbngHIBFLneVlbMtSGjV/bxm+NoNigKPdnqz0XDnKC7fXErn
	NEtef2QJiOg7+QLusf8tYhl4ZjClH2+T4ZLqFxUozzZYZMhWSZrLehnVw83S/A+GqpPw2SkpI6e
	hLSyrA/Df1sKtzGk1R6g0UvpJL8fX3IUlC31XKeiZQlO0NkKr7wX8gm1atb0V2Z9fPekU/u0bQK
	NpAUvYhwxaoKVdUdFDR14rOm3kBZraZdEQ4faKZe6egRdZ4UvonnvkwtwG7C7q90fe1WmQpxp7p
	qHBAqFY7KYTHYNRV6Ni7qWmakyeJjycQcfD8pX/mDFY51jKqQ1qu+sQHJajLFizNABiPjXsYui4
	LuzRwTV3Cd3En2bWW9gZJFjFcRojwrn7pN2pDaX+QfPxA1Fvzti4M+/zzu5qX8xglBe+4+o6VOm
	ir7r9Udzv+i
X-Received: by 2002:aa7:88d0:0:b0:878:3538:8f80 with SMTP id d2e1a72fcca58-87835389b2bmr7554907b3a.46.1790002946544;
        Mon, 21 Sep 2026 08:02:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a95eceb2sm3411465b3a.24.2026.09.21.08.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:02:26 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 21 Sep 2026 08:02:25 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: Akhila Kavi <akavi@axiado.com>,
	Prasad Bolisetty <pbolisetty@axiado.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Tzu-Hao Wei <twei@axiado.com>,
	Karthikeyan Mitran <kmitran@axiado.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-doc@vger.kernel.org, openbmc@lists.ozlabs.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: add Axiado AX3000 and AX3005
 PWM fan controller
Message-ID: <01278847-ebeb-45af-b520-765fa6ae3477@roeck-us.net>
References: <20260921-axiado-ax3000-pwm-fan-v3-0-3def8b6ffec9@axiado.com>
 <20260921-axiado-ax3000-pwm-fan-v3-1-3def8b6ffec9@axiado.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-axiado-ax3000-pwm-fan-v3-1-3def8b6ffec9@axiado.com>

On Mon, Sep 21, 2026 at 12:23:55AM -0700, Petar Stepanovic wrote:
> Add a Devicetree binding for the PWM fan controller found on the
> Axiado AX3000 and AX3005 SoCs.
> 
> The controller measures fan speed using a hardware tachometer block.
> Fan speed is controlled through a PWM signal supplied by an external
> PWM controller.
> 
> Add a MAINTAINERS entry for the binding.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>

Applied.

Thanks,
Guenter
