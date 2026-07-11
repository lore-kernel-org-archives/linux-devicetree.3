Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FEE035893
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 00:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783730822; cv=none; b=P+BAbNiGfRxEvJiK5dAPXKtl+FecPau6YyAC/djyDTOVCxAW0XWHhpGE3lhhI3BM8XArmHQTVwC/S0XvxXS7Bk1vD/BVdlhPKPQ8fa5f6qGHUbqv56W09asIK2LvcghCx18ji3h3tPx/S4TLbNtGAKUMUWXyvYz6GYMAs2Vsl4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783730822; c=relaxed/simple;
	bh=R4Rs7xhFZTU3mb0GIkP2MXoGgKeVejhFo/bw1Rws8YE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d91usRvQ6MLOif2K9KA1+eqmrYBf+Jb4qqU1oieIgGCfxkF/tP8Wilpw74c4+Rv8VoFrl3ZnYdPutwoG4wPOG4P6x4fjdjf0YNFb0y7fy3KULxNCE823pESaCcc7vXCdF2sMfP8hdRyhIS64hQPHeDDXe+4JmEf2XcZww7ojLzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FZoeEOOm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I6bhVVye; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FZoeEOOm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I6bhVVye"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ANIFfW2104539
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 00:46:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BNLAaq8lMnoNaNFRUGiCyDQLbXvyZcNLq3BCSpGo7dM=; b=FZoeEOOmNynVMum+
	nV4KrR2QfX2XayduYDoh4AhrWBCR1zJtO9RFpdaeSA7ME1r5dhzGLgyNRYe4RLxo
	NCXhRF1Aq6WZnMkiJOHgJsVAnMqNxkAUlTjLlTp7e1tksejD6TI3q2zLcE2eGWQg
	rOgYlG0Bmfr3bjCkGYtaMHiU7GH7koMu366I3QI0lz5WFKSDyGsqSZ7GHXFe3uZ/
	cfwfj0A7/pFEioUo15A6BPPf3aN5LfJcVJiq+N+EaJngGHSd/0/Nr/qcg1rP6HX4
	jBAZUoXgyrMqtG57GV7J4jjN0ZG3gtZ394lkDQR0Ku7sKOXpYZgB4vRYiui9QELT
	9siV8A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fax5djvrg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 00:46:59 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc640dfde3so19535275ad.1
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 17:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783730819; x=1784335619; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BNLAaq8lMnoNaNFRUGiCyDQLbXvyZcNLq3BCSpGo7dM=;
        b=I6bhVVyePat+HzAUsEu1I8Aw2rw5QneesGI42AdwvoYY1XFuQQ+/SQqGmvqS3b6mg0
         SON5dZlmVKx01Wm8+3crtIuq49iUi5G4QcEQrFELjzM61FrDpaHAgaHA9pzs4CYVJe7H
         nvMogyEF79u26/H/XeWH4lMgwZFbb2n1UGcSUoYmmWFrRH+ZtPbvnZfIdRUJ73xPcJ77
         NQd/ITBX7U5ZT4vUBvQLp3LWsRXu3X/ee0w+huavLmjM3BLhSl6F2lxM3vJeXmv7hEy/
         vnoYCwU96EtKzPF0PedALs391qxb782Vm2U1XGWaCcBFUQbyzETHMcqU7ETW/FdRA1jR
         /PPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783730819; x=1784335619;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BNLAaq8lMnoNaNFRUGiCyDQLbXvyZcNLq3BCSpGo7dM=;
        b=oSLlXlDuaHXB8u9r9bHzTq2tNsusCKB3l//MDPvfL67t4nExquFC3ilu/1mLVwunpD
         r4ItGGzZJciSsyKP5hmZiB84UHGjlmXxznUkzR5TOSC3OyEcgVpZCu9EvySLZl1U0ny8
         59nmEYiycw0sM7QjkNfcnjuRvCY1lZtgugNLe7iFntkiFcbGBWAwGa5GTXhAW5XPyQfZ
         EicXFCcUkYWztn4553NM2z8fV9CFXBfLR/QYDlODEqkt1sar9ljZ1EKnC6zcVDLx5IPB
         GFCL9aEbLec/1bswzeIiHLfuwlLuddHtkbXJbtggd2YyNG/3TdZt8Q0m0VY3SqOyP1je
         aEbw==
X-Forwarded-Encrypted: i=1; AHgh+RqHQ/5eEW/X3a9aDG0v6AGTvWOU/48ZXflCBJqEn9HlKMCOp3caxakvmYMzlcUCR4vuYOdn08FurCfJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzHs/JZChXb4IVbPa+YtTQpHVkitqAEJTslalbOEsM+VvpcPYE0
	Dn8/3CirnHWQfd4LazPLxnM5d6mTb28EBo4nNsNNVGmV8Ihg++LYtb/+KHVYvnrQfWkz6ye0XWr
	copyPGMSxaGkQGzaIp+t7nXmAW3Sh6gHIrDNanNXT5fKmSHhk+9jSiYsu72XVXcEp
