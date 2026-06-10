Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A153540B379
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 13:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781099069; cv=none; b=IokvGGLP9jOUkpn0DHuBBIWDseT0Fcg2vtUAbS7lvi6PwoiUham+tZfv6Cop26lssyUWDo4Y/2ne27fq8vpA/LOrHcgubhhMv9TParkWMJxcHYex+KUZB2UQ7+6SpweM2diKeisUl90TnDnSnH1Ry03P3JlGbgZgrWSNGXiaY+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781099069; c=relaxed/simple;
	bh=5EPC9P5S7PUBZZYNo1LRAWS0W5Ye46rG956pbwaEauc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=olX9GYl7tCc6QUIT2Doq0zGVZx8GIpDCRSnEEjlDSqiHsEKL75+bWEZhazSbryRi3I6g4Z4+YxXvF8CopRzNJQz/FAWhp/9Q3Duy/O/02VNEBxCQDVcBjt+Hwza3Qd7w1GGecxaF88OmSEWZQqPzUFi9N2K3d975fas2CbW7mFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=flc3eyxG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K058INB+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="flc3eyxG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K058INB+"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACC0JO1073299
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 13:44:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rc7H0K1bLjrhuNzodBgwv2B+RcHZws9T1i//7fhlpOk=; b=flc3eyxG1ANQxx0E
	PR1jtTzozfOBxIl2e+vC8kscK0wbejwCVVzkoy+bTxoWNKFzPRdCICdLlE+wtglT
	jFFw4TN1zILUEV9T6r0HDI/PuojjMXpQ4hyOQRVokAtier9ZRV/7DECgkxYKpgY2
	zAcsZgVKP3ThhDaJ4FMTHFalBFA+x/X+C3byxM4/QCiYWQJCfqrL7GbeSnRRqgcG
	h/fzSsTLsb+yI1rWljclN1hzsOE6heRCYTQU/vUTTqOhwyKVw/QwvVf2I4MlPYte
	ROW7SfOuWBWanZxqCTgAGYzmkNXphP45YgeIwntVGkotFxMHog0etTvPdiggBH5S
	pjHDeQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epxuvjdt0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 13:44:27 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9160006de85so9015385a.2
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 06:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781099067; x=1781703867; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rc7H0K1bLjrhuNzodBgwv2B+RcHZws9T1i//7fhlpOk=;
        b=K058INB+cWs8xVONQTmXq6ji/Xon3P3G4L6i6Ki0k+4Y4W8gfp/H1CcJuObkKc1Wxr
         E9CR1tiPv913hRkrhS6Fs2MIgAv1fgFBOvtsgwJ9eUQTztL5nLKmxiPWeXZmG4GeJFXz
         YENNxRF35bxGQ/nQbBGhLSbsTu06siNFGrVx/aTQ1VSpGo2jtuIwiH26bYS08lHxG1v/
         CZeBeayhWQmuTj3q0njaFi/6tKgJFY4NXHDPhVEIy9yYe3+U6SVGVQNrUhuXffg0Qj6T
         11n7jCLnAk7mpE/8LLp4LU2dHokhiv9JM+y5MXyUduZaVAe/31ihp13XBOXl39+rrn9C
         rKoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781099067; x=1781703867;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rc7H0K1bLjrhuNzodBgwv2B+RcHZws9T1i//7fhlpOk=;
        b=sFZNulKp/dcIWKY53Ev67SbjcNUkwwh+A3ZzOcQ+jbuD9Ljlb4EBDwUyVB7pnbtTVn
         jZu1P7qHcjPhEh4LJ/k21KctKSEpcM3E14vqQCEpt0P4zSha6gH1SSbq1WsWMKtdlLAl
         RNFSQgijuoYiOm8swjNkI+RXWPKsdbc4dtzgGFN9QE8JCBsvQ1VRIGr9rZHoUelT0Dtd
         CN4U1qH1y05KZa7ONP+DvK66GEnpU6zVuvv4EUyblMeptOi8KgKm+2Yda4SBxz2btsC9
         KgYkI0FNJwomKBzMkxIY/Axh/Wi6tf08UFHH6tiajrQRkG4l9tFS2lmVebCCzNWOGEte
         iGdA==
X-Forwarded-Encrypted: i=1; AFNElJ8t6RKt2yGKhVk22a4u3S7hB/TnN+JdtoJ3yxdXn/LJuHXWbAjytv/5hNz/Q1C/tVxgmtx3+p7+VIZ/@vger.kernel.org
X-Gm-Message-State: AOJu0YzcG/MdpFSHCPtSp1Be8HgNLTbM4g9OiQIcvRWzNDkrZHt95rSl
	5EhrLHqLqjeflzBkYStd+WwkSXzIBQJFHLULKW4j2ytckX1PujhJR8Zh0dadyjBx1V2bYFl9rgq
	I1iS5NLo3DSpH6yEcB6Cf403d3ZN5j1JXUkFihFaD8VHSB3y5CFOP5O0PdMtLcaHG
