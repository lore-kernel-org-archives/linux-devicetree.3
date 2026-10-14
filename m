Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C174FB9B7
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 11:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791979039; cv=none; b=U5owH8fd/3MWp6NL7BpfZixUeOzcX7LVIZS8k7Qrfi5gjTeB8s9A+xAIJKUETDDIgyzik9geKVDYk6H8jOlsBFfjfxQsnW7PxG0NBKzS+ZjqlewjmCTgUS28ft/MXKX/0xcShaOahQwiwZNZ256i8hDy9/uaZHX90hBtcjiJd7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791979039; c=relaxed/simple;
	bh=Gpf/uqA8qhJd0TyJbH8QhW3DTaO8Ge2PGIsjVhn+qFU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sKj960zMd5RtWl7793jnG6lp7FXWk8+g8/eYZ3Ce2ZvZSGWlIDg+rq1ojLAk40VQaSbeFb2uz9egyEiqbJxBbp3ixzcYupBe2Kd1MBp4n0SGxYOFWITPDGowP0SKUodaIfdYESlJt5Nj+hrXedzUkcf00FQ8SwriE8G1uH6vw+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KjcbA/r/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cnr4ejiF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KjcbA/r/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cnr4ejiF"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E7teAU3017736
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 11:57:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	za6RVdO9z4aakw4xD1UPMWmSLRx6d+s98Yp1KFmTp0Y=; b=KjcbA/r/aXrEFGrb
	JC877QL3ZFq2HyYOOZNEESmeNF32f0qvD+NSwS8o/klAVQFlwHjy42R8Yjf+HNeP
	E+l1/5Uw4kJ0//x9R4Oa0eoEiPxS7p95HnHIcdLkSisRuFGC7hQS7JG5u8brKhew
	AT5DPr3tYct2/I89LxGZeteJ2fGmkoXFYqLsvbFjnxwcgFAF8zcTUoBw0+Hdo5bd
	3q5v1UrHCz1YUiJX38DUTvVtco1e5Ox5khtG9xspPwrobYuQILyM86XmIBStNUZ6
	0/msSBCh86MSzuAtPPxbp+PzoPasWueNHCBSz6TBr1AZECoHowZ5EC1xeG00TgVz
	bcEZOQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9s2b45ga-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 11:57:15 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb48f41343aso3965884a12.1
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 04:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791979035; x=1792583835; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=za6RVdO9z4aakw4xD1UPMWmSLRx6d+s98Yp1KFmTp0Y=;
        b=Cnr4ejiFc1eOuigahCnqVkD67K8DbOCRFEaZhRu4i3ts0Gk2Fr0tc6Wsr+eIZrOFob
         o7Kjai9hY01k4hJPSxlEUxYqf532F5kly7dUYQcfPUT//Cm7Ye21pUN47cNC/yuy4VgV
         k0hE1CghNmg9wOqgy3q3MUJ7THY9lg5kM4iMJ4W7MjksHimFgpy9bc/nfBtwKV0DYo07
         KDqeLa1ZO9xvCuWQa3664chweoFWqacDeywuH3twpiPWitualM0v4aYTBLTIaHSVTWNe
         QTpWQWtDNSiOJRm9j6GpzeaBWWGf9JWFvTRYJvYzPAzFS0sVmgFoPLe6YQkf4AtrT+WH
         i2Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791979035; x=1792583835;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=za6RVdO9z4aakw4xD1UPMWmSLRx6d+s98Yp1KFmTp0Y=;
        b=hBm/9iPKJXpic+8Np/AZ23+vjzFW5KPSvs3AIY9i0XcNqkx9cWTy4JU3dEY5sxdjia
         bSVWdESNbzslZTYBw21diJnA7y2NtcCT5PUSbwaZi1QIo2j4JGISCJOHR9gqs8kqW4/2
         go8dfwzk60rjyTAFf7iQIle62J1WsZ+srslPZqehgTBT1gZ4M1hU6/QRMqLk0ujU7Uo4
         qVD7WPmrPxUuUWgp+/qA8zuAwiexNh9Cg/FymKuKHERrt5tpn3YW4uQqqMdNQFJx0X1F
         dzNckOcyR0eWcwD/jye+cDcnI5r+E6RHxeY/PMTRlyzKTu9IWGrrzO+TnMutmUbWFfYU
         1lDQ==
X-Forwarded-Encrypted: i=1; AKwUvBxsKZ3zOaW7ne5T4YDTBl3xiM5VMy75q86IVzgm16MqdAo4wqiTFmdiR6VAw0fILTeAjcsg8ZVBRdNp@vger.kernel.org
X-Gm-Message-State: AFq9FYI8VqFn4FsFw/uESx+9VG6rnXnMJNPGB7snEC89T8JZyDyupLIU
	ba7vC4aqekZodVBX2rK1CZ7kMYme7xQMsdUH2HTyCv7mhxHZswVTqOwEzYCSUe8EHns4xTtsLrS
	c9oMFS0tIi40Jw7EhSncYa6IndV4RoP6yBQ59e9vkyxvCqtIkQbKX6HfO+nhyu8x/
