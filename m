Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D083401A14
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 09:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788427535; cv=none; b=rYDOOAqHU1l5eWMwkcqeYMiE1AjkMzPD3QR3sk0Hvj87OIUyUdCkWWT7PB1vaNdmIRuMF3NVwncMISNY2qmU9rgJdh/tfOiaqwnmt4dWIYimZPgWW6BshAT4+XP0FvuAY1xDJiYEKsAMkHB/wvDkvkVXviF44bwQPYldZCqR6KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788427535; c=relaxed/simple;
	bh=YEomMeML2cE+49xMRE46FgrabDDRLugR6xWa+LCEczI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SxJYv6TjOxZ8UlP3OQGeW343aHQMyErgkYOFjFedNc+RlG4Wl+bJMrsIM1HImgKm4Dd3ctL2X6kmhRtivF7AAWg1H1yMUMrtd/Zgjx/pQecB+Zh3lr0EXTR6cjjhFKVtjhzhXPyaMiy0y5BHqArq6MRnFs1KxA+K3NwRPncPod8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jdmFbiPk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cLltE5SQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jdmFbiPk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cLltE5SQ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683923Zt3549247
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 09:25:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h4AL3I1iVTY1lcvS7u5/OIzDF2L/Odk7CNpIPaVSYCQ=; b=jdmFbiPkU0C6fvJQ
	d323nGO3iMaryCOi6qYJW+nT90TlGpztKsy5xbJlaEkIS8K9YLVJQtPYa7d6eE55
	L5yRZIl7HVqpX48QOk6VP96x05V2RxpoOwhuN1JYtOmUjWCmd2wFlv+bRbHSaDZL
	eXT4KCbtJgus9lfAHUVqsTBNmIZOna5J8XSImd9s+J7LOx1/kQidCERLNq+LInrd
	EVEZf67NFvxNn/A8Hl9ccxS6fTg0QDu4r2McZfFCPEXpv4jAbuW9gAf/wQ1/rgqC
	ZBQFGo1q6GSF95VFjQgxb3M4ZPhMRBFrCspFMIuYmZmB1THbFLS+6FuzgGcRYVA9
	HL/X6Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf0gjsd4m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 09:25:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93821883e26so55015485a.2
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 02:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788427531; x=1789032331; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h4AL3I1iVTY1lcvS7u5/OIzDF2L/Odk7CNpIPaVSYCQ=;
        b=cLltE5SQe8aDL21Wx6dupuM27DoGW+4rqvvLcvCxnHfT4LTXpl5Z3CT4wCqlhG3aOQ
         a1uNAM42H5psfPb9BLa14/GbZwjDQphGsEZHgZIDz5cfP6kcOnYVY8Y2WkhESkiWowOd
         rKTl4p78hTu/cnPkqXWm50lwknVUa15r8h56kfoQoTYIcypIC4ru7Kn8mANi6fEPB+4s
         SaTH1tj//05s/IOVv765RLfm6L8zmnMQJ8WRGaCcOZFmJD+C+vam5iFB0Iumyv6Mm5+y
         ECuCyc6B5BEf+D0vdLwYCJX4omHcJEnyGK6Kvk8cwbahs7W3L39b2Vy5tMHYf4Mtm8IG
         OkxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788427531; x=1789032331;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h4AL3I1iVTY1lcvS7u5/OIzDF2L/Odk7CNpIPaVSYCQ=;
        b=TTiT04gh6dfwXnGkfCZZ996Ztm1WFH6qYP4PPYwTh0lKajC478Jn/Mu2WViR2bJshC
         KvFL0hfeo471LAZPKWs+B3+732mNWXOMFUaIMyw1GFDLRIixns9Bky9pZOT7RgZSxeZH
         l1NlHDUTUofs6rcWxGnyFngDoR/CWPOXScxGQuQczKCccIgnv64UzCuNVNAGp/TCJCsj
         S+/1B/y8SfUimISoiMiJ9IHZGTnV3NkZ8sxnmVL/NjXVdhn62W8qhHF7t7rXhsC/p0WS
         u5WLLyilcucYhk905C6OVM7eSndt3HWQfeRRm2+uXgMqtIb5SiVdzawGUYfU1R1QPBuf
         o3rg==
X-Gm-Message-State: AFuF++kCmxfLOSusA7v4lGI6VCWPr5bS03P8F6v11ZLMO+7qc2MCNFL6
	hPQFK/FgERnPRYKltYmcZaRGrl7d8PkQXoDDAddkWr1P/Efzo8T4LoLzOKTcrbrPm4v3/rNrpq5
	OlxIHnaYfNKo6VNm/d/CqM9xYaou3DYK7tBzoH+Dwx1+POqnAmZvmLUhtBgp2bFnu
