Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C5544162E
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 10:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784111268; cv=none; b=P4uPuZtR3P8uh1dtigAWjzVRvF4rDIrBtgYSGIhhGX6N7CxE7LTbWGv+QviowMM9IaAyO6yQrYaCZUQQa8MYty53immqVIStWLq5sID5V774DtiVQoLxQEIxevv0JBNVXZMQBbbTs+toD63VbA3NUDSk9b9YB8CfKYxTVKWHKOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784111268; c=relaxed/simple;
	bh=F9j0xQ3mrNQ20w5XTBZ6u3V6/dJHSyjNscaZuGoSW/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fyfuh8fJgytc+G5PI4g41ATxyFWeP/d0G661WqJtDmKZFtvmJC5KSuOAf09lWUyCKRHFob2Voo6odWSX194QPnRng/wJUildp93nVblyCgU8Hcd0CaruBhejUPlXrnjumEHJii/k8QfV2m0+9T/jRLCvG9pOSwBggaIPl6k9T7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KWCjg+gj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OdI/apA2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KWCjg+gj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OdI/apA2"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F92ksY160772
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 10:27:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FqeWffSaD4dQlURL8TfYn7r46vLJtQDYSCX+eoewaBY=; b=KWCjg+gjcu6CWjMb
	3QQpD6/Dp2o4S1N/JPnG/LpoQKCwZq6/wSZcSBshBYshjyD43TQNyRvumDBI3N62
	cJTjwLIgc4ZTASmzpl+fH+HnS+6c7eVSbjNDDN79eMx4tlEdwPk7eBWBzhkswSsq
	Et1HjxwOG8vY//643EyhrDMHKOFl6WOfDeHewneAeLYDH/bHOVb2MXWrbW5oee/8
	C0IWlKUSmWaTsKvixA582spiQjO4mjNJGu0/KYQgb1Umqzorj1fA/fHVGt3yIw3j
	jNuUO4PHesWUGJATWyXolyQtEBAMX5s1WLXRXS8fnkEufxjU6kHrSpxyuDn8Pvsj
	aYMwnw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe68wrjd6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 10:27:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e6415f279so76016385a.2
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 03:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784111264; x=1784716064; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FqeWffSaD4dQlURL8TfYn7r46vLJtQDYSCX+eoewaBY=;
        b=OdI/apA29vs+fhjpWNtERnxEPN0lB5yavgftg1YnADITBbA/GiJjzbd3DZBR7dprhq
         BAEOse1NAaQbN0BZmfaby9C4jGNJ+W5dqwaPW1y/wUar9S0WoJxTR+iirWMrnkvBOGuF
         q+soVoKw8uD/UXivvKJziZ34uXYgZKVY/1BMCQRP5+cJ2386AXGUGO6bFrrooO5QCPX3
         iFLXl5cORC9u8BE7Iew/01832+d7n08TQ8OqY4GyBglFm1gCXaWPUa45S2HealYWCn6L
         TJWZu5DNu+0kchxVUYA9uAOeemrqMPLi3QMOiZhelkDnu/k4EAmuIu3eA6E06L2G0XPW
         tOfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784111264; x=1784716064;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FqeWffSaD4dQlURL8TfYn7r46vLJtQDYSCX+eoewaBY=;
        b=mbvy9O7my5nZtCjHv4fz6UcbASHMhdpEhFjlI8kJdcQqree1Jw2lIW9cm/MIkJjiUw
         z4vWbitT/KQtEVkooDMiWnCa/wWFntHH2Na9MvYYfQBY2j9QHU7yrnkk2bXT/cy1gA8t
         yLEzf6JmupypsbRpfVra8SKVdlvEbOkGz4akrrgiC9tvVV2OybjeZNa4p4EFoTRdjWKy
         7aq3Nt2JJUPre+2eI+V0/zuwwVO0hrDOiIvduekz03o2zW8nyV9pxzndqhgRG54nCa/q
         NdHMuCl/HZXpjV4zkWz67QN3L0pj+i/Zp6PDsBEHLAvhklkCQGacJVUB/WT7LMHGAWq0
         xHCw==
X-Forwarded-Encrypted: i=1; AHgh+RrlJWHQR68awe3a1C3kZsYzUXg7gAhcouOs8GCHcXtp5LH6mPyKu/vqbJAdaulqotVV23P3o2FPZH+U@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv47H/1XybINIIlCXInqkZAjeTWE1CoTB7icYgMdvSED6OXNRZ
	uSBCSIJ9DeAdRKggdKZruKQjEHxq9LPOsVdMDu6HVkO2/KPGdsXyq5KgIpA9nOW6xZ2ZnEDrk/f
	VOah93WGvZZXqo7HL24VfeEN95KuhEPHat2Pns5jL8rtjzbiGK4vQX6l3UM9TzCcJ
