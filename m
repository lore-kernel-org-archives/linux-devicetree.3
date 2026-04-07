Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5BE39FCAF
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 11:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775559937; cv=none; b=DhPk44LwfJrqj1oj+40DXNX3ob0SB8dmYqKRR0dmZLHPA/OFMTwRmZtfAqK73l05Kuzt1LHkj6dv9+K1QSMb3OgXCWb3ZViU+yw/eHXTueSwPATuLDoZQsihEQmzReCyU3tvRAparEoAh/4tEQyc/Qw5VmvPRTjLFII/AJh+rNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775559937; c=relaxed/simple;
	bh=wYs7LP+CwpZSSYTwk1QrHLFlXIo8bKJgPk2jFbQEx8U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VCOc/b741n3wfG27YTx58RQYU9B7vZbSpFl3iMRmrbtQu09J/ohOxePZmqRBVASg/qYseIvnlvJaAI6okuxgOCLIH2K7akeAkDCt45lsQCL0XWupsC98RciOdC7UhTNrVF2G0WeZPbtqfDYM3Ftayq/ku/2Y8NtGkCf+5TsiDeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hYpa0Kme; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JcoCiZ3h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hYpa0Kme";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JcoCiZ3h"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376d0NU3815666
	for <devicetree@vger.kernel.org>; Tue, 7 Apr 2026 11:05:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GZb7XG487cufxCiXWgItkS+Okdf5TRVRTd9LbQnWjN0=; b=hYpa0KmecTcolIKY
	BplPypP86ey/BtPWkqnytqbfrO/0kMYhsr07qv9flGOXIDF0IIMyYExfnA38ZbB6
	McxZDHahPNYyomVbXreDlds5yUcckB0YmhPPfptuiW8sEfP8LYx4RscPlve88h1T
	G7yfm1Ux57XjJXLX0DqwwBLRbEBvktaoWjALp2xni0R1oV4Tq7vcu+prQrBRL2tU
	MgdwnGoqtPrjkiJF/SKlcawguPvIFLrJ4Nl7J2BNVmH24AzVZpIHPIKYOyx3BwSi
	L2OGxAkTNgNjpuktliJuYv8fmGC6H0VwB0AEkkjuBlysgRZjHIssje5puJB4y1xB
	iG7cyA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr4te99-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 11:05:35 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d9f1bccd7so1829061cf.1
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 04:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775559934; x=1776164734; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GZb7XG487cufxCiXWgItkS+Okdf5TRVRTd9LbQnWjN0=;
        b=JcoCiZ3hDmEPoTB782VmljFdDofZf6RuPBfWIEIsG06ZpkBruI/xKouT7w5HtiP5ns
         P/070xuzPtMMrszLJUCyNvuUIzlrNergA2/NP1AvTHk0BPF9/go3AxYMHyezuas/G7e0
         PetleHLU5cQhx6PKXotQVBbDxwvOSXmx0NTEeTZ4pSzFhOt+ROBiOyLU1tRdctHPXs1j
         Stam2ruA+pUe9jDIHhQ+iFlW/roED1BCYD1Qo4/8/2n/em6IqT5TXXI0s4ZYH9fwAEJh
         Hz2cfNArxUzdA2OVbTB5ipJ4rLQ5Y3mDUWiq1ikoRCELy7D3GnHwS/kL7E77520cZhp4
         WW6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775559934; x=1776164734;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GZb7XG487cufxCiXWgItkS+Okdf5TRVRTd9LbQnWjN0=;
        b=kNxaVPmOYA9XbZAEJXmzc9C2xacXiQngyiH71DS6lqEDS2U3YTmCm2No+ajXNpuJlX
         QrpjyR5LTLgSKjMlLrAI/Ab5BK7AJPVXxxcHcGtYTpEe0TO2+kk8BIiw9KeTBL9VBBxp
         pxqNpOGXK3haT89QWv/SMJjo6c3WSeN74gbPgqpA6fPBCU4XH3P4ApdVxK2g5T9B1yE2
         cQZAWlZxQZ6Xso+gvCBm0TzI/Qx6+Al4pvMV8kVk/x3GMMoJ3qH3yVZNlI3ZLCXy77wo
         6dSMMMbO/pRmWsJZogHAX+qOTBEMT8/9biRx05/IOAdO24EGtT+B5ldjLqVVWM+m8BWI
         oozg==
X-Forwarded-Encrypted: i=1; AJvYcCWz4p9Vr8eobq1kzO7CG3i5EQTy6XisN5UHu2ExbYkpaaN/MlG2a8p8WD0fjhBUAFxnOSZEpTUfPrH2@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3V/5W8g+fHYSpNjqqH6YqvSfvpOu5i0DYsZkvru5AW9TIWibs
	wiYaxyo4sSyP1iuDUs2FGC1mGGlGWy05HgsYWwYblnxwYh2QjgOpm7va+zdpfU9sXntIHkpdESc
	dLdPxHlFQJmq2ChnXnZ4nWA1zO8uiMQE3zsaKjQYNOM8hA4tzeSvathwD7BsE057G
