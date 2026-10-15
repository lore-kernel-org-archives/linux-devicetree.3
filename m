Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CE24ACC82
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 08:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792051255; cv=none; b=PZP/kShqWggIt9/lpMthAQx/DYA1+xSUgSMkC28UMmfxoTuQtNiIh58vdtEiKth6U++Z8+QNKMeFjAhhWQNLHC6Sb0I155RIcnBhDNZQksoSAcOu/iAgV5XfsH1l8PCPh9JhjVXxiS9MWAoDFSRsXq2xuiGuGLg9lCUYHrPwwF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792051255; c=relaxed/simple;
	bh=TPM8vV1gQRN8XJNOlZ+IplrwPVMUQQzVkBEfIEJ+9VU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NruJJ3ZAgqm8k3/rqiqjSiBxRioiYCXqzNFwEsR+LI0E+IhaxINEVlaS6hFNuJ5WlCZqqMCM63kQvgeaPqguR9T8grfPhoh+aaY5fuNgPmQH1lOJWB5/HrKD2k+uaadjeGb8wMKX/kyZIJfH1oqJxo+m3J5EPRkuc7UCyDFYscQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FS+kVGG1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OK6kK5NQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FS+kVGG1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OK6kK5NQ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F5wcu3500265
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 08:00:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QbaMbpddYF5G4M9nlH6IkfXgYjjKMVVez32pIFxAdeQ=; b=FS+kVGG1XCEMD6WM
	vXF0wtZKd5kBwyLLp/PcXY8KPaac6MgH4yyxlcGdBN5l0sbxoT47xZbWtS9CY9vQ
	jDyR4PRWZcsnyrDWKqszPmApWndQhXmMZAeTW/CEqKDor/1Zw5T8ed+scuYXbH5k
	uIMdDilaSlzeX1sqmZWBRdRKeyZ+P0TNt9MnXrunYBxoLFgUuzH5qjXdxUhFtyG+
	jeII7YSwVcbSeWdtG5rJB48jijsHFlyTHAO28xzDeODVr2LNUrP9yMYqCFYm8H1E
	5PeNHqJ46Ugk/PDa6aDU7rqFAXjK+hFBjAFxX+P4OhO/BTiTo1oDwRjP9934Q/Zi
	nOmhMw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haagf3wwv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 08:00:53 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91795e52969so12890066d6.3
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 01:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792051252; x=1792656052; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QbaMbpddYF5G4M9nlH6IkfXgYjjKMVVez32pIFxAdeQ=;
        b=OK6kK5NQLCSgS507ZiBB07AG/0iNVrtsffejy0dTL5O2194DcmkFzZDA3WIj2QOeN3
         6Q4w4h4niCoK9W1aGpkqxzNbgOHseoLiaJTO+z3ZUDeYHxbT0MnqnvvVSjYq9sXVoyX+
         Sdml+NhTQezAWMHBdBL9xxlH820R8mcpNYsd3k7+ybCdk/xnZPhJ79NrR9vRdjTevkIu
         Lw7jh6Zj7uJXtQYO0wHbE19l6UerkmzQNFa+KwT/54hWwDCO9Qb8xc1NT1AR4+0WvAB9
         yIfM7tLRODuwu9ZGQ5QQcwkZ5Xp6vX5Si7gZJih3pKPHi2jOod1nA+eJaX438alTtVeZ
         39Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792051252; x=1792656052;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QbaMbpddYF5G4M9nlH6IkfXgYjjKMVVez32pIFxAdeQ=;
        b=NLhDejzaM1Xblwe4TbSbWklt/FgJKB/xhDV8gMCB2CzR6JmbDOywOGI37uI3JPXUiv
         lvg8EXyNZ/JfYWo66dGt9TZjGBzgfVdtMBInkjgwIvGqjZ8C9lD6SKBov79QHFgXkZhE
         nOeZNAnytuNCohjXCDxUwhaujpp7VmBWaHs5oDXTzNz0wPV7hFHCg1PBgc3j1q+HmCwy
         GbL7tpUwrOWWx5yGL3FaSeCqHR8o8jQ9y32Ovp2oseFTf+VzystyO1URrAlXC6+eBqZA
         1qQpTeB6B7A9Q9zZ+SHNw39okhtAgrny5ssE5OAOjCb/z5TCiF3dxfAKovYdccXKxDoN
         aVMg==
X-Forwarded-Encrypted: i=1; AKwUvByxnOiKRmAega8Ck1c0Z99gc4O1lB/YDNuAhDEOQ6KmJT5gKvIn8mO906+JxERJfG8cOv87V15b/Kng@vger.kernel.org
X-Gm-Message-State: AFq9FYJikKsxMyiJureJTlP+JG3CjfFeaqQ3aNCDkbWugHKqZWOvOASV
	y21dIPCJbkEzD20SMQPSxBy9V1sPCVXVLX10vvbsdYp69ql96Rw3HyiwLLVGT3ZgwlcXrqyHYLZ
	h5bNQ77UwKUT+Z6cMoXTOw3wLpWvvcduRD/M5KDKrkl6Ra4OBhHItYOoM8JqpoUoi
