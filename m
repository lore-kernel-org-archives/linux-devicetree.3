Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484B23EB7E9
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 09:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778665407; cv=none; b=rlwN3aXJ+j2TbI/BK08raPCeeZHHHqQ0EuI8HFDREq3vWo09UN3h7TOD3pFwOERTKSZkImsCXdLIClTZICELmFACsJxuE9o/pJd+0b4fo2isLwAE+Zu5GIP24WxEsrpFqgFjhKR+JsjMEjAl4ACo2QoCNlC1FvCAXlc90Ew62w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778665407; c=relaxed/simple;
	bh=bsGFC6Oz+4oZsRZtz+C0v/Pa5JRMFV/QVgt0tDgSjBk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HvRZJ08Io4fQi/NwzeKvF5U8ixOc+MD2p3gYRSMfhiS4MGqGAGnW4VyHFKWKds7iI0MTuKeENVa18yrEM1gr2gTfI3mZx7PPVEbECEjbZGAu4HC0J80eQpTRlvW8hHvgahZ8z8mpudZwsrgC2cCk1U6dYNnrh262KNqvKQOkGew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a7On0N/L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YgSJw5VO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a7On0N/L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YgSJw5VO"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D6FKjF3324691
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 09:43:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lftm1qpW+iLTLW0LIxnvRFze03sjAiqjQH68JFNa21I=; b=a7On0N/LRN0BlA5s
	ANmafBF4OCh2vLrg51P8RV08QssmZ6MnxvKmq9n7CYZifuuEAxQNCjq0Rx2CwQQK
	gS09JNt0/yHbfd5AbDdVWQVQeyUQkAq5wkdn5AFB9F/0KXIc/n7EDUQBgZnxBhU5
	qrY16YvA65CtNmketWkQ500KuKEQ3TbK7o+HiKzXjG8iLZOwEwJbgPqP89ZqcT+B
	GO+8BsB/ApsAFLw5rfmskoSB/nGxJnrV7D1oxVJBtQ1VC75o0SmdMACCKj40MUBl
	mUYC0bQabxWFfqkxa/jAKtVphInwaPPeTE0wpfSPudULhSSXhCXP5zKOj0pl7Vh1
	TEFxuw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4kvd8u79-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 09:43:22 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-634396ec8fdso211183137.0
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 02:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778665402; x=1779270202; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lftm1qpW+iLTLW0LIxnvRFze03sjAiqjQH68JFNa21I=;
        b=YgSJw5VOg8Vx3ucycyBtolmLzI8fO61hB3D6PGdb/br+ROIaMm3F4E3XjPKOO99Agd
         r29CTI/XgZwNW5Rx5Q9IvUAIYOA+bIap4CEWMzjDQkUweXXALxvn2JsZFYM5JL32qeFy
         774JKkKakh5kKA4bRA6wll3p09tR8zEW4A1cGyRv46lEjJPmwd/9ZTs9XvxeTUatM09w
         +1w495N534hSgevbzZo7ww4UaOqbHIaDqWgWwheygbWg+/vNmb/1ByuLLugTMqsiO6t+
         76M9yMnLzHbm4QHSPUVTrvrBh51hfI9HvPb5iNHj6DFjqGj7QMjLMWsPkZ9X2DRx54vU
         jSzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778665402; x=1779270202;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lftm1qpW+iLTLW0LIxnvRFze03sjAiqjQH68JFNa21I=;
        b=PpIGEeOsEl/DLx/53ix6Nns/LLnDhd1oKbnr+TdS9wr+p4Q9I5tZ9gkBhupwM6+LXp
         WiS1x+J2ApjapYKMzUVSBKktaohklifqim2xnwjFEabyK4LIlUjC1llkfudQHJnO4Uef
         C78q77uWkNqX/vFBPMjzwqixpnTSf+Tyo8W3Mn805g44SwBve/91fc3rn3B32P0kt2wV
         9qjdZ/jk5Rh474gT+H3ryvawsTYMs3ZB5vdfqwnv1+K56cT+TGmKHrgLm2hmqohlLrYj
         6HNhxY0UsmKa6f2SHZLR4QoFOCDoVNjvF35ntCVc2fjLFGAgmW1Yyc3dmlvX8OVing7W
         p7sw==
