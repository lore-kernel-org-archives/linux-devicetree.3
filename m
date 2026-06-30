Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C361A2F549F
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 13:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782827814; cv=none; b=pT4o3sjFzluSVXDKk5xIzlkYu1NPsvrJghmH3xs263Ct4RHoCEM7mZYH85ObXa4qDh3+LRFNBzM/HgOHxillLFQTpUd4DsO0PA6DJ3AN3fNfolKOaQnNRc6Q/VbDm1zsxDw5TB0O4uAfexS5/qZqYbCaIWM4TTRNBoycIaB5e2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782827814; c=relaxed/simple;
	bh=5Y18P1OXhI2wNiiZ3URLaQNonWt7gRHonLAgtQlX/aU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PUxLbjIAdwAZw1P6aHkfkeJERGg4ezjabyimFmKw/a/lkIwijw/8vshfd0kTyG4A9q9Rzbs5PHBRedFUkO5+E8eW2w5TKr/6Xym71Q6BvlepzilzQaySAMeQFs2BCCbg+feVB72DEDZkKBMfgELtu4QylXoMmsPlZOhETRctvho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pV2WMVe1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VL9a5PYK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pV2WMVe1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VL9a5PYK"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9muL81522297
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 13:56:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+TMcA/OjnsdSU9logLGCJgI1OcslBQgls9mCJLwsRoU=; b=pV2WMVe1L3loPsAs
	KfJkGEDW2Zdz1pCIvj154ylHL+vt/ybz7ynry38mHjJVtcjLrr5uVIdDrsB5YICR
	sekLeWXV/TP+9fQS03XfdjemuZimlCBZBUyXNh8+IR19MQmM/MVJ0rShZ8uoupLP
	Yx7BbPsrOFBjBgVY6cfEhZGv45EboeGyh7pmLzXQrvc4Yf4bhlJ6R0zy5OIZJTzu
	o96dZa+fFzqFboIMLRgm3/5PNW4MZINW2nuTEH9X2/OK2Kmae1jOPajonOfmiD+O
	2sYsmzTIWjdstcw769qaCIduQbK+4oOVYXpyMQRaIe5CxhShYGkDgl1+0jnx9JKw
	DkBuuw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3yw93q1n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 13:56:50 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-96929cba004so120974241.1
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 06:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782827810; x=1783432610; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+TMcA/OjnsdSU9logLGCJgI1OcslBQgls9mCJLwsRoU=;
        b=VL9a5PYKL8X44wGBLZGRJgQTtcPZz/lEESqgBjojXgyMHt5UX3CuIP7rBN1Ks6AVsN
         tW0PFmsRQdNk4cE+y04hOcwoAKmDQvRFroOZbk1sCMlOMGQnbjaQazH3LJ+ACzoJI3gE
         q+JYXB6tsOqfibcdAv9vn+iPFfil4aNS+ZKEXFzpkX70e4pXSiVsZG75YoAhkU9n/4Fu
         +retVJUOLgQbpRLYPEo+rw2p4D7uSduFzs5gk/IFmcnMnzhBouCew2pEVzcZrZ/Gfidq
         qUcVsTdNJMxtgAhHd4bnvJXGbldNHLxTHRjYxMGWb5lZqkGGAR09Q7ygT8JW6YZbCx0k
         sdtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782827810; x=1783432610;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+TMcA/OjnsdSU9logLGCJgI1OcslBQgls9mCJLwsRoU=;
        b=dg3Ub/EscXTqmmmwPg7zgdS063sD4KOH4EQN1CKB8m8B9LC2uFZxv4eeRfBo5+bGY5
         k4OYLGdF/eBntWQDL123so+paTC2rLAyUmg3FflHNv474hr5puxQ7SHCBnp2mKlq65sK
         XX/3cXkehqv3ejLsfgzeGq/MSoGvWOO5F/CmELyf80SIpvclO7E5c8YNxML48zRom3Vh
         uhSn8iJzI20YdG95vK01vKb/OK3epNPIcN1dIqilSbCg7WBPJ3UIOmQ8Xz3B9kQHwMTi
         KKj3mlb5kQhTHsSIXr6fQ2r5xcsMb+czXTmcXx6ifZ1te0IhjwggSgK8zRDcUHmO5z/h
         lF6Q==
X-Forwarded-Encrypted: i=1; AHgh+RrtgDINHCuzs/hkbCZ9wr9LWpYnjUUgi4oTCulw+6fnMk2FCGu6KENeCHVzC+t3e3/zeN82yfunF72U@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy92jCRw1Qv7a2fx4xfua3o45b8nPk7uVsQgqHDm14apNex1F1
	y8Uymxygi5Lv3U9NXcFK8g6Wqv8zgJM69jJtktGLtbaJfdB6AgOwSNZvljPOXHBub/+h8tFKbxc
	vNYIJhKsWt39mAf9IoDImSI6d1aHIit/IzIrb8SuOPh/o8ZosNECO4r9KBtwRXVbP
