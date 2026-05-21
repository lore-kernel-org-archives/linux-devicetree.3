Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B477D3D75B4
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 12:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779368130; cv=none; b=ZwuwwUIpRcyGtlp9rW4k7KOL678bYiFCpLeQfVyaJel/aRwKArk9kb6Hlaz2Qu2/M/CPXZgpx2n7SH0XyofBrN03p8iHrwgpCq615l0EgjJLFVrSq8MWFHOb2H6qHksUllEcLm5n0lNiIspLvA4jzPyaSphOFb9GpI12RyidSsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779368130; c=relaxed/simple;
	bh=8LqULcbNlEaRfRxZtDdcZMoXysHCtF5izaRiuTJZZGM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Imim+lcK1xQLaC6PuMqqMW6uhn4B6vubrQPdqxFrktfM1y7F+rwI1nT+LClF+dV8wlWZQD+ZVDK6JZnscpjCrwkFF+Sk92bbB1zfgqpMplHFlJdzEe4OW//cdPISPPZLPr+GxQPgwzfbEorhbzB7iNlZ+2WMVacmCGhaLAwuIX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DPYQlLot; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qf6drzuK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DPYQlLot";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qf6drzuK"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99rYY517909
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 12:55:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OQo6kYzQPwp7Eey7bUz8w7AceljcUrAzDN14KSaeFeE=; b=DPYQlLotn395xkfa
	6r90O2yzPh0BNMtjMi06lc5BZz2FVmXL7hqZvTiNE2ly0He/TK2JUhUSFiWCepKm
	a0Os+hNInTZjr9ZNpTUoqr5pSjoFbhZAffWCYrregi0KNl+120vvm8cTp5m+xtrZ
	pc5QYXJ+sNgTtjlxh1/Tpi02E4UszOzjPVYLkTMW46+Hoh0OmZI1Y++z30bdabVw
	rwShVImXc6UbuYvjQPGwfS23YVVvuRIBGn2cpcT3eUFuGBTCz0ysEaE6ML7v5k4I
	sN5eGxcdtDHJAd9Nk1XiqZOWfadfgIzLZnWA/Y84CtzqTkajxVEICT+IGNCjIJdZ
	ZYdglA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9saa29tw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 12:55:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-914afae89a3so1146985a.1
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 05:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779368126; x=1779972926; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OQo6kYzQPwp7Eey7bUz8w7AceljcUrAzDN14KSaeFeE=;
        b=Qf6drzuK78h90iWXD9Sh5xeY37pcKiKUjggmMuu6K8p8UIyX2oV2cCzx5yisLQUnRi
         2mbhHv7JFYZEa4rpdwH04n6hCoYs+2GrGZHn/psaKtwBJUy98Qvdcwh+dfsMpuTETcSQ
         O8xCtMFmnJq6IoaZ7O+WqEYontLIiahhXNldUF6syfTu5yVyQmknLpyRQ8qiiJXQg1qo
         2wvnahb9CJyP4DMWfjRy4lDPlfs/IbnTWLoyvYiiOKsWMc+cSJmyf6Teo/uyTagLRMKh
         CpeDuC3yLMCXSDoE9nHCiu6ws9/mhyKdXZLHT40g8J/tZoKLEhzmRxI+ZRXVNbhxw3qN
         TiAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779368126; x=1779972926;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OQo6kYzQPwp7Eey7bUz8w7AceljcUrAzDN14KSaeFeE=;
        b=sSbLm8+XWhZutREF22k2vhM6kMrD+kwWFkGgO/mvVb9Opg5VLHpx775rUx8kd+RQUM
         Plebh2XewjvybFvkA7kYdLuUBtbl4mdWs0foHLpUXbTelpIBFpTxNds7yTF7D6DRLZIl
         qV2ZTWg8QkHtmwvNOZXBb/WsUITjrPr5j860BkqW7xmLmq2MR/zU+BreEGnz9n8Ml5at
         uAZOyiOeVBdZzCK3OBcrUMlSmvYF9/i3Drf3td7PPpMTfJYyrXSiIBUdzuedPJc0wGKm
         +nqkC1gz5naf1baBlcAHmdFP8tMiQT6QSxyb73Lxbli4nrzt1qPcveB/RWYdkRaAgL9y
         QoiA==
