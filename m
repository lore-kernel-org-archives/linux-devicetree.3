Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE01A47A0CD
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 14:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783002666; cv=none; b=d5JxFv94vA8SuoFt8yQEG6/a/bnoq5d8v2Q9N5k8+b3j/svq6ppJXNrF8ArCNwURJmEfoGdzNaN2hkJH8nwH788R/0oiv1V/FiIF+rZGaie3JW2V31L3yLkk4FyKAfR5wBbwjD+2P4x932T07pGmEH8GR0O8Tp8iEZvy2R+uUs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783002666; c=relaxed/simple;
	bh=X7/OY0uc8QQRq8hA1qS/ZiNO2VD2dV/hohJiKt6Gka8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qWCVwZ/4ESM/G54ylCp7HFJZTDtprySw8lAGvmi24BziZX/LXOU+WEaBpiu/5nC3cBx8DLsgXVy/qMYBRnsgZvq5bOY0E0a8Z8pYqxgyYaNiHlrEvLq6NPHhRBo//+zWAn/Id4OdubG+xr/04bQrlDqlhVK0GLfdfralG3TMuvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L3Ydypxv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aPqIrRYq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L3Ydypxv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aPqIrRYq"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662E3G6e662950
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 14:31:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+WbSzJRTopQtkFBiLx53E466
	EVyAa7ijFkAM1VDlJXM=; b=L3Ydypxv9ZMSqtL94sjl0hz9+dB/BhozR8f0DMl3
	cb8aRaScjKqT/SGPO17SP4BqJLp8DhBMLnNyjWL2tkLNohRk9Gh2W/CA02ySLCr2
	QVciuHBARSwQf0KkBFBKQOFg2aNuNsVJbhywnpvaxvgH2BKfBdFTiyaunLuY1bB0
	De/nk3N3UaW/8opf3PtFCStzSJYlxW3EdGJrRpJicUnq0CtSpJIzVYF1u+BOrlDP
	kij5Fzgg6QvMdj2WHJRiSkFho0BHHZ/jdovbt+SOFuCJw56rm5Ow8bD7mFK9+Uz7
	Ed7QOIHTbkqpHc0+24Fl/wmIegFJ1Lfj1S7fnmP2FNMI6A==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5qfc0nhg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 14:31:00 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7382fc429f6so2013791137.2
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 07:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783002660; x=1783607460; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+WbSzJRTopQtkFBiLx53E466EVyAa7ijFkAM1VDlJXM=;
        b=aPqIrRYqGkOvTSk6Vfzz6qDxpl9pOs+sVyO9oo5vspg9kp0U6rQzlX31zfeiMUccjQ
         5vuj4YQMCDDVnXf6fYIDq4j/0nLTqytHdAaox+P0QijB3TmhhcaHXJKMVXv2EZ53keRw
         lEEfiyYJiGeRtAQVNRiZiNTf9bkwTDshm2g89KoR+0ay2qkQU3au8Ad9OH0FDnX1bWoR
         TbWAXM8FSemdLqrj98ly22W7nb5Km3FMfKWaXUcc5j3kX0D3dszS3Ye6YAVQF9/LEE+7
         DBVAXR3w8Tlabbx2RG+pNh3iC5HvM638XSC/MD4JpIIYjYcM5Gmk0e3FQzBRZxE/76eM
         mZyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783002660; x=1783607460;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+WbSzJRTopQtkFBiLx53E466EVyAa7ijFkAM1VDlJXM=;
        b=fYNVh4S9OnxqVe461bHCeV3PqEVs0XbscgQ0JnrI+pPMxdjiTnxzGkuYkCdBAAkDkY
         w1XGVeO6zoUv8JXht3JZLNdCirLG01QD/fTSgFRFOUlq0KpUZQJAJOLURCBQ7evAAlVy
         iMvOiTSd1j/DQxTzD3e2ZVjtjuQtWpZfZmNk+om4QAsM3tOUk0XSDha+SsMBlN0yvRut
         56GAXBbLVlH9IUN+TqrJiNy1D1w75hobMoIdVBhbh4+Kyk4EUaDEsySa7HMcQ+LjRuli
         AgiEoG3DNnt7Y0guJvvu9XjqN28Yaq4W9KIgbq406R2zn09+1FVSuFlO1s27F+Hhm3DR
         VVPA==
X-Forwarded-Encrypted: i=1; AHgh+RpqfaEPmimbIeu3RCy46HTw6ZonPwMHezngPmm00pkBV4N3ncm1st+NZ43AYm5mhNxUT9pVjeumm2IT@vger.kernel.org
X-Gm-Message-State: AOJu0YxtstbyMs1w9sYV8J7kD1l9Mb6cHlYk2jnRSKzZjt9feoPSJzrf
	nhCg35OARTdG+gTUTNOW/n+/VSGNW79cMBdKaCW3fSO33VJplqexyZcThUWo4K/3kzUVSkLrfJn
	MAgDOzvlIwKgjUW/z4SFVVvFjbQLdNA1ltninh7nbIQWsuNYMKF9sPsug29KzNqfb
