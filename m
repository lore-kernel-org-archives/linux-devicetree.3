Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBCD3F660D
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 13:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778159754; cv=none; b=Q/yEpdwvHwGI/QpS76yQZIehsL9LrZvnNh81b7JHuKLHb0kBPcipmmVvVhTLrTUncTGXxLXy7C8cVtT/TpIUN4w+RFZQvQw0iKWKmDZ9mP3gFVqPl3JdO0nB0Kpmev+tkPPbif86Ok0PnxrkIsUwg4WSxZo3TSD7AvQg6u4Hn94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778159754; c=relaxed/simple;
	bh=43ZNwjCoR/Xdai8NvV6N12RLoUIGmkzxfRExATYKZ9o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BIQYF9BkzCzzznbTSCV27e3e5fw/WMQt34vqI8PUa4DyHafKiUEUJAjouKSaaKUgvbq7sEkL1G8oYFba2VSfoRjN6VTkveUaOZfumGZKqBZdSfgZn9OuQPpCZfg7uKcRRwKt18Q3u2eczD9eflggRcXKrnzXVpsDpvZqnHQQP+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bqTgoeQA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MerMOOVJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bqTgoeQA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MerMOOVJ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647C5a7N1971781
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 13:15:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H0CO2I5xKatSdKnYvy9OIeCm6tMs6uEinaGoRfuKUHY=; b=bqTgoeQAwCVNNsGG
	pWUSkhVD0TSIoLcUi2g4m7b3vltI2RLEymnB3+EHowInNh+Bk8lxOR5c5VPgN9cb
	NKc2iZEUfQ/T0b43Onp0MYOqIP4kAaANBjEFIUeBgFbqqGJwU1FtIGYA52c7hFCk
	bEeHOIUqS1sZf/PTTWYhMNl5bMEiO8ZMptbcrFeZtl2yosTYPtHYqgrS1IY10eKD
	gqgqqLQ3gHbLqk1dLzlj6dfnFXmXQzY4d0BIy0Mr4WMGOf6Cp/AQgX7EXkO0vvVv
	u/BpsFiCSgYmqESjxBL09ssAIt21Raf8jsHPh17ySaY8M1mBhd5bhwyoC1WRZ4QE
	WJctuw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0tej880x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 13:15:51 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c8252a49ffcso961331a12.1
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 06:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778159750; x=1778764550; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H0CO2I5xKatSdKnYvy9OIeCm6tMs6uEinaGoRfuKUHY=;
        b=MerMOOVJrEQzyRBScPG6WR7BZdNj0W/N9esFh+xJ//4u8kxZY9eQ/ngmE7gvMe6JsC
         yZNC/6lEF5pbnbJkGSy2UEd7yzu0rY7mBtf+PckGs7bpWj5/NH4VhpXj50rYDDL8puwi
         eRrgajE7/pPnDKBq8iy+Zx/DqMBkU6q9SuES8b1p3EainlDTSK/RTAOGdeokQ17dCQFN
         GdLEHKdK5nDmSaHUlrM3tCD/t5pW+uJITHXVppO1SR9zaXUw7t0/fcfWdKHTQXzrtpr7
         K/jCpezQvO1XQ56VrZvr5CZsE0sU2X/jg85BzRfG7sDLt9XVa+A9gwUGZju9QjRINYOA
         ax1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778159750; x=1778764550;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H0CO2I5xKatSdKnYvy9OIeCm6tMs6uEinaGoRfuKUHY=;
        b=Cnk22J0NQwa1L1+Sa1MXUN+LYUotG1VemBSC2uAPcso3HVyh9rTELJFg9BPLUZ2FaD
         xTkX5hv0FTbIUPinp/DT6XGkJAbnrjjGXXfEtuMpQyB1Xbgx6qq6zBwmRMxgtQYhhqE1
         dPhrSo1yZLepeeV+dNjL5XEsvm/AsVrkWR3ga+XHYAVdhWVIa0Q7SV68Sp/zDEXkgydj
         4W0QPW8Rx1hs1bECOzMZJbCdl7hLa1Qz3k/uq187PJ6Ld3ltQq356ysKhME6tL7GqQcx
         q0gHavQHHepu/ecGKS8F/7NFGMSKi59/wM/FLI8U5lTzGZvZ2ch1t4WSujdJFimYoNVB
         GXTg==
X-Forwarded-Encrypted: i=1; AFNElJ88MmKIFMM/apCOlqrjSk1CI1CBqEqqMWjQLsIHagXJ42HtJ5msM4NxHiV+IRbFhg1xfDNutejQpWHs@vger.kernel.org
X-Gm-Message-State: AOJu0Ywqye+xkeOxQRmrQJEA8wMO+OaQDuo8WdH27CNdM5vfRfJsyR1C
	LbB7YVQ/pvNPJk+YxSv0oKm2xXTkmlWLWkIawMILXKtn6KP91TkIVokTQQ92eDfsENdyMjRvH4L
	1JAJm7z+wd/0PCh0NFzR4NBIjJUW+NV3CMHvlGk73aPsGUzNIA5VG9w8iOkDorQlC
