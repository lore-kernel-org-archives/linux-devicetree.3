Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A9C2F691F
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 04:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778041841; cv=none; b=bSdSaMgpKA+FMvNNRPu711P9QnNg/Ht0jEcsuaIVI5Oa636A3TioZkRbdQTYVCTwl2Kd2Ipy9Klo00T1B0EK9jDT675LpuH3c6XBT6doMWiL1cH94EAp5u/2Pe2ly7S2C90CFiin7qIQNeS6FWHX3jnTzkV4uRr0MwVN+TzF7DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778041841; c=relaxed/simple;
	bh=KzyXUN1QgP1pIDr7BcDdx51n118ngCDLhM35Jy+uXXs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gdcByfc/dzpYqazmVNAiX4vrslqvWS56cO2aYsHI/UQ0N5byBXSJEDTpjxw88SHe9AtFhxDh9Pr5sqBdE+sLTygN+5erERXftOEfwqW1jToT/6/q082Sfy/6swsj17fdwToc7AjROAPWkEdHfgeX4n2qrq9FTuUwSx4ZF3txmwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WWFXdJMa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SkVfDXG9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WWFXdJMa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SkVfDXG9"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 645Ne83b4028315
	for <devicetree@vger.kernel.org>; Wed, 6 May 2026 04:30:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5UpIeHvKhN/qMa8uSRFl2kpeYl9njEmNvEgnCIvDFXY=; b=WWFXdJMacZlDrqam
	IhOzDcnrAmns04tqRp4XDidyHqj0JaTrY3m0YK6CmZ4avsFoveLpWOj8QnTG0hmW
	HwTFAEQOIbBSk2eTocyBDuWIupwknWz9Vb8LDsmBSKznwcWhuXnXrLKowBVWhTSh
	EgczdMqD2YpN8s3M4rOWl2UzwspSYaxcbZ53wHapdzPH92NIP6EcfWPhNp9tfArL
	0I4V8GKcDtaSFqi7XdGPf7vCjU6GbvEkV2JrlVyw6/vJfLr5BBzIDNwuAn5/KCE1
	4JF3ajH9b2l2l/32oN5yYae9JmyJ9piMQrKF2TGMzwzd1hslwxj+VbEOxVi4A4v4
	sLC6DQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dydm6v318-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 06 May 2026 04:30:39 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2f485961555so1938989eec.1
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 21:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778041838; x=1778646638; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5UpIeHvKhN/qMa8uSRFl2kpeYl9njEmNvEgnCIvDFXY=;
        b=SkVfDXG95al6ldfCyne0kJqrkd5Gq2AL0uUzlxjSDy1LGlmedklK7/1LximVMVljPE
         z54JK+DMlEd3XnxOnh8tPa9GT7iQ3R3zOGbkvMWAWi29gLoQvvE0UzZR7pdo0E0OhGPR
         K1Afnp7V7pJcZgL3RSejWokabYbdG8Uo7r8aKcKKk8y6pe2jWEaTIkkrdKnTIFThf1DF
         WBlWdRz+tkkJzFiSDDauKmJ8EjPwhJO3iSI8XRZW5SP6mM3zQs+ciyKkxe703/otVTuS
         2bou8mcwpUxCeoNW/m7fvUe2SqyA0p8o3Rgpi/Gyh/1xoomyI8zO8NQp6pI/Yl7TgFP7
         PqmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778041838; x=1778646638;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5UpIeHvKhN/qMa8uSRFl2kpeYl9njEmNvEgnCIvDFXY=;
        b=gloHxsX3bJhA80QdVnOnn/OyjQX7kse/laePPBdNGgWI8G86KNm7k9dr6DlBCBl4aW
         uwoQutix5/aWM0sVz9MvEpMV71P6hjNQ5OmtMupRC0D7Sk8JNHL6oPoCNNNAPgz+s7C2
         0MiD6euBKCAOvYcZQOzZjQR027XmvU1W7IWK1UFEn+h+8LRoDROWQ8l+HRgPTFv0xsdG
         O2e/r36wdjLdEZ2kiJn55gaUhrWHPkUVlqRB/Bqbfzh9o7cEu7Ay2ICNJqcjJ2bDaTXA
         oPwKUxzIdVfA9SaT633Kv9MSQsGfwGlqvW0TlgisAcgJkOESmn8bryPpTag8T2KWenI8
         u+fA==
X-Forwarded-Encrypted: i=1; AFNElJ9nCXR3Zm9iC8GTG7hq2mqNlCnrqdmODFyO2Di9LIMaywJwDWwK/V8RptbMzc48Hh56UY9BSGAB6uYb@vger.kernel.org
X-Gm-Message-State: AOJu0YwHRskJKVt1uBtYIHl7ow0UeYDtZZa4HtpTDPQEBkjPl/DFnxrA
	ZduflUSmqb0/B4pRF00d2oRUrS4itOVAMnYTaoYmrY5HKWVD9/kxMq+3DiV4DaJFdRTq+I7RH78
	qCqGUI+mHS2F1L6byjsK+CWl0ojyA6Si+8VBX2h86sR0Zha5Z4tnmqrMUI4RvFwxG
