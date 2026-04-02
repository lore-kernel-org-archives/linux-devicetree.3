Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B91830B502
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 04:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775105151; cv=none; b=bb0c7jX3OauLSH8CbzcDS8tD3ok42Y/tVc85CKZ6uNRySil/OebtPz9rqbeIqabljomnZ2NjAVyuSMiirkPON/hboBHT3hSvimqWGfn0pCG3lOe/4/SGQe4cbyCPwCFNODuVQDpW28ArbSX0vBVsouxQzUaLzY0orxF0Zc41T3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775105151; c=relaxed/simple;
	bh=S2HRWbg2cXokvlJe4+gfE1ed2YFZPrLpddriMACrmZk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dQZYUWoLf39roFk00ixMadF6c9Vl8GKBP09z3edZBFalekyAPS8dyu5qzyxbMeX3bytguJ7sFVmQHYngbXDHhwIYWQ0caaXutnvx4E1JBFleH87T0rwZ+BY9aUX/yapSMoIrP7PNhaMqt4ixCZyD4I6hk8HPczJ9dSNCVtCEf9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KMteYK4p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O5zCe/cq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KMteYK4p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O5zCe/cq"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6324QraU1551679
	for <devicetree@vger.kernel.org>; Thu, 2 Apr 2026 04:45:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S0q1OJWl3HWaD7MjgKDx2gsOdwwWx/uxoHe/O42qC/Q=; b=KMteYK4pTKOcpS/A
	SI+E4+FvgC8thGdTZonuRwBuPdFmMZrWAY7d864iNhgwBZ5JLZJfsUngZDIo+t9F
	xsBzJoEUxrU+jIAk/HHudRVHc1rLCyvRthyLHiWDZLvwAt/fRb6QcJ2DgG4U9PPl
	D9aotHKObeRZKalZO0S7pZVikiagGnz13ryW7DeKn7lZCSQipGVObio865wEOa6/
	77nKqam7J/ulf5pBOTQN7AOXUE7YLQkolK5vCiuSRkmIaiWVllygwE0g9FSHtQ0g
	Pw6ZhIg/ZSlDWXRuxodJ4YvC6C0CYlomyD5t9VVOHy/LhUqwI/UvHySotiHhX2VJ
	M4y0rg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9heer1hk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 04:45:49 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35da86144daso401060a91.3
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 21:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775105149; x=1775709949; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S0q1OJWl3HWaD7MjgKDx2gsOdwwWx/uxoHe/O42qC/Q=;
        b=O5zCe/cqoWKPByg7xZktXutMLlm3DkD+sChhrKW/iDAGAFEFh75UrCLW753AfN7kW6
         g1uJagR80eAGQ1rpdgvtPp+V/GfoSWKXKpMz+k91IlZt4DYatQfxIC43LX8H4lpytjIl
         oZdzqOK9r6V2izxpwOi04l1b5DFRQb0PU4PPxOCsfXGkjm5IYHnvRPATteTv9ZAZdqNA
         6fRmLbeqtWBA9vErBvYYQf1rBbJ7LPzDpEZTLaRcnqlH5wUyLUgk1Kn1qb2I0KmKJ1sa
         jF5AM1XyolOfthZzKSB3BfkMy2yMKGbbkWZRijrVxaKPiR4wVJ9XwwmbXVBrYwF0joSp
         WmNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775105149; x=1775709949;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S0q1OJWl3HWaD7MjgKDx2gsOdwwWx/uxoHe/O42qC/Q=;
        b=nCNhp+P67+pVjJEdl4gzTaK96RS7LUbavOIj1+zd91DeeozUYD/rgXpMOVlY7qg3vL
         38cQltD2tYTiVQ8CqBHG9cUk83WZ+6H5wp3YbmRvUJK4NPu4555oHcY2f/YuxKpxQwY6
         3kQYXFeFxxTepz5dEHroo3aIk4j0tD8DWYKxRZUD5VU2VsNvzO+Qwqz5j/qYLJHtSpIt
         1M5Xox087ZiEbqiPirvfAMeK5MkG01PFK1JwUPuo9/dHouIC/8CeQL0BuaCKCJFgYR4W
         aeuzrzjLyLrYyaYFazNX8YhtkPcIRTrwYsTJhyyOU0CEncXj7fbkxw4m5pclXD0hlIY8
         XDfA==
X-Forwarded-Encrypted: i=1; AJvYcCUEj1l9G5aIT3roLfEqVq1Yo/kawHtFfwOdWUgPNHfFreK7UtqW8Y1Mmeu+lAg3ffDm7BR5nTBTm/Fo@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3FLaANTZZTn/DuRgUquWg3j4HW3qnYuJkhKz+BWLLBY/BNICv
	9s9yQajzzWO6H2rxCaoP5AydD0G7GUaCGmvZz6+vc5Z7QzFxIspaUuW5uFZXFe3tvnfPb2DaVYa
	jKs+zcC5jmJaJvQIrRLiAI4U4bgJt3LkdJBhzxbyTfDpPn+2hyW5cLaZPJM7ryRw+
