Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A483ECBC3
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 12:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780663943; cv=none; b=Z2xXeLD96+3wOYMuSDNvpNsPaAgJ+uQ0RIOyh3ahkY0w37ZOfC8mM+rEePzvZyNLHX07rF9JB8aosM/1CHOBd98iYacSMDquFO9VVpTFhT5EQjPrwcQzivdqTiHoyz64uaRrwSqraLWzq5wJLue2/1HPWqgQZUCgV/amOxZD+68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780663943; c=relaxed/simple;
	bh=Us+yG3m2+QHmSga3tniY07Eashl/QzlKEg/ECZRt1e8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Du1c+0WPxDXBySrctCtU1z604cVuKbmAkbaXxFwxrIS96VYy+/nUs/8EjxfRL6H7BDRdmzxro6U4wXT+x4fOaqhrF82RYJ5kZShhIbvI/+8ppSml0btJqJO8NdxH6cPNgbBNVHjvPb9YYFnhnUnAkOzX2lyTUPP6WhMkzyxe1sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OhHLCJ31; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ur/hfIs6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OhHLCJ31";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ur/hfIs6"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 655753pw3529003
	for <devicetree@vger.kernel.org>; Fri, 5 Jun 2026 12:52:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aXXPMAxCCNVKnzaiOEhcmEjF/NB0kuT+OfqrX4xSO5M=; b=OhHLCJ317ujs8Vuf
	XHzv6gpokiN/RLYmVCzSlcJ7Vvb8/99t+c9QBBcBLNdYkHJ1BR+Pqo6P1m22pgGe
	RFmxVfP7gQjJWJu2rw2j+0MmOAZ2eq3U8fyckemiTqozfcsY+g/KY3FGvkbao0zM
	xB2I1fqmgNmFQ/wNsx+7aoVCK0SHcKA6Aot0g9rtVo3buN8xECLSD9r/4SNvPJFx
	msQAt4XW9+YmXj9mF4++bvWTZEGEsrvZD4m8x5t2W8C46ckxFJCGAHWJ8wv9xzy5
	y7+oqabmr6UaBWNtTwaCtgy6eoCiix2VXVKeme5BBhusfq3jG7z6IdD9JcYkFeRu
	fENSVg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eksrp99mc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 12:52:22 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c10cd7df22so15269865ad.2
        for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 05:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780663941; x=1781268741; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aXXPMAxCCNVKnzaiOEhcmEjF/NB0kuT+OfqrX4xSO5M=;
        b=Ur/hfIs6gp045G0MyWJjkqs0oA9WJ8JSmIKV/ClTH3QseKI2b5IOYURu76y2ZvMx6r
         t0GINdST/hxTbStwcgPsxPVsrZh27EDdKpNax/nABKKjwvraHfqRzlFo8HVZGqOkykoX
         ZUFbH7A+N2LtB5BxTeykd/9JfD8T1LOIacrCm/pvSQ17YeMqTd/orlrlNEWxgWOB0Au1
         WHHGUxeOwzLBIcsFmbzHUzV69jJ/J8ELLg8EJnSM5CWpoi7vFZQNgWdrgRTBdDzL/9vq
         U8E1kIdGQZ7k+WBbW1fucvH2wnT3Q0a1n1JWn5vh1bBo3++83V+V2iVaj7CcqjgB+RHP
         K1ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780663941; x=1781268741;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aXXPMAxCCNVKnzaiOEhcmEjF/NB0kuT+OfqrX4xSO5M=;
        b=X+9x/LLeW8xGPREw32XkxWTlHqPjwfXQhVCpvx1UtMG6T/eF64VwNKpXnjbRPNXlmw
         qXLPElDpSrY+sWkw04y3zS7z9oAaIarm5NxTBPWFsYbPvnttTLFlAVXQlCZuXp6QTm8t
         MEBQfad72mvJK7LXdUvPOsAezgPFPIiRYHfhP2GHnNI+qQHp9CizNsViT8HcsKjsTBes
         gOPIi1zMYmNvZPfuW9pm1zYpx4zGuvT0koWUOasBm+PeynvL4AQY7olsYdtrtI6Q9P+t
         OgooB/VPC8epuSMlt+Z54P/rRiQSZtJJVy0NQ0ILY/8HB52jKE/0uqJ8jUGll2GkMLZu
         sPgw==
X-Forwarded-Encrypted: i=1; AFNElJ9Mgq0S9m8vn+SgL1TOvWiWj+/0GiRYs7jpvTtgn2SxZWpkspn/cQWcZZtq2KhEhqyKAIKXjzs3l0yM@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl1BrzVbIhXCw9Vc1XIYzlkl036rQM44MRK48Pgr4z0436obAB
	h5VBqZtcwin42GUV6ey+TNEvYPIgxPp460MLf72cMhCWfIk2XPaGClAUJS1+EqWnSb6KGGQhw1E
	+B0RqahWM6AYexRdbhX5b53XC7wIlBgvSqwdmjefMV4UqaRjvjM1JDUlNiZSlYLE/1KSWW+Yw
