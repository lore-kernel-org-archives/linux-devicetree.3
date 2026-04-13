Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBE63AC0C6
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 08:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776070540; cv=none; b=gzvRQ9G5o6m2g2wKUK7OC4EIMvmakbXhQ35x+RowYvQKQWl+qmORTHQX16zMo/X5Y/wxxQzKL6anM+LnuttR5iSAzvp0w7HAWcD+9JvKttz6K0yymPtAhWDcdhNNklgjC+bu4WGCC1S8yUItNCsIzeWezCXL5pK/3EiPplzjxDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776070540; c=relaxed/simple;
	bh=D2aNysoazoEf6/3/6uVC+sJTR09Ue84s0LX25WaCQV4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=IKEfzL1i8Wg8l8vvSSxzXddpUwDoHkzdTDeZOJktaqZgj338TUDSIfSlNr2BhcKinIZZvCiuqyf7k57JlJeUkYmhAj8/J0XLVFDxkfK19Yu1s3/aFDYy1ljFbsh57YFweyYGFSOKy8W112LIzEwCpuXbpXnPj/b12hom4Cf1oQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=3ySkQgwO; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="3ySkQgwO"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b980785a0bfso540776166b.3
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 01:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1776070537; x=1776675337; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GgkijLDEm/ABnCWLRgQ2UF0+RYV7WyoElCsuBhyBG+M=;
        b=3ySkQgwO1yZUTJN7Uh7h1KMS56P9ifn7KdETGkcTLiVChB2Qw2TlNtKN/coIoE6lPc
         IF6nGIAudHvXq8oUM/UmKHvXVSjz+5i1Ihx6WGEkB6GUJ3cl5QroEePEKdsxu+OTUtzo
         yoG64nlnabwKyAE42zkWSB2AAyLoyzcVFjTzKuZtUPVEkVOTcUEYtSpvPh6LQtsB4C0e
         5o3KzNNYwHa5OsEcvcRcGgtQrgfd1igyjGe19BDr32MhNwFgZqWDuk5q6ANuoDgZsUBP
         V91hNWC7ZBenk5R5Y+YlxKLpQ7lBFXox5XwkNA855o6XO2f1+1z0MNp/eVRSW/b+Bwmq
         gsPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776070537; x=1776675337;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GgkijLDEm/ABnCWLRgQ2UF0+RYV7WyoElCsuBhyBG+M=;
        b=WHEdAuyjRgavcf417UAo8SvzwejBmiqOrjlpNjL8ITIn8yeDw5IR8QDlqpp+h/f33w
         US39ehhZo2f7R7UE4ftphnoSDoHhp4U/j/gKG4JG9pkOnqd72VBrjqrOcQRyof9k55ST
         y5E8Oke596HI+Bjz7eBWYg9aZAZS6B48658hG3c8RtLKHaKY4itY3U+ERXpa9HSwJTBX
         Th8y56yPr8DMBfe2FlODQniGVvV1+XE7safY48VN00gnWuCiP80Ni6elKwUBWslhYWsx
         2lon1zomxlDEvJsmANUFCliSotsvyB+Cskci4/wOcM9nvM/dA3KjwQ1HtlnAnOY7+es9
         Bo4g==
X-Forwarded-Encrypted: i=1; AJvYcCVfAd+2NRER73E4kbi2ZwarnTo7H/HZ5D+8gusZpISNvwgG7Y/WSQLn7am68AMPHd5vQLtHpCkCcm8x@vger.kernel.org
X-Gm-Message-State: AOJu0YzrruWe6rV0EMj3+EnSUzc5hO8TVgkZaOz8b3C3hIVDlLCqQcfj
	4oMOvrQgjpoStGnza4bLN8iNyC/RswG1Dqm07112dU5GiW3kMgjihpUvjIzX6DxQFcg=
X-Gm-Gg: AeBDiev/xJ7kYsgMtMV8Ts7Clg1+prPqIGeYTJTzWz0fnDhfix4vuZomGjJbLt4LPxo
	K3gAGypDPOisQEPOKYruPvLzyUcHLrHrRGfTcy7MzvQKBa8PrX2wGCCPeV4p1HaqrmvupQohRhJ
	gUBkZTzZohKHpJ3W2C6RL5TBc4FpI6Oie69jYVP9TJw0WMdLmOXNpAUQn50rFq7t2E3WvBvXW79
	Ii8uIuyCN1/tRvPvd7gUlTdgqZ+KjcO/szM4bErVfsBvv/WLcRzFeWqOFSLr/Jd0ZD3wVNm1kNU
	e8PCUFH2B/8UBcdnc3cep1Jp1IXIkhUqCwlkS0TQvDOGhF3cuuqZUqVNmE9A1T/+fMNOjiZg7a8
	h2I/ys3/+OzMkz+dW9fSy1IpfRL/qPVDv8qiahTo7KC/cDfa6ea1bpFh66aEAGBuIXr6cQQzYqV
	4vtL5zlIuP5VpqUD0/W9VF8I6tZqhuK6twvAwWCISHx+xkuv5gB3qBIxXZ57j0hh4kSw1J
