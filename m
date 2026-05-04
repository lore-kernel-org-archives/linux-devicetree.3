Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F9B311975
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 07:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777881395; cv=none; b=WL0DC5JGCdAboPykql8Od6QnNlJf+msj/LPfx7PJuR8iYWTfXEzCjePKpx9fVLLnha68MKaSpnblFxhpjfqcyxs3eiI1oZzabisecq4mq086nhr6v9ez6+2Yar+6iyl2KY1sSLRDpwvkj+neFYlzMHQ2CdyI15y7FdGFUH7556w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777881395; c=relaxed/simple;
	bh=jd0s/jvIDISRsyDV2jaZSUJqYEywMClZG15n5rakyxM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I07Uwr8Sx7oSGMRzfrGispoqFOkdObbgcLDWrBRQc2kts+ruvlSdny2t477EvFh63j3m2QtiNlMwiFeiCiIMD2YpHIGvYzTHUuY/L4LtxH3Srx07o6yC8hNS16EMN0UtzJrlloX4pyezS5Dh0mAVabFHlgUy8hTt+w9MPd/wtSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SyICL8ZE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NQPEK5dB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SyICL8ZE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NQPEK5dB"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6446DMEL875811
	for <devicetree@vger.kernel.org>; Mon, 4 May 2026 07:56:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pRZ96Ld+Gp1PrytRI2L1DzZwGRx5l3Gs/96clMZAJbo=; b=SyICL8ZE7una0WN+
	dkF9Drg2Oge/LQ4kEaXOq8ESOQb/Emd5n2OSQ2GYP7SDaL0T3kk+XntYM0Getu97
	x9AZfIIEBoKKUXyT+VoZXJmnQZYBPa4tEzM+wwgBM3cNiLF1VgcW8pw2FKh292NK
	fKzhYpInC/jV/CFMv0sxDRzS9J/ZJaymfJ42f26++bqv3QfM+Tqi/JOOt3Iz6ye4
	ewpZFSYrV5LN8cXvEBXT2EsX28zD/c3dY7oNxvwOAncsPMHWLhTRqczRBTUhXP7N
	AsXCPqxEYywoI7GpYFq1v0WMNcBTopsWAq2e6zvxAXxdfXidP9bYuf9d4khZCWZ1
	avscLQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dwa1emr9v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 04 May 2026 07:56:33 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c6e24ee93a6so2529553a12.0
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 00:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777881393; x=1778486193; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pRZ96Ld+Gp1PrytRI2L1DzZwGRx5l3Gs/96clMZAJbo=;
        b=NQPEK5dBvUw39JzvYqsn5Hc2jslkh0S+IAFGzsKp1k+WVoD5OcWv0fVmFX5PKK2pGG
         T8mzN3RIzaGt07Sr2ywf4z6prTczsA1KoNMbOGQvZxZEJskXVmuzBg+5+tQMyci3CGm5
         /opi9oK/1K+mDpKTNQ55Ms5NJV8tkKPGQNKSg/N9+XlJ9uVbDKrO+vmnUI/tE9IlTd5f
         x3qyvoWLJgQo0gK1rKifC01dcFQy0wX2N7oZyYH9eeWDfGKFo0mEQYs0N5ztI1x94ggy
         t4EulG8it3fOu1/+yMSgmhTO6mP+Tch5BOZurwTRm4XHN1zzpYgWkD6Rtvis4zDkJE8k
         cbVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777881393; x=1778486193;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pRZ96Ld+Gp1PrytRI2L1DzZwGRx5l3Gs/96clMZAJbo=;
        b=nLuLzwWfdutH0qgRodijCN4Z+nJ568rlvD3nQmp7zKAd61E0QPbKsU0sGvjb184/xd
         rp78NPlDm6rJVMmzg6HBBXaolcprSEidkmBmNLOi9w33DE4c64sqeHa4o+E3U/eE44Mr
         qsaUcZYLUfFsqsFtBAzr2MQ0eBk6Eg7WMWTEhpMzEO0ADqFwjc6xljl0aak3P4F4haWO
         Q4nOZCx1/N2+oAQg4L4BVTQmm1NRm0Tvrqcb+r2w/1aWkdlWrCs/E6Sv45/vXA/Qm42N
         j7XqxLAplcLZK3WRvNlq4fmhBJtci+eJR+E54oDDmd7J74fZJoFq1CKKQE3Eqsmugb4I
         5mrg==
X-Forwarded-Encrypted: i=1; AFNElJ9KVV84uhXSOAJvmzhXHp7UuVj0lHFCjeTFVrc0i7F0VmWiQA2iQty+4HHqU8NvmUEG3iHUb9lDdB/+@vger.kernel.org
X-Gm-Message-State: AOJu0YyZMXy+jBmDVQjpKILtLrRVHbbIa9x4y4Qqu744aK2uYO3mCRvD
	lVTL7dxYNQ8gsWMspJ/u4g/2B0NtJIpmFTvmaysyd50ahUAq3OLqdKs55oxYW1N4aJZnXE3SQB9
	LAFVsYDJNAiSivCSjKKJ604bgT4i5atoCqLyf1x+pzrIdywrYYOqHDVAhiduc5Zpn
