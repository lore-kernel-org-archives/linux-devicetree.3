Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584694854F6
	for <devicetree@vger.kernel.org>; Sat,  5 Sep 2026 11:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788606036; cv=none; b=mG+Pwv6crRvgL38xMMEk1/MyeK04MiQb53xzY1V+II+DD7wBJxDhmO+Rg2DelzDKeeAG+vkT1Yx4Jjdthc5CtvyrpIyUENBneE5WKlr02UfBbnBbZjjSyxFTc9KkAeJQp3/LZToXFnHuZt7N6aeyPdTgXRGcBGiUmKAX8ffG6h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788606036; c=relaxed/simple;
	bh=FURAT1JGHLGpZcx/dCsf46KlQtuSykeO5xA3pIekbEI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XqYmkxARy/0HwvFO3YLuPlc2aXgKNrW+Tz/oyFht9tGWtz4feaK/2VPJOC114x0xIva3aZCYnp4FkUVZcqel8b0UXMdWnIGpXZ12Gs9uKBIqST/g57+ZXg4YlVLlP1pG3KLMCJRfjIHAA9qrZc10iCmMzhfMCgcZiSYvh5/4X+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=JoDHtyXT; arc=none smtp.client-ip=212.227.126.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="JoDHtyXT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1788606032; x=1789210832;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=arIaNXDw17FhzBN3sfpYfx0owHPFunTxf476/t+MRiI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=JoDHtyXTW1ZxFy65iYbtLQ1+Zgj8TT1JqE0gCYfDADjjUQbPdPsERheurJQG4hNl
	 FfcRceUBN54Sav0LT4oe9nDWL07K45bfUJmNg5ptcNsNcIbgA9OcVjZcmN/Ookbp1
	 3sVN4Eexzxjq0/7LxAwU/fl6J2xMeD7JTJ4CAbiSTwrancdYV20FxCfqItxSb8SNI
	 nGEiYQ66ZAYVt3XEe1RQ6reZbIwSW8CcxqKn1o7aIQ9k/A3yGQXy8L/6AVQ84Uirr
	 PRO50iPeGfjxbbs9UbqPPydaFaNpOwcUik0npiOAN4li0kuKsA0GvLX6G7SPhsxUi
	 YI/As6NAUSwlMljMng==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from client.hidden.invalid by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MCbVD-1xAk0q1EjD-001FCP; Sat, 05
 Sep 2026 12:46:39 +0200
Message-ID: <8631fd93-36d0-418b-bad7-fdb8919c791a@oldschoolsolutions.biz>
Date: Sat, 5 Sep 2026 12:46:38 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] arm64: dts: qcom: Add Purwa IdeaCentre Mini 01Q8X10
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
References: <20260905-x1-ideacentre-mini-prettify-v1-0-9a87882973bb@oldschoolsolutions.biz>
 <20260905-x1-ideacentre-mini-prettify-v1-3-9a87882973bb@oldschoolsolutions.biz>
 <20260905094245.0320B1F00A3D@smtp.kernel.org>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <20260905094245.0320B1F00A3D@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:cWKpyw05iz+U2E1ZIG5b0mfUKPEE0WZf7VEyWKEgVTe2WTOLsLA
 dVEppAFXTGmmHdMnn74LvoqMdT2Fe+9kitBsAUe2HnLOQaAqH3IqP8UpfNCZHMJI8T2hdOD
 4alENmSQUi18qpr77/nAnUaTl5DslpPi9SvcOkqHZMn6AJI8nTOtVLySYAx1rtvt8RH/4qB
 cWW+5FEASBpoXOfKcHnnQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:9vLZJlKANGE=;7isUYOdERCft4ThLvYJ1BDOosJJ
 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
 Jq7Z0

Hi Sashiko-bot,

On 05.09.26 11:42, sashiko-bot@kernel.org wrote:
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qc=
om/Makefile
>> index 6c2ac11133ca7..e6105e5790954 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -167,7 +167,8 @@ dtb-$(CONFIG_ARCH_QCOM)	+=3D msm8998-sony-xperia-yo=
shino-poplar.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+=3D msm8998-xiaomi-sagit.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+=3D purwa-iot-evk.dtb
>>  =20
>> -purwa-iot-evk-el2-dtbs	:=3D purwa-iot-evk.dtb x1-el2.dtbo
>> +purwa-lenovo-ideacentre-mini-01q8x10-el2-dtbs :=3D purwa-lenovo-ideace=
ntre-mini-01q8x10.dtb x1-el2.dtbo
> [Severity: Low]
> Does this unintentionally remove the composite rule for the existing
> purwa-iot-evk-el2 board?
>
> Kbuild will fail with a 'No rule to make target' error when building bec=
ause
> dtb-$(CONFIG_ARCH_QCOM) +=3D purwa-iot-evk-el2.dtb remains slightly furt=
her down
> in this Makefile, but its underlying composite dtbs definition has been
> overwritten here instead of being preserved.
>
Oops, that was not intended. Will be fixed in v2.

with best regards,

Jens

