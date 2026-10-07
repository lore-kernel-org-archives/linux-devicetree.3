Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9EC397AFF
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 11:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791370849; cv=none; b=uhDF9CYFvpxr2fbwKrhqNLR+4E/CC7ofFMHzD3KTgxREwC6g1mKNWvvZtG1ogsWRGaefh/59z087CtKUP1g4cmvbnKndYSxm6SGNFKX3YbnbgogWYE0sn8tG91XmZuveSmih1sWyYlPd7xP9GoaLMfNsNVRjnWKAM5cM7PZdp5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791370849; c=relaxed/simple;
	bh=VU/dQ6PyuT7ZXeA2t3pyo87RFBXHOriX+IpfI3AmWwc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DYFbuuUSDbrwVrvYhhcqoiV5arrwA+KTmCzhu+uSkPly0C7kaI3IPxJYB4wg5B4kx3wbiInbR/Nd8+SGLTQi4xvOmdw6CQR5TvFyDoX3ne0kgtkAYI8BH4xdS4DFD0oK+PCmNxN5okWCL+Cr4qwROX+jGN14wj+DDK8Pe31s+9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oU1AcnTu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RQcYMyor; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oU1AcnTu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RQcYMyor"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jnik3334832
	for <devicetree@vger.kernel.org>; Wed, 7 Oct 2026 11:00:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Snd8Nbf+SiQhM0aPYxj0+20rz+GkPAR7nvSsrKWQQBo=; b=oU1AcnTuBUKPMdOX
	9jSWS530HrKrixtTyv3jinPa15dqNfDFg7UkF4MI8j56piw+vwI3Q1KmAw9K1Mxr
	WjsEdeiT1mCL0IH3bSTjABJ7mzknGXYBmCKEZ5HkYmg3bC4uXH2nTZyo/TlgspJJ
	SCyIvFNOdDcWsrRZjZ4WArTrfFZ2r9bNRA3xZFayD1ICpr8Yywi0QmJlg2qpVbf/
	v/iMMOtxB3Ar+XDIl2MCqkeMm2pgB8FCgD4QOQcDhnh61/Fhdzry/8RInu9jTrO7
	SycpXpktNObg3gZzDyBv92HTka/JRNjn20Lt9fQKDQg8mrft8HiBcD0ITOykMCFR
	JY0MWA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h54623q0s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 11:00:22 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc435388657so4445043a12.3
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 04:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791370822; x=1791975622; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Snd8Nbf+SiQhM0aPYxj0+20rz+GkPAR7nvSsrKWQQBo=;
        b=RQcYMyorVGr6kwkgU6d1UOCoRuJkSyxo26v7IO9u9n3yO6pbpvcuS1RlY0KyyW8xw5
         cIIaPBOgc6YT1ICvjXk1hs/bj0H+Kl5Ur2zI84DJ1TSaQYLkErMuG+1h6m7WspfkgxOD
         8r5bLsHK/94BtbZNv0b+rclrrQLwqovdXwDhz/yXq9GYntF1T8DXuuWjk/1OH5ZGMJ92
         hG0S70b6g6IyypNNRAFXK2AqkdgEny7IKF4tCK7aV82y7HVL5WP4zkgD5O492QEWvsoP
         qCO5dwItv2fN4C+q/0wEzpuZ4sAXXqQKyR/CbrnF8TrofrUc8Qtx02N/8cPFuWAlwOxj
         F6Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791370822; x=1791975622;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Snd8Nbf+SiQhM0aPYxj0+20rz+GkPAR7nvSsrKWQQBo=;
        b=ED/6WaMOR2IFH3Xhetgtbn0aSWtiZqkjlgTnw7KEVDPBwNiKe9q0rkXOSpF+nXOueW
         ZEoiZ5sBZiaK+2e+1gwLoQD2EeBWCcTEHUDJWQLWR2oBecAf05kZv8QtNUpTSIpclffh
         x0unlndHaKhWPtFyhEUG3FlzdcxOExEsDGPv66zQWg5PHzK0t1yisUAcDBUtIb80WTgu
         DN6zgSCzOXfaURQ9rRaH0ZH15wBcJc1dQ7sb/P3jEJVpnzUmA96tdBAr1bKNQ3H4un7D
         HaKt6FX49Uk5HW/rBNc1QfS/5hsH9lQ/jxR65y7s0AsblQyZUNtUoZlC51L4/6U9sAIe
         NHLg==
