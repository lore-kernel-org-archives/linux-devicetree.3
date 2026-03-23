Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFAB38643C
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774259826; cv=none; b=XmsnMt+8kiGOJySAIwp0sAvChBBX5NF+I8bUL9lzw4VS4UDZbXB211rXtqVI46hi3v8eJAvJ3y6V/Tuc1+R+QC68zOaUlPx4Ir9DVCh7ptzRdhSaHVIHJJX7ygMePB0LPMRFpXtkHZTbkE9Af7iKZFOeCWZPgNd9QkEVidCeasc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774259826; c=relaxed/simple;
	bh=l6SUlmw72Z1obSDidpLnagoC23CRG26xGqAcaYvT+Mg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kkRSp3ESFsL/Is//BNNnsUq6Zzn27pgBPDuMCCTlcE4b7S6n6He4GbjOZcRSjPvtmf9bqGSnh0WmR+YOnyz6l2esTEAJdbaOaL9dl3MaWytG1hTgzkfsJBFKdE36c9im5Qt0ABi6foOwI+SVFaFR/jpV7HFux0ua1ps8i+/CIoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mxzKNDzh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LYXgK23y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mxzKNDzh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LYXgK23y"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N6uo6k076541
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:57:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zrC4vVVrhYh7aqBcE0JH7rg4dBO3PuDHSwvk13AfB6k=; b=mxzKNDzhvCQ4cOMH
	c3bg/xSB6XHnYlrqgFJZx5Qf74Df2qeN5Q3iGufWYs+gtg3QECnFAzmFEKOvR7Rn
	z1YJN4l90zxPDQ4y+LqYn1O1vUpfIiIdQJX3nbQMrCZMy5mEUQKTsLmbdVk4luXz
	34HOSjGW5gAOikjERDkGz1ENJ7y5TArxhr0DSQLvyDq+iZV+xi1Tozm8av50D3cK
	PR+jMCrnPySvBdeeayCHsVphFFvxMy6mKUgq+HJge/qOtDC/6ILiBqpG/n1x0D4T
	MbmzZ0mKlKMR9CzHlYgZlK8p1CzXMFZrFyQP8+5mpexjB3iAZhQefn9IWG66Mlx0
	oAVtzw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1jwvmuum-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:57:04 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b2a1f123fso28015461cf.0
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 02:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774259824; x=1774864624; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zrC4vVVrhYh7aqBcE0JH7rg4dBO3PuDHSwvk13AfB6k=;
        b=LYXgK23ygBaQmoKorNJt4MUmp4LgAiae1D28ypK/hH9nS+2DQO2RpPqMSCF2dtPhis
         UYGUmp4QxZPBUHaMyuC/rjwz1WGKpgwEaxyDsJi8g22ho8yOQr3bbBl9c2S/W6b4Qrxp
         x97EMPWCAUUYXkHUeO2sTgNd3txTfNomiD/BEy7ZR071uLEU9DSDe8YW/Aafl19cnVVs
         NRuIqrzzCkJiS3bpxw7lNwGT6zVfobwUNGnn1E5twQPaH7mP11GH8G1c5P1OoOzQ41uV
         ueJtX3W+sGNBV3F6F5bv5zKP5LSV3Xn7cJg6u9MZyYpRiPI7mmQTwK1UCphGIamEzY94
         RLLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774259824; x=1774864624;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zrC4vVVrhYh7aqBcE0JH7rg4dBO3PuDHSwvk13AfB6k=;
        b=W5qIlarwAIDNnF6EIdE3JDK/k/LZbq0I+yWTSu5CfIy4nSHfUjj4q9kJs4MUgXdAxI
         i78Sh/eHhZ4FuSqiWckFKNZcRRdyv0bt692kIbGWzqE7C/ZxnBzk0awdyp5GoN7gqTPa
         N2ij/jnXAVvA2ziJzPopBvkxhMqVEU8/CtzdvJhKiBszVmsuF/XIyAa8yINfktDNOFY1
         J3M6Q2zbGFoMz9FQyujEE1yrCLuezRAQ9durQBGhtAXpDuq+sLXB+plZD0EzKGxDFvTL
         NcQwmHYWLHqok86Ste4xHczI4omm3tjs6h6gy2FQFY8PZztmSnSOr68kHeMngRES9vB0
         nOBg==
