Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5174DC550
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 12:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792413207; cv=none; b=FQ7EGOTuuXYy+SR2GQQUu5E3kVEkNtwq0MSY2reBSIkW4kVILDb3JsF/rvbMzI+WS51mIl5SrfAho4XWhiRDZ4ZYVf0OB6wmMI7kUzOR+uUcNnJ8OxbNWPw6AN0HcNduRZ96gSuAl78So3n8rTGsHYxfqEWtAErb9E+Z50M99hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792413207; c=relaxed/simple;
	bh=WuSIXePJZfAwr2w90b8o7Rc5jYA58jcVuPMl6rfMIio=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QFAlMdS1o78sGCOXx/lsk91k4Q66RgvUmWDUHRs7OtQ/CO+J+7bq2eVnO547re3zigAcZdDv5uS8sha1ASnMeDw13oIRPHqSIFuN3Bz5008tXEPHi3G3KJtjPBaPete4z8D1tSoqe6llztit/a0RjYNtCk6ommIKw/bczD24N50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fEgLOVbS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FUlq0naM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fEgLOVbS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FUlq0naM"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8Os1X1348209
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 12:33:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OHkb8hS3ILJ7jtb6Ae0OQ+p6ZaeWT/Gl2MVFAVf41S8=; b=fEgLOVbSldv3UDuH
	8S+FVzaK1IhDVEyUGw3ha1hHCKJ+qcUDJtfC3e7myWcNbHsUvSAuD66LcTd15nEM
	tNHbBP9v+SFT/FAt7HwssxOzTAu5h3H1fRaJYgpHiJr4w1PSGQn/SwHQMcyNVQUU
	+ioXFKsWTkC4b+f65kLFTF+K1PXxXsKwa1xE0eKyCFEuwErVBGGuGAS8jAg84S2n
	ZGkDSe+pkNfIEprazh/gknADz1mRwG/seX2H75hslfSKlWl5dfy9PCDnSrFGOkaD
	AKkaQkXSaaEqgLbt3xBM0Ls0gmsmp8hcgoN9F3tWRA7rQOqkBh+RI2k1C7n6N637
	tdEvsw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf4rh26q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 12:33:15 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5356c6d98cbso7846401cf.0
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 05:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792413195; x=1793017995; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OHkb8hS3ILJ7jtb6Ae0OQ+p6ZaeWT/Gl2MVFAVf41S8=;
        b=FUlq0naM3Cy0JLl6tVZ2/VHvAdCr32reiY7775ncOPUUDAhnbb8nLwhbRYcvfsjclh
         HAjhBYM3sJac8mEiODvKJYvlaqjPHMpQloxMIZWuaomQdqiLq3wqnVwCqo05pU1elL3w
         mBnncx3VcNFyz2ySYO4SeFzL6z9e2MvRRS2ofRNMjhskfZzAOeVp+hRzw19CAFtCgbz2
         SgNt6RcD93NBtoeA23uLQ5rcOs2KAFGqN7SfsCoUqIrQM5VCdjn9YYs8cnncA0g94T0l
         kTWYbIX+Ptn01FAyQYlU5e+LBu18Bs/oAcv1YiDhD6KH4UewsFWBHOrRp/aLMdRUZL+B
         jj6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792413195; x=1793017995;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OHkb8hS3ILJ7jtb6Ae0OQ+p6ZaeWT/Gl2MVFAVf41S8=;
        b=kiOX58cH7V79NeB25OYAfQd5CuILoMjfQMiUZ+gAQwbZK1DvV3pzy8XBPTjgdzS2Tr
         v3qalqaf2IkSZ0mlQDEVhmbcee9jNqB3vBCmbiteoFyGy3hbZmuia6kqRuvfdV16viAW
         0SIUiplX6cFnmVLciQBotX3j0VKejSBP9hbMLpLEau7gBYdplT2QQmiZygN4O6FuZcvc
         LMBx16bjrPQnlBVuW+2SUcWxiCPcFtku+yJcrkTOBb8/eIzXolETDRY52ur5MNAlEuoW
         BhT/d6InGWZtLr5+x/eUYvwd3OPxgVJ5WwK/a+rznLh9QMIBw9Ai+XL6epZw4dblRPj5
         iA1w==
X-Forwarded-Encrypted: i=1; AKwUvBwC98DWzoIxHCXII0p0OVe4NSPrQfAYbxMJV6epVz3b5h7/J+DVQ3NutIx48XOS/hXdUOINVzXyP5Ge@vger.kernel.org
X-Gm-Message-State: AFq9FYIm/1vuKHUZEEkWKLZYf2/ULtO2WYSNSeTUBYeB81IpNKYs7CBw
	0jYByvBIWEGnQJQ9ej13B+2JnePC7VQuVuEVZV+WXAKNPvjG1GVPKeBf/PugT501J65OUd9Hrj3
	fjRXYGttJ1s9lN927pi2CV6YDM6Z3n6CMuU1HDfa2maqpdXF/g4l1Un9veXQAAgcuZQscM7Lr
