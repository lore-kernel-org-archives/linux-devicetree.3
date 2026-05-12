Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459973C4B98
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 16:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778601613; cv=none; b=oI8QBfMlZumZs/5kUA4cfkCG9K4hPplANt2+0r2di9d38x6JBbLrdzsTCvhseHpAQVOSeJE93qE3d3SuZglbTYDy7UQ5Jjpo2mif9qhgKeW/5HOVdlk5e9eBroKQ0/5UF0zXmygNM+5hiQWHuqeMvLnKrmrVBEvKvb5RuSThiNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778601613; c=relaxed/simple;
	bh=GMlWUewpnO5BHrxePkEK12VmSLLS4fX3PTW9+WOgwyc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t3zG1hxcspfiDOJOz6saOzEwaWPHGBSd2tZskKvyir9HV/Qigslqso32s+x+0xY/IGeHwaq9SGS+RoLec0FNVAHMymByop4yMTK9yRzIpuSsVOyaRUjDUXgbqG6onCBb9QrBNHrS045rcLYGRkHiM+Ejnfppx0pUEKsRCRcHthQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EAkkvVFV; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EAkkvVFV"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so55938205e9.2
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 09:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778601611; x=1779206411; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GMlWUewpnO5BHrxePkEK12VmSLLS4fX3PTW9+WOgwyc=;
        b=EAkkvVFVDiuwBvyWotz3ploIq4FCL7ydSyRUtaX4isUBvG5gHlOS89Fi5YlJL6Ev+s
         N0hQo+IKUMJvrGDbHb5nuUnkYiXHz42zuumXxtrjzTmhdoqgxgUeo1AlqimfINIpHim4
         9RjCuJC4iwTvPZToDRMDh+UAXlNj+HXZgyuNea/uHhrraoOfrtIvB3pjZq60Cafd+HuV
         UynBD839zdvAbtMddyS7kBqxaS7bQXquYzhQ9C2x0+yMx6coc0mNLzhJfdsfFS+5vJss
         ggRvwQFBJmXbVhyv2Xsh1Lly3iYlOFQOUim/tEEiWE5x912Mn9QSyiZFnibCXMZLTJRg
         S6cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778601611; x=1779206411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GMlWUewpnO5BHrxePkEK12VmSLLS4fX3PTW9+WOgwyc=;
        b=lvIv3wQPVQvvhyJbkxQgheZ8OUZH5kdPV/zp/x2CHEpx9WjaUPBITlAwduNy14d8Fd
         /TGlEdTazsoODNbbqbirhNuyRq/KUnOXf7LSG4bVjKlAgeLqpSgjrEGMnCBK55cSQ4pI
         OvvPKzBNAJxZ9XgkYJ6dBrNBEj2lVVygBOQGT34cW3dC+Fnh7jVcj4fuH11oJGmHCx8y
         bMkLoOBwjf+k6Rr6Qwe0YPHMvOI95ICuyvn0hf3htWX6qSom+kR5K3GvjVYVj73p9TSN
         Rca/o3D9Ro/lBml9aiUT5kdZsFvrDC4MFuDy7eoBTQ/+Iq6p0FXKTOjSaL5FSOVG+5pC
         h8Ag==
X-Gm-Message-State: AOJu0YwJn+HkoZ65PQ0D04qU1kf3cjWDNn+S9h8Bfy8W2uVgHIJF2qK+
	9KBRP+pb3WkdBWYpDQuSJLD4Wd2uS9225lMFYmuUel36jg1tCV58yPGz
X-Gm-Gg: Acq92OFwsdvAc3xeQDU7I4iBkvzUIiAAzr2xrgET0lkcczijEHs8dYcOl+ldNSkrFAR
	RtCnsOCvAmKKkgV/USe+4GczhzWxSZbbTlGSMNurAkrR9TQeOeZwAwa8Ijsvj7a3SM9pMiUeuHP
	4EwktrdprjlE8SLDC5XtzwfboVO9QOj2k7ybypPgdiWO2YXZpLFwGlGzsB4nTWZDzGxfyQRLHnR
	L7ikEzPTJl4HicCvriwHzNuZEGXWRDGs28TX9RLHrBoI9VKSft7LEyDFkQ3+K+Wv7zOepoGqZSb
	I1ofgoey34U7tEr19PazZromS+tEJdX2kQl+w61OrWY1Qv/jIizQCTsoX6uaaLLJFz5NUte9WIy
	AXNX3j5l3OLWhZ36eyPMVlLdQFsHP9BnW5Hw5hBd12wNxdLHNf2d+kRij6pc/bhgHe+367STIB2
	vznZxWYnscK7AbHaO47Yhr2E88eCFqMw0BhV2bntrs6qABpi7NT/tok+sgPVWwoP3xAduizrkMD
	U6lMs3n
X-Received: by 2002:a05:600c:c166:b0:48e:8499:4bda with SMTP id 5b1f17b1804b1-48e8fe732c5mr56263285e9.13.1778601610271;
        Tue, 12 May 2026 09:00:10 -0700 (PDT)
Received: from jernej-laptop.localnet (46-150-62-216.dynamic.telemach.net. [46.150.62.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e913469besm14404775e9.14.2026.05.12.09.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 09:00:09 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] arm64: dts: allwinner: Cubie A5E: enable SPI flash
Date: Tue, 12 May 2026 18:00:08 +0200
Message-ID: <cjl1U0d5TU-5Dhz5uRAUHg@gmail.com>
In-Reply-To: <20260511221741.25888-1-andre.przywara@arm.com>
References: <20260511221741.25888-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 12. maj 2026 ob 00:17:41 Srednjeevropski poletni =C4=8Das je And=
re Przywara napisal(a):
> The Cubie A5E board comes with 16MiB of SPI NOR flash.
>=20
> Enable the SPI0 DT node and describe the configuration.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


