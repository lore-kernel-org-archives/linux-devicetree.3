Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026A9422E2A
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 11:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784893012; cv=none; b=RqCDNg/AOnmte9hW+nL4amnbECvViEgLp3DtFmmiggfvBmBgpTvjRKN/cYzvruv9KhnV0xka+v7MrTGv2B9A3Byxmn9u/Bl+SOwnmImrbHJPnvk7cJNP4V4Qbrvr0ClHblIveGyXsXnHVuCqhsenHNJwAbXvX2gr5KIcKQW29wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784893012; c=relaxed/simple;
	bh=lXxs0CZ6rxUSFR3HmEQeb2UDDzWI+tDVu+RHPZ5dzJE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eWKJoHZXSxxUOxb5dMK4EKEhNpFi09JuubtCigBwGPHnKHxKBDktW7Utv3yy6WZt0/X2dmFHenaYTs4yjhJaYwrkPcavHcOME02fnpJL6tmXHu/5o3khSgJY2hZuBAnE2Mg7HSk/ZfUYBMAzqj+7XWEmJAJidPPyg5qnwtCPyKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TY+g7MU2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FrSBNHeL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TY+g7MU2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FrSBNHeL"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OB4A8l2592962
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 11:36:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MTHkZkbsC7pZb0dSKl6kRc/qxWFTxguyGDt2nRbO8Fs=; b=TY+g7MU2OjXqdfaW
	L9JF9viidT679LOWsPu5p9/dKGhzbyz98zyt3F2n92ll6hsAjOMPQVxirYq/p9Cl
	R7A04mEkUKP8G+djCg3ueSOVwHw4aTDjWHrf/3ynjGHN6/l/fzK+Ayu0PgD9avDh
	AfgtkuZC8k8iHQKCzU4zDWQ+PjHw0Sgj90sKo9UvTh86ZG9EZTatQ3F/lV7U3MXJ
	0NbuaOtxUFTcjA47ZSjbaQ9v/nq5Q68bYEJ+Shda5vzjbhBc+Ciu8ThzpyNSYFJ0
	RRUMbZ/VSQnj15mDS1pEEWOfoa53ZwwzWtPKbaG0cOBcPdraUAsl9z6jy0ICdsg0
	s64J4g==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm2cx991g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 11:36:48 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb733fc5024so534284a12.2
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 04:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784893008; x=1785497808; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MTHkZkbsC7pZb0dSKl6kRc/qxWFTxguyGDt2nRbO8Fs=;
        b=FrSBNHeLzzFokKuW8QaWXQf9dQI6yQccobyXLX+TOWv13vYWHveSo6Vz+Isc5FxRbV
         9WKjBCwJfpnqLClX3QH4vGQHPFJUB6zc0fl7E5aHjVIja8nNU5T98P63B0ryAn/FU5q9
         5GwlsqRYBkncvdrBHhO55S42SEoi+wkGzCM4J5u2qHGbDpLQ4wy/k011XrcCD05aTaRk
         enAXZW0G9rcVjtAI1J/UHBlx+Emr9rRWCWUE8uYii68E3BoazCLpq2aR3AFtzTG2aiZo
         DEVpYMwu/OOWqObVAqwYUHXP4/jOvvChQYShkb0BaWr6kJ0UkBXp55fGljWo8PrJGZRL
         Gt9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784893008; x=1785497808;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MTHkZkbsC7pZb0dSKl6kRc/qxWFTxguyGDt2nRbO8Fs=;
        b=KrZB1s8KS5yVoVjBSBkjWE269xa14g6fS9nd85TFG5KsXXkg41CTBet9rmEf6Fqw5r
         4Ryr2XB17y6ipApOUMeuXWfFIgcWcswdMJkp0CBQow11mXkj4cfxR2xEyoR3n629Z1XL
         CYzqK1NE8FwIWOGpB4I8cH5OPMIByyIOTWCmOG1y8UuvQZsBdYNjmChhJWxQig+XYSQj
         aKpMB6N2/6T2BDxsApZUgbx5luwq6SPh7BZnxClFU5nAxNzd/+/EYfwb76vZzATaiFdZ
         FrfyiY8waov5soGZC/s+elPSxXuaUFr+vAq5sVkQmvtnrpoTC3zcCCE8+hlYFrCjuFHf
         oqCg==
X-Forwarded-Encrypted: i=1; AHgh+RrWfl/5iHZMAEgp2u/cs5MPLCtNhOmJ4M9OjVP2O8yAE2ycNNbU/7yT4YoO1K0PNQzscLu6snFyMxFY@vger.kernel.org
X-Gm-Message-State: AOJu0YyOB7VyXJIdZDegUPzyxZ/64XFydYgGmmN1tEWkMJtzS3qbNN8o
	8DRX9O6okMmtADVAi4tsQIidmgijqCjyJ0GJmmpHN65PJagGEsUi/ZJl+8r8ReIldMclu6rZsm8
	YU2MIpx908AaFTj58tvhA7qnKfBKm4L3ZWf5qsrPnBFWIprPX1WVzK/TANYQ058qC
