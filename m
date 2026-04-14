Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE563C063E
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 09:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776158989; cv=none; b=mHaLkZ8ZwuqPgoGIzCbY6anTfAx61dyoZpJszcP6pBRUWNOLjobLANaXKNOi/wBMSUC56T+QTnSO+ENo/ktP3QzD7Xgefhax23MtHPJ7NpWXykBB9icKTrpAW1Si/HIOR9Yug8WidbseKuu9+nO0xNVXmVlIwYf7oYO4c4z7PRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776158989; c=relaxed/simple;
	bh=7HquVGr9hSVRFnLZAoPF8/BbbTKUZHp/Ha1/h6tCv0A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bjoNtkDFMe6em8pqaoVmJOip0wLHVexcX1XVX2XsM9KXP/XW27L7hhBHfKdkkY7hV6K9PkYwsOnLjIVsX3r6zyAOcmnKDNqj2xUkbktoqjdI8K3scqF/DKZt6qSXgRFHKHWIuENXJAR+udrKvhm5hMoUIzzoaxst0Jy0LlbAQmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UUkLiizj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PhhJ+c9W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UUkLiizj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PhhJ+c9W"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E67IEh2633547
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 09:29:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7HquVGr9hSVRFnLZAoPF8/BbbTKUZHp/Ha1/h6tCv0A=; b=UUkLiizjAdU27TCV
	rvY9p/8+AJOEPzrIxsfDyxUd7sYVFU9jOJdiXveeff0Yzs50M4uVTj04BV6JBOfd
	qi7GIek0zUwH7vaGWPmHjlYpgnX6FbC++LoCzKttwRAuCFKM1sHBDl4gvxSSnOys
	dZ5qTRQOcV6CANQC3Y0Gt9usgPkzdEKVjZ+cbbmdDyMYdlO8O3tpSy1QIM1qyErt
	avmmpK5uLgDrv/ggRE4OC0C5672Q5uFmLZWL4pu1D+KQ32rmo5UmHV5eIFVtcSCo
	8tjPgPsi17Fe/cgCwg55a1IfrdZxMARDonuZRmU0mqh5bse3kl/CXfC1YM3BgASa
	cpNblw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86ca376-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 09:29:47 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8acb3741d12so4816096d6.0
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 02:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776158986; x=1776763786; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7HquVGr9hSVRFnLZAoPF8/BbbTKUZHp/Ha1/h6tCv0A=;
        b=PhhJ+c9W1NshNltJ7pJ+WoTAEUZfCQFjkj4RG7EGC+as0+SANPOoQzPucFvuUHp/Gi
         N57oPCFLNFIZrmzK24ZcBeH5uLAgnxOxGittqlRdNl32Vt2oMK27O/KT5/8RkoK1gZxk
         AeVGL8BDxhjd7Flo7sx/Xfsuivc0cYyuloAf1SW5c10Yn6LkuQEImPnjmWenauou8tVj
         C43BeBf5L+AdGs9GPxkrPIXkGwJ4WTttErDp0jFL9PoOo5bqU9uGFV/tNPJ6v1zTWyDE
         +BSlCGujFk+AI0sTKYQet0/LVATwDJ63bPKUwlhtUsI6oH/3grSHfHpgmqJQfSj7txyl
         +wAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776158986; x=1776763786;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7HquVGr9hSVRFnLZAoPF8/BbbTKUZHp/Ha1/h6tCv0A=;
        b=jfHnH6HqvQkJhWegRpEe1h3enmQ3yrFG9H+IqNBWB9GV/7ImOKQ5qnL7l4mrN9rGDi
         f4V/pywieAbmcWfwGeUEdZRqU33oy5OAnHQuuOPa31KgYY32P8HMNQFD3icIWAPcwOAC
         ga+S7oh1oKtQ/CUKFOHESpL1bEEz0hAoowHfKgBi2XahSS9YAOgym4+LL+d0NWtB7ule
         vGeWOMFLNSYTwVLZhkMQyVphmgmUyMjiQ53DuGx4viWGJzQmwcVldqiUzFTnVDG7GhJc
         1D50uipfRcE7vtpyjVjRAJW1m/+UJITtaFL1qvBQF761k158cTV0Wj2XHpQ3V6np2Z0T
         p2HA==
