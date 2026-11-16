Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794812127;
	b=5B4tLLhbxfrocWnX3wiFNP81CEaQheG5h6vZzwabhp9jKbs7VeRnjS72mNlroPl39Qa7
	 dITaTZlek9zbCx5TRYVWPL/gbI/+9IxZfMKQVlkknoTy38m5FQfXj1QX/RAt1lRiWDXCq
	 lR9wsBM8CYx7EmTAs4mKETI7l69IOsqadkqgcpY+rrnihDnEzXnTZiF46Fo8JH4GdXho8
	 fyKE1FLxjTiVJPp78ZwgJwCQyRjhK3fcF+YqHu3aCD5tFFEBN0vkxEOprH+5MUTB7ESrV
	 I+NIyBaG/pDnGm79wKzTsC1QmrbLl/6Is8wnLsEB8AGxqjzxxndm/a4aLk0Oadzmw8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794812127;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QX1OI/eMj8l/G0OnkWUDdedZenSzQxZM4euSkyn1L6I=;
	b=ucUGIklEygKA3czhPkDq9pLdGXq+N1zDjBY03h5LEEoa/DtXANJu/naFOGWodj3B2uXU
	 sfSYXj5cOgeRD4QBtUgvvm9wC6WPR8Uw1mggwIi4cZDZx+b4NZuGqSMs4PnoY+Gfu98bL
	 FeVi65xJFUassT6SvadK5DggMK5f6mKE5qaQgObKITHyE9ZfMH/MTiHC1X6upEK1sMiPD
	 A9vI/PqBseabZVR7cxs39kROml3ZSp0PHGFWPhVcjr2mrUZT3NVncySfcX3B8+k4PQIj0
	 6U6xrhyVlGYhgr8o6Mo/ijWrSzNbqTiRKwMIbbD9I7pomttQ72+f3npon3h1ig0IAfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HoFFOMK0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jzmnn8P5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2656A606A323
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 06:55:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2656A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HoFFOMK0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jzmnn8P5
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG5LfSh655894
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 06:55:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QX1OI/eMj8l/G0OnkWUDdedZenSzQxZM4euSkyn1L6I=; b=HoFFOMK0Ew4JZgOd
	mdJSri+fx+p1Z3YRl2DQlvbRhbPFDaAJhWg9xbQ5bg9syHMcMfrvRZsrTiq7EZ9M
	+UQbwvRl2LPQhtOI8ejcLQQcvNiaFUnriGkf8XYEBaHrRV0cg8hOCWZmZ8YJVsL6
	V3OSgs3eIF2KImJ5U9NdGf6w5/d0toJTjom6yy3PjyrwtZ0vIy4EgFYZ4d66/1qt
	gsx8Ed4RWM3BV2M/LdlD3/Nh5uVrYrM98bXw6c9a5n8BoReySnBlIuIcPQ4CK2LZ
	EcCPo1mOvT8KsIOA3peiVD11YKrCW3EWB25qlbwQmwr7OLHxjBfcU8NR5DpVc57l
	cYwujA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhk257wu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 06:55:25 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8b69b8c6dd5so4079109b3a.3
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 22:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794812124; x=1795416924; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QX1OI/eMj8l/G0OnkWUDdedZenSzQxZM4euSkyn1L6I=;
        b=jzmnn8P534aLoqo1B0w1NtY/gYZxU3V/OPsBH6EhjA2foGhPUW8C2yDXENhttAuAhe
         p63mAHfBFptsv7CGedUyAj16Bx0nOGpD/U8BBk7ia5N0BxcS8z9D+mrEev0tpb0ejgp8
         LspKMS6olP/U5JjK1bjqeaRAF0YOKxBik+Batrsw4U9ACnlHWPfdXhmPjM3hoWeXl7qP
         U97AKC6WOeyNCxdd2Bj4oLApIs28kQdDPKCJHLa5/ocLBPmaiYj69Ebo+edFeW6jkYLs
         suzTIbxY8FxhxM5r4M/GZB524Wx1UwN7dgbTl64zZYCVNVVBrpwN1iDiiQ52s+T7k7fO
         zWbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794812124; x=1795416924;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QX1OI/eMj8l/G0OnkWUDdedZenSzQxZM4euSkyn1L6I=;
        b=gz2mZRCdbRmx3TaaVfVvfOdYyg1fJyRxN3pQT6XktCazJUl16fcNy62FQ3xMuwG4R7
         LYD4W0mscXqlc6QwWAWFph9ZgI7nbz9OOsSQaLPEO7Ne+Fd7rX+At8/GfcOm3h8xfvDK
         oBHGZuBicWLC8Cq1NPXax8WQYPcWYMJYQMbnDVER2TvDynvmt+S5TrRRP3D3oCs3b9+o
         iz3uoy2tECRslQpG5PbiDGr0dYAJZOYNc1872Ed1YzdVSKP/9Lzi4kyH0wzy2jaC7V/m
         WuwbPVFHTfntsJ1T/kObi5qRwFDqDAva7jwQaHxCTAedUpzKUMOygf3QAPfXqxL5gWZi
         HiCg==
