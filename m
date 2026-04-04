Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DE812D1F1
	for <devicetree@vger.kernel.org>; Sat,  4 Apr 2026 21:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775339871; cv=none; b=sBEyqa3i+w7Ak4AFNLmfxZErsnVN6dO3Trv1xTSNg3IX/Qj87D/FPXcFMgxYonwRJVVfDxMZ9EeWO8uCb75cEY71+8CAXZNddEbGuYljyjOzo0El55Uhk+FM40K0lMYdSVf0ATrHHYL7zi4wQ41YYUzcCGtoLUlyGTBChc6GKtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775339871; c=relaxed/simple;
	bh=4Cb+joQkb4aMBvTx1AuL5JJ4lUB1Yjca2gHJBvl+eqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=enhyEkfEIqPT8xKzlBalq57jlJFaQH+s83cZ4RkCe3Wj/45RANTP4ZL1LxM0EtnupAGG+XqyJmoYlLc7N+5MP4ZVvzyErPwLzzUSSStViM6TVvNyTKhs+pU97wEFhAsllZkeFPSLDUUbHphiBavmVsQ8D4J/hbPdQuA0kmDo4xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iKEirlY4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=azVUyMpa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iKEirlY4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="azVUyMpa"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 634Fx5bp1417136
	for <devicetree@vger.kernel.org>; Sat, 4 Apr 2026 21:57:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ElmZ7iJb0cInL3gMdYY09UVw
	xjBUS65tHjlxby6xRGQ=; b=iKEirlY47e/C7JboreWhr/r/twR6Jqyrb8pQurQE
	NIwd/T3s/U01EcSNN4LFKK4QS/c9oyQ9b7Ezs2qhdi1lkAkIjIivHQUiHMOqTGm3
	LzySn5sQOLNqXjr+xJAEzvMPGxJLWOEGKaiU23U77e+FZ4hKubGfC1b4yifYQkkJ
	nq3/sq5R/AmGV/RCP18k55DpnWp5BiVmYxp3o1JfSuMW1GNgiUEyJOxkFAf5h+hz
	FJrwWBvTcbmc/RoyxYYqRDQkDtGC9zbNzHDvSxRq14mDCLov86SDhdJynjiLR9OC
	+Pms20qCqVgrk9Eo3Tqe/0EyNc6jeR6lgishx5pWn43ZXw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dasyfhmhq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 21:57:48 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5094741c1c1so9875791cf.1
        for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 14:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775339868; x=1775944668; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ElmZ7iJb0cInL3gMdYY09UVwxjBUS65tHjlxby6xRGQ=;
        b=azVUyMpair5mSJOGXh/d71RsNamziEOTD4Ui/NR7mbywExbGWhWWEg65z/ik/x6UF3
         +GFaTniD1kDFrP7oFRPIEQPHv/smPHHKLRlzWMA+HdM96bJTzO5KSls1tH5qrse4nedU
         aoAv18gmhokUfyGn7m7vna53QEBIsb0xUBc7ZicAiOIFZHZbtSzNnsdgr2JyJ0uzFKch
         T7C/04ebWCFbioVWaHuAAneUmo/qnn4XNWB4sHtamKrK3En8Gy6toorDCy3nzV/J1Z8+
         Nv1EwTnept6/NPo3HhiMNYXtKkN4+dxV8FH4KXnfPuFWFi1RzSVZtG7PdmvWzLu1AkXm
         cdyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775339868; x=1775944668;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ElmZ7iJb0cInL3gMdYY09UVwxjBUS65tHjlxby6xRGQ=;
        b=SCYqeK0RPRaIHchQxi0nbRcvcZD1LdVOf9Zg6Vx43Ad+kCmiExkSxsZYF0ZgJws7X+
         BBH4ioDGa9v/gW7M5q+9TQ3Dfq1alo1NCIGOqjbMf+ZLlSwHkRmQZgoZvKdcFI0ABs0Y
         DDVunOdZYJlH2CF9xpQD3ZdX9cGpsJ/kdVXMbi22TpU5x9c6XPrAYwNfHLi6T0k6L6ek
         dIwrLH+gjUz/4U9HsgMApP09jL8QUEMicIkzJz3/AzOWYR8FPbhQautKMdM+Z9NlFTYV
         ogPQ6+yGh1Pg4/oA/7XVCqnAD91+ozwRq38liJruwsP33cXZXwtdjiJyIiNz0k1o+2Yi
         VYNg==
X-Forwarded-Encrypted: i=1; AJvYcCWUpwXeWSfstrZywx2pov5znuIlFF3hw5f1HqHNnBNnCx5ZEeJvGFmqWDRD4uTIcy8AawAeqBNaUG6o@vger.kernel.org
X-Gm-Message-State: AOJu0YyOf1AJMhqCronxFGa5PxBfiaYIkc91y5q6qoh+jZ2wXmHKBtVI
	uvYO31D646+pfC/ZDak8nrT2IM1fvePO4gKGdD7NiHg1n7GmGuNqTq2nirWre1S3qAvvvEQnFOw
	vMNJXzQgoADp9b8fT+Hx4oMxpeCNP0TKsFyy/g/wznYXCEQhvxOa5wpDVOE+4ORPo