X-Forwarded-Encrypted: i=1; AJvYcCULz1bR1fOJXecH+ZVIdutpl5IJplKYVhNoU161zHg+WHh5NvKdh19CxbLlfu/YnvYSzBIM5JqPibV2@vger.kernel.org
X-Gm-Message-State: AOJu0YxrMrxMX0TM+2VRa4MDHktuluTvHIpTol6sT8l5De+YVoOS6cKX
	I5OMaE44689va9QDcDkyUtZM6Ndq4iULX0+9/coDA0gCBpt+9j4OdU36p9y6pQ8hbqHbOJvL97Q
	j+I77zUV2gA8GslLczJ81TYZ1ILHPvHELxGS9ydW3IqWf6CyCFBjDblD/SmdSj7Vl
X-Gm-Gg: ATEYQzy94R8FG5ThTjKYF9ZzWqzQnV2NA7LvZMRD//P1RCD+5Vvz8RWD/JNvZpmWKpv
	kSrFIutoxmv41BLH5zV3xnqVsazWj7XDQyy2Ho0Ma/5elG1Jmn3AGG5MzQWA2iKxfSkOD+3unRf
	gJpInrbtYPo0MTkYDBL2EuMmV7Vl7i7a1PDRieReKLOypNyVWXqiLEJujooD4QXJ4hivas8Kv98
	+VMTyp21v8/EpLgXY5oq6ItmrSFgI7qRSIktCmBmPSpvUZ+BUFYYeRNu23DFSq/yEbIgX1SWiS0
	W1OEKNjdXaj0F2EDwodK/4Pc3is6DPp89G/sx/OBYirSqI2YJmb1dQo+U0/sqIsQepeNjfnc9N+
	4siikcCZb7O3YIkMSBZpvUEaYTcgo7eFYYUa5hMLKp2L5EFeUS57R7QAGfppOyYkEcTUO3B0vPO
	5k9dY=
X-Received: by 2002:ac8:5a8a:0:b0:509:39b5:a97a with SMTP id d75a77b69052e-50b37270a84mr144313161cf.0.1774259824221;
        Mon, 23 Mar 2026 02:57:04 -0700 (PDT)
X-Received: by 2002:ac8:5a8a:0:b0:509:39b5:a97a with SMTP id d75a77b69052e-50b37270a84mr144312841cf.0.1774259823738;
        Mon, 23 Mar 2026 02:57:03 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f44034sm477970566b.4.2026.03.23.02.57.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 02:57:02 -0700 (PDT)
Message-ID: <8c79a273-8ee1-41af-83a9-af963081263a@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 10:57:00 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sdm845-xiaomi-beryllium: Mark l1a
 regulator as powered during boot
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        Joel Selvaraj <foss@joelselvaraj.com>
Cc: Konrad Dybcio <konradybcio@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20260320-beryllium-booton-v2-1-931d1be21eae@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260320-beryllium-booton-v2-1-931d1be21eae@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3NiBTYWx0ZWRfX1bzdy6SO/U5V
 FUoB5+AUr3BpRB6C6+QJbUwQVewYuGLyFQ82yt1qbDDzdREi8fnMYd+zwQaHDT+asPA39DHo8dR
 BaC7UdqrHZaawAqnmwmEfCorCH0GaipCfZxcRGsIAL8Pip9kRb5UDVORibBdSlyb3GhpzR27fR8
 G98G/BwtXmarvJ4KfIqfGLJEUX30lmU8mQXFJOp16WR27be4PjtLiULDj8l+fROCnAlvXU+nD4/
 SX0YpOSGLz6ZU5em3UoHCqVZcZl8SLjXlF6tBy5OOOceFalDPgTu6Xq1FH/CGQNpcccw4DMo3Mc
 sN4S/Gh1Ud4WaQPS3s0aaYsvxnaXZlX9Dl4M9q4m2MHbFDRPU/9EmOuFHNuyZ5ERHXg1AcWLJlt
 D/YezH+kLQfy399qbY488N7S4J+yqCig3mEnfW8Fj8ZIwlCzEMS02iw+1qbcYAtEsvTaPYOWH+Q
 GY56VAiAe/2E80Bu1gA==
X-Authority-Analysis: v=2.4 cv=bcdmkePB c=1 sm=1 tr=0 ts=69c10e70 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=i5pV3rSXluZByS3FN8IA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: GSxt3XmVafLhX6nDW-LgiHMSCdGcfRDf
X-Proofpoint-GUID: GSxt3XmVafLhX6nDW-LgiHMSCdGcfRDf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230076

On 3/20/26 6:33 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The regulator must be on, since it provides the display subsystem and
> therefore the bootloader had turned it on before Linux booted.
> 
> Fixes: 77809cf74a8c ("arm64: dts: qcom: Add support for Xiaomi Poco F1 (Beryllium)")
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
