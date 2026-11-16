Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794812119;
	b=MvpIhRBmhOtS3ObBt9MvYuoqQESS7kjs6YyNHQe8YUrli3vEOUkf3IWOvpP2+xzXlT8S
	 Pr7BoymtkLA/z/opaFl/kIqvoqabNXf7Auoq+chsunk7Bd/094udTIxHfG/XJJJHRlk/q
	 H6kQ6w4uYvSGwREC3KTiMQxPJ8NhCEHz3nQ6/ZxdgGodgml1Rv9LLT97pRLXsg8uSo+hu
	 V0IXPk9MRfjU0pZom77HmbI70byclHvBzAysGUFXwkpc7zPYwyefC++r+H3J2pfJrXhL5
	 b72ncaXErLu5cAdlgT3R2GWL5xmmgYEoWhwfZquejZElQdeZLOBdNU4yeaSbJ5Iq8+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794812119;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=M04KcOfwG9b8qc/Tzo6l+/Fn22+OnPocu0yxZRNzOqw=;
	b=OHGhLC4PlTcfaNCRn5JsXbRr/GHUhvmIvsQhnw6F7dKu3oebOku18aVoSEzB39bpRMMZ
	 sijdIdA7UfQ5CHbSCYt5OwaeV03kOB3mhSau3+HZSFHUjk9pV3Jru1IZKuXUNbkhX9RX6
	 8hV78UXcU/jnQoGFnOF4QyU1K2z/JStM+asNA6UOJ9kB+WuT1P0MGb5yHkIzvAnuUDgd3
	 FqEj1P8wNJOOQ5kYKyeu4jh2c+DYVjQoZCqs64LTyGPhif53J3cXIqIbAa9ReuQdgpgTG
	 wXG76HU3PJeEch0DKYAJXNpqzmr+Yut401bUopAg9vr9WhhMqn2kHH2uCbgHrAvbzrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CiC5mAwZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LUgxieCU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74BB606A32A
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 06:55:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D74BB606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CiC5mAwZ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LUgxieCU
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG5Lmnt322983
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 06:55:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M04KcOfwG9b8qc/Tzo6l+/Fn22+OnPocu0yxZRNzOqw=; b=CiC5mAwZQuhjA/3S
	vrccdDUJBeR/HCw0avDpc+baNEZLEHdQwnxrvTbCZwJNprg2nHmcy7AmmLoKRCk2
	VST4d83JLMhkAgKwusf+MBUj5UgOIt+PeNKoG3qvaaDXttwrTH6YiIK8eMLBLdMr
	yeiD1Z0HPTKTdPcuXQTJjO06e27AHKX/ucdjpFzB0HKm/isnMJLesQ3pkZJmP1zs
	Bf55cEGE/FxR6WyXaGT5zkdrHGwRUfWl0POTLEKNIDS3fFlUbOs69nfcEfmUYMqO
	UoNDDVR7KcFS+HTZQ/1g6TDwouAeOtJSlygJWoolxl+FSMPoOjSEOmnEZK+4gRjF
	VTIs0w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhnx5agr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 06:55:17 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a06750c74fso2921301b3a.0
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 22:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794812116; x=1795416916; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M04KcOfwG9b8qc/Tzo6l+/Fn22+OnPocu0yxZRNzOqw=;
        b=LUgxieCUYdbtlQvH6wQftEsHlREDdzIVDEGwEZvM4EA8ttAOfsV+6e0tlhwWjQw10z
         dFwbJNHmon3Jo9P2qNZ3LXubMsN18OwW2mwlV1384Cf0Vj0A9rYH4vf8aVSqOJDHu19d
         eBViFWDt/hnTAEyaTpoED6ooRv0Ex80XTm4+v2cfEGmIL/DyQiI/CeGI3TC4JIGgi9dI
         d4y0ySv1HwCIotASnbVYkeLSxyTm3oHwKoXhHRhTfFUe7JwT+JMH08VL03pCpf6Yh4At
         k5jYnXsh43LlMLRFyfTayH7bA947AsTjwt4vIRs8u/llO7OcYnuEeZyxW7Aj4e5mpW80
         VvUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794812116; x=1795416916;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M04KcOfwG9b8qc/Tzo6l+/Fn22+OnPocu0yxZRNzOqw=;
        b=mygkNpQtl4j4Sd8a6pG+Dm5/xFkdtpKFZ1wjdAWCJZwpEWVk5V40q2irkZTgS+0Bh3
         a5BcT43G+62tC6Ne+u2XpX+VhxWYeL7Uv3JoLLLsV89dW9Fbnqn4mD0/jyngLVzcMpgn
         Z2YzrR2fII5TTGKp+rk6atWeCnQHFvpfZzliVWn80YXjsR2IxHH/BYRtD1YZNRr+T4en
         0U9MQLgL+ZWkprAf6wPVJw9cipXdGe1/ZPZN/FwVEZ3BlPYTD8xne2Wyz7ISOAMBxl+H
         h+waZ9Su7IpHnc5WwCOoAWw3Pc43RogkCY/V6zkDFkN9TkBXVL7nAcf6dSC3t5QSiuuj
         FGGQ==