X-Gm-Gg: AeBDievwO50zrjtz+FgTWta6NMKRaQoEbyLQ2xJ96sj8Y/GjTjL+DYpo0WGQnFwSA2G
	hlugyCK/IKIJ0tyl6tEgoLSHWa6X0WOTzGELsYpDrksys93Oa4jZapgmC2tpiPLfu7Szdx8Eeoc
	oA4+v1U2ugAC7S19cjOCgGZxXUIx5suGwkZiDGiCIHK1hfPVh6bCs+fIckBRhO+l2ON4s4zQpEF
	6jfH0pwloqYWQl73AtaX0mk0zTFn+E8foVBNbrUoc79j3mI6MOfIGq0cdbDm8xeZKvOJUTsiMeW
	7SBBg/YWWSnLsIGHDaNrKZGxwhK7mqFKV7pshiBcHWcX99ORLdahsk2bAy2TEbJDYO365iDIpqC
	TaNmqx258RGfiqT3KByirYEpsFsQm51mSqeYk0QyskfZoB1cMYutDo3GsvrE=
X-Received: by 2002:a05:6a20:5493:b0:3a2:d838:bfcd with SMTP id adf61e73a8af0-3a3d17c42damr14494827637.0.1777881392174;
        Mon, 04 May 2026 00:56:32 -0700 (PDT)
X-Received: by 2002:a05:6a20:5493:b0:3a2:d838:bfcd with SMTP id adf61e73a8af0-3a3d17c42damr14494801637.0.1777881391699;
        Mon, 04 May 2026 00:56:31 -0700 (PDT)
Received: from [192.168.1.143] ([59.96.95.34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c801fd404basm4379097a12.24.2026.05.04.00.56.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 00:56:31 -0700 (PDT)
Message-ID: <7bb59b79-511c-4a40-acb1-05e08cea10a8@oss.qualcomm.com>
Date: Mon, 4 May 2026 13:26:25 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] pinctrl: qcom: Add Shikra pinctrl driver
To: Linus Walleij <linusw@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
References: <20260429-shikra-pinctrl-v1-0-1b4bb2b3a8d6@oss.qualcomm.com>
 <20260429-shikra-pinctrl-v1-2-1b4bb2b3a8d6@oss.qualcomm.com>
 <CAD++jLnDc_Myjt4TKUHZAqYqVwO37TaRO6t23ABew0M5VnzJWg@mail.gmail.com>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <CAD++jLnDc_Myjt4TKUHZAqYqVwO37TaRO6t23ABew0M5VnzJWg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: nHAbeRw5j1rkvpIBSTHs-iy1-QvwoDL4
X-Proofpoint-GUID: nHAbeRw5j1rkvpIBSTHs-iy1-QvwoDL4
X-Authority-Analysis: v=2.4 cv=e7U2j6p/ c=1 sm=1 tr=0 ts=69f85131 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=d18XUvOkrfNYrh/LwM53Ig==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=7-43aZWuTfuDHQZ0LJsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDA4NSBTYWx0ZWRfXxDqWnb7wAqMD
 cCT+nw1/dDE1bVoOdzNAY9C0+tmftqXnHe6UsJMjrfdeLFPuZxQlaoJlxNcSoxS+f+mq4a9IQnL
 spDDYKVUaVTX3WTeW77omFn50NKSXA/Pcy1FIgjoeaCMfky0FxsaZyYUcmv94S3ETFUVqjSwnxp
 DIvnETZrGEKy+Wx7BQjjtbsW9Xs2DygZ4GA0KZpEGKIN8I4720CKNiSPq4YHK0JIVgS2noA+hgT
 BQ4QuU7+GEpP/NapS5/mFs5rE+H0xS/5LTA9a5qYd/JWKdDdAP+j/unwM5yqgvAiTBM6TgrVjNI
 K/QcVASCXtCizdnXBzD+u0WwCp44wIT8vATymG4J88sFTSK1kzVfnIT937kI2SduDhFTeM1ELP0
 YqqdQ2CFafb6/wpQRtU8QyKSx3ItcHoj3EFp0gPmbbqsGan/YA1Jf7oH1Gb9AnBCOvbOEgvCVQQ
 vrR4gA7alRvW01Iq2Ow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040085

On 4/30/2026 5:21 PM, Linus Walleij wrote:
> On Wed, Apr 29, 2026 at 3:12 PM Komal Bajaj
> <komal.bajaj@oss.qualcomm.com> wrote:
>
>> Add pinctrl driver for TLMM block found in Shikra SoC.
>>
>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> (...)
>> +config PINCTRL_SHIKRA
>> +       tristate "Qualcomm Technologies Inc Shikra pin controller driver"
> Those descriptions are changed in my devel branch, should be something
> like "Qualcomm Shikra pin controller driver".

Will make the changes as suggested in the next revision.

Thanks
Komal

>
> Yours,
> Linus Walleij