X-Gm-Gg: AeBDies0McF6FWtG8qZ22/4J+wDKTUGlw02dj1Gd+DGKaHoWUp828XJ1u7Wl4TjNr59
	nV0kvvLpda7sqxMWWbLQ9E+RfKJz9BwZX4SyYxibS4MMxlUZzan0HVAWI5R9mT+DXddjTHzWuVq
	OnWJ4Xl6CwOKxbywHUR7sBL0H7NhsfrfX4vQnAsseo43SX3cG+Q56ly1H4lP0E97WC2fv2L8A5j
	pxcI6N/srzWVvhxFtRG6Td9ps+zYARiuM7ieMOLJ+GTP2O+b/gqUT8+793kGvq28ieBkV69abVp
	qTlnJ6gMC4J+PFISYEMP6tQ64jbdE5gMQoFRLRttxpp8MQIgcefBk9/0lGf4o4S9CjCwopvTYjU
	f4dXtqFFn2tyOCldmu1AWjmIhYRO9hdXJiJPz4B9clo3B9LDYYzJuo2kmvKI=
X-Received: by 2002:a05:6a20:5493:b0:3a7:1d55:b634 with SMTP id adf61e73a8af0-3aa5abc6086mr8626727637.38.1778159750475;
        Thu, 07 May 2026 06:15:50 -0700 (PDT)
X-Received: by 2002:a05:6a20:5493:b0:3a7:1d55:b634 with SMTP id adf61e73a8af0-3aa5abc6086mr8626671637.38.1778159749922;
        Thu, 07 May 2026 06:15:49 -0700 (PDT)
Received: from [10.219.57.29] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8253790c29sm2220707a12.11.2026.05.07.06.15.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 06:15:49 -0700 (PDT)
Message-ID: <63723178-79e6-4339-88cc-c0fc4c4d7b6d@oss.qualcomm.com>
Date: Thu, 7 May 2026 18:45:43 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: soc: qcom: smd-rpm: Add Shikra rpm-smd
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Jassi Brar
 <jassisinghbrar@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
References: <20260430-shikra_mailbox_and_rpm_changes-v1-0-61ad7c57ef27@oss.qualcomm.com>
 <20260430-shikra_mailbox_and_rpm_changes-v1-1-61ad7c57ef27@oss.qualcomm.com>
 <20260504-romantic-smilodon-of-unity-71d7ce@quoll>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20260504-romantic-smilodon-of-unity-71d7ce@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDEzMiBTYWx0ZWRfX+yXKokNPP1TQ
 5aAzuIjBYyEmCb6simfFAZY7RTRSq3EUF/B8S+XcpYVGDAZoGGwVODHSAZQmC3ZlWfBQnmd3KKl
 /GvtyNBLNPIK2/IQ3th/SJCEVWGL8Fw9FaOPwwE2JQaF5JWLFisij0/tdMkuLiPzrjlseIlplk6
 ts85cDCjS5wSqO2oCv3RENWawCvNuefxPsryE9UEI3KbOvtpFiXnm5E2Z9Z0qZNHn8dh4knn9oi
 oGiKfRpWjnybklG124p0Oy/S12UAECXaqtvI5gEz0G6xlD2PB/HuYmzKBsARWxeAfEXfRxGBQ+g
 m5ncWMyPD20IEtDtw5tcMxLIAjeKwQ855OE2qQhbvQVfeDmb46uEJpTe3iFCjOYo6aXG8LBL8uZ
 fzU2o0txeIWUCB8OCatHk9zwdr/7b/wQuZAqbXSP6KUMg/OhviFMDLDTKmMVuyaiJ8ocovHoL/V
 ndTulbKrttHmkbdFzUA==
X-Proofpoint-GUID: iyUU7P5t_2sTZvm_QV6Ao39UWx7ni3AZ
X-Authority-Analysis: v=2.4 cv=VNbtWdPX c=1 sm=1 tr=0 ts=69fc9087 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=-pAn52T9RjbIQf_sGhAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: iyUU7P5t_2sTZvm_QV6Ao39UWx7ni3AZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070132




On 5/4/2026 3:27 PM, Krzysztof Kozlowski wrote:
> On Thu, Apr 30, 2026 at 03:14:56PM +0530, Sneh Mankad wrote:
>> From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>>
>> Add compatible for the Qualcomm Shikra rpm-smd device.
>>
>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
> Folks, please organize your patches per subsystem, e.g. all SoC patches
> in one patchset. I saw you sent separate firmware, separate cache,
> separate sram and separate SoC ID.
>
> I was already asking this.

I agree with your point and will send patches subsystem-wise in future.
For this time, since some patches have already been reviewed and
don’t need a new version, can we proceed as is?

Thanks
Komal

>
> Best regards,
> Krzysztof
>