X-Forwarded-Encrypted: i=1; AL+hErEGsv3yUvF/kpqoO8G7KMsUxebEPRCILRj3KkKOyWBCuSJmIPpQ1JMWvNY0PXRDJuCilmcmv+l2yExM@vger.kernel.org
X-Gm-Message-State: APuU4Z974cqjOD1QPdqUNIlSM7+c0BRzCKIM3YzRDiGeE4fHg9BABFbr
	w27y8xWi7ynqNFDiiQw9qDruBNwnWTh1QOPhmL/40V7Ww2o50zWMPMTwSOcRdu8i5R8ZI2dJx/9
	nPXRZbWLQjAUCzvt9OSpevJxcJXGbBCPxdMX00MQUtNYx+G9LbqowaQyVkLfr+HU6
X-Gm-Gg: AYBFou3MVL8GGXjBbQYVQrJPqvgdSdu7oOkpkDdMcFD+Yu5XXuCC4imUFYUDNi7JYwy
	Kjf/pE0B4pdCEOk/nedcX3unQlOGz1k1ZpkyktvC6uvoFX+HQHjh5uqicJy9iuQNbf3sFaw2MjP
	RzwrbhXLw61i6hGAVSgcJPxMsdbZMS0NOQOgu85kMqP6M2ZnzKjyhhbEVkdjn80kqSA7NZVtSVe
	2hejmyzEhB2tEIoHoNsmyYKgJYoOoeSawrWjPhjcnHy1vZ58VZx31Q+naT7A2+5HNgfaVnfiL/c
	dfY1aP/jCd4U6EbrCXhrm6w2ASWMdrguDovdQVramyyF4OqSnDQ2VGQQoTAnbr5aBT3+/q1o6q5
	gqiXaFbygzU5Nb3mVyCifvuh+zvDYzqzRXok/mh3Hcce+ZcJMYzc11ymTDRd+KYTo38MqoV0GcQ
	xArWxPe+jx7MXpuaMHtrhCgX9eelmK9KISxbgcqU8/XiY=
X-Received: by 2002:a05:6a00:1893:b0:89e:37b0:d1b2 with SMTP id d2e1a72fcca58-8beb7c1fa6bmr9471537b3a.37.1794812123822;
        Sun, 15 Nov 2026 22:55:23 -0800 (PST)
X-Received: by 2002:a05:6a00:1893:b0:89e:37b0:d1b2 with SMTP id d2e1a72fcca58-8beb7c1fa6bmr9471509b3a.37.1794812123291;
        Sun, 15 Nov 2026 22:55:23 -0800 (PST)
Received: from [10.133.33.59] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed2829dcdsm3208979b3a.48.2026.11.15.22.55.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 22:55:22 -0800 (PST)
Message-ID: <46e134f6-37b9-448a-adcc-630e7427c5f6@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 14:53:34 +0800
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
Subject: Re: [PATCH v17 03/10] qcom-tgu: Add TGU driver
To: Suzuki K Poulose <suzuki.poulose@arm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        konrad.dybcio@oss.qualcomm.com, james.clark@arm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
        songchai@qti.qualcomm.com, Jie Gan <jie.gan@oss.qualcomm.com>
References: <20261113024935.3173715-1-songwei.chai@oss.qualcomm.com>
 <20261113024935.3173715-4-songwei.chai@oss.qualcomm.com>
 <a627e328-93b8-4550-a521-1fa78e326aeb@arm.com>