X-Gm-Gg: AR+sD124vsJi8cRcKYWzGi+cIgaJUE1hJuEUt+B+zS7RIxE8reC4O9f1jTXzY+/SaD8
	lAulUjW25wVrhzT/7vJZNvxLlFdMV9e78RndJJHv8rSFUZiTt8SabgKatsTWaPSed0I+9BhTTdJ
	rqxy6io5gzShjfGJF9UrbnemKdYU9d14JiulVAC9Y+jldPPUWIf4gQL11WOzZi5MbLHjyCNWMOR
	W1V8xKAVH/rXqhNuwk1/x8+p7dg7a1BehLFZd+/vU/ghohbz+VaZo20FnPgIEevMXbxKf+uGViS
	8vqQq+D/uJ73MbbDIBGjx7ntCjBxO6Rq3h/CpNYW7WOSWVopdmXPHsuDzG8vlExTmy1UvuLO9SV
	y6jQHiksDjOcS26mSf6xGo+4n3A2mACjQv3k=
X-Received: by 2002:a05:6a21:6f12:b0:3b4:5c70:ca3e with SMTP id adf61e73a8af0-3c44b01327emr8111651637.25.1784893008020;
        Fri, 24 Jul 2026 04:36:48 -0700 (PDT)
X-Received: by 2002:a05:6a21:6f12:b0:3b4:5c70:ca3e with SMTP id adf61e73a8af0-3c44b01327emr8111628637.25.1784893007604;
        Fri, 24 Jul 2026 04:36:47 -0700 (PDT)
Received: from [192.168.0.173] ([49.205.251.199])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147df06864sm30499011eec.15.2026.07.24.04.36.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 04:36:47 -0700 (PDT)
Message-ID: <accf8ee6-25c6-4bf1-87ad-d53a11c86264@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 17:06:38 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 01/14] dt-bindings: media: qcom,glymur-iris: Add glymur
 video codec
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260715-glymur-v9-0-8cf2cbe12a07@oss.qualcomm.com>
 <20260715-glymur-v9-1-8cf2cbe12a07@oss.qualcomm.com>
 <frmpjyrk3epa26oebskil52sony6k672a5mkcamviiz3vdjlj5@eenvztuikja5>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <frmpjyrk3epa26oebskil52sony6k672a5mkcamviiz3vdjlj5@eenvztuikja5>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: rXiyOSd5bTtOBnS1LuTFnAMCIwDthCg8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEwNSBTYWx0ZWRfX5wmuKslwHhM/
 fS5y/Loc1jclMbXjx6ACOAhreAeoGKmxjnci7uGxxTE1CE1fCpsv7SjhCUp+yuduYXcFJSW76OC
 VP05OynMsXBgBaq6+C2n9EO2gPRp6qy8vsSex+TVAb2QsYSr/hCqNnyMaQkf2QMd5CpyRRh69A7
 MB3tWfwi+/4OVGkOawGPIaCZNoRLfIJKWOVAmIiTJm91pP+KzfLC15DdKu7VS3tkBE1iK5DcjdG
 9APJKFygJQ51RB1FM2t9nYdGQMzD1E6WhzITMIcECVEev1iraSyOahjAEwawwqGU1o5wpQBiVoO
 +zSM2oe17cnAvqKQMVXHn73vAcy1UFvTE4cG1BslXr4wqBpQ4tjvJwaFz4a3dAu2K9tKRWT2j7O
 oF7KDN4WX0HR6UO96y6JfSTtIWu2JSyUfjWHQ+NmlbzPFkvu4Ucr2UFbhd+jBSldg4vKu6jyNql
 44AUFU1s0CKhFuWd7aQ==
X-Authority-Analysis: v=2.4 cv=X51i7mTe c=1 sm=1 tr=0 ts=6a634e50 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Am0+rXbGVt9FyytbsJdRwA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=M1l8uzcFE2QXb2ngdGAA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: rXiyOSd5bTtOBnS1LuTFnAMCIwDthCg8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEwNSBTYWx0ZWRfX9COrDNOncdin
 /slmHt60M3tMqONcIHal13pT3CqHELqILmZ2ZyNG1wp9KO8YXIwWnOBMYXtA4F+eJM3KEaxjfyW
 NR59CplvX9e2q5PWFEkark6F3nvbPRU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240105


On 7/24/2026 5:00 PM, Dmitry Baryshkov wrote:
> On Wed, Jul 15, 2026 at 07:39:55PM +0530, Vishnu Reddy wrote:
>> Add device tree binding for the Qualcomm Glymur Iris video codec. Glymur
>> is a new generation of video IP that introduces a dual-core architecture.
>> The second core brings its own power domain, clocks, and reset lines,
>> requiring additional power domains and clocks in the power sequence.
>> The current maxItems constraints for clocks and power-domains in the
>> common venus schema were sized for platforms available at the time of
>> authoring. The glymur platform introduces a dual core architecture
>> that requires more clocks and power domains, exceeding these limits.
>> Raise maxItems for clocks, clock-names, power-domains and
>> power-domain-names to accommodate the glymur platform.
>> The glymur platform-specific schema have fixed constraints for these
>> properties, so the common schema only acts as an upper bound.
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> ---
>>   .../bindings/media/qcom,glymur-iris.yaml           | 255 +++++++++++++++++++++
>>   .../bindings/media/qcom,venus-common.yaml          |   8 +-
>>   2 files changed, 259 insertions(+), 4 deletions(-)
>>
>> +
>> +  firmware:
> 
> video-firmware. Please follow the prior art that existed for venus.
> 

Ack, will use "video-firmware" while posting the regular patches.

>> +    type: object
>> +    description:
>> +      Context bank for the VPU firmware processing domain.
>> +    properties:
>> +      iommus:
>> +        maxItems: 1
>> +    required:
>> +      - iommus
>> +    additionalProperties: false
>> +
> 

