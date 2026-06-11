Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D23376BE8
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781177544; cv=none; b=ZAdwP/QSsP7eoue02sU5iY1ugHlFZdO2zmQz0WlFrkwIDkWnGGDXZBDEHWjBzV6zzrcXAOVTz1fJUe7/WRU1bDLTWIreWGD5EtVBvF2zreLOjxmHj4dXHZ9nKc5Gl59JgfgtvtqMjsb7rc1soVxzrBo2lk0lTESVj5gjg2O7Tv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781177544; c=relaxed/simple;
	bh=0StIhegVocrr0UB01yU+UcOspZ1FBVgbSkPGYjz3Acs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VneW/AzxbiD1NnHPM7zVsJcYGEb2TOiapsHNdjN9yQu5oc71MqCQ/mLEwTtSOJmUqgpLeQryuMsAEhqmO8iv3zevMzKp8OdIJaVlneHKMD8W7idRCr/vC3GCz+Cg69z5nr0YJUdya2NEJ0WcR/wHjh3IPxFOKLJpNoksMHCWkUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YKmGp2w4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CHN14sKo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YKmGp2w4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CHN14sKo"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BA110w299664
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:32:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yLBwXK7+oD6+XlBvQMPqJDwpfaAh9nMZFyst4JItm4k=; b=YKmGp2w4Uw9sd1Lv
	n2/3v+0Fvg+ZGtp4HTspljqxGNIj9yWFgrPQFEJ8L1HtgcHfEFzcoHO7RWeqJfB7
	p/SavtBwi/Aw6c3XmHPakqA9zb4wXeTQbm8P8nYzdLjckTD9F3qRmTrIR7wvLh62
	/+nV0ddbYvknnbcX7Mt0lKLT2nYfyhoRdg8sNdBOP2FJ8KineipZeIE0Xd5rQ5Nt
	1cEpcMoBvrPdKLg/Ml9jotWen3SSuIdKSpTNhA2qZfmwPiL7v7s6jUg++lSS1mqM
	jqVNVnQXFfaf/OGMCxj/LHjL/nJcfNTIzLZbSEDwck1vR/gx6x3pg76ISaqBo9ip
	GRez7w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe7034rg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:32:21 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5176ff55dc2so13766181cf.2
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 04:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781177541; x=1781782341; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yLBwXK7+oD6+XlBvQMPqJDwpfaAh9nMZFyst4JItm4k=;
        b=CHN14sKoGZadYc9af023CA0NJNIAg3Gk2MmLIFjhjuCKjvKdHWjbAT5J0kjJs5jw32
         udRbYPYhVeHGvdvFdGA/bfSNo5D98j3WAT+yxWDokaKPFD4s2sTHHqUCLvE1yArbRm8u
         G2i0zM2jC3mAB37fpprceFB2hpakQtQQfIYgLW4jw6Cx8sKV3YCugSq+3xljl9IuJsol
         lXsX3NxGjeUrd81QW5K/medhfkZs/miwZxdRl9lQJPkoW7fBUd/652fqpLeesTwxG/YE
         XTVhe8BeQgIAjrZctgiu4TnLHdxCoZ2Efe4lUVZziNJt/DV/j56RAQz0WUGj+rkMPS3W
         VN0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781177541; x=1781782341;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yLBwXK7+oD6+XlBvQMPqJDwpfaAh9nMZFyst4JItm4k=;
        b=hvynLOjT28ChxESQmwAVTMU66FP94xeY3VLYEkl2htet3IuMasTE70mEEmQRcfWwvS
         l0QMKc53C6pmLBiMYcWa3twYcKM7MbAHSRpqpoM+MzmXVfnoC4HjHNBa5b/YSBh8P0yb
         ngyscbCM+7jyDBvd4rlXbLEhzm7LYp6Fq7fH4fkftuUuHq7BxCfRILraV+PXDDMSGwys
         WmYYK9ZZTJUWon0QRqBraQrd+cXfh8F09iupK9ePFEhPlUeHeDIwy5Ug+p9Fgs5mL7qj
         16V/niV+paAfEG8zB1eALF3O7BL/JRLBpDbUx8jqNN0hO8hCCjNxbtlyw9SEuLHpC3cn
         fRvQ==
X-Forwarded-Encrypted: i=1; AFNElJ9iU8W+wF8QhBVsYJ1uqiVVBFgyN1LDlTB+Fw82zPW27peSLjStNEERwRS2QFXL0E3VqhzeBvI9Oa7o@vger.kernel.org
X-Gm-Message-State: AOJu0YwFA/0nJduPVmEHlW1KO9aDzxH3MqU44PA/zOO0cNwxF1yHdkaV
	bRdXqe7EVY236dCXLiQjoio0DSAqDzwCn6sOE08od7aBy4emQOHOqVbc4xQuBgi38Si6e9Oq0Wo
	DAS346GTYrOS8YrwiFAuZcX13Yz+itcV279WmFqsl8XPHUyNT9g3pkJcn89NXcDNd
