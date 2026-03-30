Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99EB4378838
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 04:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774845889; cv=none; b=heVoB9XlyQi3D2bOxP8UKxNi+tmLRWm4Q+L18Wd+tIKiEwiqNnYG7sMpFBg37nQLkylWdHOxpAcTCwSS2m7vGCTVbOCLHMftXxSFmoQP9+cbjN/lb3v6ampjM0F66qU3711gMg3lSz0ol+knUyyyZgGnMuPkZk9tx0bTIGF7QTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774845889; c=relaxed/simple;
	bh=OmgR+A5aBUyQQzCcbcUrE1vjUaKlJ7rD8ByB17WnhBQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=myDKMiwU9r++YXqDu26bL9e7gnSVqZo+yiaLZmloNZMYPfey5fhuiJokDb4HPsQh14n812Og42SwJJAhA/FHaph1Vls+/nfxo6MIhXAv0kVV5OOwOwmi1k8s+gseSHf2nHrj0zyi1snlt1AqjbwNOhsNZNueOqu13NEIeqA7xVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X00b5A9c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZzKGuhMq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X00b5A9c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZzKGuhMq"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U43Uim584243
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 04:44:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gQZ545nZTJlyfVvOJC8d3yTp0OQR2nViDIMcw9VvpJM=; b=X00b5A9cYIPWiUzr
	4Os1MaGeiCeHZ0ef1GKbuuGWqLse+K7crzI8NDw5dZa3jl1+MdHW8uZBr9FKafde
	WKy6AvFfMAsq0N75eaLO1CYNHrkr7s8oIHOqscV9NB8b88lFhp5nNVxZTC27G0hH
	5wiTzqij+3kjE2xorDd2zDlA9T6+t7r2LnqNtKGyRskQ63vyAnr1hGN4E3F+2gaJ
	MruKYx+MZ18mOxajo+le+KjEfO0Yvte/lxTJCulUllvUyxf2KyUX1KpmVmu1EVh9
	OMv+7l0GR76c7uae+PBqTRAedewxaXM2ApT7FIWo9ecvS4SHcoC7z5aEXay3frtl
	xqpnzQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d65xqmjus-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 04:44:46 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b241be0126so69884135ad.3
        for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 21:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774845886; x=1775450686; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gQZ545nZTJlyfVvOJC8d3yTp0OQR2nViDIMcw9VvpJM=;
        b=ZzKGuhMqI7zk1LTG6Ccpf3x4Mq2m1fvzSWN7Ln3MgMgSXuMpnGBh4BOeCWVb6byEul
         qw1kW9/ie2oXDJRMH9fC9m6pHwfQf5WJEZhRtbu6kLhOtM1vxrNUab1J69JHb3ZLqyxP
         OsUL0M+baGPXyY+KxbefQCA9wmqRlbBvpHI/uwuehY2arrsa2PyswPgjNp/R18fojwYI
         sO/C67pTxIc9MfnK3go1IU4IwWc+OydJP+Rz7cZ0ER7jPWWjfq2M36y9T1X2abpUzlDf
         tzC6bRv7Tcf1uBJRmF7L9zJECG+XGKXRKM+hnr1QdJHymRjWNNdlbrXO1IIiD5VkFAcF
         Cd5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774845886; x=1775450686;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gQZ545nZTJlyfVvOJC8d3yTp0OQR2nViDIMcw9VvpJM=;
        b=SwEmawAoHYqyI5i6q7KF3yiH85REWu7aiK+HaraBkgOF3Vc5JrTYyj0UCXFbNRmPiT
         w3PBnI614pn6L+jGWr6ERWryiW5KqTLe/KTH5WPCWmj3eZ0aQIZxqPdf4blEdEkYq5dR
         FVCORiTk1ZoDjDaJ2l2PDdcMz96KL0Zy6o7QEG49qQC/P27xkQgu+Jq0/n/nNgfeO8mI
         dzvhR8ktS9PdrCl2ip4YBxTPIqjKtuoZaTeIXEdtN2AP9C72Zp1ft8sy3l3AcD9mBBRH
         aFGf2Y1KuLGqEDWXImrkez5vZ7XbzdSwH0U1DO3HDwVMF4nMyGmKeOaRtNul1K6ig6BB
         rKqg==
X-Forwarded-Encrypted: i=1; AJvYcCUX22bgoFrLmKzwnn8CPdZJjZY4h550C9ogvAgCXpJzbKhlY+w56tzjioDML3giJ91H3Nt8+x2s1ylr@vger.kernel.org
X-Gm-Message-State: AOJu0Yxcn/Nj++RTonDMgtolr0t55z4UUiDzWoB0MWyEx1NpgMqdxkuz
	JjqcnDVEJNPKQZAnuzTuEQem7UIOI6mWt8CSQb7PJ0Up2oz5/JY9NtzZLsocwm7WdoNrgjtm4kq
	8ZXeehTLagvDStAiIzhDxKxzWhyco8wnLYKraPfOLGEXKe4b/w7EMRKfJDlLAr6pt
