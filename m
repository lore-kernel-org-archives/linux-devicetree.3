Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78353A7F7C
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 18:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778698539; cv=none; b=Re5MB7rLrpG2wDBRyZwzYBtybuAuF9eapQ9Mh/wDtBwnMWIoNWHkYBnfPWvHoPF5VATuX7o+woX7UtH5kGChKZ++tKutQyq/0uiJR1pNRWRvzt3VRNS3olxmF8+eT7H+Sh1CtcCPx0jPoFUGk7holOEZQtBGishqu6MphAS0yE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778698539; c=relaxed/simple;
	bh=7d1MCfAVLf3Qy1Ocyr+tLbR08cmldGisnRLHy+zPlU0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j/pjiwUtTaAUPaaP+Mf4f7LBmzoQgCYm+DXYRWvoAHiUvHRudh7j5EnGyPp+bMWlrVSLcD7HjqPnRKCGv6ptqE08RTbgKPKTRGh/TWLcodsYVcXkc0rsjPSeHSZBxiIk3pkFBunrgsgno+WtpW6u0vWYjC80M7qQU8me7Yzf8bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ipli4z7r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cnbi6zYS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ipli4z7r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cnbi6zYS"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DH4fD93430126
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 18:55:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LzeRmqZFTja2xkxb3awaacB0WgZ4dRBKwAgkhMjHsPE=; b=Ipli4z7r9MYmSUKv
	Uxuw7+hnFKKWSrdcYrffyUEdeZLsqZlLB7URTNxUI6WVvEg+pCoJsKg9vsFsLGtq
	1ymy6NlJ0pgME+JDUNEhMl9zbLid+lZ/6p0E/cFX4qLsWek7RAEQIV9RyFuJ6QiU
	c5ILbA0+JzwepAdqAySkAXV/zKzLxRUsztgseuBjcGbset0WKxtn29XWtVmBPG/h
	5R3HxbDG8uH9jI/w1715Q/bkJT75QbTI3UUWHx3Ml9jm9NOVzHstDSYGCy6BW2Xp
	LkJgPjLHNcBcU7RlB/px8nEK+N5iMX26H5YS/8RQ22yntkINW4WjK8LMCvkSVB/Z
	g77zqQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4qmcj1hf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 18:55:36 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2baf7378ad0so59108895ad.0
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 11:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778698536; x=1779303336; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LzeRmqZFTja2xkxb3awaacB0WgZ4dRBKwAgkhMjHsPE=;
        b=cnbi6zYSANDtHdsAgp7eej0Hlt1vrSK5pPOwMC0ATKnxQdpROh0v8AetTesen0MEaz
         DPQ7SmOPJ8/keYaC0PnUMOZ9vszUnlsC6fr4/nvEerkMgeQnvc1j26CDh/O3K4Ty7Qat
         4WbGZNQ4KsWY4golXquudfB6+Eaotun7uObQK2zsnGbkocqe+PoCSmB9X9oDmON5HAzK
         fJcF9Aa0K+5bjLUbxF3QuXE2wHg0SnJO8Zhvl5/mNbFXkMciV6jr53msCTyUOxxr5OiL
         DoUFwotmaRFDERApZFI5WlewgCx3AIedbI2j85kY2JHk6cux5OId6mCtys/EkrrswsZD
         ztaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778698536; x=1779303336;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LzeRmqZFTja2xkxb3awaacB0WgZ4dRBKwAgkhMjHsPE=;
        b=ApSyP46U1899lrkfYJzmvhP/BdgYZArVeM+AwxN7X5RN7GQ7ajzukiCoUmbsfgs8IP
         knl6stZgP9zqVyosTB1Ly9Zqf08PogylcImibpDU9gAM4WkfbXj0lFP1beaTjEhi93CP
         lV6mkV3Az90et0SaoPADYQhwfJexT3bZhMsamXo8t79g6jdxLKDJx6O+Tn5mZ022rxh7
         MZOyPCbummJqsGK9GoSsmpiQ6ngVZn8BtyHuLM1e5PZKusYDWO4VOlDFkwzUObuQXU4T
         +a3Srw/Wea52TVHIBUHqTCEDOH6VMco6V7AcId28mtnS9ZBtnBe909rtz2ifYhL+vkTz
         Ctdw==
X-Forwarded-Encrypted: i=1; AFNElJ939uEeN+zj+nJTl4Tgnx1gzN8OAIF8LLLnGayunS6QpmdSytLiEolaPNQmCu0hfL+oHH9jZH3ooAQt@vger.kernel.org
X-Gm-Message-State: AOJu0YxTwSECDjfx0zvXtLPC9YfL7W9+U3usBJjg34cISqK9iUnV1lq/
	Vp2LIOfstMBHT09MwjtErUHQB+kPMtaCbK/X2I706+c60NNW3ylWlOb+xhhc30wKVmd6U1aFVci
	TW7BIsh9Tk1QGTIFOSxBgFCzqvtNDjvMHv33IB5o8EZXHXd4A9PjEhnPbNApBeXK4
