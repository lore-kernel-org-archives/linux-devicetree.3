Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11242E4257
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 12:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790166629; cv=none; b=JFhi8ET7eUKJXsD5bTZG+iRXOhGnlNND1gotot1ua2UKcGdICBMYDLREbxMU06sDr55MhP7lF/e9yM+YTS8+beMTfIk7wFsTR0JNTH+VXOeLx6wQ8YEYfg3dqE7cGAmu0EVFC8oCYNJaH/SyC1+uYfduiCRWbYD5J6lrPGLWETU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790166629; c=relaxed/simple;
	bh=5rf8O1oVIni9cf4nr5YzRwhAFIpAIxuZ32ao2m8cctM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p9LgSu9O+tbQb5ZKy8KG9o7YwJf+KyMOIzZMLTgjdknxjnyVeMfS0PK863aaFQ1cjXvxSIbDL6BTSL7idvDp7Hs+9lxC3ffJKrnlaLoEjpkjUjj8Y44U6oi+MDYY7tMHYQj044RuzxD31oT+C81NK+BOhAPmQZO4dMwcegBesDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WEFec87l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BaOpgYIC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WEFec87l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BaOpgYIC"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbY8m2637962
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 12:30:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5rf8O1oVIni9cf4nr5YzRwhAFIpAIxuZ32ao2m8cctM=; b=WEFec87lR+Tk7HLx
	YShHG8sZmqijeYRHt7G/E6SQauDGSi+r+J+G8nayG8w7XmOU6upjYsRPCbO3tqX9
	+wcsbxMvy3d98CFRsLHH/L7W5r+CQpcig38jHOmHblRw+/io+Nqw3bU2sIPi0wgV
	bP66nktIK7mcAYDMzV5v8Ps5vbBJ9rElF+F0uzhy4xeHZqHOWOr82DHx4/dEvQYS
	Hr1dg9fkhjxpz7bSQMVnzGRlEguUlQ+rfvtnaXYVKdvgbntNQh4qlg5+6G0ayE4u
	osbo1qLC0AAbuYcKBSyUpwDfl3yZA/g+8U89A8ZjQRILYVYNxX4yfqg15+M+LM9J
	+RO+TA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv9bqhhnw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 12:30:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93bfab40895so23370185a.3
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 05:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790166625; x=1790771425; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5rf8O1oVIni9cf4nr5YzRwhAFIpAIxuZ32ao2m8cctM=;
        b=BaOpgYICjAqeYgCcKYwD2y5VguTnKvdEDxn727fLWBYQZxgrSmFSrlBK3FVszMtmzc
         8dq84nXeRB9tAug4THmU+7EaEULBphmcHT+4y7PB7pzqvzf7lgLLW7J0UbjIIHTnjeJ4
         QPUjiPn21d1MaIQSQsmZwWBQBg64Xt4drN3KE9UDxqs01hEFnldmf6/qIYDWv/gLyeu1
         zI5kpAUld47cFQL/EskS9rKZSdYAhAoBUIQN5lV5FWwq056+XC28wobac+7hM/iPsrMn
         zrWGaBDIyLU+RE3Z1i2hhdukhoqIF9vWDdpd5DH2gJgd3+nPL0NCupvWv1w2yGglSwXT
         j+mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790166625; x=1790771425;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5rf8O1oVIni9cf4nr5YzRwhAFIpAIxuZ32ao2m8cctM=;
        b=iR8RwyD0xEepe0bEnyGlQB5XjvyYQ2locDeBbhZbhYpRTSYiv0MGIWBvUs1EvIZXwo
         Bd6oksexSen8jpJ90l8rZngUBIuxWdgRr8IM59KEXY8Eq+iHthNlOCsBSCPcyKIr0UJz
         VxdVV7flHyCEZfci7Lj/U1lI4DA5Ea+8z1Bbp6G6HDpUWNtyRLPETJ98izLxF5/p4dfR
         0h8JiRC7Y9naEFndWRSLQNDjZulfuG1RjkPu9eZkXmQRjq0JmiD5BLl/zLMQf3UBsO3M
         jASRyiE020dNxHfMz2vbDqXmu30R4nYxV4vDUVxBrwc9A9LwstTA8Yaq90DhT8y4Ba0y
         Prxg==