Content-Language: en-US
From: "Songwei.Chai" <songwei.chai@oss.qualcomm.com>
In-Reply-To: <a627e328-93b8-4550-a521-1fa78e326aeb@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 4iqg42MBc1xxl_XYRrTEtCDUhElOszxX
X-Authority-Analysis: v=2.4 cv=QanzLcbv c=1 sm=1 tr=0 ts=6afaa8dd cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=eTVmFti6TlQfcjQhFZ8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAyNyBTYWx0ZWRfXzhN2b9gXMxzD
 wL0vmq7k6BHJ/aSdmwPAi2jnyJPKC5ER2+JBrfexX963/Q0bkPvH+GsbuyHenG2PnV62AxYMM4U
 Y72VUAOSwKaFGxoxEbR9bUn9umCpFHUHC//6pmDINczKr4mah9UTRivMOCiRCym7Y1Q6b/TsKc6
 EM8dWfLoOzp1I/A7I7THYMZ2OxVxY5gv9LI755jvBeXAJ4ZTWfT4b8UT4/yMxZfLyvBLeIBmUWH
 kCJFh941lXBN5qvK9kCGFkoryctnJr4BEZBQLyIxfyG2VSD5rX2lFlPmMBLf2NYNrFOLmZQWH3G
 YXOoFENnOiAbYu56Pv7CzIaTiAecqjeuz2ckiL9YsX5TW0pT4oJHFPJD6swj0c5X0rxknbBU6bC
 AGaftaRrRPF7lzFXfT4WdD2W5G/kpt58dgSk7ZHXihKu4OWylDUZahWGuS6MfO7SOyw1UxXXRvp
 plmDkBoJNmlqYJYeXgA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAyNyBTYWx0ZWRfX7m+l7bwDx49k
 YU69485jd/zOj1h6YR/fxRkFLjY9FT5oOCtVXyAZaylOwySm2lg1hBqVNlMaMS8HLcScETO0Qna
 HvZIZIJB9lyC6tZx17aQGT3J6Xvmqy4=
X-Proofpoint-GUID: 4iqg42MBc1xxl_XYRrTEtCDUhElOszxX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160027


On 11/13/2026 6:34 PM, Suzuki K Poulose wrote:
> On 13/11/2026 02:49, Songwei Chai wrote:
>> Add driver to support device TGU (Trigger Generation Unit).
>> TGU is a Data Engine which can be utilized to sense a plurality of
>> signals and create a trigger into the CTI or generate interrupts to
>> processors. Add probe/enable/disable functions for tgu.
>>
>> Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
>> ---
>>   .../ABI/testing/sysfs-bus-amba-devices-tgu    |   9 +
>>   MAINTAINERS                                   |  11 +
>>   drivers/Makefile                              |   1 +
>>   drivers/hwtracing/Kconfig                     |   2 +
>>   drivers/hwtracing/qcom/Kconfig                |  20 ++
>>   drivers/hwtracing/qcom/Makefile               |   3 +
>>   drivers/hwtracing/qcom/tgu.c                  | 193 ++++++++++++++++++
>>   drivers/hwtracing/qcom/tgu.h                  |  31 +++
>>   8 files changed, 270 insertions(+)
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
>> index 000000000000..66b12ffc2892
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>> @@ -0,0 +1,9 @@
>> +What:        /sys/bus/amba/devices/<tgu-name>/enable_tgu
>> +Date:        November 2026
>> +KernelVersion:    7.5
>> +Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai 
>> <songwei.chai@oss.qualcomm.com>
>> +Description:
>> +        (RW) Set/Get the enable/disable status of TGU
>> +        Accepts only one of the 2 values -  0 or 1.
>> +        0 : disable TGU.
>> +        1 : enable TGU.
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index fe23913b1e43..faf8706b6584 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -23264,6 +23264,17 @@ S:    Maintained
>>   F:    Documentation/tee/qtee.rst
>>   F:    drivers/tee/qcomtee/
>>   +QUALCOMM HARDWARETRACING DRIVER
>
> nit: HARDWARE TRACING DRIVER
confirmed.
>
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
>> index 0841ea851847..f37edcf34e0d 100644
>> --- a/drivers/Makefile
>> +++ b/drivers/Makefile
>> @@ -176,6 +176,7 @@ obj-$(CONFIG_RAS)        += ras/
>>   obj-$(CONFIG_USB4)        += thunderbolt/
>>   obj-$(CONFIG_CORESIGHT)        += hwtracing/coresight/
>>   obj-y                += hwtracing/intel_th/
>> +obj-$(CONFIG_QCOM_TGU)        += hwtracing/qcom/
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
>> index 000000000000..ac1ae8bb0ec4
>> --- /dev/null
>> +++ b/drivers/hwtracing/qcom/tgu.c
>> @@ -0,0 +1,193 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#include <linux/amba/bus.h>
>> +#include <linux/coresight.h>
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
>
> ...
>
>> +static ssize_t enable_tgu_show(struct device *dev,
>> +                   struct device_attribute *attr, char *buf)
>> +{
>
> ...
>
>> +}
>> +
>> +/* enable_tgu_store - Enable or disable the Trigger Generation Unit 
>> (TGU). */
>> +static ssize_t enable_tgu_store(struct device *dev,
>> +                struct device_attribute *attr,
>> +                const char *buf,
>> +                size_t size)
>> +{
>
> ...
>
>> +}
>> +static DEVICE_ATTR_RW(enable_tgu);
>
> minor nit: Do we need "enable_tgu" in the name under /sys/.../tgu0/ ?
> Couldn' this be "enable" ? Also, the function names could be named
> as "tgu_enable_store/show"
confirmed.
>
> Suzuki