X-Forwarded-Encrypted: i=1; AFNElJ9+sgaiRp8WEGVWb+FMnbixsOS29UloipD3KrhsQV6lw3L9kh4rsxmMJrtfN+j7lUqURV/9IUmG0sDa@vger.kernel.org
X-Gm-Message-State: AOJu0YzClXepctiyRjcICLPuY6QA6TAvw99Rg/I4uKT7vpNtaMzKE75K
	PtatTblpGW9/DyyeiM3SJz5vBZWsu7mhKf5GMM2dx0K+I0NAgakWb3iw1IKaqbg9wQtWsXoeXvz
	sCLYp15hTx625UypjyPRsoFs8IJ66Ss5iN2Z5dfeJXRBCWLYWyQ11wnXVfC+jehi6
X-Gm-Gg: Acq92OHu6jEH5vQFPJ7tzMru3Nqpu4hXk96dMFbiPic6AsxpnyRAaTd7bSeylWzq0Wr
	LNTJ8qmc+h7dtYnPzPcxNs6dvMTHsd/RSv4/llMJ8RZRR61OdXEHsVLZCJrPEklZqNuVKU0wWsJ
	gIFeBdvShEU7WhJF1GzduyMKEzLUGSZA3UACwDc0kUKkc9HdkTRvT96cm5sADCk+ocdQhCNRwTL
	ywdQb522zlxrGXAfomfL50MJUwZ/7zaq6kNJMoA5dKLikcwcbTka5XyWnnlFICEIDdHOn77zrlz
	cU5sqww0xKszyKHeAuuEHx6g9ykxaNT4GRdpxYBLq4KPCFjS/NeGHZOKrB4v9m3GnLOLZTVS5MJ
	hlUXPbecrwIkUyNuDEBpZoF7wyQjfl2dDNKBFaf21LuvjsdCwFj3NUknU29BBsUtGGdYONi6Ecl
	rw8To=
X-Received: by 2002:a05:6102:5d5:b0:632:9ebf:6069 with SMTP id ada2fe7eead31-637737077cfmr252580137.4.1778665401593;
        Wed, 13 May 2026 02:43:21 -0700 (PDT)
X-Received: by 2002:a05:6102:5d5:b0:632:9ebf:6069 with SMTP id ada2fe7eead31-637737077cfmr252572137.4.1778665401228;
        Wed, 13 May 2026 02:43:21 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcbb2b1c3adsm717847466b.35.2026.05.13.02.43.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 02:43:20 -0700 (PDT)
Message-ID: <ca27a95a-37b9-4c5b-ba9e-7d977b0c0162@oss.qualcomm.com>
Date: Wed, 13 May 2026 11:43:18 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] arm64: dts: qcom: eliza: Describe the ADSP and USB
 related nodes
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260513-eliza-adsp-usb-v4-0-839936e89aca@oss.qualcomm.com>
 <20260513-eliza-adsp-usb-v4-1-839936e89aca@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260513-eliza-adsp-usb-v4-1-839936e89aca@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: WNihrhC8dymTQMVqoy-IeAYSumcD-zS-
X-Proofpoint-ORIG-GUID: WNihrhC8dymTQMVqoy-IeAYSumcD-zS-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEwMCBTYWx0ZWRfX0n036CjfoF6k
 e/cbQMmLVJlcVt/Awx1SwfppeWv9//0uNRiJRIEyPeeSlj1F2Vbc9PFZgAIU9EukmcolRg3WEWt
 sD7XoPjbVLq+GF9IzlW/fNHhw+0hqyYY/qr0l6sjcbfV9Ujdpe9xruHQh5JcNV4Tm7sK4HwsBwb
 44pe3qspWG2jz+cafDKcIEqC7na2kyFz5sbZUJmPyuXfhDEPAqyG2ooq0ZR8E7v6Ll73Zt2NCv3
 D1CkmZE0aGdXhZcpbZBonVJxzDjThx4FMIcxD3V9h0l9jcMOta/siq7EG0n1vOmkg8EtMErEGvd
 ksMOBiLEGqhS3+f5e9j5iroyth6MNa0DZsfaQa6K3WeUC+lBIdH6S1zjSl7f4YwmENXL6V3egBq
 46fmjQ4vKbCYNspuDt1V+xQbD8amptVZA1xivSQPMeJd6rZCPUYEt3FuIN1woUpSCsqWxf5Q8Vc
 Xtxalm0NIWbwky6TEmw==
X-Authority-Analysis: v=2.4 cv=Iu0utr/g c=1 sm=1 tr=0 ts=6a0447ba cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=68niEd13HyaExDxXyQUA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130100

On 5/13/26 11:18 AM, Abel Vesa wrote:
> Describe the ADSP remoteproc node along with its dependencies, including
> the IPCC mailbox, AOSS QMP and SMP2P links used for communication.
> 
> The Eliza SoC features a USB 3.1 Gen 2 controller connected to a QMP
> combo PHY and an SNPS eUSB2 PHY. Describe them.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
