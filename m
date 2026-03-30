Received: from out162-62-58-211.mail.qq.com (out162-62-58-211.mail.qq.com [162.62.58.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296EB9463;
	Mon, 30 Mar 2026 02:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774838870; cv=none; b=hns0cvq3GhZHTUe1y3JVjpwpWuDVZuzTSJJygcjHs83PsMzUw15sj1zQFIiQgRR2bKkpZQbUr7v/QR7C3wgT2HOsoFHGW+FrNruPxFcoPqL1kPy/D6afKxYvYIZn+0LYsrTrKLfzyd0eGIr/pU7PQ1BiIzX7Sw/hy1XDjnI8nR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774838870; c=relaxed/simple;
	bh=GqHCWlkHni5TW5CTZSaBkNowmFzHJaSqKEcKxTx9W0I=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SzLzmLP6qvqJHT8EBX3tgK2XmlHZQc7sKNgmbMVEa8Bd9EPS+06tAS3/9FuLgbStGFMNCJNeDDKQ3OCikAHnx2I2wOimlsAEBazTQ3mOtHza7eHNBrYTi/6I2LXDqWxXv6r6g8FQDyy16pjQIPMKHJilQPq+dvmqV6Y29Cs01Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=Red54.com; spf=pass smtp.mailfrom=red54.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=M2eeelTW; arc=none smtp.client-ip=162.62.58.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=Red54.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=red54.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="M2eeelTW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1774838854; bh=LzfztcHVW5zVig+WG14bRx+Z0nkYHAr2g4y2I8ErAoE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=M2eeelTW6i0L0tXSpv9TL1cOaX4GUj+YwnaOgyy9Y+WcChuL8DB8I2JClDgNG5esP
	 /ibxCqZmgOBqB50GxHA2Q9Shm9MoxEIC7xc9Ea+YsINxXUG8+J9LoI/JESpTh7K1ll
	 5+Tho7bGpC6b4nTc/UqAQF88kzoDEaPCndLfJ1EY=
Received: from mail.red54.com ([139.99.8.57])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id BC0B724B; Mon, 30 Mar 2026 10:47:00 +0800
X-QQ-mid: xmsmtpt1774838820tpjwh2w6i
Message-ID: <tencent_723DE3D68C7F44CF67ED583F558130B47208@qq.com>
X-QQ-XMAILINFO: NGZp1yYNf7Y+JMPTFH+qlG0rqFrd7A0ipJV8tAJUcbaZuu0agTHNatFA4WZx/s
	 zodnfSGb1N+LAOqHNYU+r1lA0EcdWOT/nY6HCBp6KlPHtbuylYyVlMGP8XfiVBQeXgl8sJgNkU7u
	 /FFo437UhXvLd4MVfvGMYNYMuKCiQE9gJ7hTn/uaMdUMroYzccZhE49oG/amEjCfsyP4MZ+S/tRP
	 kADGHEiZ5mNjZm2VJ2oeaGVJ6eqi3bDMhE6K6g883lDqqWhk85qB5cl5BkotUirbY+oMm0dwSsa3
	 diboPV4L6ehO0NGLq+0UfOL+ZrQksOhS3FGUz5DAO7Mvf2lPB7PZiXJn9ZPg6c1bSP+rCgaLkhON
	 66fwD8CEhwamOsYf27Wbt9o9C1cj6OyHjSISetWBySFmE7fUz5ENXBl7ZdJlKd4YCoaRxv+KZ29i
	 wps2ca7JKNs9oL+gb2LLOKLqtvZBX48Cby61HPzxi1lTfQhFd8FAaiBIE73WHxIOupRni3ucFZna
	 hEk1vnuaCXBB5lPwLLXA+2sGwosTx38XHtxs2W0+AxajoTe5e2K7DKszL44PhWwsUqACuaCwIza8
	 j2ZlLPavRhNWSvnGnzAU3EHYH5jNJcr3sy2BrB7Az5jT6UubNlWlc4JrbjdAA8VLhI36PqMVUSon
	 Gx52rRgFdFw8YdDMF9V8gwzn3/m0oG3zoSS9Oh3vh40tl0TFNQgil2L946tlM6yZOlo8cd+j39M0
	 Zt0t9OBTXNRCqf0TI0ly+MPPA6O5ifBb1rK8NaqoUgnyVRp2dcegXhZ4oAiInUW9VZLtdmFZuI5b
	 V32NC6k7yAQNlEx415H4MKoydnY7jXUL9KsN6UlCsUinLTt/VZhgU+pNbdIEndjzOse5fAG0l6VI
	 aWy6WMVOOyhlpzgJd0yfIcGmObTQY7xlAv35+HebXUjRJ80/kmUjLElSZI+y9g9yO448fnFDlZuv
	 bX83Abl/L7cavgA8+Q9fHhPMiri9ksB/IPs1SglOniuK5y22NrEeBjYuLflRh54JUzi/jKgOLJoQ
	 VraR+p0RqXtKKyAvwKnhcslaOTJC8Lmf5vCtpwPU5KQexpaG6eP+8x1SIdYyHc9luOyS0ZTcSUSs
	 Br6zrxwFeblJb6BU66ckbYxUhBIA==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
Sender: yeking@red54.com
From: =?UTF-8?q?=E8=B0=A2=E8=87=B4=E9=82=A6=20=28XIE=20Zhibang=29?= <Yeking@Red54.com>
To: krzk@kernel.org
Cc: Yeking@Red54.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	finley.xiao@rock-chips.com,
	heiko@sntech.de,
	kever.yang@rock-chips.com,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	robh@kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Add RK3562 serial aliases
Date: Mon, 30 Mar 2026 02:46:48 +0000
X-OQ-MSGID: <20260330024657.50845-1-Yeking@Red54.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <9b3ee9e9-d44d-49b1-81ac-9c3806dc0efb@kernel.org>
References: <9b3ee9e9-d44d-49b1-81ac-9c3806dc0efb@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sat, Mar 28, 2026 at 04:08:57PM +0100, Krzysztof Kozlowski wrote:
> On 28/03/2026 14:05, 谢致邦 (XIE Zhibang) wrote:
> > This fixes the stdout-path in rk3562-evb2-v10.dts.
> > 
> > Fixes: ceb6ef1ea900 ("arm64: dts: rockchip: Add RK3562 evb2 devicetree")
> > Signed-off-by: 谢致邦 (XIE Zhibang) <Yeking@Red54.com>
> > ---
> >  arch/arm64/boot/dts/rockchip/rk3562.dtsi | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3562.dtsi b/arch/arm64/boot/dts/rockchip/rk3562.dtsi
> > index e4816aa3dae0..14e74e8ac7df 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3562.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3562.dtsi
> > @@ -26,6 +26,16 @@ aliases {
> >  		gpio2 = &gpio2;
> >  		gpio3 = &gpio3;
> >  		gpio4 = &gpio4;
> > +		serial0 = &uart0;
> > +		serial1 = &uart1;
> > +		serial2 = &uart2;
> > +		serial3 = &uart3;
> > +		serial4 = &uart4;
> > +		serial5 = &uart5;
> > +		serial6 = &uart6;
> > +		serial7 = &uart7;
> > +		serial8 = &uart8;
> > +		serial9 = &uart9;
> 
> UART aliases are properties of the boards, not SoC.
> 
> Best regards,
> Krzysztof

So are you saying that we need to remove the serial aliases from files
like rk3308.dtsi, rk3328.dtsi, rk3368.dtsi, rk3399-base.dtsi,
rk356x-base.dtsi, rk3576.dtsi, rk3588-base.dtsi, and so on?

Kind regards,
XIE Zhibang

