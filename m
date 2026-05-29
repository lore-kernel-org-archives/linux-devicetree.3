Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C72435DA79
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 10:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780049520; cv=none; b=bp4+1tuOhoWcoXXRHy1IyEw+NhOy4OfjPCGKOmDaAQ6G+0KP/S5h2srBThkl3LZSdCCihl+3+2phmaA0jSjnFCAOWs1zfORWOvrRmsIeef+gGa3c6kU6w2DSq/xYkTGiv8PKveiPLt969IiajppwkUqFpheKohZrW3e7OGiq8aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780049520; c=relaxed/simple;
	bh=RGM49AvjO/SWUeLeg2sf3XNzCTqLcvOQHO39H3cp3+s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pb4LmSHFfEOGCHRU5zT6qFbDH+He63amWYsyuff6c/Zavbke4WPKogNjTCaB4zDoAGjgtaxJauIY+57ZH1tgNzJn1P+tqLU7atdjpTMG8p4KGFyL5WYDZigNmW/HXDO0NHCtd6xkS3OZ2S9yzlIqk5hlb8OnIHw7Efi465Wvxw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PqwF/bWf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kIztQswe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PqwF/bWf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kIztQswe"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T4TD8c4193333
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 10:11:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vern+hdJs1cLOUpZgdLqb6ANGUxQ+XS40BsFdW2Gmik=; b=PqwF/bWfVMP6ZobJ
	CAXucgQX6239mSS4aLtKbYiL+25Q/dehvcnhVoTgF4J+qmJ1Sq0dxStCcR/t0HYM
	tCjZ3IwhcHxcDziFhd4dB7emSPdOu94OHy5C3G4UM90CRu2Yt4m5pJV/esnH5ipH
	605HFM/nhAevnilFjF41iFD4Qw77I/cq3IPrvZBiPvNFEgyRD5AvxQqS40MP30G8
	1vCNJ9E0vtpLSNzaoWo/KAI3tMVarD4dpjTgOKBB2dagySp0nQsoMpXdr/RwQISs
	QEt25WJazBae+WtcX/pExWW5gLQeW7kJoJirsJR/d7KCQ1bIhb3ylbauzUNzcr9R
	wtRO6Q==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ef3te1bpu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 10:11:58 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-837cc5bc6deso9347875b3a.3
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 03:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780049518; x=1780654318; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vern+hdJs1cLOUpZgdLqb6ANGUxQ+XS40BsFdW2Gmik=;
        b=kIztQswewLUAtHOryxhqpdI4hXxvX3SHOwFOuqqFuBBhExd1pvSBAg9OE2dqzVtqsQ
         Xgti+Z8CIEGUwWrSVVBNw3A7HIrhE9mOaT7IL82Fa7//op9KgxXm074mYn16Rq1E4Ykt
         eDt4o7vw2RIXHUTMW1CA92C39eEgR6Kjb2ij/TXN6ljvG6ZopFYl0Q24Qm2rc2MhNRlI
         s0ZhEC1w15Ac9qsZjJ0J0L4rxsDEt4c2/z3Iq4bx1egcojQJyn/K/3ePECIcOnG7SofH
         oOIGZP0/VL55CvFVPmoU8G1bHr5ULUaJkc4xT/Kxrv3l9dfI1h61EhfeJLDGAa8QqqOa
         q31A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780049518; x=1780654318;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vern+hdJs1cLOUpZgdLqb6ANGUxQ+XS40BsFdW2Gmik=;
        b=aq4zLdBLICkkrYAkmfhwz5lyhRiKIxRBx0kmiG1znbiVPxKjw5xFW/V9DGnoVTuNTK
         I3h+lgNAgeKjaahl9Qs0L+heNXke6h3PzXoDWY9L110Nnrcx3U4aTRvXMyLDefznnveW
         iqHGfLfCgPdNoE20KYyc+sIar3nNpoQMLPwlN0dSd8RzIuDabZoPijR5+KsZWr5kKhUv
         Rfi7jclFlJ9UDF3SxDRTJYJlpAP0rBYGATm0pP3qy3AgCMtQe6ftEVvlFNZPspbwKQCG
         Xt2bR2g79qt08b7E+6n7eqJcDTCTHbcELW+zIG1CNwC+qWYBgUsOreFYWYjEcjKu1xVL
         krxQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Q3yUZ9as7JGsgBADCtq7yiirb+l7MvT6ojvT9t4rmoMRPdfFgFlo5Ez7PBCGkWEoLXqPya409Q+HU@vger.kernel.org
