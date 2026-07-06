Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291D6379C50;
	Mon,  6 Jul 2026 13:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783343906; cv=none; b=Ti+5TqD5k5Rm0RKbhdnnrJrvF+sZ2PWxrfmn3lZmlyaej5MSH90iJ67fpvhrsYTQbwJhIMw4oG77Jg/iIdDAWRgFYrBbyo3b7/Yw/BJOZvoqR0JqpSk6gvB5zFSyFvjwQkMpJgSdYOtOmtXUi1cNf4a+hSz8CDxpNeC7vQnpnAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783343906; c=relaxed/simple;
	bh=U0UUTPXYOIMUbfKiPj5WyHNGQxtCYRhMQN2tHOjGjGI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=PJSV32a800WzIpiSEfBfiOStdClmB/zYRl0/iq+zLAaZiWGDjjuu6gEy1blQcD9XSaCr3F8XQl0fKh6M+hSFRqGPFWQo24h4ocB8rh/N3hNX+TultoboiSKK9wnJUJrY9W2N00/957vxsxfV9AGC1WP5uUhCeXu9GGOi6OQkqws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=cSoSugdu; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="cSoSugdu"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 852B0C8EC7B;
	Mon,  6 Jul 2026 13:18:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 66252601A2;
	Mon,  6 Jul 2026 13:18:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C780C11BB817F;
	Mon,  6 Jul 2026 15:18:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783343901; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=U0UUTPXYOIMUbfKiPj5WyHNGQxtCYRhMQN2tHOjGjGI=;
	b=cSoSugduSkj26OSLyr0eg4z0X07uDcmEPgzzCoZ4G5miflrsmGdrvIOatE6BgNtt0iiJG6
	WzZpJnWsVmaHT/XKbJvTYwstnmDNVbAQIbbye7xFfNThHAc/4DCIe7/4VWXaHPv7mYD8LI
	8tvomJnUel812gpqO7ixkDOfIEjlPHZvFfr7+1u0OBmkL0DKLzqiAGDYNpUUuCR37CUEdl
	2u6zoFIvF6O6NOfT0AJvy41LYQ9MlvJdeK2JuT8wX+DWqzJDyM+w19IfLUxDqCBEpIDMTs
	vf7X/F247KGIweN/KPkCdGoAjLG/zvWHvtjsW72LkuiRzQrCA+4jXNzVPJhoOA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
  linux-mtd@lists.infradead.org,  linux-arm-msm@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,  Manivannan
 Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH 0/4] mtd: rawnand: qcom: Add MDM9607
In-Reply-To: <akult0UUSSwKQ8F5@linaro.org> (Stephan Gerhold's message of "Mon,
	6 Jul 2026 14:55:26 +0200")
References: <20260608-qcom-nandc-mdm9607-v1-0-4639a0492274@linaro.org>
	<4kdjxrn3bxg7rhkdovidxv2b2f6evnknng7gjtbz7pahyqaakh@qkgxaz6xlav2>
	<akult0UUSSwKQ8F5@linaro.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 06 Jul 2026 15:18:18 +0200
Message-ID: <875x2smf39.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi Stephan,

On 06/07/2026 at 14:55:26 +02, Stephan Gerhold <stephan.gerhold@linaro.org>=
 wrote:

> Hi Miqu=C3=A8l,
>
> On Mon, Jun 29, 2026 at 05:46:57PM +0200, Manivannan Sadhasivam wrote:
>> On Mon, Jun 08, 2026 at 03:20:21PM +0200, Stephan Gerhold wrote:
>> > MDM9607 has QPIC v1.5 that supports the OP_PAGE_READ_ONFI_READ command=
, but
>> > is missing the rest of the hardware changes in QPIC v2. There is also =
only
>> > a single clock that can be controlled using the RPM firmware. Document=
 and
>> > add the new qcom,mdm9607-nand compatible for this setup.
>> >=20
>> > Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
>>=20
>> You could ammend patch 1's commit message with the information I shared =
in the
>> reply. But nevertheless:
>>=20
>> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
>>=20
>
> Do you want me to resend the series with patch 1 commit message
> adjusted? There were no other changes requested as far as I can tell.

I was mostly waiting for answers on my questions from the DT binding
maintainers, but I understand they must be too loaded at the moment.

> I think the current commit message there is fine, especially if you add
> the Link: tag during applying. The extra context will be there.
>
> If you want me to resend, I would just replace the second paragraph in
> patch 1 with the following:
>
> ---
> On MDM9607 and other recent SoCs, the QPIC hardware requires 3 clocks
> (ahb, core, aon). However, the access to these clocks is restricted to
> the RPM firmware that controls the shared power resources for the whole
> SoC. The clocks cannot be controlled separately, there is only a single
> RPM_SMD_QPIC_CLK clock that implicitly enables all of the 3 clocks.
> The only exception to this are some IPQ* SoC that are not using RPM,
> there the clocks are directly controlled by the kernel via the clock
> controller (GCC). Require only one clock in the dt-bindings for MDM9607
> to avoid having to define dummy clock entries.

I am sorry but this is still incorrect. You don't have to define 2 dummy
clocks. You would have to define 3 times the same clock (and that's not
a problem). I have been working on the concept of clock nexus which
may solve this kind of issue in a rather elegant way but that's not
ready yet.

In my opinion the binding that you want to push (a single clock) is
wrong, but since I've been explaining this for several weeks already,
please at least fix the commit message and I will take it as you want.

Thanks,
Miqu=C3=A8l
