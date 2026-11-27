Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795803166;
	b=mHctbFavJAwXslwtNDgX/KgGKThjNSIoHlsaUwMae4+rS8G7in1zGME5vK9zVB3Vm0BM
	 LFAGAshFxPdWzrm0XXXK/GOjGg5xXRQ8hfXAQ+WjyO/Jkagk0Jrfi844y5qZhjAhMGEYz
	 /1cD9REgeJ10gCW2uUby0xl8YYhXAbrNa3+XpZn0GMJcETZ8heoO7YJ/uJHl8y7W2tg/e
	 9ZItfRee8mRme12m8eqn+DdhfokjHavMe6AZTrFunU4lMv5KF8S/otKBIAgYyqQ1nz60e
	 YUHvt5WSM2bn0QWna0stLUxXOKUqbc7KsDiPgTB6DzdSeXEphysDsmoa23i+cpJXFOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795803166;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=g4XjkTeEPorowL6TGZItvt/dW091Sbnkdr9qWSWKFsw=;
	b=0a9EK7y4SAfY0TKwDqUV0IuvS/jeHrT5RAGMFB1PIfrcJopj9hBtv1+wYV9198/M9I9X
	 XC5IcpXxwUtcK1qd5CJMborZfDC0m/pdMCckQKriDOKvzcnYJJ0To88W4kA2euGM/DuJY
	 j9YuZ1Qj7EyCPGW/IYSZJJIU7KuVr5TE3eoh7sqq4WJfEXY0bMFX0bY3/B8QSiuglOa2t
	 dnTESqHh/JMAHfM8t9Bj0+SR4frwWqlCzfWgiSlHzAM9Se6t/MJfYGRHsFHt9rZwq+Qzb
	 /YLr7nFx9+BUBPfdGPUjbLuVlAaNVpIWBeWWuwfO6Jc2A7xB26qOTUMqdIaAQwe8J9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.com;
	spf=pass smtp.mailfrom=protonmail.com;
	dkim=pass header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=VXmBLnO5;
	arc=none smtp.remote-ip=79.135.106.28
Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch [79.135.106.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE50606A31C
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 18:12:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FE50606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=VXmBLnO5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1795803158; x=1796062358;
	bh=g4XjkTeEPorowL6TGZItvt/dW091Sbnkdr9qWSWKFsw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=VXmBLnO5/cti5FpDWa6tnZ0X0x1Uo6/ihGFibv4xMx/41pfr1ie0ISxHu+0gP94o8
	 LiDJfqNHSmIpgRB97B1Fzar0fBtj/yHtfvvBKzGlzLQjaDdreYaNJVgj5gtbp8+LUm
	 BK1CaB3s16sypcJxjB9e6SgMB9EFiPXsK+zz/Ni5S5DMvHHbQHSb8G0DBQ8honoKvf
	 5Gw+GBswRwU5Nkh/lgsTNVOusr2i6oGQ8f21tH3PqgSElJSlgUHK2B9ezzsxMe7Wt3
	 WYaboM+HqUTnszU/8wVad7bggWCEgsljt1jNNXiUWy+MHw71jdAn0jTeLraem1BzOs
	 fGnj1iaeRA+rA==
Date: Fri, 27 Nov 2026 18:12:33 +0000
To: iasnezhkov@gmail.com
From: Roman Vivchar <rva333@protonmail.com>
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, amergnat@baylibre.com, me@adomerle.pw, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] soc: mediatek: mtk-pmic-pwrap: Add MT6789 support
Message-ID: <czEp-CqZIp301roqRSqIALy9ubTnOg7uHv75zRifEAuhIS0f1zSU45eKzIC3fZfiUnaahQK6yVuQvthvHZOt267Mpt13X55ERh2A6HJRTic=@protonmail.com>
In-Reply-To: <20261127030009.10572-4-iasnezhkov@gmail.com>
References: <20261127030009.10572-1-iasnezhkov@gmail.com> <20261127030009.10572-4-iasnezhkov@gmail.com>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: a252025cd58c9cc04ec8fb1af0e63707bf4d7bfb
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Friday, November 27th, 2026 at 5:00 AM, Ilia Snezhkov via B4 Relay <devn=
ull+iasnezhkov.gmail.com@kernel.org> wrote:

> From: Arseniy Velikanov <me@adomerle.pw>
>=20
> Add PMIC-Wrapper support for the MediaTek MT6789 (Helio G99) SoC.
>=20
> MT6789 uses the PMIF-SPI arbiter interface with bank 3 interrupt
> registers (INT_EN at 0x450, INT_FLG at 0x458, INT_CLR at 0x45C, mask
> 0x180000) and WACS2 software interface at 0x880..0x8A8. Register offsets
> and wrapper parameters are verified on live MT6789 hardware (iKKO
> MindOne, MT6366 PMIC).
>=20
> Signed-off-by: Arseniy Velikanov <me@adomerle.pw>
> Signed-off-by: Ilia Snezhkov <iasnezhkov@gmail.com>
> ---
> Changes since v2:
> - Added PWRAP_INT_FLG (0x458) and PWRAP_INT_CLR (0x45C) matching bank 3
>   PWRAP_INT_EN (0x450).

I don't see INT_FLG and INT_CLR in the 5.10 kernel [1]. Where did you
find them?

Also, the series doesn't apply on next-20261125. It might be due to
recent mt6572 changes. Please rebase.

[1] https://github.com/xiaomi-mt6789-devs/kernel_xiaomi-yunluo/blob/d92da04=
1e3ad824c273877abeeeb07c145c37d02/drivers/soc/mediatek/mtk-pmic-wrap.c#L667

Best regards,
Roman
