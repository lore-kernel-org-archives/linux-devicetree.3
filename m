Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A4137C903
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 14:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789740673; cv=none; b=T7JYa5rYr+PzJihEr0oKVrHrXuTHeoag96f1zQ61+xx/C8L45XflLPLVxNb28Y5EkfaZRqWWUOpriH4VcaHz+SdaPMbZn9aA+xLZheBSQD+Prgq6zRePwMHW0Gw+kAfZN+KJrVHH6f2GeZ7uXN3ds6BzsDDZeQtYsTqDJAX5UHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789740673; c=relaxed/simple;
	bh=HCnsPH9Um0ZG08qyr7R6UQ8BhsID58x7zuxQpv0mkBg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YHJkTOWFjVyhSh5GPYOXObRTE3nXreghSPTiYNZ04JBGmktew2fQ28A2QPHP3mNnvkIiFJWmkm7Qh5RgAnxjRzg7spa043c2DdtUFynIp1HjWhPUvdddmshrJVUK8My/ShmhiAtGt68Up4cGfxgs7e1oGQgFoa0AwZPl92ej5RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h8vjvI+h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gXGPQwci; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h8vjvI+h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gXGPQwci"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IDORhk1711286
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 14:11:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zg8ab/uvVlUMvrE4Dl9YaZiPUZgCfIt39bL/qT8QwzE=; b=h8vjvI+hCtyQSqIt
	/BpIsO/apRrzPDQlk6taMfJvhv0e+2LTtyQhJ2dBpADJjIxdbD0y/GuFJS0LrbW+
	FoKJfsV8X8EILUyERuC0/Wqd0rXAkdiWUofD8Rgv+3zYr9hj/VJT9JmlOVmCRFF3
	fkqI3oD5BfttQK1PDQdsru8ypfBgGAxfcgdoeWhpkmZJkqf28mjDYMcnxGX95TEu
	GfsocAtH9MBGSn0paSjoy+S879PeC+TssMZCa0r7NBGCQzskbdKPAB18/1RVP3gJ
	WBCJeTapQHNQooXcz/DnzfnEHw4jtM+OE/ISaTF5gcysKgK2BtIntePvjjWO+GBI
	U/i6dA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grrg43h69-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 14:11:09 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7930cb5cd3aso581956137.3
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 07:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789740669; x=1790345469; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zg8ab/uvVlUMvrE4Dl9YaZiPUZgCfIt39bL/qT8QwzE=;
        b=gXGPQwciIcPsW9G/LL0nSoWntBsDMouKFB6sfLJ+CDXMc26WRqxMyIdBu6mAGEAfPk
         /qQpE48JWz9G1j80w6I40Pa2vmUqctrbwa1Xy1S+fJV52skdq/5MqqNwu9ipWr3/Uzx/
         iUKmAJpQJ33myBFcQjKG9HqBTY37m1+6fuPiXOlzXXc5cJ42xyDQvUHsslknNYKOrRhI
         rbybCwUqaToUUAZRUCACvk3bQm1k/DPT6+C4q4TIHBMme5DTuQGxu++Sys6NkZk1ugRY
         eWQoZjD7Eb6qKvOndsodwaHbef5RYNJOdDwrwF8OGpYhwfL6CJCSG0Qdl3aHuldRjsTR
         gReA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789740669; x=1790345469;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zg8ab/uvVlUMvrE4Dl9YaZiPUZgCfIt39bL/qT8QwzE=;
        b=TbtyDTNOWz8Q+dozEJaByqoLIKOwaEUDqvnPa1lPiaGcGkN8CkVq28dbHlnSJJxmBT
         V2S3Vq5SfiCPW3v/L0ubWAc53cmJOUokaeioV5dg/A/Cx/Hu0mao7xEkv6/al3CHWhFs
         dOgW8JYpMrEUPmW3THVWh11ZAl17nrk2ieQrRPJQFSwacTrAScy/xqAPTgFA7K9A48Rt
         4ym+xf/zNGxSWLYPY48Zbb29RxykKKZY9gmfHi2GW83c67cQN5DUcIdz0eMXjml91YEh
         Y3ixv9+XqlftYGMbvPguNMFZmP42cMqXCm1bGD5Pl4VLr6vP472G05ziOC3FIKWRiy9e
         DI/Q==
