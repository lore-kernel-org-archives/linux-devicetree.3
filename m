Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697FA31B80D
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 19:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789326641; cv=none; b=C5YPY0MZ7yooyC8RcHRIfXpmmaGg4vxGRltue+UIq1RAZCZNby8qBTfSM4ajykAOIa6twgYjkJGhL66domcCOXl59PzTQiQCvFiv03k58bXKM+K4SaZEjvvDMlCoMsLzru313w34Mgwg02dtaGBTpC91XdioPlGB/tNeBTKyVqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789326641; c=relaxed/simple;
	bh=e/um0nBEWHtQgflb/WCLsfYzgdoNbeZ5vCSRZNrU/CU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XYp7KQkSAzqCRICFpW5C2VxCfvH+wDh3HSG66ioWQXZceGYczhxkDykGlWCZsFbgI2GfxZoie3stlJhZdFqGSH1z0qqH/aY1QHIF2khLXXMvu+Bes0zkKmaR78bV+jQNHcUkjUG0qqZdl0cFL0ZmL4ha0s9Sdpma728OMGOFomU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=enfu/s7m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TTRWEXRW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="enfu/s7m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TTRWEXRW"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DI2tSD1749645
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 19:10:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2MyXeXcXwlNzpKjPOfg3/kpeRw+I2xbOQZRZuUgi6N8=; b=enfu/s7mx37joJ3A
	uuVqjRLNK2gz6X90AEI/22t80xPENQe/hfu1PXskmmh0uVc4dWub/F7XeIlaCH8a
	NecfWw13mJI1iK1otlxXOs1xmZBwGctAU21iMfTPFRkMXWGEbTV8LhaQEsYtkZi1
	5I+dysyBPzazMpzSbAAuFw8CoyZCD60XkB8Jt4ayYUv9KXHjPLiGsC+U7WGRfkLe
	HxPvW7dVpz4X+7aiqp+boTlkC55oNe7iZE5A6bsB1FLEqXJC4DVEVk/IlJlkJFEe
	1W91520AWo0ifcUh7YZ+nLeajvacbMlhf1WBGyCRZx8tU0Xi7EnIvxCntithhu+H
	IkCGVw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cbx6b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 19:10:38 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cfa4e4684bso62243045ad.2
        for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 12:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789326638; x=1789931438; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2MyXeXcXwlNzpKjPOfg3/kpeRw+I2xbOQZRZuUgi6N8=;
        b=TTRWEXRW1133x5TUlv795CzEyXGzvWvI8KgG/0dBaTfEvF/zHx5ZFKGz22SJutsIxQ
         /Jd769MkjfmJfe6rTJqqhPd10XPK8mPUzoxhF0j6z+UbuNJtFVFDS9AiE9V3g01WDBU3
         rrCKANNthxtdlB4Dog4u76BD+vni9a3WnTeChx6XNoGq5o3yIdtRf1IZObpXGtmz10ym
         9JwjdDMnt7YIyTOEUgiRBFhnjVKaq3ubnsb1Ph9BxzFN4uJOHoeXQZK9YJk3Pd71h30Z
         UKmrSHHZYINQlOQ5pZdlB2w1G3apCFf12wPoKIIGKM0y6upTD4NZ3b1o+gSME0+TMJDA
         Ejew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789326638; x=1789931438;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2MyXeXcXwlNzpKjPOfg3/kpeRw+I2xbOQZRZuUgi6N8=;
        b=XvLP0tl8Z53Q8GNevkte6bogl31AFyYaoCPNKc0xIy4nrxo/0w/LSwQ/ifY1jK1p1Q
         rid1PI6diSRjpG1QZie756fi7IwCmnSz6cyYocb7R5IdAO0l1Gsx5eHv4lhY9qIJLNbq
         4yzUYHNRwFwjnuy1MS57GUQgo8cMFD/sGQVRr5VU6/YvwogMXA1HpfMXuNJo7Ch7Fulz
         Puv3go5Us1ZuJ+qDXcZ2ObF3wKIWIyyKc0cNX1ec4OMKKOypa78JNc+izBET8+/L9NbN
         +4UwTYdA09XlCJnlm6q1kOzCKElSgQZhMo8y1j60kiwUhveQHWfvbl87qAt96XJ+2/HW
         1J7A==
