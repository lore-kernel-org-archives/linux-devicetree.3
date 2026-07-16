Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF46128727D
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 03:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784171247; cv=none; b=L4dBD+y2thsFXBQyOlXL0XV61GbQUWt7NuPH0lwEOqdp4w54tfY63G8pyQ5KtV9ldn3bU9Q2/p4rlXI+mI18y8NQSliyZYDLvMaOvXbqaHKrL9gbmJadYmkNNsvy9edqnto4DLmWrUDM3Cd6P4pfcgz6zl1uCKy1MrP127RAXgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784171247; c=relaxed/simple;
	bh=/UJRK6D3yVufqnwJNnfHrdC4GBbWgiY71qr9c8vzhts=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eVKomxUi2Rr1KYo2+vA2hT+muHKReB7+pWrPav1cFXuCIl6hL8nb0PzG/Bi349ZQpDXhmvSqiWKNf6NHiAioC7KfWmFojcwfQX+XsRk+2tvjrD5TGXbg9mIk7W0ZE6gqlGGyYw5T3dTT+4FU36bAsqTsgHGlNuPilgjIkBsmLb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cBe07Y/Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QVBk6wxv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cBe07Y/Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QVBk6wxv"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G0XnJ01226903
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 03:07:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9oQ1KIuqWah4dyLVQGgcaf3i7K09sCl1iS5GhyRguhQ=; b=cBe07Y/Zr2n6PGwX
	edGoy3DxeB+jXCK8AXrpLCKQInd058pOfMznb2ZIBW8qMoWCcfbnrWrmz+V5SRKh
	izMhkbl18+ptSmuYDqn3pwDSu8MnrC7bHyR03Qcb0WnyKf9Fh2cNp94PDzzNpt1O
	8r4HDuuankSx4oocgEgoJXTcwKmvrsHW/TnQDEs6Qobzobx1hH67u9CQWQ5GYx1z
	UcaIdpoMQk/02q7+/Ynvfh/KAqeLQYX+r1GQ0cteEDkY9wa9AORCFE2a3pO3ZK+n
	/xMHS/hMuZ/67wlozo1HRs+m+E4PbsYJaiVm7F/eBsx4EMmbNDrqg7rjpXdaKFLB
	Un+sVQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feeg1hr7r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 03:07:24 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3811ae55313so2738379a91.3
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 20:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784171243; x=1784776043; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9oQ1KIuqWah4dyLVQGgcaf3i7K09sCl1iS5GhyRguhQ=;
        b=QVBk6wxvk/6qEiCu0ZI1xOMwuDl4MgswZV6axX85cRDlUtlD1DmnWAgaqN56XCj9bd
         7pOWkHaEGmWf65QQ5PaS62/2GWFdayC0DfnpRW9Q58BFcmvoo3+o3yIFuSrivmJ6+HHN
         YkbDrUmlbA95if8xn5tY5drqtlSivNDAggf1BHIF4hnfCjv0cLP0SZ3PeTQAh/TOySAt
         NlPHFP3gbzVHff6l5DxWCuQF+a3LP2qSqDIKt79vesv+H49ULDDIRD+tM/ZAekXWajdF
         j7ZsP9RZAriPv4wUsyKBn5WUB4hw3KAtc6cA11R67szwzti+mdZrd0xyX3THlZfEn3Gr
         Kvyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784171243; x=1784776043;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9oQ1KIuqWah4dyLVQGgcaf3i7K09sCl1iS5GhyRguhQ=;
        b=ptiEDOKra9n5mJniXf2OMrwXYG3tFIZY+prXIqMdHV4Z3h7oylJklLCvwmZcnnqQcL
         HT6MVb6l2+s0YM73GP7B4cAiOFO2bDkNTZrg9sGFrD6Oa7ZVsehIMTUPO6Yr7YQDuiCq
         NXxpg5b3u5iEcAtAtTd127ekfWKSrCy6wHUtImbt7wphOzbSRfNIDZrX8sHrr0Owh+0M
         4kC209pR9I7BQc5t+XQRlDc3Yd8W3xhRL0hH7olvxMWtGrZbKiUMhjIvHpjwOoQUDxVX
         McUuc3SUQJKKgHL3IhiIiCGeXap8+7kMazERFjhVS2eW2AFB8VAy1KxBybEmVUptRT3q
         qFwg==