X-Forwarded-Encrypted: i=1; AKwUvBzwq116zKDDxc4ygAZ6ysGKb7qPeQT7ae4fDwKyYXb/becvwsCJLkSXw1eNM+7pjcRCmTW/6whW7seN@vger.kernel.org
X-Gm-Message-State: AFuF++mZ8gZcfJZMhpcpGVUe6MOjXewRkMeSuM1pKqRznEeCzPYe98CA
	AvCXnaArXFJRdfFAcSfCPt7Ndod7VKiXZSfeX+OLdJxdU3Lvbz+ezwCdQ8mmLoQ5uAWKVZlSuDF
	E1vhq7zJey8HoJQVDhjLxCbXpbgY7vmu7PV190DKzgFkz8NFQQDNsfWh2tQCWq/JJ
X-Gm-Gg: AYBFou1AIqymLPOtciDeZ2FsaYvq5BfZ3oua/BHEGiB2x3qJd/oik3k0j7ZErpD+P5J
	QXHUKh6yNS7J6Zw8u5T0JrnXpTy/Y2sXUIDbgfE0VZw1mPTl935miH12DK7E14hbvEO3s7U2aHK
	Co7Y1O7BKAt2OxpFU/Zm6g8f3tsVQ7hTiInQooZCPOa6WOcZf0xCS14v/XGLPXlmwUgD85ruEe5
	O7wdFmxZ5MribU4VnXWKbHjLKlixNqV/x5hl5b4PBZvHkBlnRxpIFCCe/60VIGfBhJweW6jcYeA
	A4ENS9YsuWG8XGLxA6Xk+LOyEEOykRxRsD/0cydIVpJSDoRQsRg52kYtb4ZJK57tUllK0AZpkvf
	30pJFDMrVZXVDF8ardi59vLqCcChO2wneetXeVUSxXok2gKOlJYHFhesq8yQ57SM=
X-Received: by 2002:a05:6102:8007:b0:7a1:f7d2:e817 with SMTP id ada2fe7eead31-7a55ba4d3eemr1053377137.16.1789740668739;
        Fri, 18 Sep 2026 07:11:08 -0700 (PDT)
X-Received: by 2002:a05:6102:8007:b0:7a1:f7d2:e817 with SMTP id ada2fe7eead31-7a55ba4d3eemr1053328137.16.1789740668303;
        Fri, 18 Sep 2026 07:11:08 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:82ae:cd75:d970:e66f? ([2a05:6e02:1041:c10:82ae:cd75:d970:e66f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc7d1cca3sm55062285e9.11.2026.09.18.07.11.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 07:11:06 -0700 (PDT)
Message-ID: <b01f8d1e-353a-46d4-b52b-0f16ff63eaaf@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 16:11:05 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: thermal: qcom,pm8775-mbg-tm: Document
 PMAU0102
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>
References: <20260830101025.191697-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260830101025.191697-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: U6QkOq6YsCBcFkaJLxlrrDCjlxYQIGna
X-Authority-Analysis: v=2.4 cv=ZO9CCn7b c=1 sm=1 tr=0 ts=6aad467d cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=4cE7jvQ2eA2NNYLkAPgA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: U6QkOq6YsCBcFkaJLxlrrDCjlxYQIGna
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDIwMSBTYWx0ZWRfXxuG2e6dFaKYt
 F6urjQIo72CcpQIwTflpELtocSDMN9JOGOv4a98Lm8f7VZ9v3Xu6mTJ54l9cC+XmZGlV+8kTr82
 q+a16ll4dFnSMnbiObvOVNXZE+HY6/3e0MVIo5eJ2YfP7eXtJnpKhJVJLOaCf9JBwkOKJoI3UZq
 jDZmnhc74y1kAvAWC6DTrZ4Atfovx4W5oDZFUTdA/5hS0B0GH1ADUpHFetSsfBQvjyRMU/NF2W5
 O5yMcOAi9cLCZRiBa23WgbId6CXZAGt1sXonYHEzJVGHf55EasEiLcbHL4USMw5wqMILsllef+K
 cH+TyvbIYHs3cYo/xqu/vVBjKiQ1tpxYYnxg35TGOTW5JZOrYabdqr9HrtIZKzVbXSfrKQyo/0p
 O8mnCzR9c3tjEmTv4ScWpalpyRqkCQzxihRkwp2vtXu0zBTvyrifM9YMWTljGCsbBpjnLLK3vUh
 RMBYAr1u5qCziZOiupg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDIwMSBTYWx0ZWRfX8GY9dyLY+qFv
 KdtX2V7zkVFM4fZGrV4961MyfEg8uN7SOC5ifOvRpuF2Yls1AqB8TMCNng2Oi1ItZo25+dAxt+V
 XhM48VmyZYZCVbhvt7oGWWNsjGGh914=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180201

On 8/30/26 12:10, Shawn Guo wrote:
> From: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> 
> Document MBG temperature monitor on PMAU0102 which is programming-model
> compatible with the one on PM8775.
> 
> Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Applied, thanks