X-Gm-Message-State: AOJu0Yxth9BjOsimTqjBd/RePOBgkRCFnZh1MarNZTcN7IVduk5od51S
	T3QS626YVRMQIzBuzshecfsZbSffN0XtMvaL4U9OU+XmmvZalPhzODyLUCXbbq3hBBhYtDOmhM7
	M+eYX98+bFuLnB95Sy9aih5b1+sgO01dVCIIif1Rwq7Gi762tw8G2BbppGnBt9fjkw7CHA4gj
X-Gm-Gg: Acq92OFpKfPkbKjIjAK2dCQJfczZ3lc3x9VMloCSWNmXhJlZG32ovMlJ3UD2Uv4pLrb
	gUwxAqa0iIT1Ov+PmMJ3/SN3vcmTHhkUb0BnitqlNzsFDE3+WN3pt0qglyZ5I93SWA8J437WgkU
	ZrNF2S+uWVKYrqqyIM5Is+58Dd71qmu65lC9nV52G/vuURoW5rcxxkqowRNPidtl2nDVaxF/OZZ
	HzwC1/wvh1L4359G4ScXo4bjRdPGfCGru7Cu951dqcFfjtyV7mARrCUAkK/WgkfBnzio3acJDbV
	v/hz53gHZtr6Gr4vnAlpE2SsQ17LwVcve1Qjk4wVsPpQpoBEDUOmdKHFafdoANSxn41yorz/ctJ
	wGuEyrqVfIrTENDrhvKwLFJ4hE820lFXfRG0ob5v74gkAPnoYSgCg3clv3hk=
X-Received: by 2002:a05:6a00:a215:b0:82a:1529:2b4f with SMTP id d2e1a72fcca58-84212d394efmr2331723b3a.44.1780049517826;
        Fri, 29 May 2026 03:11:57 -0700 (PDT)
X-Received: by 2002:a05:6a00:a215:b0:82a:1529:2b4f with SMTP id d2e1a72fcca58-84212d394efmr2331700b3a.44.1780049517352;
        Fri, 29 May 2026 03:11:57 -0700 (PDT)
Received: from [10.219.57.29] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84214cebf6dsm1459830b3a.53.2026.05.29.03.11.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 03:11:56 -0700 (PDT)
Message-ID: <cd43a941-5672-46ed-a9e6-1bc134c94e03@oss.qualcomm.com>
Date: Fri, 29 May 2026 15:41:50 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/16] arm64: dts: qcom: shikra: Add CDSP, LPAICP, MPSS
 remoteproc PAS nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
References: <20260525-shikra-dt-m1-v1-0-f51a9838dbaa@oss.qualcomm.com>
 <20260525-shikra-dt-m1-v1-9-f51a9838dbaa@oss.qualcomm.com>
 <4guumv7ve7rshw2pjvumenopxsefha7hvj26tw2pgayz24ytxk@iry6qyqqqs74>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <4guumv7ve7rshw2pjvumenopxsefha7hvj26tw2pgayz24ytxk@iry6qyqqqs74>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: P7N4y4jmkI-CMrSWtgV-_d-zVA_hvZ30
