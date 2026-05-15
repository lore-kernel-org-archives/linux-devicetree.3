Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E026E3CEB89
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778840614; cv=none; b=nCizEo5Y4eVeBaRwWLEghzTFO5jjuznoGvCKNNUC5nGnnwf0o8iGVcaed4sfWHwDBaq3BTsexZlVwsc1F6fr5lmzUwDw0tnzDbZJQYNBviOlpKT4yE4aFm5MpPxcigGBY9S2Q926Hb9US+1ewQwypaMQUMN22FWuqiJcJ9UFWJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778840614; c=relaxed/simple;
	bh=pZ76TbMX4N7htg2RAI4fS928/r/GRKeHeguffESCJu8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E0VwdvvGX9x8YAjjCemBPj/CnqPQWLkfCiscje4wv+NAStnq6IcWyOVb8EZyYDDDRpwwUS/J/AWRzL8G6CQ+xFHSlKbDTSdfpBbx1pKWL+dTP8Fw7waoXjP2dGx9y6EgJKHZrlpVN4HhjF9X8EWkAZTSwHVLm9oq8ykvmPUpttA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FdG3Ib57; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cx8TxuBF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FdG3Ib57";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cx8TxuBF"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5UsRn3197968
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:23:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3ETCVPXTODOoocMFiNlNMTzzZGmzPrE9yEP2xRP19K0=; b=FdG3Ib57PELZQWuj
	24d3LAte8Mj3SW/VG5/T8cv+eugkwkPvDNOsmdUgjMVls6OFC6e8m1eWViI8dOJ1
	/NqdGTBfb/gFD38m+8sdjBUIEUsuXfzbsbxxt5oBfw8K2xHxZgojW0fuhnW7ziU4
	u8WiWFcJoIN9kO6jLduqXRv2thvceQU704V5ExgVHYclPDypZfQnGDNcjjF5bsFO
	slMmo4OnZGvooDmLnLZlqy2L4Nbk9OM8rEnpaFEL8Vpw+b8ALwZ7g0/IwHPrhkkN
	a6yM09+D77rVm8ENjxux7OFzB7U2v7oywtHc0b6P6Lg/dSFKXqrvJyXW7EWMbb1m
	7r+NXg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1qatjd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:23:31 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-56f8a5c02b4so745847e0c.2
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 03:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778840611; x=1779445411; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3ETCVPXTODOoocMFiNlNMTzzZGmzPrE9yEP2xRP19K0=;
        b=Cx8TxuBFk/Ro5oZRnpRGkTpt4rJkrEVskDEo6ynd9YpTmrLTyyqsDjdDamUJte9GtF
         hAwHpacBDwFTgOX4JdHJdVKCen+wWCzFR0ppXKxzMB7/KUmEOfyVx04lUXYZsvc9hmI+
         QorQRolcao8v5c3frcYJ/BAV+D+AKiFu5+3X3rqcLWxY8j2jFBw18gM7SaENYcc2nuCd
         mxHW03+753bDiwdOQrBmh8C8AwzpwITrnXbtkt3ZB/GCaSK4OWZnld8z2Brznbw09pGV
         xRJo7OCT58udXujA3+cUbxSDItFdSWZd03B5bP8foAYrk8nnEEcK5oyd+M7R29aZtt6G
         /88Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778840611; x=1779445411;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3ETCVPXTODOoocMFiNlNMTzzZGmzPrE9yEP2xRP19K0=;
        b=hP0Slc+D76AVfwPa/Djk+4rMTzWzJeoAKy7LYcEmtI1dd1y523yx6C3ryHhVZgseSu
         bobW7q5H2Uc6cOWA4SI9LEXUBWe/DJ2Lo0s1+ASAWJFdIZnRehj6xXOoWAg/3yQv/CD+
         P2baVgyO/lmZ/X36QuVXMGclXPmpFmO5O5uNLiqBbSmu/WsN+py0z0SSJPO6E6qBzGpI
         3V9TCChojdy1seafrsOgpd5E5S/b8UoRul/QDL3jJObPLUV2yGRodJute866Rxq2IYvZ
         fmNtG9aNY5e7Wv/sQLWXXo4F0f+lo6jcZI2T12b9yZTCwdTzNyVNK872muAxJh2Uenmo
         l5Xg==
