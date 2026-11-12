Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794502244;
	b=iS1GpMEXgYo9e4eoFJYp6hLD1nltS62kYahnIgViH1SrUYmYIJ4+O+kchQhy49gDz5lC
	 Xlx0dZD5HTpNLoHxE66eS9iOllDmhkaZ/1czaADBVZo5OxrRabCPEMDsqn9CpvH971q08
	 4Uy3qsw3IJCkkN7LjLJYiutRms0FGaCGVGbBrAvx7yOMIy2SJSZUWFMbAvi9pG5TFj9CS
	 G4rWHdIb0hfmZSIMDnOSeIjCf9WVTD23fHBqT519WCvl4pFDygIuRGU0ZogHfwl57A4p0
	 OgQc3uz5BH2W6MPSigGdjkbHkPgrBYHxITZhfgXE1gwLd7ifyIrO7jjq0ThAyxArGuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794502244;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=HGqrSHL7OQhTkybA147XVm/N5Q045cDL3CHSGKRoIzU=;
	b=d2JRvJNdoNEUW5GdZ7eVTTTLpsS8m7/IlwXUsx65UNjSc8bHOFgdb2rCHXu7Sz29nU5N
	 agbvo7SHXWZJhVRtK9hcu1jUR4CQHqUgbAM9tFO9Au01QF6BBkAeKka08cxpECFSwFcI7
	 2kf+ulmfN29jGDlxPgo0KWeXksBQLaZZVUjU6mN+D4vCMQdmuQ2ujLsUbQsYEsZ0ooa6Y
	 5pM82KmjqUtWKuFGkRDBZ6WbZiXJ1wzfbFJklgvinA4p0f89spm3UexR8UzARcyEwQjIK
	 qCcAXt+akhG7xljrBoLhCt5UcEhVCkhCsjakMRzShDoKnwKoHrunwL6fulwxD39B3rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n0lby8yN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95E3606A32D
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 16:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n0lby8yN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38CE21F000C4;
	Thu, 12 Nov 2026 16:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794502244;
	bh=HGqrSHL7OQhTkybA147XVm/N5Q045cDL3CHSGKRoIzU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=n0lby8yN6PbqZHuJPJr74B+Q0RO5Y9sMwskvD1SbWIvkxpZY/loar9Lv5xtfhfP8a
	 rZ2yJjzs/WJRzwrkTIR1inSx9g3Uqg76uvoRxAaRLfQJpw16cnusPHUMsyYg/YIl8D
	 jPLi09002KEWPAg8e/YTd3fLguAlHY6fUKMmXI8gK+cvbgidOrTWfGAufJU5fOsAij
	 beiy2HqnbUoSN/FtEV7+yl1dXennW1tO4vYVMaCRbUdSQwzopLTF5I+8GYvAn79UaX
	 xpBJtP14/yzR8fefULzLn9GtH1e+Ef6B8eRYqjHO660NtpprvDeAeTeCEpq+MBoN5q
	 ZGQUtA/52uPfg==
Message-ID: <sashiko-outbox-211537@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: Disable PCIe ASPM
 L1ss
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sushrut Shree Trivedi" <sushrut.trivedi@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261112-rb3gen2_disable_l1ss-v1-1-aeefbf366595@oss.qualcomm.com>
References: <20261112-rb3gen2_disable_l1ss-v1-1-aeefbf366595@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 16:50:43 +0000
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
- [Low] arm64: dts: qcom: qcs6490-rb3gen2: missing Fixes trailer for
  TC9563 L1ss fix
--

commit 9d5417f567397369628afe2e5d17be0a24757085
Author: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>

> arm64: dts: qcom: qcs6490-rb3gen2: Disable PCIe ASPM L1ss
>
> On the QCS6490 RB3gen2 platform, there is no mechanism for the
> PCIe endpoints connected to TC9563 switch to assert #CLKREQ and
> initiate a L1ss exit on the upstream link between the PCIe1 RC and
> TC9563 upstream port. Hence, once the upstream link enters L1ss
> and the Renesas uPD720201 endpoint connected to the switch downstream
> port tries to initiate an L1 exit, a link down is seen. This is
> expected because the upstream link is still in L1ss and PCIe refclk
> is cut-off.
>
> To avoid this issue, disable ASPM L1ss on the upstream link of TC9563
> switch to keep the PCIe refclk always on.
>
> Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>

[Severity: Low]
Since this fixes a PCIe link-down failure on the TC9563 switch upstream por=
t,
should the commit message include a Fixes tag?

  Fixes: aa7b4bbcb3a1 ("arm64: dts: qcom: qcs6490-rb3gen2: Add TC9563 PCIe =
switch node")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112-rb3gen2_di=
sable_l1ss-v1-1-aeefbf366595@oss.qualcomm.com?part=3D1