X-Gm-Gg: ATEYQzzuvjFRF43QQ4qz/QYSWeFG/UfX3cHt4QQqb0rECEYAHRVod54L5o75LP1YBON
	RdSvyeRfUt8DYW84moplCBA2EFz5iSzio9wkHyPwNTDTej6qnAul4ZNzVjwXHv9bYjABW1ChAGS
	+c9ffCzZP1ivqtRhU03uaHTwUkQlouSzXfqUVaIHV1xlpVKaLtzsbYpWpRnmI8mP3uI2YoolT54
	vmknfmaoyJgBpj4waJbbS1fShIQLPKWUJJc3/wgvzhH+YICZmC/K3SvMGRryaFdb1gp27Aye5Ps
	0loswamQEdfjTnR1DbS8YJjYQbiC3jvEn+dt+59tbLJSN7gXMRIU1W1/X5JZ3v+je0FkRIeitXI
	y/ySY2gGRJbs9SZnF7LhD79EoSWfMqfwrPj2P69AwCCmKrdf8Sxp0eA==
X-Received: by 2002:a17:902:c946:b0:2ae:a8a8:92f3 with SMTP id d9443c01a7336-2b0cdcfa1d8mr123676625ad.44.1774845886330;
        Sun, 29 Mar 2026 21:44:46 -0700 (PDT)
X-Received: by 2002:a17:902:c946:b0:2ae:a8a8:92f3 with SMTP id d9443c01a7336-2b0cdcfa1d8mr123676315ad.44.1774845885832;
        Sun, 29 Mar 2026 21:44:45 -0700 (PDT)
Received: from [10.218.4.221] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24264256asm64599685ad.13.2026.03.29.21.44.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2026 21:44:45 -0700 (PDT)
Message-ID: <f0098f5b-1ce5-474a-9249-bb399be46a55@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 10:14:40 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 6/6] arm64: dts: qcom: sc7180: Add QSPI memory
 interconnect path
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260324-spi-nor-v1-0-3efe59c1c119@oss.qualcomm.com>
 <20260324-spi-nor-v1-6-3efe59c1c119@oss.qualcomm.com>
 <xxylp75rlr2r62ehqxs5x7f2gy6gezbkuil3scrql6x5o5uowm@myb3riehntmu>
Content-Language: en-US
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
In-Reply-To: <xxylp75rlr2r62ehqxs5x7f2gy6gezbkuil3scrql6x5o5uowm@myb3riehntmu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: OVR-fipk8S5wi33skxMZDh1v-Z0X8yLp
X-Proofpoint-GUID: OVR-fipk8S5wi33skxMZDh1v-Z0X8yLp
X-Authority-Analysis: v=2.4 cv=evLSD4pX c=1 sm=1 tr=0 ts=69c9ffbe cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=GBELfx7eKJZFaBSPsRQA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDAzMyBTYWx0ZWRfX5lnPYmzYePdi
 aWuF/H2l26hBw6NePayq2Gqto7gJ0tvdYIqcy4qfk13Q0IaVQkH78PwheCDiu7cN3ztbx071ypY
 t+w9z3yjh1vXiycS6xlOn0tpuQAQJLpBFgz8QVJWS2FeeWbXGQvaveHCA5v6s3aj1mB8S2n+nGM
 a0VJCIFBnVlx/E5kn+RcDClRQfly67aWKUvaHFrlcGlzWX6b755vOXgt7M8J+Wv88aZ+J/jGY4u
 qD+NOiadMLhoVQgLsHa5+FMUb5K/BWGXTryU5C1vNUdRamz1C9osEjRgRIFd2chYYm6odmywLTb
 upHjpQpjru3jWZxME5gHposyGpQ98oihrroYQztMN/Py7mfwqb/TRSVCNpA3LYY86NDFKJlxWjt
 /UaMFGK56xMb125Ixfpy5RQRVPvWXuTJs9yEZ6l1rjJWy3k8B6tiDlNSPo9/b6NOGkaPI+/GlUm
 1ppB4HMGbpJ1IEpNvQQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300033



On 3/25/2026 2:24 AM, Dmitry Baryshkov wrote:
> On Tue, Mar 24, 2026 at 06:43:23PM +0530, Viken Dadhaniya wrote:
>> Add the missing QSPI-to-memory interconnect path alongside the existing
>> configuration path. Without this path, the interconnect framework cannot
>> correctly vote for the bandwidth required by QSPI DMA data transfers.
>>
>> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 7 ++++---
>>  1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> index 45b9864e3304..7093b39e1509 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> @@ -2864,9 +2864,10 @@ qspi: spi@88dc000 {
>>  			clocks = <&gcc GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
>>  				 <&gcc GCC_QSPI_CORE_CLK>;
>>  			clock-names = "iface", "core";
>> -			interconnects = <&gem_noc MASTER_APPSS_PROC 0
>> -					&config_noc SLAVE_QSPI_0 0>;
>> -			interconnect-names = "qspi-config";
>> +			interconnects = <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QSPI_0 0>,
>> +					<&aggre1_noc MASTER_QSPI 0 &mc_virt SLAVE_EBI1 0>;
> 
> The same, please use QCOM_ICC_TAGs

Sure, I will add it in v2.

> 
>> +			interconnect-names = "qspi-config",
>> +					     "qspi-memory";
>>  			power-domains = <&rpmhpd SC7180_CX>;
>>  			operating-points-v2 = <&qspi_opp_table>;
>>  			status = "disabled";
>>
>> -- 
>> 2.34.1
>>
> 

