Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DDF7372EC0
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 04:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774845629; cv=none; b=srWeLr/eG385c4X/EmKQ3Et2M8XlauRE15ligm3bpR4xXaCOoH9X599R00gsl+eUgfeFEEug5gCsdmrU7jRC3piZVQFwjWGU404P6MesGwJMHlSL7Rjr9udJfi4ZxkfyIjJbqZL8T8Fng8Jszi0GK4RrI360kqug/IZd4wsnZ6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774845629; c=relaxed/simple;
	bh=R159vo/2gogafejfPEcTUgl2FWXZNcSUzLIw/hjie44=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DK1W4LnZVuV+0a5Fx2sLSL2mDLc7Ckh9HrsHgobjhHMT3Nv+doB/xVfYmyjO8XDwCbzRMuXC/KQkfxI/0Ghi45tfcs0WLf2W2VPdOmx74KNChnPlvQQddr0Tme0Yz0hQup1IdxdkobXUMV9tPorXgZ4Kxn3nXJr7lODKEwTsEXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pNplJOve; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NTtgv2tC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pNplJOve";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NTtgv2tC"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TAhYOR201408
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 04:40:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jxIrz6lqgl8INlv2CG6vKfWIRSC2AzWItLIRoJEu4xc=; b=pNplJOveWazggGEJ
	03skUawdUr3uoJLHDAwXeBMGCB+TMSFFVg5Cb65AtwXFEg30aTKljlLSnJN4b/mZ
	7/z38cU0NCt/VmQ34HD7RmMudgg641UqDkGrpkKsY6UyxCL+A3DBKqyc8JHolze+
	MWFcIGqvSJwpUyEg/1UhlQZJIA+Q4eUsxQFNIeOEV+MdotFMw+23fzrffi5a8Cc/
	D9rC0NdqrxGEthHKUhpZvCaCURZF2HikjUFvcDrWKVyn8+PNS1JDkARTbJxT2szB
	ocY3Pv4IdoS3m9I8p1eJUHENCqhqP6UxgN+jfbgqXMuynGt6LG04JTDwHxeGjgT8
	otY1Bw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d66jwmftr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 04:40:27 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82c38b85c25so7657373b3a.3
        for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 21:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774845626; x=1775450426; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jxIrz6lqgl8INlv2CG6vKfWIRSC2AzWItLIRoJEu4xc=;
        b=NTtgv2tC70f99ZO5yxHrZCKxjxiZm8mvVeelTQ7NRLGBc6GPST5bJqcCv7S2Jesjyb
         PQYIbgTgk3QyU8zn3remSZz5V9Zq2Y9DM0TvqgZFSYGeSq029XL2LNQEmfxntPAhMggQ
         23hZJdrz8YiLmtJfKJ2bpaOSRRI2kM58zq+O6SCQt4jtwMgy4WJ90nZwkqwcpjDfFLeQ
         k4evPfTz50ZqkhxZevM/LNtcptQLfzX2cF8WXduclSF3ez+DJcNcTqFQ2knCbLKHc3za
         mQ3QxGnX8rFlxtpPPixSO1g9ZLhQqRAQBpu1hsbYDKXD0u1QmEEuLFTbuhH+wR9kvxy6
         aAYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774845626; x=1775450426;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jxIrz6lqgl8INlv2CG6vKfWIRSC2AzWItLIRoJEu4xc=;
        b=jVgU6OiKse9QRBUV/4ULlx9mSDsbQ6ts7HrW/1E4bAgg5Fa1xLHEps+LQqjUvpxaKs
         YYYC5D5CenwhSuzsQnmFVd2733LdWDXEOa9DAslxxJxdQMKOTLf5U8lrW50RXqLL2lVN
         Kr1/lbk/U2+M7ePTFyPoe7fxp9GosYN0wRtBV5pFrmMbog7k0pAff7ty+hWsBrJnviy8
         mCU5vDyXRlTlzrYuKHuK32Sig+7VP+sZRAYxmJ45ApIyhr7Ia8IP9X73j6nhKM+xQbJc
         Xg75Z5XPRonFf2Grgwazz9QS24kK0MNx6WU+e2+Y5TMaxx0pTn03ZP8jdbBW+SuSiZV+
         dH6w==
X-Forwarded-Encrypted: i=1; AJvYcCUDpSdsZefyVx+bKmhFDjZpjH5BYdyg1m/rp+6fjy7VZVpqzhtOSw2Z7Nque72EH9/ftmcSTupPtqoR@vger.kernel.org
X-Gm-Message-State: AOJu0YzuhtT9V1VNj6kK5fo6afNXLiq1Exv0mWWJhZy05FdSs5S4qvQv
	y333Ef7vP0i5gr0ttLRPgFNctgalMLWDsYJjo651NqeTQeStK3+jXhk6YsFU2kvF6BU41k/cp13
	SyHZImH1S1BaLGrlcwrbdUe98GII0Mgrz4kyFIrqNrBrDp7dq7J7w44KjuFPUzkqf
