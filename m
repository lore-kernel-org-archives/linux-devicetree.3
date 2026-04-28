Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD1E3FBEA5;
	Tue, 28 Apr 2026 12:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777377981; cv=none; b=IcjPuAUyjYP47tltkXoxlAYcajUy51N7pZ1b0YOFY6srVHqVE6a5L8mwAIXDuhSJW2lLo5oE3VZhg534fIeM1QAw9nxltgXnV2Wg790A8a4kPoyzNNph0PLVJB80v29NKkJ0Nz+DBE076mPF0R+OjmIjdoVAW+yH8MHDNjNTTVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777377981; c=relaxed/simple;
	bh=Ty6pkHPECYGSIL61EzGpZYowpNk2Yv9E/2t+CrdLnhw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ogDPrhk8nM5X+WWfx25Blz74xLFf5T1XasLkApW4nAaXvYlww2ssjIDbFNwL3P5qLUotX4fn1X3l6YUCNYjWcsQ+VaYotKMKCA2apxNGdpqy2e5ZMOBFYJ/6eQ95Fq2gUWt5TurV2CUU832Vzjv8AERGUDEOIIXVINKqBfiX+Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=n2V8omZ9; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="n2V8omZ9"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1D7344E42B5A;
	Tue, 28 Apr 2026 12:06:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E05CB601D0;
	Tue, 28 Apr 2026 12:06:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1A17010728A74;
	Tue, 28 Apr 2026 14:06:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777377967; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=ZoKCQPMpn1EFup8AbJftFkjPKom5Zewqy8Mv2L6J014=;
	b=n2V8omZ92scNhPAKpj0/uW5WZ1Awm6eV+h3dnrauNGiNyf3Tf9wiz5CMYHngOA+hZclq/f
	+mTK5KGsGiZhxHzvbbR7PSAohzWqYonwAceTwrmpqU4Y69bjeY/I3w8+zpRKWORV3z8jKe
	jogCkZ0Y9dy0Owx8EMzAhLCVh8c2J85//a0/SAsJUqM/4OlpoiHXagYORYyopapNsEWZl5
	el6FNkcgv+7Rs5zQXVAuAsBl8wVrvG4p6ekS9u7Lx5W8u+NxjgUSTT+oWXLtyw8//S+f/+
	RpXknn3CcddiCQEDApz3UBqC+BZ2nhuwlxkofzIz8858D1Ngg5zaOcT+2jLykA==
Message-ID: <3a78ff9c-e70e-47c2-b356-2bf9d75bc372@bootlin.com>
Date: Tue, 28 Apr 2026 14:06:02 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-j721s2-som-p0: add bootph-pre-ram
 property to pmic@4c
To: "Kumar, Udit" <u-kumar1@ti.com>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, gregory.clement@bootlin.com,
 richard.genoud@bootlin.com, a-kumar2@ti.com
References: <20260428-k3-j721s2-som-bootph-pre-ram-pmic-4c-v1-1-e8202ce955a0@bootlin.com>
 <6aa8fd45-ec3d-4bd7-9b13-6c00e4fd4efc@ti.com>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <6aa8fd45-ec3d-4bd7-9b13-6c00e4fd4efc@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 4/28/26 12:15 PM, Kumar, Udit wrote:
> 
> 
> On 4/28/2026 2:23 PM, Thomas Richard (TI) wrote:
>> On j721s2, pmic@4c is needed to exit the DDR from retention after
> 
> pmic@4c to PMIC-A to align with schematic, please

You mean PMIC-B.

Best Regards,
Thomas
