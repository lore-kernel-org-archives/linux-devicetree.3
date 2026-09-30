Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FBBC515891
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 14:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790777892; cv=none; b=EEw/s1XfERdwt5B6kV7pFTKQdAD+6N61A1LVTVooIghcAdU43z7R29fcuVUVMQCSPzcE2W5GSXfOtaeVGfURB/G8OPT6LkEC9lNbKuk0NB1gunPmDBH3FHktAdUm+HONJVwrWWJ2XBTI1cgIYm/V14d/ZGpmOBmOMih07lFy7/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790777892; c=relaxed/simple;
	bh=op5x2jMUe3HR/valB6bXaPpG72jSk91BN0Eh2bCmmfs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PMOZ5P3lBGh2t68svheFjojqOulEPSmYUSLZtcdabCNsSXlpeMJxnHDGmOpifHo7ig258vxC1TssrYezTfcW+967YpAqdH4sg0UdXEt/lT3xNJKlzB/B57Tf/i/pWsnBv99hKRixXNXL3zxghg9Qkhk9N/2LA0UXu37qgoz5mrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=imuhky6H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VyLQ0k25; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="imuhky6H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VyLQ0k25"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UDxw62145220
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 14:17:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IHynm5lLmvt6eNbo8aMZmXzLWs0hWbVYmgJcOHD1D9c=; b=imuhky6HWATxTqQG
	UczYTQK1lNKfCgqlUjHzAvWkewbXt5P1GBb3lKCGJvSNwTGvciGXJvXvqcCVH+XV
	Vgrr14v7smBQzbrtwLLM49IR6nTVSWE+4KFld96DmpQuIli8H61gZXHFVfF6e88Z
	rs1IK9IS6mTqfDqdN5FtiT1pjOIl+J6+ea+XA+DgrI1bigCIurL1LgYLTTkSxKmW
	S3zpKJoFYqHPiLriAYJQBxKyDOXaNWW1uexf9wFZM+49u6HZXPm1z3mvf0Kcsv4I
	YsrVRFaxqNz6rpw3wpLz4DRL1X1cym59n/OrZdfKPnv3qUV0scqRd8naVreWaOdC
	d2rd7Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0j97vr69-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 14:17:55 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc7ce00b8c6so1297249a12.2
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 07:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790777874; x=1791382674; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IHynm5lLmvt6eNbo8aMZmXzLWs0hWbVYmgJcOHD1D9c=;
        b=VyLQ0k25i4qaaSmWBcIYWbRlvfiIj4vOiWWCyykF8Ph/mgNTkMTxYraDMWsK2E7Tnt
         oIQbQM5GoruBBsp2I6awWznCVeusOsub4N6gjYo0i4bE2wRTNcqxsPOpXpvHqXaIoG4f
         8yXBe5By/FTDhUbh3LkaWCEk3OwqdJ5l4E1cQRqVQ3a8P1Y19yTXap/lSfQN+34evua+
         dDiHIenE3w5TLxXVlR8aS3I54rJ3q1ba0rnW7z1icXQ9IBFPOfmI/pc1zEMXw9gt34Xc
         VKcj9VhBu4SUVCakejzcyQGXWQz6Y6v4DRUM2bpfIiVzVzkbRiVFWSX95gFJg4WL7WOC
         kRYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790777874; x=1791382674;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IHynm5lLmvt6eNbo8aMZmXzLWs0hWbVYmgJcOHD1D9c=;
        b=YBXJv/B1Rr7gHdDf/bHE99mdMt7YaShSyTruBE+sG4ilE3VxQFarkfVRD7LHCBW5v0
         f3D0XJSQtTNE9wBm7jXT9N5VbRsgEy0QQ9DuLq42nifwWBifgDKhjeLi4IwaOYElXkJ8
         AM9PXlJ5YE1OuwFLLREmt2PEdMrRVPFVh4xZXDck6EDBVRogOgq5h0s9DrzlwXswnK8g
         QZtacRZw3/Zn/CnzNSAsYi/GgECl2EBxhaKHOJm2ZYHgSaMHDCCn/sg/eRtGYaEvJsL2
         65AhZR4Bk3hdxLd/w0diUPr7XrVnCBq5Qm0snCoPX5A+6YO/nxFfLMLP46Xl4FhEPsPY
         jIVQ==