X-Gm-Gg: AeBDieva1YGSwocYJ0j0RJzIROuKFBOpDDNpRvZdDrIzhjFABh9R5kF45zaqOkl8iy5
	/5TQHrKSWjrY1Vp66bWGnQ5gTeckALeLjjoWokv3oLWuDZCVa8j5XIn4hoEWnpBfM836/XOBg84
	NSwDX8jFQEQlo8VrJJv8XRog49HsIeamMryixrtqRaOWYfzU34jiHtx8fL0qDpWj7sfN9m5ulV/
	obHxR2mQtQUAbDLhE+TVO1b/aFH1nk+fBTy4GQbBDrDfD44hrO2oq45I3Tixr0CPNeVCT64LU9f
	Lo3X67CRw3sDvvrH2MkHqHz/USx2iVAyqmemyvRCbw6LzdJPolt7RD/9rISJbEl7WCTaY/J5tpW
	kQV+AaTh+SOJ6hw8owkedYE5ecZo0F2hpGWjiCD87rZVZe5oNWbI4whueozaqNhI+vkbgjIqalg
	XzvluLRGyJbs/Fig==
X-Received: by 2002:a17:90b:538c:b0:35c:a8f:5c5f with SMTP id 98e67ed59e1d1-35dc6e9aed9mr5568995a91.8.1775105148985;
        Wed, 01 Apr 2026 21:45:48 -0700 (PDT)
X-Received: by 2002:a17:90b:538c:b0:35c:a8f:5c5f with SMTP id 98e67ed59e1d1-35dc6e9aed9mr5568970a91.8.1775105148512;
        Wed, 01 Apr 2026 21:45:48 -0700 (PDT)
Received: from [10.133.33.59] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dd35f52c8sm1300532a91.5.2026.04.01.21.45.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 21:45:48 -0700 (PDT)
Message-ID: <f54ec155-fe62-42a3-ac17-f521d419c0b1@oss.qualcomm.com>
Date: Thu, 2 Apr 2026 12:45:44 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] pmdomain: qcom: rpmhpd: Add power domains for Hawi
 SoC
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        kernel@oss.qualcomm.com
References: <20260401-haw-rpmhpd-v1-0-c830c79ed8f9@oss.qualcomm.com>
 <20260401-haw-rpmhpd-v1-3-c830c79ed8f9@oss.qualcomm.com>
 <ht2vvduvxvz3s36cn5m54hv3zon7qelrgat3tnykfvqi7f56fd@t24kmaliap5l>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <ht2vvduvxvz3s36cn5m54hv3zon7qelrgat3tnykfvqi7f56fd@t24kmaliap5l>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: TGYK2KG5VdCFBqGC43j48uLhqG-mgj-e
X-Authority-Analysis: v=2.4 cv=VY36/Vp9 c=1 sm=1 tr=0 ts=69cdf47d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=-zmIaJwIKKk_Kx9d9LEA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: TGYK2KG5VdCFBqGC43j48uLhqG-mgj-e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDAzOSBTYWx0ZWRfXxsBuK3ub59SE
 fb8NqYOHHKXL0kgAivHOLBJx5P+XMG2+fMzbutzP878paQZwgy60d18yrswkRuzFxcjbSXm3Mzp
 6Otb8dTW/xs16dvhugPjJBGArse3Pt7DuTbjG58DyWy07/IV9DOla/k/Ha25gSi8NeYB0EXXXGp
 A+Ooic61p/u2iB5+t+ex/dExgknuceewKPJhFmmCJ7/ThgORTlbZZeED9SMcZTi9wus1bcYRYiR
 RUO2f8k3vYt8JnBPmJtSXqHlOgJvgfvJY2axNsZS1F/qROfrl8POhLXR3GrweAA7CmYwLnbt+Wd
 NakjNXNt5/UqQpfnyUqtu3Ai68qajEHRvTv5q3pjKV1V+5SWSdwA4AgzMDPgEasSUjXU6x1NdnN
 kQbujmTjD6eioSku4kW7pq7z8/68LZSPkXrLGodEc1zIgMO4rJWj6d159JvOj0VafbjwVaUhy4e
 SBxGFA3JA9tkaVDEo7w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020039


On 4/1/2026 7:31 PM, Dmitry Baryshkov wrote:
> On Wed, Apr 01, 2026 at 02:15:31AM -0700, Fenglin Wu wrote:
>> Add the RPMh power domains required for the Hawi SoC. This includes
>> new definitions for domains supplying specific hardware components:
>> - DCX: supplies VDD_DISP
>> - GBX: supplies VDD_GFX_BX
>>
>> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>> ---
>>   drivers/pmdomain/qcom/rpmhpd.c | 38 ++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 38 insertions(+)
>>
>> +	[RPMHPD_LCX] = &lcx,
>> +	[RPMHPD_LMX] = &lmx,
>> +	[RPMHPD_MMCX] = &mmcx,
>> +	[RPMHPD_MMCX_AO] = &mmcx_ao,
> So, should it be just mmcx or mmcx_w_cx_parent ?

It is mmcx.

There is no such requirement to vote cx before voting mmcx on Hawi SoC.

>> +	[RPMHPD_MX] = &mx,
>> +	[RPMHPD_MX_AO] = &mx_ao,
