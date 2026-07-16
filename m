Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F44F2931C9
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 05:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784179228; cv=none; b=KwdIfooWD7iFS/E0kUZTnT/gu9wgQIbGzDaj/GXP/dKhyFJawux+HMf+ZbJzLKZV4709fK4hDHMY56O6Q59/c5q57HXDORdG5hzlmAC+eTjVReM3RBrXL6Scdw28cRzNDj3oT4DOp6wU5thRgDzB/1Jf+l7Zi4NAqOK9JaeXmz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784179228; c=relaxed/simple;
	bh=LF+dMpkqOYdjTuOhecyx5ov7eIVWQFwsydn6zw8WOFQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pLDgdbrD/YodB/ky/w5zz13FydWIpdIa228ncZVGkcQiIj6ujhej2+LhDFWIil6Fk5MycNgrZpjXqfLlkK0iM27zLczxzigAegLKDTaaSIV6lHQih1xSS4ogWv2+rfVzIkgWeJy9Jt1Ml3MD/mHlZRUDv8sJWKCOHjrThv4Lxic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FE1B6bDX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DQWTOSqz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FE1B6bDX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DQWTOSqz"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G3wSA41689678
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 05:20:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tMZATvcieI+jey0EZMGR+VZBj7ajNOX+MCFIugsOB+k=; b=FE1B6bDXCuo+U2C+
	5PO2tZX74zZx29UHWHvilD3Wy2kPQscA97d77bTF3ZZt38AorzSUArCk3JRcTseK
	pEQsAeRl/Y1kXu+3kBVL2Bpr9QNLBBW8gp+Dr3VGI2HRrpMk0nebQA+nsQnqiSr7
	f9yjBZgqIhzNUMHufaY/mwT4Lj18xYd06w0x/1+XA/WYdPldGGftZJx9MdhXiulJ
	fu1DQTZHqoozAvfaTGF0xxZWNclruyWecK12HAecbzeWN1wHf4yQvdVeTwJlst4d
	cN60soCiI+L9nmGlvR7AuMzcZT40T3eEh2zy8j3mD54qjQ3JHCiTbjNH4/WBFMHT
	XU+2Fg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe7nmm407-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 05:20:26 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc5faecf01so119027755ad.1
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 22:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784179225; x=1784784025; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tMZATvcieI+jey0EZMGR+VZBj7ajNOX+MCFIugsOB+k=;
        b=DQWTOSqzizSkzif/vCMUpa/tbYgV1bHmjU7f6j2l9dbIqOWrYUhmWbquGSgpJxZay5
         yxwF9gv0anSLQbuf5XROau9SVt8V6djzyUZhoPh45RrnNm264tGe8BAT4/Ty1Jw72bAx
         TV/zuBzTv3wCL4ouURSFaUwvwnGc7HeahQoAYHCD3gxHsEaJua4nUnJjLk08f98ThA0J
         LpPAQwujhpYivLTB7xxaWxMYfNoRvWJwQNjE61Bt7i2oKvKUkd32J6y7ZJ8akUkjZXDd
         G6GCzRwF84wUZmOj51jPBE/RJkJK8W6oxUXTc1/uqCY2f0szCRVBi8pfAmpj0V3S4rac
         noog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784179225; x=1784784025;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tMZATvcieI+jey0EZMGR+VZBj7ajNOX+MCFIugsOB+k=;
        b=jjAToJNpVEw0SeuyU2teR70MVSHU3g/0HmHp10Oe87ZnlwaNizL+2nKWrmEl+tKX/5
         rurhCmD1y2Rb+i2wLH5LHzz9ywjSl/OdcpoIXMQxTSwfHXYmtopsinCAVVQgxCeM5McT
         uoMZS/mEqVcHyJgHtLmdyWnpPPFw2dcQjN/PJnc60UUAnBIENQlvjf+Fr0j/YkN0KRDj
         vQ9Y5fXSZnpgaTSrkr6UN0mn7fvR9MxYAHna/KamPC+2M/CCKynYMFvPo5iFpPpv+5i8
         TTKGh0l34es3SyZpHK2hL87OFAwGtEuiatVWS7HQKVKn/ftF2Ucgqil+LVvLu//V/ZN0
         rohg==
X-Forwarded-Encrypted: i=1; AHgh+RoXFYV2L5bePv0bnbSsAh2vEBNy7FL1nHTSSICC/IAAJbVLGJUlDwFh+kKmNEhr7Qw6T5CDJa5DW6Lv@vger.kernel.org
X-Gm-Message-State: AOJu0YwWTv7JkNwV41R963yMcRG0C5tWJqIlN+5gtl+nhd7SnWtBBpWS
	FXUnjp/Huw/KwQG22Fkn0ol84VGTZ0pWhTlg+vSJVI00z4wS/lXp9pLlMSRFfUWgtcgA3XOwyaO
	Nf6nG6YEb0usFym+htzRluzm4pQ3FOxstNwva5iw9+vGVtm8x4p02u2J4KvvTIgmN