X-Gm-Gg: AfdE7cnGy79a9orqVSJXJ5qaoMXFto8F9dOrjBMrvr2a7nJ700VaQnaVJhStifim70d
	PZXB+t1miUG5v9TcgZttuT/QpPEVxLqc8+wkBfCxaSrDm5Dr3D8TybFBj1skUQP98D1m3hxjVf1
	hRJ/OmAL5MUrozW07tsgn9753MFbuklnZ3Ncs/aNIQorxqDN6c2JOzlvjhWzpw/+XqRrNIcCsh7
	PEbUtRr3K9EBSxnroomc4f1mtjkFVAxkKCbuZhfUTMUmimQ/DMu2ErRtdyD/HOmnxdsMu7Xgonr
	4IS+mlbZDw3SCB9aIAnAABhU/fTBcANRjw1GMWq4/9A2htiqw2+JZsHb/fzY7X+1dBsv888ZARP
	ZrOb/UA7CZZip5CyIhaGN7LB0eltX+BV0QYPFNjgi/NoaILXUURQbhORVNrZV79J8c2FAP71Zeu
	RAeAplUVUpsiHCeUUV7/S6RUkr
X-Received: by 2002:a05:6102:54a0:b0:738:fd01:5b60 with SMTP id ada2fe7eead31-73da7583d17mr3060402137.3.1783002659701;
        Thu, 02 Jul 2026 07:30:59 -0700 (PDT)
X-Received: by 2002:a05:6102:54a0:b0:738:fd01:5b60 with SMTP id ada2fe7eead31-73da7583d17mr3060359137.3.1783002659263;
        Thu, 02 Jul 2026 07:30:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aec8991ad1sm711202e87.10.2026.07.02.07.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 07:30:58 -0700 (PDT)
Date: Thu, 2 Jul 2026 17:30:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sc8280xp-crd: Fix the pin index
 for misc_3p3_reg_en
Message-ID: <cpee7ndhnudjj22eh5qbgzvhn46wsfdrkuldl4arivh4srub6f@ypi2nrsqe6ei>
References: <20260701-topic-8280crd_fixups-v1-0-3fe92ee9636b@oss.qualcomm.com>
 <20260701-topic-8280crd_fixups-v1-2-3fe92ee9636b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701-topic-8280crd_fixups-v1-2-3fe92ee9636b@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: U9MlYbz4rOUj828XxTU8QqlMLqQFm6Og
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE1MSBTYWx0ZWRfX8vMxTmHy6G69
 cYSxBvKE84wHvwRXefXMRy5iByddyJIUXqLVYEnupSqNlr4AJOhCqeWBZpEHm2OThiK2sRoVdOy
 rgxhkqXynZ3EN2zvuc9JtMXGJWhwppSMdi5erThQ8zjXFZQNMRbpXCMnOo4+MpChdW83ezPgALZ
 8Uf59QFQ3b6hMwG97gT95id5P8bACQm8Cm3u+tEz2dx0n8KUeywDmWjpnBRDj04BUr3cxFdKKSU
 k4brwqj6yhK1rsTos5yMHfyZDZKSEwM7ydPdUtj7/P+2oks6jizOmuMLAx3bEDoINqtgzflg0/6
 Sp9bSXi1paKZmcMXPgwADclxvPHRQBhs7SeH+I/GVw6vMvP2UBamhaSBCjT+9QWzP/9wX69nUjQ
 YL+d94otMczhugaCIKV+FGJDkMU/TF/K3ShLK2ERydPOHbDkuHKg8A3nlv0cmuN/J6kF9ibL0Oo
 EGaDa5eHcjH5IYVQjqg==
X-Authority-Analysis: v=2.4 cv=dvXrzVg4 c=1 sm=1 tr=0 ts=6a467624 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=Q6JVsqLeH8sYZwotHTEA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: U9MlYbz4rOUj828XxTU8QqlMLqQFm6Og
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE1MSBTYWx0ZWRfX9Y17e3E+uXFq
 MfDePRrR1GG2tqLDh8l0w6JHdC0edvQQYW94FKi7PYEH3IdWr25CVcukmnyjgEvOin07t2nGByo
 u2UHeppZctd8pzL717uAIHzes/PqQXA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020151

On Wed, Jul 01, 2026 at 05:43:16PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The correct pin is GPIO1. Fix it.
> 
> Fixes: ccd3517faf18 ("arm64: dts: qcom: sc8280xp: Add reference device")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sc8280xp-crd.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
