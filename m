Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794812130;
	b=XnW0/mjDLW855hoATHEEciAg4IGASfD3ueYk8ZLbifoo8j2/tQKR/Hc04CoFEzA0ao/v
	 O8ktGoExf+JfEi7SI4BjyRROKFIQKUijFocMPCbKrN2ry6B3AjXNFDzVSpGV3oFQuNmQF
	 QiGC17h7d3x8+v1hb9et+EEBR35RKxhigmgS1+15nIog5EI/ZLeLsndmV1hKLrYXInTyJ
	 8A8sBf9HVbnSezybAadawHffbNiEY3yFZ6zTR9c0jcQnOZ3anEJLS8dWoPj6AWbX78oNa
	 +We+683f3glkZRK+nnY/QXQXuAEn3JTPiqBApEIVcsZi86vpoybceMyPDIJ5VvWInmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794812130;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2S9k1KDmjXj6+ft2VRTVkulkYwAMCOYGy6MlND8T/mA=;
	b=eDw3ygS7GGS6YnDt2bku0p9CvgrG0HZQtl5EVlqXI4gK4OpYUEsOXYLB8EauwFHvsUID
	 RoSuLB9TatZkjRhQEgbVVorqP5FRjU9lOJXSk7ZF4BcqdmLgFEuntlhR5gJSlG/cYIByV
	 YvGUysCt6ZdRtoOkwQv/lXL0JQeqJmw9aaC4oXf4gfarvMlEYsRjXDxt7h5del8giAFc4
	 +GUbPTJDY0I1G0We+lHfVulnnCFXztkIH3tKq2WZIKB1DFJvNHc4b3K2cvmQjqw4+o0zi
	 ReArnulOuQ4g/ootM/rN/KuB/ny7xYdQW1gmnoZZ5Y46y9v4OaVQUZC1S9sDmmwdCnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U0OaEmZ4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ByS1Voth;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637ED606A332
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 06:55:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 637ED606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U0OaEmZ4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ByS1Voth
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG5LGbo2880058
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 06:55:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2S9k1KDmjXj6+ft2VRTVkulkYwAMCOYGy6MlND8T/mA=; b=U0OaEmZ49T45GN13
	5D8nLtZtILVSQ+OpE+0c8UPXOk1eI9DQEJ1v2QptQhynR9eSUqISXvRbAoWDW+88
	q3VuEi8BRBs/MfhXZeWjP1ldSVc6mt5huyT2HfNsAqjeyXRi2AfQx9otohAHwvqr
	KMQqF7cOW57/5+z7JO+Tx8X6uY66ybivBGiUP0EIwarxRqkMExVrGexnOr8wm8wH
	z8hnEWDN7BivDnR3WvZwPvCghc0SJL4rCgTWpJtIkWgCgnZHbwuF//fawy/sjW44
	pkacIt+68bHrWFHm5NGpvb1MPxhaJ1pMxTCRzx9YQ3YOvQ2JIYGOoMiYGWUuShqX
	avfQOw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhj4582s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 06:55:29 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a065d0e9deso2107878b3a.0
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 22:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794812128; x=1795416928; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2S9k1KDmjXj6+ft2VRTVkulkYwAMCOYGy6MlND8T/mA=;
        b=ByS1VothaasQYvwXVzT8n1CMxSIQIOT482mpgMHVnUqa5OpCsAdI5ytBhLoTIq75Rr
         hAbJQKntARRRKejmnmwTBll9iK3VgBjqpubZeLGc4YN86YsahX1M0FptdksFxEuY4nW/
         q8yA2a8I4ZwQGmH7mCrOy4jtxsOI38de7SPlNa9+GXO5suKJm5a664PRZUXgRAhlaKhA
         MXpW50hJRQ/GH9vJT+9/Y8aKX7FpARiCUz3CYNLWQGekt07GB+ncZT9jiraka/H3VjBK
         lfG0EtfHaQswrx6EUEMD1ZFAJDi2gbWQqeJXOHeGOjCcTqw29Xif5UmgD4ojmC0s9UfX
         Y6tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794812128; x=1795416928;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2S9k1KDmjXj6+ft2VRTVkulkYwAMCOYGy6MlND8T/mA=;
        b=B4zaMZsY9HHGZWbWjCs8AR352loBI6ZuSX1vlT559q+WtV9BY15xkJtSnCx6aFsfjx
         JvxcPqDpiVbQJDwdRHbF51WnUyPe6aq3FBElp0K90pC3Ph0FDlEA9AuQSZ5N6XGIiBuN
         0huvTTHx1KDN9o1HizGA8FfpS5LezPTR7uaziHhE7P8I30kG17tYiDNWgsvNPoagnTne
         eY8MNw2P+VAdIB2MrGaupPTeVZbaVckaJJEibRVdfKc7vLt48bnsOv0ZjXkuAFUy3Zyr
         6kCQo4H63bon40q0/J5rqgkMXHJskutAmssG4cFjFQCsnVWMXYw8YahzMVrepM5sfujv
         du6A==
