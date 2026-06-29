Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061E23783AE
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 15:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782745614; cv=none; b=gC+Kh9cJ9pd7WuzDXVozUXEhuK8PruIjNurrEdijI2mTnXdQRGm4egExGdjfBtDK3zLqt5+WXDAAVJNSYP17gVp5M8avBb1Pi6yZYcrPuL8mcpLueXUszKoDK/Xk0kJ886VDc6qd7S2D27yeH+gO2w5s5P52B3DjN3FrbOD5vt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782745614; c=relaxed/simple;
	bh=BONHax0KPGvnYh/wOipV0VMGtz4EIszzeU5Nj5QrZKk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=mgTYy5WaSVxdBCVHSMXPfl1uKf85grtRzYTLrLhiMnklm4wh4T34iezmR8td7rtkRf/HzwcYTJoEtgXUk4lU7SI+DZfbhXfRjVdY0B37AsMGr7rx5AL+szWuF+scHJ20oxdQNsy4VJ9Dzz0LSyttshG/lrGYbV2nfOzMSrFthiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=PDHsfQX8; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="PDHsfQX8"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B36D51A0D01;
	Mon, 29 Jun 2026 15:06:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 854325FF96;
	Mon, 29 Jun 2026 15:06:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 561EC106F18BF;
	Mon, 29 Jun 2026 17:06:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782745608; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BONHax0KPGvnYh/wOipV0VMGtz4EIszzeU5Nj5QrZKk=;
	b=PDHsfQX8vE5Gkq/pWrLB4bkNUh8x6PgT3QnB23IU5i7pjORNCFKRKuWdrR9mSiBpE8xqNf
	3Vwv1M5wr/pfypZMB/pWA3EmDYfhhGeIV9hWBJQiaVxFC/I4wBpnJww2o0z8xL2vHcIU8N
	Hb9VPsY+FnNayGPaEkwHZH0W+54eVBbD0Z0A8Yxe0A8s0F6YeIaeSGp71GiaFHw9s6Xm9y
	1QuTgFH8U7zLx73V3vZiBqu++GH8mMqLiLZwzupY+ZDQMx1m3QDymc6ysKHO1hTigZPWtS
	SLUVw4xyFsap3weTpBrM8RL7kDWPb/IPuftw0GCBsBjZx5OEvjipX7Zzvok0zw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,  Manivannan Sadhasivam
 <manivannan.sadhasivam@oss.qualcomm.com>,  Kathiravan Thirumoorthy
 <quic_kathirav@quicinc.com>,  Krzysztof Kozlowski <krzk@kernel.org>,
  Manivannan Sadhasivam <mani@kernel.org>,  Richard Weinberger
 <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  linux-mtd@lists.infradead.org,
  linux-arm-msm@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: mtd: qcom,nandc: Add MDM9607 QPIC NAND
 controller
