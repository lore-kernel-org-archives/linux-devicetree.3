Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482F228D8DB
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 12:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780923309; cv=none; b=Qlm+Qo9fQ/McTlX0s1yK1HIxKZ2X2VA9jTuE51vvRLxeDXtSK4bpQYAj7ia5edDe8uiD2JpPVo60R7X71M2WCJ5vFZgmqES2W3kSYrLuAsBcEVw7ziJVRFolMe7fU+aBLzxHpPO/M8I7c4/L3apGLkc/R8aDJdrFoma3FRZn+RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780923309; c=relaxed/simple;
	bh=ZgcJb2lpQ8TwBeBu4wA0l1geqtRhtrSfzrq0TIwr25Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=heUT5sD+xGwjXETrA/yWjQfp7E3BadCLSAepoOf+fgEBPviUyezWo06VFhf6hTPaZgCO54eeENISUtzGg7j4KofA4SIv1ReZPAcsq3PmiXzxeg8vcXE5qw2YSis5lI1I8NZ+HZRoXksB7JEHNRLeZ+q9xUdDSe6qi/s9Gzj3dxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MVhAjlKK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VLsM3q0c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MVhAjlKK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VLsM3q0c"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658B9kYr2920000
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 12:55:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RnEU/cGXr24KnB3ToaxPSDLshaLZ3TpTyHn764tJZxc=; b=MVhAjlKKMCZApg2Y
	DDVPkDgMWRiw0XQsO0k8+IqMGHcTgOFkA5jGiILMnSybZjRLzge/BWJpUpGW8zzd
	mLimRiKocKexkWe6A5t7k4d4cIUtVX5Q6bCEraG17ryaD1bWGImLeHBQp1QBJKb+
	WxLPLVHQYBt0OKWTFB6HI1G4p4///lSyOZnAyRDAraY+IB3DlBiq1zCgbyBgTJNp
	+cpsHkQph6dJMUB9csjNp42wDRVmfXgBtMT3YrNCtq5oYxOeqlgD4EHW7SviyIwg
	EN7GZ8Idwc5XSAfoKWCCE/0wh3pwCEYISeIf7J0EPoGlsxdCpwZLf4k/VnIMHmBJ
	omQkOg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcqgynmt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 12:55:07 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c0a99db8dfso51297865ad.3
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 05:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780923307; x=1781528107; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RnEU/cGXr24KnB3ToaxPSDLshaLZ3TpTyHn764tJZxc=;
        b=VLsM3q0cjBaG2jTYdj0NIBtTmA4P2SaY5eY5s1IREU+qfgWVM3oRn5PI2BOnsZCM8j
         lBSdxT8lqR0pRh86RKE18T5rTbfsvWLaVxcgQGeXAHUOdqD32wdy7Te8pWMRMRoOFcPV
         ksqkaSd6KLhuIklc9Z+6H1zEorl+HKokWkhGRSHc+eQQBiZXQhXztmeCxlRC1w1bEeEA
         gtiDeI4vItzr4oecxIlEA5nQlnPY266Zk7Xp4pLzB1jwYH/QXydaAMKuqbR59gALD+S7
         7IalCACej704d413H/AOaFRPV+watvpN7EU1mLLYtHEwJ8vI7ipNgazb9+AGYaGn9CZn
         D60Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780923307; x=1781528107;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RnEU/cGXr24KnB3ToaxPSDLshaLZ3TpTyHn764tJZxc=;
        b=ARfndGpn4sUHArSiSR+TsrEs8mh8vTv1T6UuDXHi6zXoWzeNL42pLpAq0sSPDmIvix
         rQYD5aZkmztjhJYkKKVCkJImlU/UA7potDxxO6uWlbQS1QHOkff4itqNVbDyc70U17zH
         rLQmReSyi22h6QUgQtZs4VhkBUkUTw4l+5Qk4/KP/876QyIug/biA2T0lESC77vcqVe9
         Sg3dNK2x74w2c62v7dQlChlfUtwAIRJkNe+uZJxgYL89Ks3fW07egQbRDMzmDldi36qx
         sZ1Grz7xj8CilAJuuxxCrMeiXtbFkyqgzEzbH9LczqVCK/Q4iu6EodY5m0YNrwx92iAd
         GwbA==
