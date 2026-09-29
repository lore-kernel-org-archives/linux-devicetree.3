Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985B9501F46
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 10:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790677217; cv=none; b=F20q9dFXfik7wx9fbvO3S8BEY8aa8xgjovd8UV7+sUjC+lh0xZzACAsXNAkklqaDqeagdqfoTFJ8TIe4/OBGmvQXZo9JhoT89RRmL5aGVeogNueMee4DhsBjiuRJzsEaM7i9umLSD7L6f6aF/Y8mwZvp/yI65D5T/lL2IXqt4Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790677217; c=relaxed/simple;
	bh=Is+lHiAImJP4njetw1RNIkDlKPu3XtLpipofyQnPd04=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XMSOqsFzuZDKn4uc5zMziPPj5sUU5JB7tjsH45bJlAZF9jqU5vfEKydEXWCWj/KRo0OETXySpOn9pzGwCgFtR2SbNcm2vJi9SeijEqUcccU/65/kA4/lMLL7zAdNeMSUVfX+bGgDszyqrPkTZTPf5bzUHskVENsIvXOl9fB4jsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KOHehtqr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jQcU3jRW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KOHehtqr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jQcU3jRW"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T7Tqxb2570996
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 10:20:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dD0HqSAcI0z3CstFwBJdbtAFCT9aHW+6ENJUka6C3ZM=; b=KOHehtqrVzWVW9G2
	CctEaHyqTg7r/dA3sEvAde5DDdhBr93n10NEeVhJLGAMXnFrAulfn5JeFAxwGLPo
	SG722N5GH61W+2rwGnjp1mlCin7g8F/zY9dY23kZ+n5+5HVJmtsLpMHLOlsKqtmi
	cQ8mMmGD4PHPTdC8YSbuDKCOHo4LehWyx69dFnLH8ZB55JEM1tKOhay9TZSbPjrJ
	ALKC7Hv/pGypCyr2Es8bCb4YF6qeZopBztATKWQzt9MqePgP2v1KANkAvXi+m8e/
	RcFxu5HhygGzSLCpapgkyxWX1ettiG+4fgGOH+5V9+JYGp/gEB+1Eq+PdaZhd9C+
	Fctd5w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h02mna5bh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 10:20:05 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so9007046a91.1
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 03:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790677205; x=1791282005; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dD0HqSAcI0z3CstFwBJdbtAFCT9aHW+6ENJUka6C3ZM=;
        b=jQcU3jRW2r2gKkTiA9dkoThuMS1mCjhOan+BqFtC1L0/DN2HcGi3Grd1xhUmLHUm0l
         DBDVXgrY4ExrUxdBl5XCzYXp7WzUU4yHkz3D/tp1rLvUjmVDjbjYIfnHMiclm2erAAhL
         zOXxZsxMbtWwWkRJdKOSXkHi2QOce+ly92mP0scuzmyI80fKO4P+0ilmUHwkMOudKxh/
         T8GYzgB0RI/vgPS5KdCxVI0mSteXz74PRLiaNNs7yTqi1sa+9RExSgh384fRyAn3pH4l
         oLa29ACf8mpQEAdE7yoX2ShHnlBa03PVBztKviA0o+sAeV9dJJoP4aGKHiYvmnXQ/sFH
         GRlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790677205; x=1791282005;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dD0HqSAcI0z3CstFwBJdbtAFCT9aHW+6ENJUka6C3ZM=;
        b=ucPKIL5Y07Av8+zOayQaTkq8uhheeEnaOkTQEGpjIlDTBLjcnTIINhNcZO7YCUc7Bd
         XHz7KVSm7DVwHjZDwrlPcqb8MlnOelG6A7hOZ5PZ6hQR/fJxuBnJ3WC+3on24No4yTmm
         ZxBZhAmv3IlrQDWedIuZThQ5c/TYMy6hdr1jsaM5aGeR1aQS7I562SP4igTXQm+wdPe4
         MXu2W5ki0kE/bVX+mdO3/ohN3FladFEnBceVweHPR3PX10TyPFSm8z4Bpxqk6SXrTYVo
         NBaVeFSfw74tx80pbu9yteC/trpY+8LPxJ9U5wRDXTQ74XbaYMoHdMzvlzINUrOoV2SQ
         0aHg==
