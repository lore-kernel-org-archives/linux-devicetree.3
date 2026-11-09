Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794239099;
	b=SdyMNdPaq+sgZBOAmpc35/mmrpDcwcsPWrVvPtCNxiSDb5SPSrPf+UcB100GexDXCtFi
	 xAlFiXxn7LejQnBDSZ5X+jq0RUojeEwE0XoddRGRg2QwmQMvlZUc80FMceUAVbL6AgMvO
	 RWjIXywnw6PDzysXpdX7VrInfmhplWK29BnVZWUmExOZztReDb+1dVK0l5cnL2Pc7Mb+O
	 4rvHLN76oNY1j7lTwlZTBLpBITQb8J0RlKzdMajzUyoaCUvvVb6EFpWvMFDZz+Ey9xDKJ
	 grDwAb5XJBY/e+xrjNMIK4sqpPLhEIau8rbLgNbILAGVG12BFL4NoOfFs4N3d9lrzvw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794239099;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=NUErs7NoE/3bV36QmlDjG5zSS9BL+CCDMLSs4x6fzbQ=;
	b=NN8XX3+JbRRAgVzaIUzY/JuyCnvHTtGd36bHeuXrw/wUAjdKFmmxqaeNjtTh9Yz8Hu8R
	 4SzMRFOoyh32M8S7FZxAYO1Xh2PlNWiYHJ24Sb4ZcdDat1Tq+8GQ2IeB7As6ZXKBtJQ70
	 ht86vsubVLEk2VvxjnYrE7kpG78ukyVnKSpq2v1yqDQLK23G+WCPRjNgmi0iaaoZEsZi5
	 AYxoTa/RYoF60qvKujjt0l/6yNc57WrxMR8zCWbgoot0FdvCjewZ6PJlfDMbcsBvijCLs
	 KB+Zh8wyJSLbreDDhIg3hzGmRZ/Q2S55tRquyKK1vYmaBqkRqy04uFF3KMyefcj+irg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=djbvy4bw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D0A606A321
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 15:44:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13D0A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=djbvy4bw
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36f6295304dso1256045eec.1
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 07:44:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794239098; cv=none;
        d=google.com; s=arc-20260327;
        b=q4oHC4Fehf8a/VvEpJGSIbPvQ1g2LK04UpGmlco4kN9aAh5krLwjb7cQqJliXuWyxG
         GgbMq2d5JFuDJdHZNBddIwO38HmVXkiYQRjbMpPjO4He8gvLjN6EAGI6fe+Pdy6aK5mj
         Fdrk9VqyOd+L3Z1+Dav1Tn8J3Iiw8eIJ1djhOsbX7JQQM5jmCWszwW+1gTswELZ7O9BO
         rtZDXS07+yKVatwd+ZqOpYB27JFfD0SDvK2aauUOWj/jXLJQugIaKXy1lPOuDhzzj4BB
         Icvp4b49rULkxuZqeg7MnOmLsHc1wSgIpXsWu5EwFdUB3OgU9jm7GjoLhB4Hp0S11Ig5
         NJrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=NUErs7NoE/3bV36QmlDjG5zSS9BL+CCDMLSs4x6fzbQ=;
        fh=fiOkLes5imjtNfJGXaX+ILYJkXMPnPYSRMWRtphKhTc=;
        b=ZC6lqk8f4EYL5o5MQfU6Zz4so1NfzXdam8u8R9VUSgfJU6sC+/pKVJ/KMPxIdwZuZr
         LWQSephNW8EKtwoqoRtnxR61VF66GCIJMOhcJlqpIZTCDnkIvEQN9aZN/FoDuMjtKW4D
         1IZ937xtv6tm/11deSbe6AmiflpT1zps1bBW80sNhEu0Xxi71RPDdsIGqJ/MK60jlypV
         BzU7zIGu7RdjZVRKN41w045AzyqMho/b2YfWSnsmW/06IHWAzbzfKLXz/6Xco1mlXzoo
         /czHBissjcAfzCG0YV3wGuZWogVHssiJXdUk/Is8iH6/VudnhWeGvBtTcp8nppoFFmcI
         pNxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794239098; x=1794843898; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NUErs7NoE/3bV36QmlDjG5zSS9BL+CCDMLSs4x6fzbQ=;
        b=djbvy4bwkHrZROZXukKzRSHh2GUcPF03DKtky9fbjTceOp33XSQPCXoAdSN77x4T33
         LctwVm6RKcbmcj69zO/r9OSQE96RNK4cryEgnUJ4VIjlvXN6HJuz4COF8XIywfjPcWgj
         TnC19638IQRnLdrPykQ+FnRI2ki8Aa+AOUZUjD0Bjfa+8Mje384QKNaWOs+3eyceTKAa
         42+IM5oNSdk8HgJ+YNwhAI0YDSIQZkKhWlGf84WQSH01H0Ahi0RjWdWsrxapEygkeEBy
         V8ud9zrJzjx5o3O2dzZFLVWNYOXJXUvE6y7hAKV6dRLU5Z8l/zJXkFoCmQCGYbwuhQAw
         rgzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794239098; x=1794843898;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NUErs7NoE/3bV36QmlDjG5zSS9BL+CCDMLSs4x6fzbQ=;
        b=v9Dn403HyhCc4XBp+i3Lh1dYD5BkeUOA7DVVbSXOVUZf6cFadwOwFkSHmjXx7eQd9/
         v4WdsMSPSWhCOz/7GGBZoiIzUbyREcEZ0aOyH7TuRj4XyM0Avop8z2Uz/kl302lpW0nG
         EHU3Clbf8N5RjfZKLuVc9zO2svBQ5VUtdKhowjEls6gWm69D7o04P/xGfjDv9TMygb1u
         efi97TpnUuZzM2YRgvyQAuGxSuQpPb6FiNprdAC8O/agZhqVDZjlQ5hsMcj8Y97HNcVn
         baSqWiDFeaM37X22MBl3UP5OL5n0AQNZMZPCoN+i3hWom5t41/f96R+e7MWJKRiuKgpu
         ACAg==
