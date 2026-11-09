Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794212117;
	b=flokLPQhMGzEymPQRmyDdrB7/jXIIJ+M2kQwhRafRc6NAGNhh2nvvPPv+uPh5bx1yYDp
	 8iJbe2fiPjCNi6JvVDsRAVsaFKZR9TRWdEOGvqLYmhUrYtSX2m1PlzzW0SK0KtPsECuBo
	 BTM4QgEYPcUEK1x4oHLd1nbom+HvfoUDnN0UeP8RtVOwf6T9S+3y7/ErP87qa3sCPgrfe
	 TOGn0++JvzfoBvi6zs2TTptqofpf2/Mwo7tC8NWbEzHmqK6enNnKyqY1ectRylgXgeNpI
	 M5u5lLlHVD55tKebo47CP1vF5risy5wijXKzcQRek5+bIgVkEg9+ZPGCxdGkDnqUx4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794212117;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=07uI4iH0Yz4xA6oZfIs4D+JgaqpTLUd1F5xZol8yyfM=;
	b=xAuZddVRaH8edR6XFp51XahitF0TqoKlpx/lIw49PS5437V1JOs4kwc3PALccw88gaYP
	 UYU86lQdvZ3m5xfGStQruL+Zvr9E+3ezgWSo2oKS70xKlpfHcaG+gA69e4McLzRkpQsB1
	 lw2vbRzaDT9QI9rNC2jjHQK2tQnfvWgyCGu4hbuwcvQe42X8tfGX4or0G7lsEVBObUutP
	 GjRhwBNwHGesLimhNibvee6zu9IY8P/74qnPZpTMkZ54oB/uqeX+5l2NP6xQbPrFAZyMw
	 qobq53zFOhXBa31QfMovGfiP6eebaPNwv8htv+DvjemfJRo9h+6+3mnkpLMVzXexfbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W6Y6AlEf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A09606A31C
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 08:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W6Y6AlEf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC57A1F0089F;
	Mon,  9 Nov 2026 08:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794212117;
	bh=07uI4iH0Yz4xA6oZfIs4D+JgaqpTLUd1F5xZol8yyfM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W6Y6AlEfkQZFy7nEPUcqlCL9qj/Vi9SJ1s6RIuPmFGM768zSjhwk0XOLmcMpjQ4nA
	 YAUMUr8Fwq32x1PMJGBUWrjuNt1YRFS0/UI6bM6qJZQg8uWBtSn/nj326/uMeGwZPe
	 UsX0fKHhHQ1ySz51tYKEXxokaOxqqw6aFNvYgDOVFTSTZFz089cwbwBLbQmzMDkw5z
	 r19q+VqaDTIhDOSycVcBT/h7u1B0DG7+zAiq4PaRg53QY2m5uY9SWl2B6j98BObEFw
	 RwsNgy/Nizk8oofRHMq918meUk1GWidFsMBKkNtl3Uq6/WF9rRWBMSmmwOpXPEeUam
	 2RUM7iOJ1hHQw==
Message-ID: <sashiko-outbox-204576@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 2/7] thermal/drivers/loongson2: Fix clamp() usage for
 thermal trip points
Reply-To: sashiko-reviews@lists.linux.dev
To: "Binbin Zhou" <zhoubinbin@loongson.cn>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <7ae230bbff1143978c90f1566bfca6d17101929c.1794211535.git.zhoubinbin@loongson.cn>
References: <cover.1794211535.git.zhoubinbin@loongson.cn>
 <7ae230bbff1143978c90f1566bfca6d17101929c.1794211535.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 08:15:16 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] thermal/drivers/loongson2: incorrect Fixes tag in
  loongson2_thermal_set()
--

commit 7c662ff635bdb14cac997976404a99f9d5a1e734
Author: Binbin Zhou <zhoubinbin@loongson.cn>

> thermal/drivers/loongson2: Fix clamp() usage for thermal trip points
>
> clamp() takes the value to clamp as its first argument, followed by the
> minimum and maximum bounds. The current code passes the -40 and 125
> limits as the value instead, so the trip thresholds are not clamped to the
> supported sensor range.
>
> Correct the arguments so that low and high are clamped to [-40, 125].
>
> Cc: stable@vger.kernel.org
> Fixes: 734b5def91b5 ("thermal/drivers/loongson2: Add Loongson-2K2000 supp=
ort")
> Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>

[Severity: Low]
Should the Fixes tag reference e7e3a7c35791 ("thermal/drivers/loongson-2: A=
dd
thermal management support") instead?  Commit 734b5def91b5 ("thermal/driver=
s/loongson2:
Add Loongson-2K2000 support") did not modify loongson2_thermal_set(), where=
as
the inverted clamp() arguments were introduced in e7e3a7c35791 ("thermal/dr=
ivers/loongson-2:
Add thermal management support") and later moved into loongson2_set_ctrl_re=
gs()
calls in 6ef6d5ff5edd ("thermal/drivers/loongson2: Trivial code style
adjustment").

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1794211535.gi=
t.zhoubinbin@loongson.cn?part=3D2