X-Forwarded-Encrypted: i=1; AL+hErEBtdxK5WZILyMH+07bjavq0IypISD3uIDVEEDyI/kO+Kfsb2bZQ4iU5nGgP26GIK8KRv8R47JgHj7W@vger.kernel.org
X-Gm-Message-State: APuU4Z/Yxvh2XpU2UkEB/VVTiygrs/PGUIdGNA1oSCvi3SQY6xJd6zYc
	tboJrBdEEw3kdnXZSxGmwNuxSKSHJ5DoWa4tiYiGnvr8NE96UcqiqGGgs3JSlkv2A5R/2sETTth
	dAezPUMsgg9VtfATljRk46CYD5Sq3Oqd+gB/COyJFwfiaqqy5jVMRspUxaTTMueGa
X-Gm-Gg: AYBFou3TeEL49Rwew+THQhbO0xbbYjhaUl+aD7zR/3DMYSMuqsdUtky5ZHT3jCPzdr2
	9QBiAjB0V6t+vbXrAvSMZ8MzIV2lxtBcXADjtyd2b4sR1eHaLE9HYvQzyI6iF+YKpQlb0kJ0L5v
	Adr6wX2QZr3/KNbNUymnWkJHNJYiUsIEWLJWfg9O+rUbQ9ZaHnahVGuU0/2hV2zIAZgjzUwWYVf
	dixWvebljGf8EpkmYe56IAwYJDQyR+1g5iJM6byRd4K3BN2aYKjaa/quWvjrkQOGJByF3WOa1hQ
	S73/que887SmFY6Nlj9v5wS83GF/rQMnu06XOlc6bcFp51+LiiKvc6/iU6jkZiwO70zTSnnJB2W
	qJB27XQGkdFq13kQFeKvjplhgBeTddiITVlDmHB6w1dScsyJ3en/RuCRJjibgHct0bXebDasDe7
	HHApVwiLBXv0DbYgscZU/FVv7bIuHobONTF+G7db33vpE=
X-Received: by 2002:a05:6a20:c998:b0:3fa:1ebd:2216 with SMTP id adf61e73a8af0-3fa1ebd2b12mr3667889637.19.1794812116526;
        Sun, 15 Nov 2026 22:55:16 -0800 (PST)
X-Received: by 2002:a05:6a20:c998:b0:3fa:1ebd:2216 with SMTP id adf61e73a8af0-3fa1ebd2b12mr3667873637.19.1794812116086;
        Sun, 15 Nov 2026 22:55:16 -0800 (PST)
Received: from [10.133.33.59] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed2829dcdsm3208979b3a.48.2026.11.15.22.55.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 22:55:15 -0800 (PST)
Message-ID: <01333b29-8739-4791-9339-45a66811fc51@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 14:52:56 +0800
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
Subject: Re: [PATCH v17 02/10] coresight: Move CS_LOCK/CS_UNLOCK to
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
 <20261113024935.3173715-3-songwei.chai@oss.qualcomm.com>
 <2246263b-a872-4a65-803d-ef1e031522f9@arm.com>
