Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794825499;
	b=d3SLFwjJbx4sFMGWpAEj4Wqe/IRNdsedTlhPrsJbgANUzeZCPhnjy8qH4yuVl7B84uA+
	 vALbAKCEuYVKaO9W98w9FxyVqE8qCYLzt7k7djkeqXrQ/0/eMlDP62C7hwuCo8+ry565K
	 sZauWUuUot94MMgkZlvs2b2WsAPbY95QsXh6LYPeq6aSJpx8fd/R4Rlob939etY/COZ4E
	 rGfY2TqRftbDFhMHZFolDOszBaCoycEE+V/CGIgJMyY5xrW45GEqYCMkdI3gzIYas6/1p
	 QPH6nJmjBW5EAhhtkzBQW2jWj6R2Uvro43+wZQeuCHGNcFi/2hCBw5Jv0tbZOwF5gcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794825499;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=WxkiKQHJ5NbsJuzjwynQls+2+1CD8ddKlOpaqZEHrOk=;
	b=gEpnkNOgmW77NtOZQl47HZGqzJH+zPUIdRTushScC4wH3+x6jJMN07+GnACWq6QRy2CE
	 UySf+hWT4B2vjI8zeWCOqegc1OglPXZZU0DzOx7DUwGjnARRUHcZpBwOlp1XmN+F3dooy
	 5OTOh8+7pMuaKc/FRstWB3tXz+Z1A7SXQs4Olm/vvE1luHTGOk97cE+udxBTNB98dhl19
	 p5l8uDwFwSyjf9o2twh+cyTMLDOWUCHxM+9uUcjqyRApDDDgs1VEJId6ttBBmOfv1mfP4
	 BsuS44ZRTwQAfvV09sB1WIHMMUHE3bNxdkbw4DPCjjAz082TVvCqP9ICvBb3ExNXkkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dYdG+rUt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96003606A323
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 10:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dYdG+rUt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E22FE1F000C4;
	Mon, 16 Nov 2026 10:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794825499;
	bh=WxkiKQHJ5NbsJuzjwynQls+2+1CD8ddKlOpaqZEHrOk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dYdG+rUtwtSxRmFdwBC2FJ+NxUV9eH5bSmfMh9r11Yy2Wnxw5py0HbiX5kzHh71kS
	 o1TfO7SlALVGayE62ywXGKgvXf++SLYwbAsTIRdvG9ooB+t5BvqG3WJA0F4rQl8DRD
	 qbuoEGqcFLUsiAIlfkeV2CPAiHtUoW52wEEfvfLIb+sUFNowHSWxkbwlq1CBNbisKE
	 cHQLfHu3MeRzCWRZ6LSTIDpLbpjkJsvGljBlOSRMJZ1G0A+Fd/08XLUS/QC0KvFFjg
	 NtlM3+uj28FVCmlWncIqNS0yhN+IdkaS1rBJO9vLT75uIuef94T90U1yZ8SaL0qUy6
	 pXj7I+raJEHEw==
Message-ID: <sashiko-outbox-216748@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: st: add delay on imx335 reset gpio on
 stm32mp235f-dk
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alain Volmat" <alain.volmat@foss.st.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261116-stm32mp-imx335-fix-v1-3-01f538260f00@foss.st.com>
References: <20261116-stm32mp-imx335-fix-v1-0-01f538260f00@foss.st.com>
 <20261116-stm32mp-imx335-fix-v1-3-01f538260f00@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 10:38:18 +0000
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
- [Low] arm64: dts: st: missing Fixes trailer for stm32mp235f-dk imx335
  reset fix
--

commit e39cf6eb1245597509df9656ea0556ed7e9c75ba
Author: Alain Volmat <alain.volmat@foss.st.com>

> arm64: dts: st: add delay on imx335 reset gpio on stm32mp235f-dk
>
> The imx335 reset gpio is connected to the sensor reset via an RC hence
> a delay is needed in order to take into account the time needed to
> reach the level for which the sensor sees the correct level.
> This prevent having imx335 power-on issues due to the fact that the
> driver is trying to access to the sensor while the reset hasn't been
> yet properly handled.
>
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>

[Severity: Low]
Since this fixes imx335 camera sensor power-on failures on stm32mp235f-dk,
should the commit message include:

  Fixes: ed9056f9a042 ("arm64: dts: st: add imx335/csi/dcmipp nodes on stm3=
2mp235f-dk")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-stm32mp-im=
x335-fix-v1-0-01f538260f00@foss.st.com?part=3D3
