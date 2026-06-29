Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978643F8705
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 09:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782723752; cv=none; b=DJQYPeSzi3eA2+ofCPCUc8HnKRGZ57Is+3hYsGdMIGuplyUJLf92CuDPDwj7Pc6wA4VdJmyw+WMETFAYT3qtLsUchJ0uJbq2z6xyM5lt7epImssrVWZuD7nZ7lIarYRrSVZJrEtz7PxaYWiQCO6ybe/W+liwKQjcjj4dIWX0d1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782723752; c=relaxed/simple;
	bh=uN8EStkhWQovsXaPLF0VKa/uhW0GRSGeMVCDsuf+bkM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=srE8OCqAMG1MWC8Rt9g6cLtmLP7uMTSBiPrNcDCQK39cZs93nnCPK9+Eo0p0WAmMF39LxvFNVTudwEfOiGFfUoBM4DeTcJgwhvETwAwDOdQRM/XSI4SNK4nHs5iPs/Q1TKOL7yipoy6gfcQNnDxRDFVQXBnyNyuQKw24uV/GOJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QXrtunnr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YZFH4A11; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QXrtunnr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YZFH4A11"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T8xfnI2431932
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 09:02:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6ejIRbap4Ikyo25xwZlCs7DhMOF8Efn93SSCouaZlDI=; b=QXrtunnr9U76wGNM
	o8r9cjDDQHzcRe9GgO0ekMEV9LphFsn3SfheMXl+gyLQB+utOYKil5R+t6WiJ3nY
	u4ZvksXg3hNwSvYO9lcGnPlaLspCBvcAHs0WaRN5FK4qYE9EB1UYjbmCnVBex9/R
	jt/PSmK8Y1DOwmpZ5mk3anSCe51zM9bDD41JTLH0SF8QbASmAQbDF5b7QkKSSHpE
	pMZk/Srlca/5dIV5WLCep6NgeUFpAJ6r253mC/LIuZkT6MrzkL5RHLOvCOgPm1la
	LOQmNti4xnF5stnMOd04pAmx3fhR08oLXVbK4PbfhBvpumIci/DYNtTlGN5QBgVv
	YAtCiQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nper0fk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 09:02:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92a9777b04dso87045585a.2
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 02:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782723750; x=1783328550; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6ejIRbap4Ikyo25xwZlCs7DhMOF8Efn93SSCouaZlDI=;
        b=YZFH4A11LdF7fzqYx2nXw3UiHWXv4vrjgS14pCUW15SkF8goSkaXvPWy9AST3l3XtM
         J6ZkZ4s/X5wrq3kxXF0jNEE+FOt2Z18oRdOrA8cPxLgIdYZck6l8+jIgGdJF862JhAc2
         mf9ZVPl6sEppcgJATWxOTyngQZ2l4zSV6il+FxhHb84iaM/LGXZIgAoob0bnA6sauGX1
         ebQfIM3FGMNQaSR2ARMWWdSXEIXp641fb7RMJ9MU5l9LHM4tcxya7B9UJgb+pZS34rIJ
         wEBjZcAiSsetdsG3RNnIXEKE+rrZAMsyyDYEc3hDudnbrudasKgZHY/7Jdg6Nl3PFqf/
         JX/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782723750; x=1783328550;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6ejIRbap4Ikyo25xwZlCs7DhMOF8Efn93SSCouaZlDI=;
        b=J+8oXRGkh+m4EiaFLnt157GEdVgiMaEA3yZXq1ORn7MFM+bmAgw+DlGfKArEiuV+gN
         FLx2F4I6hX9QouZ7/HX/jCvCrZWM28nqLasb1zTEh91NsoNEhQPWw0VVzqtAhV2d7gKH
         8HDq3xMGG8ZfIsKtAkXw43sfyDytDbG/uymm55cg5yADJFl4GocuSXmNB0X2jdV0Jon8
         dGYubIzUBx+YPrUPXDe5hlIQMaF1kDxnsSU1NnB/di/jLjw9XpXzQCIG1c6rLO61vAkx
         PerS/oj410O7LBAfDj82mNPHC22MDdVfBkH4scd0s2ZnJlvW2Sea73hhgeVs541N6PsF
         m1Ww==
X-Forwarded-Encrypted: i=1; AFNElJ/9hkfVwvrkcfNsGxHTaUVjqZVSYzv4JXlFq3a+kNwFf5juDFtAYVbqZEyx4uuxVy03qqRIx08+HbtY@vger.kernel.org
X-Gm-Message-State: AOJu0YxMBh6z9eRT3Dt+BqE57PzmpKdsOYUFCL5xn3Yf1TVFLUn6BLUt
	inRFDbeiHGvZmMfsl1L8PYZLITT24yeG/IUB28/06tRn5P9wvGk9xrvfi57MBnoxUtZ6hLxMNgb
	J0Cp0BgwQXhpTRqbWdQmIDhHZg6V3kpMK2O2k/L8c6tiNtJeuiM2mJUq0CtrUtWOs
