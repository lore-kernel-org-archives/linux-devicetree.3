Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C31140B36D
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 13:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781099012; cv=none; b=GjwbUsbtXS+xDruZJs234jgbMg5D8svLlYLU7KcQ8gMvLrjEtSOpAnDP828U/qCL+3+zV2pj3zfG1h4zktdkBVq8ltrpmgc9ywvuqCGd+jVFiaOLMv+nVlCt5jOaswfzI62Fx5wZyQ1Igv1i96tdi9ps1mIT2kN9+jbrJ7eFLAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781099012; c=relaxed/simple;
	bh=s9ua0UmvL6f5kRD80XRjmdjy55LKKwOuM9f/hvYKY40=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BvLVsVoTRl0129yUKFXnXeGwE4g9jNI8fLetBackXSw71izVajInP9afKQqyhSiSn/eZjRmJuM9FcULQKQdV1MUR9QkYR1l6rLUp3fqAqzLGo+eps+VkBSAlOOJBnajSM5BQygDgE3cK2H6CWHMq9duIxsd6ZrGKL479DHfptK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FCeOFlPS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NWhitUcN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FCeOFlPS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NWhitUcN"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACC1fZ1073466
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 13:43:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+d+uOIy0pDXw/dS7D+a0SvZQsQcUuq0fUhk4Xwj0hOs=; b=FCeOFlPSDayy77sy
	oTDBixrF4W5gcabMe8lO0FNstbB8A1Ak+3MTq/TjEaxVNe2CFLi+kOmwzv0iPdDP
	SWrztpVvtDnWO3T30BcivsOFNSnsB8Ee8TNXJ/L4A9yrnSOQpVg6s7zTaIS5BfUi
	NpWoIGjx/gJI3QWNcrqPwpyOLc2b5NSs730JPanq6UOq6A3LZ80jXx1QmtfLNZpF
	9UvudnifUluefpcW5AWdXs+Nbr/n12m1hbYZrBN7DDVu/kLGXOjqhtjGnF+xqXrl
	7OG61ivjoNInaRS8CrMB3FO3vSAqTzD7Uqz2TLszuTe/kzEby7/hc61iwrAp3CV8
	omdz1Q==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epxuvjdp1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 13:43:30 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6c9239a1dccso317912137.3
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 06:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781099010; x=1781703810; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+d+uOIy0pDXw/dS7D+a0SvZQsQcUuq0fUhk4Xwj0hOs=;
        b=NWhitUcNMhyyLH9LhgK/P4UjqOb0KT7e90wmdsothcAcLI3XCZfug8iXcYCkALKE9C
         RlSinjgMZwqJUR87O8kpszzUL5GjiVrU/UUpTT8OznZO4g5doEN3M1k3y6QGBxSCEEb1
         o62OftRP5RchSibINMTdl77WG7NP0xNAW76MccFz+OzEM66QsuGGQKiU6/ml/K0x5jlc
         theaSuWGwvs0JfKGjyx42KVAToRgM7R4Y1FTXZRqevarUP6lsMX3+8JseSzAIacO4GSn
         kDu9aye/ZYu3idZ3jdmx6T6vx+OAAdii69tGpSx+vRdUC8sS1rZc1E0Yg7Rj1vDlI4Ga
         3ywg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781099010; x=1781703810;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+d+uOIy0pDXw/dS7D+a0SvZQsQcUuq0fUhk4Xwj0hOs=;
        b=FxiJQQQHqg/knzJQFtPU28NE7X1EY0EnEnH3zzHvAcWZM73V+A3cyLKDAPVZpUbSQj
         /coPwCLlPaRWaKIgdMBbriNaVVF7FsqwwE6wUVT1+kLxXZ4oFAH8zL8+E7KfcuFlI76u
         Vv6if64OVpWI4srU9GT2EqjMwSImiT+pG8yU8zWQq+JRDuF14A9ltYkfNFCR1172hS03
         KPH+LjPweuTpK0FZzObCT74o0a3w9B+D3WsfeR8mZPRF1Lx9vf/kqzVTnvGlnYBXK/XI
         YTONqefmpuLlo2HnNO0iKRoE8unvivcijKl59q5GX1o0ab9bfMO85pXINwwM2IQJaVPk
         tnMA==
