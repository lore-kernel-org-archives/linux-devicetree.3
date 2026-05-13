Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3725B47DFBF
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 15:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778685269; cv=none; b=Unu0Z95PSLeMntHwaAIcpsVc1SUOkOzYp+KjRn0sec60M2ijzPTZW7YoBNgm9IXtTkXfWuz0asM4oEDqP9diF6paRD0KQlPy/VOYcPGOdmF0zfIBHU8B6DXPcmq8txQXrRZIkK8nq2DvaGVKXjl16NdwRS240aRUzWfMGaYrixQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778685269; c=relaxed/simple;
	bh=Xpe+7OwmMZuuj00e6mntMYVTzw2vd5zumxJHZHdvMNY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ad4Kr9nRr77+VZjpwuWVMH3LEaHQx+zWRaNHLJoplQltEX2JtM7x7UxypI7HSX812lx+dbJWRTjlXSF+VqoUagI9zG/2dexHzbB0LT2VpTimplzwIq03z8Ye4JChtq5M5yXEOQI/Oxq38oyAI+P2K3GF2QQH79sFAr94966H66Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M2JhHYCy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ci2K3Gt1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M2JhHYCy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ci2K3Gt1"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DEiAYS4161609
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 15:14:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HO7Wlq2B2SPXIMNALx+ptMXqmAC5pdgtVTRF4xlMpRI=; b=M2JhHYCyn5lAOr3R
	n4UHLY03f7KpqCz0UFUF/L231DZ79ATU7TsN2F69dnFm/NzCBpYFW3YC+rT9tkvg
	eSTT2pp47Bq/1EtOWpJQ90jTS1/awM5ogZ/l6nX2x3G1m+8GAgqeEq9p1kS7KIsd
	7I/TzBorh2sE18uF+TWeq772WfVS4Uo0tnYC3MZl5LeN1qITI5xkD96R9o+LjNxf
	xNs+mu4Hfi/lARFJ29x+RmtqeXGO+IiOrwr4Y83qTDx/DPrC2OAw+pAWbpv3umIG
	+/TPZSvTCffuyKlZ14UHQtfDFfjuj3IKGqtREpHey4j90llAQgxHFSiQM4e0lG/4
	GNOfEQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p91sfmk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 15:14:27 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6313385ca1bso3257874137.1
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 08:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778685266; x=1779290066; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HO7Wlq2B2SPXIMNALx+ptMXqmAC5pdgtVTRF4xlMpRI=;
        b=Ci2K3Gt1PuDxSlzYtzoV4oGy+Y31Fw7jta+XbkQmpI6ACAKo33FApy0zFWhO0nqQ8k
         kWJGP+036G6uBphA+pn3NYfFWBNtO8PFRNr7LKmeZgRz2vgNcoydDdzDkV09tWLJxrPU
         8TQLlCW6R1/Qmc7r956K0IMSXOk6lTdHO2VHk+3jMg1i5gOoJMaaMPot76cYDpQ1fjkL
         YsaLKJXxBe+vwVpyGUvfikS6UUFzTHBA8Q/DQtL1MRF8CiBlf79leRAXeT3/Dobcd+g5
         Il/Py3KNv5fMxpU7VKVCq5LkaqS5SJKld3vZyIs/Bgoj5lC9Rxf21zjvlihkaCxoCxdp
         0KSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778685266; x=1779290066;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HO7Wlq2B2SPXIMNALx+ptMXqmAC5pdgtVTRF4xlMpRI=;
        b=ol4uQyGdDcqAWEdcVRmF8y3+VQsaL3OiqAm6PD7p7moREibax7D+r7rdbd/CmIInaJ
         3KLzvRXjMDBCscnrWMs4tqdPs6QMu95mBJj0X6UfrNnkWcK0aztKhPRY69/geM8QJRwa
         dCG4XJMdS3JdVs0TzI5xdo9FkALO8KUjQXxZ4EGWpMF33YPycmIpkEm+Sx+Jwl6ecKR+
         ptn2lXYj0+HPIMsa7YeTSDz3/I6bG15kbNPu/U/jrHpA9uZrE11jIlqM8Y01kw1VbA/u
         2u/tl/5v9ua1a9WqA6tC3vx+jbCCzulbBHaGa0Ztn3PrxRVcopRj1cfMW7jd+f0g/PED
         EjIQ==