X-Gm-Gg: Acq92OE5xs2jadPVOgU6hCdL3eFMLhrIagvepNdLYrF8daGIaPDy4bRREjx23BkRYw6
	mGBYROzgpnMcUaI8KS+sUK36zaBydJUk4O/vpv3wasIWTf6Xg5BLcKm2zYoih6YloE6D+hsVc0d
	TQFslCzpr8FHnX/V3CIF7Qgf90PEoLTCLcxnm2qxUUVGKy3REHMKemTudNoQLlN/wUi158/SGp3
	CGsho2C3/0ZXenfOZ9T1rt66idBnWvEPoQinruKwoV8VfvMnrlrrJ9EjjEasSUUpG7V732U4n/Y
	Ms5ATcTlCP9qDvQMgM/Cb145bdnT6ocZesLhCs1N6HgYy5jHSkSBiiA8mEorumPCetELnM76hw/
	Rgigc5M4KdVKZYDZIyfeTLfFUOvfp5ILrCvaFWvUgnS2LFpEhbTepKBxa
X-Received: by 2002:a05:622a:1f18:b0:50b:2875:5782 with SMTP id d75a77b69052e-517ee2375f4mr20213931cf.6.1781177541000;
        Thu, 11 Jun 2026 04:32:21 -0700 (PDT)
X-Received: by 2002:a05:622a:1f18:b0:50b:2875:5782 with SMTP id d75a77b69052e-517ee2375f4mr20213461cf.6.1781177540438;
        Thu, 11 Jun 2026 04:32:20 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb0f14cbdsm52606966b.2.2026.06.11.04.32.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 04:32:19 -0700 (PDT)
Message-ID: <b6fd22ee-a063-4af7-b21a-5f6268c65b07@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 13:32:16 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/8] pinctrl: qcom: Register functions before enabling
 pinctrl
To: contact@alex-min.fr, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Guru Das Srinagesh
 <linux@gurudas.dev>,
        Linus Walleij <linusw@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        iommu@lists.linux.dev, phone-devel@vger.kernel.org
References: <20260519-mainline-send-v1-sending-v3-0-3dd7aa125353@alex-min.fr>
 <20260519-mainline-send-v1-sending-v3-3-3dd7aa125353@alex-min.fr>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260519-mainline-send-v1-sending-v3-3-3dd7aa125353@alex-min.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: v3hZdD5KbInj3sutlATppWYsXzOb1U72
X-Authority-Analysis: v=2.4 cv=B9eJFutM c=1 sm=1 tr=0 ts=6a2a9cc5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=lq5VANsAAuRygiiSL6QA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDExNSBTYWx0ZWRfX3ijPjai1sHl7
 0sKBVFFs29KCWm8dGUBkrfUU70035uhENLiDcpayR6qrroGXDreBwOKzWfoJxbXVOs6tM4G8Hpq
 oQxdoqls4yCI/KSTijsEMqPYYuVKAfx4kkjjSmvx2aXYMVp0nkeMDRLAiMiXcNimCk4v22L6SxP
 Ep+A6RINwinwvSPMDOXoKMhmLouMZdVsKVFD/81BqOM4oYPu81zeanJabnUi0zmTv8RdHdjwDTW
 M5BuXe6VqUvT1uR9RfegpUG70eTQtnmAnI2nhtpDVXZ9Mysn7b8hZqDOODWcM36Swf4VUXos/LD
 /othSbJj0uOJGxZVHoILF9IORWzsKqe8etx+e1KtEutrahtYITgKgYZETGr3Q0NlX4AndwRu2vo
 0eN8ZPRbYgmJsXLYt+Z6m2hYvVCAYBwEO1JvV+B2w06slkDEKNZOKx+lNV2qKPyK4Q+JBY+t9QF
 Kew3PlOucM1CvUaPhiA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDExNSBTYWx0ZWRfXxWSsCXxmjUvE
 eh15M/Tx8XSzsyOCAEIpBF0aWOL4r3ZUjPLkqfInMI/gv1Kls4tCmYlo9uo1MVCz6lkW3aol+Q8
 GqocGGU6OQ0/C+pU5P3h4uU7AaVirsw=
X-Proofpoint-ORIG-GUID: v3hZdD5KbInj3sutlATppWYsXzOb1U72
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110115

On 5/19/26 9:16 AM, Alexandre MINETTE via B4 Relay wrote:
> From: Alexandre MINETTE <contact@alex-min.fr>
> 
> pinctrl consumers can request states while the pinctrl core enables the
> controller. On Qualcomm pinctrl drivers this can happen before the SoC
> function list has been registered, which leaves the function table
> incomplete during state lookup.
> 
> On APQ8064 this can fail while claiming pinctrl hogs:
> 
>    apq8064-pinctrl 800000.pinctrl: invalid function ps_hold in map table
>    apq8064-pinctrl 800000.pinctrl: error claiming hogs: -22
>    apq8064-pinctrl 800000.pinctrl: could not claim hogs: -22
> 
> Register Qualcomm pinctrl with devm_pinctrl_register_and_init(), add the
> SoC pin functions, and only then enable the pinctrl device.
> 
> Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
