Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792752452;
	b=ff5ONPgqOWrp+NOLDRvkVaEZn67Bjh6QcrnYVdtXacLbSj94YWF47KhHs1XHdYCBOn03
	 mPNmX/2i2a+mgMUgRpo+XFJ579deP0SejcS0hE967IOLom54V5va29gSjGee/xXLr4qLH
	 WC7HV/I455GNbfjxZJ4FYU20MWzz+5MgliG8O6AIg+V0IxLw1/tDSsDmDh2JflfmL9orH
	 I+wsMUYcDAJ/DxwfEhmYTMNJTpRfB384QKCIfuZ7wE1/GNaujaiSJdaQEfkPvsZsmflUD
	 Io5rWR96yc7VP/nICJ9gseM5nW0NXPsXu+gNfTEfyS+fdRITyunSBqMXsPtCHvHiTcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792752452;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VwgGM5/F73Jt9T9hXLJk5Fbp36axcuLPsz019Bv+rQE=;
	b=YfcDrtE+qQwzKVV8SzshS4xy4V25b9JCdU1NnfaVJAotHKI6JCrHqzXZr/gTo62wTelK
	 MdxYDXD0J5W6CgxMcroVKxWQeItKtIuajTnfvJY2jPRYYPu0pKcABXGtLqtCxbqaB4kN2
	 S3V5a8Z/dMHwPldUJe7ezl1sn2cXjVUYyaXrVpkg1sj0A7LRw08gYS1fv3UbvUaa1NTwF
	 +Bw7qbYBjJKNCXAxpu/csbKoN0egaW3JgafLWZ5b++xIRnQwRRqBy4wJ7C5t1Bj7y4Nk+
	 ZfyA5fg8scTyt/5MK9RvZoFfMCtA30fpgumFx0TvZX+UEurlcszUf8M1FyA7lpyI+fQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L9ucrPfx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EEavBmXT;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76880606A31D
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 10:47:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76880606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L9ucrPfx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EEavBmXT
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAZl82509109
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 10:47:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VwgGM5/F73Jt9T9hXLJk5Fbp36axcuLPsz019Bv+rQE=; b=L9ucrPfxb+ZmgyDX
	JnKX8tcV1GHhhYAKhc3WdADnxaKaZLrXCfDfjuay70SEQyeaJ6tghMMoDV2jrkjs
	4aT+esgc+dDbOVGlNcddFWxMitVgeB4XAvc96bAwxTu/hD6w3oFqde/5g9CDcZCz
	/wkQlp+q5LxTo8fcBfFLFA6HDLmGdgErhPm9Icjvz83GvJuDSdc+yfH4saui8fZx
	FfQXXjGTKybISchmo3BAcU3JQ8qEVVRGs3w2WakqZKPrxR/9+vxKfR9vKPfMJ+6B
	iECMvH8QmCl+A950phbB5vw++e4DXf/WhAoz4chRh4CGC+ZqfcCKD02PQQWOGT0K
	bGU9aA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfsykaqsu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 10:47:31 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93df7a9466bso9959385a.2
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 03:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792752451; x=1793357251; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VwgGM5/F73Jt9T9hXLJk5Fbp36axcuLPsz019Bv+rQE=;
        b=EEavBmXThk8aPanid1uL9e/glsYLVCcWokQHSVeoQEQyKOTShC1IUzBEnjdVd4UR7d
         fO3PwEGjTDXGdO5LfGpxnLteVHbtXz8CFZSufMQw9Uev8f7jp63WAI8j7QWXmcFhDx6T
         zSkfoeYFIQk/8H9H6kPXWSrKvU9h0JtLQtY9nQFDZ/eHzFbkADnlbj+xrJmboTzFF+um
         1Hhy5+31z/Ro26qAJW6cBvdDW9570A+48l27wrxMIhHz5mEXxEwgs09b051lsIvTzWjK
         R+bRKukrco/y5pNje7E1mIldsbPYwo4mNW59JmGIXwGQ7jzqf6YvSD2Aao2NwWYtmhNb
         vR6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792752451; x=1793357251;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VwgGM5/F73Jt9T9hXLJk5Fbp36axcuLPsz019Bv+rQE=;
        b=Eq9pI4czulL6Oy/lpfhUTK+o1EkWzqVwBjKwrmxNeR8OvIbIxWaTWnig/7RZo2G1Qn
         NunjysTLMo/9mHJ5I8AjKldmY16ye6+xPap63MLRHxk4y0zkDcPrq9hu/LsmwzqPQF5+
         ZrM66dM30R5cuKeCp6L7Nw8XC2Vnjv9dFPbIDAZeNL8MmX1L9wNAFVyEjoLJPNLduZXt
         eUBMVXEkPPOLKlV27OsiRILO93MABuP8LDMSk2r2nQBcQA5Q7M09aWPaBsgq0RR5372+
         EWD39+Rp5L1naDmMWOJGF06IXY5zm42SH9FglKzrZI6ofROHqoQfzQlt/lc57SVWv7Kz
         Pcow==
X-Forwarded-Encrypted: i=1; AKwUvBxtu4Ws5uwTKAXFMwlUY9RfMZz/hi53l7lAFJS5yfBakRiK+rB9q0AJUEMRX30bcad6oak0jBMNOOnt@vger.kernel.org
X-Gm-Message-State: AFq9FYKrxeiU+Gbi7bbDokRLSiYbTenEWqcwnITFFTJW5NpNtHeS2X9E
	RSoD1SfZd7U8BLMu9GKBBUCwKw2x4LuiqxC5WFFGEQmxtJmF/HuDZcsE5ZrIzFwPieG5fLJv9wf
	djTIkbk1JqI+eOmzT90AFDwZWRGixkALv3pHbMf4uazA0YNpK6rbaVABYHnnPTkY8