X-Forwarded-Encrypted: i=1; AKwUvBx6mJJTu/wCusQuaZw8+TTIPcrDLXCl/htMIrsPdjykNGc1GTuMbEBHLowDwXyqisFlYzQLPfHqVxka@vger.kernel.org
X-Gm-Message-State: AFuF++kmXSfljvwJ7zDjTFT2JeaxWM46xEhAx/yzG6Cq78TfcXsa67Be
	Xqyu5RcUeCyZ7IQIxY8HhA2DAfyBB6Jeio9jSZnLIRi6AjucOP01yHCAuS1l9wBP52hOXzATjUG
	Q/UX8zaWcoZINSGlq+nDFGPIe5ZYRQJ/m3k85YnahXNoi8rydIrKMdet33nhng8cT
X-Gm-Gg: AYBFou3mFeuN9nhCuPWno7IZKUabXpTYkxNqSQEYJeLI7KQLfJkkW1oi6+MMSQpGSmt
	SypuIV2i2N+SqFd6EbBLdGz+d3gEjegHOSVpF+YqpLAchgV2V4F65F365YrMJI/bGAg0e/MlgfD
	aYp9AlfrWceSrG0/g1bv0atZpQ/URcMyAoUvbk2jMLkhVprgqQcqCQBlacUWrNv4qE0CxosnxgY
	TgusC3ZCRoq2VeVW8VCYl2+fxfYPVUDr/oZWZQOve6E3VV9Gy+UV9nt6DO69e4VCO/amodOB3TK
	eI/N/oXjR8LSOmnG48SGH/0zv02hNOZKCFr/XJD8V/5rA7OiJLvHaMRHjuhReXBurG9EL9A3AmF
	GpfTCwzntyrOftTTKW77+hb1uFE7Hdrn51H4=
X-Received: by 2002:a17:903:298d:b0:2d9:383a:30f1 with SMTP id d9443c01a7336-2dd2a1c3f97mr267449065ad.4.1789326637939;
        Sun, 13 Sep 2026 12:10:37 -0700 (PDT)
X-Received: by 2002:a17:903:298d:b0:2d9:383a:30f1 with SMTP id d9443c01a7336-2dd2a1c3f97mr267448575ad.4.1789326637536;
        Sun, 13 Sep 2026 12:10:37 -0700 (PDT)
Received: from [192.168.0.171] ([183.83.137.165])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e9b359sm20870790eec.14.2026.09.13.12.10.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 12:10:37 -0700 (PDT)
Message-ID: <7f7903ee-b5e7-480f-854f-9ddad67df925@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 00:40:32 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/13] dt-bindings: media: qcom,sm8550-iris: Add
 context bank subnodes
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org,
        devicetree@vger.kernel.org
References: <20260914-vpu_iommu_iova_handling-v4-0-9b9074a73c41@oss.qualcomm.com>
 <20260914-vpu_iommu_iova_handling-v4-2-9b9074a73c41@oss.qualcomm.com>
 <20260913190351.EA60B1F000FF@smtp.kernel.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260913190351.EA60B1F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Kw_E5Y0xD3-qN4M9hSWpBfdjLa7VO3oQ
X-Authority-Analysis: v=2.4 cv=Pv4G/AM3 c=1 sm=1 tr=0 ts=6aa6f52e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=/MhRiX8TZM4BB34AAREmLw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=mEm1zWZ0Lfbfyr1BzAIA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDI3MiBTYWx0ZWRfX+5IbDwIPmEOG
 wb35++FygxsXFDWf0yCRv0LZrSC1vcmWeAwitev5S+zhPV2JUSg4LaxoBPvEsEAAMXjWlFAvYos
 G43TST25Jgvfl2Gbb67mOjOjf/SGquo=