X-Forwarded-Encrypted: i=1; AKwUvBwgq4icg+/hXS/Oe96weeGkUA2shIRsBb6IO9ZfQUqxgDYMrW/SKGyiMSxBwi9muWzLtkfto9AGKd0L@vger.kernel.org
X-Gm-Message-State: AFq9FYL65/UQLTq4CNCeVcSSi/g/hBE1Iv8VvZY42bRt2NNI1LPwJ7JZ
	+32iJPIrE4xxG51KwIIGWcXqgnG+gzcIkL0TsN4UTwksLPCx9QgUQltvpF5GKeVr74kVq+3r7aE
	5jOIf1aZVJX1vNCf8qJXxaidzYa13J0U6ZeS6uqAox1+ghR0vcKyMeWX2E9sLcSZw
X-Gm-Gg: AYBFou2OghNLS03QuevHAmihHa5l7NdolkLsTd3k0fxYvtY3OVTEDrUFLjC1KB0DiFE
	Vcnf6W8VQHGyejRL/IgcCUZ1YBe5YimNtuBJqE3JmwUkoMuZ2+jVblXkK8xiHdMznEaLydTtZ5d
	hkFyFHFAxFaW3Oy7wTuu04sHDOkEKWgN5AdWjgRmoRb6f5WOBa6a7cEWlbVCehx1sQIaU+HdlLo
	ECaJk/NZ0wBzUtLlg1FoRJwiUNkF1UN+YM86VYM/vUuJtDTablcU6Bhhp1P0oRH56z7PKu8hgOb
	Bg7CT2vWQmqXXsTRyF/NsRdSZXm5KUqRwfm/oAI6jAVsXfb4KoXZoSdYBXD6hd1jelw+h0xE2ib
	/EcCKVQ9Jpj/YvHz63szZLP3aMvLdvDj7LZUIVFCo
X-Received: by 2002:a17:90b:5887:b0:3a7:250:386e with SMTP id 98e67ed59e1d1-3a8a07404admr1701794a91.22.1791370821875;
        Wed, 07 Oct 2026 04:00:21 -0700 (PDT)
X-Received: by 2002:a17:90b:5887:b0:3a7:250:386e with SMTP id 98e67ed59e1d1-3a8a07404admr1701772a91.22.1791370821390;
        Wed, 07 Oct 2026 04:00:21 -0700 (PDT)
Received: from [10.217.216.105] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd0a92d5ebesm1232959a12.12.2026.10.07.04.00.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 04:00:20 -0700 (PDT)
Message-ID: <297690cb-64d8-4e7d-9d97-66680f6a2b99@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 16:30:12 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] arm64: dts: qcom: glymur: Add UFS nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        gopikrishna.garmidi@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        nitin.rawat@oss.qualcomm.com, sibi.sankar@oss.qualcomm.com,
        Taniya Das <taniya.das@oss.qualcomm.com>
References: <20261007-glymur_ufs_qcb_enablement-v3-0-84cf4f861415@oss.qualcomm.com>
 <20261007-glymur_ufs_qcb_enablement-v3-3-84cf4f861415@oss.qualcomm.com>
 <a5p5gszuadvnvqcwffg6y55khdfhacwhegaxmmiwm72sfid6ex@cdwuo6sdmkgy>
