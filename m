Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0F942E438
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 11:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791630736; cv=pass; b=TAeTTEW06rVitFWtVcAkT0Pnb0tVFDMnn5736Iu3k5bxBrYTrVxn/CcRO7s+mpoJqXGlEsIdV54Dm77MerfqF7cpRUQxxSmYjPyK5GBhdmRjnYAKlRC0/u/33BXpfx5Qh0xMFxDqi3a9uCktVSOTy77o0mnLCMwK6F0yS62RFiU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791630736; c=relaxed/simple;
	bh=md5oQoJphQol66QfbURRgT/HHzUasbyHUn6RkFFz5Dk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BSK8F3sbcSX9YzefWKy42zsWuBXmIdcjTjQzCUnpw1yHE6/S0g1GMg1M52PUOcuddM3wrdwlxr7r9L8CW/jcy31ocUygBum+S8JcXKXp2yb+AgIpN31TrdcHBpP/ITb5FHUJLjOyHVYLnA5DSU4tBD1CB6Byr9fl5XFKYjfi8vE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nigauri.org; spf=none smtp.mailfrom=nigauri.org; dkim=pass (2048-bit key) header.d=nigauri-org.20251104.gappssmtp.com header.i=@nigauri-org.20251104.gappssmtp.com header.b=jMQIHL3d; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nigauri.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=nigauri.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nigauri-org.20251104.gappssmtp.com header.i=@nigauri-org.20251104.gappssmtp.com header.b="jMQIHL3d"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so499273f8f.1
        for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 04:12:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791630731; cv=none;
        d=google.com; s=arc-20260327;
        b=aT0UwvcKSELS59zSdVBAgK7nEJoY+hv5A4TvMknR489WExcAgsnqdId8Q2t9qaq8k+
         BD1CskRdXVjUN1WGldw8/XyCHYlsbBVEF24m8bQXqWWJcXBC5OLc3IXcrJHQXlDgdZUp
         n0wtCWt9Z7VMh0JfYZsk2C/S/cO+pwQzfJc2vjKdEAzwD1URUYGPTUu85p+qopadg+2c
         pgmGK7hhgHW81CdNjpqUGlXK7pob7ERgOxYCH07Rk3CNq3c5fnSFQHQl53+tAU47kbmL
         C8ySfvZatXWnALUZhiwxwBfoLIN0oa9Hv4F6yr7Xe8LIXH/A4QQSqi8XTMzxPZyoXjdS
         LOig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2iYyP1LxibJML28p8CbELojx4hp1/pLAXT4X+K0jWjU=;
        fh=WQgOkbmml8C+qNDBvrDqNbn/Gu34yOUAOgf0XFnBokY=;
        b=cbj4t2ohU4uAZ2VWqLFvI2ZCLYabUdfBwRNsZqTBrkHqVn0GTuiVqSwZ5mCwzV6Zfo
         TRuQNraqrPTpgluAy9LBfGpFWXC+7c9PeUHytn8V0u3JMHlKZvwajItqrSkGoEf/fqYJ
         SVGnHep8V9AchTwyHR7XZ6s5Hhg7inpvT/99lxCDOzJX/qEh5N5Pc8RiXHQclqu9G8je
         CpR9jphH/lCwU3sD8B9WQ69Pb/0BAhqbCJXSmh2+AGl1xpmJMG/+bUt864J/umjih/Ae
         vj08+V2qB5TIk85DgyZQpbpAivAsY+sGQHzM8WcyG8oTa33CQdcf05SSoL2H0yODLGJc
         0+7g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20251104.gappssmtp.com; s=20251104; t=1791630731; x=1792235531; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2iYyP1LxibJML28p8CbELojx4hp1/pLAXT4X+K0jWjU=;
        b=jMQIHL3d/ahvcQ6BsHBNrBAF4nYP56SS9YAm4AmPAFL6DmFkjmZnSgHRE2wt7fYiuP
         T3Xctl/ZSBF+2OyFt9KabgQYzHTNrD20cU6R2CETxh5n9y2PU/JFM0A6ZfF+4qTYfDPi
         rHx6C1aY0AMRP4Th1ZHJwsOnP+otfYFKvLgHPL33eXl9wsBgF7S/r+HGKU+4PFN/aCdK
         6+gAwKsABnZIBooJvK60M1rr0YbKcjrGWmgqXC5XpEAUX7Sfu5yGH1GGdcEyRAlSlhgh
         Z4HAwuETuRxBWurYXbr/m9CsFGXTvgrdU/5BbYm8RhxUN1kzHB9MmSQpjzx0/tR3/8nu
         LlhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791630731; x=1792235531;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2iYyP1LxibJML28p8CbELojx4hp1/pLAXT4X+K0jWjU=;
        b=roJ5fmOMGzkZHuxjlekayusVdBl5HK1WjYD0FGXt+iETqsVWmG/olHJQBJKhsbRezR
         8peueYJ/NI9mUIVmom39pwkw8gNEL92c2CTlpC4Gmdk0Zd0V1lywQzqLoEvsvvqWaeOK
         qleWc5nwpc3bdmt+fpn2wH/P9mpBpNhlYXgk7m9MChmDSAwQ2JkNqX5yNe9NuDuurlIt
         KATXYnxs7Cs9CS927ZMDooK5AEbM/QW2vnffQO+eciXEs8gdmABQLXhyE2UhM2YzfeOF
         pwkdhTzMU6wrK3EukB4k97U+itO8Gm4QCiaNY/jfwsdiQqUKqzt1quIenrvcGv4A9+OX
         Wl8Q==