X-Forwarded-Encrypted: i=1; AKwUvBzvHESKe8Yft3LCzeQ+QT8apWjDCcrPm03V7bUi0nTIm5ibmqgLFb2XL0ErpdN/V1Uqfc7w1/162kFK@vger.kernel.org
X-Gm-Message-State: AFuF++naPJNriTx9pY31KM2Ii3u9bEcVCoDa0A8kWHK3Yzu7kDw2judP
	5CioesUuTT6kDfsecwplRvM2jYcSRA9J6uIcG4jdmIuaWSoxkE8Jy2iWs/glk+Mg6vLvDL5ENnu
	iItb9ofk6LLx0gDLYQF8td1hiwMVrjDh177/9BCsia9umfcFS/RrXlWROfrvBtq3m
X-Gm-Gg: AYBFou06eTm5H+3cOxy2zmhIgOHS4oR93zuPCsbvj+B8s1U0BlM9iKlEAsbFnl7J/BC
	yJP6cDeNdcNsuOOQieIB1ro5nXnGk+msUXlSCSqJuYABOhVekDA2x6jFnKUifZvgrYWyGXoYjFv
	OOD3tyK/ATigrkwDqHGuUzvStagrm9dF1ZKrhcezCGTl6VDm8Iwwzbvikp+CSK3fc306FxECGbb
	BPh3L/Wjn00O9onuQp4QMp1oaVWRhov65PY/AQqBO1E4QwuiadUQI9KCy7UQS/uUlp06I55Fafk
	/UeC0zRlk2U7mOetfTGFRd76VgZAsW/9lRJ9vchEqv+DjsxTK9ZePyqY1iz/kyslMHUnXe4aZpD
	hRyLHfQe+EH75xGQN5Op9NAgYQZEogvmVvaBTyTtFF+YLNc34EOB7Ikm4Em0sJxo=
X-Received: by 2002:a05:6a20:9c17:b0:3dd:e2e3:30fc with SMTP id adf61e73a8af0-3de9e7ad978mr1665747637.49.1790777874457;
        Wed, 30 Sep 2026 07:17:54 -0700 (PDT)
X-Received: by 2002:a05:6a20:9c17:b0:3dd:e2e3:30fc with SMTP id adf61e73a8af0-3de9e7ad978mr1665719637.49.1790777873995;
        Wed, 30 Sep 2026 07:17:53 -0700 (PDT)
Received: from [192.168.1.6] ([117.143.161.217])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7d9f160b7sm1040104a12.3.2026.09.30.07.17.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 07:17:53 -0700 (PDT)
Message-ID: <dd0ddd6b-f2a3-4f10-9baf-7420e66d6a5d@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 22:17:46 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 09/11] arm64: dts: qcom: kaanapali: Add CAMSS and
 CSIPHY block definitions
To: sashiko-reviews@lists.linux.dev
Cc: linux-phy@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org,
        media-ci@linuxtv.org, vkoul@kernel.org, neil.armstrong@linaro.org,
        devicetree@vger.kernel.org, olteanv@gmail.com