Content-Language: en-US
From: Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>
In-Reply-To: <a5p5gszuadvnvqcwffg6y55khdfhacwhegaxmmiwm72sfid6ex@cdwuo6sdmkgy>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: gcITaog22DYi0SzYzVvSJx_f9B1aUNL6
X-Authority-Analysis: v=2.4 cv=ZZiIpcVA c=1 sm=1 tr=0 ts=6ac62646 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=SwwKY9vyf4oML-p5yksA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0MyBTYWx0ZWRfX/tH9fVv6WliG
 EMYrD10RHLw6fqO5RH6WCfOlg7JMShX7S6ls0DQ7XujgF6uETwMe/YuU+J9zMoGwMiZUnFE+fHc
 NUE12j+gkZgneF9ZFCvwGfwHhJEpdHc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0MyBTYWx0ZWRfX/7cx9hQMDAJu
 lyiHCVffp4rJjMRSr6b9629zYy/89R0x1MYigP/CenPyF0wfXLolmMJn9f6+Y7tFhxY2H0aLqcc
 wk7A321s9FnvMy1/vraz1RUy9rpDEbYqh+tAdMC6MosqLp2QAPwWxk7tarh04AWcJ37dXeUA3Xn
 mm1cUzQrNkvhm+oPlgVzhin1nCRv/Mr/uAe8S7jOgHSKgqc+krvkJvMIOgAUFaDkJaKVh8uNJAj
 TxwIQA8mDF3avhZ4FvnSGmhyfTjmuwFGeuJ8mE/IouGNBFUK2S3Dc9LUcfsP4FAgsWzs76z64Ts
 nDcFquM0qdq8KJ6LIhqYQrIZmb/TAwpYhAcI6QrX4t8kVCEHdS/t/3CPr1xXzC/flvf0K8R5OX+
 NgN/0zoTwZFWBqBQT7qXL0enK6v5U2vLPpGOEGNqrYHiEPMrjBYP9N7S0HD+lBczBHMSIpDpZUd
 0Yle0dnmFbtlpjv7trw==
X-Proofpoint-ORIG-GUID: gcITaog22DYi0SzYzVvSJx_f9B1aUNL6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070043



On 10/7/2026 1:13 PM, Dmitry Baryshkov wrote:
> On Wed, Oct 07, 2026 at 11:59:36AM +0530, Pradeep P V K wrote:
>> Add UFS PHY and UFS host controller nodes for Glymur SoC.
>>
>> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>> Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/glymur.dtsi | 125 ++++++++++++++++++++++++++++++++++-
>>  1 file changed, 122 insertions(+), 3 deletions(-)
>>
>> @@ -4102,6 +4102,125 @@ rng: rng@10c3000 {
>>  			reg = <0x0 0x010c3000 0x0 0x1000>;
>>  		};
>>  
>> +		ufs_mem_phy: phy@1d80000 {
>> +			compatible = "qcom,glymur-qmp-ufs-phy";
>> +			reg = <0x0 0x01d80000 0x0 0x2000>;
>> +
>> +			clocks = <&rpmhcc RPMH_CXO_CLK>,
>> +				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
>> +				 /* UFS and PCIE4 share the same clkref */
>> +				 <&tcsr TCSR_PCIE_4_CLKREF_EN>;
>> +
>> +			clock-names = "ref",
>> +				      "ref_aux",
>> +				      "qref";
>> +
>> +			resets = <&ufs_mem_hc 0>;
>> +			reset-names = "ufsphy";
> 
> power-domains = <&gcc GCC_UFS_PHY_GDSC> ? Or is there
> GCC_UFS_MEM_PHY_GDSC, which is simply not described in gcc?
> 
> If there are none, it should be reflected in the DT bindings, together
> with the explanation in the commit message.
> 
Yes, Glymur SoC does not support UFS PHY GDSC. Sure, i will update the DT-bindings accordingly and include the explanation in the commit of next patch series.

>> +
>> +			#clock-cells = <1>;
>> +			#phy-cells = <0>;
>> +
>> +			status = "disabled";
>> +		};
>> +
> 