X-Gm-Gg: Acq92OHc1gMDAw8Kc3UoWOGDxrXXk6DOSyoSmIPqBkFh2nFqGk9/dwnMlmaXPWbUJoy
	6lKajUSSc8/zIBGdwbwKuU7MVG6gD+DAsOSteUkG7kzbJo9W3jRCoJ6WQbmAVPz18nUMux0DhK2
	1nWtupRzx/MuUl73TLcllTGRgyYqVF5zCquj+Ss2+J6Xwld437IUsrRkbZsZ70hmGkijiyzW4yt
	LIZhFodWcJ7VCmnc7lc7ZlYksBHhVQ4WLbvC8dkQVDMlrtc/EWF6x2Nu1+F6j70+owTlulFoFn5
	9676fhrLusrJl7JrBhnpFShXCrO1fG1noQXt0x8X/2/wPxIZ75kitD4Sxwjj8Pi6UAs2/gsEcfP
	SewYhMfS93lfi/tFk+80A6HjkmunXyzgIWPvJchkT+ryhMQeVTZrFx05o/Mh005a4
X-Received: by 2002:a17:902:d486:b0:2b0:b290:f2f4 with SMTP id d9443c01a7336-2bd3020f39cmr43465785ad.32.1778698535780;
        Wed, 13 May 2026 11:55:35 -0700 (PDT)
X-Received: by 2002:a17:902:d486:b0:2b0:b290:f2f4 with SMTP id d9443c01a7336-2bd3020f39cmr43465465ad.32.1778698535323;
        Wed, 13 May 2026 11:55:35 -0700 (PDT)
Received: from [192.168.1.6] ([122.174.188.197])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e99be6sm167582685ad.68.2026.05.13.11.55.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 11:55:34 -0700 (PDT)
Message-ID: <227972f6-7de9-4b70-ae51-c27ab5532c01@oss.qualcomm.com>
Date: Thu, 14 May 2026 00:25:27 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Add support for qcrypto in kaanapali
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Arun Neelakantam <aneelaka@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260514-knp_qce-v1-0-0ebdac98e50c@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260514-knp_qce-v1-0-0ebdac98e50c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: vJwBz9o225QlAPnn8ZBZAPXbapU-QfCP
X-Authority-Analysis: v=2.4 cv=Hu5G3UTS c=1 sm=1 tr=0 ts=6a04c928 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j3xDveksUu0zlk4lKs6shQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Ha7b9SRUxfVPAdQjIlEA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE4NiBTYWx0ZWRfXzBkDUOBp6fAr
 E4f7Wqj9bPjgX+X9Y6/gZwAxckEidMPV5bzoobYzOgak5xtu3hJqWyLuGWIQm1q3J3b3hnUF4U4
 4jNsMgE9W9IzlGuAMi8JWwxXBYLzs/vK/zMy0nQAYk5AK28Anc2TNKQYOl4FVuzpqm9BNyOExgX
 pFwmwyoImOhZyp31/n/d7ZeUi8w7C7ZPhtomVb6f1K4oUQcfP+jRyUCVpoa5gnqjD11hkyxfkx4
 J/cM4G9qDqk5QQGNyNRXPJL2Tv5kYMtYho475slTzp5s7+/i69ob9EyeOrMBH1On2i4Sz/NF62Y
 /ljH+7rrmkCw0TWFLNaZsITf+FauCW0x+sk24f7E0v05xJGxGG4tZMDtYQx2/5F23AE8HJlEA/4
 v+b9Z3nS6eDZVkfbEBOsrU/TrklcmuxRp+h3Ey1gKNyFAhhh6ON8GRgGG831/UnX8zwBJ/Zqdud
 M9TZowzkC64dP3xkbtA==
X-Proofpoint-ORIG-GUID: vJwBz9o225QlAPnn8ZBZAPXbapU-QfCP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130186

On 14-05-2026 00:10, Kuldeep Singh wrote:
> Add qcrypto and cryptobam DT nodes for enabling qcrypto on kaanapali.
> Validations:
> - make ARCH=arm64 DT_CHECKER_FLAGS=-m DT_SCHEMA_FILES=Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml dt_binding_check
> - make ARCH=arm64 qcom/kaanapali-mtp.dtb CHECK_DTBS=1 DT_SCHEMA_FILES=Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
> - cryptobam and crypto driver probe
> - kcapi test
> 
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

Sorry for inconvenience.
There should be v2 series instead of v1.

v2 series is now sent here.
https://lore.kernel.org/linux-arm-msm/20260514-knp_qce-v2-0-890e3372eef8@oss.qualcomm.com/

Kindly ignore this series.

-- 
Regards
Kuldeep