In-Reply-To: <3ab3ccfc-1fdc-4176-b073-1f31e2c88c6a@oss.qualcomm.com> (Konrad
	Dybcio's message of "Wed, 17 Jun 2026 13:42:44 +0200")
References: <20260608-qcom-nandc-mdm9607-v1-0-4639a0492274@linaro.org>
	<20260608-qcom-nandc-mdm9607-v1-1-4639a0492274@linaro.org>
	<20260609-quirky-rat-of-criticism-aea1fe@quoll>
	<87mrx4b164.fsf@bootlin.com> <aifKejyF7n6QsI9h@linaro.org>
	<a6b17b9a-f639-4a7f-adb6-d0c9dbd31e68@oss.qualcomm.com>
	<35c7513b-6aea-48cf-aea8-da8604616601@oss.qualcomm.com>
	<aifX80IHM8TLQiV7@linaro.org> <87o6hk9i29.fsf@bootlin.com>
	<aifktn_s2qmg7MzI@linaro.org>
	<3ab3ccfc-1fdc-4176-b073-1f31e2c88c6a@oss.qualcomm.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 29 Jun 2026 17:06:44 +0200
Message-ID: <87v7b1s7wb.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hello,

On 17/06/2026 at 13:42:44 +02, Konrad Dybcio <konrad.dybcio@oss.qualcomm.co=
m> wrote:

(keeping the context for Krzysztof)

> On 6/9/26 12:02 PM, Stephan Gerhold wrote:
>> On Tue, Jun 09, 2026 at 11:30:54AM +0200, Miquel Raynal wrote:
>>> On 09/06/2026 at 11:08:03 +02, Stephan Gerhold <stephan.gerhold@linaro.=
org> wrote:
>>>
>>>> On Tue, Jun 09, 2026 at 11:01:18AM +0200, Konrad Dybcio wrote:
>>>>> On 6/9/26 10:55 AM, Konrad Dybcio wrote:
>>>>>> On 6/9/26 10:10 AM, Stephan Gerhold wrote:
>>>>>>> On Tue, Jun 09, 2026 at 09:52:51AM +0200, Miquel Raynal wrote:
>>>>>>>>>> On MDM9607, there is only a single controllable clock for the NA=
ND
>>>>>>>>>> controller (RPM_SMD_QPIC_CLK). The same situation also applies e=
.g. for
>>>>>>>>>> qcom,sdx55-nand, but the corresponding device tree (qcom-sdx55.d=
tsi) works
>>>>>>>>>> around that by assigning a dummy clock (&nand_clk_dummy) to the =
second
>>>>>>>>>> clock ("aon") that is required by the dt-bindings. This is not r=
eally
>>>>>>>>>> useful, so avoid doing that for new platforms by excluding the s=
econd "aon"
>>>>>>>>>> clock entry in the dt-bindings.
>>>>>>>>>
>>>>>>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcom=
m.com>
>>>>>>>>
>>>>>>>> What is the problem in giving twice the same clock? If this is wha=
t is
>>>>>>>> done in the hardware routing, I do not see the reason for more
>>>>>>>> complexity in the binding?
>>>>>>>>
>>>>>>>
>>>>>>> I had that in my first draft for this series, but this would be wro=
ng
>>>>>>> IMO. I suspect there is no QPIC/NAND related "aon" (always-on) cloc=
k on
>>>>>>> this platform at all. I'm not sure about MDM9607 in particular (may=
be
>>>>>>> someone from Qualcomm can confirm), but a similar platform I was lo=
oking
>>>>>>> into at some point actually had *3* separate clocks for QPIC in the
>>>>>>> hardware and none of them were called "aon" ...
>>>>>>
>>>>>> gcc_qpic_ahb_clk (50/100/133.(3) MHz sourced from PCNoC_bfdcd_clk_sr=
c)
>>>>>> gcc_qpic_clk (likewise, sourced from qpic_clk_src which is sourced
>>>>>> from GPLLs)
>>>>>> gcc_qpic_system_clk (32 KHz)
>>>>>>
>>>>>> No clock containing the substring 'aon' in its name on this platform
>>>>>
>>>>> Looking at SDX65, perhaps the 32 Khz clock is the "aon" one after all=
..
>>>>> The NAND documentation says
>>>>>
>>>>> CC_QPIC_SYSTEM_CLK - Always-on timeout clock (32 KHz)
>>>>>
>>>>
>>>> Thanks for looking this up.
>>>>
>>>> IMO, if we want to describe the actual hardware routing, we should
>>>> describe all 3 clocks and assign all of them to RPM_SMD_QPIC_CLK for
>>>> MDM9607).
>>>
>>> Sounds more accurate to me.
>>>
>>>> The resulting diff would be basically the same as this patch just
>>>> inversed (3 clocks for MDM9607+SDX(?) and 2 clocks for the IPQ* SoCs.
>>>
>>> Diff would not be simpler but more accurate. So if we go for a
>>> modification of the bindings, I would prefer that path.
>>>
>>=20
>> IMO the result wouldn't be much more accurate from the perspective of
>> the kernel. If we assign RPM_SMD_QPIC_CLK to all 3 clocks we would be
>> effectively saying "there is a single clock with a single rate that is
>> sourcing 'core', 'ahb' and 'system'(/'aon')". But in reality, these are
>> 3 separate clock domains with separate rates, as shown by Konrad above.
>>=20
>> We could try defining dummy clocks like the &nand_clk_dummy in
>> qcom-sdx55.dtsi, but this isn't very accurate either. Presumably, all of
>> these clocks are toggled by RPM_SMD_QPIC_CLK. So if we define a dummy
>> clock for 'ahb', then enabling that clock without also enabling the
>> non-dummy 'core' (RPM_SMD_QPIC_CLK) will do nothing.
>
> I can't find a good answer for what RPM_SMD_QPIC_CLK controls, maybe
> +Mani or +Kathiravan know where to look
>
> Konrad
>
>>=20
>> At the end, the truth for the OS/kernel running on this hardware is that
>> it can only see the 'core' clock (with the option to change its rate).
>> All others are invisible, with no way to influence or check the status,
>> so pretending that we have separate resources for them doesn't really
>> make things more accurate in my opinion.
>>=20
>> But yeah, let's leave the decision up to Krzysztof. I'm happy to change
>> this patch as needed as long it works at the end. :-)

Sorry to bother you Krzysztof. Based on the previous discussion, would
you mind giving an updated point of view? If you don't have time, no
problem, I can take the series as-is.

Thanks a lot,
Miqu=C3=A8l
