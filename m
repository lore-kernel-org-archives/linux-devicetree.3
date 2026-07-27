Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3763ACF1B
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 16:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785170997; cv=none; b=V1YAzjk7vpq0nghmvJHoDnToWiTu5A8bpoTH3o1zRoc7uLfk8xymjKOBuXfkYve++AF7yfNjucQDCF74vI+Zs/AkUbByqwOikM07adaDE785itiSJT59ZUzvymvvcDvRXlgAamTeL5BFILFDP32bpZR9ufpQVe6EErfrVCfyV68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785170997; c=relaxed/simple;
	bh=znPle7dvKWP/hCK132Yclq9rL0M+HUEppJAzsumkx3c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b31DoAR3QTdmIIMdRlMb9zxp4Ou7k//sCrl+kV9m9LUWoZAlQ2TmRGDvxBiucr2iyOptq7s3d8aUQq7xVstRxuqbILeSSGNha8wy7UDSxRMrDde1hj77uVZyUWk3s1UNEZZncMuWETJr4eg+tr7Qw1DUbptyPY9+DzVopfes0do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UuSqR4u/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RK7PpSzK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UuSqR4u/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RK7PpSzK"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlrUI033611
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 16:49:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nnUsSySpB4cWUUulQpZRR2iFY96c23Gd4LJH83/DUkg=; b=UuSqR4u/iVS4Xadi
	HzszftTRpcnYWcZNjvHQLq9qHtGr6KV6scdgOC9z9AUhcAKQtNtlCuJ1C3+Rcv4Y
	PWvUI0Vq+wv/Wbj3h351QPEPj1NzZPMU47yXjjj7MMStrCeDOHkn/AjV1XJsbxhm
	gqWJUvZUwQByjBj0hw8xKIdUafrMDWFZK9skI6Mfwj2eqw4PO2B+wUHM+h1eOCx5
	4L7GMkR0JwlqGZSNI2nSRXBBhgwWnQ8QPj9OUkeIs/0qP5MyMWre3EPcUW1hl21S
	vGOf3KSNczxfAumhMWJG3gKewU9wbyA28RDrWvGKZz7BvDNDIrRZ3NJRgNvxb6ic
	/OVSrA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4c61ygr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 16:49:55 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bfa45b280so53121cf.3
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 09:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785170994; x=1785775794; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nnUsSySpB4cWUUulQpZRR2iFY96c23Gd4LJH83/DUkg=;
        b=RK7PpSzKskrRdS2Q70H7HtFx5RP7uiT7e0LC5Y3sC/KbkzKhScQhnMpuq5/IKk36Ae
         oXqxztOBxZGX4DHtACDxuNdiMQWVIBi46N+os3DWB6INyiMmkarzD5wllBOhQZnCH6aV
         nHGJtEpyDyLiX8C8cbhx34HuNh8FfWY/t28ZxBIXWhHrtTeadFPRWLUUVDNr8/bK+Trz
         dWTyHdRtqvtnbYryqGEkDs15a3tsZ5bINMjLtJnjIpYZkmSZnxfHmmhJ7fMwuYX7+Ow/
         EKuXDGwJujafq164Ez+g3bZzXNnTacHj0ssTdU76LQ3uoL3pLkj6W4wfOP5JiCNv1fyv
         4DRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785170994; x=1785775794;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nnUsSySpB4cWUUulQpZRR2iFY96c23Gd4LJH83/DUkg=;
        b=aRQtZ1E8Z3PtUVJ8yOe7Rin92g1pRlgHEqNYPhYaF+AMNS1qg6dY/1qPKdSK765g86
         3UoxopH73ehvLfWNyBefca9AmUtsOQdC3R+miWrNWQguOg5vVpdWSTE63n8lt3ucrzHD
         Tx8srA0+Ktq/0gMRlDPaBa4UgvKcVCit1T9P+iJTGnGuO5eoUlJ0Tp4sSHWWUDF32SO5
         fc3OXQGxFoiswvQMJGwpf8ckygDuBNlCd2GCHCTe6aBFpwWIWnSVM+/nB9tZVViRIbi5
         8nAP8zsSYMUNKaXqcRzZQL88uRW1nV+4bBLgqctkNWK9ZJF7jpQ/E647rvrSjwt9tuhl
         Y+EQ==