Content-Language: en-US
From: "Songwei.Chai" <songwei.chai@oss.qualcomm.com>
In-Reply-To: <2246263b-a872-4a65-803d-ef1e031522f9@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAyNyBTYWx0ZWRfX0kSDybwNssQz
 F/zbhcgleZMYHB6sJ3ziR4TlCC0yFcl9wgL+QCtM84qbskBs/oPnYB9/2DhsR9L/rIR5sYwhl+T
 pc1iWsO279NMz7gtNmlHtd9jTktZfX8JdACDtr0zEURZJFrK1Dp2cspzNVip0aI0fmTwg015tQc
 WjA90mHGCigIkMlBL23yru5ko/t0lGdBQrFfKHP9+1eShTLvYVWtjvDX8PtKdwecGv3YViGSsTz
 PF05pthF+IKbYLMdmD7nyZNivcu4mScWRSQdUOm1yoFFvD0oNq6EA5qAORe9kXSN+SAxBpXMRUp
 UAsGwhMpzfrVQJu2xoc/K3yo8zkt8LUklDpWAwYdxn3nxi8a2btSEOF1JJ7/T5mTOx6qNTBJA+9
 Gk7NL+59xZo8ohmCa3d73zscyWYcSVO62CS2JS/Qa1VhZoD1Z8xAbs5/vZEBGawnwQKCYuZ6o/L
 P05WfQsv8tHJiDYaAqg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAyNyBTYWx0ZWRfX7dq8X3u7MKZR
 uaYz4PZGDzrVh0lNM1yRNYrNJOd3wCLfrEwOESWbE/aLEW1Icg5FUdh30EV3U+JXf2vkbmFy5wq
 6wcfeOBgtRBi3UxmPpW/qak51vWOb6g=
X-Proofpoint-ORIG-GUID: CkXel9s6lnz6DqI0unpWaOgDEQ-UiiHa
X-Proofpoint-GUID: CkXel9s6lnz6DqI0unpWaOgDEQ-UiiHa
X-Authority-Analysis: v=2.4 cv=Jr5kP84C c=1 sm=1 tr=0 ts=6afaa8d5 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=HS0qQXPI_2Gq0Hqk6xEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160027


On 11/13/2026 6:25 PM, Suzuki K Poulose wrote:
> On 13/11/2026 02:49, Songwei Chai wrote:
>> CORESIGHT_LAR and the CS_LOCK()/CS_UNLOCK() helpers implement the
>> generic ARM CoreSight Software Lock Access Register sequence, which
>> is also present on non-CoreSight-labelled components that follow the
>> same architecture (e.g. the Qualcomm TGU). Keeping them private to
>> coresight-priv.h forces such drivers to duplicate the exact same
>> definitions instead of reusing them.
>>
>> Move CORESIGHT_LAR, CS_LOCK() and CS_UNLOCK() into the public
>> include/linux/coresight.h so they can be shared outside of
>> drivers/hwtracing/coresight/ as well.
>>
>> Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-priv.h | 19 -------------------
>>   include/linux/coresight.h                    | 19 +++++++++++++++++++
>>   2 files changed, 19 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-priv.h 
>> b/drivers/hwtracing/coresight/coresight-priv.h
>> index dddac946659f..0d3f6229b282 100644
>> --- a/drivers/hwtracing/coresight/coresight-priv.h
>> +++ b/drivers/hwtracing/coresight/coresight-priv.h
>> @@ -23,7 +23,6 @@ extern const struct device_type coresight_dev_type[];
>>   #define CORESIGHT_ITCTRL    0xf00
>>   #define CORESIGHT_CLAIMSET    0xfa0
>>   #define CORESIGHT_CLAIMCLR    0xfa4
>> -#define CORESIGHT_LAR        0xfb0
>>   #define CORESIGHT_LSR        0xfb4
>>   #define CORESIGHT_DEVARCH    0xfbc
>>   #define CORESIGHT_AUTHSTATUS    0xfb8
>
> Move all of these register defs above to linux/coresight.h. We can keep
> them in a central place, in linux/coresight.h and drop patch 3
Confirmed.
>
> Suzuki