X-Forwarded-Encrypted: i=1; AKwUvBwtG39Zr3gsyJMTsIUAMB/AhrEWseXwUaKwBjG5Kr/mQf01WQLpbLc9c7AN41TiFbx5WlpOTaFxRhx7@vger.kernel.org
X-Gm-Message-State: AFuF++lLE9vuMFNByNGINj5YUt5xE8oAA7mEWZPJSOBjXqjeZ2jki/ty
	tRN+Ml29GVcqtQCvSfGOO1qteUI20pZAOb/HBcQJp2BaiEB23/3G/Js4o7V2+vmvNvgASDXnkx9
	6Nrnifq0E0ny0EMhOB6ks2gnuladZcHi0Ad1tRskWc1u5YWFPk7f/FsL+nUrwy2EZ
X-Gm-Gg: AYBFou37C8dBkXFP7BaXODsxX72yiCfhNeh04bjGH7y/iQ0C6Nu4T7Jybh22DqI3BfT
	kw4fd3uKgz0DVYOWAKtkfjQBxtnYXCpmrstKzfZTukPXYs4ZrMNv83T5B+XIlxMtwCBcHIm52dn
	oz/Iy6OsTYZnqEFpeaTzZKWJXo4aEKFSNYgOCM9v7HQZDdZBYQwS94dPloT0aJmf04yw7+THQ0u
	DiiqpyP9gbwWDve9m+KZ9pZA8ngLw0Gke6t7ZU+EHfqfB6KqlThP/fyy8ZIcQOMBhQkCQbOaV0S
	O1zINIC9/EGbVGy1CZWsyI9ULYFFjeF0UMnMHRVSWE77g1WiTQ+W0EjetYvzwNDX3gKkmKuDKD3
	kItqnU1vkz0PdiRNc94U4KQ==
X-Received: by 2002:a05:620a:6f0d:b0:939:8148:1e3d with SMTP id af79cd13be357-93c250f4f2dmr339819585a.2.1790166625128;
        Wed, 23 Sep 2026 05:30:25 -0700 (PDT)
X-Received: by 2002:a05:620a:6f0d:b0:939:8148:1e3d with SMTP id af79cd13be357-93c250f4f2dmr339813185a.2.1790166624584;
        Wed, 23 Sep 2026 05:30:24 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae65843bsm116549566b.38.2026.09.23.05.30.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 05:30:23 -0700 (PDT)
Message-ID: <d8f0b127-adb0-48f2-a5f5-1b6134e75456@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 14:30:22 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] arm64: dts: qcom: Introduce Maili SoC
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260922-maili-dts-v1-0-ac2b1b76bfd9@oss.qualcomm.com>
 <20260922-maili-dts-v1-3-ac2b1b76bfd9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260922-maili-dts-v1-3-ac2b1b76bfd9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: NBRjOOTym9vX8f1JuLjX7nBFpxJFmYCa
X-Proofpoint-ORIG-GUID: NBRjOOTym9vX8f1JuLjX7nBFpxJFmYCa
X-Authority-Analysis: v=2.4 cv=WZuZ+EhX c=1 sm=1 tr=0 ts=6ab3c663 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=1mxdLe5LFHY1OMs2JWYA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0OSBTYWx0ZWRfX5qDozWEb5APA
 NBZ6z0qcyn+8AykZnb1IhzouU1t1cd0NDT34o2UEIsloU1DfJ8Z5+eHgKqIAcpLnQ1dJC8hR9B7
 2+qIV5iq88w/PKyYZWRMV1ZaOCOhNVs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0OSBTYWx0ZWRfX8UduSR8ahOhr
 8aGqVeg9aWCHnngo2LsDeTwPpES8nEO+xfNx6o76Ci5aqy0SWT/Xtk80UtbbPSkzeajhVJVICj4
 vmKvdjIr2uXZ5Nflo210EbK7jD0M+CDELIXkHGG+UWEQhO3sHId19UU+IhmrXLcCQK4vsDLkifs
 wzbUCOXL1B+gtuoARpmonoA2OrZFvuxYGILtSD6DEIIpb0PXvZzmqQojJplX2rXU8T2IJ50fUzq
 MB032Dp6eOlN8EzIqYUjKPSddQP1ZrFcUt2XkvhBwmYSrdzR6OTzltmh978Xg+KOCdwacDeomam
 1/zoUY4cgAbxCqABWpwsFuSGtcOzI2TlUxipERCkEKT/hT4MDIlEsAQ+aa4HQwQ0Nvy68nx20n3
 IG3+G0nSmKio9pdJMFJQc5d4Y2rPXHyyqcRGUrcpSTOEX/lKYSqntTy9xQqGX1hppIUL81z9h4G
 vK1jXk6kvg3a7sXfMPA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230049

On 9/23/26 1:20 AM, Jingyi Wang wrote:
> Maili is Snapdragon SoC from Qualcomm.

Please submit a patch on top, using 2-cell specifiers for iommu-map
once this one lands, this is not a functional issue

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
