Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43A245040E
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 05:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792386129; cv=none; b=FowlT5hK/4fbxa6v0/LXcIsqwHIHjlUbmfoeCq0fxJ9YrpGQuZi9qWPyEeaklXUyOoUsIlVofBZhetFK6kOqL1DT/HD2wa43V/kYz9ZpBaapaueS/sSC9HLFxm6d+RhciYAkhcxXoMeESNN8MRVqefEFwaHdgrTFaMxHyzS2yI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792386129; c=relaxed/simple;
	bh=kn+5ESPtj0RJi5bfjx0hmp39+NNbUKQWRWiWu6lWa/A=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=m9t3BWgC7FSASAVnGHVu/37SamSx/7Bb459PgOwbz5GPJ6484S+pTsBOE9CCdgQXglUmLrYKS0YgJRVCVwhx4JBcqXVN8mA9Cetb10hl1u8WrST1tKMobLiJvKnDgwLdSSYTZ1u/l4LEKhT09BT74ymI7vDEY2xlT9wzYSETLF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GsxGsQ3Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VeVhDwuz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GsxGsQ3Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VeVhDwuz"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J4j2Ed2819069
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 05:01:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Or4asT3KXALdKFQAYnB0KiA0P++DP8jjRqXZ1+HPl+w=; b=GsxGsQ3ZT2d72ntA
	vOk5NPWBt31GRMqA0xsZeC9RYAz9haqBlKgYh/M/xN46UgSqdVQkmHPro1UsZZV9
	ihIsdPlDpDCuIXXSIadLIGd1PhTZ7QEiGd1jjmtw/PIeSQ3VWAWn8QkWYeGT0uCV
	986bCuOSyFiQTgz526cb6J2ONVNr7SfM64Gh8GWbCHpHAjD7ZAMcLKmiTlSGr2na
	3KBOS7qzAjlx+Jo9mvKmH3DzyIzhBMlV0NzvjsCqD+CfjtyG7Q+cfSUP4d7e/IAz
	QIT2z1Q5kfowxVFcGNXca7cv51P5gqpaNNeln6SiDAWHRv08M1BT/X1kgrlKdvpU
	G9l23Q==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbxqfw5ma-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 05:01:59 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1383723dfddso3507083c88.0
        for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 22:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792386118; x=1792990918; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Or4asT3KXALdKFQAYnB0KiA0P++DP8jjRqXZ1+HPl+w=;
        b=VeVhDwuz++H5IGv8o+D+SJppodlwZQgNWNbSB623enXkLIqwLO27XTI9O7IT7Jnwxk
         ADl2rLBz5PACockZn2VMMH1dAD+h5yE2Vl+nUkxX8Cw+pOdQm5YOtteLa8BCRJRXPqhy
         8yxsYnE5+F2gA/1ktx8kgvuV7m5oeDzZ7JgdasNahovKq4e/+jUt8j2ZtS7w2DV+G8FH
         qdaYFR0keAQkVXu8HmAP8VsK1qpmX9iAEPCnyOAxq4RIluKQiQemOKjXUcJyQPjuhlG1
         u5H44E/SaDZyjCCxExl1yfiHGARCNETdOksdkaXSOMCKm8CPIK15teCn7+uA8Y2zFHXA
         PEGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792386118; x=1792990918;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Or4asT3KXALdKFQAYnB0KiA0P++DP8jjRqXZ1+HPl+w=;
        b=fNukdwkGxR3G0Pljxo22/0P3S8OH/vT0fAMLYaBeZRQ9h0xz1PKvL3FtdVrlw9zYpu
         welR5g4EXwuCgS6GTBBKTHhuLolBOlFjI7vbE7bktTCEkhTLQd7/XnZ+CKsi52PXjUsv
         Hri590/5wk3pZPx0jc+NXTmsyxfq5hE/ls467W+AiSfWwj6qtiv3/ILHcLTN9wrT3MAn
         j5olHaybmDc67dFX7ZyhdipNHFv+H1AOVxPc/HChQNPfB+tqv+xk0HGxxsrGscuVKbsL
         4ZNA7lWJCKTOBJZvwcujYMFZOIpziOOgcN1ibJSIls2DtOwSSMkOAf2zzS5pwkW0TX5w
         PtEg==
