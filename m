Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8DFF17A31E
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 00:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774398724; cv=none; b=h3L5xNrEGC4XJd1joeaWVf/cea48Nj4iitWMALNw3967lOrTvjW4RRRoN09G2ilCp0lc8Hs2V+3XF2wY5eTLvrCjsBoME6ZWKMtjsdXCxZptBvqkZKdPPlvfpjI0e0WEbwlylDllTTxNPK8HYPISgNT0/rVP3TFDgTHJc61Jxb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774398724; c=relaxed/simple;
	bh=gCLRk+NAkU6fy7pdsIcUwbode2bX+R63hoRqk/fGQl4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hAGXXSolUtNf+tnC9UvVsDIWOFEHFQqKtEUfO88X+DiQ4z6NFmwoS11ae6UgauDHe6mDICsounlK2g/5iq9V0PWrxcCkHUTdKKDzRsnaQw9lHbKdcfg3V12QrBOiVk8KbXdC3AxKiQI4tccD2BYs/7sPd84Isgr+6MOv9o2KVlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QwPjg8aG; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QwPjg8aG"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-5094e1d17d3so48565711cf.3
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 17:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774398722; x=1775003522; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gCLRk+NAkU6fy7pdsIcUwbode2bX+R63hoRqk/fGQl4=;
        b=QwPjg8aGvv5AM3kEap9u5JHkAvyOM9dilpYLyjeggmSEaoqz482SKgIDFpPBLO+t1C
         UgIQE1wFnjawFVPmrArI0eUjnH3cH34KoBluanpVbGflSMHOAltyApZuhUs1TtUJYWwo
         HL6di6n/ef9WXd1NYDm90DLCEHk6FLBGDWTbI2SnCv7lNKdXJaIzvBJ6rqDowuvHIOOO
         qmca5pDQxtE7CrxdaXf3MWGQ1eHfaK7UfPczg/QP7+AI+9ZO7GnJwnyIFectjP2um+Yc
         mmyIrBkolCTWIfOKYjh6OY0gzh6QgwaGiPMGLlFdt4Bub1rDy3ZAfj7NVo52czNnBc2/
         GJjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774398722; x=1775003522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gCLRk+NAkU6fy7pdsIcUwbode2bX+R63hoRqk/fGQl4=;
        b=gIQNK80Xt6REM7PZ1zgvp7RSWYvIl746zptKkmX9eTC8IMncUSP7DwCv3GmC2F4Ctg
         +tSxTFqHIJCjE8IsvwTOoCyzZCdYOJ9i8jZU2tdp+Y/8wyWmqUBjqVLkwOc0gcI2t07z
         8LwAS3XPQONKu+CRn2tuZ9RB0OpGKfxgQzJJF1E6bLlCrj7hambiXLdKIpIK91IAuErX
         bfIcZRyq2XQvNGYfpspYCC5ZHrMOW2c1gfTDzPwp8uKLZTMmjw49xs+OTsnNeaZ9WED7
         jaISmQGSXJEEsvvY9CMrScdEXN+cUoPCSlE3I5TDtGLdwl0Lmu7f5SOuPiyI3K9AMUmZ
         mATw==
X-Forwarded-Encrypted: i=1; AJvYcCVhopzELp6RnmaWnvccQr1nBvkNAy+7a+f/7xICkpbyFtZklLE3GUCXk49rpVB8O6K7NdS08Ox9UxoY@vger.kernel.org
X-Gm-Message-State: AOJu0YyuEWtRb4XkG7mkt04/UaaQX8qCBMy8JU+PawUPMTF+TXhs+qwi
	Y/UQSQSP73gSbZsyBRtSSa9hXXsMCXSSwpi/4yGNUkXdlEeqpAy8BH3f
X-Gm-Gg: ATEYQzzN6sfPEkfmaQGLM15bWQuwV/SP6R2A6ynKhWTAs2O1uPWIhCvQJm3bhSm13/n
	W7ApVThQy6NnNzumPv/nB8zbGMQXFAfEV62M+ApVeKRfDbt826OyNkEvL18TICkak2PLxvsYzts
	aXp/wPe+4PUleXfJaPYGThWV/KYzqPrtMpZXSmVc4WrEUrbyjnrTXFqG+4mhT29v3UiZZ7m08kj
	G9zdc+cPDzehf6iZKHW2yumxUmGLwTuYfTO9Bl8l1bCVPD7qpn4aIuhSQjOMA1B52UvwXpXfS7w
	IPdY0Nk9faBhL0zkqMy53/zJgtlUU6j4aKv6FdGkmCsG2hFEA809+gVVrhEa5PhpCnzmB7pFteB
	z+0Yjj5Tk8w5VugV57sP/A9AJ8+FvjYOl7OoKe7q6IQbBr9BFZYpiJ5uODJ/EQCG9OXvW5x4CEJ
	vcjaEpotDiHTdy/+gXNsjfiyqV7MTyvf+HTGqPnUotr5Me+qN0fPkUEfCpGR9h5PjblghLKwqsr
	fBvqY/FRvQNrIi6cSHWXKvA
X-Received: by 2002:a05:622a:a291:b0:50b:4116:78dd with SMTP id d75a77b69052e-50b80ec12camr21220341cf.66.1774398721780;
        Tue, 24 Mar 2026 17:32:01 -0700 (PDT)
Received: from jernej-laptop.localnet (16.red-83-43-237.dynamicip.rima-tde.net. [83.43.237.16])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b36e34f8bsm146375291cf.15.2026.03.24.17.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 17:32:01 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 2/2] arm64: dts: allwinner: sun50i-h6: add UART DMA channels
Date: Wed, 25 Mar 2026 01:31:57 +0100
Message-ID: <2052919.usQuhbGJ8B@jernej-laptop>
In-Reply-To: <20260324161930.1602083-2-wens@kernel.org>
References:
 <20260324161930.1602083-1-wens@kernel.org>
 <20260324161930.1602083-2-wens@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 24. marec 2026 ob 17:19:29 Srednjeevropski standardni =C4=8Das j=
e Chen-Yu Tsai napisal(a):
> All the UARTs support DMA and are hooked up to the DMA controller.
>=20
> Add the DMA channels for the UARTs
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


