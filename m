Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07AD630FC1E
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 16:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777997828; cv=none; b=usTXeSa10TU8ZaOpqGixSLdLx9TLO1XY5Zd7zqWrzb6z+mLJhcQyKo8JDBGtoP7e2cV/Ya114B59OVtLVTR3/R2IInZapqPCf2wmgvYDEQzKUyE0tVJ1TduJY3ssIN2RYyqzIx9/wBJfVurDfxwl3FHtptVETqmjaIOMYkuc8nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777997828; c=relaxed/simple;
	bh=JC3hYS6liihf96hKFXCRKLPQmhVUOWHZUk/IiD0r11M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NS8Dhz6LnnI/emND23LasnKIoHsBv+D/1tiI0eZylel3MhvlAxvIJOYOVHTaO2fvyovibUTAAS5xZO0BGM0omKLPlxIY4eZb2VoX4beX5Cvqb3s1SjaPyUkm2TexkkMiJio7LkczMWde1sicwwCY0ZTjmSpKzC1LJFpzlbS0uEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H4FF23A3; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H4FF23A3"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-67be871ed3fso6134337a12.1
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 09:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777997821; x=1778602621; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JC3hYS6liihf96hKFXCRKLPQmhVUOWHZUk/IiD0r11M=;
        b=H4FF23A3p2afd2RFIiyHCJdqHSn/Vku7Xr9oyuxlaiKJpXhoLjYAnoXWNnjpBQBryf
         lXPV3muouLMnaiD4NNoMnYeRzCS4AiTBnmkguIc6lPX+cec+VzgFHrdGrkujWhEUiHCw
         dNQVaZi0bOVQxKA2FEx/Is6UZYhyuevcFG6E+Nlhk9r9H7FXHUzF9E1DQT8jZ8e0yAHT
         Bc3dOU7GZ1S4p5qH/Y1jP5q1DngcbiO1oIhvi5krARgImr+HAtY4CCbz78Br0Jf9XtrI
         220YCNJaFamyJq6OwZwAb2zi1jazVVih8SXd1kjzvjmpukEUlvTyYEly925tTFL6Wkjk
         cZcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777997821; x=1778602621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JC3hYS6liihf96hKFXCRKLPQmhVUOWHZUk/IiD0r11M=;
        b=Zn1XteLW0isEdz+B2fiK0NGPkfvQl3IEaiFitta6V7o9iWbtd/OapN87aJgs1bx9e2
         UxnRELspQfRlpCFn+Tfv8lseVVWslBfn3j6iIefhfSovg4tml9xqUq1mqdWwXDaigowv
         H3C0k2UuH2YF9fz6/qxmT0l3FnD+50ZKIDDHaee2TrPFAvhxp+sjC4iEkpV0Ushtyga8
         0sajDqmjrCCVoKPW8Ny0m9KClR+iJOmvoVuI3yINiYxxxxGbzrjogn1LU5rSaoWwL5/m
         RkDp2DwY0hjZUAV6bhwlYvHmEo5s9hCWcvrDEBXl8XXA0w1PZjfFmBUWk3LXG63Wh4cd
         pPNQ==
X-Forwarded-Encrypted: i=1; AFNElJ/wQI6TQxBwvCEe/Is5z6PGnsIiCzfS70RxoMNHS7x/VLj7NrxPcEJ/txszirvJl9Wb5OBbV+pCaGkX@vger.kernel.org
X-Gm-Message-State: AOJu0YyXrsJQQ0EZmC5m1pgJm+yIyloNBgErExtvPpUKg+gasb8q0Sx7
	d0S/9/HPOyfJkf9ZcgjxaPFGAdpSSeP2Jaqkp2PvvXZzMNExl9fOjfi5
X-Gm-Gg: AeBDiet8FHk8aZngIQLaT6izXP5puU9CuRHnRz36nUbJ2KpPC1eQ2kSfwMVKUpKirmp
	B5y0eLoUNy97XqgFqD8Xyf679IiyJcavWyGE3RZjBZRe8yIdh420uNo4ovSO5KoT9vNjpFyXWGT
	tF3aauHGNr4dXQfAh10BqkrZsWK6HPvosJCna0uajzbg+ncNco35f/zjBzwqgfNte/CWQWFCEHg
	92FWfzOEp+GdY8nBtX2bLyugBD+ZlkKFOTznt/oP3hu1diJ3/HEUxr/OKUaGktELOpII4JLpSWD
	/wbMAsnjIKuC6/vUL6TBrPN+ezt3nW83OcQyW89ojCOcnuQ47PzPCbDJ+bWmSMKwzxHYGQP9TZn
	mjNeihhDzAA99z9DZuRJepEfgEIE/ca+5XVwXTShR0Px2W/LoXTNRmFmbf62Ej6Py2VXG4AUpEl
	2QOUrO8zAS7dMDt+oFc2ceAhahIEuMKMVaN6ucx2soTE63c1qKu4sILM0Av4c5IbwfLwaaZJPqm
	bOEbDiLFVgKvTMSYHw=
X-Received: by 2002:aa7:d319:0:b0:677:866c:6bb2 with SMTP id 4fb4d7f45d1cf-67c1a2e5f85mr5124227a12.16.1777997820593;
        Tue, 05 May 2026 09:17:00 -0700 (PDT)
Received: from jernej-laptop.localnet (46-150-62-216.dynamic.telemach.net. [46.150.62.216])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67cd91d5727sm554894a12.29.2026.05.05.09.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:16:59 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 3/7] dt-bindings: media: sun4i-a10-video-engine: Add H616
 compatible
Date: Tue, 05 May 2026 18:16:56 +0200
Message-ID: <GgrksnDEQem0uehnTU2lzw@gmail.com>
In-Reply-To: <20260505134812.408316-4-wens@kernel.org>
References:
 <20260505134812.408316-1-wens@kernel.org>
 <20260505134812.408316-4-wens@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 5. maj 2026 ob 15:48:07 Srednjeevropski poletni =C4=8Das je Chen=
=2DYu Tsai napisal(a):
> The H616 contains a video engine similar to past SoCs.

Maybe add that it's first to support VP9?

>=20
> Add a new compatible for it.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Either way:
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


