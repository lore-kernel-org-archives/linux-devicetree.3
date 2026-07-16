Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E583BC668
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 23:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784243966; cv=pass; b=HZPRH+nmAzb/fc8wd/101EOP9lFET4pD9I6CVKNc00Hvpa8Jjh/LfLtILNxvR1ybnju6mW5a7LiArjBstxOTUEHAymx3mysd7XVmt3ydLYK+1xWdRLWg3IEXvvMWOzJdIJ29MCMk/IEHbjKuxCWV7oVzEQ7f1CSHrH1lg0hAkSY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784243966; c=relaxed/simple;
	bh=uyJXmRRMshDvjiZO6cN2BesCS7EeyFK1l28FQvgs7LA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jnsb6+7Z6vxg2RZDHctGS6Ea4GiVDMvQ02DdRx03xF3xRRRuc/h671+g5KTXADMrEtndw51CJ0sLz7h9+0pwxwzW4uZVGHD+tfXfkUQNJx6zkSn+n7uA7CJDq6VbJSyzO+49GzFAFPPi3y6XHyvjzgPsESEuKeXvHqR7AiSylZA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iznOEcuj; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iznOEcuj"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-69c5f6f7a40so3697353a12.0
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 16:19:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784243963; cv=none;
        d=google.com; s=arc-20260327;
        b=D7WvgTVOqatXuNw2SbEAEcPB0o6yoDVmKVcURLzYg9gPJDL3Yvm6QxfDioX+EZmznd
         54k4Nggi5BSvhW1UjHr4fBf0EsCyZkWSaLOdw5ayZ2PcllEX5fb+b/mzp9Bvs1M8RKq/
         ZyKhXMfrWE1fJKq15GIBkK3B8zyX8/0AOTEq2uVd91RxtXDd61hVg9KLt0MgC3uUubpg
         Ktx28pntF+AKPu7F5iEgHW76JJ3iXcuIl2NxZVlvqWpRj1GQ6leyTLjURt7Vs2DbapiV
         y/G467LN+VK0etZKaHCq7I9pCNy/A4XbHyg4c1pA8KqjUmYEdUygEGJ/eiqABw1TgMhK
         I+Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uyJXmRRMshDvjiZO6cN2BesCS7EeyFK1l28FQvgs7LA=;
        fh=F4pzR/vf7LGVA/0cG7uzQoeRtcIm3OCZKNOItQ2z5YY=;
        b=hym1Tkm/4SLHoXpNR3XJ8KLgDchdfELuGfCMkVZo7ODrlfhnXn892hC3O0Kx4gkWhI
         0Gxl8q3o06N/JeJvckHqEPbHTEngfAwJ7zPZn146P0TyCrwkw3OUGDl/FUwPFLaWzzL+
         7vUOdYO3LceTdHGinMwTuF1tUWdhxjqczJICa3/24v33MIMyyiLBnJpDtBFsRcmJOtqS
         gWDMuXAeGHENuOd8+oCMkyvQ2kdU7okqFPH0wlks6AfMyKSvqlz088mm68Cqtsf4kHIN
         vMsGyTkc6q0WDxaROcLRKbeNTUbwq8uu/zIPReMFXWlxvcOAs3vTU808RRvk1fu9GSxt
         He/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784243963; x=1784848763; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uyJXmRRMshDvjiZO6cN2BesCS7EeyFK1l28FQvgs7LA=;
        b=iznOEcuj8rmMz8yb/rzwIJIe0kmN5f83Vgvu+J5bGux+DCbO2R1P/3bwiNTrVeKb/4
         vwiMxFPwaaFSfKh2Lm5fRNCYeDp9dbVnJCi9jUMpGilBeOsUkUclavQQKjzYFj9C+iNb
         3hJCdcFo8BIlq01f32eb+AFatDULzDncT41IvMWa2qSI8mWuAqAtvSgikvV/Ci2nJezb
         WPqVD9sP0NcWsOkAiaDP20PadrgEKKmTX8XiGOVGXKT6oWE88r5lVVTkRLrlt422b7y5
         eZJZU34nVlnhc1FH0YxoHCsaJk3OoGe0NfISi3WVM7ZmO7Yl0Ur5qM2QSV0/i6XnhWHL
         gyeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784243963; x=1784848763;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uyJXmRRMshDvjiZO6cN2BesCS7EeyFK1l28FQvgs7LA=;
        b=LUZ9pRK5D+ZOCUN2ZD9tAy/hx76Z72ghyJYgGsmqigjbEJovnwFnmL4aGHPRVazujZ
         N5QujXrEL0dyKw2JJtfSL3FNrJQxMfHeHJdK4bph9pdfalpEsztqrVcz/r2uiTsSGxfP
         hxpgMWXPMMXioAGU1EFIZkQNgam/YQ033FjjdzdreHMdcERY/tcn0toubtukd8D4iUgL
         l/V/19+zeieaRjihlllrij+O4BiTpqomYpdXDRDhmRqn55o5DDw92HvqjV1pVX52QkMc
         aItYzF6lQD0S9VOkVB0RqjfNqQdIGU7Fkv+wd0Id/DLPELzfrHQRl7ptwxYeAsBSnQHG
         NWjw==
