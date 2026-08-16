Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA0B39B94D
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 19:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786906803; cv=none; b=KqEp8btGDm5H2l1VvLpqZnbmint3YsEU5AzSp98uSq4jCE4/vvmp+tWQWrtL62C7m/7jGMCLpsAmxA1xH4jevIh2mbcd4cj/plh6fm0SikaolDc29iUbQ55OzLWc2CNE48hC9Iop4um9PH97qLlPu2p7VTHbUb79jjfKJGF+AOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786906803; c=relaxed/simple;
	bh=nNF0ZohFHrdNjPFvzMMf9M0Qx1wQqpUmQ72xm+Xx+Js=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BZHbNT4nXirSRln2HWQhLQWlqEJJJQPnnH3lJAyYN2OIqsKxy6O0fDr8QpVjGWIbrIEzdCRI5e4Cqq3cPIL5C/MiAj4vzNgLr0BZl8tA7kfz9cYNLobPXsPcY9SFFWakB5di7Esu/6wTAci51PTI4xxNgwn23N0vXUt04QGzfuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U9Kcfj+n; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U9Kcfj+n"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4957eefd361so20059395e9.1
        for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 12:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786906800; x=1787511600; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nNF0ZohFHrdNjPFvzMMf9M0Qx1wQqpUmQ72xm+Xx+Js=;
        b=U9Kcfj+naQpewKtQGSt8txYgiq38l/fvTfCd2TnzJHj8vba+YSpAQuXq6R4aMGmeFh
         I85+U5G5Chetbe1dksImjPXrDu90LSVmwB9aHPR7RFAdqXTVke/uu2/0Ma+OIvOdU1/n
         +2jLHKxZdeS6VFyGr1U675HjvJmeSV87xZDoWnU1G5z1TxW0RbQcbMh1av0RMMl1oHBx
         OSmRFaQZb/cdkU8fc1Ny6FAuGuCkIoDABbTaaMKaiuo7vX7rI/mKeKyY3mu9+xUPwEhL
         OdyASvzczsaa0G3bdd4Nm5DIGOnRvuBzuXv59FoLXx4UvbFQzQKsFEWeUrCff3hp1UHy
         7RZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786906800; x=1787511600;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nNF0ZohFHrdNjPFvzMMf9M0Qx1wQqpUmQ72xm+Xx+Js=;
        b=D45EA7IlVM9iwcU8Tt01BwLpSjqQAIMTAW/SPOp4Xg00Xo7pkKJoCvwPA2ExdQjr0r
         EjdKavOD6x2epwj0kRQriTWNTcqWGGiXPaQh5LjkbHPKJgDWBH7kqZ23aATFCoY8kOQX
         FmWim1ONuEcSADgRaimX+CIiX7VV+pEpIxmNnjMQWxjPpnVeACfNOCd0+fU+HnWjqo/9
         H9g7Tjhe/JNGIy8NIGImssvg4dLP6UfRa1m89iFFc1PA7t4NPeXlcz3rqx9Zq3oLUclU
         qzDpmfvFgMT0G1rl47VQjOh/LXfQOjHCtf7o44uHCz+WJKExwNdg5J4YueoRU3K4Megj
         +EsQ==
X-Forwarded-Encrypted: i=1; AHgh+RoYoyF40wb9W9Jz7bgBLzt1eyEJIu3HyCPW1t+XK8/FfYG+0swN9qdTEeEw3inlZVhs2YUml012qVi3@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8w7smSBufk+WvlCJ66kuYbNlGJLbhZ0n4ujrWXTw3KI5xDR32
	3k7IsDhAP5a1wRNSRGeTGBYE2SyWatdNjmtevpcvnybT0Ui850ytIYa8
X-Gm-Gg: AR+sD10rHZtHC+dyBzAfE4/dH7ZsQW++gn6Zo17pN/5dSnmJEAnVwhp9fUFKAiYJ2nG
	WaWz0yEsI7EghBg5+xsCJ9FbBPsTtQsWCd/2RST93vMosuI2vZ+4Bu4oG5euT90vCY5mMCxMXVJ
	rIkxFJVYFvxC4429DukilyyBj8TXd8u07iW+pZ/5mCUgdfA/uCzohqFS/CROYl7Op2GrPvJ4/og
	gAenCTaArQolUnZtvbbZsC6QzXzW+fsj41Bu2OKIn22hdgODP4TaMUWBcMWTFfV8tpljI/a4DFk
	j4eaXhMVc5ro0lYhv68s1ERkGUM5miOOH0nrIfmAOndJkqV9M9eu2Mn3/HXqGP+75XH8JGgG+To
	Aniv+1ZVbsD7PQEtvw1aceN/gxQNUfyNpCf3f+ueQfz7vcAP/+0Ao8kl5MocaAFw7BMrFh1lpjI
	56BvMF7aJMjqqXNUdIotps02K5xS19KCLoADbQrxwS754TtGRd8jZLVutfvzJglBjVD5QMDyeP4
	RG1GSiQpwrx/jy9rpM8ZCurtFdpYnmn8vbFsHq+YFRWceaZH1FfMeJZYnvjtCwMnoOaGzO4VT2u
	ENh/Ofk7pwE+xdzDcV1S1zDpIYj0T11cmTvFzXTDl7mbQUQBA73J1486yxas947X4xX2b4bzwk2
	phwhPXGisSsngOmyBkt/08FUq2wi6KHCyz7+sJyQq1mgJ8Jyq/ubRCGp+qyFipwrT/6iylRwMw+
	uHI7arHfKK8m4eoEqzBl4lLR0=
X-Received: by 2002:a05:600c:1c21:b0:499:90f3:13b8 with SMTP id 5b1f17b1804b1-49990f315e9mr145661775e9.12.1786906800076;
        Sun, 16 Aug 2026 12:00:00 -0700 (PDT)
Received: from jernej-laptop.localnet (APN-122-100-59-gprs.simobil.net. [46.122.100.59])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49996100184sm105325425e9.1.2026.08.16.11.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 11:59:59 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: wens@kernel.org, samuel@sholland.org, Roman Riabenko <roman@riabenko.com>
Cc: andre.przywara@arm.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Roman Riabenko <roman@riabenko.com>
Subject: Re: [PATCH] arm64: dts: allwinner: sun50i-a64-olinuxino: Add RX delay
Date: Sun, 16 Aug 2026 20:59:57 +0200
Message-ID: <n0N02vZgTVK3duHBgrvA0w@gmail.com>
In-Reply-To: <20260815005316.28998-1-roman@riabenko.com>
References: <20260815005316.28998-1-roman@riabenko.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sobota, 15. avgust 2026 ob 02:53:16 Srednjeevropski poletni =C4=8Das je=
 Roman Riabenko napisal(a):
> The Ethernet on Olimex A64-OlinuXino computers requires an RX delay
> greater than 0. If the value is not set or is 0, packet loss in the
> downlink direction is severe enough to interfere with downloads and
> disrupt software installation.
>=20
> The range of acceptable values is wide. The vendor has been applying
> 200 ps in its downstream DTs since 2021. This patch matches that
> common practice.
>=20
> Signed-off-by: Roman Riabenko <roman@riabenko.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


