Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E976741D644
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 13:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784121411; cv=none; b=tetfW0hBaqBtjaJciTRz/fDIzkl6DUVF5cFImJjHRIkZLSPdYPDhJBP9EngTmb1JwSXJBU1HOWEnwGyl3MoNS93imE/h6tPd0ODqNkV+zxNVXKSrEdNpfDoTkRKUXyvOiZEnDugvn4MyMIvm84jDpM7ISMf2tacaFirsMnjooCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784121411; c=relaxed/simple;
	bh=X3xNao4caxeAM9O+jt5vjM85vF4EW32IxnjHAcoEYws=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Muq0aHz5VUbWRtqL1p/bZBA4eeNpXNg1sM3bLJLyrOrR3ccAqltvcq95MVvlgfEHImBgM8FHMYcQfI38ALFVkqqQzhbT/NeHAZceltzPtJwYl5uOozFoiJN89tsAF240TaqhwegLGN1ROWG3tNxPhx2E3KnZ/xwZ9OnKhgHYbl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X/9QKtCO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HnuZeQ2i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X/9QKtCO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HnuZeQ2i"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBchpe3707608
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 13:16:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ytjfpUgKwmAHtvwTSBO/wGWBo2t9DYinF65FSUgXphg=; b=X/9QKtCO4nwO+hOV
	P/SR9f45cuzUsOFZ92G0+Nji5nWjbh3pFACmSa/TFw85Xq5gsU4tBzUCyD1lxMV+
	E1JQIV/aWaBQKNFAif5FPR7cCYILFyviKlK3U3v5ManyFEm6P5gw9hGgzbzyLwA/
	hRKFlboB0H2S15Ozuxrl3zfw8F6VeTuYiu5gL5KAlGBc1O5Ewwl6db8/hpeBrulB
	oCgq7AyJv579eOdUmyMnVWjl28XDbY+fBIJeqYSaW3rSzqLU8totnPUOvmHvsKqG
	vPVGNXwxeqU86BJrfbkIOUril8j8X5M0TEWmFumw+a1USbwXDfLnifr4casxFLU0
	jMRZZg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe7nmgu8x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 13:16:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92ea24a2db9so855281385a.0
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 06:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784121408; x=1784726208; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ytjfpUgKwmAHtvwTSBO/wGWBo2t9DYinF65FSUgXphg=;
        b=HnuZeQ2i5cSfr+4x3qNAZeipnea+M+dN5EJdDvEIcq947ja4BLURRhfTJpEJsA0pMl
         2GfVxTU9/huB/EmBDp5IwNBdwFjm0oI3M7LNpho4PckzIO1qEDL4Iomd+9PlCOD9KzZx
         gQVg+K4w4d5jAZgRk/t4VC+C/QSYJ0QDOYQWY783p+5eLlopM4fK0dyf17LPSDPLgGz/
         QYYvT+TfAQ2yxvwk4QKw0AaIMs2xZZVBN2wqKGQ32u3c9kmH/f4oR845HFnQGp3Tge0G
         t9oBOBNmYs6eliFiMbTkmV3zSNq7YUtKCs8QpCRZL2R29v+MGAiZj+yn26AecHOd29JH
         zQ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784121408; x=1784726208;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ytjfpUgKwmAHtvwTSBO/wGWBo2t9DYinF65FSUgXphg=;
        b=Fj6TMiI8kjEGMEH6DdPTVudSOm5MUFBmtsBMj6Yrs6K4nRbxJF5MSgTUg3tJkpCk+X
         rjekc9d42evsZsDBH7eDDFk8dR2bK9bE0d3feuuIz3+8PNW707ocOKBYCSkaHkZ1gVWF
         y3ZLjgCtoq/cSptjqrjIUhTH4ZUDDO6mMv/yL/LFwFvIkL8QcCdHWxK7d816iDTJfnEm
         sYFOkFOm8zbEqDRWgb6mqetqriM5Iswi4c92EvjofSogII2+4weq45DgiAtML8FcgSOM
         E0LTh6Yn0CJvSSilzmYYnAj7AE8MaiA1wvHpJ4xK3brnMJWvzSzmXv5H1zaBa3xcgROk
         /l8g==
X-Forwarded-Encrypted: i=1; AHgh+Rr2hSmSNoFGEIRJqHsrJkrqrREFg/OeeGPC/PBf9y4OBfrCPCGOIrELRKXcC2wKo2LaNk1Tph3lG6XB@vger.kernel.org
X-Gm-Message-State: AOJu0YxPLZrA0Wo7m1TwDSyYknV0yxfwMghVnBVB2BHJ2nhjE/xcHmNB
	lpoUn1HOUMmE29zV2mzRdMimQ70B+LlBq8jdNf5iI04FVHxBBs5e4Sys+4HC1p13AC6PAcl7c5P
	3KgyfQNxRj0WpCoSbvh0wXdQlrYckqsXQiHn5ec+lqr7cI+s3nAXznivr3yVyeIrA
