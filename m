Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437BF2C0F8C
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 14:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789570162; cv=none; b=ry2M9AQz+utPY/pzjwXcKhjaUg/UrDao26/kBt3lkP2leMAHI6R+4Vb4ZmBJe+wgzW55gf1pEuvMkauC/iCN6c8b30X3qQ08jVOPlbMKoFbmNe0AKdEIrLrpbSxk1QJvYa++fTQ+Z5uriy5FqtCeVp/hQ19i2zhI4Dg5QNefvnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789570162; c=relaxed/simple;
	bh=ND+1deEgYvcG+3y/HizuVxmy9BVpV6lq4ejnNITcrPE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hr69/cSPUG8f0muvPwP/w0JY8nQUAkqUh6l7ibq1xoEehdPBnrtuGB/Uo5Kwm6IoaG7UMIa3S0p10dAuYMPNznIE8ZQnXwikhEdrS1Hv+K8Ppkyts1YJnSo8R0ETCgKFhJH1vpwCfkOnYw7HRFof4N6NzwibINW8uiSEoKZThSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V2CHnqjg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gjxw7WDT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V2CHnqjg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gjxw7WDT"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GEYoKH2956026
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 14:49:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eVgsS+87a5iYDHDygC1JoIvqJU8Cv/bwBlYzt+34NeM=; b=V2CHnqjgat6GNaGW
	PUiSEBlK9OoycpqiH+iMn2DtXGeysLP8DOfPagpjh3clUXFrf2P3DQenl7zPA7n+
	/hK2pcewtQH2lpSn4Jf9TPttzNfyTvr3dFaLY0jC1bh87cDIXHaWFk8IcqugaQ6j
	QGKfpKex3zeYRKsgZH+jjQ7ZfXuNKX4oNh0V4uy/RHIFYJggz55ei6QGumBuuaNs
	e7XUHauS2GaFjIRfE824O63zI4dqe7wj6AP6wnw3UkJiNm+Ovl/uxC9G9SKVvG+W
	3X1WGWuD01rHOMxdjKs+RxU/bJ5FSeeEvQSokZvPvDBX78rBeQxkVGwLITp71YqF
	hNJOEA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gquw2rc32-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 14:49:19 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39533bb224cso7892379a91.3
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 07:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789570158; x=1790174958; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eVgsS+87a5iYDHDygC1JoIvqJU8Cv/bwBlYzt+34NeM=;
        b=gjxw7WDTN2WzwMhIlDyidLiSO9BDXTK+zfKNWF2eJaR+pbgKVe3cyYybqyRDPhInkH
         GHeoGd+taZ7HmBWLTPHYUn56NvPfbPzbshW8NqwYVn16Wq23pJ2/GfjKncgBeKmQ7IYv
         zY9zUOOiMfp1vUGEhfImvcp81v0k5HzjEHIXpoMbNCXrEjdBrT+7gyNyK0DBLP4289AN
         Hnz0J8EguIieyoLGbKbA4l9EVX4oR5uUy3YPzGT4OzuVFYDN2yPi8zisSnGUmbyHloxA
         JllO4uzHeUEy7Yqg/DqP8TiR2OKLjyv5Ze5Erlg7qmAKMcK1Gjn+BM/g5gGoInPtxEAc
         UNSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789570158; x=1790174958;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eVgsS+87a5iYDHDygC1JoIvqJU8Cv/bwBlYzt+34NeM=;
        b=wl7RiIf4DwWcB3TOcek33ri65QS8QEkl33AEZugkq9kBDvFjDB+n2baCPfaxwJH2xg
         Y9FTs7pDupSAZTN0mpZtKk6FiEb20hHWZ3j2ZwWj99blMD2HNE2wEw9Pp3sNUMgwthv4
         N4wph/8h45NQ7ElIQXWwUhsVrF94FS503Vj9XW0N40mvVU8efaYsaTysVAzeVLjv0vE/
         ILdqjiocmwH20fkvPHJj7IszrgVi6rFAwZrb/qkMdgddFFa0kh5hJIdRmcIzHaia2FcC
         NeRlyWYF7Vfd/+D2zP525fSKV8v7mpltkVATnYUeoFt0epmUebuJq4yWY6ROhlZS+0cs
         MbkA==
X-Forwarded-Encrypted: i=1; AKwUvBwn6MBafi5jbgxQ4QTZWEf4FsIP77N7VTbYRkhU2lbtg8tc2ftoU0AdZ0YvdYzMpWIojudelpl2Tdut@vger.kernel.org
X-Gm-Message-State: AFuF++lb/b4SJaJwyDMHzjlLuAj1PdiHfnDnm7HOFyyUSTNFoJ15Pk5C
	3ccLAxtXfHXRuz4nnKo041wgjeA6IAPd2w1dFQykYrjdox1zNOHKAYUp/CabpDVB0j5NXiJIqa2
	2k3lGZ8TI3X6w+6wMnyfGfrqPXJ2kqjNYka9TbO7nt6VTa7crZHvVFW3lzwwpA3Rs