X-Forwarded-Encrypted: i=1; AKwUvBzPnzdv2j/SU32DBLcdi1d+nVw6aphXyL1VEh2Jh+8ctfR9nhRvWW/hyW4fRVzRlxsI8JU25qveEg+X@vger.kernel.org
X-Gm-Message-State: AFq9FYLz+hr2g+vAhl2UQkBWaUcvUEWjlYYSvlakY2EYoRUHss53VD9p
	wKJfG7NqYVhs1qjzKRkCv0RDxM12My7a5JSPux1K/9PHOmoc68PgvhA4gLIetxSUzlZpvv4y3hp
	T9HEz0WrLar0oZM4uhN63EL1Nr4FIc2Q4odMOhX6Q+PLsr58S55qT3c4+gnhQpJ/W
X-Gm-Gg: AYBFou2RN1kcn563jkjlWR2oLuTqCTqGBO4j/3QZ1p4+Fnct6WUaDbumjilKk7zRHRR
	IaHdfGM7fPlSdXS75Ft9CdY2JMH4VewguAIOdF61rUfGexduaa3e7J5aM4vD4ZW1MVZqzTgw3wr
	itnhTwVm0eG1UuzVyKkA3msTBivDF/5E2mleTl9IiLHtfm1r9c3iaxWoOKzF5MuniQYyetW5axN
	WK03u0UwRrB+vtxIZrVivurK8xBAk/9Oq/cbnXK8A+mP49yzxARbXcEiIboaQiL9Wb/+bGWUzqB
	/z85GBWB+iyKou7iUDM07BkUkHrbrYDonnvRRmqZSiywiSboJa++vAbAKH/iMnaxf7uVECO0gAr
	qiRs+B/rcjFsKqLlT6HnsdwR4ESqm
X-Received: by 2002:a05:7022:28b:10b0:16f:c9db:c5af with SMTP id a92af1059eb24-185118eded7mr10365905c88.11.1792386118132;
        Sun, 18 Oct 2026 22:01:58 -0700 (PDT)
X-Received: by 2002:a05:7022:28b:10b0:16f:c9db:c5af with SMTP id a92af1059eb24-185118eded7mr10365874c88.11.1792386117582;
        Sun, 18 Oct 2026 22:01:57 -0700 (PDT)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831a6f58c2sm38132385c88.11.2026.10.18.22.01.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Oct 2026 22:01:57 -0700 (PDT)
Message-ID: <ddefe6d9-1a75-46f0-9ccb-10766729e04c@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 10:31:50 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: Re: [PATCH v2 7/7] mfd: qcom-pm8008: Tolerate missing interrupt
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
References: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
 <20261014-pm8010_i2c_support-v2-7-b395d2b3f668@oss.qualcomm.com>
 <e68177a7-f2ef-46ed-a468-15d0d9421d98@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <e68177a7-f2ef-46ed-a468-15d0d9421d98@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAxOSBTYWx0ZWRfX4KNQH3vVLW1c
 etsPQx4lVndS+qfKJI9XMRuMBodFDUPI3hst9wTljd1Ghy6NLeQWtLX8YNBM80vv2p1na4UBzI1
 t8dPzlKNB+C+8q4WfRy3wriorV3L/F0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAxOSBTYWx0ZWRfX2KRxTrao+KbF
 PbSQ4SMgJMs2Kwxo+nKY3bTN8EECIQfJloWEovM5tp21fwa+pNiwW9Yi18j9dSPhhToeuEBbebj
 5lrayfUI2sQgHGSeuTWPOkQBFBhRyBbyNMxxy0fPx6J0/4yqMz/1K3x4Bq4y9IB5W4J7B4GJRFy
 c00npsIdTX/9lcqZG9FAMUgbmIoQMNVYN6HT2UglFwuLB+d6GBc9cQqBj97dTy/YsA/Pt120lan
 86ckqrfEBEQnGJXsuIKIJxJE1+WA64aNQ6Gh1f1/uW7nwsV/50AwHOx8os/seW371cYbpXZmVV4
 zloaObqBj2MsQMQiEpUa0PKBNnoYeD+AgxgdtdIJDDMGyQV9jDi8yp1X169QUPEPhskQdWrcsHP
 1Kr7VWJDaNq2PcWMEMCRY998rKQaZ17K5ZmfdZ9zTjtZlKAZsaQapN2vPwLDgARqrITC9zm5RON
 ijsVBhFxuNdsY+rgpmA==
