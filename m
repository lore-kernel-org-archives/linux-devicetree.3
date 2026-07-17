Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F115394461
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 18:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784314362; cv=none; b=gj9JX4TKJbrIkY3tAALIbQPGwZa1ZoQVGisyVDJF/Pngc5NknO7tc2OEaQkcTklkiwbX+6sr6PUajWRhp9yFw6IfHxzv3i1aM6MTI3/6dO27S/OdXct2O76FC899dSaAxX9Jvynb2OPAJA7QWes4CibbcVrPT3B/T5JwPBUGWBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784314362; c=relaxed/simple;
	bh=4vnu3+5xj9MqQLT10pMKbajeDnVOD5lFwEiBLxF/KaU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=th5shD/I9NyZAC6ALMyPhkgLxn9ip6iV9s6UaPL5sVDYPEBnnwMA8Qd//4SUKL7792Jgm1VSWG0ZlN/Xt0knroHt/5pCnWnwvRIuveWPP6qwU0jJNKZsnOgFyvjG2E3x1FQ7CvXN0NkXzROjQdKPdC3TZfKxII1JhXRMqvYq898=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cg//DO0V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q7yoGu9B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cg//DO0V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q7yoGu9B"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HGo0Zp2043194
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 18:52:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Gs8gCtcxAAzSwbknBSxE0o+rTTL1k155SHzvNypXD8=; b=cg//DO0VbMvnp1H7
	xh2Fc7k/W1gGyNqz8/j5VTm+TIiSszQ6KA1V/JmafCxdYuzUjWeUyN4foOtIjTaX
	SyySNXEe2+yM3HUh/FEnVLZbS8ypmz49IZ6hM/TKHyDSOcAsQ/+wOK0kwUyaOqoT
	Fg2EWJeor6IUP+sG5APueNrEB56pEZ1Y2kKj22KkSg7jPPFp0Ro3tQbgVeicaDLH
	kmNo0aabicIMWVwO4znwGl+y3BagDkGOL8ECutCyMMjGNBMyndMDPi/bmxn7X3E/
	SvoZXrtdD6jSFry6XQDUqfeKjr9jxnZq1plOpxf+f9SSTb2/b8aLeYXat8eZhZCw
	ll0u5Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffj78t2qg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 18:52:39 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38127ae6b99so2492037a91.1
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 11:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784314358; x=1784919158; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1Gs8gCtcxAAzSwbknBSxE0o+rTTL1k155SHzvNypXD8=;
        b=Q7yoGu9BIoni44p99Yy9R7vY66qLIa8KQqV9qHWHEoa2iMRWeLKC/elTWRH+ld5LWe
         bi2uu+VM5n69irglRuBI/IAHr1+8NzE6gNQX0cP5oggaGCdcrGCOMqItfr69z7o9vBol
         ZNn7QtUlHJyVie1rMGb+gnAZs0Nvmqhlvd9cwozcQZchU/5S3cJJh+hPSMlXM4KV4LY0
         rUEr3oHfseml6sLVR0hUc40vOpHsHdFOJAv866aZ5+pjMtbmzp7+benS7e0O3A3J9m9H
         95zcjnELNXPspx8SSRLhDlzHQJMwhP5NNKWL5+Fsd02nd7hCGtlMi93Itvq1HnJmeMhr
         fVAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784314358; x=1784919158;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Gs8gCtcxAAzSwbknBSxE0o+rTTL1k155SHzvNypXD8=;
        b=KLxGp8URHTXD9uEU9B+dBGIFdoUbI+EagnXAvmROxRraSVJfuq+ULxEA4AprBQPBE+
         D6GPZax6Kwm13Sp2df9EY9gxiywGCnPxma0nzSZZ2/bUO5S5mlZPbo1QA247fX6sNrao
         mng1V+i6F1LxRyl4p4oFfwujzBhtGWtRMfkh0u3SliB6d3f1VTm2LOZrrKzepiN5cun6
         KoB2ojVxtDYMhbtim/S7hJg9hAuiuOZr/nUnMoU4F8/0W5xILZXgW18qancfWAOsp0Jk
         Aqp/mrVRmLw5ejsNdrvCb33Rbsilclm2uyTvMMXtetgfn8jWRqEqYktC3iiQENJ2Yt2M
         jQKw==
X-Forwarded-Encrypted: i=1; AHgh+RoaOHR76A97iV653Xh1BTPRZolQEV1OtpDl2PP9mva3hzD0SOSUdN5Ivb03tCSWXnfbpWi0+VCnf2JH@vger.kernel.org
X-Gm-Message-State: AOJu0YwPw/YmAH7Jw4mSfCmNZNAQq3tdCOf1tF4rhp7gc37ePUHCAmzw
	Qs5JTC3lZn2WVBOLg4a4b5RFBkos7OdNOyzF5xv1PGsWEMNqp2IJfLANiMZMvJmvI5SlOqZCJCF
	btK/w/cQHNEO26yT/VgitfEBFFznoiwmrDsm2uquCWUZFMkZXvmSzcMgujI7QcOKc