X-Gm-Gg: AYBFou2/IwTaniy721pveYPLMjAqteC4Glde/dD79az7rX+GORDNtc9xHBcEP/omWfm
	ji4HaYSIiMBshlbxShIUl52HmnSQT3n2exrDgLyZuUeBn7223qhImteAEIHNKDjt/jpiiIFuED1
	cs9Yibza9lyOBd57t3Z7d0sLM440Ffg3Kpo+j7l18W4gVj8KJYx0nG+qN/uy+PDDv+we6+PdHRa
	19H7uwT71zLBLVogg0FAWDdMoQ4IWOYxNQ8IMbaKTNZkcnlIlzHOjb9L5AczFeLS740tqXO/b7f
	QpNwf57j/AAmeHY/2ZjTwpQFAYTTT5ZGEKirfsn9AWDZ9WoZ0UijImUWn1uknQ1ui8cMbhieJG0
	ImxYKh53RKbFq9FS3TvgV4Q==
X-Received: by 2002:a05:620a:564a:b0:93f:43a4:a48f with SMTP id af79cd13be357-93f6f96d3a2mr366201385a.5.1792752450764;
        Fri, 23 Oct 2026 03:47:30 -0700 (PDT)
X-Received: by 2002:a05:620a:564a:b0:93f:43a4:a48f with SMTP id af79cd13be357-93f6f96d3a2mr366197885a.5.1792752450313;
        Fri, 23 Oct 2026 03:47:30 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46a5c84370sm88657166b.42.2026.10.23.03.47.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 03:47:28 -0700 (PDT)
Message-ID: <6ebd380c-1f32-4ec6-86be-99631db4958b@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:47:26 +0200
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
Subject: Re: [PATCH v4] arm64: dts: qcom: x1e78100-thinkpad-t14s: Add thermal
 zones for PMICs
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, johannes.goede@oss.qualcomm.com,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mark Pearson <mpearson-lenovo@squebb.ca>
References: <20261023083827.7648-1-daniel.lezcano@oss.qualcomm.com>
 <atsmQqSOuqp1LKw8@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <atsmQqSOuqp1LKw8@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA0MSBTYWx0ZWRfXxraVf39zCz61
 QmGfNVtuxk2meGVoP9MEaGZO4EyCxFc2RAEX643XQhnx0ckT0qG8UIv3oTc1/wVQrKUCR05J7rV
 6PnddcCwG2BeXn+ntM9Tv6J/mdklDXQ5HtfuTNSe3DuNSgmpsNefHr9DqTMcJ+kyzTyROmLcBpy
 dpl4J9xuauGCkwq7kbSKPfUccp7sJX1szjs5vTvgkAOajDZ+zHPWoShfBD68SYaNBI9CJOmRgCv
 EDk4fwVTe4YqwO5Yv2UNzKB9EjiNbnv1xDkkmkKOF9+h5P43CYxGV/JtxZ/0OM6Viewpw8SO1e+
 V3HynAEisUzFcf2D1zh2fJVNeNt+dzPliHGpjqyqfJd3LLHTm2raWz9xhKLpI5H+qJsguG2noP+
 JbLrOIGK9uMn2JDRENsduwTUyELTz4igWZc5Q46U8TS40xOm4ZSHPdLL1IaRTmVB/LeKa29F+fd
 swbKCL0eI9A4U+r/6Tg==
X-Proofpoint-ORIG-GUID: r-khMsoVVuaTcPHCD3I3YPyg4hNtpsN0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA0MSBTYWx0ZWRfX17OwiZy3QLTT
 9fvLzhwYdkDteNu0g4F3+phcyMtb9AhuVQazskLKpapwU17ALABr4elt+IYeb86uY1b9G3bFofh
 yPuXFnZDfBLw5pVHjwuT69F2CjuRpho=
X-Proofpoint-GUID: r-khMsoVVuaTcPHCD3I3YPyg4hNtpsN0
X-Authority-Analysis: v=2.4 cv=GLKdgeNK c=1 sm=1 tr=0 ts=6adb3b43 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=rrZNFMavuSw8objGGgIA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230041

On 10/23/26 11:17 AM, Stephan Gerhold wrote:
> On Fri, Oct 23, 2026 at 10:38:27AM +0200, Daniel Lezcano wrote:
>> The ThinkPad T14s needs thermal mitigation under sustained workloads to
>> limit temperature rise before thermal shutdown. EC interrupt-driven thermal
>> monitoring is not yet supported, so use the board temperature sensors
>> exposed through the PMK8550 VADC to provide mitigation now.

[...]

>> +		/* Sensor near the CPU PMICs. */
>> +		cpu-pmic-thermal {
> 
> I'm a bit confused by the node order here. It's not ordered by the
> thermal sensor (SYS_THERMx) like in x1e80100-crd.dts, but it's not
> ordered alphabetically either. Or is it still the old order from the
> previous revision?
> 
> I think I'd personally prefer ordering by SYS_THERMx, but alphabetical
> order would be our typical rule.

Thermistor index is what I'd prefer to go by, I think it makes the
mostsense 

in any case

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

thanks!

Konrad