X-Gm-Gg: AYBFou2g/iGL2vZozV9nwMORFSJbDJSqH7o3HdT5faqGQ6JK7t4OQGNO4/WkpOlzSKq
	+inZzmW7msZe5NkBZWOBk/mLT709jmjnBB/hVTOwvyaXdzN4JGudxMhCxKLBzjbwaXNSSBPYqrJ
	9fuRt0u0KyIeWoPIRYafambstrV0N1kIVpMz95XeHSCfuY2U9i/5X0Np9OuRdLJ2nvT6+zfRjYo
	60m0ks9DBYXQ6L5Zdk2mwGbW8xoQop+Q8hUzVCFj4mWm4tNOXiIO6vLDbbSx3Zx0ETbYmXEbR+Q
	jsVEljE5SX9ZR+eGB2B78g7tXYJmtZKJFIJGyh1X1cxObCkfVx2RFXdtLXRPr26o7zx18OPdIyu
	Qcz9sOYsY/ud5izcdbPLd6Q==
X-Received: by 2002:ac8:5701:0:b0:535:fd16:4393 with SMTP id d75a77b69052e-536461cc281mr132702831cf.5.1792413194936;
        Mon, 19 Oct 2026 05:33:14 -0700 (PDT)
X-Received: by 2002:ac8:5701:0:b0:535:fd16:4393 with SMTP id d75a77b69052e-536461cc281mr132702391cf.5.1792413194431;
        Mon, 19 Oct 2026 05:33:14 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dceadesm368526966b.20.2026.10.19.05.33.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 05:33:13 -0700 (PDT)
Message-ID: <c2f7946b-ba31-4f0c-bd84-fae3481f2965@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 14:33:11 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sm8550: Add support for Samsung
 Galaxy Tab S9 Wi-Fi
To: Nizat Mikayilli <nacht@dxdmail.cc>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261005-gts9wifi-dts-v2-0-c3ac9b0f9ceb@dxdmail.cc>
 <20261005-gts9wifi-dts-v2-2-c3ac9b0f9ceb@dxdmail.cc>
 <2e3c1082-e5d0-4a33-ad3f-272dd74aa54c@oss.qualcomm.com>
 <f7ba4d5a-0e8c-417d-a1fd-5b5e392df71a@dxdmail.cc>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f7ba4d5a-0e8c-417d-a1fd-5b5e392df71a@dxdmail.cc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: JfBV-L1mh8jsBes8xxKjltJveRfhJkoN
X-Proofpoint-GUID: JfBV-L1mh8jsBes8xxKjltJveRfhJkoN
X-Authority-Analysis: v=2.4 cv=H7NOUOYi c=1 sm=1 tr=0 ts=6ad60e0c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=AqZmfHzJsoaMp3Ki:21 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=Fpsou6_slo2yYXvzRi8A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0OSBTYWx0ZWRfXxp673KEiVZD7
 XcfJfXLpo+nLbedvM1jE99zDdPoXNbNHo93mlCneDsnnuIlbNwAA/a/VgSoi5wA/8bX8tCmlmcr
 WY/xEX5sF8pGXHRg+TQT3sv+J8VxJ+uiMKXVrp6PYhqHyDXsOtTckUaa+ToFR8ZOsLq2QpURU6h
 4lk0u51wE2Chp9yEbhBFNB6w4A8UgsoARTaoewCEvsa3RQUd6WTsgUC/vP3UEJ3ytNuwui49LfY
 POMtnzr4z+67QdX+yEUVQtETNT/fhQDtECwdfb8iwuMcJGHz9s1hAHjwnZ4Osiz3JAzQHBGHS7I
 NMetbOf50IO+mnqhP+3JABZJGUR8JbCTu61Gp8Vz/zoe+Dwh3/RJuE8BPwQdRbc94+XzpMFNmsb
 xNV61tFyiRj9KaXr1kSpZ2He9fkF7g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0OSBTYWx0ZWRfX0t3TZbZMLq+k
 03LqkdBdxSd3koXqilxowJ5yhSTu47J7N2LFxu3aV3gw2bq5d+1FRoGtZ/8cCR5UdusFryNH2Te
 MjoANhid7Dso2XcDCIiQBST+u6zvbiU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 adultscore=0
 bulkscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190049

On 10/15/26 11:06 PM, Nizat Mikayilli wrote:
> On 10/12/26 4:14 PM, Konrad Dybcio wrote:
>> On 10/5/26 9:47 PM, Nizat Mikayilli via B4 Relay wrote:
>>> amplifiers and the VA macro probing. The microSD slot is described but
>>> not yet tested; audio playback and capture were not exercised.
>>
>> Please test them!
> 
> Done: microSD works (UHS-I SDR104, read/write verified, card detect
> works), and so do speaker playback and DMIC capture. I'll update the
> commit message in v3.
> 
>>> The display panel, touch, pen digitizer, cameras, battery/charging and
>>> the wireless module are not described here; the latter needs additional
>>> power sequencing and follows as a separate series.
>>
>> Wi-Fi/BT should be a low-hanging fruit, see e.g. sm8550-qrd.dts
> 
> I tried a qrd-style description (wcn6855-pmu, PCIe0 with wifi@0, BT on
> uart14). From a cold boot the chip doesn't come up: all PMU rails are on
> and wlan-en is high, but there's no PCIe link and BT times out.
> 
> It works with the same nodes once the 11 WLAN PDC messages from the
> downstream qcom,pdc_init_table are sent to AOP over the AOSS QMP during
> power-up (tested with a hacked-up pwrseq-qcom-wcn). So this needs a
> driver change first, and I'd like to send it separately.

Sure!

> Any preference on how to model that? I'd rather not put the raw strings
> in DT, so a table in the driver seems better, but I'm not sure what to
> key it on, since other boards don't need it.

Please show me what your current diff is, on other platforms we didn't
have to go through these hoops..

Konrad
