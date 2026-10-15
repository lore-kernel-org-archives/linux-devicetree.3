Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852D53DD86F
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 07:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792050350; cv=pass; b=i5hVHEohedpTgK2SwU4zW91Vj7A94RiV6CI4lxsOZzmltusZI+23gr7pwsf2Pi/dSCF0XwH8ad73tjcw2EYTzEfgYpEd85mbktpHcwXLzx9bOBhrGyHytQ+lNNkCeLuf70oMalEnN6oaEj3YUacg5799HdmxthfoZkBHuRyEFqc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792050350; c=relaxed/simple;
	bh=kCPrYLuWO8Lp8ZdbX53M8PocjLPBiKN9r04H0msOwHM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PJHiUAOgBcNhOPLuSsqpGC8JsWaCYAidv074q42SrIVkqvdETJg7Pt2DsCMT5Dyb0mNGc7b2C/n/g4ctSc1X0u8aeXf1GyWE171sATDsJVUbrEqs+wg44UoUVr6FQMWTUR04+sN0Yh/nT0hk1T21zhT+LcVnGNxXeSeJ8LjJKQE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cmXD1OgQ; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cmXD1OgQ"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3550c917fd3so2464616eec.0
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 00:45:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792050347; cv=none;
        d=google.com; s=arc-20260327;
        b=CEwUJ1fbA6Vf1cO7hsLvLHvlotiBZfjt9pARO35kyt8BqQO3jA1mWni3BYeA7dN2FI
         O7OoZ1X3L+SflDAhJaXd2tYFsQRG4WXJ1j4lteA3jeK6/DiQMlLp+N6Knr73Qqz4RBaz
         fbqYx6g+71naJ93VtFxHnPHc7ZLmvPJmXUMbvq2GqNs5Ry7IMmBmYsMNzONAo5bZoz1J
         IMpQo0sdm/jVt5aqa7Q9o9G7WP1NU8YgS5F7cqXZSJt/tcLD4O/AJ36svVP2xXZeRv2Z
         kgWeNMyjoCB6peVx9599B5ekPFNh4BNvZub8ir8rskfNxIdYm3r+ozpejDaxp1hMVfAk
         5IVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kCPrYLuWO8Lp8ZdbX53M8PocjLPBiKN9r04H0msOwHM=;
        fh=Q7rAvWsIZyfyExASZeK30m36DVjeDzYDGeMFPdnMqAk=;
        b=Ek1XLwF5ksHpYBBdzOm/Ohxge4qBBgZw30fULmrib5sZsFYds7YFMhyKZkbpJvLsUc
         6s6YKWDf9a7bCJWH+7wCQTV9T4pr6ZnXjXoJ2rzzLuqFn97VDK408FUwZ0iBPjvWvah2
         Eqw74BzKoQxekdeN5S9OSMgWa0/VAZN7vkVQ5NQ3ERZxBrkwKCpw9eRB4IRQ72wqXUcg
         G1UQ7emKFVIwNAZZRrzrbuyxYdqlEE7s6/fphkq3uWJvPAwOevdMSxPom0lO1mxHEDRO
         fhQohQiNpe+IEjtqFBaZqSchwS/l+A8Jw7QS3whaJbBLwEqJnnrI++uRSvmOfqVnMge5
         zf1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792050347; x=1792655147; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kCPrYLuWO8Lp8ZdbX53M8PocjLPBiKN9r04H0msOwHM=;
        b=cmXD1OgQNrTBAqk6/7tmP67vRolPXu0Xa7ZtqukZYtIDJgPxN70Rcg07wDtHYLcsZv
         fMp9NT547SVB8M5jdMDaL+JBUZiFjMk0PnWPaf9eoTl+hnZvxlD1PhORlc20YwxyrPxb
         HqCc0lhFfdqW9h3WW1rO8q9oiyXEQGOT2n1Ly+Ahtt9ydAVAVJWXMakI5AZaQpW3wYqt
         BigEV/1xk1GHikzUjdAseEFcPswxjdeAZKG6i9GdQJSH+ExMpHiU9MPGGRx7BpOzp32y
         1JLo30aBPFmKYuYJH4ES7pfc221fxc55xO0k9HpebR+MRmYvzpG9bEFaUfBIrdh3SSp3
         W9tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792050347; x=1792655147;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kCPrYLuWO8Lp8ZdbX53M8PocjLPBiKN9r04H0msOwHM=;
        b=tqq0DjHQe8+RNmgnM2eNFgeD/Th5vzFKsvgMUq/iWUNfoQUWGQowMcY1Nu9okdJO1f
         IQ4JMJIMKz+e3MuwsFU+kE+GvuV28faADMJi6A8rx1zWC6jjHRExHeI4k3z1o2z4jM5k
         U7F84MsiuEEPjKCCYQgMuvpLGy+jt5tKymqGS9UFzZUV8FkJ+Z8rE3G9QhZKHIp0kdsT
         RitPmd+lJqz7uADfgeT2yBVbcXf77ssOs+NZSgjogRvXIW6DTg1EscjOG5yNK7WDyPj3
         7MwMYho9YOVTi1LZiadU8gfkX9noWb8Sa8tyLw03RUWaDOmY0Pu0kofc7lF2rCvEvvhe
         ScCw==