References: <20260928-kaanapali-camss-v17-0-dcf3fd37f76c@oss.qualcomm.com>
 <20260928-kaanapali-camss-v17-9-dcf3fd37f76c@oss.qualcomm.com>
 <20260929061112.51F2C1F000FF@smtp.kernel.org>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <20260929061112.51F2C1F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Kx5BOF6DCB8VgUOszK29c_JjFV8uUSdZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1NiBTYWx0ZWRfX5xEABo/2mz+M
 A/7ZUU8amShfTTmFRa6sIh9tkOaaq4rDvxdGrdtSi+EEoeIX8CTSpBqQS/nwvW5N2Sni9ejBTfR
 qyJ40anCHADwEIYXBfxfsO4Ge37czvwYH7XBn4QhqnxVr5K48LlnpSnH7mymfEmbg2NWwI9czuZ
 fURBQ0o7vJk4/fp/VzELIUg4cVGdFwFBk70SLhLgIcWTnh9Q3QeqqJY9OrHdKiuQ83Hja4piuZ+
 wimzTMizMMepefLrAW8gJl5xHaRDs+qsl3rUjCbIoTJoIODNPnEIEDjTxn5buXcJ/3lUyLcXBrg
 JwPQ/86V6X0UkeWxJ9GTIAZOLCmSKEYo7VFneZC3w1W74HTWg0gW1oSZS58EPNDLmm7RFchKit6
 3JUh7U2a6BCP8QV711oqVF6aeydWP2a4uYJYTLLNV60A1ZLrIq5BM/n1kGvZ3fTAt+vfPE4NxjU
 LJRkBRp8HrobPG8cOuA==
X-Proofpoint-ORIG-GUID: Kx5BOF6DCB8VgUOszK29c_JjFV8uUSdZ
X-Authority-Analysis: v=2.4 cv=BPImP1QG c=1 sm=1 tr=0 ts=6abd1a13 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=K/RrOd38U9TixX+j9hIN8g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=aJNJXID8IE6Oa3qSs_0A:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1NiBTYWx0ZWRfXztjVrIhtva0z
 ZoOC6mM4qIjzPtAydbCssLQMCOZg+I6/huzeRNn4afr0zWGfNPx+hwr2DxnJN+/uEbg9NwxK3Pt
 xKRfg+UROfK103qrSljeLDanY5ffzJw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300056

On 9/29/2026 2:11 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] dts: missing #phy-cells in CSIPHY nodes breaks phy lookup
> --
> 
> commit 0d5dc943d2ac26c65efdf11a56970db1bd7ff6f9
> Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> 
> arm64: dts: qcom: kaanapali: Add CAMSS and CSIPHY block definitions
> 
> This commit adds device tree nodes for the CAMSS and CSIPHY blocks on the
> Kaanapali platform. These definitions enable camera pipelines to be configured
> and used by board-specific device trees.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>> index 3e63e62251089..7a80438bde570 100644
>> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> 
> [ ... ]
> 
>> @@ -3595,6 +3596,307 @@ usb_dp_qmpphy_dp_in: endpoint {
>>   			};
>>   		};
>>   
>> +		camss: isp@9253000 {
> 
> [ ... ]
> 
>> +		csiphy0: phy@9523000 {
>> +			compatible = "qcom,kaanapali-csi2-phy";
>> +			reg = <0x0 0x09523000 0x0 0x2000>;
> 
> [Severity: Medium]
> Does this node need a #phy-cells property? The generic PHY framework requires
> this for consumers to successfully probe.
> 
> The qcom,kaanapali-csi2-phy compatible binds to a generic PHY provider via
> devm_of_phy_provider_register(dev, of_phy_simple_xlate). When a consumer
> calls phy_get(), the PHY core invokes of_parse_phandle_with_args() to parse
> the reference.
> 
> Without #phy-cells = <0>; in this and the other csiphy nodes (csiphy0 through
> csiphy5) in arch/arm64/boot/dts/qcom/kaanapali.dtsi, the translation will fail,
> leaving the consumer devices non-functional.
> 
>> +
>> +			clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
>> +				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
>> +				 <&camcc CAM_CC_CORE_AHB_CLK>;
> 
> [ ... ]
> 

This node style aligns with the x1e80100 example:
https://lore.kernel.org/all/20260917-x1e-camss-csi2-phy-dtsi-v7-4-1a63eb35838b@linaro.org/

Best Regards,
Hangxiang