X-Gm-Gg: AfdE7ckU0BfUYwl6ijsHlHkPjVHly8m9VokEv1Fq4xsnT1ippsq9jk1D+KFwgeqEurK
	07zBXyxnts1NcaTKE/C/Kd04zVUsDHtvSuSSKeySuzgA12Uh3MNaQ7PPAe1YxKLcV+/mqIANxf/
	3MJccoM4xgdxDIbMcHZuA3cYqkJa831R2P9pKNRSL1QwLn0LGzFdCmyxzHV7PtLBMkm+zxaNSXS
	v2dCsywSHzYPMjssGPIud6YGQn0EBsWNuzVs+Z/WwP7cN7gRNWtAFytbXY7nUtb8qtOqUDSvJmr
	SZ0066Y81rRiDY9mlvko1wWIxt7XGxxeKBoe/9xPCfzjjQIiMgLaZX6IKEh2XvmyyxTgyksr+G7
	/PYaIh3Cj1BBCymjVVUlvhAx+10OTaBmT17Q=
X-Received: by 2002:ac8:5d4e:0:b0:51c:1744:edf0 with SMTP id d75a77b69052e-51cbf289286mr138516441cf.9.1784111264312;
        Wed, 15 Jul 2026 03:27:44 -0700 (PDT)
X-Received: by 2002:ac8:5d4e:0:b0:51c:1744:edf0 with SMTP id d75a77b69052e-51cbf289286mr138516331cf.9.1784111263944;
        Wed, 15 Jul 2026 03:27:43 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15cfac0f76sm1117074266b.33.2026.07.15.03.27.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 03:27:42 -0700 (PDT)
Message-ID: <986da1da-db2e-4d4a-b9d0-70482adaf4bd@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 12:27:40 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/11] arm64: dts: qcom: shikra: Add
 gpio-reserved-ranges to tlmm
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Anurag Pateriya <apateriy@qti.qualcomm.com>
References: <20260702-shikra-dt-m1-v5-0-f911ac92720c@oss.qualcomm.com>
 <20260702-shikra-dt-m1-v5-11-f911ac92720c@oss.qualcomm.com>
 <9c1aab59-14b2-4811-b778-8e96645bd65b@oss.qualcomm.com>
 <97b205e8-5ab7-4205-b1dc-cbcb0497987d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <97b205e8-5ab7-4205-b1dc-cbcb0497987d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: pjWumvxr8kcFKkYUIUPoEjIet2ME6POu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEwMiBTYWx0ZWRfX2mQV16Iz3YoV
 hqjU/tS8NrKb9jfSgxAvJlrmKQNiUMF7HjJo0uAMooanFAXsLF5pS9AJlrDpxJupbgqMyhaXkLA
 QySyrPPn0iNk9nbWXgPXrB05dm+JyJjhC/R9wHcZvMfwua59MAdvleKZ59AK9cY52YRXl+6IOp6
 ABCpy/SXIHQuoDcIje7fEs41f8N7ZJfkLS5WkjJgSgbECg0tW2U5nW9vosAgH6vRLd9Tt2eCWGY
 e154fQkZtjJi3zzVORFFAGi/vicuKyFrQ4iJpYlPADgIpG8d32bqT7epEKo0Go6lNzRHgKbAoaj
 dOaHdlPFVRaEO3gLYCs7/gIcF+TDK74v1cKuVOp4OjNKmRKzWv6R47Mig8Tz/bTj5VnM1VNARXa
 1imxU30la+VtP3VcubcFlfE8U7vIPqIoQ1/iS/bXwI6RxRLjz1GHNhkNLhMBdWj2EhYVIw0v9fe
 pGgwAMpggF25jyzirFA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEwMiBTYWx0ZWRfX37dOFCrK+8cl
 hQkV9C7k1Hh6LSGUPqkq0BRRjjHxoPoU7KXoBqMl5HG9vqm4awD4um97gVMHx7UUtFv/Zd+m93T
 q6bZBADGXjmT11/BEPm2iZII/t0R0a0=
X-Authority-Analysis: v=2.4 cv=LbgMLDfi c=1 sm=1 tr=0 ts=6a5760a1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=bddrti4C3Ac78WpyR4IA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: pjWumvxr8kcFKkYUIUPoEjIet2ME6POu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150102

On 7/7/26 6:36 PM, Komal Bajaj wrote:
> On 7/2/2026 4:25 PM, Konrad Dybcio wrote:
>> On 7/2/26 11:50 AM, Komal Bajaj wrote:
>>> Add gpio-reserved-ranges property to the tlmm node for all three
>>> Shikra EVK variants (CQM, CQS, IQS) to mark GPIOs used by the
>>> SoC internally and not available for general use.
>> These are generally added to prevent non-secure access upon TLMM
>> probe, i.e. the board won't boot if some of them are not protected.
>>
>> I assume the proposed set contains both ones that are _absolutely
>> forbidden_ for Linux to touch, but also ones that are dedicated to
>> some specific purpose that Linux _shouldn't_ touch.
> 
> Yes, some GPIOs are reserved for secure-world use and are therefore not accessible from the non-secure world.
> I will update the commit message accordingly.

I'm not sure how to read your response. In other words - is this
patch boot-critical?

Konrad