X-Gm-Gg: AeBDieu5u9sO0UN9PxcPutQPwU34l+Lx/2XBuN0Es7bdJHCmFyIFQMb29RGOTNDu6Yq
	plzi741ClC4T6/0IkeIJEDeBQD8hg5f1GrmO+uA8GRhHu47vqVimIWXG7q/0fPwYFCnJZWW12/m
	Rd5MPCPuAUxLjRTtktIRL+8JhrrYvnQ7RSX0YqRoIePuLGDgjkm4hsbTWmV+R23bF7x5WRLvkDY
	gdpV0ktYgqpgZ4hFITcwKcD0La0fsZQXB4vxRVsxSXA1U5KA7kWg42EfD8tKBcmK7GY6l1pqF+u
	ReIvC8RUlGI/wOTnAvUx04UbX+rRddoVL7pY+HymTHWqZoJfN8eDmM8WJkC+4zi0mhB2+qbni65
	p9bBuMFyX8aJxpDEVNWFjlV3eD0YNvkznEEdqt4ZU1MvQ9mJRDpwCDCyQrDlc2Rfh1ByerkaPYm
	Y2g6E=
X-Received: by 2002:a05:622a:258f:b0:509:e68:22cb with SMTP id d75a77b69052e-50d62cd9f4dmr184118991cf.5.1775559934484;
        Tue, 07 Apr 2026 04:05:34 -0700 (PDT)
X-Received: by 2002:a05:622a:258f:b0:509:e68:22cb with SMTP id d75a77b69052e-50d62cd9f4dmr184118581cf.5.1775559933919;
        Tue, 07 Apr 2026 04:05:33 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cff17basm547511166b.50.2026.04.07.04.05.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 04:05:33 -0700 (PDT)
Message-ID: <ac8a4139-f7ed-4ced-885a-59145c188406@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 13:05:31 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] arm64: dts: qcom: sm8550: add PCIe MHI register
 regions and port labels
To: jsandom@axon.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260404-rb5gen2-dts-v1-0-895f8fc494fc@axon.com>
 <20260404-rb5gen2-dts-v1-1-895f8fc494fc@axon.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260404-rb5gen2-dts-v1-1-895f8fc494fc@axon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dO6WXuZb c=1 sm=1 tr=0 ts=69d4e4ff cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=h77gEMGJAAAA:8 a=Tbjyt6IBEl-nZ4hlP0IA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=PYyYjrCoJcZo81GydsRF:22
X-Proofpoint-GUID: ERV5QmMfGbRPTeGw7L9puvghIA_EzK_X
X-Proofpoint-ORIG-GUID: ERV5QmMfGbRPTeGw7L9puvghIA_EzK_X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEwNCBTYWx0ZWRfX1LcCHKC1AdsK
 fKsqEi6dIMV6Bom9BiFX+IAIRWrDXiZMVH3xdiBt5Vz3iBPWhnU/REGeikwA1okMInXULZb5j7g
 Bl9vuz/1htYspbbLr2eBEldRgWBnMupcSkpQEcNfnRuThfuU9z+/DZcuqn79Nje+5O/GUWU87r8
 ZQgbGBI6vmFzvUPt3TvNZJZf3ZHaPuQWP1gbs2ay8FpIkr8szg2vo5V8zYIZ8QG2A1U0FzSwWhF
 /SfwFjpY6ElcWeYDJeAtdzY6boK4qmVQvmMg1KbUwxGKLgJg/ITA9vcT9/NDKZV9xoqNwJuYHqN
 eBNnJeSwIwxx/Us+AZ7l6PqSYL4QFFAM4Sla2pSofAD72JdGzw+hITLJDzbE7to41w4sAZ+Jt+K
 MBsMtbFo7EF/VZAnMIAE79TO5HO/3AhpL3M2zWRdurb5+GPJ5zV9zQ0IIFyDG34zjoUIl5VA59V
 eJ7v1HpLh6+lsl9FOyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070104

On 4/4/26 11:50 AM, Joe Sandom via B4 Relay wrote:
> From: Joe Sandom <jsandom@axon.com>
> 
> Add the MHI register regions to the pcie0 and pcie1 controller nodes
> so that the MHI bus layer can access controller registers directly.
> 
> Also add labels to the root port nodes (pcie0_port0, pcie1_port0) to
> allow board DTS files to reference them for adding endpoint devices
> to each pcie root port.
> 
> Signed-off-by: Joe Sandom <jsandom@axon.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8550.dtsi | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index 912525e9bca6f5e1cbb8887ee0bf9e39650dc4ff..d4caf4d00832d7f1e8f65bf2bc873cddadc42168 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -1964,8 +1964,9 @@ pcie0: pcie@1c00000 {
>  			      <0 0x60000000 0 0xf1d>,
>  			      <0 0x60000f20 0 0xa8>,
>  			      <0 0x60001000 0 0x1000>,
> -			      <0 0x60100000 0 0x100000>;
> -			reg-names = "parf", "dbi", "elbi", "atu", "config";
> +			      <0 0x60100000 0 0x100000>,
> +				  <0 0x01C03000 0 0x1000>;

lowercase hex please, both places

> +			reg-names = "parf", "dbi", "elbi", "atu", "config", "mhi";

Since you're touching this part of the file anyway and others asked for
more changes.. could you please break up the reg-names that you're
editing such that there's one entry per line and they're aligned on
the opening quote, i.e.

reg-names = "foo",
	    "bar",
...

?

FWIW the reg ranges you added are OK

Konrad