X-Forwarded-Encrypted: i=1; AFNElJ/2hEfgIf9KKFTJehwun3Q56ubCICQ84x3hAi6X19YS/Q90ph+/iXcJYAdMEboymXj554v31keXxksL@vger.kernel.org
X-Gm-Message-State: AOJu0YxwsZ/afokYdLh8wocLaoeMiJeyv5UrbFBzrzwHgyBnuYhh0rvd
	Vx+L9lkS8DXqgqD5JunKzDL+zr2uXK72e10OurBC8g/Z1zW6wrMjsCQoWypZSKyAktChcdrJ2DN
	udF+93e+TWtEtbTRd0dI+zSJ9ZhF54bsJgojVnP0YD3G0BrC9VPimiW+Nslcc9pyQ
X-Gm-Gg: Acq92OHPkEifOzg6fJ9brTLMPGKW/LgbNFrYjcmQek5K5WVIqDfiqH56Ln++B3SQotV
	N55v97VzLEXGrfaV3W9Rl7IB8gN6HEfL9exjBFFKZA962dnOnkUv67Yca5Yba8FvJxh71JRmvcm
	OO3s/PoTLTAYn1ltI87rIFCZKM7OrS4S5oLea+BHHKf+MMB0NAfa0l3TvCNGolvzwmRbCz0chdi
	ffrhhSPWcEh7aOdKsVIjTNaRtK6YV+vkQSAN5wtrx0MES71FyiNltvinIReTGuCyHVUaPJpY8eo
	BFyzu0LhdZY5UK/fSigqgXBI0uQWavJnOERW6mSc5F5C+fVVl6sNapJpfGUpq4M+cRCizCbeFEx
	w/q2lkxhaVamD8/NGj470xa20QRDdqD/puvnUxwfC1R0DGU6ouEWpAZRrEqad705+99pSKEQ68l
	/W5uY=
X-Received: by 2002:a05:6122:4641:10b0:575:99d9:cd15 with SMTP id 71dfb90a1353d-5760be5c90dmr579436e0c.1.1778840611220;
        Fri, 15 May 2026 03:23:31 -0700 (PDT)
X-Received: by 2002:a05:6122:4641:10b0:575:99d9:cd15 with SMTP id 71dfb90a1353d-5760be5c90dmr579428e0c.1.1778840610839;
        Fri, 15 May 2026 03:23:30 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4bd1124sm204718566b.1.2026.05.15.03.23.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 03:23:30 -0700 (PDT)
Message-ID: <5ef3ccbf-c6f2-4d34-8500-b2de3ecc7de8@oss.qualcomm.com>
Date: Fri, 15 May 2026 12:23:27 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dmaengine: qcom: bam_dma: Add support for BAM
 v2.0.0
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Arun Neelakantam <aneelaka@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260514-knp_qce-v2-0-890e3372eef8@oss.qualcomm.com>
 <20260514-knp_qce-v2-2-890e3372eef8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260514-knp_qce-v2-2-890e3372eef8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: IuwSmcgarwKYoqYH0xSzLplNiw3YwR9U
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a06f423 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=0SJdTa_k44cpE2_h3jUA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEwNCBTYWx0ZWRfX+0VaySinXQg7
 +Gk11FBieQWtnqpwJfkoVChmhpw9tTi6xxdCdu9zQxRdGQceDoFf9+9GeaDDQW0IDn0nkGAz9Bm
 uKUSO1z4xEwP30LQ4076zs1/VKQGBT1RcCK16KzSkxxGq5sqlXgVhrhnbD0pCPSBcPx9ywmHYLC
 jdGq8TL9Xcegu3IwM++noq83t9M6uW9f8mfs6pJkx0Aei+Ffku3Pz6aaRfUl6mzkSNebg3kPdW/
 nb8g85R1aSn2X7LS4bZhdkNmLTcr0OHu4YbZ1ry1k6uQVvQ+mnsGwyRKKALTH+7kOhuUwyvqXnt
 yrf2x7u0AE5V1HCVBJrwfizH1LmLIB0N8hXNBnDra8Mv0ItwXX0gh2k6dRO2+/ZEGT/wHAP5p9p
 lNYiglNu2m/schLT6CbZLkR4tMi8hNLoRa1LnGWzFGmpp1Ke9TeUlMEeReCms3f2OCs8wr+YIu4
 ZBlTpEusvwUHyHOlEKg==
X-Proofpoint-ORIG-GUID: IuwSmcgarwKYoqYH0xSzLplNiw3YwR9U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150104

On 5/13/26 8:52 PM, Kuldeep Singh wrote:
> Add register offset table entry for bam v2.0.0 version found on
> kaanapali.
> 
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>


Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