X-Gm-Gg: AfdE7ckp+XIO687nKmx3vAnGoIWHzsFljDUL+c+L4SXYG/PLzOs8SbHbxxKqZo7fjqZ
	9Y+l2uLxcS5Ci1XPvBMD9e8iVf+j12g7fxp1OVAuMAd22PdVg5WUdEiN2squX8mu1a4cepbbDzF
	s74e+jnrA6ELEU93HnsPuPXoWxPWH3WD1HU72qnOc3k82DMcxyq6d4f0Xo7NeS5zG0L8Ufjhv6R
	FqWS3JDE+VGzs90fyLSJiYq+4Hf9I0pBIW+b5ieOsfnh6acbB54B5IAXWEEO4P6zAVcN0Ohj/Z3
	o4UAxitVxwGeY1HImkF6wLqk1OwtGbgnM82AHqkeLNVObBM9IRkNPExltF7JEgBV2mb3rAsTePu
	f6Rle8PsHHhqE6FOspoDEmEaVBIg=
X-Received: by 2002:a17:903:9ce:b0:2cc:9e99:55c9 with SMTP id d9443c01a7336-2cee9b590demr113452255ad.26.1784179225228;
        Wed, 15 Jul 2026 22:20:25 -0700 (PDT)
X-Received: by 2002:a17:903:9ce:b0:2cc:9e99:55c9 with SMTP id d9443c01a7336-2cee9b590demr113451855ad.26.1784179224793;
        Wed, 15 Jul 2026 22:20:24 -0700 (PDT)
Received: from [10.217.216.90] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf1072eacbsm13535555ad.80.2026.07.15.22.20.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 22:20:24 -0700 (PDT)
Message-ID: <cf144d43-907f-42b9-a877-3f54d1da088a@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 10:50:15 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 07/10] clk: qcom: videocc: Add video clock controller
 driver for Eliza
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260713-b4-eliza_mm_cc_v6-v7-0-4d91bcef50eb@oss.qualcomm.com>
 <20260713-b4-eliza_mm_cc_v6-v7-7-4d91bcef50eb@oss.qualcomm.com>
 <alYq2J6hd06g9XyC@monoceros>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <alYq2J6hd06g9XyC@monoceros>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA1MiBTYWx0ZWRfX//8Imx2fXa26
 zbe+j+9+NZrf2MQRuDCuWtL2VLvYF2hBRbpjHBa43LrEDev+PFN+8E59UM9wo+pxXs1RdiCBLkc
 Od0ZV8yLrr7jH4YRYhlaRnWT9vc9kEk=
X-Authority-Analysis: v=2.4 cv=cuGrVV4i c=1 sm=1 tr=0 ts=6a586a1a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=GXRrvyA9IJ52Cl4LVy4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: ZMzIGm9UrzZ4l8mKQ6xvKiOcu6vemzVU
X-Proofpoint-GUID: ZMzIGm9UrzZ4l8mKQ6xvKiOcu6vemzVU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA1MiBTYWx0ZWRfX4+SV2wfIN7jy
 0aSgszp8Fa7YdU/xdrEu4LtvPS8omzUtAvIpQ3/HYjdVJY2A5W86ycMw1qef8POVQxmqzOvIrjI
 M9lj+h0HpPES7eO7UJ+BV+xfcvozAKHt15pPg2jkWLV3oyrD1bObU0jKdAEa+2bCEZcxfDIuLDQ
 tLWhvyhO9YiJaUusgEnSm/sDTbSyFBujRju4vEd6tv1cWWMmn3HtBzqOjeFMr+NbJq35PQCYAJW
 w/U/hvtH+h15naRxaF65sJdWdI+CPa/0vT1l3uNc9t4PuHeBfec/TforiliVaqfeWdXJAPbqSMp
 dFzI5XhmlRSQpfKoNngIX80Q8K7pkgud3sgXyMVJzi3y3hs2cj1oZoARtIzTWQqNT5XPl+e9lU8
 gmtokmVKSwzvn6D49UWYDVcv14VfG3nG90ZfJuiZ9gP2C0pbm7/VymdZRCubIG1Xm+zfo98p3+a
 5CC0oMfbPxCIOC4UHtw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160052



On 7/14/2026 5:57 PM, Uwe Kleine-König wrote:
>> +#include <linux/mod_devicetable.h>
>> [...]
>> +#include <linux/platform_device.h>
> Please rely on <linux/platform_device.h> to provide of_device_id and
> drop the include for <linux/mod_devicetable.h>. The latter header is
> going away soon.


Yeah, it was missed cleaning up.

-- 
Thanks,
Taniya Das

