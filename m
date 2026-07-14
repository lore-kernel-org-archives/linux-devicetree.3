Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F54320A00
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 13:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784035633; cv=none; b=Uj6s+U4LfrqfkK/ZAaRjG52tvDmeHwj/95gmouV3V35GZAwwbksktHLYCaaNn5mUeF6YXOYRQsuKBGnZatlsvI7xDz9TLwy9RlQ47wlqUPiNFZpUl3gPYdYRu1QmzfcgJLTw8KVCfJ+nMDpF3mq8GZUwFjL82ZUvwssjYzJC4fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784035633; c=relaxed/simple;
	bh=iHnQjrdhkq0yToVO/2sP88yjAA/PrFDvh7chWWZ31h8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ixDmNl0UYEjBMq1041QG56nYlXK7JtQl3tMjYZyqbJ5xNZm+AMJ+7YERucBB7rjjGMeFRY5QL/z2N7Yv1ZGDCtbbNp5lPzPJQsTWRufNf0rJd3N4x5AmWUerN6FEmvnDX8Alj2dd4iqrRQJCFWjiI9QDLI/+3gN1/ixt0i7EmmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ShO+cN5y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QmGt51bW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ShO+cN5y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QmGt51bW"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EBO9CE439348
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 13:27:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iHnQjrdhkq0yToVO/2sP88yjAA/PrFDvh7chWWZ31h8=; b=ShO+cN5ywcm8pBTw
	OnALHQ/MHbxlO5oPszMFb/PC2HwHCoolKPV0I7qHlaLKNN861PoLeDu2JETP5fz/
	o4r6bfrbP/7UZBIAxCL1xkxyBn/imhu58+OpAEvLEc1/SchDzzwzcaD0bsh8Vsxw
	aGtTlR0Wp6CrXni6J9Ff2i5sI4ep4XtrIs3KmIYcR6TDO4yGA1Kr+JvKCkM7uiK0
	4Rao56yhhSH2LUY1XxPGG0MkJBNguq5Hw2Rs3K2IGseFbtXSgRPebbVeK+K0V1wg
	m/asjob9YLkGke8lvWdYHADDqvYh2nmN+QPNUITgsWHskiEAedmKqjygK0hArsAe
	tufEmg==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdgudhats-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 13:27:10 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6a372a5be46so4936576eaf.1
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 06:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784035630; x=1784640430; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iHnQjrdhkq0yToVO/2sP88yjAA/PrFDvh7chWWZ31h8=;
        b=QmGt51bWBHPNRb0kiUqk35twa8pcZ9Jjlx7dc9GmX4Rzd8CVv2E8toM56+GI3zlWVm
         CfNJccoqyOoq8uc8igDfqAgmzObg7nNWEDlzLlpZ9DhvTinp0hrC/L7IJXPyIvBQxddK
         bP2ue9OY8jA+Y+mnNgrIGg14bGYbsHKt9HFfUipI6iXoKc9fyidLWIJddZZI33zJF4Sy
         vN267mT7pO7kqE2jq4HaUTvsZ4ED0nPq1Mpm97y612gRTVMI0pSM2E6byeo0u/f4Uo7P
         Us13wANMrp1DqG65UROKm5KIz7Ku56LQkmU0nIal58S4G51sWQJTbG3GAKLfloZAZqM5
         BacQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784035630; x=1784640430;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iHnQjrdhkq0yToVO/2sP88yjAA/PrFDvh7chWWZ31h8=;
        b=cSan5e6iEi3H71OLLmtUKvwL3QmwPyeccte74P5b+EJE267WJI/HSE1nAAt+XguQ5t
         WiE/tOxKd1CUs0zU1ePLSkk3FkUt4cKn+qOyeVWF4vJrkd8uyF9XcFW88XPpgJbfb7Vx
         d1jcYYvHfLM8Ejea9BROp2evsdNNfESvsXEecK7ZLpvfhjncSs6WmYeQEs7dM+Qb8ku1
         XEf/ObOddTLCZcjsIz6aCLSIi40hxEhYUKUa6ppc/dSuzJNnjbeeZqo5I5FX54eT45Az
         fbfh5r4YnI5hU3euVTdLjcFPDG+O62IM3CAILGIPlB2Pg++pf8iJGaAQLnk+jxgBPpYG
         l6Hw==
X-Forwarded-Encrypted: i=1; AFNElJ+A9SXTUQ6y6BFc8clw/5Midt17OEq9tbIPQfWqiUmGuXwldU2pziwulL+VCg0eVJaCf8JW4qtnZVr7@vger.kernel.org
X-Gm-Message-State: AOJu0YzzuUxMNQMq1ceByuJzocijP+w/LOgT7bt5EOfwXP0IIhFgRu1k
	3aDOFcQJBE6hjVzyReXzJGuPQYOe3BMyuGJzPbMmAf8tFhvJhzkbzTXvH8MuiZD5vZ+9HEMPwfo
	IOvwprkBZ4I6uyISaBhnpnd0OqYyQnuSQcj2y1EDXps+DBaZIW+Ewc21y5sg6AGG3