X-Gm-Gg: AfdE7cnuHBzQlSKbAL7m7HuMGHXMkcSnnFoClUAQfrntq9Yos45qbVaEfE8s15vshUu
	tYOE1LabIn1S0Oyn3GUGvRZankykuawTE86e/eOcx0V/E55YBJz6D60mLb3+EbagjolXC8wLsal
	L7B1ztRFLX2JK/YI0SmMTcnVS4e2AMU5FuPzNdPMLeHkD0cLR58PFFoFVA4xTtFE9dbCsvUgWYc
	dgcOJg8EUT/Ubd+KcIEtxcRjlW9CbhTcHbq+70a1xu63FoGNXy8TbNlD30ScVriTEfvxckUh7Nq
	jayKyAly2Imut/XjmXSWpx6DY7zXhr4jsCdjiuzdMGgoy8Z/PpLPDtKE0OGh0XgO26uSDuS+4iz
	w8H+kIthYHrEjhoUEDm51x3DRW7Zd4rtADtHEXfQ5zjYVtWUDuSOBlchY74I8YpI8oIkTduQn7O
	Rw
X-Received: by 2002:a17:902:ef07:b0:2c9:c952:6e9 with SMTP id d9443c01a7336-2ce9eae29e5mr14108365ad.2.1783730819008;
        Fri, 10 Jul 2026 17:46:59 -0700 (PDT)
X-Received: by 2002:a17:902:ef07:b0:2c9:c952:6e9 with SMTP id d9443c01a7336-2ce9eae29e5mr14107995ad.2.1783730818551;
        Fri, 10 Jul 2026 17:46:58 -0700 (PDT)
Received: from [10.133.33.249] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bf92bfsm67000665ad.28.2026.07.10.17.46.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 17:46:58 -0700 (PDT)
Message-ID: <a34905bf-7f93-46bc-a9b7-ec44f36aa0e6@oss.qualcomm.com>
Date: Sat, 11 Jul 2026 08:46:52 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: arm: qcom,coresight-tpdm: fix bracket
To: Manuel Ebner <manuelebner@mailbox.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Tao Zhang <tao.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260710080523.428548-2-manuelebner@mailbox.org>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260710080523.428548-2-manuelebner@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzExMDAwNCBTYWx0ZWRfX7IAbzqbez98J
 tk/fkUCZjOFXU6lwuO8qjDQE9Uz2O7yGCT3T3cK/L4kBZ+ChrOlbn0Iib41uGiKZdzZj2GBDpQn
 ZRkDV15UUiU7Fy/qyaWLRQRS9N9SPoA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzExMDAwNCBTYWx0ZWRfX97l9jYsqAcjB
 TG667asN6EFRsXI6issl8Oa7l4fdRfSZ/BdRHwRRUZm0vz2qqo79H10e54O/Q0nAn48NBBjgmiY
 FLlxiGgdAHNlqgijcb8+MEN8uPRMKPOwOSipFgKOpoJ+c3wGPwKY8z2dnIg5/BcIpj427nLxKL5
 a95FUtbV9c0pzE3lQkM5/hIC3YUFLAIEQt1h1anan5yQ9P23o4ZHUAqM4AWfllcpKPGgBAzG8pH
 eTcrs9pfRIYDhWkHN4nvz7asw7u4nvgBmmttvtk8+QNMfh2Ahq7GbLddkJ3/atc61Lu8QYzxhl5
 FRocoDepc5N8fL6K1m4DRsDWdrXixsVnqo1p5Wk1QOdMvr5LymcUQ4DUDoEddY7hms0yglDViwr
 frPz+SxFUAKwZp5qiK/egbEk1p0qgIFsXgrjIbOabsic3N3toMDnJ0FMMPG41N6IJyMgbULA2YK
 /l5r8KX49JQhSO1XfCA==
X-Proofpoint-GUID: 4dXWRWB7W_pDglWSvvqts1_etEa6bv4z
X-Proofpoint-ORIG-GUID: 4dXWRWB7W_pDglWSvvqts1_etEa6bv4z
X-Authority-Analysis: v=2.4 cv=M/x97Sws c=1 sm=1 tr=0 ts=6a519283 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=b3CbU_ItAAAA:8 a=EUspDBNiAAAA:8 a=tyIhYoOGzA4zFAWON2wA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=Rv2g8BkzVjQTVhhssdqe:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_07,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607110004



On 7/10/2026 4:05 PM, Manuel Ebner wrote:
> Remove needless '('.
> 
> Fixes: 6c781a35133d ("dt-bindings: arm: Add CoreSight TPDM hardware")
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>

Thanks for fixing the typo.

Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>

> ---
>   Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml
> index 152403f548c3..c7301f1b28c1 100644
> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml
> @@ -9,7 +9,7 @@ title: Trace, Profiling and Diagnostics Monitor - TPDM
>   
>   description: |
>     The TPDM or Monitor serves as data collection component for various dataset
> -  types specified in the QPMDA spec. It covers Implementation defined ((ImplDef),
> +  types specified in the QPMDA spec. It covers Implementation defined (ImplDef),
>     Basic Counts (BC), Tenure Counts (TC), Continuous Multi-Bit (CMB), and Discrete
>     Single Bit (DSB). It performs data collection in the data producing clock
>     domain and transfers it to the data collection time domain, generally ATB

