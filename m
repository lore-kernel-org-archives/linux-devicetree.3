Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793933960;
	b=dkYSp7ep2k7JDywjHk5U5cc1JnpC77ngdknq4ilSPjXTLQ16G2gvI2THUhiknL52wTFq
	 5DXrMXMaFTLOTCSZvbOzGc8HM7ao8qHRhFiqZ71STyyJYjfQ3c9IySVgwQgUGP9enysvj
	 ak08H0NVzWbLXq/XJgAWcvbXpBJKZRO2RnmZV1JhVZrEhd1fZoFcR+miD/Hde1OBfb4U3
	 eIVbTsNQ+DVz5BONP1TqBlLTCwECwEC+IJsWAnq3VPbyyJer1lRVeI7kRh35307rYqJ9R
	 S0Vay4ZUfCnjxUEt+1kl7Mx0B1VVIBypY2YY4eYj7Ul87wyYyNMIXiVfqCqm+LcqbVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793933960;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rWzTNqY15kY9Ycqy3ORJKlvSsbZyK/UqSUFvwFHrbr0=;
	b=uQTFh34MAIywBQMERl8xV19ruajrgVyr9NPRdj0tQz92qOWLkgJRcDXi5jxtz+jL5baU
	 iZGD32JnluN3NaHFZhk2Pp4ODUdPp+DAFXvm88zNQfJ+OZfaL8UkWREHlVJPcPMPwqVmn
	 nJoVX2/5lZVqzUP5RsDsOZeynIuiFRYVrxIqq7zNExj4XGPVYOt/NnREgNwENoM3MmisH
	 a0iY+1Fv4jD3ckSYY3NFA3uJX6N6mnuT9WPUTmigZYHrmYqwGMb7BR5NaII7K4wC8KCi9
	 hSyZ6ES9cWXwUPpgHQMRQYd0AWYvpmlKGrWr1mYDiXjfAlOnzYDPodrYrH8biRBsEmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hCt+KT9s;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iDMBGmMC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B80606A31B
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 02:59:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80B80606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hCt+KT9s;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iDMBGmMC
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5NlEFc2288620
	for <devicetree@vger.kernel.org>; Fri, 6 Nov 2026 02:59:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rWzTNqY15kY9Ycqy3ORJKlvSsbZyK/UqSUFvwFHrbr0=; b=hCt+KT9szoPmBrXO
	7aWKsIr4E9ufS5X3KSJur9ekTkisEdoQLibRYufbcsQCL9ghPzS3V6edaZ2duuGq
	ztNGm6Lc+R8Or5CbeKhOn4aEXR7+Wl42n5T7Kjdbt3Oh8vRGVSpwRgVoedlnE5nN
	+APFXvvhdkLj5d95/kAfOk6RiE1T8oCMiXmrUuTchYt0tIANceC4HMemmsDnTfTT
	gzYLwkHzMK66EkAVCRNlndK9DsSKnnCW13VO30q9VEj81giWCvGdi3U3FA2D6lNE
	bR+2k20mnK/3UsSHyBgnyPJ5JJaW2JphZzI8hwFQQT4seRTJw78c+GgQeN1ao7bt
	g3dxVg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa0mh1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 02:59:18 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b0a528ca65so216279a91.0
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 18:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793933957; x=1794538757; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rWzTNqY15kY9Ycqy3ORJKlvSsbZyK/UqSUFvwFHrbr0=;
        b=iDMBGmMCGtNYPgPHSai1PLqHk1hBk80YNKlPZ5gWOFWFL4N+G/aO8qQPdMn/tumnw6
         unRFTJs+1C93W4ewH0m+yzvNTZb6EXEaBlGtO2dC+seGsT17Vyavq9dAsmM4jS4PDjfT
         QW3jOrjsGTZgEO3FdbpaNcBCtHCkgOPERxtC6SPnqDwjJ/2LLXFsRGBfnFpQ2foptd4p
         zn9K5l3C+Uu4n4CMrb/ceGjb9NwCuLUYIbkDqqLpvRSreQaYI/Fw5CwnJtCxBSEMvuoD
         YTKPFsEleap6d6BzWQpWGTy9M9B+g644g9l1LrFNmjdOh0zPNUMuqr8qwmGCJk8BefBw
         aw3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793933957; x=1794538757;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rWzTNqY15kY9Ycqy3ORJKlvSsbZyK/UqSUFvwFHrbr0=;
        b=fCCYUjqt+Fv4BkTIBjdBdNp6k1KdiOJ+wKFjat/POYkEgS1K9A5oNtabEbmWxqVb8r
         8ojNRfbj/qoboAkLfQRWJA1NU3sfAkqCzDmaXd0AtJRt9omIz8LSnD8ml9EoshylF7D6
         2bH4kPL4epGa6gqQjjMluI2s5SZKnR9wPrmlZWbl1YvOviUGNSTGmkkGlomVYzvCMLtB
         kfL56kB2jESLKGwh76OLnDn6GyJRYolgWxQoi+uI1WQ2s97zSRZVve8MkDDuD58fOxUC
         nVEykNHYTg8v7TSGl+I5AlF/UOTrNxN+wBYnwPKddlxa6icFcDCfg9UbilcCtS5BElmE
         O0bg==