X-Forwarded-Encrypted: i=1; AL+hErHYfgNMQbWUNKfudgrX56o8bJ+urRCklXUjVdadymyvVaGWgfUdhsR3ztfn/0KiK7BF8pA7cEZorw7F@vger.kernel.org
X-Gm-Message-State: APuU4Z/RK8lbvO7jaKN4y+9X22U9MyPNN/fXXhjRCf6o/+NJGwgPLi92
	o7g/JdlcTzKdrl1th97YWWbwYeGMsoq1Z7Ctz30qi+hbhehV/RWdJaCXLgHhJZrYbATeAq9nnY6
	2q8Qe3V4ojW0fS86zzulSn0qvZZSCDf7ABRRsPrdB3GeKv+xbQ3vqST/jbRaZ4aB+
X-Gm-Gg: AYBFou0JHEP9u52H3YwCKzfxeLEjlK1owNj9VqZrvYN+0efyOfNAwPR03k+cvBUGYdV
	r2KQM1CE+UsmefYV0lGE/18rUEBsEdlEoZuuF5kv9kLWxvW5es70X9eZTxfmQ2Z7aWAYjvmsc8r
	VI6pUf5RbBskqGxG5KPr1+eTOoHSihfP8UGwuv/MX51GNv4DstEJqy614AZFHvuIPP9VZxCVaTn
	W4tNxAV/1BbrQqq+cKeP39+gU6ooeGDkz9TB3Y5Z+6iXlDhmm3rvp6R53yv1l8+XyAfILAuGIjg
	wpjiLdPfjHPnjtvlctHep1BfjfboxHWlQ/ic5R74aY3lT2hnMObt62VVNa4eIelVmopQcrpbvKz
	dbKJF4HmlXRVAzaMu1vTvbcmDvtZJ91kCdMUjfIxk1RjbDlpkvfW7iWZItgKt+GDHGi01fyQ6u/
	TR2o+DORMjoABQRG52uhuVNoWP1iVzAAn0sGZSeI71LR8=
X-Received: by 2002:a05:6a00:1995:b0:884:831e:d0e3 with SMTP id d2e1a72fcca58-8beb63a2ad1mr6236121b3a.17.1794812128188;
        Sun, 15 Nov 2026 22:55:28 -0800 (PST)
X-Received: by 2002:a05:6a00:1995:b0:884:831e:d0e3 with SMTP id d2e1a72fcca58-8beb63a2ad1mr6236100b3a.17.1794812127686;
        Sun, 15 Nov 2026 22:55:27 -0800 (PST)
Received: from [10.133.33.59] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed2829dcdsm3208979b3a.48.2026.11.15.22.55.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 22:55:27 -0800 (PST)
Message-ID: <c3da00ab-913b-48ee-8af1-eaef26548b4e@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 14:54:59 +0800
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
Subject: Re: [PATCH v17 08/10] coresight: Add CORESIGHT_DEVID2 to
 linux/coresight.h