X-Gm-Gg: AYBFou3V4QAhuLQfkAvlshrfFmxmgtz82k2TB0TrdYfdBhgBaTPuRZCM/82oaBvEqgm
	EHmM4Fp/YDjJR0p7oCba/0MQDESkb9sBm0GuQt5iVDhf6rnPmkIPfVizYWA1JfAU3fjf3HJZKpk
	S3dG+yiz8aoWIsFOYPBzVE/sztkarnNb+GiLKOb6LD0UhK0CBB/gPBgGD5l2Tfd1G0otOU+6Cp1
	W8OdqHECM+rGATwDOPeMx3wBiMTul1XIszBn25fKmF7Gp8R8igj9qYk7mOwqQErhOqt/+Gu11Qc
	tyFB5XRWMG7XkPV2ppuMPl45d9ZGulnn35gvQuOo15y2Sz7kvYUemWQT+nmwL9rNAAW7OrJhymK
	kZ4WvBAuGJviO3zimgqyFI+J5UJv7SusO+Kv9iX6l
X-Received: by 2002:a17:90b:2885:b0:398:d132:ba76 with SMTP id 98e67ed59e1d1-39e1e502f25mr6913665a91.21.1789570158597;
        Wed, 16 Sep 2026 07:49:18 -0700 (PDT)
X-Received: by 2002:a17:90b:2885:b0:398:d132:ba76 with SMTP id 98e67ed59e1d1-39e1e502f25mr6913598a91.21.1789570158156;
        Wed, 16 Sep 2026 07:49:18 -0700 (PDT)
Received: from [10.216.41.130] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1bbfdd49sm5493700a91.11.2026.09.16.07.49.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 07:49:17 -0700 (PDT)
Message-ID: <6f5d5266-75b4-4f65-a19e-8fc27ca9d3ef@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 20:19:10 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: glymur-qcb: Enable UFS
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        gopikrishna.garmidi@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com, Taniya Das <taniya.das@oss.qualcomm.com>
References: <20260911-glymur_ufs_qcb_enablement-v1-0-b9fc5e2ee99a@oss.qualcomm.com>
 <20260911-glymur_ufs_qcb_enablement-v1-4-b9fc5e2ee99a@oss.qualcomm.com>
 <c3bc5b6c-f929-4576-9d7a-d5fb9cc80aef@oss.qualcomm.com>
Content-Language: en-US
From: Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>
In-Reply-To: <c3bc5b6c-f929-4576-9d7a-d5fb9cc80aef@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDIwMSBTYWx0ZWRfXzYmVR9ZGoAOQ
 En4ZLKFLWDWK6g6pSmMifaH1NBNwyT7uKqgNHsx9diOUqY/z4MDSeLBcmxSVmkvve2fw88h91/O
 AJN/vNVnd/TrSttXvFfajnmr9nvE25s=
X-Proofpoint-GUID: 3NGxjNO4v54QUGFP02cVYPWMHVxENkRo
X-Authority-Analysis: v=2.4 cv=N4m8hG9B c=1 sm=1 tr=0 ts=6aaaac6f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Z03_-bexLPcab5i0-bQA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: 3NGxjNO4v54QUGFP02cVYPWMHVxENkRo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDIwMSBTYWx0ZWRfX3WoGX9G0gmhe
 /aDMEbBqGikecqX0Cniv+rcnnug4fDBrk77CUENI4eVwbKRLr4sQDy9u3flWFSyd6m0N3x0gXW6
 /aP+FoH+Fn4TDDBUSAuzf+ZEnQhBlwWS5hntSnGNs14ij4pin4eDC+a+155Ak2VEZNFiBZyA3VF
 7WePXsU1CMLHN2qR0p7qjxaL5dRZPT1ncO4+6aXyT94n4McLeeP0VOdy3OebmhFgLibqQlpq4GB
 XOKQeNbIpWPX9FFJnfcxuzvxANiVQRh4w7XvB3X8lK+60v17kDKciOdQ0vQxaEEMU9qFSMvkg/o
 5V4PKsgsKrnKEIZTcx847Oeqwv45LNrGdxYsnTBfHjzHU9yd+DcG44wl8uHGLnl36bYUya2j63J
 DDZ4nReEEyo6RxNK3dDPg4oBP7+ZJE6VIaV4huk6RoDWGeE1NG0KmDNbGklS1QQiBbB6k2/nyoQ
 12IlmXWDNSJhKkzK4dQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_02,2026-09-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160201



On 9/14/2026 2:44 PM, Konrad Dybcio wrote:
> On 9/11/26 6:47 PM, Pradeep P V K wrote:
>> Enable UFS for glymur-qcb board.
>>
>> Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/glymur-qcb.dts | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/glymur-qcb.dts b/arch/arm64/boot/dts/qcom/glymur-qcb.dts
>> index 17d8ff3aed23..b6e384024dff 100644
>> --- a/arch/arm64/boot/dts/qcom/glymur-qcb.dts
>> +++ b/arch/arm64/boot/dts/qcom/glymur-qcb.dts
>> @@ -697,3 +697,21 @@ bluetooth {
>>   		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
>>   	};
>>   };
>> +
>> +&ufs_mem_phy {
>> +	vdda-phy-supply = <&vreg_l1c_e1_0p82>;
>> +	vdda-pll-supply = <&vreg_l4f_e1_1p08>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&ufs_mem_hc {
> 
> Please keep the label references sorted alphabetically
sure, i will sort it in my next patchset.>
> Konrad
> 
>> +	reset-gpios = <&tlmm 250 GPIO_ACTIVE_LOW>;
>> +
>> +	vcc-supply = <&vreg_l17b_e0_2p4>;
>> +	vcc-max-microamp = <1200000>;
>> +	vccq-supply = <&vreg_l12b_e0_1p14>;
>> +	vccq-max-microamp = <1200000>;
>> +
>> +	status = "okay";
>> +};
>>

