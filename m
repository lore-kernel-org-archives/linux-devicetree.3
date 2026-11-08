Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794172089;
	b=qe5QjKapepa/kUmOUJOdTiKiBzW/MxRC8zC4OxECDBiaO7Wz6CjuKlm+AGS0uLEbCLD7
	 BILvIgZEZ5I9m+12Q6H7kVM1DurVQbJoq6UAe0BhTcgTYvAWvfomlVk3TYQUGlfLRZEeL
	 AWgCfG3q9k4AGVeZJQXxTE2n7oVERm8ahTQw5ZenlgUky+Y2ePaMO5EpXWKA7IhMISx7d
	 Z+v9Qa0pjv3IpvfEOLp08YBM1JYGmlPoICDfQiac9Z7kTlLo2/yU7/OULPj5Z/oSSSebo
	 +q1tHSLOtavvImljYkI0gs3zEmwoWiBMwtK/nsS3SERuZk6ZlMDTtsibW0UDFA5N6kA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794172089;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=TKd3XlZghnq1bRXZV5ZgDD+2oyCcUDkC2gv49H+TH8c=;
	b=Kw6QSJ0iiHouT4O1oAK709pRs1bZE/2snQ2aaMhe+D6A/85HDsw9kSMIeTPGI5umu2tF
	 E8ygNFzJNjZEuvnHbyOXjHBwBmwbIIiFYj9ahll8izO9Ismzq/md+Ip5wglJC6rSWqhOs
	 NmrlUctfet62C/oEH9Ikj1GHtscEagWsPz5iuO/m7kVP9LQLN49FY3wu+R3dGGk+OOdJA
	 7LwXhAZoHvCz0U+Hka1vwHTbrPfc5iXjilVurYk7bZ5H1zRBVOMfHTvu+5wiq9VW1cazL
	 xSGffR5jR1Ooe3Zrm8ulbvYDXDHxIvjOpc+v02Le9NEMQzroHVv5M/GsHe4rCLThhyg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=sHCr7ys8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3469E606A332
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 21:08:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3469E606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=sHCr7ys8
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-67c246c0c60so310521d50.0
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 13:08:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794172088; cv=none;
        d=google.com; s=arc-20260327;
        b=nk4l8q82BSmKDQ3t+Ouf9OfYlx0B5LJ4Uihjvd3gcUIH3An8vQP6zyBD0gfFg4BiGS
         nqMK9jotX27TFyAYqaII9Ol7+3jgk3cxD3zENH10HcHYItEhBxDAopzaYMrfmLeToo3x
         MUmP3KbgjNTvWZX5BcrQmBIyOEW9zU0Dl/TD2oEtYKG0QRcYiEFbLrITD038qI0Ey2yu
         APGdC4uJ47hVOpt8xDmCiBe7/nO3KCl8zf2ySdm5OYp5Pdvbt8GmeI3KW6jHDXFF95YY
         5zA8ytU+eerw1aOSJOZwigbo8D9JnoR9lMKa6s9CDhKGVJW4gBH4J/mmR5YWDLPuHjrq
         N6lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TKd3XlZghnq1bRXZV5ZgDD+2oyCcUDkC2gv49H+TH8c=;
        fh=JISqhSo6w56SU9gaxHZRK8OdlupWl38cfbSjc0sk8+Q=;
        b=jkwi03fmp8fpeWJCE0KWcmd6yYB9WzsdE3MxbUHHzGl57ztoJqU4lvNr9izHFtMri/
         9fhYHUn/kgSPnGDTU2hE4q8lfWao/8vORWFsUS3AR/UtAHCyjZHw25ch6LApPUSOTjPn
         NLZxkRDQqMK6ed44QO9VPCC2RGiLDlQjpCOwxb8cPbpc60spsfgTrww1b5Qg+GQjMjqh
         E5A7Y8V2mc9zDFuBQJSUyF7GhFYQQg8pH6DYQr9wPwZ9APcaFf8kKogrClmflO4WuKCC
         SwaXkSu0jK56TSqH5mQPRmWWZCaNEPSIQQKUTgSKiSOXirN0gxu3UmaYXWkcQJWEMhIU
         Pplg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794172088; x=1794776888; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TKd3XlZghnq1bRXZV5ZgDD+2oyCcUDkC2gv49H+TH8c=;
        b=sHCr7ys8bNxUaNsy+bUcoVeFML1dbnDW2w+esIPjXGCAWDbekntbuCZmOXJdfZDpOE
         j/6JTt8w/B7tGmi0lCs2djCp2qXoxDaRRmam//5cOdpqkHTeIDr2h6qKGDGhT3JMXge6
         seVklIruMWETKxT1xvP+o52n1+TZm/WHjI9Cb0uZZYBUAag61hqA1gbT6Xs1BZbBV9KJ
         Fazm//EF8BTNNaSnIm47n6vXZFxTa1i3vf+uFY8qVgTkN1LzNs53nKiFOv0vj1AEttZC
         VwI8vzuDA1+Qo4Fc3Ynw2gV2cC96Uk3LCFIyZeSodsXc/Mf8y/1x9PvB/mINIzic79Z4
         sLiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794172088; x=1794776888;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TKd3XlZghnq1bRXZV5ZgDD+2oyCcUDkC2gv49H+TH8c=;
        b=dZLwCXg9RzLpiyQOBu1FIPf4Y6bQyfwE5FYFwy3CYl3W0Y5f/niOF3tks3By0mc18F
         fmGmnnAwGZWkX8hiDfZHbUykAOvOZamI1Z68+zr8TAXvrZ1nNSWGdmYYURHC7mAeCuTJ
         cBR9aL9o+XmQ8Ls2RxkVhXTlXR6mK3w4HVY7qrjdi2C63t5Fi5zsSZE4FiSMPD513BsN
         TOEumDZ2z1AsFTemzLz8tuynV2rDKewQKYvBMGZ8FUTWjKoWdwkd3ayDa0L9u1hpo2mZ
         oTM40B6p16sO1/3wN05pSA+wphKu7EGOGLHSFhiDzZKjDqnuGf043eOG2SdSFEiusx5L
         W4jw==
