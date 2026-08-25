Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2753FF8BA;
	Tue, 25 Aug 2026 13:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787664803; cv=none; b=P1OTfEkcQkaCEGeMEvQOy/fo1m7d0t4qDNO141b+tfVWPLxkrXtYxSLNq49iaVQQlT9uIHXCbhA6t6DYTPp2/H+REw88/3l3Zcf7MODkEHnqc0IhdsFBO92CtlQmmVSABX8R+0sRxBuSh9UMSsYUHv2Vn+V0cS/AO2+UjwVW6aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787664803; c=relaxed/simple;
	bh=+L0JA2jMxxLyOH5M5GrcRTJFcK6dZdET6rCdjpWY+hY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PEeI+sXULYYSD/K4f0FcPypsv+JVCTq3WdxJm38zTpaxwbEDiYhkp3xGDszfGFBTWjtk/Cet7vADNyq1lOMefHE1+bfBWfOXMsBU2PwumQmXcZxTrQ/gtiRcRbG1p4CqUo1aaO24JtgY6/r9VE+FYjjhGF5rPBnDxzyPVnwYEvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MFAb6+P2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MFAb6+P2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCB761F000E9;
	Tue, 25 Aug 2026 13:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787664801;
	bh=BW+MznbbmPkoRpEl9gc4mWqmQCAlxK0ZIDQx8WkrhXs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=MFAb6+P2Es7yaFEaCiw66E5uyCstF7/oQALaPnA/2w5vez20Cnh3+hF8S/nwH/pfG
	 SRIxtoVyPPi9Lf1YJztP6gPGaObuDm/XusuMeRhGTTuFzQw+6KenG5HkoOiK4zSYVW
	 dTBkIjVeW2hFA8wZ1M9AmJ9V2cP8Kp/J/D7G0WCRS+S1MchcreRAn4LuNSzoZUjlj7
	 Wq4HTEOpzKv8HM1qFE75hmb/xBInam7ic9J23zorE8K9OPa+74zjO/8wyR+Rdtl/Gn
	 pjbr6sV2axn28Dbtus3k9uDkZlB2hcfQ3dN7GCddrEfqBWXk1JAJtbIFRfenQRFEHb
	 88DHI1K0eiXoQ==
Message-ID: <c4bf7a4b-48a9-4bfb-b133-858189627639@kernel.org>
Date: Tue, 25 Aug 2026 15:33:14 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Enable dTPM on EVK boards
To: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260820-shikra_dtpm-v1-1-40d96b8238bb@oss.qualcomm.com>
 <b9b07abb-b9be-478f-8e4a-204d8ce0586d@oss.qualcomm.com>
 <e4058fd8-23e8-4031-906d-7ff4ec525508@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <e4058fd8-23e8-4031-906d-7ff4ec525508@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/08/2026 12:06, Khalid Faisal Ansari wrote:
> 
> On 8/20/2026 2:52 PM, Konrad Dybcio wrote:
>> On 8/20/26 11:16 AM, Khalid Faisal Ansari wrote:
>>> The Shikra EVK boards (CQM, CQS, IQS) carry an ST33 discrete TPM
>>> connected via SPI5. Enable the SPI controller and add the TPM node
>>> with the ST33HTPM compatible and a 20 MHz max clock.
>>>
>>> Depends-on:https://lore.kernel.org/all/20260820085347.822-1-xueyao.an@oss.qualcomm.com/
>> This is not a valid tag to put in the commit message
>>
>> Why haven't you sent the two clearly interdependent patches together?
> 
> I referenced the SPI5 enabling patch because the TPM node addition 
> depends on that change being present. I had followed a similar approach 
> used in an earlier submission 
> (https://lore.kernel.org/all/0afa55d5-20bf-487b-abe0-4e2126ccf453@oss.qualcomm.com/), 
> where the dependency was mentioned in the commit message.
> 
> Since the two changes originate from different internal ownership areas 
> but are functionally interdependent, we have been handling them as 
> separate submissions while documenting the dependency between them.

You have been already told TWICE and you keep arguing.

> 
>>> Signed-off-by: Khalid Faisal Ansari<khalid.ansari@oss.qualcomm.com>
>>> ---
>>> The Shikra EVK boards (CQM, CQS, IQS) have an ST33 discrete TPM (dTPM)
>>> connected over SPI5. Enable the SPI controller and add the TPM node for
>>> all three board variants.
>>>
>>> This series depends on the SPI5 node addition in shikra-evk.dtsi:
>>>    https://lore.kernel.org/all/20260820085347.822-1-xueyao.an@oss.qualcomm.com/
>>> ---
>>>   arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 10 ++++++++++
>>>   arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 10 ++++++++++
>>>   arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 10 ++++++++++
>> Turn this into a single addition to shikra-evk.dtsi
> 
> I intentionally kept the changes in the individual board DTS files 
> rather than placing them in shikra-evk.dtsi. While the current EVK 
> variants (CQM, CQS, and IQS) all carry the ST33 dTPM, a future board 
> could potentially reuse shikra-evk.dtsi without supporting the TPM 
> hardware. Keeping the node in the board-specific DTS files makes the 
> hardware dependency explicit and avoids enabling TPM on boards where it 
> may not be present.

Do not paste us LLM answers, I find it disrespectful in regard to my time.

Which future board could reuse shikra-evk.dtsi? This the DTSI FOR THIS
EVK. Not some future boards.

Best regards,
Krzysztof