X-Forwarded-Encrypted: i=1; AHgh+Rp5SqfSWF2E6OZ6Sbjui2Q4jR6xQx6ipSh4PyjSCfeF7P2IAASqQZBJ8BdU6FZMSGrfmlI1qpUH0ubW@vger.kernel.org
X-Gm-Message-State: AOJu0YxosK46mKbbuQGfI9CQf7p/anhWeH90iy4QbGQbRp0AVLsIOprx
	hMDQzjVPxBy446WCSLEEMxpGR/MnuSPWh59LJfSzCNUKKQX7ipdPjnHLm4Zrhe4wFXpkdxfWtke
	AUS3UJ/HAl/Wm3EsNziliPOAhpijQ+rmiqBMN
X-Gm-Gg: AfdE7cnVmLyRPqiCyP+QKChqE6gZGjO0qW5kt2Ijc96L8Nwvn3NJ7xxCbR/zBr9T3j3
	VyfS2vJ0yUdgjoedE9fuFjy4an9HIBQfT7RMiFnoOY0k55VOCesm3QcgWv7h6xTvV6eXB5Ihngw
	ZWAomfAaBQwcyYEU7L3e9r+jCDLQ6lFwopFwpgWKzrjrlTkAkW5MZZ34T2Q6pog2AIBe6+Fh6p1
	A5YOQKJXzNqW6VgIAiX6eFyd7V2jcr49gC+KkR/WLmaSK6bo0OhUbiYCRQAHZE=
X-Received: by 2002:a17:907:ea6:b0:c16:7a4b:33f1 with SMTP id
 a640c23a62f3a-c16b46f1897mr698466b.21.1784243962703; Thu, 16 Jul 2026
 16:19:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260716-adt7470_thermalzone-v1-0-cc55ef35edde@gmail.com> <37ce18e8-d505-415f-8e01-0212840aba8a@roeck-us.net>
In-Reply-To: <37ce18e8-d505-415f-8e01-0212840aba8a@roeck-us.net>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Thu, 16 Jul 2026 20:19:09 -0300
X-Gm-Features: AUfX_mwK5VuOmHvoMP0uFeSdkNaANoazR5d6lJ3OOYaAQTaktqQU9CnX6D0mCKM
Message-ID: <CAJq09z5r3mb2bzMkQbAsRpg3isv0NgcpCdamkuFf7v4MyCOSng@mail.gmail.com>
Subject: Re: [PATCH 0/4] hwmon: (adt7470) Add thermal framework support
To: Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> This chip is 20+ years old, and it is very unlikely that it is used
> in current designs. Please provide evidence that this code is actually
> needed and not just a coding exercise.

I understand. It is used in multiple Edgecore switches like ECS2100.
I'm preparing a port to OpenWrt.

https://github.com/luizluca/openwrt/commits/ecs2110/
https://forum.openwrt.org/t/add-support-for-edgecore-ecs2100-ecs4100-switches/251818/10

Regards,

Luiz
