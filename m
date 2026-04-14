Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B56C283CBF
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 05:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776142918; cv=none; b=k/miE+y7EK0FHtbeI4ecCkCNelW3cehpUBpbV6dTk6xQf1ZKGckx1WBeSve9Oi5B+YY8AEupvYF6jKzgoIu1sZzEAYUCtu/XlFj3JMzqzLsm21e9ywBVHt7Wm5M4P7zY3LXpOmf0TincPzs4aVJIGD0LR1KKPrvLswORsS0veMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776142918; c=relaxed/simple;
	bh=QJ9fyikOIQofRFgBwc+azDKoVS5bLizCWfPAZ19kgPo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JM8iOLzog7x0iho1pDrlBtfTsLrEBVTGOcsX5S2zNbkh4XjRyVaZcVTMzdkeNxcTso/RriZ3WmZUQIJDuGhky/2takamAvc2ZsNpKiCBdfCB6Ut9baglZ47F4OxW/ZfAhDK4M5FvrJR2cPwkjkelW3BUg5w6qDSbTLIpV+wnMuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TkCkilxR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MMkjuD9/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TkCkilxR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MMkjuD9/"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DLDbcY3681496
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 05:01:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I+q/N042oiMflT3drwgvLpgbVroTsdj/Qn+dvCvd5jU=; b=TkCkilxR6QHwyEM6
	K3Uh8HLjjMrRwi5SDzLobn0l0ks7SUkP9b/Y0pm/FqISlhJQMlNylKJ+i+fx7OZB
	jRdYzX3LwzTY6mhbfS1kypRjDdHF0+p34B8QL/rsAIb5JGqeKoZYnDxDcMGKk7fK
	y5DI9XmBgHLJHhEnI2DEngo+ZZb2Piw1DVN+TJ2X+X/H8bgZUVpFn6EXf6CA8Mza
	awxZnam2jtRlVWnvodimOlJ/KI1EWQkAF3HMKwtUlbFIkkFqIObhW15QaMLl9Vap
	4hWYnI6WhD31SUWyc8/++BUygc83V2SZZwNAITJoqHsFOenv2pW77SxTnIlaWFRL
	1fvCcA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh87d126u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 05:01:56 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-358e95e81aeso11258985a91.0
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 22:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776142916; x=1776747716; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I+q/N042oiMflT3drwgvLpgbVroTsdj/Qn+dvCvd5jU=;
        b=MMkjuD9/GYykACxmd4I0UX57wgwgwwkaTfKP81VxL1YYSFRbTxsz2SBxb+rOephXvB
         JftZ4dl4GXr+rivij82wRuGu6PLYG13B9PNuOXDtNQAqszmlaRF9CC2SJURZz1vrFERM
         RtQxGYqJwbo3FmVvjYwjjfH1+JUi6svTvSXnMUqyIOVfz2EWYTmcj6Yi91yp9n5hISA3
         JQgJsCIAWYxd6dYRz/ikPbrU5VdAChXt8LwN+kG6Q+YpQsPpZJZq1lXoGF3P74Kc0aJ0
         0JX4rPu59INT32gcYgQaY8waqBPNPurb3KFIFyNorDiql18Pzf1AjqCPdAhF4/lLsJHv
         BSiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776142916; x=1776747716;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I+q/N042oiMflT3drwgvLpgbVroTsdj/Qn+dvCvd5jU=;
        b=f3SyQEWPQ3CehIOI4oJsgTZZGxeyAzgjHmUPiu/zhW7ofVP4D+CUXM8SnYYGJT+qIk
         8azjewsd5Ud9PpJqZUeWTk+YA8gbuAhJ3iQ7A7PY+EoGZ1dOgj4EDot9U1otSTYp2VeZ
         BdgZAr4+9sLHZZeBU9VZPqRuUIkdk1BvpRF4WyXBTibz9ibC9ADW1O75d05Q2Z1tZKOm
         0Aod2MZtAydGT6DeqJginfcbCmOQAvz/JpWvJXsZ3VMdbHE6KgOU0hh4XVuIWTrfvnmh
         TS6c/gXxc33UXefj7Nryql+743Icr3ytQId0ZF1J12lXtoQ3zXdpV+4vLeTVAFlkZfxn
         jVlQ==
X-Forwarded-Encrypted: i=1; AFNElJ+t4tufeHNVsR6hlFrGLdBSMKukvwL9CQo9j8QSAbg1GDTT0NEA4HiqSxa/6j6Qt53Uas/2tncDTFHE@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/VBe8/UZt9RmvS61ubGurdcvX0NWCdsH8unA++gy8e1aTJqVy
	yW7ICHcu5tvVFfbgbD11luOkzBsLCKVbka7gPUJEk6+iCjaEypjmS1m8ehYNoRnuo7lC7+6FiDA
	mBvqC3Sif7mKx3uiUfiuxPhq3FIcSIS7pOFHwMWT20L10X9H5BIj3YuG08gzzWn64
