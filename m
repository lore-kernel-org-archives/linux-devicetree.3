Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB683D16EC
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 10:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781174943; cv=none; b=nhRcVTVKQovG0F+GXLIV9K1ooz8xfjp6FmHE41tQbsDyc5pYS9ZAT+fEdTDNjsPwyLUQyjL9S/b3gyccjMcRS1yeenOZZCjigEan+tgsT36gBWPqbj4wlbf1Ld8/SDH9H2EV46GkWx4O2Q4CJoAt/gPp2oOJFjrEidDAL+TcOrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781174943; c=relaxed/simple;
	bh=GBkrhv7d64W4h/1OBsfcnntVKPA+JRwLwnMW6tdFuKw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ic35gx++ip+9cq4RJdOvCd6wMNFToQ4RSaxd5Qzn+QmL3W9s+F5uoDESrBsg/sCPkXQGp+8bTJWcn/InCb61MMc9vP3jwFfzNKh2Y84/iTdm1wrDiJ8gLYcR/ZKQbSdJDHgxv/2LTomGEBAq37bR+8xd3S3Q0HzsMjggkkrr/cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=msT64OzS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LxdeMk8s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="msT64OzS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LxdeMk8s"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BA0xv2304055
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 10:49:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R2oeESidr35zR0i0LnOjUC2aTb3T+iA/MYAO/hg3kcg=; b=msT64OzS7I+w5IY/
	/a5HZvJ1DfrwjTpEs5aY8myJ+YeHesMzS1Y2kTZCPSle+AId92xhvDYwIElnp32G
	NDUBjOLDHA47My87sQ90+y/3guPAdq5g1ogTfFlNGw89BZXxAFMINqUg5kJ9VDGy
	wydLpadhqBLZTIQECp7WcmLn0BRuczYBCQiG63HRxTzv+v2ThYOAyPJndaQJ2lvO
	MEeyMg/NtAUNsGHfDks5ycbPK5Ww7JXX1yc8VV/r4luCU/9EgwKanILj1UshsFmK
	ptpL+4tRADcHpmZhS+9RViD+ifdr3qUV1d5ebDRqPAzGjOQBizHo4LpTaU5gzw9O
	AMwOjQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqtb5gade-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 10:49:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5178ac43d27so21876011cf.0
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 03:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781174940; x=1781779740; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R2oeESidr35zR0i0LnOjUC2aTb3T+iA/MYAO/hg3kcg=;
        b=LxdeMk8sBasjJCayDRHJbcbSq51xAHPjpBGncgLs55EtJUVfGvFjFTjqwDifyCjB0j
         e7EWqat/SrSvju7EotZtaCEIMX4VOuVzbto/TVQK8s4vlkH2rsqOYUMmjVNNh3T6q87B
         z0iRYUIYd1QRu7bl4lm2HVGkAMvdNQXhy0MnKfFGvq0aT+0alh4iF4Z712Qa1Yfvzl2H
         gXdf2AAZ9GULHTWsOvc6G7NZPMf20NdwDDszdhjYTSZjyini4iIlqCuNEGfU1dnh22x4
         DGgywFqJ905YzgQ1M+7I0sFII57sd3lh01MuZ10XU+D45nOGYd3wbgspXy3PeoF0if9c
         CwZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781174940; x=1781779740;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R2oeESidr35zR0i0LnOjUC2aTb3T+iA/MYAO/hg3kcg=;
        b=EXCU8Rna9UjbWWCMog2LFopptzT1tmAsrB0FL10N0LyrhMkLVVmtJAPcoHN8xS9wc4
         ekiTI9NHHJbZ20JDlIx9QShylTOK/TYdtQFmjT8+3Pt5wj4UuAfHSDDtxMYql6eSn0gt
         Ws5NZmD+cCE/VtQ+JwKWE3WiyfReeAGxMz3OnjjxOxg+o9Ds2CMCJGxzVO6PN3z48SAy
         MJqA1KoH4W3uOLIW6YiMe5pia8NegMPdObWj+WIE9mKclTiCt7u1OhGHcN0+Zyl4r4+h
         GLymEl8eSH6Ae8CKcdbTuBbvhtdShGkd11ZaJiJA7bUUTPuXJclTY/eOLqI3jMiG1t+B
         s59g==
X-Forwarded-Encrypted: i=1; AFNElJ97Ve9feKeYy9vCYyYgeuJYaQYJDry9XqLCTz5BDQIk34NZnrVKzXxDon7xIDECOEtQoteu8I5m2kC3@vger.kernel.org
X-Gm-Message-State: AOJu0YwgexrOc8104mbKaYKlP1LbbC7A96tJNgAQhXog9GPkBKixizjY
	704isz5geMdPmqTDfYn5gamC4BIBTq6fB/uzDjln580JX7jX+bAPu9e30acNbqkMh5C0ON8TaDn
	X+3dDYulyDvEq7oeSIOo+DiN6fma5XiJTL85DpuQhZxTmW7OVuO+s/KA9yaoxdXl4