X-Forwarded-Encrypted: i=1; AL+hErE7LflwhQ69rrcSDGb26+CQ/++2mhJ+D0y+KBpuPkY2CFFDv52a7TL9BAlAo7WXp+wzkb2rJXBhgbN9@vger.kernel.org
X-Gm-Message-State: APuU4Z+QDsNzUM4WMkzIZSG7hTmnH4AQ/ixw9k786isi9bjScGvmOCmF
	Yh0DayoPUI13nkjO96YEbn1NHBhk134dPK0cx/b2Egg5DsTpGcWTv5vXn8VTDdksWZ66gQO0IyC
	7UT6IL3jCxbvPnOEo6khEOtYuw+tjBPo23cIUOesacqmH/D6VSkIzefZNbWqxapZ3
X-Gm-Gg: AYBFou2dww26l6fiXHlxfwBUQWbJ/x6NCUVeeJRv+/iPhLcax8z2XJWlb4GQHtPYWiN
	FkqyFUOIyjaivYJHZW+9RlMQkhOpOkT5zAZO7ObUVgDA4KSvuR23mWJbd4PVT67UqRec6oeZRVw
	0oeM6+OrFtsNUE6cRgS3u5gPkwj8rgvdQRjDiAYduuxhksE9nNRGC9bLuJq7/y3wHtinciURvaM
	mKMUnj7xpO9w2euWiKpZ8lpfvOU86viJssEs+fksaop8eWA4qv/6elp48SbBkZ7uaY1lOfe4yPr
	QANdSVfPNYW+1WFO3z4v+cRwO7CwZ3ILffi7fFrS/WLgRspi5Bu3nQeYkqdPYBO0EqC6q5CmwEv
	VYq4+mfvG7lXPdeWIhQSAyUZyHnAZW3z0Ui5Lw1KtDrOC1HzgH1+zSaFhq+1QjQ9hLCYUeYu6pN
	9ABnqrCpGCsPzgYpYnP9yo4v/ztbTKyguuStX7cSBORb8=
X-Received: by 2002:a17:90b:4486:b0:3b0:9deb:d994 with SMTP id 98e67ed59e1d1-3b0db7251bamr994546a91.64.1793933957073;
        Thu, 05 Nov 2026 18:59:17 -0800 (PST)
X-Received: by 2002:a17:90b:4486:b0:3b0:9deb:d994 with SMTP id 98e67ed59e1d1-3b0db7251bamr994515a91.64.1793933956541;
        Thu, 05 Nov 2026 18:59:16 -0800 (PST)
Received: from [10.133.33.115] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b096b72d5asm4603741a91.4.2026.11.05.18.59.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 18:59:16 -0800 (PST)
Message-ID: <6cab89dc-04f0-4d54-a935-eee2254b054c@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 10:59:11 +0800
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 2/7] qcom-tgu: Add TGU driver
To: Suzuki K Poulose <suzuki.poulose@arm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        konrad.dybcio@oss.qualcomm.com, james.clark@arm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
        Jie Gan <jie.gan@oss.qualcomm.com>
References: <20260730080704.2903540-1-songwei.chai@oss.qualcomm.com>
 <20260730080704.2903540-3-songwei.chai@oss.qualcomm.com>
 <55e1da04-1e8b-4783-a4db-0f154d8ec10e@arm.com>