X-Gm-Gg: AYBFou1lDF148CG7sLHpw4/CFiWMrwoeNQBSKnmmkcem8kuLpp/bm7A+4uT6jYrdF2n
	b09T3UkBHqh84fVCCbTgHLRDoaeTcLnSrhB975VDM1ELGppfeLH1V7bSOWmXPXyDHztx9yNAvB2
	LioqrTMwMdKdNCkViCsSR42f7ZUXB/t8d+owkmdV0KFp4uRP6U520wFYbvxrFbDxgBQmB2TabEo
	QJQfwPMlExVO7plPjR+VdrhQlwTfeSSk6DUymeEomrSvmqpLv4f6bTue3V216HAk9pUhm3nGVa/
	ZTTxVX3nQ3Hy/Qji9zgZtRWvCgxRhK/JgdKdzTVMy8W/We9fabSU9D70MVkwRCIjOA+i1ALSLY0
	WP0OpLkfNzDJ2gEqjHK3mDjN7dBa+
X-Received: by 2002:a17:90b:3cd0:b0:3ab:b9bb:dc42 with SMTP id 98e67ed59e1d1-3abb9bbdeebmr5193902a91.42.1791979034901;
        Wed, 14 Oct 2026 04:57:14 -0700 (PDT)
X-Received: by 2002:a17:90b:3cd0:b0:3ab:b9bb:dc42 with SMTP id 98e67ed59e1d1-3abb9bbdeebmr5193863a91.42.1791979034112;
        Wed, 14 Oct 2026 04:57:14 -0700 (PDT)
Received: from [10.92.209.72] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac77441306sm982127a91.2.2026.10.14.04.57.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 04:57:13 -0700 (PDT)
Message-ID: <4bff5ee4-fae7-40cc-afa4-cf79160d7349@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 17:27:07 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: talos: Add Talos Lyra EVK board
To: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>,
        Akash Kumar <akakum@qti.qualcomm.com>,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Vishnu Saini <vishsain@qti.qualcomm.com>
References: <20261012-talos-lyra-evk-v2-v2-0-dcc9316ebb59@oss.qualcomm.com>
 <20261012-talos-lyra-evk-v2-v2-3-dcc9316ebb59@oss.qualcomm.com>
Content-Language: en-US
From: Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
In-Reply-To: <20261012-talos-lyra-evk-v2-v2-3-dcc9316ebb59@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RPQmjIi+ c=1 sm=1 tr=0 ts=6acf6e1b cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=42DEVwYdyhcKbSgukHQA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: kxcDlpUlTDdOggT-83XXPs6KqeReApHb
X-Proofpoint-ORIG-GUID: kxcDlpUlTDdOggT-83XXPs6KqeReApHb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA0NyBTYWx0ZWRfX2UVIiYfdF7V+
 6VlGMD6pf5phYe3lBMH1qFD8uucTnf6FF5/4sC9iBVxIOMN0UkTts6rkg52xQYnQUYp+6DKtnNU
 2KnIn2MkFIyh4XOCU6u0DiDBE3RVNMiP9etmqzhtYZIM6ksLNJWBdp4AoC1TleZc8wBKbrpNh1B
 xNG/cFEO80XDxSoPgKfE7b2FT4/qbWCmNcuQ+5X4bq7afh69YVaDP91b5GcH9eTA+T/uAl5Mpg1
 EQI1K/x+NSbO2eQ5knw3s0vW0vzdpbtPFuVEm5K2SfE1TjcH8BflXxdOFNGyjASx036fVEyXbPo
 jCHriBzIHBQaZ6iyUoz/irAN0D8agQhsy8vGW1PcXE3Krnn4GgcXEI7GtMmlxPb+Q6TnKlNEsvf
 H7rD549Nl8kPKBbALUZzn7xpDP5dqk253OB4FtxmigcE1clEYgsQF2yKlXuiKhxo2+bbV01/WbU
 wMXBLnK9amcdywpEZ3w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA0NyBTYWx0ZWRfX+UO17u1X8kal
 kZROmm2VU6l2Ew5xjcRE6hd+k8ICUZui8H0SGfis2nxXD6WEs/CRGIYWq9gAnhzTQiieXUxfk4+
 hwogl+UHRFCf8PwVPwLkHpsUNPy8IYg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140047


On 10/12/2026 11:46 AM, Ruchira Revdekar wrote:
> From: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>
>
> Add the device tree for the Talos Lyra EVK platform which combines
> the Talos Lyra EVK SoM and Lyra carrier board.
>
> This device tree adds board-specific peripheral configuration on top
> of the SoM, including:
>
> - Native DisplayPort output
> - GPIO expanders on i2c5
> - SPI-attached TPM (ST33)
> - USB host and peripheral controllers
> - Power and reset keys
>
> Co-developed-by: Akash Kumar <akakum@qti.qualcomm.com>
> Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
> Co-developed-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
> Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
> Co-developed-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> Co-developed-by: Vishnu Saini <vishsain@qti.qualcomm.com>
> Signed-off-by: Vishnu Saini <vishsain@qti.qualcomm.com>
> Tested-by: Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
> Signed-off-by: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>
> Signed-off-by: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/Makefile           |   1 +
>   arch/arm64/boot/dts/qcom/talos-lyra-evk.dts | 137 ++++++++++++++++++++++++++++
>   2 files changed, 138 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 88230c4e00ea..2f25575e6efe 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -456,6 +456,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-valve-deckard.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-mtp.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-qrd.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= talos-lyra-evk.dtb
>   
>   talos-evk-el2-dtbs	:= talos-evk.dtb talos-el2.dtbo
>   
[...]

Tested-by: Nirmesh Kumar Singh<nirmesh.singh@oss.qualcomm.com> Thanks,
Nirmesh

