Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3260377EA2
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 06:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788244875; cv=none; b=sT807cItCmyvhP5Wk3ri3XeELDD2bmT7K78nMM4BieFY9OhDXQBQixi+d/iHRPOUIqrTbLRs9JU3f2Q7UWm0QccwjO1mrUi+/xKW6OcbCZjnWGdR6RnCVeo2wwJ1Kb3Q/IMa+WJsUZW56Aku9lKsGeVYNw8JKBcftdSPPjXEWG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788244875; c=relaxed/simple;
	bh=Nb7nnpOYf1jAazbBX2YmplIIoTz9NkNLhf+a62QAAks=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d93X/4j4rNpenbFLhOYzZheM1uTXneY+hWJVp5x6RhNfvd4u7+yxEyERHOvTE8+7YiQwQk4fI6bLsSaRBzvE1XgXsfupYdrgYSa6D1NRtNeDE3tsUZ3V48yJjFQTzZYVqgFQUay0H2iz7kY8OnKsNsDN4gwIwo+hvO0mfcTQ0XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VbdtShYb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MbX1IJRz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VbdtShYb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MbX1IJRz"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6810opnj979017
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 06:41:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DCxRflPRsBNSeGfm7gnnOClfsmfdJ2iQRhF61AtDWtU=; b=VbdtShYbBc5IebkQ
	bX/yvUe4fPrdCojh8Tik/GKq4E7l/wmWNK4ncKwla5b6VsboXF13Ebl+hMh65N2Z
	s6UATJL0qx1Q4NkmoR4Jx2vo63y7Bmn/PNx9vYsVtAkoxbzy3Fh5yET/FZiypHE0
	AybMT/jcH63/gtlN88UWLTzIKQHA3jDoSOVbTPNLJaQImAR9JI5Z8aV2jKW6JLgX
	SFOmIzRggZHsjk2cuFibP/yxOgihm1mIG4AoSHsClxCxKf2+P7URFCAJc5Ccu95I
	FtraRZ/dk2Zif9f/SDhw957+vXYEKAHRQFZjeftn+a/V0/mTEQYc9QrcGB5UE7SX
	FIm9Bg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdd4dubbc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 06:41:12 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so923344a91.1
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 23:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788244872; x=1788849672; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DCxRflPRsBNSeGfm7gnnOClfsmfdJ2iQRhF61AtDWtU=;
        b=MbX1IJRzGn4vWAhD7ZvecQgP8YD91Fkur+76VDFpw7R1c5hd8YADF40TEh3QB9qhtI
         xUXQQI1A9mE/mSXjczUa+IxkDKXcgsq3pZnSQti7810vw1oOgR5m2DWUJyad74JbdYJs
         GZyIDqOhMpm8eoz9B+l3YDamuMHeFcHB979u2kOfi3KlDl8EMooHn41dwm+7jk8bnYoQ
         E67qyjW5jWbLXZKeFM0PTW9gIol0TA1hbZc3nRakj1XKzGaK4J7HJjRTJJYnGR2BgklK
         QbTlZMxBshhYggyd1DYa5BJOK1C+P5puGaHkxtsv4lor6H3PfCe5lYqgOnct84xPKmrf
         kp8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788244872; x=1788849672;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DCxRflPRsBNSeGfm7gnnOClfsmfdJ2iQRhF61AtDWtU=;
        b=UZMw4KTg1eOoNB1LDox81tsfFR4K0f/GpasRUbMtTb9vHHfAp/wXL57ldBGi17N+io
         BUlsh3UWBTQTuBjvwfF+5/UToeoxhoV1kyWK+/ZkRTWFSvvTHxaEWnLk6El3rIneqnxa
         lsLJmbk2apt0lv5vZMGYCd+xfa4ZRqbN3pgLgSVytg3Pu3clLZPrthTcoDBrHsHWBSA5
         aD0zD/p6Z2AZV2qLRrtVl5Ki4vMQPRjByq0vGaaRAhvVxVkO95oDrohC4hxNJClYiQy9
         KsL5TjasjK5o9WuneyjtDUPKhedBXCsC5OaLhYOLRhCP5J4urMVEKu2eTJDpHDH1/Kkt
         1R3g==
X-Forwarded-Encrypted: i=1; AKwUvBwfnPsaPdXDMQOMxuh6hlJ0IcDxegHRAGdb0AQpYw+mo5UbUPd1GMOHC1AMuThVki45EKjWOBcpq/CC@vger.kernel.org
X-Gm-Message-State: AFuF++l6qXdEhG6D7rD6yL3OfUGCL0aT1rPiRv7J3rw3uE33dmJE9emQ
	bslAGZJH1P5j9bdCye1z+00ejV8N+XDjwM9TP0xhTvuB/5r886uNe7ccN7Iik0bHf+q3DKTix15
	H5tcM9+FIEjSHiHpXNX6L96NzqfKr4C7cx/zUT+cCJzt1HT2mnG9SVMhI/THGEFBz