X-Gm-Gg: AYBFou111RnBS3wuS4Q537TY23QEZur5EFPcse7rAj+JjXQSenLuiGkZbSSyIxX0yn9
	2fIdESB59o/yhNHNrB1cAjxtQOeXoY7Qkst/7sIH7MjySwy0y7Rr/Wol2oRp66R1OuAhzSxxOrj
	1/yUqjafIycie9dgwZkql1hzH834XkwyVM1AYmdZR37zzoXDdjj0/i3BbSYpN/BW5HPaQjESTnL
	CKwgailXAnYy91lf6DiUWWyr/PGGKjK20WxSU1L9Vp7EQEnTIBzSOkLpLhMnG92LTFMZjHVBo1y
	HX0XCUg0NX//8KeWVPZEeGm9SYWS14mFLm1GNE0seaAX+DxfNdoP8C7mOiwjFJ09dA7lkHLoP61
	ytbPVtr0/pHtwmeYNXzMLBQ==
X-Received: by 2002:a05:620a:458f:b0:93c:61e0:81ff with SMTP id af79cd13be357-93ebd0a3722mr3603727885a.1.1792051252305;
        Thu, 15 Oct 2026 01:00:52 -0700 (PDT)
X-Received: by 2002:a05:620a:458f:b0:93c:61e0:81ff with SMTP id af79cd13be357-93ebd0a3722mr3603715685a.1.1792051251455;
        Thu, 15 Oct 2026 01:00:51 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3eda044aabsm91788766b.57.2026.10.15.01.00.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 01:00:49 -0700 (PDT)
Message-ID: <6610c1a0-05fa-49e6-8c17-8846afd312fc@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 10:00:48 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/4] arm64: dts: qcom: glymur: Make the ADSP remote
 heap no-map
To: Jianping Li <jianping.li@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com
References: <20261015071511.977-1-jianping.li@oss.qualcomm.com>
 <20261015071511.977-3-jianping.li@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015071511.977-3-jianping.li@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzMSBTYWx0ZWRfX3x4R3zHFl17c
 Y2wQ0GIYTW/2Brvc2MSNaUYr55zhKIeGk0/+l/91qqfoKROu0Budm4x69KwQeS6oIpwOmfEnXHD
 lb55qsjgKADH9WDwlEVDjCL40g95gOoW4AAZVBO1JBgSvlzKZpRPf87hluKMgAT7YPtGG0zPOSk
 TbRcgXvoWE9nVdnN+Ui5z08Qnifwqh+7TJWzPabdEqrkBR6I/hj/tPkiek8T5Xr91ICKNBR4PQc
 0s/1ozO9PQ3sZULY+mLtCekuOga/CAOKJ51mD3dyxmD1rGBcxz3o5vjkIn9OK5YIEi+YkGl/P2Z
 rDd8bLIwu0fzGDxeo+bOr3QJTsCUifuOYGA/hEea+Z2VxetbByXI010Pz+PSRVWnmlJ36pckkLC
 AsX8ur7oUXic2c63OOLRQZCfcYzQaC95iju8YJ38KMW5/vCt4JsMYPe9lfDbXeXnBQp3AShUTsu
 OxKu1kmgzv+ApIC9rbg==
X-Proofpoint-GUID: clJ3LceoZ2HbhdRh-rE7LDjvC5bA-xgD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzMSBTYWx0ZWRfX4e92nbzOSJSb
 TQw7NTBjH97B/+yuZiBr+S8IHpPYJGRo1TxLCrpn4G48K4A5ETQa6r4zvBGxapghMXeKUGarWR3
 Fvblt4ux65IDLbaZdfi16ObJo9QYWKk=
X-Proofpoint-ORIG-GUID: clJ3LceoZ2HbhdRh-rE7LDjvC5bA-xgD
X-Authority-Analysis: v=2.4 cv=V/noQuni c=1 sm=1 tr=0 ts=6ad08835 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=CjiZw0He1JKpzbGRn1AA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150031

On 10/15/26 9:15 AM, Jianping Li wrote:
> The ADSP remote heap is declared as a reusable shared DMA pool.
> Allowing the kernel to reuse this region is incompatible with handing
> the entire region over to the DSP, as HLOS allocations may then access
> memory for which HLOS no longer has access permissions.
> 
> The same configuration has caused synchronous external aborts on
> other platforms when the kernel accesses pages within the ADSP remote
> heap.
> 
> Replace reusable with no-map to keep the region reserved for the DSP
> and exclude it from the kernel's standard memory mapping.
> 
> Fixes: 67641246eabd0 ("arm64: dts: qcom: glymur: Add memory-region for audio PD")
> Link: https://lore.kernel.org/all/20260701-glymur-audio-v1-1-2c3862d95a09@oss.qualcomm.com/
> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