X-Forwarded-Encrypted: i=1; AFNElJ+xHDgZkxMgDAEM/srACFwTNZdOPZnGUbaVmlFbziIEO9qVCqavhU50uM5fsnUV7f7YrvkOAqSJku40@vger.kernel.org
X-Gm-Message-State: AOJu0YysQj85AtMNSaQ3ffwQINp018AYq2wp9+v8ZxmzPe5FfmyzWvV7
	VfAadxrQg10iH3uwGD2IVg8O9AK3Y0mpv9d3dk0o3vkn9uAvmb02sGLyaC3im6xPQciQ+lwZDtu
	EBei3963Wp8H9uNikB1zBfeELhQ5K6VXYwSflXJ2EumxJ1aZpvxB1bDZYLhr5fNQa
X-Gm-Gg: Acq92OEFx3fb+wiU1GQopEXc33yiUVpKY4Vi8IPTCxCDT6cOsvskZfE3TQGZZciSxoH
	qiJuBiaZNK3dMmSJPHj9jTEa/KoWdKqUQVESiQv9SBXqf3V9bIG3lg1y9tkDettkA4gjLKLE+rO
	Sc3+Ss2B8yyAkHc1u0NhZHA654als6FHyp/dUfuF4vgc9p6VZV6qRSDOKrB/qxYHclzi3EGonxW
	dvIbLAEDlGbzmYOKsL4xqhAAokFDN51nPGEU292IhTlRUQnDRGfkScpkcgnVYnHaZ6uuvzYuLi5
	QUBUJW5FmwDRH2CwJZEIPYaMjZy3vodexvyxiO/7zXYF8I1meT9MU6++VUV86pZry3HkXXz3SRQ
	H4YBe1frg1wEpT1pTk7OMVrzEHkZ4F9Bjgq0T4rB8D7KpZdafd8YvP0CpWUkbpDAR9zmwvrQ6Xr
	OuNs43PiVMHU+LfkMMwc9HqHGkKRk2Mx6ORxaEmHN/4jPq8Yacocv/8fUo65Fz+g==
X-Received: by 2002:a05:6102:b10:b0:631:5ef5:8325 with SMTP id ada2fe7eead31-637a7973223mr1260293137.8.1778685264858;
        Wed, 13 May 2026 08:14:24 -0700 (PDT)
X-Received: by 2002:a05:6102:b10:b0:631:5ef5:8325 with SMTP id ada2fe7eead31-637a7973223mr1260208137.8.1778685264069;
        Wed, 13 May 2026 08:14:24 -0700 (PDT)
Received: from ?IPV6:2001:99a:252:3300:d706:9b57:5996:15b4? (n2i9bzmlzk2z87merp0-1.v6.elisa-laajakaista.fi. [2001:99a:252:3300:d706:9b57:5996:15b4])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a95661aasm4088965e87.68.2026.05.13.08.14.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 08:14:21 -0700 (PDT)
Message-ID: <0ac665bb-1a21-4077-aa9e-97162f7f4784@oss.qualcomm.com>
Date: Wed, 13 May 2026 18:14:20 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Add Shikra CQM SoM platform
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Cc: sashiko-reviews@lists.linux.dev,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>, robh@kernel.org,
        linux-phy@lists.infradead.org, neil.armstrong@linaro.org,
        vkoul@kernel.org, olteanv@gmail.com, krzk+dt@kernel.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260512-shikra-dt-v1-3-716438330dd0@oss.qualcomm.com>
 <20260513042836.073F9C2BCB7@smtp.kernel.org>
 <t2sw6owdxy5iyodjqsldbw6bfaqnezhgvc4hhylxuyrrbjkjto@iwf4dr5nmot3>
 <20260513142936.kauwa3czigfs7qs5@hu-kotarake-hyd.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20260513142936.kauwa3czigfs7qs5@hu-kotarake-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0Qos8PwI0HJki5CCeq19So5QImqDGDjP