X-Forwarded-Encrypted: i=1; AFNElJ+RskDJz1QJKeNu0atqfk0pmwz4eB1KGZvwRKTudFVsTsJpGXJ6xAZTUB8rpahoiuujPkG/CtLD+aTd@vger.kernel.org
X-Gm-Message-State: AOJu0YynL5o3tn6oDnonctJLnwfrXuXcKsWeWAHcY8c0qqcnG1bkEEAf
	0XPVugs8EjWrBVZeMpo5CZLR9czS7O2lN5I5TxgWuYbSbrDSm0MTvfJktxlQlqCmwqVJK3+6pwd
	HkhqNZHEcJj4HGZitJ1TXM9EsXk2VL9zBxTop6/2HxcsyCBKbjf+tsliVAeg9lL3l
X-Gm-Gg: Acq92OGu+csZOIuYWAidDG9jbBZCPw9crCr5cFpsVG/ntfCKGy8r/QULvUZ0N6yUxm8
	qkb7WLge4xCf8IfJwujFGvTnhGm5FZGx42CCcWEgK25Ula7u2zpUp7dFnmNdyDQZzeR16bcocpI
	zKhkYX0j87MiWtE5uXsKFHP6Xn0jVwcn8P8811lM7GYU0DlVvvG+u56j8a8zvBIObufeY4B9VeP
	3stADw+NIZYUnrT1Qn/KvLBZ9KC1DWnnxoxrJTX/s4sHmBBin970rdFrYTiINKRzK25IlCqqie5
	BT90yG3IuFvaC+nS40HFxKP21NAj62hrybV2wv03VGl8lXcvMGBSyodU3+VAoUTzLjEgGFOj7kU
	9e4Ia09HMtGfYJFJaMPwb0OsrXbKJuImkFku461v6FEfA2UAliJjdNt96
X-Received: by 2002:a05:6102:2923:b0:634:8685:d331 with SMTP id ada2fe7eead31-6fefce7da37mr4023444137.6.1781099009680;
        Wed, 10 Jun 2026 06:43:29 -0700 (PDT)
X-Received: by 2002:a05:6102:2923:b0:634:8685:d331 with SMTP id ada2fe7eead31-6fefce7da37mr4023441137.6.1781099009218;
        Wed, 10 Jun 2026 06:43:29 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396abd6cbe6sm62688081fa.0.2026.06.10.06.43.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 06:43:28 -0700 (PDT)
Message-ID: <e93a57c3-8355-4437-9b28-d04d30bfc765@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 15:43:25 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/12] clk: qcom: gcc-mdm9607: Fix halt_reg for
 gcc_apss_axi_clk
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
 <20260609-qcom-clk-mdm9607-fixes-v1-5-5e9717faf842@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609-qcom-clk-mdm9607-fixes-v1-5-5e9717faf842@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: gEWJwK_lOsqSo2RcxzHNAu3hHBQ-v-eO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEzMSBTYWx0ZWRfXzIxch0CqeV1B
 5vRljoeTUy/HOrlDh/o9zsGqEEBfWQqjc4JnRo+dHEqJ6k+7EFMmyHmnM6gNouuPxvYjDuqCaST
 k8OVEMDUOamGy3y+ZNlLHAt/0OLcKiGvUE1CimuKenzpl/yg0chalcmsVB6d/a/wPGJC4dAuNIH
 6CnRMBm4vR6NJcueBClURmSyymlpi5h2skIQ1HjljD3pGEkdYU95E7Jbkj7lCoytSnaZ/TcbWMV
 3vJCAUM77YK6gM/E5NlxT3/aRy62A53nt2dkKcGx/NMPeemfhM+91/PTmsNe84OFUZ0RTE4UoDG
 IO0vBjT9IiQy8B/bpegCX/weHvQCWXBvndRx2tfEmCGyYnVvdf57ED+uI/mO0bQ8502ZZfGpzqR
 07qEZKPaqOZ3QKmFoVOmbdvpZ906ELfOrwHCXdAmuNkJzzIscC9J+BlCR7wJsOXmwkI1oAsOPTS
 VewmkMguYbL7vdmGfzA==
X-Authority-Analysis: v=2.4 cv=Co+PtH4D c=1 sm=1 tr=0 ts=6a296a02 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=TjGFBzvoXwbZ9D7WYpMA:9
 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: gEWJwK_lOsqSo2RcxzHNAu3hHBQ-v-eO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100131

On 6/9/26 4:14 PM, Stephan Gerhold wrote:
> gcc_apss_axi_clk specifies a halt_reg of 0x4601c, but this is already used
> by gcc_apss_ahb_clk. The correct value according to the downstream driver
> is 0x46020.
> 
> Cc: stable@vger.kernel.org
> Fixes: 48b7253264ea ("clk: qcom: Add MDM9607 GCC driver")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