X-Gm-Gg: AfdE7cnR6LBQGxrEJb7HTAOJyEEpPohuJFlbYDJmUCZ/g1JVjubidDk5U4+kK2OLpKj
	X8uxF6FrvIrkj3dgy2n31gw2TFMMijhIYHCCp5veWCekRJsKTWVJMF+kyJALcZu8760GN9s+kDT
	s38dkntv3OAnCYVOcRQ4YKkFHgDVsqlztofIv5flw+/IaQbMqqfR9zCTzLqnwalPdg05m3FlJWF
	Vj9iroQ6sNFppAAHUMKgw4NxoYlX8hoYt8Cq6bOgYyPDm3/ZgO/bAZc11uHHidzsHewQngmhxRH
	KP3MqxzO81Ancs/FLWQbnDHbmTGGl51u6VviY/eHuJgQVx2zMrF31Nn7DBZ8AwjOf2VQ9hic2+w
	zuMy6G741s+AqPvI1IZlfWUNeqrgWNtCJASU=
X-Received: by 2002:a05:6102:5986:b0:739:b7cc:3ce7 with SMTP id ada2fe7eead31-73a3934de72mr602375137.7.1782827810172;
        Tue, 30 Jun 2026 06:56:50 -0700 (PDT)
X-Received: by 2002:a05:6102:5986:b0:739:b7cc:3ce7 with SMTP id ada2fe7eead31-73a3934de72mr602366137.7.1782827809802;
        Tue, 30 Jun 2026 06:56:49 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6987c93cacasm1328329a12.18.2026.06.30.06.56.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 06:56:48 -0700 (PDT)
Message-ID: <e29d7898-a439-4e5f-bdff-0e7daaf23c4a@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 15:56:46 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] arm64: dts: qcom: Add Shikra IQ2390S SoM platform
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, monish.chunara@oss.qualcomm.com
References: <20260527-shikra-dt-v4-0-b5ca1fa0b392@oss.qualcomm.com>
 <20260527-shikra-dt-v4-4-b5ca1fa0b392@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260527-shikra-dt-v4-4-b5ca1fa0b392@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEzMCBTYWx0ZWRfX9fsXJ02TdJOC
 QclHpDR8RY+6USBWg6pgkGsXTv382IqmArDE+Fxvzy9Hlbvcpgjyv7jqEOMSbC3gNPmKf3aDCcc
 E9aHO2Y33QfD8GaYQOX89afKtdDBKsA=
X-Authority-Analysis: v=2.4 cv=KfDidwYD c=1 sm=1 tr=0 ts=6a43cb22 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=MSeU50jLikp4iQrAx_QA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: oBa_Ax5oxywXYXJ85neKRcpvU_dMOQA_
X-Proofpoint-ORIG-GUID: oBa_Ax5oxywXYXJ85neKRcpvU_dMOQA_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEzMCBTYWx0ZWRfX7yh84jCG/xMV
 fDYH6JiNsWJwUw2eonypqi2funbcbwxnkgYKvDwduWsTDXaBxv6gYVj2728ne3fZl1wrhqNKcZv
 1ql0xP6AaX43fNjb8tEi/K1rdePdRTZgbjG+q3LQWfMcaqliJ2LmDHl4/QuSsQ/1Vo1pq4bUgTt
 xOwOQXyqJi2qmkgpv5MF8I6YM+FbNlbElDEbW+zJ5w3ZPl1YP+Bw2KO1haE6uMh9I30Qm4fy+fM
 9XHxMuPZlJoV3qsZiqBTy+eA1jO5GrVm1YCwEfE7CbLb6DnkzdsK05GL6Fl/Wyz+Rnxx91slgnm
 6D/W/m3Z8p+4L0BGQ3miyQtU6LdlJeoPUnaNK/BijOnkRpLsG+UFOFIirsGI+I+6ZdCQi03z0Yn
 QlxNZQJZC8AxT1749kWLJd0LRjQaKG+YwGqh+vc1dRpN10F9TYpB+M1xaHsi7iZ+vsXeFvDENPg
 Rkm/evdy7p3iwdn50nA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300130

On 5/27/26 5:53 PM, Komal Bajaj wrote:
> Add device tree include for the IQ2390S variant of the Shikra
> System-on-Module, an industrial compute module integrating the Shikra
> SoC and PMIC for industrial IoT applications, designed to mount on
> carrier boards.
> 
>   - shikra-iqs-som.dtsi: Industrial SoM without modem (PM8150 PMIC)
> 
> The DTSI includes the common shikra.dtsi and adds PM8150 PMIC regulator
> definitions specific to this variant.
> 
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
