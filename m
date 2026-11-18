Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794984805;
	b=M6egI+3GP39NWf6r1V+P6NZtj+5K84tzDZV+i1tTeS0N8EdN8ScFk76MRsyMhfqnHUuk
	 mZmXZzlZxVSDfYuKTVc/LgXDWjEKC7xpHruU7Cu7UiP4MK4VB/JbOSJ3n1gV/15EP77iQ
	 oBYAmyNKfK49L3QpEsCGpWuNOImcBWBespfGCbNylZDu4U2TgnEwmeopN7NtERf3c96lu
	 XuOLmaeVlPQafZZ/hWdAehsqB/JEtKLZypmSXXWUrOucJCnbFhD38e5Tn1GHeNJGsydNz
	 jXfDWTKs9xuEYt3D9Y+yMPGzcrYVeKw3fRXR1UQXmitKg3SCsVEFF0LgYIPf6G+RQ5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794984805;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rEUYLKQhmWgiSOqECsPQjbXJYCWlUHA/JEJFzARsK9o=;
	b=iTUMEYdPphuz901huRREjmwmss+T6SPmwEJPdBFTEMkYqzTYC2vyz5o3K2oybfxxjb4I
	 lrQPKZzQWQT9CfZOmS0FG+YnZWG55vXmz5jHgIdLLKtWrmDkW/XRBb0+xRuLKcCD0Txgm
	 yRQlfRzpb9a7DhV347lZ1HN0BNNtKZN9agmnq6MXSBko0MazMqSZhTlQHJnmXN5Rc6I8f
	 yE193sYtIag/QYxcISnv88HiSiYvA9e2mpSOtybzqFN9MrMU1EGgeN9VbD6MUcpdLTyla
	 Hn9pjo2lqm9go0fhhWVeSfsfBZzCIpnjyElgkaAGDByuiqaBDsl7DbE3r4UqJu1hOaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jq4DSUUF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="JaLSpv/x";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5302B606A32F
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:53:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5302B606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jq4DSUUF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JaLSpv/x
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UtAa3371421
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:53:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rEUYLKQhmWgiSOqECsPQjbXJYCWlUHA/JEJFzARsK9o=; b=jq4DSUUFY4qxxOrO
	4cjBLfKTqSfNpHioraIwZA/NG20jyjWPuZChQFn3SQR4So+HwXPSDOd6ShoMD4u/
	FBRMf4bqzW08Uj1vKVm9oeBvo71ZiXVA++lcNJMDKyYzYWrWybJMlWpKucTKl4TR
	hwFWWAdX/GCu1sAIT7p0YcbTzFopnUUH+4M+qQ695xYs52CxbYVb5DdGXrS3KHBi
	+QO+jA4KzQTGVXWUUTu+jXb3JPsRaalWmJNb/xey5GeCVTnUWgkmwQhJ7rbPVNoN
	NcODiE2NpxB20GUrxyBuji0szWjXQfcvxosu9G1ZEh4W0rf4CqK+bBPRsH1qp5va
	IpTWPg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8sne2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:53:24 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cdb8b260bb4so442453a12.2
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 22:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794984804; x=1795589604; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rEUYLKQhmWgiSOqECsPQjbXJYCWlUHA/JEJFzARsK9o=;
        b=JaLSpv/xrg2YmBQiUtFOPprkGLhsS3x+c9oLIZPMOT+H5ujgueHPV4DO+XHSRSkN17
         lH2Mi2frCktdNJG3/s2hHXfbC+VdJWziDr3YgCz5FaEJGQ8O+cdLIlNDB3DZ7rX16uJQ
         JdAufjmeahSAvBtWqWsbq4FK4AkV/PjDSarydRQFGZQTYX6eoQmwOhKDqkSn0Zdwm9Ts
         bUzYEslGC0KdWJTQRK/50P6Z1sSk3/fM+Qp6wi8Mer4/MQK007TUUDXGGdCse60fMYEU
         1CHx0KkTWLwx5W8MlRxu4woExnjfb1Al6vQlyu0t0ETZoXpuNqS0vheWW8N7iiODJVmy
         p9tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794984804; x=1795589604;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rEUYLKQhmWgiSOqECsPQjbXJYCWlUHA/JEJFzARsK9o=;
        b=sjGSLH011Qo4UoTwWcMpm2TiEkr3T0Vk8PujtYuFKWl7HV+LpBRr60fyMrhiHXspWL
         nFDOgvRZFLSy4F+sf7mPL6F+QZu/4TgcvuV9Y7I5Zdp9ym/DMgQjTlxq4kY6AcaXmXBK
         VLVyyygtwlzui0psRgqf46NVJTDw++CE9RAcmJ7tgtniUa+8GmoQbGrsn5q6AfMlLgp7
         s/dez1jMzZATQ/LYCkVdWptweZzsguPAbEjMPt6ml+L+4/RcSRNtP99NxDH5X7FvVw5w
         qH7qCbMERyeY27zBMhWRft8H8Pct0X52ooXe5rP3MEwLAi2MfFJQY7apRudvpJGSByVs
         RhQA==
X-Forwarded-Encrypted: i=1; AL+hErEvNyKgS97Mc0gdQp9aErqPF/WhM9HEyTfzNhXuiFwCtjUsEwCYQLT2L4SqK95mGuRScQSKCHV0UVlC@vger.kernel.org
X-Gm-Message-State: APuU4Z85E2cyPo4puiEZYVWwC+jzNOMwxkIR1JA/oElJk567nxaf1+IO
	YFdb6C4Ziv5vBrcAd4WvtC6M2fScJBhT4lh6dY2zGsF7OTJ+paUYwZ7BkwHAeQS7OHkGHtC+ptH
	WEmrxEmFBNq3xWyPZLKVrOGmCDXjKvMtJbB11QR2NGAGF9fKnvW2jf23wFLFO6QcOJhS5HOrp