X-Forwarded-Encrypted: i=1; AKwUvByG6azmLcfwq77UJ7oBZ7qZ3TBY1B9quNX+pHyC5gyyKaWGGWty1A0G9hXfqXrDCeGcwKLdxAWEAKBU@vger.kernel.org
X-Gm-Message-State: AFq9FYLs0/5OFb1lA7VcyAJdTSGc1jISOob1cS6wNtcVYz7yai8XsB/r
	/EN+UmEKKCzdHfDvT0/hl2XYqMUY7oYUzMVGF6+VM4o78iA6abxbfVA6uPpBTAN1NzjA21SUp58
	kthfVsrZOzMIsNzPohb1Ly/x2vViZ9qtf7qOJymh1EV8F8jqDiETJQGhg1oKBGoLs
X-Gm-Gg: AYBFou16gYU2g8FGSaWQHyMhoqzlROzRmiMwHmTSkOUUjNHLR3XvPaT0L2oIpZQAj6h
	kP3nadfKXUkT/3QWwfEIwS6CE89oa523rfA7JnTAa4LPyy0nU8D3rJFjoV270X4vMgXR1BXrlp0
	6qibZtB3GvaQh6Uxxe9EeFIE+e3qjh9DKHY9laoSpGE1CbOP41cuhIXdA1dAwRA3Sjm4ikRhCMV
	NrG3hABcr3r9w40lhCMSgILHTvXjaATEOKeJsLEV/inPm1AcoSGLzRBijT/ViuhozOxVutuNolr
	OdRdkrnD4wGoPSvIjLFidO3sEV+FOPDfK/cWYZuPf9pkL48ouAuI8rq6HXM388AOkIm8SLnn7jf
	Vt4gzWJ3l8uRLjqxz+O81aNn2
X-Received: by 2002:a17:90b:17ce:b0:39e:4c80:44be with SMTP id 98e67ed59e1d1-3a0bb60b2ddmr10202069a91.33.1790677205199;
        Tue, 29 Sep 2026 03:20:05 -0700 (PDT)
X-Received: by 2002:a17:90b:17ce:b0:39e:4c80:44be with SMTP id 98e67ed59e1d1-3a0bb60b2ddmr10202042a91.33.1790677204730;
        Tue, 29 Sep 2026 03:20:04 -0700 (PDT)
Received: from [10.219.1.5] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc78791c072sm5997988a12.15.2026.09.29.03.20.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 03:20:04 -0700 (PDT)
Message-ID: <e3ae21db-b777-4d3f-9587-50687d297abc@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 15:49:41 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] Bluetooth: hci_qca: Add WCN clock management for
 pwrseq-based power path
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_mohamull@quicinc.com, quic_hbandi@quicinc.com
References: <20260925-bt-wcn-clk-enable-v1-0-30bee88c4de4@oss.qualcomm.com>
 <20260925-bt-wcn-clk-enable-v1-1-30bee88c4de4@oss.qualcomm.com>
 <CAFEp6-1J_nnD1OY=GBET19p9+j28n9LFmt5CgoiyWr7FVSmOFQ@mail.gmail.com>