X-Gm-Gg: AYBFou3uhe3jFco9nYvTyUE0yYryuNwL1ChG4sEJdM6BPKX7M0Dz5oGGYWnJU3TMtTk
	p/udpoN7u7CcNcsZcVj045L2W4wEb1xVnmN0l6E5KGcox4YZ+gz07+8NKTtglDRQFGArhKkViNF
	/Ajs8BOwbnQ/VC86/G1tK2+gGrf+GVSNiMN77ndkLgWtIlV3Xveg2OlG4n2LzyNWFqcJl38l5QP
	w3WUdsM7CxFbog3okyvHun3lqlZwUMZQET4CMaKN1x1LDsB5N1IWdImNkgKDj5poe/AqNptsAnd
	76YpUnl7lWoxawh4NUNPtBvSP5tcmRYGkKw5TaWDNY3N3Z5RUWA6BsbGqVd9PpfjsHxW+lPkBq4
	whmrE73X0uH6egh8rl5NOwOKgN8kX
X-Received: by 2002:a17:90b:3c8c:b0:38f:efed:5448 with SMTP id 98e67ed59e1d1-396d0e7255bmr47808819a91.8.1788244871694;
        Mon, 31 Aug 2026 23:41:11 -0700 (PDT)
X-Received: by 2002:a17:90b:3c8c:b0:38f:efed:5448 with SMTP id 98e67ed59e1d1-396d0e7255bmr47808744a91.8.1788244871184;
        Mon, 31 Aug 2026 23:41:11 -0700 (PDT)
Received: from [10.217.216.70] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d499811sm4566091a91.10.2026.08.31.23.41.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 23:41:10 -0700 (PDT)
Message-ID: <9d1c5451-f665-40d1-866d-51a53fba27f6@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 12:11:04 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm64: dts: qcom: lemans: Add support for TSCSS node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260727-tscss-v1-0-beed14e72510@oss.qualcomm.com>
 <20260727-tscss-v1-5-beed14e72510@oss.qualcomm.com>
 <a93f11c5-d0cf-4acd-a959-53fecc996e5f@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <a93f11c5-d0cf-4acd-a959-53fecc996e5f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=b9qCJNGx c=1 sm=1 tr=0 ts=6a967388 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=_qMGny95FC9WgreSDIcA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA1OCBTYWx0ZWRfX+LbltcyVKhA4
 q6IqPqji9Le0YXUATtRFPSkm8xGX790RHPO2yvjbFJ+0a+YCo7ApyzsPduFnF8/HlhyNUi2G8Hh
 NJoPO6v+0DR7EQSuB5BcuyO4SqVY2a9opNq7Gwq9FkXwPY5HhfbOu+vKg1I43IfDnXelkKNm2Rs
 Uqkn6qM0APrApWQqg4VdDXFmBwxgAlz1K2cQjkAHqUnc34QuKGUMtRZyBpnfe+QcoOmeQ76oQfy
 OcoEkwc7DRpQAuEzOw19GziB23rhXfL75MIIaD+ZU4gCa4FtwXlTzS2IAqn8IvRwBhJtlltoo7u
 2KVZBrN+mSb1GtmU4NvMJtyOp8faOmpIewCnLwVi/HNFnelAs+LJvjtCPBncy+xneu2Pg52Pyhm
 vBJn3hJ8X3eFP4xN4+ATepMiNGsIG+Ia2DjR6jrY58RfmsSIMPlQmxMqaj4O3dISSnCbjpl1XSz
 BJDfjIIcNy60PzvSQwg==
X-Proofpoint-GUID: TW02D_hBmE73pi55KiYhCtXEICnZ4erg
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA1OCBTYWx0ZWRfXwUnD8oP5gWkA
 WJyr4IvJw5A7EhBWc/Ikt0nbToINgC0EynOpKnFOEirwgYB4124w/U3cOdw1jvzB3eglUd4d1Rc
 fI0lRrSoKxhpX13yv9LnrpK15x5CLls=
X-Proofpoint-ORIG-GUID: TW02D_hBmE73pi55KiYhCtXEICnZ4erg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_01,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010058



On 27-07-2026 08:14 pm, Konrad Dybcio wrote:
> On 7/27/26 4:11 PM, Imran Shaik wrote:
>> Add Timestamp Counter Subsystem (TSCSS) node support on Qualcomm Lemans
>> SoCs.
>>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/lemans.dtsi | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
>> index 3b0539e27b5192582e0bc9ea248f1c0382e05030..e225292a1e41a5a313aca188ca04bb12474995e8 100644
>> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
>> @@ -3023,6 +3023,17 @@ pcie1_phy: phy@1c14000 {
>>   			status = "disabled";
>>   		};
>>   
>> +		tscss@1c80000 {
>> +			compatible = "qcom,lemans-tscss";
>> +			reg = <0x0 0x01c80000 0x0 0x2000>;
>> +			reg-names = "tsc";
>> +			clocks = <&gcc GCC_TSCSS_AHB_CLK>,
>> +				 <&gcc GCC_TSCSS_GLOBAL_CNTR_CLK>;
>> +			clock-names = "ahb", "cntr";
>> +			assigned-clocks = <&gcc GCC_TSCSS_GLOBAL_CNTR_CLK>;
>> +			assigned-clock-rates = <15625000>;
> 
> I'm guessing this will only ever require a single rate - do we
> need power-domains pointing to one of the RPMHPDs and a
> required-opps reference to match?
> 

The power-domains/required-opps are not really required here, as this
clock's rate is at the lowest corner on the CX rail, which is always
kept ON.

Thanks,
Imran