X-Forwarded-Encrypted: i=1; AHgh+Rrtje6cUxk8k/ctC+hnSchOwmg2+3BsrqrpccBbg2MXSgRD+3qL45KVDnSDf9T7P7GsLwi36wVRunRY@vger.kernel.org
X-Gm-Message-State: AOJu0YzpEGFZn1s2ujrFK/ggGFrXh66+El0X3tkrhaRD2rboP/3IwQjE
	rtuazeFS7xyQQ3ekeG87Opm69juMrwg3X9R+gL6IbUvFbF49mDYXTgPXU74+nip4MguKJC81cOg
	86cElQigM3It2u5QSJNzdnLOMxTc8Oka4rKoUhCsrAac9VbATASvTBGrsdY91lwe+FGsPZDpL
X-Gm-Gg: AfdE7clCsmalqzr2EQdcSEHYxuR6a3L6JAbS6e/To8DeOrkK4bKakF5ncNsL1q2zgRp
	46BWl9MJVUGyNPdSYG9JgWTQa1XpKE0ZEhc0vI4aQIfnlIV0Zz/o6/iHflC0h9C9xPqn96LbVjf
	l1qamkiKQJD8bXYMPW+fVXe0LGDiKwdc9dsdlN5UoZAKOBCYcWqL36hATOr8AsHbeEwdDTODgjg
	mOEuF67yLtURgfz3NX4shBGDHOJo/a4DSYqqOGNgitYH+nEUSMLkSEOfRy1tZ6PaHGRgjWtSCLI
	Yla9MW2pivDcFmR3ApTtuVgCzh06Ksv2u16uwRaPOuWt13NO1vQbUkQp9o9+PfKtEaRd6+moYa4
	qmaNTw738N/h69ftgThy4MO9Z2qbKz6pG
X-Received: by 2002:a17:90b:554e:b0:387:e0db:bc30 with SMTP id 98e67ed59e1d1-38dc7bb6bf8mr17608484a91.38.1784171243107;
        Wed, 15 Jul 2026 20:07:23 -0700 (PDT)
X-Received: by 2002:a17:90b:554e:b0:387:e0db:bc30 with SMTP id 98e67ed59e1d1-38dc7bb6bf8mr17608445a91.38.1784171242540;
        Wed, 15 Jul 2026 20:07:22 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e6c10dcsm6946343eec.23.2026.07.15.20.07.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 20:07:21 -0700 (PDT)
Message-ID: <b179ac7a-af91-da67-3232-e9e41203ade0@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 08:37:17 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v9 01/14] dt-bindings: media: qcom,glymur-iris: Add glymur
 video codec
Content-Language: en-US
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
References: <20260715-glymur-v9-0-8cf2cbe12a07@oss.qualcomm.com>
 <20260715-glymur-v9-1-8cf2cbe12a07@oss.qualcomm.com>
 <20260715142224.5FA721F00A3A@smtp.kernel.org>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260715142224.5FA721F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDAyOSBTYWx0ZWRfX6eYMVrITHkiY
 4hWVJhlVP06ynh33sFCkwtnVSC3SQy8pPLErnDGQDholN7Edug6Ozt7lXAo1frvs/jiIMQljoO6
 puPXA8CXJ7Wj8MA3lW3wk+fh0aawiRccY+9bxj7oKF5QRxL/H1jFVLdG4iW2DFQ07WKMBRmZZ+g
 grXaCsLw1idh2rlPfLeROWKKtdPv9aRxz8jDLCmt5T1d1aC8PUqNAWCu7lzm7y+f47t8xTkwDjO
 Fw6snp5j063ub75KnxgcbWm8NLffZHNHcHlvux/VxR5yE98k9iZifDMdjkz6JF9CYTwAZ0JUxyN
 haWpIhp0iwRett5EE4FFcgGJ++hlsG46m40o9ZhlB1dY9YtpX7ddFHnU29qWlw6QX6OZ/oga9Ql
 fl6wu2N81gj1hscwyI6IUHpzu8h4Qww76uHIoMP3omQNcSD3RCrSy7rsdu32/1sLbzHEb+kgZNy
 ChSztrVcS73jHOI4kUQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDAyOSBTYWx0ZWRfX1GYURupfrExN
 IFrDp1k8mOFHpLc/CEd+sd3pgW6ujNkiikqWmOEj6Dbs8aYraAx9RnLIY+DnmY0JBsCT4ANbx84
 WUqyqJEwMXKDxccLw9N6vg6ARKkuVso=