To: Suzuki K Poulose <suzuki.poulose@arm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        konrad.dybcio@oss.qualcomm.com, james.clark@arm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
        songchai@qti.qualcomm.com
References: <20261113024935.3173715-1-songwei.chai@oss.qualcomm.com>
 <20261113024935.3173715-9-songwei.chai@oss.qualcomm.com>
 <9a479160-5bab-42f8-bf50-7b92c40b39c0@arm.com>
Content-Language: en-US
From: "Songwei.Chai" <songwei.chai@oss.qualcomm.com>
In-Reply-To: <9a479160-5bab-42f8-bf50-7b92c40b39c0@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAyNyBTYWx0ZWRfXxBp4BRZlhNcI
 RG1FShz9zac4QLuDpKS4LI9cgSnCM3SbL0+fmRrrWvgYN4uS3OvvoEk/Z6+RUAN68Q9vRchbbX1
 Pp9KWCm6e/8pauBmPP2AV3ku/5MeMK406qACmvPaRGqY4IDhDKAiB+4LbiA5DawpMMg9ZSUOhTh
 bRn3oQG4jAPHka5EzYHUmuBM8mo3O14G7eCARr4KOEmR1ZCQTg+2cNRmVh8lCacLm6xLInVFTCs
 xpIMG5wLrTQazCAcvdmTypksuoPxlLmLmMTy0IdiRi5DVCJifVX9/Ytowj8GJNHLYdSW6Scsh5v
 kisaAHoynTn2RbunXeJOln7focu9Hx+fO4lemeCW+FcMMbxgzlN0dPzAjRLI+UMB4hvgv1nkz/W
 djqaaEsurpXhFyZzmOE700VbzmumL5cvAIcGnplWliq6h9yy56ySKDfM+CVU+QMcfTpZ6Tzrp1I
 SfSq5byfyPHYUIGYk0Q==
X-Authority-Analysis: v=2.4 cv=av0nmiZV c=1 sm=1 tr=0 ts=6afaa8e1 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=RG7znLGuzyzmRdsVfVEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: MXPh9iFJiJeAZnPtCUOxEfWaaZY4-JP9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAyNyBTYWx0ZWRfX2yIHjqIOwgTY
 f0Rh/JeTr2XIABqoxolZq/0kySR0v1/KfCC0jAcAEEWLU9BYElgHx10i9bemk6s1GJPMPmUosx4
 bakVlbhaiWQvh/EaULfnQ2hjWEvNpeU=
X-Proofpoint-ORIG-GUID: MXPh9iFJiJeAZnPtCUOxEfWaaZY4-JP9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160027


On 11/13/2026 6:27 PM, Suzuki K Poulose wrote:
> On 13/11/2026 02:49, Songwei Chai wrote:
>> CORESIGHT_DEVID2 lives at a fixed, architecturally-defined offset
>> (0xfc0) within the generic CoreSight management register block,
>> immediately preceding CORESIGHT_DEVID (0xfc8). Components outside
>> drivers/hwtracing/coresight/ that follow the same register convention
>> (e.g. the Qualcomm TGU, which uses it to detect its timer/counter
>> capabilities) need to read it too.
>>
>> Add it to the public include/linux/coresight.h so it can be shared
>> outside of drivers/hwtracing/coresight/, matching CORESIGHT_LAR and
>> CORESIGHT_DEVID already moved there.
>>
>> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
>> ---
>>   include/linux/coresight.h | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
>> index 5286b3606581..7ce0366c7c70 100644
>> --- a/include/linux/coresight.h
>> +++ b/include/linux/coresight.h
>> @@ -37,6 +37,7 @@
>>   #define CORESIGHT_UNLOCK    0xc5acce55
>>   #define CORESIGHT_LAR        0xfb0
>>   #define CORESIGHT_DEVID        0xfc8
>> +#define CORESIGHT_DEVID2    0xfc0
>>     static inline void CS_LOCK(void __iomem *addr)
>>   {
>
>
> Merge it with Patch 1 please.
Moved Patch04 & Patch08 to Patch02
>
> Suzuki