X-Received: by 2002:a17:906:5991:b0:b9d:33ce:e85b with SMTP id a640c23a62f3a-b9d7277bf23mr526436266b.43.1776070536883;
        Mon, 13 Apr 2026 01:55:36 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e7f1a3bsm283831866b.62.2026.04.13.01.55.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 01:55:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Apr 2026 10:55:35 +0200
Message-Id: <DHRWGKASOFM8.15ZNMEOJJK9F5@fairphone.com>
Cc: "Bjorn Andersson" <andersson@kernel.org>, "Linus Walleij"
 <linusw@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, <~postmarketos/upstreaming@lists.sr.ht>,
 <phone-devel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/5] arm64: dts: qcom: sm6350: add LPASS LPI pin
 controller
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260128-sm6350-lpi-tlmm-v1-0-36583f2a2a2a@fairphone.com>
 <20260128-sm6350-lpi-tlmm-v1-4-36583f2a2a2a@fairphone.com>
 <d3upp33rbn66ioxpc65n7uqwz32kxghzue2n3dkd5k4lch3iwg@qgcppndlte5a>
 <DG0XMT4TZKCH.HPXGS9YTG9FA@fairphone.com>
 <91812db8-9774-468e-8a8b-10699a63310c@oss.qualcomm.com>
In-Reply-To: <91812db8-9774-468e-8a8b-10699a63310c@oss.qualcomm.com>

Hi Konrad,

On Thu Jan 29, 2026 at 12:19 PM CET, Konrad Dybcio wrote:
> On 1/29/26 9:32 AM, Luca Weiss wrote:
>> On Wed Jan 28, 2026 at 11:16 PM CET, Dmitry Baryshkov wrote:
>>> On Wed, Jan 28, 2026 at 01:26:52PM +0100, Luca Weiss wrote:
>>>> Add LPASS LPI pinctrl node required for audio functionality on SM6350.
>>>>
>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/sm6350.dtsi | 66 +++++++++++++++++++++++++++=
+++++++++
>>>>  1 file changed, 66 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dt=
s/qcom/sm6350.dtsi
>>>> index 9f9b9f9af0da..b1fb6c812da7 100644
>>>> --- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
>>>> @@ -1448,6 +1448,72 @@ compute-cb@5 {
>>>>  			};
>>>>  		};
>>>> =20
>>>> +		lpass_tlmm: pinctrl@33c0000 {
>>>> +			compatible =3D "qcom,sm6350-lpass-lpi-pinctrl";
>>>> +			reg =3D <0x0 0x033c0000 0x0 0x20000>,
>>>> +			      <0x0 0x03550000 0x0 0x10000>;
>>>> +			gpio-controller;
>>>> +			#gpio-cells =3D <2>;
>>>> +			gpio-ranges =3D <&lpass_tlmm 0 0 15>;
>>>> +
>>>> +			clocks =3D <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPL=
E_NO>,
>>>> +				 <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
>>>> +			clock-names =3D "core",
>>>> +				      "audio";
>>>> +
>>>> +			i2s1_active: i2s1-active-state {
>>>> +				clk-pins {
>>>> +					pins =3D "gpio6";
>>>> +					function =3D "i2s1_clk";
>>>> +					drive-strength =3D <8>;
>>>> +					bias-disable;
>>>> +					output-high;
>>>
>>> This looks suspicious for the clock pin.
>>>
>>>> +				};
>>>> +
>>>> +				ws-pins {
>>>> +					pins =3D "gpio7";
>>>> +					function =3D "i2s1_ws";
>>>> +					drive-strength =3D <8>;
>>>> +					bias-disable;
>>>> +					output-high;
>>>
>>> The same
>>>
>>>> +				};
>>>> +
>>>> +				data-pins {
>>>> +					pins =3D "gpio8", "gpio9";
>>>> +					function =3D "i2s1_data";
>>>> +					drive-strength =3D <8>;
>>>> +					bias-disable;
>>>> +					output-high;
>>>
>>> And here.
>>=20
>> I've taken this pinctrl from downstream lagoon-lpi.dtsi. There the
>> active config for these pins have "output-high;" set.
>>=20
>> And fwiw this pinctrl works fine at runtime for driving the speaker.
>
> I tried to find an answer.
>
> A doc for this SoC says that i2s clock pins should be at output-low
> (2 mA) when muxed to the i2s_xxx function, with no information about
> bias settings (perhaps bias-disable), and in sleep they should be the
> same (minus the drive strength note, but 2mA is the lowest setting)
>
> I am further confused because the output-enable bit in the cfg
> register specifically says "when in GPIO mode"

Thanks for checking.

What should we do here now? Follow what you found in the docs, or follow
what downstream is doing (8ma output-high)?

https://gerrit-public.fairphone.software/plugins/gitiles/kernel/msm-extra/d=
evicetree/+/refs/heads/int/15/fp4/qcom/lagoon-lpi.dtsi#219

I think apart from this question, this patchset should be ready to land.

Regards
Luca

p.s. I also briefly checked Google's repositories (which is the only
known place to have a commit history with devicetree since the
devicetree was just shipped with vendor/qcom/proprietary for everybody
else, without history) but there there's also no hint whether there's
any specific reason they deviate.
https://android.googlesource.com/kernel/msm-extra/devicetree/+log/refs/tags=
/android-11.0.0_r0.56/qcom/lagoon-lpi.dtsi