X-Gm-Gg: Acq92OEFJ9cLVdp1FBO0W6dOoJF7jUk4AHfWL/g0+qvCfgGVRsX+YRjXQpXMdOT11iY
	UGh1pgGzqVIe/vwzo6g/IPIObBpT/NhDADGkHkWCgnHszpNB8q4Jp7bP902Io9qp3lv+MPX3ikO
	+xDjsWqBb5ZlJVwET2YcrOkI8q63W4ta5lhnQsPmtFdTRzYM3ZqR8VdAeR7NWGuHNo+SHavCWxz
	+rj5EnSe6WIvSrBZa1WO36Mil1RuKa+wJ6/EGDOPhtCH587667p7JEWcOX/EH0I8t3e2YFZaUwM
	ZsWzZvv+AyvDXIBU6QAOqKbWjaZ0OmcDCsMY/H8VxD/987Dx0HcIPLuuVwu2tewu850JjXm0QRK
	VzfC8AosT8XeeqljRGlwVvRsKhuaHVXXAKSJZ3u9/tHRKIS0k6CpQeWHH
X-Received: by 2002:a05:622a:1186:b0:517:6162:daf2 with SMTP id d75a77b69052e-51795bc3ca5mr205453011cf.4.1781099067029;
        Wed, 10 Jun 2026 06:44:27 -0700 (PDT)
X-Received: by 2002:a05:622a:1186:b0:517:6162:daf2 with SMTP id d75a77b69052e-51795bc3ca5mr205452531cf.4.1781099066564;
        Wed, 10 Jun 2026 06:44:26 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf051e9b1fasm1203203666b.23.2026.06.10.06.44.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 06:44:25 -0700 (PDT)
Message-ID: <bcf0fa6a-dd47-4c87-bca1-942303ff7a5a@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 15:44:23 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/12] dt-bindings: clock: qcom,gcc-mdm9607: Add missing
 "clocks" property
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
 <20260609-qcom-clk-mdm9607-fixes-v1-10-5e9717faf842@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609-qcom-clk-mdm9607-fixes-v1-10-5e9717faf842@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3vjVWJr3RuZwFg3b_mLnfVO48Aey65JF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEzMSBTYWx0ZWRfX29Qcr6mt4ZgU
 mgoi+8SBp/oH33bLC8jVmDmHs+YW1w27JGRvcWGLaUzmZ976O2JQvrngvyPLKnfE2IhOUnFWbK/
 ZpMvWcl+8JgczKh2nlcEO2/9vBeHqvZ2u9/qTMCz8nEYjYNcf4qqCoOib/7DkLLGaotvYd7k+vw
 FKOtkvon5kFHJLNrQde0WqeuNzm4vqV/GGsexuiSsFquuFN6sPKlO1jQH3h0ErjJfkJ5djCodyT
 Z9nS5g7oCQ47zTqSMxSIKfwEXf6/71FE0wp8J0yLRv3NQf0oWwdkzAUfYEI7zn5/kAuNhvFXEY5
 A3IwDQbrSSCLj2lOxpRGFARMTco6d2E6WXHO/dTmQftceXw6UgiUbOzYW5vzGHX5E9pOBd3PuTG
 0Qk0Zpe36KDQMRqbtN8eeGpZUjCEhtBSPdseoNuBoRBm9OFL8aGaTAuRFKNaX/AW0CslzP5hO2S
 edSQhI8aTNrpCC7BE1w==
X-Authority-Analysis: v=2.4 cv=Co+PtH4D c=1 sm=1 tr=0 ts=6a296a3b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=hM3Lp7_hyHUGSlGb_zoA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 3vjVWJr3RuZwFg3b_mLnfVO48Aey65JF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100131

On 6/9/26 4:14 PM, Stephan Gerhold wrote:
> gcc-mdm9607.c uses "fw_name", so it requires specifying the "xo" and
> "sleep_clk" clock source in the device tree. For some reason, this was
> never documented in the dt-bindings. Nowadays, qcom,gcc-mdm9607 has a
> dedicated schema, so we can just add it to the properties without any
> additional conditionals.
> 
> Fixes: 6faa7e4ddce6 ("dt-bindings: clock: Add MDM9607 GCC clock bindings")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