X-Forwarded-Encrypted: i=1; AFNElJ/TEBx9BJDZU6+IZuHeDPJ2JDLEXDcmuA1ZXsd3x6/9tXCq17USxzqL4Tvxv0EbuNPniKbydg4RxgxY@vger.kernel.org
X-Gm-Message-State: AOJu0Yzrq3clZSmKBpkT0Vq2ohDanFkJEOYZwtmkGpeSkks9md22p2WZ
	cHopU5lLWff7IF6oa5rwQUq+LGvVwJ1VnTAMZ/VZWchTl3KDd9CHliSAjTNN+SMuUyjy++3aQ9C
	Pu2kdwvaD/5l1CxtNStW0Wi4WKYmLKDuN8EAFqBte484P302IPrpdlaEVduNE6WmRs0JgJqF+
X-Gm-Gg: Acq92OEPbWhnlgNApQ2TtbzyLIT5czavOtIdRYh5s+/1mIriNiNtneCtqNu7dA1Qc4a
	hGmoUjEgb3ooFMUvSvW0rhr8ipsOPFFZ6NkDfdybcEhG3l2XC5Mzsm1/pBBcRwfcAAVrOdwJazX
	d1dIlegmTy+jasPKx21CJc5ehHTPIJUlyp5kgw+V5LEXtimoBnG9t873LafRhsV2d/NCah/hBES
	5DWB8Rt+Jx7AfE8IJkvAvJiW2u+aLW4pOTi1R+Im9+UhKo+foCLAMuECB1YqwhDkoe8nv+CKjrG
	qxhiejvrcpNaxnYwlpqJJWiYe73aWU8jwuwpwwj1ThHuM0K+A8JJ/bj51PrZvW10vi2f5yGIMBZ
	dsChMlYsnQH1i3x9SXujj1rf1SQ091KaZxMpF0q7jqrzmeKTBSeBRwXRxQAiozyX+HIV9dq5+XW
	+ccNg=
X-Received: by 2002:a05:620a:198e:b0:8ee:f43a:bb63 with SMTP id af79cd13be357-914a28d6c97mr262357685a.0.1779368125655;
        Thu, 21 May 2026 05:55:25 -0700 (PDT)
X-Received: by 2002:a05:620a:198e:b0:8ee:f43a:bb63 with SMTP id af79cd13be357-914a28d6c97mr262351885a.0.1779368125055;
        Thu, 21 May 2026 05:55:25 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bdc8aef55b6sm42160366b.58.2026.05.21.05.55.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 05:55:24 -0700 (PDT)
Message-ID: <a3a02f29-33f6-43fe-8c94-584994657809@oss.qualcomm.com>
Date: Thu, 21 May 2026 14:55:22 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: crypto: qcom,prng: Document Hawi TRNG
To: Manivannan Sadhasivam <mani@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
References: <20260521-hawi-crypto-v1-0-9176a3b51bc0@kernel.org>
 <20260521-hawi-crypto-v1-1-9176a3b51bc0@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260521-hawi-crypto-v1-1-9176a3b51bc0@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEyOSBTYWx0ZWRfX+ktLjf39MUrc
 6N0bnwjIwjGBdpnv+QvGxn0Wr9ILxMv5+x9TVYGrf+Tfh61IJ0dOzZQoXRy+chS3ot8nRcTix3h
 IMTPZQzL0TtMGC6aDQWBL5Lw7coVPs8DXnTku/+3JlJGgWwFLoq3vHGlyj/Hk4N4LVYr+HLC8ox
 itRk0yvuIcT6j/7H90AtzGzpmrq4HAXUviDxXdsn2D1AJ1WFt3DpE34+qkHvBLgdLTG/g5KVBiS
 LctVTr3Dwlcu2DXx6RUpC+lQYZdsespNBI0o/DpsmF++ZhNIRdK/4HBoLaKfVqAjEn1xEHDEK8G
 Uflhgcuunf/HMKXJ41G1iW545grJWJUQThutQOCdp7DysYtwxvtYgFDQKId9ggShu2wh262zqyJ
 viT9SwoyPTdL2goD7zViXUILM4G7qhvtkx6LSD6Y7LR83WRYkz9P2YhdDMv7WciOAe6aATu8iib
 j26amFWPHsvFofmFDeQ==
X-Authority-Analysis: v=2.4 cv=Qe9WeMbv c=1 sm=1 tr=0 ts=6a0f00be cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=1K6-wu9-lYFVRRv0r6YA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: yStrXw9I7lBz43MSQJyD5TILjOoEPMq-
X-Proofpoint-GUID: yStrXw9I7lBz43MSQJyD5TILjOoEPMq-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 phishscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210129

On 5/21/26 2:36 PM, Manivannan Sadhasivam wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> Hawi SoC has the True Random Number Generator (TRNG) which is compatible
> with the baseline IP "qcom,trng". Hence, document the compatible as such.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