X-Forwarded-Encrypted: i=1; AKwUvBw9oX1TQTKkhk70P6bIRDhMvLrWvMjuRai74hc2VwU+9nCbzUkqybEyCdFwS9OMqCl1f1zeDpCJ2jgW@vger.kernel.org
X-Gm-Message-State: AFq9FYKrHMODssrdEnXRAgWB5uIYCpSkzdTuZCUQoG90vEzL8cKMUaai
	4HCqK+QTDiF67sPbPRaLL7G4dbEe8iOPeWzVEkMI0UBADDuBV6kVJ7fO3FlN4LZdv2us6m2x2EG
	6x8r9AERKz+g4V1oP8iYvVKJ5Bz32qvYG9dBfU68=
X-Gm-Gg: AYBFou0IIt6S4uupON+1VD70c5JvT5uu47a3aZ3rLltMQvlmVgSvZ0xhjLUgY4hoo2X
	mZ6Yo4H7SVq7A4Wlf33hxqfWjm3jWxmP9GCv1biy+35P9M7FTliRy0lmvdgf17JiYCOhXvAAkim
	VAlZGblfOoxL9oQWkC0AApzjLEH259fx4axj7thRHE/IRhx5q/uKgOv28UArpohkb0/2XG8gZZf
	0Cw/RL4zNXxeG0JdRm4tsBvpABjbyFvSprumHYaVdtrMhY6bxSilZuI4lpeRvI2gQNZlt0iLqDn
	vft0uJ+XxKiWPYLXoEuQmwewzr366JZL1/YIJxqbvZBKunRpupY2AUyCTQEbM9SARQ==
X-Received: by 2002:a5d:5291:0:b0:486:f3db:e0f2 with SMTP id
 ffacd0b85a97d-48dbaade0b3mr6036971f8f.14.1791630731034; Sat, 10 Oct 2026
 04:12:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008201953.34307-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20261008201953.34307-2-wsa+renesas@sang-engineering.com>
From: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Date: Sat, 10 Oct 2026 20:11:43 +0900
X-Gm-Features: AclHuK-PSyRsX8cggYxKA7ZFI2xxYlvObXFkyui2LHRAXrkPEmOXGux92QpuC2w
Message-ID: <CABMQnV+U1xFSctKwkUkjriJwarD6QwGJi5tzQTerrK5Rio7e8A@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: rtc: rzn1: add resets property
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-rtc@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

2026=E5=B9=B410=E6=9C=889=E6=97=A5(=E9=87=91) 5:20 Wolfram Sang <wsa+renesa=
s@sang-engineering.com>:
>
> The RTC on R-Car X5H does have a reset unlike the other versions.
>
> Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> Passes both DT checks. Kind of fixes 3b3fdc9fd40d ("dt-bindings: rtc:
> rzn1: add R-Car X5H support") in -next, but we don't use Fixes: for
> bindings, or?
>
>  .../devicetree/bindings/rtc/renesas,rzn1-rtc.yaml          | 7 +++++++
>  1 file changed, 7 insertions(+)
>

Reviewed-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>

--=20
Nobuhiro Iwamatsu
   iwamatsu at {nigauri.org / debian.org / kernel.org}
   GPG ID: 32247FBB40AD1FA6
