Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C7935201E;
	Wed,  1 Jul 2026 10:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782901199; cv=none; b=WEq+ZP7YXs5Rb28WqkZJfAIKtg7r9Od9hLMeMsyQx+PFjXjiUGxHqGyOMcsk3kE7f+uPlWxRqJUHT1/7HdWATWFAsIbKpOqA9fXQXgaUdOvogTN6GQ0v+k+L68hqnrUjYc/8Ysh3qBfEx0+bQ0HFhHgMPu7HsJJYWbFv7UI6Vvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782901199; c=relaxed/simple;
	bh=bJIMDg0Kd+BDoCeT4ZU4jOzaRBF26Uz2kFNxhVhTi4E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f6qDSyNWUfBpZRfkeqrAmiqlhqseBx1uyllRfIuG1F2bLBZzdYuTLQ7HRJKPQc8aFG3qown5dRLUNlLNIt7P4+lgPbm2rcGzKUMCEYuTDX6p20tZ1VmyMHZ6+65/8JlRvQIkNTBtxCj/sScX2RSkeh/dd2hMCtOS9zaRMbwN8Nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lkl6wSgd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lkl6wSgd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 430961F000E9;
	Wed,  1 Jul 2026 10:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782901198;
	bh=j6JpGr+0SJkNkvrfPYReM7F3wImBGE4w74H4osrBM+g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=lkl6wSgd1VDf0DzDDhebfpb2rkl+SEWrJRo/CrGSQruDHMUabKLbntUp6V+1AXLUm
	 HWUy6+rO2vp7vne1p2Kuh5ywK2Lat2q1EMW4dYeiaKgN5XK+/WfZK3gRNoTl/qU5xa
	 TIkrlJF4orUNiV1cUps8gxaZQI7vHhtPGN5QeTiWXjyLvf8G9HMA84DD5kS0LgxsQQ
	 7MqiwnqjECqxxvA+mAAorXHlIUZzs3p5NXfbNatWkZ7LywWxpYA4BmebBkb9RH9+GU
	 7F2VD87KAm9P37wPAvG7XcRKY8rNZKUiFJ8Y+VCQ1N5ILj2bUCJ5yq/YC6agmzWfZ6
	 TlNMqtjNFeupQ==
Message-ID: <ff8721fc-bb6f-4cef-a667-2e08d597dc43@kernel.org>
Date: Wed, 1 Jul 2026 12:19:52 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add base HAMOA-IOT-COME board
To: yuanjiey <yuanjie.yang@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 tingwei.zhang@oss.qualcomm.com
References: <20260630071022.3256-1-yuanjie.yang@oss.qualcomm.com>
 <20260630071022.3256-3-yuanjie.yang@oss.qualcomm.com>
 <20260701-uptight-piquant-raccoon-abceb4@quoll>
 <akTU-YQkms64qivB@YUANJIEY2.ap.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <akTU-YQkms64qivB@YUANJIEY2.ap.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/07/2026 10:51, yuanjiey wrote:
> On Wed, Jul 01, 2026 at 09:29:34AM +0200, Krzysztof Kozlowski wrote:
>> On Tue, Jun 30, 2026 at 03:10:12PM +0800, Yuanjie Yang wrote:
>>> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>>>  .../boot/dts/qcom/hamoa-iot-come-sip.dtsi     |   9 ++
>>>  .../boot/dts/qcom/hamoa-iot-come-som.dtsi     |  38 ++++++
>>>  arch/arm64/boot/dts/qcom/hamoa-iot-come.dts   | 108 ++++++++++++++++++
>>>  4 files changed, 156 insertions(+)
>>>  create mode 100644 arch/arm64/boot/dts/qcom/hamoa-iot-come-sip.dtsi
>>>  create mode 100644 arch/arm64/boot/dts/qcom/hamoa-iot-come-som.dtsi
>>>  create mode 100644 arch/arm64/boot/dts/qcom/hamoa-iot-come.dts
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>>> index 6f33c4e2f09c..549287e3eeba 100644
>>> --- a/arch/arm64/boot/dts/qcom/Makefile
>>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>>> @@ -16,6 +16,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8096sg-db820c.dtb
>>>  dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
>>>  dtb-$(CONFIG_ARCH_QCOM)	+= eliza-mtp.dtb
>>>  dtb-$(CONFIG_ARCH_QCOM)	+= glymur-crd.dtb
>>> +dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-come.dtb
>>>  dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk.dtb
>>>  
>>>  hamoa-iot-evk-el2-dtbs	:= hamoa-iot-evk.dtb x1-el2.dtbo
>>> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-come-sip.dtsi b/arch/arm64/boot/dts/qcom/hamoa-iot-come-sip.dtsi
>>> new file mode 100644
>>> index 000000000000..935af96c2b85
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-come-sip.dtsi
>>
>> What is the point of this file?
> 
> This SiP hardware is effectively the same as the SoM on the Hamoa EVK.
> It's just called differently on a different board. I want to use this
> file to include hamoa-iot-som.dtsi header to show this idea.

You do not need empty file for such purpose.

Best regards,
Krzysztof