X-Proofpoint-ORIG-GUID: znU5X7caxYnimJRymUCHQKJbgCt-sXQW
X-Proofpoint-GUID: znU5X7caxYnimJRymUCHQKJbgCt-sXQW
X-Authority-Analysis: v=2.4 cv=RYMFmFtv c=1 sm=1 tr=0 ts=6ad5a447 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=FgZ6Ug7uWDD4XhXpjZ0A:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190019

Hi Konrad,

On 10/15/2026 5:35 PM, Konrad Dybcio wrote:
> On 10/14/26 12:32 PM, Jishnu Prakash wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> PM8010 is often wired up with the interrupt pin tied to ground. Only
>> register the IRQ infrastructure if we have a parent irq.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Co-developed-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
>> Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
>> Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
>> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
>> ---
>>  drivers/mfd/qcom-pm8008.c | 82 ++++++++++++++++++++++++++++++++++-------------
>>  1 file changed, 60 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
>> index 4179427f3891..8b1bbb4052a7 100644
>> --- a/drivers/mfd/qcom-pm8008.c
>> +++ b/drivers/mfd/qcom-pm8008.c
>> @@ -208,6 +208,14 @@ static const struct mfd_cell pm8010_cells[] = {
>>  	MFD_CELL_RES("qpnp-temp-alarm", pm8008_temp_res),
>>  };
>>  
>> +static const struct mfd_cell pm8008_no_irq_cells[] = {
>> +	MFD_CELL_NAME("pm8008-regulator"),
> 
> There's no reason to not register the temperature alarm driver
> if we don't have an irq. It will not be able to carry out the
> "alarm" part, but one can still poll on it.
> 

That suggestion does make sense, but I think it would not
work, for multiple reasons. Let me explain them here.


If we are talking about using drivers/thermal/qcom/qcom-spmi-temp-alarm.c,
the driver has this check in the probe:

  irq = platform_get_irq(pdev, 0);
  if (irq < 0)
        return irq;

So its probe would fail right now if it does not have
an IRQ specified.



Another point is, PM8010 does not have an ADC peripheral.
Without an ADC channel to read from, temperature read from
this temp-alarm driver would show a constant value most of
the time (37000, for stage 0) and this would be updated only
if a high temperature stage (possibly around 90-100 degC)
is crossed, so it may not be very useful for polling without
interrupts either.



And another point we should note is, the MFD cell name
"qpnp-temp-alarm" used right now does not bind to our temp-alarm
driver and this was intentional, as explained by Johan Hovold
in his change (mfd: pm8008: Rework to match new DT binding),
in the last paragraph of the commit message:

    Finally, note that the temperature alarm and GPIO subdrivers need some
    minor rework before they can be used with non-SPMI devices like the
    PM8008. The temperature alarm MFD cell name specifically uses a "qpnp"
    rather than "spmi" prefix to prevent binding until the driver has been
    updated.

Since these changes are not yet done, we cannot use
temp-alarm for PM8008 or PM8010 over I2C for now.

Thanks,
Jishnu


> Konrad