Content-Language: en-US
From: "Songwei.Chai" <songwei.chai@oss.qualcomm.com>
In-Reply-To: <55e1da04-1e8b-4783-a4db-0f154d8ec10e@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAxMSBTYWx0ZWRfX73WorqfVZ00Y
 KlDh/Ujko0If36mUX0iW8YGj5xMyTdogL6GTDyf80Hc3X0V/BS6vIlw/ABia8b2yX7hg9r+rYuT
 igr0izMGYRzi176k6TbMX/OUgbuzptcFm9nOadfQj88gJGwkPmX6ZE2x+yM9I2/iAoMMVOBzLL7
 u1piUHf6sQWDlch/Qe6Mg3yoLt8Dt+tegNixIlFAURbvxNuG6IRUxh05KOTEUYGTxQDPrdcj0es
 7xoQUYRu0dM4OqtyrXDl8dy7V5KPU6r+VE0MjiG2YPoGNuA16QkHq/nyHOL492yISGZeZN2mshx
 ByQlHS9NboI0tNn6iCjBYXwOwW/bF0c4URIhZZurjJ5tGdpSaS4AwG22NuWCFT0Dlq56GM4z2bw
 HjBkd3l1WeLxU/oSTu8aJmZ2MXwcHbXJnT0cfwEcTQpV9b65feg/Mu6XWcH96J4JuR34j/fcwki
 h+aYzWRf6bXs/zOSsPw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAxMSBTYWx0ZWRfX09AUn7AfS1Wp
 nHe1DovVuZpzzcAaVnB2y/x5ubQc5/yTUXMfFvp0gQknSEbG90+Cwgem64OXVkjTJoV3PBz7pvh
 18tZbp3Uchg0gfgNiR4Pc3lTroYRL/4=
X-Proofpoint-ORIG-GUID: LYsBSrZn-Ei9_Tt6u9BAI0ulmDnenNDR
X-Authority-Analysis: v=2.4 cv=GpzXaU1C c=1 sm=1 tr=0 ts=6aed4286 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=p-U3weD7bCxB8QOMAjgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: LYsBSrZn-Ei9_Tt6u9BAI0ulmDnenNDR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_06,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060011


