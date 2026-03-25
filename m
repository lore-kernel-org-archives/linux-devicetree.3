Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491071D54FA
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 00:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774398261; cv=none; b=nna8an1lWHowdXaHLf29haJhIlP8bfUnikqtRyTjqXTstbIAqqGWqc7bRWb2jA8bwInt62Fy5KOYhlyWr7d34pkgVXBO31c7MS5e3YgFz5dgbSkK9MwRm+Dadvvb3uYHtLb1cY0MY4escZ/7mu1zJzk0pqsiFI0ja/QbHuiY8P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774398261; c=relaxed/simple;
	bh=y9QUfBbiO+kjiELTZ3KNnXYoTbhjP6AEc0bBAmqsZ2E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lTnQ6VyuduEj1zibx5UBdPgcmIG9+/OuvflshdSob4R/uf6OPyONO7doNWnJVwF3LgcnwvmAS/yBqIGyppd7J9Y1Iuyi+AA0H6gOB/fj6efKHz6FimT4vaPWuX53WHH82IUA1F/01BIA8u3ODJGfnkEYFtV6IqxAgOA6II6gbe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BpZQn7vB; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BpZQn7vB"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8cfd122d78fso706864885a.3
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 17:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774398258; x=1775003058; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y9QUfBbiO+kjiELTZ3KNnXYoTbhjP6AEc0bBAmqsZ2E=;
        b=BpZQn7vByit8sLj8EPd4fifEnoCNKYl8ipjXoXPgT/Hy+d86P7UKi0dHCqbake6OR/
         wv1aOT4yeeVrinNMVoU+bgt1CSdLROJ/+MbzZJVGjoYPCcKr5PJyIxyOOO/dqwv0gyN2
         +vGRVPbw3WC1w3fGHtirhgrQhMXCGt1uSy08XmYqtDd4NKURPpc63sln5Br6bDn/6hVG
         jAaSVFfQyX2oxvyzdnx8k/uunXW85me4uhm3YH+6VW845Vyc0hmapFWSV7GJT6rzYMcA
         lhDbalr/BYkFtCJinuWiTKp71NTqYdDYcgK9bSY46dzsZ86WB7YhjdsQxQytjalnpmFs
         kIpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774398258; x=1775003058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y9QUfBbiO+kjiELTZ3KNnXYoTbhjP6AEc0bBAmqsZ2E=;
        b=OCxq9ulrV15V1HLqJQoxyLigyzbV82NZLoJA/ZjGN4kdltup9x1rm9J9Q34QYTNGOK
         WfEIKs8VFqMNcepPwxpNiOuEF6YS9vcaf5OyCs+lWzVU6S7YPgIIHE7YRdBFwiAZgv6g
         /gQJQk4kEFXg1Yx1zZuIHegyaU4tjUe/tjvJTQmtiAEYmGqPAvscpBz3juOw/LInrwOm
         +HiBIJqAgdWPyUHIUGSPveLJM8S9E0ANja6r5GY1q4KdPf5TLABkRAN6P0BAi9Ny6q2W
         8/u0BWXuh/s8MZHH9Xnbuhq8lcFDdw6IIkY9n4gB5zHPi3N5YSdgJurcVYRf4HpmAGYd
         uARQ==
X-Gm-Message-State: AOJu0YyOsND1WExCjNbqOOBCZLLY5A5BnkmV5mRBaZM1UsUFCWBXVgeu
	unt/hSRERdKxCDVBzpUv2MnMaPvmThhsZ3zbcnXMKOeo6zPK3YFbIeMD
X-Gm-Gg: ATEYQzwOaeMZrQl1Yi72UNvu3Pj+eQ5w+2BamFXvOGSJet0JLzhpwREqXulM1WHF3Im
	v2iyCgTgiqIxHHrXpTx5xzEorBK/qr2N55ebSQS6Mch0H/eBH5wLAOy24ruLvjjfcI/PeR7/ss4
	lTHTHh1f2yjSyOPZhK9OkfhY9FUETAtjwd+gRrCDs7fh7Dc2nTiqvSIRkWoBtYuJxZyBtUgjgHN
	DLyIHlyF+pWrE+5RRp9YuEj/RjEt8rcYIW2dSA3TKJJb7zlECk8WrvlPjAtc3njQymfR5dsN36x
	tNHmkIo7jYIUzKE2mqusClqCTDWoVg5gRFnQlywC3La1LJSbyd7jOrohL2Mo6h4ZUc9qcsA33a/
	b9d0ewmyozTi7qSrkMuivLo7TTdrt9hb55opBG2xrGmF/CcSuo9Vs419usGBXdsHV+1ikT+YZK7
	G3lg0a+PeIbQ5UygGq+tCLrTN2/uChMtIL021l1FXAbq1mEVGjjyFXr/b3mvfaNUzV7DylWSiBC
	n7S9+wlHzbHPg==
X-Received: by 2002:a05:620a:44d4:b0:8cd:8ee1:2eec with SMTP id af79cd13be357-8d000e4ab6bmr239394285a.0.1774398258039;
        Tue, 24 Mar 2026 17:24:18 -0700 (PDT)
Received: from jernej-laptop.localnet (16.red-83-43-237.dynamicip.rima-tde.net. [83.43.237.16])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cfc8fb9c10sm1375930885a.19.2026.03.24.17.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 17:24:17 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Chen-Yu Tsai <wens@kernel.org>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 3/7] soc: sunxi: sram: Const-ify sunxi_sram_func data and
 references
Date: Wed, 25 Mar 2026 01:24:15 +0100
Message-ID: <8657193.T7Z3S40VBb@jernej-laptop>
In-Reply-To: <20260324164357.1607247-4-wens@kernel.org>
References:
 <20260324164357.1607247-1-wens@kernel.org>
 <20260324164357.1607247-4-wens@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 24. marec 2026 ob 17:43:51 Srednjeevropski standardni =C4=8Das j=
e Chen-Yu Tsai napisal(a):
> sunxi_sram_func contains value mapping that do not change at runtime.
>=20
> Const-ify them.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