X-Gm-Gg: AYBFou0V+p6fHSasZscv2PN4HlUF4atGWE3JlYI9MXRgG1ynFrA+weRX3L6S8S+genr
	gEH926CZMe81If73HGlxbl+NGASPwYdPpB86JgHoqBXZxLOfvSoEtaHCtiEA4R1+7iVUJsbC32X
	OZaZw9+ylmOnJyE/KgDrUTuuyY+dpJ5/Q2/HIjkie5gp13cPrV0H4yi/MmgE37m86T0Qxhgldrw
	666DPJNO8gW/GAY5+WSVozcrz+sKt2oKiiSJxbQig2OjoOb1cirVpLTwbk0ivFmFjMU12/gfvaN
	laNocSESTJVMOxiNBCV5pJjfk8dU6ZEgLu2bjpeEn+6qP7mzV93qdlN3HA4zTmzikxT/oJcJn1l
	FuWUJUUIFbjIpZBCUk85mRA==
X-Received: by 2002:a05:620a:2b46:b0:939:288a:8a30 with SMTP id af79cd13be357-939610cf0bcmr847809285a.6.1788427531238;
        Thu, 03 Sep 2026 02:25:31 -0700 (PDT)
X-Received: by 2002:a05:620a:2b46:b0:939:288a:8a30 with SMTP id af79cd13be357-939610cf0bcmr847807285a.6.1788427530904;
        Thu, 03 Sep 2026 02:25:30 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f3eecf0bsm69605966b.3.2026.09.03.02.25.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 02:25:30 -0700 (PDT)
Message-ID: <8fe6926e-723e-4051-8816-d9d5773e0a96@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 11:25:28 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: Add Retroid Pocket Nova
To: webgeek1234@gmail.com, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260829-rp-qcs8550-v3-0-198d5b2fc475@gmail.com>
 <20260829-rp-qcs8550-v3-4-198d5b2fc475@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260829-rp-qcs8550-v3-4-198d5b2fc475@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA4MCBTYWx0ZWRfX2D0wcuYJLaLy
 sRxze6v9qcVGsMiHFpb7ZQ6GlMUrPQFNPDWwS24KqXQnyDziOfg9x2FribKaHbvM0EYZzzdlnQF
 ll+qoje/+VKuiottBu4hB/bjvQq7nr08ZNKE/wzx2JEdnKiOfLdhJJ5WXgd8nEb7dooRK+MHgDF
 i44r4uTNWxwgAOSl9eCA8x1y+vkyvj67bvWB8PZSJRSK0BJCbk/v39lOirkktHBagzF4kvtgvcb
 hZc0YgWMA1EdZsz8hXA/wjnT3TFc8VRyaSrLpXY6JYachIoVXRiz7tGW3ApErEpwcz+kghiBNkw
 UGUI1jRvRxKJee4vjbSg8+sOmZ748guYUyaJGKhai0O81C2J/SMU8zNK7pWE9TzAvhvUWJC2uEC
 DDVJ5gZFiD8Vk7whtTHxr5qsKhx6oo9wixycPAOgqVFiV+IVHsnYLDZ+xxclWq4FspMO//bZaAf
 m7645yud2jUGCTJfphA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA4MCBTYWx0ZWRfX6ENBEQryAaVE
 s6hfr9KEJjXp2ftNyhVOJruLKxSEUDhfX77DcBR47YkC2V0yaFMd4p/T/GZZ3Gg0iahLcZma3C/
 PzliWHe3IFonNfmT8K/ait0ZCvJV2AA=
X-Proofpoint-GUID: 7kGJz2efxDB_fWyWtDgxYiME8fnwu3cU
X-Proofpoint-ORIG-GUID: 7kGJz2efxDB_fWyWtDgxYiME8fnwu3cU
X-Authority-Analysis: v=2.4 cv=LZ4MLDfi c=1 sm=1 tr=0 ts=6a993d0c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=ZnTXIAIJv0AbCldGE5kA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030080

On 8/29/26 9:35 PM, Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
> 
> The Retroid Pocket Nova is a high-performance Android-based handheld
> gaming console powered by the Qualcomm Snapdragon 8 Gen 2 processor
> featuring a 4.5-inch 4:3 AMOLED touchscreen.
> 
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