On 11/5/2026 8:32 PM, Suzuki K Poulose wrote:
> On 30/07/2026 09:06, Songwei Chai wrote:
>> Add driver to support device TGU (Trigger Generation Unit).
>> TGU is a Data Engine which can be utilized to sense a plurality of
>> signals and create a trigger into the CTI or generate interrupts to
>> processors. Add probe/enable/disable functions for tgu.
>>
>> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
>> Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   .../ABI/testing/sysfs-bus-amba-devices-tgu    |   9 +
>>   MAINTAINERS                                   |  11 +
>>   drivers/Makefile                              |   1 +
>>   drivers/hwtracing/Kconfig                     |   2 +
>>   drivers/hwtracing/qcom/Kconfig                |  20 ++
>>   drivers/hwtracing/qcom/Makefile               |   3 +
>>   drivers/hwtracing/qcom/tgu.c                  | 192 ++++++++++++++++++
>>   drivers/hwtracing/qcom/tgu.h                  |  51 +++++
>>   8 files changed, 289 insertions(+)
>>   create mode 100644 
>> Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>>   create mode 100644 drivers/hwtracing/qcom/Kconfig
>>   create mode 100644 drivers/hwtracing/qcom/Makefile
>>   create mode 100644 drivers/hwtracing/qcom/tgu.c
>>   create mode 100644 drivers/hwtracing/qcom/tgu.h
>>
>> diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu 
>> b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>> new file mode 100644
>> index 000000000000..36ab64f1e301
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>> @@ -0,0 +1,9 @@
>> +What:        /sys/bus/amba/devices/<tgu-name>/enable_tgu
>> +Date:        August 2026
>> +KernelVersion:    7.2
>> +Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai 
>> <songwei.chai@oss.qualcomm.com>
>> +Description:
>> +        (RW) Set/Get the enable/disable status of TGU
>> +        Accepts only one of the 2 values -  0 or 1.
>> +        0 : disable TGU.
>> +        1 : enable TGU.
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index ce5c5185c773..4789321cca6d 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -22360,6 +22360,17 @@ S:    Maintained
>>   F:    Documentation/tee/qtee.rst
>>   F:    drivers/tee/qcomtee/
>>   +QUALCOMM HARDWARETRACING DRIVER
>> +M:    Songwei Chai <songwei.chai@oss.qualcomm.com>
>> +M:    Jie Gan <jie.gan@oss.qualcomm.com>
>> +M:    Suzuki K Poulose <suzuki.poulose@arm.com>
>> +L:    linux-arm-msm@vger.kernel.org
>> +S:    Maintained
>> +T:    git 
>> git://git.kernel.org/pub/scm/linux/kernel/git/coresight/linux.git
>> +F:    Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>> +F:    Documentation/devicetree/bindings/arm/qcom,tgu.yaml
>> +F:    drivers/hwtracing/qcom/
>> +
>>   QUALCOMM TRUST ZONE MEMORY ALLOCATOR
>>   M:    Bartosz Golaszewski <brgl@kernel.org>
>>   L:    linux-arm-msm@vger.kernel.org
>> diff --git a/drivers/Makefile b/drivers/Makefile
>> index 0841ea851847..6a2cbe5b340f 100644
>> --- a/drivers/Makefile
>> +++ b/drivers/Makefile
>> @@ -176,6 +176,7 @@ obj-$(CONFIG_RAS)        += ras/
>>   obj-$(CONFIG_USB4)        += thunderbolt/
>>   obj-$(CONFIG_CORESIGHT)        += hwtracing/coresight/
>>   obj-y                += hwtracing/intel_th/
>> +obj-y                += hwtracing/qcom/
>>   obj-$(CONFIG_STM)        += hwtracing/stm/
>>   obj-$(CONFIG_HISI_PTT)        += hwtracing/ptt/
>>   obj-y                += android/
>> diff --git a/drivers/hwtracing/Kconfig b/drivers/hwtracing/Kconfig
>> index 911ee977103c..8a640218eed8 100644
>> --- a/drivers/hwtracing/Kconfig
>> +++ b/drivers/hwtracing/Kconfig
>> @@ -7,4 +7,6 @@ source "drivers/hwtracing/intel_th/Kconfig"
>>     source "drivers/hwtracing/ptt/Kconfig"
>>   +source "drivers/hwtracing/qcom/Kconfig"
>> +
>>   endmenu
>> diff --git a/drivers/hwtracing/qcom/Kconfig 
>> b/drivers/hwtracing/qcom/Kconfig
>> new file mode 100644
>> index 000000000000..5c94c75ffa39
>> --- /dev/null
>> +++ b/drivers/hwtracing/qcom/Kconfig
>> @@ -0,0 +1,20 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +#
>> +# QCOM specific hwtracing drivers
>> +#
>> +menu "Qualcomm specific hwtracing drivers"
>> +
>> +config QCOM_TGU
>> +    tristate "QCOM Trigger Generation Unit driver"
>> +    depends on ARCH_QCOM || COMPILE_TEST
>> +    depends on ARM_AMBA
>> +    help
>> +      This driver provides support for Trigger Generation Unit that is
>> +      used to detect patterns or sequences on a given set of signals.
>> +      TGU is used to monitor a particular bus within a given region to
>> +      detect illegal transaction sequences or slave responses. It is 
>> also
>> +      used to monitor a data stream to detect protocol violations 
>> and to
>> +      provide a trigger point for centering data around a specific 
>> event
>> +      within the trace data buffer.
>> +
>> +endmenu
>> diff --git a/drivers/hwtracing/qcom/Makefile 
>> b/drivers/hwtracing/qcom/Makefile
>> new file mode 100644
>> index 000000000000..5a0a868c1ea0
>> --- /dev/null
>> +++ b/drivers/hwtracing/qcom/Makefile
>> @@ -0,0 +1,3 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +
>> +obj-$(CONFIG_QCOM_TGU) += tgu.o
>> diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
>> new file mode 100644
>> index 000000000000..9c7dd4a09f02
>> --- /dev/null
>> +++ b/drivers/hwtracing/qcom/tgu.c
>> @@ -0,0 +1,192 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#include <linux/amba/bus.h>
>> +#include <linux/device.h>
>> +#include <linux/err.h>
>> +#include <linux/io.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/mutex.h>
>> +#include <linux/of.h>
>> +#include <linux/pm_runtime.h>
>> +
>> +#include "tgu.h"
>> +
>> +static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
>> +{
>> +    TGU_UNLOCK(drvdata->base);
>> +    /* Enable TGU to program the triggers */
>> +    writel(1, drvdata->base + TGU_CONTROL);
>> +    TGU_LOCK(drvdata->base);
>> +}
>> +
>> +static void tgu_enable(struct tgu_drvdata *drvdata)
>> +{
>> +    tgu_write_all_hw_regs(drvdata);
>> +    drvdata->enabled = true;
>> +}
>> +
>> +static void tgu_disable(struct tgu_drvdata *drvdata)
>> +{
>> +    TGU_UNLOCK(drvdata->base);
>> +    writel(0, drvdata->base + TGU_CONTROL);
>> +    TGU_LOCK(drvdata->base);
>> +
>> +    drvdata->enabled = false;
>> +}
>> +
>> +static ssize_t enable_tgu_show(struct device *dev,
>> +                   struct device_attribute *attr, char *buf)
>> +{
>> +    struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
>> +    bool enabled;
>> +
>> +    scoped_guard(mutex, &drvdata->lock)
>> +        enabled = drvdata->enabled;
>> +
>> +    return sysfs_emit(buf, "%d\n", enabled);
>> +}
>> +
>> +/* enable_tgu_store - Enable or disable the Trigger Generation Unit 
>> (TGU). */
>> +static ssize_t enable_tgu_store(struct device *dev,
>> +                struct device_attribute *attr,
>> +                const char *buf,
>> +                size_t size)
>> +{
>> +    struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
>> +    unsigned long val;
>> +    int ret;
>> +
>> +    ret = kstrtoul(buf, 0, &val);
>> +    if (ret || val > 1)
>> +        return -EINVAL;
>> +
>> +    /*
>> +     * Hold the mutex across the whole check-and-act sequence: the 
>> check of
>> +     * drvdata->enabled, the PM runtime reference counting and the 
>> state
>> +     * update must be atomic, otherwise concurrent writers could each
>> +     * imbalance the PM runtime usage counter.
>> +     */
>> +    guard(mutex)(&drvdata->lock);
>> +
>> +    if (val) {
>> +        if (drvdata->enabled)
>> +            return -EBUSY;
>> +
>> +        ret = pm_runtime_resume_and_get(dev);
>> +        if (ret)
>> +            return ret;
>> +
>> +        tgu_enable(drvdata);
>> +    } else {
>> +        if (!drvdata->enabled)
>> +            return -EINVAL;
>> +
>> +        tgu_disable(drvdata);
>> +        pm_runtime_put(dev);
>> +    }
>> +
>> +    return size;
>> +}
>> +static DEVICE_ATTR_RW(enable_tgu);
>> +
>> +static struct attribute *tgu_common_attrs[] = {
>> +    &dev_attr_enable_tgu.attr,
>> +    NULL,
>> +};
>> +
>> +static const struct attribute_group tgu_common_grp = {
>> +    .attrs = tgu_common_attrs,
>> +};
>> +
>> +static const struct attribute_group *tgu_attr_groups[] = {
>> +    &tgu_common_grp,
>> +    NULL,
>> +};
>> +
>> +static int tgu_probe(struct amba_device *adev, const struct amba_id 
>> *id)
>> +{
>> +    struct device *dev = &adev->dev;
>> +    struct tgu_drvdata *drvdata;
>> +    int ret;
>> +
>> +    drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
>> +    if (!drvdata)
>> +        return -ENOMEM;
>> +
>> +    drvdata->dev = &adev->dev;
>> +    dev_set_drvdata(dev, drvdata);
>> +
>> +    drvdata->base = devm_ioremap_resource(dev, &adev->res);
>> +    if (IS_ERR(drvdata->base))
>> +        return PTR_ERR(drvdata->base);
>> +
>> +    ret = devm_mutex_init(dev, &drvdata->lock);
>> +    if (ret)
>> +        return ret;
>> +
>> +    drvdata->enabled = false;
>> +
>> +    ret = sysfs_create_groups(&dev->kobj, tgu_attr_groups);
>> +    if (ret) {
>> +        dev_err(dev, "failed to create sysfs groups: %d\n", ret);
>> +        return ret;
>> +    }
>> +
>> +    pm_runtime_put(&adev->dev);
>> +
>> +    return 0;
>> +}
>> +
>> +static void tgu_remove(struct amba_device *adev)
>> +{
>> +    struct device *dev = &adev->dev;
>> +    struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
>> +
>> +    sysfs_remove_groups(&dev->kobj, tgu_attr_groups);
>> +
>> +    /*
>> +     * If the device is still enabled through sysfs, disable the 
>> hardware
>> +     * and drop the PM runtime reference taken in enable_tgu_store() 
>> so the
>> +     * usage counter stays balanced. Use the synchronous put: the 
>> driver core
>> +     * disables runtime PM right after ->remove() returns, and the 
>> barrier in
>> +     * pm_runtime_disable() would cancel a still-queued async 
>> idle/suspend,
>> +     * leaving the runtime-PM state inconsistent.
>> +     */
>> +    scoped_guard(mutex, &drvdata->lock) {
>> +        if (drvdata->enabled) {
>> +            tgu_disable(drvdata);
>> +            pm_runtime_put_sync(dev);
>> +        }
>> +    }
>> +}
>> +
>> +static const struct amba_id tgu_ids[] = {
>> +    {
>> +        .id = 0x000f0e00,
>> +        .mask = 0x000fffff,
>> +    },
>> +    { 0, 0, NULL },
>> +};
>> +
>> +MODULE_DEVICE_TABLE(amba, tgu_ids);
>> +
>> +static struct amba_driver tgu_driver = {
>> +    .drv = {
>> +        .name = "qcom-tgu",
>> +        .suppress_bind_attrs = true,
>> +    },
>> +    .probe = tgu_probe,
>> +    .remove = tgu_remove,
>> +    .id_table = tgu_ids,
>> +};
>> +
>> +module_amba_driver(tgu_driver);
>> +
>> +MODULE_AUTHOR("Songwei Chai <songwei.chai@oss.qualcomm.com>");
>> +MODULE_AUTHOR("Jinlong Mao <jinlong.mao@oss.qualcomm.com>");
>> +MODULE_DESCRIPTION("Qualcomm Trigger Generation Unit driver");
>> +MODULE_LICENSE("GPL");
>> diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
>> new file mode 100644
>> index 000000000000..ebba49402a20
>> --- /dev/null
>> +++ b/drivers/hwtracing/qcom/tgu.h
>> @@ -0,0 +1,51 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#ifndef _QCOM_TGU_H
>> +#define _QCOM_TGU_H
>> +
>> +/* Register addresses */
>> +#define TGU_CONTROL        0x0000
>> +#define TGU_LAR        0xfb0
>> +#define TGU_UNLOCK_OFFSET    0xc5acce55
>> +
>> +static inline void TGU_LOCK(void __iomem *addr)
>> +{
>> +    do {
>> +        /* Wait for things to settle */
>> +        mb();
>> +        writel_relaxed(0x0, addr + TGU_LAR);
>> +    } while (0);
>> +}
>
> This is simply replicating the CS_LOCK/CS_UNLOCK.
> I don't mind those (and relevant definitions) to be moved into 
> include/linux/coresight.h and reused for your driver.
>
> The rest looks fine by me.

