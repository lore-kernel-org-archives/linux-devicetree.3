Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7828D334C0D;
	Tue,  9 Jun 2026 09:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780997465; cv=none; b=L7nOXT7XwTvhhl4xoU0ojtsByGhR/Mm973EmLWDYqwD7qMp2ZSkrBiMrg2OdhaS+ii+ohDC9dmBkdxhLA1yrM/j5u8Q115XuHsAbk6wpByD2g2cTZuUMjXopd8sf/tR1gQOsncxJh9RQ2vBonZ7LVDUFITuGtBLCsYrrw7Hhjd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780997465; c=relaxed/simple;
	bh=A43LRr2R11CwZdLErI94QN/M8VqgGQQ2IlVMHrVdW1A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Twso+TlAPAhqcHHXXg7O9w7MIL+dwAsj9E9FGdsxA2d+Fa9KYf4aPQnaT4uZAIq88owVMMNTvBOCrJ2QsTKW8aA0/Ngw8/Dc1V5+VwhyYycBADcw0sp7/I6kdnY7Wr9SORJuxm6+zY3ck5+L1danmyFrajkkdXwhP5auU9uev6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=TwGjK3VQ; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="TwGjK3VQ"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DB69B4E40914;
	Tue,  9 Jun 2026 09:31:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A6B915FFC1;
	Tue,  9 Jun 2026 09:31:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 18050106A2ADD;
	Tue,  9 Jun 2026 11:30:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780997460; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=A43LRr2R11CwZdLErI94QN/M8VqgGQQ2IlVMHrVdW1A=;
	b=TwGjK3VQXZ0F051JJq335p58AiVP0bVk7T/ENCeBJ3AwmFGNwLWolrA7je2kqWY8xHQifn
	uqTQOZQtu5skzrad7x9z6vVtpQoApFuPgth+vRHU1LBmFF2EMmo1V9EwKh1zW7Az9NvnHq
	qgFMh9kcQfU7T3jIQN03Xkvwrw5rY53SeH2aPHnkEsKgNp5MJJBMZjL2/uyqI/QAPdT3Eg
	81IBx3dbHZUXlmvUXQalzfYccNxytue4z0f8gfY5y2avAyPbts6Mv3wYIcWUJEX/wtwvqS
	av1oEHOBV41A1kYHKsCSzroRDiSMBzC5yKfd9VFJrh2a6zO1rN2hFyDoKC0/jw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,  Krzysztof Kozlowski
 <krzk@kernel.org>,  Manivannan Sadhasivam <mani@kernel.org>,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,  Rob
 Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>,  linux-mtd@lists.infradead.org,
  linux-arm-msm@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: mtd: qcom,nandc: Add MDM9607 QPIC NAND
 controller
In-Reply-To: <aifX80IHM8TLQiV7@linaro.org> (Stephan Gerhold's message of "Tue,
	9 Jun 2026 11:08:03 +0200")
References: <20260608-qcom-nandc-mdm9607-v1-0-4639a0492274@linaro.org>
	<20260608-qcom-nandc-mdm9607-v1-1-4639a0492274@linaro.org>
	<20260609-quirky-rat-of-criticism-aea1fe@quoll>
	<87mrx4b164.fsf@bootlin.com> <aifKejyF7n6QsI9h@linaro.org>
	<a6b17b9a-f639-4a7f-adb6-d0c9dbd31e68@oss.qualcomm.com>
	<35c7513b-6aea-48cf-aea8-da8604616601@oss.qualcomm.com>
	<aifX80IHM8TLQiV7@linaro.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Tue, 09 Jun 2026 11:30:54 +0200
Message-ID: <87o6hk9i29.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On 09/06/2026 at 11:08:03 +02, Stephan Gerhold <stephan.gerhold@linaro.org>=
 wrote:

> On Tue, Jun 09, 2026 at 11:01:18AM +0200, Konrad Dybcio wrote:
>> On 6/9/26 10:55 AM, Konrad Dybcio wrote:
>> > On 6/9/26 10:10 AM, Stephan Gerhold wrote:
>> >> On Tue, Jun 09, 2026 at 09:52:51AM +0200, Miquel Raynal wrote:
>> >>>>> On MDM9607, there is only a single controllable clock for the NAND
>> >>>>> controller (RPM_SMD_QPIC_CLK). The same situation also applies e.g=
. for
>> >>>>> qcom,sdx55-nand, but the corresponding device tree (qcom-sdx55.dts=
i) works
>> >>>>> around that by assigning a dummy clock (&nand_clk_dummy) to the se=
cond
>> >>>>> clock ("aon") that is required by the dt-bindings. This is not rea=
lly
>> >>>>> useful, so avoid doing that for new platforms by excluding the sec=
ond "aon"
>> >>>>> clock entry in the dt-bindings.
>> >>>>
>> >>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.=
com>
>> >>>
>> >>> What is the problem in giving twice the same clock? If this is what =
is
>> >>> done in the hardware routing, I do not see the reason for more
>> >>> complexity in the binding?
>> >>>
>> >>
>> >> I had that in my first draft for this series, but this would be wrong
>> >> IMO. I suspect there is no QPIC/NAND related "aon" (always-on) clock =
on
>> >> this platform at all. I'm not sure about MDM9607 in particular (maybe
>> >> someone from Qualcomm can confirm), but a similar platform I was look=
ing
>> >> into at some point actually had *3* separate clocks for QPIC in the
>> >> hardware and none of them were called "aon" ...
>> >=20
>> > gcc_qpic_ahb_clk (50/100/133.(3) MHz sourced from PCNoC_bfdcd_clk_src)
>> > gcc_qpic_clk (likewise, sourced from qpic_clk_src which is sourced
>> > from GPLLs)
>> > gcc_qpic_system_clk (32 KHz)
>> >=20
>> > No clock containing the substring 'aon' in its name on this platform
>>=20
>> Looking at SDX65, perhaps the 32 Khz clock is the "aon" one after all..
>> The NAND documentation says
>>=20
>> CC_QPIC_SYSTEM_CLK - Always-on timeout clock (32 KHz)
>>=20
>
> Thanks for looking this up.
>
> IMO, if we want to describe the actual hardware routing, we should
> describe all 3 clocks and assign all of them to RPM_SMD_QPIC_CLK for
> MDM9607).

Sounds more accurate to me.

> The resulting diff would be basically the same as this patch just
> inversed (3 clocks for MDM9607+SDX(?) and 2 clocks for the IPQ* SoCs.

Diff would not be simpler but more accurate. So if we go for a
modification of the bindings, I would prefer that path.

> The complexity of the binding would be the same, so is it worth
> reworking this patch? At the end, there is just one clock we can toggle
> through the firmware here and I doubt anyone uses this SoC without the
> RPM firmware.

This is not really about how we use it, even though an integration
specific compatible is probably allowed to simplify the inputs. So now
that I raised that point, I'll let the final decision to Krzyztof who
knows better the Qcomm ecosystem than me.

Cheers,
Miqu=C3=A8l