X-Forwarded-Encrypted: i=1; AHgh+RqE1W71amPWKUdzeAk2zZjhZ/Cb/4ehDsbmlwfFPf5K1FI6yvM5o4ZMU2env759bThwDwBZbZJb4XBb@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi9RQSP21ihCbpoR6EcWMElGalMa7kM6/ntkKNIl1BX3k5zu6D
	D3BHgMBCIeyvkkTBQvkJ5+BbOftAIWvIxuDk5DzQ2uKoGBhsTlAopt1Y/+b47Jw/O71NziMpCa5
	oi+BEssaLQTB4AiDEHtoKaPbybNoCd1F2ll5gxB1LyhTFpTLVRdkD4BwT8MbWORNu
X-Gm-Gg: AR+sD12/lfGvhMP4pn73XDRElV8TARHjhLU3LWxkd6xjI+imOPRrk+id1oTsYKKr0ze
	YHcS9TszTIVLMG0Vki4INHLv68HGYrrBpcItDdb5Sznp3XOV7/Yvm7whbtu7Q3E6s6HHJ+qaRcb
	0Eej5RKCMmCZkLdgqizMNtMDjANRjfD0r1TX+feeXuW3jfDiLJb6MPgphDkg5ZYEVcBuowNVAts
	gguagfoKUuCDw6/2Zc41uCYQR0T9XEnSFdXq9WcCMR3SZ4bQF2Lv1c0WhLKlAMdLD7KDE7aGhir
	jMg+Go/kM6xVIQHAqZn9SMrti9aICobknQxxCZstaqRF8ie21m3i4DI79a0Pf6fm3N9ZjtRzrDW
	SZCCuzGaWGID/4DbtbSjOo0Vt
X-Received: by 2002:ac8:5981:0:b0:517:5d21:9899 with SMTP id d75a77b69052e-529a85f9b2emr131699771cf.5.1785170994467;
        Mon, 27 Jul 2026 09:49:54 -0700 (PDT)
X-Received: by 2002:ac8:5981:0:b0:517:5d21:9899 with SMTP id d75a77b69052e-529a85f9b2emr131699411cf.5.1785170994034;
        Mon, 27 Jul 2026 09:49:54 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69fb50bbfc0sm2944116a12.2.2026.07.27.09.49.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 09:49:52 -0700 (PDT)
Message-ID: <b51a9ccc-b850-42cb-b533-1f80fb3945c8@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 18:49:50 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: eliza: Enable cpufreq cooling devices
To: Haritha S K <haritha.k@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, gaurav.kohli@oss.qualcomm.com
References: <20260724-eliza-cpufreq-v1-1-38f01e47f0f1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260724-eliza-cpufreq-v1-1-38f01e47f0f1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eYQNubEH c=1 sm=1 tr=0 ts=6a678c33 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ipmcamAeJJyiMEZOMjcA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE1NSBTYWx0ZWRfX6RUnYMAk5i9H
 sJzmzji+saqjsunbU8jttPrmzzHq7gGimtcAcLbIQDmTr4rdt0NlFWENyRtx1UsSzi4nfnPPoV/
 WieBbiHdzT0JPWjXOu7s84jLjvso7x4=
X-Proofpoint-ORIG-GUID: wCwxI_tRwtoRzqHoYAyysIRczantXIGN
X-Proofpoint-GUID: wCwxI_tRwtoRzqHoYAyysIRczantXIGN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE1NSBTYWx0ZWRfXxHfWFiHeOgpZ
 syuTEw0TkhApO9GItwzCgx0X/KeR2YvGB9q6R3ul21m05hoiZrzGaSvZ4jn7Hn/sjpksgLzCsu0
 2Ly1LQ1vIiKiwzUCuAuVN+kTjXU+kh0RbjEgKuBk14FABNcpZk8q8c988woVWy2IMNOyv+o5jym
 exogAfi9KiwcZYC3ByKt2oden+vT3nQ/lPXr+c8t5aRhaRYTbBQ8iWWZ5zhGgLoGVVm2ZeJIIQN
 bCnghF9f37Rl4JBNLeTd084DKBX5pSwUhwb8+018Zy9Ucy672FGStq1AHlZdz2F42E2tqpxbFwC
 lwTf6guJ/x2YGKBJWkSJziju9y4dwhxIgtxOtXiSpKZqPKGWegF217eMLpL/nSmYHLWBdEKLWxF
 ADPygjLvoi01n+OIzaihlSOx++uLj9WjmlO50Y/wc6xGXGxjOD9ltyh9kouFQL3rqHXNEpsTUui
 /2ryxhpdcpqSD+HoKug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270155

On 7/24/26 7:16 AM, Haritha S K wrote:
> Add cooling-cells property to the CPU nodes to support
> cpufreq cooling devices.
> 
> Signed-off-by: Haritha S K <haritha.k@oss.qualcomm.com>
> ---

Please make sure this is taken care of in the initial patches for the
next platforms

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