Thanks Suzuki.

I will add a separate CoreSight API cleanuppatch to this series to move 
common definitions such as CS_LOCK/CS_UNLOCKfrom coresight-priv.hto 
include/linux/coresight.h, allowing them to be reused by the TGU driver.


>
> Suzuki
>
>
>> +
>> +static inline void TGU_UNLOCK(void __iomem *addr)
>> +{
>> +    do {
>> +        writel_relaxed(TGU_UNLOCK_OFFSET, addr + TGU_LAR);
>> +        /* Make sure everyone has seen this */
>> +        mb();
>> +    } while (0);
>> +}
>> +
>> +/**
>> + * struct tgu_drvdata - Data structure for a TGU (Trigger Generation 
>> Unit)
>> + * @base: Memory-mapped base address of the TGU device
>> + * @dev: Pointer to the associated device structure
>> + * @lock: Mutex serialising enable/disable and the associated PM 
>> runtime
>> + *        reference counting against concurrent sysfs access
>> + * @enabled: Flag indicating whether the TGU device is enabled
>> + *
>> + * This structure defines the data associated with a TGU device,
>> + * including its base address, device pointer, the lock serialising
>> + * enable/disable, and the enable status.
>> + */
>> +struct tgu_drvdata {
>> +    void __iomem *base;
>> +    struct device *dev;
>> +    struct mutex lock;
>> +    bool enabled;
>> +};
>> +
>> +#endif
>