X-Proofpoint-ORIG-GUID: Kw_E5Y0xD3-qN4M9hSWpBfdjLa7VO3oQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDI3MiBTYWx0ZWRfX8aBx2iQoHUGh
 p2TQLrLtRkHsvv+1XqOXhLS0vyc5xZjh0McTOP3+dgueL9e7yrlq4KrGVLQr3tq45Jw7A1pMJ7s
 ZwaxeYhQPBbD6n3e0KYcAtdHUGGa2gkr+WFlxRHA+7V56QKv65SnLLbq5kGQbezFcomk1GWfPvh
 DhQPOKDLBf65xqa2uPmkPRifwt9XiOMTivAYKbeNoG2y/bmTbgElpt1BZHXe1IZYYC8w4gSNDGR
 22nPQ87bo79pIMVFq9R832lO6DJ/1Mq8X/XISKq3A4tkJmcncS9Hqk0kv9d/GtAwGn/jcXPL0a1
 Pa3A0czEl/qr9eU11xxwH0QrB73y8AqREEKDK6PoM3MVaT1JyNeV8NOsIPhMG657I78DaOFSTZx
 103QTYuVVLF5i87KOqaOeLHwH/sOd6LPXlqMME55qYiMSaQBQHKX3ys7ri6cOvcwio6okNwoauI
 jSZ7RoH6430GBvkigXg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609130272


On 9/14/2026 12:33 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Missing subnode updates for the Milos Iris VPU enforce a DoS-vulnerable SMMU configuration.
> --
> 
> commit 63b882fd7198eab0ac9d5c0a3932a253f2082c86
> Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> 
> dt-bindings: media: qcom,sm8550-iris: Add context bank subnodes
> 
> This commit updates the sm8550-iris device tree binding to move SMMU stream
> definitions into separate context bank subnodes. This addresses an issue where
> placing all streams in a single top-level iommus property failed to prevent
> non-pixel buffers from landing in the restricted low 600MB of IOVA space,
> which caused unhandled SMMU page faults and system reboots.
> 
>> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
>> index 0400ca1bff05d..6ee9d23554cff 100644
>> --- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
>> +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
>> @@ -98,10 +98,10 @@ required:
>>     - interconnect-names
>>     - resets
>>     - reset-names
>> -  - iommus
> 
> [Severity: High]
> This is a pre-existing issue, but does the qcom,milos-iris.yaml binding
> also need to be updated to support this fix?
> 
> Currently, qcom,milos-iris.yaml still mandates a top-level iommus property
> under the required block:
> 
> Documentation/devicetree/bindings/media/qcom,milos-iris.yaml:
> required:
>    - compatible
> ...
>    - iommus
> 
> Device trees for Milos cannot adopt the subnode fix without failing schema
> validation. This forces the DoS-vulnerable monolithic SMMU configuration
> where unprivileged userspace or remote video playback can trigger VPU
> processing and DMA allocations below 600MB, resulting in SMMU page faults
> and spontaneous reboots.

This is handled with the fix

https://lore.kernel.org/all/20260818-reserve_iova_in_driver-v2-1-5005a1154408@oss.qualcomm.com/

Regards,
Vikash

> 
> The SM8750 VPU update was successfully resolved in follow-up commit
> "dt-bindings: media: qcom,sm8750-iris: Add context bank subnodes", but
> Milos appears to remain unaddressed.
> 
> Should qcom,milos-iris.yaml be updated to remove the top-level iommus
> requirement similarly to this file?
> 
>>     - dma-coherent
>>   
>>   allOf:
> 
> [ ... ]
> 