X-Forwarded-Encrypted: i=1; AKwUvBxotzuIZjEl15mWWmH8N9lx6G8PI5rs/1y2f5n3nymwYRq8ILxGV9LgE+u5pFlNNYZVheh8/nRXdZb0@vger.kernel.org
X-Gm-Message-State: AFq9FYL+QrUxWFQNj/w5lSt63JHuDjTqZASGJGwmi1/eb1ci3CC5J3zs
	u8V7p0ftVeaMLapole2pEgaSdndbDGOnGiLdnx2tsNEoGHGtZXy5w3OboY+fZ3UpQTtLVDETW5Z
	2f189nYPlUL5dYGKuGqlI9dTw1wmjBuw=
X-Gm-Gg: AYBFou0rDHGTCK3PCJWVyqt4FHwBQYi6ciruPRzHsJNUwHJic0zYkVQNwJw37ipFLnc
	6Vk24PAN8of5zXs6RQkWsYyspGl5oWPv2uFRQPLOcUlLJPJzOChRKswRzMS0fTy30x8n6QCabMf
	OYxoyd3KDqmA2d/WT4I4Pa0GhgPSR7we9HgUbG4zqNhI/vlmtXvP7Lvre1j7MdLzT9qrZQrru7N
	FeYyNu0rL/rKSMOPnddi3Sia1aaVqeyODPR8Niu5l3dz2M/srutHRLC0D55qKexRiYYvsPPStOe
	57SnqzSs3paGSF1G6QZJ9BAxp0DHCWKn1ck/5g+KGzE1PWkAAIHWXb0fcwATyR8u1SpiL6srbSp
	GO2kxYQX7GL8J
X-Received: by 2002:a05:7300:cf92:b0:35a:3c46:80d5 with SMTP id
 5a478bee46e88-35a3c4689e0mr13623404eec.0.1792050347121; Thu, 15 Oct 2026
 00:45:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013184755.530392-1-clamor95@gmail.com> <20261013184755.530392-3-clamor95@gmail.com>
 <atBzoZhsanU90pxP@monoceros>
In-Reply-To: <atBzoZhsanU90pxP@monoceros>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 15 Oct 2026 10:45:35 +0300
X-Gm-Features: AclHuK9K2QRydAoWIjgvp0vfxdb0H0LVdOrWtHQEIZxa4k3bTKOXeIz17sOm7BU
Message-ID: <CAPVz0n011sUEWzdybBf=M8Euf4oz+E0J8idhsicpZtr+dwKDgg@mail.gmail.com>
Subject: Re: [PATCH v1 2/2 RESEND] ASoC: codecs: Add support for Fortemedia
 FM34NE DSP
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 15 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 09:3=
4 Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hello,
>
> On Tue, Oct 13, 2026 at 09:47:53PM +0300, Svyatoslav Ryhel wrote:
> > +#include <linux/i2c.h>
> > +#include <linux/mod_devicetable.h>
>
> i2c_device_id is already provided by <linux/i2c.h> and
> <linux/mod_devicetable.h> depends on a lot of subsystems that are not
> used in this driver. So please drop the latter.
>

I must have overseen this. Thank you, I will drop it.

> Best regards
> Uwe
