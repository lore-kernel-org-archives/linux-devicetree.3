Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794869749;
	b=JoA3e/dvSpYqnWO+uzOglVUtCidiPmBlSzYZ4FyOqphBejvI0JpRIQ+JsCe7FK0HhVet
	 kYd3ZsUxf1uaRMeTJS10fEnvaOP3d1honPHGlQR4JI6M2CeuCwc0KuGZeMYWEwdu9Nqt2
	 COMRpPZwMR6/W+u3/WgHChiEU6jMZH837AjYJTuP/+J7k/ZFLTO+02fTYIQJhBXdGt5X6
	 8LR06tdVq0duxfAsFGZ9F4mGFwWiCPPPCVYtIV6+gYrVDfUgQNbBC6c4TtPOosZvCJgpb
	 /Wy59pRzeBVJZFhq+/OBuFqW5WO8pDe24SytHyTd33vvZqXfTWb7s0uYD71urJXGuKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794869749;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=2cFXEzTLFLHVZsm2IQnE4l9oixZDTYOk5uX/pLu7wY8=;
	b=Mq9P+rDh6sVNI5O6bI4njS1dx9Qy0ryDPRAUfBL8yhkTtIQKf9NCsYuWeutaGxKLG4yf
	 RP21gsxQxxkMwZTrDTsDGskB7TcOZTUYj3BBE4h67V662xeRGzeVoccj3dKoSACXMzQk1
	 luF0RpYv99z7AW8vTR8v5lqd4KnTrDU7hMcdGSbO6M9BNDhkIfSgynnFnq9JAn5IPPCCP
	 e+CePO4c/1criWNhnGTKLFVm9so9EGM8M6MtD+wEsN9IR+b6A/kEx14GMqBaHcNWSmp3K
	 /ifDwtFiQ1GIMx8fBwh6IWfC3OHPdiX74QBwnMn0sPlArrJYzmkO0sxYYehXYUAwsQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iMxQlnXy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482B1606A331
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 22:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iMxQlnXy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D983E1F000C5;
	Mon, 16 Nov 2026 22:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794869749;
	bh=2cFXEzTLFLHVZsm2IQnE4l9oixZDTYOk5uX/pLu7wY8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iMxQlnXyOQ2EkfAhMkKULXTENqkelCdGE9x3EgJtSHre5OT3RID9kUbUa1rTkBwbP
	 EM7v+hZ3cQgF+j+78gfO22ogabNJyaozWi0NQdkqeY4Rphnv1GjCrKXDXRvf74Yw8y
	 DSZjuVX0fz0Psjci4ol6vGk5ILZqQsvcWMO1p7bcc70XBYBhyDcacAZzzNLVLAZUmX
	 6akbMoFhJJOcYDLLY1R3l0vJG4qzpc3b5U1k7di5pCZrQrz9//IfTL7KojMQpZg0Ep
	 UouOfTa27NyKMs3LPIjyNBwqHaKfBDp0B8HGW6wykjZB+P/qNrFAU0R8s0ouPcfnEv
	 JRYv+rpCYBjtw==
Message-ID: <sashiko-outbox-217823@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 02/12] arm64: dts: qcom: sm6350-lena: rename
 touch-en-regulator
Reply-To: sashiko-reviews@lists.linux.dev
To: erebion <erebion@erebion.eu>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261116-pdx213-upstream-3-v5-2-7318a19806eb@erebion.eu>
References: <20261116-pdx213-upstream-3-v5-0-7318a19806eb@erebion.eu>
 <20261116-pdx213-upstream-3-v5-2-7318a19806eb@erebion.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 22:55:48 +0000
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
- [High] arm64: dts: qcom: single-word handle used in Signed-off-by
  trailer
--

commit 32e61d61a3221dfc85f81717ef77d401f268134b
Author: erebion <erebion@erebion.eu>

> arm64: dts: qcom: sm6350-lena: rename touch-en-regulator
>
> rename touch-en-regulator -> regulator-touch-en, to
> keep any future fixed-regulator sorted together
>
> Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>
> Signed-off-by: erebion <erebion@erebion.eu>

[Severity: High]
Could the Author header and Signed-off-by trailer be updated to use a full
real human name instead of the single-word handle "erebion"?  Per
Documentation/process/submitting-patches.rst, the Developer's Certificate
of Origin requires a known real name and does not permit pseudonyms or
handles.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-pdx213-ups=
tream-3-v5-0-7318a19806eb@erebion.eu?part=3D2