Content-Language: en-US
From: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
In-Reply-To: <CAFEp6-1J_nnD1OY=GBET19p9+j28n9LFmt5CgoiyWr7FVSmOFQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=X9fHu2Te c=1 sm=1 tr=0 ts=6abb90d5 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=aVxM1FiM0cXrEgfon2wA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 6leDGdeyhtHr9GOsLgbjecrerI1kSi0D
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA0MSBTYWx0ZWRfX8dEWPe7Z25m4
 8k6HSkX7amaD2zMtnKsTLwJA6C9xYiu2eD38s6sW/WoLbJfuU1umxYuO9xdjrwLtdo+DOEOrM20
 8HMYbnQ2Tjd8ZCGskj7nHmLbYWYqxTk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA0MSBTYWx0ZWRfX1QFZy62j3+9v
 AdeQY0XHAO81KBdSOiWTl1+GRQHGKTdIxqcRUBOEL72BX8kAbu+4kAyhAdnpkterqpFWOWNI7KF
 olUWfhNPtZGOw/GzDT2GkyVcBqH64+eFKgvw09EQ7Dweu/o78kjin+RQk3jBM2sb3pCaeZ6NkKM
 4Juimsq+JN+gM3e51gvwVcW8wjhWFhvfi9SI4PkQvOcNbs4/Bd1zYlkwNm10cZ9nzPahEXPU7dc
 3HnzvJgp6YingOOasefm91Sfb1tcp0wo8IUwdxAHkX1YJcj8Rp5MPT+A2OcGzzFd3IRq+lpBpkk
 dHtbJNLy3Tbz1icKjsP5//qzAo8ltdY4CmCtlY28/V0/G7H1qFhzj8BV9RP6pJU+LAxYlMEkhAm
 ijJxLqplhULQz6wkFFIo+/iQdwXvoxSlBHrwwrngj8hMLjXKP65JiS2MzEFaG7TUchwOLNVr08+
 skNVyC80uClAM/Mg7wA==
X-Proofpoint-ORIG-GUID: 6leDGdeyhtHr9GOsLgbjecrerI1kSi0D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0
 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290041



On 9/29/2026 3:33 PM, Loic Poulain wrote:
> On Fri, Sep 25, 2026 at 8:21 AM Yepuri Siddu
> <yepuri.siddu@oss.qualcomm.com> wrote:
>>
>> RPMCC previously kept WCN clocks enabled via proxy votes, so the pwrseq
>> power path in hci_qca did not need to explicitly manage the clock.
>> With proxy vote removal, each consumer must explicitly enable and disable
>> its required clocks.
>>
>> Extend the pwrseq-based power path to acquire and manage an optional
>> WCN clock. In qca_serdev_probe(), acquire the clock using
>> devm_clk_get_optional(). In qca_regulator_enable(), enable the clock
>> after a successful pwrseq_enable() with proper rollback on failure.
>> In qca_power_off(), disable the clock before pwrseq_disable().
>>
>> Targets that do not define a clock in DTS are unaffected since
>> devm_clk_get_optional() returns NULL and all clock operations are
>> guarded accordingly.
>>
>> Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
>> ---
>>   drivers/bluetooth/hci_qca.c | 23 ++++++++++++++++++++---
>>   1 file changed, 20 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
>> index 7089e9b639b2..489a059e519a 100644
>> --- a/drivers/bluetooth/hci_qca.c
>> +++ b/drivers/bluetooth/hci_qca.c
>> @@ -2265,6 +2265,8 @@ static void qca_power_off(struct hci_uart *hu)
>>          }
>>
>>          if (power && power->pwrseq) {
>> +               if (qcadev->susclk)
>> +                       clk_disable_unprepare(qcadev->susclk);
>>                  pwrseq_disable(power->pwrseq);
>>                  set_bit(QCA_BT_OFF, &qca->flags);
>>                  return;
>> @@ -2324,8 +2326,17 @@ static int qca_regulator_enable(struct qca_serdev *qcadev)
>>          struct qca_power *power = qcadev->bt_power;
>>          int ret;
>>
>> -       if (power->pwrseq)
>> -               return pwrseq_enable(power->pwrseq);
>> +       if (power->pwrseq) {
>> +               ret = pwrseq_enable(power->pwrseq);
>> +               if (ret)
>> +                       return ret;
>> +               if (qcadev->susclk) {
>> +                       ret = clk_prepare_enable(qcadev->susclk);
> 
> Why is susclk guarded by the pwrseq? They seem unrelated to me.

You are right. On further thought, the clock belongs to the WCN hardware
and its power sequencing is already handled by the wcn3988-pmu driver.
So the hci_qca driver does not need to manage it at all.

In v2 we dropped the hci_qca changes and moved the clock property to the
wcn3988-pmu node in DTS instead:
https://lore.kernel.org/all/20260929-bt-wcn-clk-enable-v2-1-7a90902f3df5@oss.qualcomm.com/

Thanks,
Siddu