X-Gm-Gg: Acq92OEmGrRv9fSFCjvwabPA/BL3UGYb9q1FMYLsCbjPWLV+l9w6OojVX0l/KYCFgTS
	L2EEuL5tWABIB7zdmZeyuUf1OJReKnyu+IoF9tV4o0EniB3DHh6dGQRYJuGE0AvecVKfU1Z2RPH
	llopTLtR4M94innbYmtGffhjxduvfsitKAI7pZRfBQA2n1ecj8XXN1IKqfTO3qnYnmGDdtq0jWS
	GPtvwcvI3jzjf9OPSTsL7p0jTDh3u/cGmdhgVSN5/MN6ix2p2hqWjL8SZCx+UuFu8Vw6cbRIss3
	TtHwXiJysMQo91xJddWz92hiHdOmCBA4n8/EA2xlH9G/MRulGNCBT2NVmu50QXbuEEJMkAzjy5E
	ntVjJ6PpEjyRqx2DA4xxVYWZP6DhvYYyDwEJBne+N1/5kRov/gqOR1GAn
X-Received: by 2002:a05:622a:4813:b0:517:5e32:f3c2 with SMTP id d75a77b69052e-517edcd94cdmr21330571cf.1.1781174940229;
        Thu, 11 Jun 2026 03:49:00 -0700 (PDT)
X-Received: by 2002:a05:622a:4813:b0:517:5e32:f3c2 with SMTP id d75a77b69052e-517edcd94cdmr21330251cf.1.1781174939813;
        Thu, 11 Jun 2026 03:48:59 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb6785ee3sm48945666b.58.2026.06.11.03.48.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 03:48:59 -0700 (PDT)
Message-ID: <e159fc1f-d4ca-4064-8c0a-17b75988f451@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 12:48:56 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] irqchip/qcom-pdc: restructure version support
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
References: <20260526-hamoa_pdc-v2-0-f6857af1ce91@oss.qualcomm.com>
 <20260526-hamoa_pdc-v2-1-f6857af1ce91@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260526-hamoa_pdc-v2-1-f6857af1ce91@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDEwOCBTYWx0ZWRfX7y/73Z8bsgUn
 7favbN4DbMOHPzLaumBjxQ6VZG6vUUNWYhi3YkKzNaGJmNJMFG1/eONo4sm91LaMQUmbtoDBz4d
 TZuTfQQKDE5TgAJC49+PQgKg+n8IdTzA7byZv3XecFCD/i8DxjiclVXeRSYGzQnj+sZf5yQCzRc
 eXP/+moOn87CenraaZ9GHEPZCpzEKd4JYZgrsS8TOP+qJ29ofBRggaSe7DatXWgaNBUGplPoKe/
 RcUX1DWMSWN3v7DcViN+AbfwworqoeQY8ZQd6+9rJmmDQ6d01GnLzQFt1I289Kh2tdAU0apXzsn
 yuszOJGT/KCQKuDEtu9Qxx0EQYWyZqrhrNHnuHzHyhi+FU1uxM6Q21yR7DUfSPm7y5EZcBAUIXA
 NJNlKnR/3UW6aACxkSV/1cuKiSRxGCnnLEuE05qFblod+hqd0bVhOPdjaOCZyYKzvSvGSFo6ttx
 Pg4H3mh1pJ1WdEj5uFg==
X-Proofpoint-ORIG-GUID: 55Sb2lpqr6T1dJj1yAUmxISvoHd5UKzl
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDEwOCBTYWx0ZWRfX2s8zFXf9OY6O
 6qdjZu1SWmv/pjpmP2UEerc9m3+ZDXAnPh7nX7kdOFYvthfxzNtfzp1Xp/gdG8LLPMj1+4abUvs
 TVmRVjokUhlNasXEOg9zUHwfetMoRhA=
X-Authority-Analysis: v=2.4 cv=e6g2j6p/ c=1 sm=1 tr=0 ts=6a2a929c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=OlIdmLjaEo8V13lRhzgA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 55Sb2lpqr6T1dJj1yAUmxISvoHd5UKzl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 clxscore=1015 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110108

On 5/26/26 12:54 PM, Maulik Shah wrote:
> PDC irqchip updates IRQ_ENABLE and IRQ_CFG and for three different
> versions v2.7, v3.0 and v3.2. These registers are organized in H/W
> as below on various SoCs.

[...]

> +static const struct pdc_cfg pdc_cfg_v3_2 = {
> +	.irq_enable = GENMASK(3, 3),

BIT(3)

[...]


> +	pdc->base = ioremap(res.start, res_size);

Can we use devm_ioremap() here?

[...]

>  	if (of_device_is_compatible(node, "qcom,x1e80100-pdc")) {
> -		pdc_prev_base = ioremap(res.start - PDC_DRV_SIZE, IRQ_ENABLE_BANK_MAX);
> -		if (!pdc_prev_base) {
> +		pdc->prev_base = ioremap(res.start - PDC_DRV_SIZE,
> +					 pdc->regs->irq_en_reg + IRQ_ENABLE_BANK_MAX);

likewise

Konrad