X-Gm-Gg: AfdE7ckz8uOh23OMt+DoOPqRshB/ohotvJNrKLaPHOlJQL2v9/5e9TtXc+Dtb1ajI0R
	n45atrPD0AQB2nR95bRN/mAnHokg8gY+FORDOE55XIqAageqFYS/KoTFhUdDPRLVdu285barjjk
	05kRe5me5+x4cmDKEHQFHejZOdMv2PK3mDvAaGi7PdBCBS0EUTPOmB4k0TTEwPdk69tfGVu1czO
	4adhgG9BkJmdD1XYOX9nSW8wAQzp+9B4oW56vmkJPTpQJgedE7TFfl7CZUct9GOKgLgQxVPRHga
	/iBwxWLLUG+SOEY4elFJg7iVf5nX6OTe0Zy4tfbSasGjG+fMxdQCLq0vg0CPqtGZsI0BbGe8Wab
	4QgBaPSfLvCWAtPRn0huXz1gbRqmMIBHcnC0aTHKS
X-Received: by 2002:a05:6820:6ac5:b0:6a1:7644:7728 with SMTP id 006d021491bc7-6a3cbc0eb8emr1157668eaf.67.1784035630415;
        Tue, 14 Jul 2026 06:27:10 -0700 (PDT)
X-Received: by 2002:a05:6820:6ac5:b0:6a1:7644:7728 with SMTP id 006d021491bc7-6a3cbc0eb8emr1157654eaf.67.1784035630055;
        Tue, 14 Jul 2026 06:27:10 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4546f12a6casm8842235fac.8.2026.07.14.06.27.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 06:27:09 -0700 (PDT)
Message-ID: <ba15bca4-2cf7-42f2-a937-9c2b5217a2dc@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 18:57:03 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: qcm2290: Hook up MPM
To: Marek Szyprowski <m.szyprowski@samsung.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
        "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
References: <20231215-topic-mpm_dt-v1-0-c6636fc75ce3@linaro.org>
 <20231215-topic-mpm_dt-v1-3-c6636fc75ce3@linaro.org>
 <CGME20260709114143eucas1p18463122323bdeae8e63b1d13cd626b55@eucas1p1.samsung.com>
 <dadff7a9-bf04-49fb-8c55-5605e99be7fc@samsung.com>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <dadff7a9-bf04-49fb-8c55-5605e99be7fc@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: g0E1cnHNr_nVohX2fqlqNyUK260Uj2rd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEzOSBTYWx0ZWRfXyu4JXq+hGCQ+
 CqsTXEgLwYba9gOsCNHDqMP89WhP5Y3Z9cwrK11gbPsbrzve1VrQ6lzGf74rgtzMFLPlkiM6xA/
 ffPLYC8dfgg9+tgCw8BwWS7uEHx0YQ0TdvVngCFvHXnjkwhoU23V7lFtJC/ArQkNBLt7sqN5zCJ
 nqRszxhFJCQstVRCIuuvr3JFlH9XcLmc2pOoptnR2V9/Yne5LwJsQPqUX8mtfmwlXWm1bLDEIBX
 kUhVa9ikkJ0xixSOkehCREzAKjRTREB3ejbxGOPzZjSqy/rgWlfc6G0k8T6f/EVlvuaZQfaxu7h
 0gsldDJl0qsaNCNkt7Demluguedu6AskpFhjQYQDZIeIhjJ4v3itvhPRhRD62vzxDlxbfhTQco6
 ackzqndh2KwmZyvM4fRj0UeyoeaO5GYNpOvT39mLhaVn206GlavTQAuIfKVdGp6m2+VWAthdOsF
 hCptYZFkUuZZl5AyFQQ==
X-Authority-Analysis: v=2.4 cv=T/O8ifKQ c=1 sm=1 tr=0 ts=6a56392f cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=EBkR1DUde-yCmfESiaoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEzOSBTYWx0ZWRfX2GR4wFpUa+Pq
 kPsWHgD1E/3omzHuxjLseGVb5n/FdjSY6OPUIf8boVZuhjy+RjgXtNgyYVHxKTN7REmatbhfzNH
 Dlhoz4U9hcZWM+CEzVviHsVtIYUgAPU=
X-Proofpoint-ORIG-GUID: g0E1cnHNr_nVohX2fqlqNyUK260Uj2rd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140139



On 7/9/2026 5:11 PM, Marek Szyprowski wrote:
> On 15.12.2023 01:01, Konrad Dybcio wrote:
>> Wire up MPM and the interrupts it provides.
>>

[...]

> The question is how to solve this issue? Is this dependency really
> required? Would it work if the "mpm" power domain is set as always
> on and genpd framework extended to support such case without
> triggering lockdep warning (it already has support for irq-safe
> device in non-irq-safe power domain)?

can you try with [1], which includes changes for agatti/ qcm2290.

The series is sent for other missing timer programming adding in MPM as well as probe dependency issue, but should
help in this case.

[1] https://lore.kernel.org/lkml/20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com/

Thanks,
Maulik