X-Gm-Gg: AfdE7cn28KPY65B1k1V7BxCiLz1pj1pLhVhCmgAhFcQNeCmI0VDneLGQUw4sfVxkPiq
	UF6xGBziDEO7ji1hF7r6Znx96FBWd7Fimd5dygc1N/nzRaa81LTCNSwRxgovYqyadB677dsQqOL
	qRwB9RfBLLdXR83dUoG2jxZDH5uUT3YzajBT7kaiamAveNOCyMfFWFPviGmI6kPr/1eM2zf5HyU
	pdjtyh4ZiGRBYgwHXtA7KLGbnWW855b/KyEnFetmYTbiEv/ObNlVaFKdffadWJjx8YQ+VvHCnF4
	t7/fixpCXLHiKWpazoz+lAyHQlkmc3SeSkT/WJf49bOYRk3NS44O9IuIoz1SzKOsFPfJcmYU0xb
	sDSmzOQT49k2Sz4K08fi7ueWocKX+tlb8+IKSEcz0
X-Received: by 2002:a05:620a:3711:b0:92e:bd6f:b166 with SMTP id af79cd13be357-93086c1d9cbmr623774985a.63.1784121407819;
        Wed, 15 Jul 2026 06:16:47 -0700 (PDT)
X-Received: by 2002:a05:620a:3711:b0:92e:bd6f:b166 with SMTP id af79cd13be357-93086c1d9cbmr623770085a.63.1784121407284;
        Wed, 15 Jul 2026 06:16:47 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee5d61facsm1734570885a.42.2026.07.15.06.16.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 06:16:46 -0700 (PDT)
Message-ID: <c6163d49-4922-4926-af75-7bd8861ede6a@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 18:46:41 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] irqchip/qcom-pdc: Add puwra compatible for PDC
 secondary mode
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260616-purwa-pdc-v2-0-8dda7ef25ce5@oss.qualcomm.com>
 <20260616-purwa-pdc-v2-3-8dda7ef25ce5@oss.qualcomm.com> <87mrwtcekz.ffs@fw13>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <87mrwtcekz.ffs@fw13>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEzMSBTYWx0ZWRfX6Lqt4Hlr1gV7
 fzCKZW6lPikkXTsKTlyvxKroddLVM5cehimYNO829VlVZrMoX8bcNRANLYS5HRjbDctto2SHQ41
 CClwmJZBtpQs/fCdT24sqlbfEzMIH+4=
X-Authority-Analysis: v=2.4 cv=cuGrVV4i c=1 sm=1 tr=0 ts=6a578840 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KdhUs1RlD303uQQr2RgA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: ZtSDVbYoBF0Zd3-kn3dBnAbpchFFjfmd
X-Proofpoint-GUID: ZtSDVbYoBF0Zd3-kn3dBnAbpchFFjfmd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEzMSBTYWx0ZWRfX/YL+7m9HnuwA
 dS1hd9BNTOI8b4XLUKrFrM+hgntndABLqcsBV6AmhjYoeGtcmBMLEKiyeDHL9SYyRL8zdGTTLfL
 ZrQIO9lXIpYqu+IYjzSstIsKdV1KAFgplwKwfnlZb82jIY+PmVjizBjQdm8I7d3me/6tDGikCmd
 mGsezJEVAd3plGNF/sEa5Zfhd47Zv3A1wZ4/Tejs906vWqlrknoqXkwpc75Mxy6gKiIkiogXiw9
 IxeRc7ROya+pIHJQiFYBx9EBoE4xIgmlKGFWtqEekq//GJ4RtNRc4yC3JxvAXDs7CPnGiDR9KIS
 P+nmCxzfYrF0KriPjFNP+hu4VUsw+WibW4zgKrAiEZ0BIeAj6GDrPM4weUR9ETRVfVVSxaqNofL
 StXirN/bc3In4iHaT5vV/ca/kPIhg12hsn1EUZSXSj0dZVvQm1CquX2eGrZsrUws1W+jlz0gOmR
 NSUxz4KUksE5dWqjWnQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150131



On 6/17/2026 10:02 PM, Thomas Gleixner wrote:
> On Tue, Jun 16 2026 at 15:57, Maulik Shah wrote:
>> --- a/drivers/irqchip/qcom-pdc.c
>> +++ b/drivers/irqchip/qcom-pdc.c
>> @@ -704,7 +704,10 @@ static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *pare
>>  		}
>>  
>>  		pdc->x1e_quirk = true;
>> +	}
>>  
>> +	if (of_device_is_compatible(node, "qcom,x1e80100-pdc") ||
>> +	    of_device_is_compatible(node, "qcom,x1p42100-pdc")) {
>>  		if (!qcom_scm_is_available())
>>  			return -EPROBE_DEFER;
> 
> Bah. Can you please prominently tell in the cover letter that the series
> has dependencies on some other series instead of hiding that information
> in a lump of sha1 references which do not exist for me?
> 

Sure, next time will be careful to add dependencies in cover letter as well
as b4 prerequisites. I have sent v3 after rebase as dependencies are already
pulled in.

Thanks,
Maulik