X-Gm-Gg: ATEYQzyRJn3QhRuMYM93dc9Ke2jE4f4gCECRlgC/Ij7h6Eh3bbJyBse5e2lxwFCom9J
	nGk3tIMGs2W8KEQPjVFA9UsRWJLxw0ikE7XLw4oAQnhCS2Bvbb4/f+UZmuXoihtrTp1DWkqJYo/
	IX6o/iDlgPHz39Y0Vi7ztyxIyhIlVp+W/r8H4bZveeHfF0mRqq2n7ZxXpeEa1QIlZ0RtFOTpcGO
	taYth8yZjdumjHsv5pajctDfrC8knZelZ5wYdmRS93dUvFvpXak7sznUBVxIIS+I6rO+d/nS2Mn
	9ix0a8lCj3HtAtITTA960tnyQ16FP7Xg3Rs8ic7L5bx/+lvsuB10Th/47flWFOyF3nZCoEkG6CG
	AjUEFCxkym7gkFQA2Oszlsju1TPXBD4TnUB+1r0Xn9RNrGYuH2NuLQA==
X-Received: by 2002:a05:6a00:4c0e:b0:827:370b:2695 with SMTP id d2e1a72fcca58-82c95eb8cc1mr10649777b3a.29.1774845626204;
        Sun, 29 Mar 2026 21:40:26 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c0e:b0:827:370b:2695 with SMTP id d2e1a72fcca58-82c95eb8cc1mr10649745b3a.29.1774845625706;
        Sun, 29 Mar 2026 21:40:25 -0700 (PDT)
Received: from [10.218.4.221] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca843b20csm6926179b3a.8.2026.03.29.21.40.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2026 21:40:25 -0700 (PDT)
Message-ID: <2212d12a-8ce6-40ab-8bc3-ab8e3b9111b2@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 10:10:20 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/6] arm64: dts: qcom: talos: Add QSPI support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260324-spi-nor-v1-0-3efe59c1c119@oss.qualcomm.com>
 <20260324-spi-nor-v1-3-3efe59c1c119@oss.qualcomm.com>
 <20260325-dancing-macho-coyote-deaa55@quoll>
Content-Language: en-US
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
In-Reply-To: <20260325-dancing-macho-coyote-deaa55@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=I8dohdgg c=1 sm=1 tr=0 ts=69c9febb cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=dPh6dh2MmqIcn93rYEAA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: LDTAJsyC4mVbDs4hy1WrmdOPhXcKucp-
X-Proofpoint-ORIG-GUID: LDTAJsyC4mVbDs4hy1WrmdOPhXcKucp-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDAzMyBTYWx0ZWRfX5cumJNKQEknU
 DjabO9FQZo5o+LtoRr6D5Yv2wKYY/dzUYYxCPZsS0MAe4m7Vl1zA48p1/fSp0ypg3Z713Bp7k72
 9fcsoGObUbBlPMhp4dmQ8EUiGNevvTF9nPYZdMyW8BX27Lrn4HJGPtEyD1e7IVR7p0U5t9yUpKr
 Zya4mzD7Jpa82Sz+BKMX0DA4uO7Jikd+JW184N6WWRqaD+JnA9VmNQqcgC/Ub+7+GgY2we/SRww
 6wFW3QjNuDNXF2jZpbrm4P8WNaJOG+L06+nP/kcAF0tCCNLSYbInKqrwhuvniZexAss3PvvbKAd
 w2uNut2oL3ctaFbW4pMo5oUjr23QzKBOqEpJt9W+JaeyP2+wrbHaLHZRcNlEEvk4yj76ow4jQ+Q
 KMVHZq5hqSnriTdRQlvaPRqApzCVcdfUJY7LZivBh7ntOSr8pcuP4oqZeiHnb3FbGfCq8EI6axS
 Ap+dgBmvyD3fe6DyYPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300033



On 3/25/2026 4:43 PM, Krzysztof Kozlowski wrote:
> On Tue, Mar 24, 2026 at 06:43:20PM +0530, Viken Dadhaniya wrote:
>> The Talos (QCS615) platform includes a QSPI controller used for accessing
>> external flash storage. Add the QSPI OPP table, TLMM pinmux entries, and
>> the QSPI controller node to enable support for this hardware.
>>
>> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/talos.dtsi | 80 +++++++++++++++++++++++++++++++++++++
>>  1 file changed, 80 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
>> index 75716b4a58d6..fd727924b8ca 100644
>> --- a/arch/arm64/boot/dts/qcom/talos.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/talos.dtsi
>> @@ -530,6 +530,25 @@ cdsp_smp2p_in: slave-kernel {
>>  
>>  	};
>>  
>> +	qspi_opp_table: opp-table-qspi {
> 
> Does device have only one QSPI? Then table goes to device node and
> binding needs "opp-table".

Yes, it has only one QSPI node. I will add the OPP table inside the node
and include it in the binding as well.

> 
> Best regards,
> Krzysztof
> 