X-Forwarded-Encrypted: i=1; AFNElJ8A7XhSD1jkjWFXjzua5FYIQVQ3kESKgVLeKmonDqZB80PPRtcmRKq6CBJ2mrNGprAEU0X/QE97uode@vger.kernel.org
X-Gm-Message-State: AOJu0YzGJ6ACIfTAT57KDUASyLEIgGzoPYX1kBnQ0rpEmrrPcyEx23yw
	PDPxwY2pbc8Oc/ODMm4sutPooCCgN+9+7M8A3vtFOkHafw+VTO1HgKv7Or92fdC1Gf6zjnQfShB
	uPWwULTZFxj7WoxDluDoG+ljhad3LBi7ursHMJHVIzHYAOZ3TG2h7wmV876E1jcYR
X-Gm-Gg: AeBDiesWx25L1wTl3+OMfMd4DoqSFvc7a97RIqpvdAsyAXg5AlUlgtcdZ3lqRNe2JHo
	o3rlgW+GHTpuKhKf4cQQWQZ+E/vw9IaV9INVThzcJ523rO1/2OujjfJf4DbMUUHh1LZoamoIfxp
	q1j4Z8dmvJevd/L93kaEU1hYF3hqoW5tmhkZ9arbt/j0nXk9SKlQRzhWnBe/YbEgIEufmSCoL/X
	vI9127tRRrQl+ELJisD95gNFiybgm1kaFL3ph7hcaY7UGUKsWZp4of/4jps/SQoscuKAltA85Vv
	RzjQseWXskCuWWUEE3YMHvlgdv2/UPqTW89SAE6/ECrLenUG9YI/09TTv85fEc8iO1vbJMxW1uO
	CA2uA1pQ2rzkFc4l7M+YfIsDl1NzFsh+JMFiUmnGsEX6zpWaigUMt4qxvyPQlPYMUH4o+iOshEE
	J9jyI9GMkYQWt31w==
X-Received: by 2002:a05:6214:5013:b0:8ac:4fd1:2d5d with SMTP id 6a1803df08f44-8ac86297b62mr188939676d6.5.1776158986491;
        Tue, 14 Apr 2026 02:29:46 -0700 (PDT)
X-Received: by 2002:a05:6214:5013:b0:8ac:4fd1:2d5d with SMTP id 6a1803df08f44-8ac86297b62mr188939346d6.5.1776158986063;
        Tue, 14 Apr 2026 02:29:46 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6de97e36sm400411166b.10.2026.04.14.02.29.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 02:29:44 -0700 (PDT)
Message-ID: <fe1e2ef2-dece-4864-a89b-a311b3ddbfcc@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 11:29:40 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/11] media: iris: Fix VM count passed to firmware
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, stable@vger.kernel.org
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
 <20260414-glymur-v1-6-7d3d1cf57b16@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260414-glymur-v1-6-7d3d1cf57b16@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: xUSGmwePKrrkDVhkOuAKEKaOdxWcen98
X-Authority-Analysis: v=2.4 cv=RoH16imK c=1 sm=1 tr=0 ts=69de090b cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=UlvO0n_oXqfwqGaIblEA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA4NyBTYWx0ZWRfXxZWVfGAXHX6K
 pFS+o+K4lEJonVhgdrlwpjnZSeaKdOT1O5YpamKwWQUMjoOyCBWRvQDwqXkznclmj6D3BlHJOzk
 Eq6Vl7I2fHOgg37enaoMsGp363cBHo3FY9EAxeEBc/9cl7KZyrch7Pw1Oi/EWSG3NtGY5rpSbt/
 CtwRPuuilh7W2z/yIGDN1sXx+oxWS5IlXmjC19CXA7W7faK5sWPhD5/b1dSBdXoTlThKfPDmTeY
 hSlEKh1vAi1e4mMUD7xLMcSxPMaNO4VopE77y+Tf/6lv+Y5qKBvii4UrW3ecL8OYDxjIj+Kw3OP
 FjOqFXdNC2/MbsQ+aqX6IFFcXFsda3gzmI9o3j6lvD9JUJoLwTSfDSuXRo0PDvrZgTUIyV5sglk
 Q5fi7Qj49FESkay5am1d48OpoHkQY2+3DF0lBruUwTpHWVT0K+J8ag0atYWzQGYCcuqMrKTx56l
 BKlWwhDE4EIyP0DWUSA==
X-Proofpoint-GUID: xUSGmwePKrrkDVhkOuAKEKaOdxWcen98
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140087

On 4/14/26 7:00 AM, Vishnu Reddy wrote:
> On Glymur, firmware interprets the value written to CPU_CS_SCIACMDARG3 as
> the number of virtual machines (VMs) and internally adds 1 to it. Writing
> 1 causes firmware to treat it as 2 VMs. Since only one VM is required,
> remove this write to leave the register at its reset value of 0. This does
> not affect other platforms as only Glymur firmware uses this register,
> earlier platform firmwares ignore it.

Should we write a zero there, then?

Konrad