X-Gm-Gg: AfdE7ckMXvx26ODryslBmCLVOv+krlnXOE/SspnwfhAWfY+7X/95CyrPmY4aJQUbHyU
	JJfaMR/wUilo1hku9HmruNNWddcG6jfDqRvdTfkLzm1Qs212Ior0E0e0VGT1wWN9zeWhxTkloXj
	euDWMjcn+zLlkDdt8mZfNlFOy37CsYgFJTaxFTFmV4LIpNJ/Qx/avwVoWCpB4ryXN/ZfN4X7Dy9
	4bPD3WQVfaFp3nxcaelWNEuK36SjihzyYf2yw5xTrwNudHzKUuzWI+VVzE0fZRt8Ma2HXWqwnpL
	nh4SN3qDpKOw9Y55XLzV4XMecumVk6P/mLAXlkTRhzQzxk66Wc/jR5jK5d1BbIm5fEyUO9nLWMR
	+Sx8Z7I4rt1O7RMN3EmQCwwIr3TKY6rQ4bo+00OoNnYT3iTdTwb/8P02LQQ==
X-Received: by 2002:a17:90b:1d01:b0:380:8bb9:aba9 with SMTP id 98e67ed59e1d1-38e3d13426cmr8613497a91.3.1784314358327;
        Fri, 17 Jul 2026 11:52:38 -0700 (PDT)
X-Received: by 2002:a17:90b:1d01:b0:380:8bb9:aba9 with SMTP id 98e67ed59e1d1-38e3d13426cmr8613467a91.3.1784314357792;
        Fri, 17 Jul 2026 11:52:37 -0700 (PDT)
Received: from [192.168.1.11] (15.sub-75-218-246.myvzw.com. [75.218.246.15])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a210571sm9561228eec.31.2026.07.17.11.52.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 11:52:37 -0700 (PDT)
Message-ID: <34816207-5362-4ba2-98fa-b3f63911bb71@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 11:52:35 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] input: misc: Add an initial driver for haptics
 inside Qcom PMIH010x PMIC
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260717-qcom-spmi-haptics-v4-0-b0fe0ed30849@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260717-qcom-spmi-haptics-v4-0-b0fe0ed30849@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDE5MiBTYWx0ZWRfX9l/PHYMUil/b
 A0MsxekbZLBchWQvoWUmk2ezeHV1w+D2mWpNRedF+OI1KBJw+hAvnicuyYycYg2CzBJ42ZZLQPi
 RrtZ1EJX1sIbocg2exPWqXiyJ37PF0kJ8qjctc8lAUYXvE9pJxggjwrpgnxx66xAFciXt9JNVM7
 dCQCwq6PbaYVbd3pfaUvJQ6YeiPNkuoLmfsWcy6icj6e9fxRNV5U8mMCeUJ1EgTKnvy0gBzaNMj
 2qHwgBptxE/IKqpAz0uc7YFZ+EC4o+z5/lsviXxREnjlaAq61hovNeYeIfQmxFrqj1MGMTV2K4I
 wGZk2rNHCQ4OjrF+Tj1fBFkbMnQ12s4UXVh0FkXV6zFBwliZSJOOad6zeYvohrJOkpA6M++QjUq
 8e9EEtomvPjzPAH+npliLknlgWqiIWOBbCEWdpQIJXRwIPOX18Ika3JaX2AcXcSc4GRo26fYQx/
 ncfdqwDjf3q9HZpe5yQ==
X-Proofpoint-ORIG-GUID: O90N2kWIWNu16MKPXq9RoYxG_RwRnjs6
X-Authority-Analysis: v=2.4 cv=U9Ciy+ru c=1 sm=1 tr=0 ts=6a5a79f7 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=6VQYfvmiyQ8t40WkS/mQdw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=bHPa9YEdOWKU2UE-S8AA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: O90N2kWIWNu16MKPXq9RoYxG_RwRnjs6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDE5MiBTYWx0ZWRfX2tI3deoq9K+i
 oPxBmamRuI4QH1TNIdb/lNn6oQiTYHddlWzfVYejA5FmQqV/rUG5OtMl7bnN+zE05jgx0KabdTk
 ryPKCom5dTs0qMAv2NjLSdZIsAt3rw8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_05,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170192

On 7/17/2026 12:28 AM, Fenglin Wu wrote:
> Dependencies:
>  - [patch 2/3] depends on [patch 1/3] and they should be applied together

???
it is normal for later patches in a series to depend upon earlier patches, but
that doesn't normally mean they need to be applied together, just that the
later patch needs to be applied after the earlier patch, which is normal.

you'd only need them to be applied together if they have cross dependencies.
But then that would be bad because it would mean you can't bisect the changes.

So this dependencies statement doesn't really make any sense.

/jeff