X-Gm-Gg: AZFdTZdjRbec9EnKVviVqW7bxQdfZMyGHLytCNpc7Uej0pmGDM9szXoqc350eIqLMn2
	kIDrUDPIBr1NcrPli3zYOTN7neFgVcLW0g5di4zjKfv8kLExbf65+5aubeJW8FJxvbQf0lBrBJ6
	TpSjpe0GOK+rh/RNCA86gi/gEekMTVSdhiOfubm57vcwuJ+SzmgwbD6qr72JTSDC/krX0gHdyoB
	4HrWKnsh1GHRYtcs8yENx+MSvCgWWFK0Qq9t9JSJS/Gy6ZtatCssxq88+1LKWRK8TNeDoYCVMOb
	a6HM8F3PU92cjUBMHeIvsxdafcD2HxKlLbnoKdgvINIWo6x9BTuTtbutaa6HJlNeF4nwvRdiScR
	K9DwEc1LaNzIoNR+5cqdErh7G33Y8NBAvAVCuoXW2iZJq+Ij8spRQXBLzDFpSzOtYCogweYmht/
	3f
X-Received: by 2002:a17:90b:4b12:b0:3ae:6fda:78b1 with SMTP id 98e67ed59e1d1-3b3d07a5319mr1630663a91.43.1794984803784;
        Tue, 17 Nov 2026 22:53:23 -0800 (PST)
X-Received: by 2002:a17:90b:4b12:b0:3ae:6fda:78b1 with SMTP id 98e67ed59e1d1-3b3d07a5319mr1630645a91.43.1794984803323;
        Tue, 17 Nov 2026 22:53:23 -0800 (PST)
Received: from [10.218.30.203] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac4ddecasm7774110a91.14.2026.11.17.22.53.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 22:53:22 -0800 (PST)
Message-ID: <10c3be7f-f329-4612-a7bb-c033fab6f99e@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 12:23:16 +0530
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] dt-bindings: remoteproc: Move iommus constraint to
 SoC-specific bindings
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20261113-shikra-el2-v5-0-8aca743de97f@oss.qualcomm.com>
 <20261113-shikra-el2-v5-1-8aca743de97f@oss.qualcomm.com>
 <20261116-boisterous-ancient-macaw-8cc00e@quoll>
 <20261117155208.wbnm2hldjrfomryh@hu-mojha-hyd.qualcomm.com>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20261117155208.wbnm2hldjrfomryh@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Eu1HPicA c=1 sm=1 tr=0 ts=6afd4b64 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=Q45aZnUg8FDEnReNsB8A:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: 7Srkq6SCCvRqyj69UEVon4NdPeWb20xR
X-Proofpoint-ORIG-GUID: 7Srkq6SCCvRqyj69UEVon4NdPeWb20xR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNyBTYWx0ZWRfX083cq24Ou7zu
 XqWzBQkPYJPMS6Qw5oWF8aV/FTsuKr0uWq87wEJzYsPbObXyHZz0BIuFVVA7YLR4As4SdLGpMQl
 n868AqT0AiWtbDAeHm2F0qC1Gg7KZhHDl61js1hIylAq0wbqXzNZ6K8Gsg5eSJ1nH9GG8cMJysy
 6f1AFVjmkN7sc7TEczEX5e9EOPoGrSkrOWYjqFKYan76Y4aMPEmeBNw11ZSShq9prVCZDcVXOUc
 qQDqec2c2Aj4vvduzImdfMPnpyHsSfjNJ3gwrfbeABqNzODS8m24TKrSUaaG9eWgajmKIi/uO1T
 yVOiXVlv9XWnSsB73Q/vECXAgglXcGSUB83SnyJubB7dLQayXwYXE42pwgvDRFugoGRgdgZTfmT
 pIbgtqSrRQfs8Kfocs3ZvN+RF15mE60BOLQIYsrvyMamS0dWylzAiA2UpHWK1mkJe+EbNd3EYlz
 6fcmbCwW8f6KyEdfUJg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNyBTYWx0ZWRfX7Nfwm6/Ntji9
 4RxhLJ5FzmKrudn2+uk+I6rze93Su/CJctFdYeLTQlhm4fVugHMXH4SmvLPesKmhExZtk5VEcuJ
 0LM7QEZPgSUt/84fXK2uNpc427J8C7k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180027

On 11/17/2026 9:22 PM, Mukesh Ojha wrote:
> On Mon, Nov 16, 2026 at 11:58:20AM +0100, Krzysztof Kozlowski wrote:
>> On Fri, Nov 13, 2026 at 08:02:20PM +0530, Komal Bajaj wrote:
>>> qcom,pas-common.yaml limits iommus to a single entry for every PAS
>>> remoteproc, which is too restrictive for SoCs whose firmware uses
>>> multiple IOMMU streams.
>>>
>>> Drop iommus from common binding and let each SoC-specific binding declare
>>> it with its own limits. These bindings set unevaluatedProperties: false,
>>> so a compatible that does not declare iommus rejects it. Declare it for
>> I do not understand this sentence. Compatible cannot declare iommus, but
>> anyway the bindings do not reject it.
> @Komal,
>
> Yeah, this patch should prepare for the 2nd patch, so ideally this should
> be a no functional change patch. Any constraints change should be a
> separate change. So, ideally, this should be removing from the common PAS
> and adding it to every SoC PAS YAML that inherits qcom,pas-common.yaml.

Ack, agree. I will update this accordingly and keep it as a 
no-functional-change.

Thanks
Komal

>
> -Mukesh
>