X-Gm-Gg: AfdE7clNsunRHcah1MdmZMTrig2ZhswA4rNX9usDtKYwJ1syN3Df4C1wExjrxDJezpz
	3gLg79wppIDqLaSU/KMbJ14TP2PiBs3lIvmv/g0oush1q/Fl6EF7fSKFLoeaB0Rkjo9YxXe4+RP
	BI5SUTaC4P6h7JF4d/RX7l9J37+9Kbrwf6E7uVzFkFaSzCoYNKpIhTwnEs50vjoiPBwPSebchbU
	kdGsmCqqe6EKO7KdzLhnQC0fgo8HJd1FNK04+JZmj22lTipI3Q8ghutFaIbZoCN78cowzn7S71Z
	SlGC+orsijHwpVH1F5608yU4eGpj/mnnYx+HZGysMh3y7han3XVVxSlLU8BdRZHvKtVkOrmH49z
	t5DsTjsqofB6AZF/EIoDo+HKgaVxB0TuZgTU=
X-Received: by 2002:a05:620a:84c6:b0:91c:9d38:30ac with SMTP id af79cd13be357-9293c21883emr1504704885a.4.1782723749698;
        Mon, 29 Jun 2026 02:02:29 -0700 (PDT)
X-Received: by 2002:a05:620a:84c6:b0:91c:9d38:30ac with SMTP id af79cd13be357-9293c21883emr1504701285a.4.1782723749141;
        Mon, 29 Jun 2026 02:02:29 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbbaa4cbsm725874066b.3.2026.06.29.02.02.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 02:02:26 -0700 (PDT)
Message-ID: <6ca1def2-daed-4ec1-9c59-2015a822e0f3@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 11:02:24 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sc8280xp-x13s: Use predefined
 MCLK pinctrl
To: Pengyu Luo <mitltlatltl@gmail.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260629065905.15651-1-mitltlatltl@gmail.com>
 <20260629065905.15651-4-mitltlatltl@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260629065905.15651-4-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3MSBTYWx0ZWRfX0RI96iAAhvOa
 ZlF1CeKDMDiAM1PPVBaVQ5ec3hctn/tVSSi1W/2WejjGaWMev5YhlMu73CZ4wC7KDGEJ1e6FTg3
 9o7Tbu9o3d8fM3hQh8ltYjUNBdSGW3yMWT++Dly5d7LB/lE8DFGrZhBh4RAGdn5OAhFdZUqJYfe
 bIsf1nMzvrP5KTPr15f4btGq2QRwwhUCKEX51NsCHKzTWrcKNxhPc3fzsTscAATm8+2hIywcRVs
 LgGt/4AmEjKQrFc11r/h51F4qKMlTpy3DenebBQuCbUnFO026H3LI6MLFHVnUIXnvTNfQW0uwlt
 uv5nG3xtyTTjYvnlHLS+xkVrLztr5jifqoKBOo6kIaAz3tl5gID0LzKvmoMcxoAGeLOHei2t1zz
 Pv3rfxmqx6YFKj+tkWMZvxlKQ3S6H5a6hlpbj7TMeUaVUaCL1Y1gwcdPjhXOjsokrZd866y7LH8
 KLbC7SZQvBf1c4XgdcA==
X-Proofpoint-ORIG-GUID: JLzSrmk66oOyhdmyK9CmNV1I3ioDmvIG
X-Authority-Analysis: v=2.4 cv=T6q8ifKQ c=1 sm=1 tr=0 ts=6a4234a6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=_DbJdq2sjojDXUnWG0EA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3MSBTYWx0ZWRfX8uNHw4WX5i1R
 irZ+wiPCX3Ur00dGv9EGxZIWg9biE4yMfYWj+1SMBeXYnw95jYLp5h/FeKRObVkWzqPPaONS4IT
 IDJ5q58BEmZhUleF5Srd9bSXIMQDrZo=
X-Proofpoint-GUID: JLzSrmk66oOyhdmyK9CmNV1I3ioDmvIG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290071

On 6/29/26 8:59 AM, Pengyu Luo wrote:
> Now that the predefined MCLK pinctrl configuration is available in the
> sc8280xp SoC DTSI, switch the ThinkPad X13s to use it. Drop the local,
> duplicate MCLK pin definition from the camera pinctrl node.
> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