X-Gm-Gg: Acq92OEOJ79M1we7lmI53U+uG3Et5ZxqEwtaj9qYt+28xWELxud7fPVFmjhp6vZ5BAa
	1VIMtrYIM+RoGWQZfYuIjRM6s2kE4bNSXWqshy6uBvH1e/FGacjfeTWsttOImxqHn8LXmwnGe1M
	9eTG+i6/TxDhmjSIuoWSQOu8Jv90jVyKLYMTBdCiC8rL+bH5WSi/yZQ/uBv0hiCj+9d01SuOcgV
	z2UL2LomU6NsYWnRuy6/lfUi2BO0EoRVRWFPwa2Z2y9liwR4PApsxRPxmNaSQVkQJAEI5wEO4TP
	Vzefx869Gq2urRabOh3ykSqdrih89fqFpJ0CoVt8hlsIcPpu0MaWk8SnF9BT/KzaWvAm58wTDu0
	mjYn6uEhFU5Nms7RB9QHMfwg+cbTeIp+KMD5+bBW5PFD9x8HIIMjN5dplPFpbQdzYUUXuu19HtR
	0cR6NweLDPhX4qlRGDpvrD/zyajLbJtQLBXliVpKevSgN883u+U0U=
X-Received: by 2002:a17:903:15c7:b0:2bf:dd0:c8b1 with SMTP id d9443c01a7336-2c1e78acf24mr38497265ad.0.1780663941401;
        Fri, 05 Jun 2026 05:52:21 -0700 (PDT)
X-Received: by 2002:a17:903:15c7:b0:2bf:dd0:c8b1 with SMTP id d9443c01a7336-2c1e78acf24mr38496835ad.0.1780663940969;
        Fri, 05 Jun 2026 05:52:20 -0700 (PDT)
Received: from [10.190.200.113] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d389sm90760015ad.16.2026.06.05.05.52.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2026 05:52:20 -0700 (PDT)
Message-ID: <ec3c29ec-872a-4a01-bb92-7573a625211a@oss.qualcomm.com>
Date: Fri, 5 Jun 2026 18:22:14 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Fix gcc clock specifier for
 usb_mp_qmpphy nodes
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260602-glymur-fix-usb-mp-qmpphy-clock-specifier-v1-1-19c6f44d5655@oss.qualcomm.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <20260602-glymur-fix-usb-mp-qmpphy-clock-specifier-v1-1-19c6f44d5655@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xhATihBU9AZVvKjZSGY6fMHD2fAz8UKw
X-Proofpoint-ORIG-GUID: xhATihBU9AZVvKjZSGY6fMHD2fAz8UKw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDEyNiBTYWx0ZWRfX+fITX319n1DS
 RmLgbaOAdOQxsks4CiKwtDHS94cTX7pssA0n+sB9WJ5yEvhymzKUiOx+i2TZ8t9t4CveSsiuCEW
 UbMt+i9gA6ngNE24HaaVtJofyh/4/13HXDRscZjfXB59EyTFdDvI9IPPJjo/VfkQHYHD+3W8pYd
 qAewN0AyidGxBz4WMaC4pm7W9OmhYobyitk0xRA94BI10PIEN68NfVI//5LMYoMMyNQSTaBUybL
 kFriyMiqqTH8KNhbQupnJNRb9NWP7AwGnjx/GERy+sRXNwgjVjURCCOqGKR9mUUmfNkZYiz1/q1
 ngS5lpK21mVHd0FZ93uFuqOkp3aUGVpiWyE62aV8iNn5IiFOE5kkVFaGAAok/9lNAMS7lfs1/qe
 fzMVWc7RZTxOf7ih9zKPGPoPl6Ygviy9fSBCNLe/bDZMNkrwgJHQZogpmAWZAamcWRwtLHHLfOH
 Eo1j5A/02u2ICLY/wvg==
X-Authority-Analysis: v=2.4 cv=bJEm5v+Z c=1 sm=1 tr=0 ts=6a22c686 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=04xiu5HVr_82CDOhBRwA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050126

On 6/2/2026 10:21 PM, Gopikrishna Garmidi wrote:
> usb_mp_qmpphy0 and usb_mp_qmpphy1 have #clock-cells set to 0 so they take
> no specifier. Drop the erroneous QMP_USB43DP_USB3_PIPE_CLK argument.
> 
> This fixes the following dtbs_check warning:
> clock-controller@100000 (qcom,glymur-gcc): clocks: [[59, 0], ..... [0]]
> is too long
> from schema $id: http://devicetree.org/schemas/clock/qcom,glymur-gcc.yaml
> 
> Fixes: 4eee57dd4df9f ("arm64: dts: qcom: glymur: Add USB related nodes")
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index 20b49af7298e..fd503e10e409 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -786,8 +786,8 @@ gcc: clock-controller@100000 {
>  				 <&usb_0_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
>  				 <&usb_1_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
>  				 <&usb_2_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
> -				 <&usb_mp_qmpphy0 QMP_USB43DP_USB3_PIPE_CLK>,
> -				 <&usb_mp_qmpphy1 QMP_USB43DP_USB3_PIPE_CLK>,
> +				 <&usb_mp_qmpphy0>,		/* USB3 UNI PHY pipe 0 */
> +				 <&usb_mp_qmpphy1>,		/* USB3 UNI PHY pipe 1 */
>  				 <0>,				/* USB4 PHY 0 pcie pipe */
>  				 <0>,				/* USB4 PHY 0 Max pipe */
>  				 <0>,				/* USB4 PHY 1 pcie pipe */
> 
> ---
> base-commit: 08484c504b55a98bd100527fbe10a3caf55ff3ff
> change-id: 20260602-glymur-fix-usb-mp-qmpphy-clock-specifier-6d5e671f173e
> 
> Best regards,

Reviewed-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>