X-Gm-Gg: AeBDietweSSYbs0iBFQp1uBlXiThLaoV6uGv7b1CnRcSiMcwOKCfyHbl9jzFLL//gl8
	d7qF2Po5ug9FFMQ3nFyADYb3cIW511Uf0pmP0qNFeYOeV30e2tFHHQcRxIqlMuIhrCGK+9br9ut
	lpLHxCT8DIQ66D8t7NZV42p4wSLF9pMTwH3R/dliWWRj+5lRH3nDB1QRy4UFS1z6GKFAAQ0pbNL
	H0V4cvcn0QKpOotxtSn+nYy1beZF03rQb3YrnFeu8VJ1hriwIVF8rFHVe4VDqEf7+3VmZx6QTMJ
	S5HC9rml5A3wNiTnSiiLBRr6X9GPXSAwDjP/Ulg6/KDkmVlvDjtPW6t9Kk/rOhS7qP5bODo5Q+G
	4sD1dwDPWBo9zB/5fr3WZS4xPDHYEfPeRAloDXlIScwi5WQvnBOgBBigti86WLWYlQQhjIfKkB+
	ahQjIkNUI1Abaxvxz9k5L38EA9CHd5GuurMAI=
X-Received: by 2002:ac8:7f07:0:b0:50b:526c:541c with SMTP id d75a77b69052e-50d62d0f97dmr120363261cf.50.1775339868196;
        Sat, 04 Apr 2026 14:57:48 -0700 (PDT)
X-Received: by 2002:ac8:7f07:0:b0:50b:526c:541c with SMTP id d75a77b69052e-50d62d0f97dmr120362871cf.50.1775339867784;
        Sat, 04 Apr 2026 14:57:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd1fffb53sm20787601fa.16.2026.04.04.14.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 14:57:45 -0700 (PDT)
Date: Sun, 5 Apr 2026 00:57:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFC v2 6/6] arm64: dts: qcom: milos: Add Adreno 810 GPU
 and GMU nodes
Message-ID: <ahv2d5zmbh7s5t7uu3s3kepkv3ecpxukfqy7hqnzjd3qhuaw4n@bpprcym53jce>
References: <20260402-adreno-810-v2-0-ce337ca87a9e@pm.me>
 <20260402-adreno-810-v2-6-ce337ca87a9e@pm.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402-adreno-810-v2-6-ce337ca87a9e@pm.me>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDIxMCBTYWx0ZWRfX5PcI14x7mEk9
 1O7RfQWeMhTW85pnP5iRW5nNHnICb/jzvU4zp6H/8BGcSc1RWRkZdgR91yEoGFq9AsrTS9FG6RL
 h5rruWNz33MwyVZffCe0XEGLe1DMgUYwmqo/+9yYE27CiQnXIqlQ3gUquWJgvOPiBTVIkQCygWx
 Mf4UuykFVMo58wJAuk7E2KynvizXMNsesOxQXZzuML8dhwdg4Wg1VCppv9io7yyB2uBF9iSeael
 JmxR5A4FIl6InK+zk6qC+sl/soiCbw9B8c5XEgVmQkf9UgClKEACaKmh7lS78pDTqySHHSFIYX/
 5nh6cRqhz2CN0FGtPb2BgKS4OH+Hf6RtJESj2C136u0NZucVhyOF9SIBKiTk9AhOZ/jqVZM7A40
 n/suR2FLSkVplQJW7QsA+EFN99HefezzaQwYMNo7JWLgiyh1MCQEJczCnWxpTurhG069FTxjRZj
 pu8k/9OrtfAQZUhT3BQ==
X-Authority-Analysis: v=2.4 cv=U5qfzOru c=1 sm=1 tr=0 ts=69d1895c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=REw7ijk5hhyOG_fLH2gA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: ek30zwzWbE7rjQkxqnHQB2yYRuFxuzTk
X-Proofpoint-GUID: ek30zwzWbE7rjQkxqnHQB2yYRuFxuzTk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 clxscore=1015 spamscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604040210

On Thu, Apr 02, 2026 at 11:09:52PM +0000, Alexander Koskovich wrote:
> Add GPU and GMU devicetree nodes for the Adreno 810 GPU found on
> Qualcomm SM7635 (Milos) based devices.
> 
> The qcom,kaanapali-gxclkctl.h header can be reused here because
> Milos uses the same driver and the GX_CLKCTL_GX_GDSC definition
> is identical.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  arch/arm64/boot/dts/qcom/milos.dtsi | 148 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 148 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