X-Gm-Gg: AeBDietkOVeu5RKh6nMJKaBJuZUMhxmmmOYtuEcgde7YOGbRR0sU+lDyuGmemT/fmXz
	JBKJWp5w71XEeYA9btUx1tImNvRlN3XlQGojpsEHXHpP1jweymBgg1is4BrP/p7w+3RnXbq146Q
	kkYXiRW6Zx4+u7oeN+a9uv+defnqWL0wdl5Yh4TTMAtEZYC89muma31fcr4mZFShhq91EriRyDz
	1+DiQMiVQT+xVfEt2o/a7WAB06chJKHonc2dRXiAkofSETFJRv12ztzKlPPptzVmJwGzsHLPXV2
	7pnbNIoDJ3ojqx9zgGIY5X+3f0HjBYUFVLejCjc/7/5BGtDx2hBKHkCIioR/bhaNQMJd+WHuaIa
	QLo0+7Nl+8VbRMqPkKFzTFMbB8TMnwqtxwmelHbX7N1gnrmzzYERkNaYZZYH1GTzuEVQdrO+LGM
	O7EnkjSB3RH1PuGnc=
X-Received: by 2002:a17:90b:1e0c:b0:35d:a3b4:2f00 with SMTP id 98e67ed59e1d1-35e427ea4c3mr17602790a91.8.1776142915517;
        Mon, 13 Apr 2026 22:01:55 -0700 (PDT)
X-Received: by 2002:a17:90b:1e0c:b0:35d:a3b4:2f00 with SMTP id 98e67ed59e1d1-35e427ea4c3mr17602754a91.8.1776142914976;
        Mon, 13 Apr 2026 22:01:54 -0700 (PDT)
Received: from [10.133.33.94] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35fc6e6070bsm691414a91.7.2026.04.13.22.01.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 22:01:54 -0700 (PDT)
Message-ID: <cd47cde2-757f-4b6e-9846-0673798f3093@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 13:01:49 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] remoteproc: qcom: pas: Add late attach support for
 subsystems
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
References: <20260409-knp-soccp-v5-0-805a492124da@oss.qualcomm.com>
 <20260409-knp-soccp-v5-4-805a492124da@oss.qualcomm.com>
 <adm56u_cDoKnuPob@baldur>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <adm56u_cDoKnuPob@baldur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA0NSBTYWx0ZWRfX6agWQrpei6Z7
 RirqCKgoDG9jKPU0YdcAbDlqiXy9iriam2ex4XFOFJ2qOnLjU75A9XncqCuvrT2oB0Zj4M7knjb
 aHMbWk9bpXS7b2Lu6q3Y8WFrZxXEIAEohimE91p1QnaFqXTRlxiD0tMPbEO4/eF+yWbYEr+qOzq
 ZsOBdII9nBtopS+GMSdWGKjlu1gZ7TUljXv8UrEwml0nu28mA9+bGJNPs7qHFzv00YgtKA982s3
 IB4xay0bmhjqohmrBlQRAx512D4IR0hnhGNMrc99PI7IDT4q/MvdqcR63jy4OhejW3EIycsHvDh
 0GD22d7G8XTS5UHPaGkDtJ4EwosGVQ6aEJU7AMWhHEEj9YFyby1yzgNzvxCgRRinhfXURPReLlk
 8NQQNIZqNQEs79gDR3nx8Cvdy3DFu2cAE9sWz5w13dmfgC2M/oaTwhqkUTFWf2t9/JSWIpL5FjD
 xY9hvtpfvFPELckVwtA==
X-Authority-Analysis: v=2.4 cv=N+8Z0W9B c=1 sm=1 tr=0 ts=69ddca44 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=g4S4wLomyV-OnTC5uXsA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: gp31KxwfA1-LdlvWPBG5ENVUeZ2OFi4V
X-Proofpoint-ORIG-GUID: gp31KxwfA1-LdlvWPBG5ENVUeZ2OFi4V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140045



On 4/11/2026 11:04 AM, Bjorn Andersson wrote:
> On Thu, Apr 09, 2026 at 01:52:27AM -0700, Jingyi Wang wrote:
> [..]
>> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
>> index da27d1d3c9da..34b54cf832d0 100644
>> --- a/drivers/remoteproc/qcom_q6v5_pas.c
>> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
>> @@ -60,6 +60,7 @@ struct qcom_pas_data {
>>   	int region_assign_count;
>>   	bool region_assign_shared;
>>   	int region_assign_vmid;
>> +	bool early_boot;
>>   };
>>   
>>   struct qcom_pas {
>> @@ -423,9 +424,15 @@ static int qcom_pas_stop(struct rproc *rproc)
>>   
>>   	qcom_pas_unmap_carveout(rproc, pas->mem_phys, pas->mem_size);
>>   
>> -	handover = qcom_q6v5_unprepare(&pas->q6v5);
>> -	if (handover)
>> -		qcom_pas_handover(&pas->q6v5);
>> +	/*
>> +	 * qcom_q6v5_prepare is not called in qcom_pas_attach, skip unprepare to
>> +	 * avoid mismatch.
> 
> Can you confirm that no load_state should be sent to AOSS for SoCCP?
> (I.e. from the skipped qcom_q6v5_prepare())
> 
> Regards,
> Bjorn

load_state send qmp to the subsystem, we checked from code level that
current downstream SoCCP do nothing with this now, I will double confirm
it from subsystem side.

Thanks,
Jingyi

