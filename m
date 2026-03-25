Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650621D54FA
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 00:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774398202; cv=none; b=Id+pvGeB3AKQgCKsv8x+h7dW/F0DJuIGpBCSq1wlviNGkLsBWBhLaIPsyC4ccmZ0U63exdgbit+vspC2eI9nFomzrTLrscbff2Mz0rSMoCIFJKc3/psdCS8HqZvx1qk1b/keF095+m9vkrJznUGBKPLhDI5A2iXPF0j/i44o7sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774398202; c=relaxed/simple;
	bh=y6+6ift8pFETJSyRES9gpCeUsUR281Y0rbI8CYXXvQ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UaOchSQagk4qLlGmzMQaaUKDS4J253UYSWU/1HqXOFzXAzAHGmWvDFx13dVyn5EP63BeeK5Wm5m1z7rwTAVadx5vKB76Srit8ui872HJT349DENr1E90erR6XfwZ0QHu4gETfNsHKK9EMBLTw4xuCtPi8Bubzh9uKlgWu34u4CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q13u1zWw; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q13u1zWw"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8cfc2d1fdbfso153409585a.3
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 17:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774398200; x=1775003000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kqM38fZ/Ssz+tyho4othW8DbZuAzZOYo70QaO7E9QSE=;
        b=q13u1zWwqPv1veotXQTzyjA9Yw3C8njPUWiv/2etvtuW1tn+qtvpxOBX7gE7OEgdcr
         4IaUGjsX4riUlZtFhZjCf5CP4WW5BqgcwOzNLobH+tU40EqRsQ5r8J7znV8PLXVjHtms
         Wn/azsETKuJyeFvZ5H1S1mtrt71PXILE4uBAVPE18XdCMLy/00i8ZSr8STrOQQW7PVah
         lgTdnLOFPp7Yuo8pFJvix30D9UwUT5R6r9606bl8TqTR32WL2FZFp1LpENbh3Vh2w4rW
         KNPRiXHtlsy/NGP6yt8fCiVfi2iIUDlQ99RgRfp9ZX+Bxj/CuLDET3kyf+2MioU697LR
         POUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774398200; x=1775003000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kqM38fZ/Ssz+tyho4othW8DbZuAzZOYo70QaO7E9QSE=;
        b=NdgABuQqgSpAMdwkl3Dce/sacBq1v8eXJ7v6j5nByJr4AXoI9W5RQVExIchzEpViYl
         X50rfBLVHo2LvJBd75qpS1HafwQ36kzPEPYlOoqMErjkhMsUtE7Vpxdnl0HHLJ2nSB+c
         Myl7YyXSC/9MYSwWiXPeTDcEb6aucq5+FFCiKf1ORb7Dvxggbm+n01wEeTYiIMGBEPye
         gWwvg2eD9HGWVkEFX3Ortm1fwZVMlQjit2oB7kcQ/HK9efCQuWMMQmkdCdWEla2+xVsY
         RsuhQMUgYh0G5igD4ljyrtsHrFrM87nxGzygfYaJ3ezEosTwhp+iqKgFUjPftcVibucb
         Zltg==
X-Gm-Message-State: AOJu0Yy/CnreEZey8nZOV33hrb5UcQJLAQqnjo+sWAcwFg7NRILfblYH
	WgobDjMPMKgt0cJ+3FVytDoYohAELG7uqSQUHBcUm8k5dWzkW1hWkyo3
X-Gm-Gg: ATEYQzxOe+MLZlx0Neatf+2CglDHln72geoGpDsNyvVJKk4405INKJVgt7LozKUh0z6
	wozOk5eTB8spRsB60rk4jp04NjgVdPzCg9cgL119UUBdHDQT9YqjAXACGdWHW+ttx0HbfMJkkYj
	H5KxyjwaZHcP7N49SL/NE9Cqc4sfciLpuRBHwvww7fqjElGFHtIVv5tomMEkrYuiYcxJ7tbPPcO
	sPbTPJhWo1CQ0Y8iIWp3lFYwNmnsI7LBmcvXtD0S3UzclHzAi3bgCi8KDihbBUTetOpzxxi2f5t
	zXJ0odYBaF1hEPUiE8WNcjkBK7E6XV5VAJDyCXoJjToFQaZQB5ekAP6mp6eI1rxHNIWW1A96nBI
	Ei/PnsDQHRpmKFa/X1yKukHMTQFblxBqqXM/sUyHxN4IoFGO+YIuVY6ofeCCMOeRp6IoOjZZzw8
	KpXMQ8TOg01HgeWIiqMg8tfT4lpj3A2ANZr+5CZrb9CejM3EQiwteXgp4xJuLKjXbfld0n0LBuo
	kOHirM+csv8jw==
X-Received: by 2002:a05:620a:2893:b0:8ca:105a:298e with SMTP id af79cd13be357-8d0010753cfmr213579685a.63.1774398200388;
        Tue, 24 Mar 2026 17:23:20 -0700 (PDT)
Received: from jernej-laptop.localnet (16.red-83-43-237.dynamicip.rima-tde.net. [83.43.237.16])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c8536ba60sm128830856d6.44.2026.03.24.17.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 17:23:20 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Chen-Yu Tsai <wens@kernel.org>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/7] dt-bindings: sram: sunxi-sram: Add H616 SRAM regions
Date: Wed, 25 Mar 2026 01:23:17 +0100
Message-ID: <3400822.aeNJFYEL58@jernej-laptop>
In-Reply-To: <20260324164357.1607247-3-wens@kernel.org>
References:
 <20260324164357.1607247-1-wens@kernel.org>
 <20260324164357.1607247-3-wens@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 24. marec 2026 ob 17:43:50 Srednjeevropski standardni =C4=8Das j=
e Chen-Yu Tsai napisal(a):
> The Allwinner H616 has two switchable peripheral SRAM regions:
>=20
> - The VE SRAM is a 2 MB dedicated SRAM for the Video Engine. CPU access
>   to this region is enabled by default. CPU access can be disabled,
>   after which reads will show the same stale value for all addresses,
>   while writes are ignored.
>=20
>   The mux value for this region is different from previous generations.
>=20
> - The SRAM C region is an alias of the first 128 KB of VE SRAM, plus 64
>   KB of DE SRAM. The latter is otherwise unaccessible from the CPU. When
>   CPU access is disabled, the whole region reads as zero, while writes
>   are ignored.
>=20
>   The mux value for this region is the same as on the A64 and H6.
>=20
> Add compatible strings for both of them.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