X-Forwarded-Encrypted: i=1; AFNElJ9mA/MtMIyv33PToP/krCPB4EHd8OqGw4eCNTAcc6QsA7U+K1XZ20mdhWQes/febP2DI2A1uys0S6nf@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3gbApvMTuB/GfA3oxIBo0sGZmm3x3VEKB36Yq7OZUZq23qort
	z/gFwwBDJ3nP+tO5Hpr8c69NuVugpI8AtYKJK9qoiAaspXZHlhVq7XdwfmA/cbdk/1rf4yhvFVm
	ryMf5ve+7LI03hoEFzSLC85Vn8oGYVPWR8HEQy988rESEzDjNXznHOAs4opK26aSm
X-Gm-Gg: Acq92OHwOQ3vE7H0E6Zc9Puh5VhK7SL8lFJ41tbsYHydObppgDvv2cqOv7L/51joAQr
	fDYxZXV7YQMZHezIZ1XxpkWB2xJNQ9bVIXfGufPxuacxazuJKg/Rx44Jfzz/M7waiFxQC9p4WGr
	TWTWXBMu2OGYIZAFLmDpMGAjy4KsWMgcFaLVpfvORMxt63TPK690Ow21SDNzbFsO8Urr8oowCGL
	Oy3VZxFMW2GUHh35A/8ORE5E7FS5/42imqJMeQ8utc69e7ulvqeZznBa4ZZAuNG1PaVBT1lDiEM
	Lu77+JJfLD+GYcbNTLPjlaGpb37hq0z0b1qCsNf9gT3Q/s5ySl1smFW3VFqOriHO80CY82v4Y6z
	8egJsO1ZsjexA6NYnHnZv0bJqtBbN4FxD2Es+OcgwVIZ6I06G3k5/IIgi6YTl
X-Received: by 2002:a17:903:248:b0:2bf:27b2:4b80 with SMTP id d9443c01a7336-2c1e7b457femr178770665ad.14.1780923306880;
        Mon, 08 Jun 2026 05:55:06 -0700 (PDT)
X-Received: by 2002:a17:903:248:b0:2bf:27b2:4b80 with SMTP id d9443c01a7336-2c1e7b457femr178769985ad.14.1780923306336;
        Mon, 08 Jun 2026 05:55:06 -0700 (PDT)
Received: from [10.219.56.230] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16629c08bsm185130265ad.61.2026.06.08.05.55.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 05:55:05 -0700 (PDT)
Message-ID: <18325758-eb01-4b2c-9e9b-b06252f50b73@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 18:24:59 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/10] arm64: dts: qcom: shikra: Enable CDSP, LPAICP
 and MPSS on EVK boards
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
References: <20260601-shikra-dt-m1-v3-0-0fe3f8d9ec48@oss.qualcomm.com>
 <20260601-shikra-dt-m1-v3-8-0fe3f8d9ec48@oss.qualcomm.com>
 <ykcbo7dkl2rrjdzutpwsc3wmnub5r7h3zuspxiyh5v432whb65@sbaar24glpta>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <ykcbo7dkl2rrjdzutpwsc3wmnub5r7h3zuspxiyh5v432whb65@sbaar24glpta>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dJGWXuZb c=1 sm=1 tr=0 ts=6a26bbab cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ppHF_k0_RADCBk5xbaAA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: B5c8vxgh-8080EjeIzOR4Mf7LSnlgo8k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEyMiBTYWx0ZWRfX0LXKe+XJE4I6
 1AyikP3tgtGXYga2/Q/vSWy/v/4cGFS0MwqPUA2TkuIAdiKscP5H/m+d3AbT2G2wJC2jVQBMiJh
 iVYF1w1nPbIwEvdQ/jA36dghTkQLhrotvJSx4xoZg/XGc7qlAO38Jn9C0xRXWz/hww3ZEJEOwIt
 alelyC27z47QSt6kfjEL1Y/hahcAhExaxezfelC/zUkgq0gr9QnQ0tn/RYTX6nrY5JOMaxgLRwn
 PQCQb7vPxnPFqukMaCSW1sMXtCOWMVEcPE8hrwXpspvMWv4uD0V0oyrbyBEkQ9chrTS8OoJNv9P
 Nf8zzsbr0OQYRrPe/ZRK4IcnuCpsw5KgeXSRjX4E1nJInqVmC1g2ykoA7ZXZVTD3IRkFXAtyqDg
 ThFLUR0LFFPKqo46X9S9gyuXQ7gNsnODBdnaQkovmaPTXsO4I+HtPLCQCHMaQ4vEpHXjPzyLkeH
 zqXdq954RfF72apPiUQ==