X-Forwarded-Encrypted: i=1; AL+hErHEL1o9E0xmMK4ue9l6PqjMxz9DvAY111URRfbAuINCh6iYEW577mQADkuezXYeU8PZCetBFrvwahap@vger.kernel.org
X-Gm-Message-State: APuU4Z8XghppWsLjX2c4O57jqKpGO1CPIPbkd18JgPA/7h8l3B2Y0ewo
	dLFYMVGBzEa6m/TJcxxQnBH40fqZCDj8DniNvojL4JOEaf100WdKjfOaRy+db705RvusUM4F4lP
	f9uADSPyiJKsFk2nojS1hEW6MeldP62g=
X-Gm-Gg: AYBFou0uy4HjvT6e7U7hE91eXBPOhWchCBKBQsLHEn0ARZVZiWriAUWzhYCe0lc7vma
	eVcP081jClSZfCh/BPwsxvwJ0ZYmDGPztn1H2NYcYM1xw0WOWqP9wRROJ7Df3vXWKcPUX/yKJop
	9yqcLiahgSNf7HgCIbJXxMCaaYtmL4meKNoI0kG3d98/2IcRbC2gAY6i04yWUSXMzY2xVDKD3VS
	bOLCc6+t16dKqu07JlQIfDMXglg/xDE9mBL5ZijNY0Yd+2ARgpSjxfX5JlhPYqShpwfnTRXbFFK
	CoDnvVDN5q4maHorbNUtlrkbtX0cBc0t+AfdJB323OYC18uRRooiLxF+EvSmdphkx3jUHskd3/9
	q3oY0a7ZFSBAaRwNY+5W/RALMnGZAG2e8tceCMUnXQq4HnwFpj74/lvotrgMAJ8mWJl+aDYUHUz
	d7LNOq7jbfnK2q+Wo=
X-Received: by 2002:a05:690e:bc7:b0:677:df02:fce with SMTP id
 956f58d0204a3-67c3d7cc43cmr1612153d50.5.1794172088171; Sun, 08 Nov 2026
 13:08:08 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106101913.46664-1-christian.koever-draxl@student.uibk.ac.at> <20261106101913.46664-3-christian.koever-draxl@student.uibk.ac.at>
In-Reply-To: <20261106101913.46664-3-christian.koever-draxl@student.uibk.ac.at>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 8 Nov 2026 22:07:57 +0100
X-Gm-Features: AclHuK_oGazsWw9BXqhuCXk0AQ3FrnvIBj2gHr_VP-7Spxdsvm38LfrWlZ3lq_0
Message-ID: <CAFBinCDS_toG+4BySkUoXx73a2JWtp+tD6NHwYHk4mU+p+GF=Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] thermal/drivers/amlogic: add S4 support
To: christian.koever-draxl@student.uibk.ac.at
Cc: glaroque@baylibre.com, rafael@kernel.org, daniel.lezcano@kernel.org, 
	rui.zhang@intel.com, lukasz.luba@arm.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-pm@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	=?UTF-8?B?Q2hyaXN0aWFuIFN0ZWZhbiBLw7Z2w6lyLURyYXhs?= <ckoever@outlook.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 11:19=E2=80=AFAM
<christian.koever-draxl@student.uibk.ac.at> wrote:
>
> From: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>
>
> The S4 CPU sensor reads its calibration through the secure monitor and
> otherwise matches the T7 setup, including the separate bus and
> functional clocks, so reuse the T7 data for it. The driver already
> enables every clock the device tree lists.
>
> Without the calibration the driver reported about -144 degrees Celsius
> on an S905W2 board; with it the readings are plausible and CPU
> throttling engages.
>
> Signed-off-by: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de=
>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