X-Proofpoint-GUID: 1eh4SJ3aN9PcQAgQrga2YNSNrhdGZPd-
X-Proofpoint-ORIG-GUID: 1eh4SJ3aN9PcQAgQrga2YNSNrhdGZPd-
X-Authority-Analysis: v=2.4 cv=SsOgLvO0 c=1 sm=1 tr=0 ts=6a584aec cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KnhrVl0X9m98bs8rsNEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_01,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160029


On 7/15/2026 7:52 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Unnecessary `#address-cells` and `#size-cells` properties on a node without addressable children.
> --
>
> --- Patch [1]: [PATCH v9 01/14] dt-bindings: media: qcom,glymur-iris: Add glymur video codec ---
> commit 8ca344fa9395fcf1d13bd1ea93de8bee21a5c176
> Author: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>
> dt-bindings: media: qcom,glymur-iris: Add glymur video codec
>
> This commit adds the device tree binding for the Qualcomm Glymur Iris video
> codec. It introduces a new dual-core architecture requiring additional
> power domains and clocks, and updates the maxItems limits in the common
> venus schema to accommodate these changes.
>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
>> new file mode 100644
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
>> @@ -0,0 +1,255 @@
> [ ... ]
>> +  interconnect-names:
>> +    items:
>> +      - const: cpu-cfg
>> +      - const: video-mem
>> +
>> +  '#address-cells':
>> +    const: 2
>> +
>> +  '#size-cells':
>> +    const: 2
> [Severity: Low]
> Are these properties necessary here? The schema strictly enforces const: 2
> for #address-cells and #size-cells at the root node, but none of the child
> nodes (non-pixel, pixel, firmware) define a reg property, and the parent
> does not define a ranges property. 
>
> Will this cause the DeviceTree compiler (dtc) to emit an 
> avoid_unnecessary_addr_size warning when compiling device trees using this
> node?
>
>> +
>> +  non-pixel:
>> +    type: object
> [ ... ]
>> +        resets = <&gcc_video_axi0c_clk_ares>,
>> +                 <&gcc_video_axi0_clk_ares>,
>> +                 <&videocc_mvs0c_freerun_clk_ares>,
>> +                 <&videocc_mvs0_freerun_clk_ares>,
>> +                 <&gcc_video_axi1_clk_ares>,
>> +                 <&videocc_mvs1_freerun_clk_ares>;
>> +        reset-names = "core_bus",
>> +                      "vcodec0_bus",
>> +                      "core",
>> +                      "vcodec0_core",
>> +                      "vcodec1_bus",
>> +                      "vcodec1_core";
>> +
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
> [Severity: Low]
> Does the example need #address-cells and #size-cells? It demonstrates their
> use without any child nodes containing reg properties, which directly causes a
> dtc warning during dt_binding_check validation.

Without #address-cells and #size-cells, getting the below kernel warning prints.
[    6.953615] Missing '#address-cells' in /soc@0/video-codec@aa00000
[    6.968288] WARNING: drivers/of/base.c:115 at of_bus_n_addr_cells+0xa4/0xf4

[    7.440909] Missing '#size-cells' in /soc@0/video-codec@aa00000
[    7.447044] WARNING: drivers/of/base.c:142 at of_bus_n_size_cells+0xa4/0xf8

>> +
>> +        non-pixel {
>> +            iommus = <&apps_smmu 0x1940 0x0000>,
>> +                     <&apps_smmu 0x1944 0x0000>,
>> +                     <&apps_smmu 0x19e0 0x0000>;