X-Forwarded-Encrypted: i=1; AL+hErEH++G1LcDZEbhXUVzWd7xyF5pJ48VdIG4c6xTU5+zYKDnXUC8C/NwerF7lp3O9kmoEoI92lgXz0NWz@vger.kernel.org
X-Gm-Message-State: APuU4Z/zNfAYJggbV0nsNYqpcMe+G9kjzzTPF+jLQhg+1hPsueX2743w
	NcHCi7M7uq0uQmkWtkF4etoXQ6qJS/TtrsPIre5WmKLiZA7hHJNuQXvmHe0gVbMQ8hxC8TWwryg
	jI8y+kqGEXXv3X4yvT3wT5WwbNzY2D0o=
X-Gm-Gg: AYBFou3cuOGzOUq6UWvRk1jwaocn4IqRpAaGolTnEA94MR1LY5Sm9q2fPl5qVRA5kRD
	zsN3zbsoV7j9eQ+MZkajo/3zIDp2Vi/jzi5BsrFDCZw1TKhgHLt30tgyTa7+4KYUie4KD5fVvU6
	O+0IqeQs3Fs26801CKjx7V5aU4pUDgjsxq0dcNDxZE+qVDiEB0SlDBVpyZ64J/9Xw0SGLCIYO1A
	5uI6Q/eqmehm+rBjPq/TM3Ep5PSKyL9uoehoRtXXAXb1HGMQq5MJHBUJV5reLCYkN9CybMk8AE5
	E2iQim7l4IYVktJ41VQ0lToSGfpMPqijaIvi18GXtzBKSgRPqjI8lugUITsZtooxOXap87U2Cw2
	KztlwkuJdblvHUK8fubKFpFgnAPguTXPOBb6z
X-Received: by 2002:a05:7301:da8b:b0:36f:4d62:2884 with SMTP id
 5a478bee46e88-372575c62b8mr8103918eec.30.1794239097992; Mon, 09 Nov 2026
 07:44:57 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108212826.15890-1-oo.hehir@gmail.com> <20261108212826.15890-5-oo.hehir@gmail.com>
 <d9f4a750-5f9d-4749-929e-330c8776971e@freeshell.de>
In-Reply-To: <d9f4a750-5f9d-4749-929e-330c8776971e@freeshell.de>
From: "Owen O'Hehir" <oo.hehir@gmail.com>
Date: Mon, 9 Nov 2026 15:44:20 +0000
X-Gm-Features: AclHuK9x9EpRxZ7OnBIKVHuPQ20ucbS7TGPBTpDY5y8PK69Mzss7MIfYBHErfIg
Message-ID: <CALp3LZ6HRs9pxPHj-4TYPS483cEaVBJ_kOGYmaWr--MhfQ6hCQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] riscv: dts: starfive: jh7110: Add the RTC node
To: E Shattow <e@freeshell.de>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Hal Feng <hal.feng@starfivetech.com>, "ziv.xu" <ziv.xu@starfivetech.com>, 
	Conor Dooley <conor@kernel.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset="UTF-8"

Hi E,

> Is status property applicable to SoC rtc? If not, then is 'rtc' label
> appropriate when there's no status applicable?

The RTC is in the SoC always-on domain and its clocks come from aoncrg;
the 32 kHz oscillator is set in jh7110-common.dtsi, which every JH7110
board includes, so no board needs to enable it. It is left enabled in
the dtsi like the other always-on nodes (aoncrg, aongpio, pwrc). Other
SoC RTCs do the same, e.g. Allwinner (including the D1), Sophgo CV180x
and i.MX snvs_rtc; the ones disabled by default, such as STM32, depend
on board parts that not every board has.

An alias is only needed when a board has more than one RTC, and none of
the JH7110 boards in the tree do. A board can still disable the node or
alias it through the label.

> Note that Mars CM / CM-Lite System-on-Modules may be used commonly with
> board carriers which implement a battery-backed RTC on the I2C bus, and
> so another 'rtc' label may be applicable, something to consider.

Good point. v3 renames the label to soc_rtc, leaving rtc free for a
carrier board's RTC.


Owen