X-Gm-Gg: AeBDievTqxkknon5HljgzP903L4rJOkLc+eLGwc1GlAKRHPviobYaynJVwQPLgq5jFL
	YkD7r52weoXNGJsVdBZ2caPB09nTuk3vCiiCUL27z/HoVqfo14XDusTp7kq9+C6KiPZf14Q28L4
	v6pWnWbTXQWLuMjX3m2VQrxEod7aOXz00FbRYheb1fgXynCV0n2lp88cZOKX2b6gppzvOpYxFL8
	ed4XjYWQDTc6QhbB6v/Yk/InY2HSnxZqWZFbsneXk1jG/f5u7IACdMyNJ1mL3wzG9fzWulOkc6o
	KNr9aCRpOh0rDYMKqRqXCmShkHHlnObSVVg7D+K/6XwuiQzgtZR1iqb5s8/dTcAoc5+IXpe1JOM
	gOoaxhxTgA1YMlnpDFCwBcBwFCaTXNAPPkeO0woToAImHTUPYiyeUx1rRafiI8uw=
X-Received: by 2002:a05:7301:2e89:b0:2f2:8857:17f6 with SMTP id 5a478bee46e88-2f54806545bmr944847eec.4.1778041838427;
        Tue, 05 May 2026 21:30:38 -0700 (PDT)
X-Received: by 2002:a05:7301:2e89:b0:2f2:8857:17f6 with SMTP id 5a478bee46e88-2f54806545bmr944796eec.4.1778041835170;
        Tue, 05 May 2026 21:30:35 -0700 (PDT)
Received: from [192.168.50.84] ([76.176.60.246])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f57057bd00sm1579297eec.30.2026.05.05.21.30.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 21:30:34 -0700 (PDT)
Message-ID: <a6e84f02-ed71-4369-b816-7bb3a0fcb56b@oss.qualcomm.com>
Date: Tue, 5 May 2026 21:30:15 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] arm64: dts: qcom: Introduce SA8255P as Lemans family
 SoC
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260409091100.474358-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
In-Reply-To: <20260409091100.474358-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDA0MSBTYWx0ZWRfXxfn6gtV5amhQ
 UGBsX/wrt4TV6roAMn8OMcvtuibsyr7NQqlU8+yxp/7VUOQIbVC18O4M0pQeWRPzVOM5OXS4I3b
 ktcLqyU6iqPpk8aCbZS1V3JQ5ov/llZBPxi7y85JDdvR7isiuqKt1vhQZN4A4Vd5yPErUxYqCCx
 dTjrG4X0T2ZkJ/tbw/d7kQvpoNHJmpUETPO5bf0K6ZpNHzzgak/vGXsIKF8A3HnqJJ8DoUQ7URa
 xy8RAJMN2IR4OrMs3mn2lt2AeU6KqtyX4zecefzhoObOyj4AWf4KUDND+QEtU+O/Drk9wtosUkP
 1v09Or6kHeEQwf8mTgCvLed1G66UB4UjDip5msiIGcyzIr5Zxjwjvxa1K9F0FDeBO2huOU34DuV
 nbFywARVKhSUP9T8kiNm7LPHoScCl6cgE+R4m4PqMJlGvDrPhD+ToYZ3fdd4Xa0itHQwLh88eN4
 O+UffvV6Ydn7O9zA3zw==
X-Authority-Analysis: v=2.4 cv=K4AS2SWI c=1 sm=1 tr=0 ts=69fac3ef cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=0ISbvMpsx/t7i6H15JfNAA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=4ozLBc_48SN-xzW_-ykA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: u3roXeo8DFk6McURy04B0NInwLQkrezF
X-Proofpoint-ORIG-GUID: u3roXeo8DFk6McURy04B0NInwLQkrezF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060041

On 4/9/2026 2:10 AM, Shawn Guo wrote:

> While the patchset [1] supports SA8255P as a standalone SoC, this series
> offers an alternative by introducing SA8255P as a Lemans family SoC.
>
> Lemans family includes IOT SoCs IQ-9 and AUTO SoCs SA8775P, SA8255P.
> Among them, IQ-9 and SA8775P have platform resources clocks, regulators,
> interconnects etc, managed in HLOS, while SA8255P has them configured in
> firmware via SCMI.  All Lemans family SoCs actually share the same
> hardware configurations like memory maps, interrupts, DMAs, etc.
>
> This patchset moves those platform resources out of lemans.dtsi and get
> them accommodated in lemans-iq9.dtsi, so that lemans.dtsi can cover
> SA8255P as well, like lemans-sa8255p.dtsi includes lemans.dtsi and
> sxoverrides/adds properties as needed.

Tested-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com> # sa8255p-ride board

Thanks,
Deepti