X-Proofpoint-GUID: 0Qos8PwI0HJki5CCeq19So5QImqDGDjP
X-Authority-Analysis: v=2.4 cv=G9Ys1dk5 c=1 sm=1 tr=0 ts=6a049553 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=G-sZjMlHS12s_U-QxDAA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE1NSBTYWx0ZWRfXzp3YSX6CHxR3
 mfRX2Fjv9JZo/f9XpMgZEvnxSPZKHEJ0V9lv2mgn3mwghTdE6J+igotqnA8+rHGUb03//9SuoHA
 engkzHcTsJIWFdUcpc3yPrNIsNEZFqrDGp5lThE+8/WJKqYkELxUVk9g9HYR17vO6EkVK0H0R5C
 JJhUVzuIPgQJM5G0XPIFlvCy/cBXtVMLFX8mCwcaSm9CYpiyAFOAsjKR8gGX1WEiELFZeAsMQLd
 nX/AIXZFm6v42bmI9VB5JMnuBdA7HF54vAO8rCeBUNg9vgPp3fn8x9kzo70HNwTrGkm2Ao1zN3o
 W7ImarxCg9Vtz88bD/1d69NHsY9DZqQpIn2EVUcO/UIBDkvgCWvMhMGpIyWffUcL0hZpsHtPwBb
 JgddDp2LHfFVe3CzaOHCvSOP2c3zDn1GYGMWOogDEdzMHBVsDFQqBWkNo2T1eCpPc+22SQFlR2G
 PjHg1PEGYlrWH/s0hXQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130155

On 13/05/2026 17:29, Rakesh Kota wrote:
> On Wed, May 13, 2026 at 03:01:47PM +0300, Dmitry Baryshkov wrote:
>> On Wed, May 13, 2026 at 04:28:35AM +0000, sashiko-bot@kernel.org wrote:
>>> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>>> - [High] The PMIC regulator definitions omit their required input supply dependencies (e.g., `vdd_s2-supply`, `vdd_l3-supply`), breaking the power hierarchy.
>>> - [Medium] The device tree inaccurately hardcodes the `compatible` string to a different PMIC model (`qcom,rpm-pm2250-regulators`) instead of explicitly identifying the actual hardware (PM4125).
>>> --
>>>
>>> commit 457abf6e7ac410430c866842e08e602ec3daaa51
>>> Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>>>
>>> arm64: dts: qcom: Add Shikra CQM SoM platform
>>>
>>> Add device tree include for the CQM variant of the Shikra System-on-Module.
>>> This variant integrates the Shikra SoC and PM4125 PMIC. The DTSI includes
>>> the common shikra.dtsi and adds PM4125 PMIC regulator definitions.
>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
>>>> new file mode 100644
>>>> index 0000000000000..401e71720519d
>>>> --- /dev/null
>>>> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
>>> [ ... ]
>>>> +&rpm_requests {
>>>> +	regulators {
>>>> +		compatible = "qcom,rpm-pm2250-regulators";
>>>
>>> Since the commit message indicates this is a PM4125 PMIC, should the
>>> compatible string include a specific identifier for the actual hardware?
>>>
>>> Using a specific identifier like "qcom,rpm-pm4125-regulators" alongside
>>> the fallback allows the kernel to apply specific quirks if PM4125 errata
>>> are discovered later.
>>
>> This can be ignored. The compat is a leftover from the historically
>> incorrect naming.
>>
>>>
>>>> +
>>>> +		pm4125_s2: s2 {
>>>> +			regulator-min-microvolt = <1000000>;
>>>> +			regulator-max-microvolt = <1200000>;
>>>> +		};
>>>
>>> Do these regulators need to explicitly define their input supply dependencies
>>> such as vdd_s2-supply?
>>>
>>> Without these properties, the regulator framework might be unaware that the
>>> PMIC regulators draw power from upstream supplies.
>>>
>>> If the kernel dynamically manages the upstream supply and its reference count
>>> drops to zero, could it be disabled, causing an unexpected power loss for
>>> downstream components?
>>
>> And this is a correct comment. Please provide missing supplies.
>>
> As per the Qualcomm system design, the parent-child supply relationship
> is managed by the RPM firmware, not the Linux regulator framework. The
> RPM ensures the parent supply is never disabled until all subsystem
> votes are cleared.

How is this different from other, previous platforms?

-- 
With best wishes
Dmitry
