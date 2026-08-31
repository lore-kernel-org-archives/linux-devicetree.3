Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6070344D9B
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 01:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788138706; cv=none; b=cg68sYadvh5VSiUj0QKjaKKIonvhjSQq6oA9sdAmzZ1UmT3hnqBCqcAs0WcD8VOj86Qoo3Mj5867Ti1uY0KTESVOR1WPXCu9Ho0HBaXxOKXm+ZclSnv+ZftRkFiehQCePBPN5XJhNeljOcHLzGzXxP4sc+XqRNe8QUyZY/Hv5gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788138706; c=relaxed/simple;
	bh=7UmMN1K0B3ovALPeaoztcWuz5nL6IxnpQy7fd0Gu6kY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uPM2EBqIQrt3VagRked6fXwd+KZVE6LkAHngKspJ/xWrsyJwYnM7n9TEsF6I1fKrq3ynfPadIko+KY5qG5WqqB2Uc2hsV1U9M/Jd2pL231fQWDy9NfVn6u0Ww56V7FuU0sCWzNPiLQ0rdKFhgjIFDw+DBqe/E5djFLdjI/RVzac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DM5JVk7L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ALjIs4cC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DM5JVk7L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ALjIs4cC"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67UMfqXI1263563
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 01:11:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h1D1TQvrH8BzeCG32FmB1x7kyZWd14bC0HSgfQg4E1s=; b=DM5JVk7LnyHq9p2W
	Tm5JJ+hSCdSA3qaSqp8rgLOsaJBlVer55JY7zCvwSekbHRE1grZcYy0v9B5KTAPT
	GUrVGS+SRKjVAmhbWDOj3JmxJl3YWI1YuV07Lt2DQY6SMBXplN65xnLIZ8hlGsWp
	tfYNn9Cw+RBIx9mmQfK7VGWQnm28IGMo1Rn8BInb94JVu6NFwEG4dOxKCSaEQnaR
	/wqQRZv8v77sb3Lxw+wlFcRK3/yjeRk6MNusuJ3l78kRqcYi0P66jsaAPzpa6Rd8
	UqjFsPkJKHGVfcjfLYNu5mNCtAmNAZd/v+qWfxh3Vv56X4UtOURF0MtXeff3/MP8
	ciCk1Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbr6duxjd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 01:11:43 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-381250979d5so3535372a91.0
        for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 18:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788138703; x=1788743503; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h1D1TQvrH8BzeCG32FmB1x7kyZWd14bC0HSgfQg4E1s=;
        b=ALjIs4cCyp2ZvkoOIv/5bRGRWRvRe6ZbRobWLL5LMGyKIXplboR66NqxAWtR23puVU
         SBYHSOTGm6hFxqTYd9YZ/BqAdAGe3xr38Oa2wR1TvaIsfvfa6U0qUCD+T9NHta/pynfp
         arrVMBXKs2TWKV7TejQcdry2SAuIEFT64YWWa4qlbs3e1zav+3hRx2yL0Nh3FNmVebtu
         31bSQScdszbDYkEFhVOKN8fCTQOfx5q5hbbPDk5nyIhTC4V4cCEoeZY0H4Qv6Qf7swCO
         gB4Px6qcg0NE/FNZ1zCPDBSqvu5k1xYKjno8B1eCRjxvB4pGTL6y41LtfwWTub8Zfi2v
         09bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788138703; x=1788743503;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h1D1TQvrH8BzeCG32FmB1x7kyZWd14bC0HSgfQg4E1s=;
        b=QFGRVdDjhLpKWhbGKcGPT9g4cy0FuKuQ0t+QaT2WJNMG/qmLF8e+OKYpgdQicgjl5X
         oTE/3sEg+X71nI+Hq6gFPCII0kjD/HXs0g/GVWSRNHjUS7/T8kaVeTznpl9KyylNwQJy
         nfukl2ECsa4DweUEHI5ggScPoOYAvhqhCbVUHVE1tk4Uc9KKqc+I76ZXrMo03rL2AOky
         6UdAs7NVBN6VNaBVxK+SfNYNQD3mjGUiG+KscfqB57+8e3GIN3S2DfZ8JF35XWeMPwpb
         LpcAL10tEa0EawY0Slr+Y2jy41cu3u0yl+dx1W7sm+LAknksmrkjAm8lamjDv28i5QwK
         UJlA==
X-Forwarded-Encrypted: i=1; AKwUvBzB/PxqLv7AGiReWaQO4DCM91FBX8AjKliJVx4YxQvXdSV15eWwRq5Zkaw1PfQXKdxNdexs0Qj3j8zo@vger.kernel.org
X-Gm-Message-State: AFuF++lbkYbCoO6Pad120mxJ5T4dHlBfXbdrOtMp67+uU8JK5Agy4cP7
	869LHwAlJizDtAfkHAKGTCsQsk0d2HPMHx8FmOLZHSeB/jAIPBoK5x8uOojpduotEP/pKSdIawh
	i7on3CN32+UKFr1/EF5Hv41OxNrF3D0s72qdVDBihK58qNFHfdRl4seH9Kg8vyqzS
X-Gm-Gg: AYBFou1BCDnbbLyiDyIKM8rGd+lUlp292RaSY8F4y03Uk5HKnBBsBSw5fVfpCRvX77N
	na9pzZ0QbRwb1fYSqmNV60SfAIYjN3mYISs1lgFshizJB8O2bYavM/OgGLBJcuWnlEJdQgWAv8w
	JK2xpXe5MPe7emIqA6PrquLDe1Zj/CEZWjszPfvqTYWtfR6oIcPDl3kOunvGH3s9hOWThOnnjhy
	jLAiTv9HVgo4ri1wFDd4TvGm6t91jA4LcjNpydXloAQYVeSNPOmJ5D6i5MPF3lpnflj++gDjWT4
	fUt1g/6CxKVLmppPEuLDFa9amBmC9or34DvsclXe8F1QSG9RDrKH5itkAXS8FVOqSnLo/QDiPgQ
	c6qPNjf5reTG8r9mkvdUrGWkkUXGC0BvaA+yI2aJSZi1zBZoz8b9mWKE6e7kwXOyY4nT+jQ==