X-Proofpoint-GUID: P7N4y4jmkI-CMrSWtgV-_d-zVA_hvZ30
X-Authority-Analysis: v=2.4 cv=daSwG3Xe c=1 sm=1 tr=0 ts=6a19666e cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=zUxKe6W84NKXZjXATOUA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDEwMSBTYWx0ZWRfX2sIFObTa29Y+
 0jJEafrVkZyOPcBscBLwcJTyN072oTAIHBsmmv8fmrft5HsX5/OsaxpApsg8OXar0m5B0Wbl5PR
 whoTAxon05X5OFBawHQNEwO10ejSvrQNF9Z0ZSXp6RsyiuECqrONhqMbUra2dkmo4KmjiBFHFdS
 pC9yIf8t2iF3qVY6GE7XV5gL2ryVonIvd8OC5ik7th3bb8y/2ae2tviDM+wB6Yc6ZRGW9rjGCd7
 9lxFJ0VyFMnp08sI48HZAoqK/yCc1MGN0CrE2/JWp0q3LjdU5FCH4C8D5sCPnoNeTQx+ENSRk3f
 bJcs6HuEqK4I7en4Dnerv0dfA1+MkPHFDUQ8OsIiPnHwng/EpLOe3yxGN2UiveQ5HlZpg4rUtEy
 O4NEg4awa3RnZvCtvAFeXCbLUEjr2qXrnNnUZD1YYwdMPjVDHhhjPfU9HU1MkGJjAZjmmwRP2d4
 144u+FPtycSSu4fUQ5Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290101

On 5/25/2026 2:57 PM, Dmitry Baryshkov wrote:
> On Mon, May 25, 2026 at 01:19:13AM +0530, Komal Bajaj wrote:
>> From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>>
>> Add nodes for remoteproc PAS loader for CDSP, LPAICP, MPSS subsystem.
>>
>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/shikra.dtsi | 164 +++++++++++++++++++++++++++++++++++
>>   1 file changed, 164 insertions(+)
>>
>> +
>> +		remoteproc_lpaicp: remoteproc@b800000 {
>> +			compatible = "qcom,shikra-lpaicp-pas";
>> +			reg = <0x0 0x0b800000 0x0 0x200000>;
>> +
>> +			interrupts-extended = <&intc GIC_SPI 257 IRQ_TYPE_EDGE_RISING 0>,
>> +					      <&lmcu_smp2p_in 0 IRQ_TYPE_NONE>,
>> +					      <&lmcu_smp2p_in 1 IRQ_TYPE_NONE>,
>> +					      <&lmcu_smp2p_in 2 IRQ_TYPE_NONE>,
>> +					      <&lmcu_smp2p_in 3 IRQ_TYPE_NONE>;
>> +
>> +			interrupt-names = "wdog",
>> +					  "fatal",
>> +					  "ready",
>> +					  "handover",
>> +					  "stop-ack";
>> +
>> +			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>;
>> +			clock-names = "xo";
>> +
>> +			memory-region = <&lmcu_mem &lmcu_dtb_mem>;
>> +
>> +			qcom,smem-states = <&lmcu_smp2p_out 0>;
>> +			qcom,smem-state-names = "stop";
>> +
>> +			status = "disabled";
>> +
>> +			glink-edge {
>> +				interrupts = <GIC_SPI 286 IRQ_TYPE_EDGE_RISING 0>;
>> +				mboxes = <&apcs_glb 9>;
>> +				qcom,remote-pid = <26>;
>> +				label = "lpaicp";
> No FastRPC for LPAICP?

No, FastRPC is not applicable for LPAICP. FastRPC is primarily used for 
offloading audio, sensor, or other DSP-related workloads, and is not 
required here.

Thanks
Komal

>
>> +			};
>> +		};
>> +
>>   		sram@c11e000 {
>>   			compatible = "qcom,shikra-imem", "mmio-sram";
>>   			reg = <0x0 0x0c11e000 0x0 0x1000>;
>>
>> -- 
>> 2.34.1
>>