X-Proofpoint-ORIG-GUID: B5c8vxgh-8080EjeIzOR4Mf7LSnlgo8k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080122

On 6/6/2026 6:02 PM, Dmitry Baryshkov wrote:
> On Mon, Jun 01, 2026 at 06:25:10PM +0530, Komal Bajaj wrote:
>> From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>>
>> Enable CDSP, LPAICP and MPSS for Qualcomm's Shikra CQM, CQS and
>> IQS EVK board.
>>
>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 19 +++++++++++++++++++
>>   arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 19 +++++++++++++++++++
>>   arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 19 +++++++++++++++++++
>>   3 files changed, 57 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
>> index 0a52ab9b7a4c..b112b21b1d79 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
>> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
>> @@ -23,6 +23,25 @@ chosen {
>>   	};
>>   };
>>   
>> +&remoteproc_cdsp {
>> +	firmware-name = "qcom/shikra/cdsp.mbn";
>> +
>> +	status = "okay";
>> +};
>> +
>> +&remoteproc_lpaicp {
>> +	firmware-name = "qcom/shikra/lpaicp.mbn",
>> +			"qcom/shikra/lpaicp_dtb.mbn";
>> +
>> +	status = "okay";
>> +};
>> +
>> +&remoteproc_mpss {
>> +	firmware-name = "qcom/shikra/cqm/qdsp6sw.mbn";
> qcom/shikra/qdsp6sw.mbn
>
>> +
>> +	status = "okay";
>> +};
>> +
>>   &sdhc_1 {
>>   	vmmc-supply = <&pm4125_l20>;
>>   	vqmmc-supply = <&pm4125_l14>;
>> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
>> index b3f19a64d7ae..e62ba5aef71f 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
>> +++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
>> @@ -23,6 +23,25 @@ chosen {
>>   	};
>>   };
>>   
>> +&remoteproc_cdsp {
>> +	firmware-name = "qcom/shikra/cdsp.mbn";
>> +
>> +	status = "okay";
>> +};
>> +
>> +&remoteproc_lpaicp {
>> +	firmware-name = "qcom/shikra/lpaicp.mbn",
>> +			"qcom/shikra/lpaicp_dtb.mbn";
>> +
>> +	status = "okay";
>> +};
>> +
>> +&remoteproc_mpss {
>> +	firmware-name = "qcom/shikra/cqs/qdsp6sw.mbn";
> qcom/shikra/qdsp6sw_nm.mbn

We cannot change the firmware name, as our vendor builds and internal 
tooling depend on the same naming convention for all three Shikra 
variants. This is also why the binaries are placed under different paths.

Thanks
Komal

>
>> +
>> +	status = "okay";
>> +};
>> +
>>   &sdhc_1 {
>>   	vmmc-supply = <&pm4125_l20>;
>>   	vqmmc-supply = <&pm4125_l14>;
>> diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
>> index 3003a47bd759..727809430fd1 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
>> +++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
>> @@ -23,6 +23,25 @@ chosen {
>>   	};
>>   };
>>   
>> +&remoteproc_cdsp {
>> +	firmware-name = "qcom/shikra/cdsp.mbn";
>> +
>> +	status = "okay";
>> +};
>> +
>> +&remoteproc_lpaicp {
>> +	firmware-name = "qcom/shikra/lpaicp.mbn",
>> +			"qcom/shikra/lpaicp_dtb.mbn";
>> +
>> +	status = "okay";
>> +};
>> +
>> +&remoteproc_mpss {
>> +	firmware-name = "qcom/shikra/cqs/qdsp6sw.mbn";
> qcom/shikra/qdsp6sw_nm.mbn
>
>> +
>> +	status = "okay";
>> +};
>> +
>>   &sdhc_1 {
>>   	vmmc-supply = <&pm8150_l17>;
>>   	vqmmc-supply = <&pm8150_s4>;
>>
>> -- 
>> 2.34.1
>>