X-Received: by 2002:a17:90b:17c7:b0:38e:9ef9:eb97 with SMTP id 98e67ed59e1d1-396d0fc1b2fmr34041151a91.16.1788138703181;
        Sun, 30 Aug 2026 18:11:43 -0700 (PDT)
X-Received: by 2002:a17:90b:17c7:b0:38e:9ef9:eb97 with SMTP id 98e67ed59e1d1-396d0fc1b2fmr34041100a91.16.1788138702705;
        Sun, 30 Aug 2026 18:11:42 -0700 (PDT)
Received: from [10.133.33.138] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396dda7eb6bsm14314442a91.8.2026.08.30.18.11.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Aug 2026 18:11:42 -0700 (PDT)
Message-ID: <e714caa4-26d5-4c41-9f43-9e9f71e63612@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 09:11:40 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] dt-bindings: input: Add Qualcomm SPMI PMIC haptics
To: sashiko-reviews@lists.linux.dev
Cc: dmitry.torokhov@gmail.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
        linux-input@vger.kernel.org, robh@kernel.org
References: <20260828-qcom-spmi-haptics-v7-0-0367b3ac2e1e@oss.qualcomm.com>
 <20260828-qcom-spmi-haptics-v7-1-0367b3ac2e1e@oss.qualcomm.com>
 <20260828095932.EF7541F000E9@smtp.kernel.org>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <20260828095932.EF7541F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDAwOCBTYWx0ZWRfX8Bl4pIGUApTe
 /gZM8CXTR+QI+orYdwJlkDDQ7yeAwQJKIGkaQdH+i4B9EQ9924u0wOdlcgekLzFCOLvZH5q1yd+
 4TNp+Tdb3fHxkpeC7qvv6q1JmGs7yX4lsdxXhp0DTs/slM3z7UaU9dbx6/F1D7BFFz3V/ebyQeO
 nEWJPdsA0oXsDN1w/OnveVFf3o8wnz+0HSDzL9D/FEN3OE81Hmklx7Bm0pJkdxZFYuZJHsB34gl
 sbuwoGCdLHqxh8NyINhlM5aeVkvVJ5cIRvAuGE0Nvks5FMeTdlmNPGsnQGk6kKy7N5WNVdWWOhZ
 XKt2SC6cF4E0HAIpc/iNOUwpzAM9RZ40ZOk9Hj5cKiMsvHI/dYr4n2fpZjtHzqew7V638uboS7f
 hvEB7unFbzavqKbqi5cYoGcnn1ByXWO9lgvEMyi3Wr9iyH53lmnppNLg5ON77ekoCebRigx01J6
 gugoIE2IowW+JHmcOjw==
X-Proofpoint-GUID: mOKAZEdnquwGaRV1ZAgX5WBgfzhjr1ff
X-Authority-Analysis: v=2.4 cv=Zakt8MVA c=1 sm=1 tr=0 ts=6a94d4cf cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=skNwuv_u4mlSdyqJbrIA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDAwOCBTYWx0ZWRfX31i51eq6OVCA
 7vKZgrDwCnrQC93itHvUHo/HoiilvUxTPVm2MyyOr7rAIqQAmzCV/nAs3q1LtKXX69IfWbXoV+K
 8DSJT6EBQsPQjdR9VINWSTu0KuJfCLg=
X-Proofpoint-ORIG-GUID: mOKAZEdnquwGaRV1ZAgX5WBgfzhjr1ff
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-30_07,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310008



On 8/28/2026 5:59 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The new `haptics` device tree node will cause validation failures because it is not permitted by its parent MFD schema.
> --
> 
> commit 69b46ca6dd857a336fadfc81c3a26d260c9c10ea
> Author: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> 
> dt-bindings: input: Add Qualcomm SPMI PMIC haptics
> 
> Add binding document for the haptics module inside Qualcomm PMIC PMIH0108.
> 
>> diff --git a/Documentation/devicetree/bindings/input/qcom,spmi-haptics.yaml b/Documentation/devicetree/bindings/input/qcom,spmi-haptics.yaml
>> new file mode 100644
>> index 0000000000000..ce2c9e893a0d7
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/input/qcom,spmi-haptics.yaml
> 
> [ ... ]
> 
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +    #include <dt-bindings/spmi/spmi.h>
>> +
>> +    pmic@7 {
>> +        compatible = "qcom,pmih0108", "qcom,spmi-pmic";
>> +        reg = <0x7 SPMI_USID>;
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        haptics@f000 {
>> +            compatible = "qcom,pmih0108-haptics", "qcom,spmi-haptics";
> 
> [Severity: Low]
> Will the haptics child node cause device tree validation failures against the
> parent MFD schema?
> 
> The parent schema for qcom,spmi-pmic enforces additionalProperties: false,
> but it does not define a patternProperties regular expression that permits
> a haptics node. Running dt_binding_check or dtbs_check on this example, or
> any actual device tree using this node under the SPMI PMIC, will fail
> validation.

The change which adds haptics child node in MFD qcom,spmi-pmic schema
has been applied here:

https://lore.kernel.org/linux-input/178602255123.2917765.7426706813083510078.b4-ty@b4/

> 

