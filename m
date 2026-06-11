Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE423D904F
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 20:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781209781; cv=none; b=RHEB7qMwIjaQw1htmgVbdhoIXAChnEp3Bq6KlsIjqzoJ7i3i8S1EvzPV37jHoq/b9GEATynF7R3XSyBP/H+c6ABcANhZhKZsrbaj+ZepWEOqhCEVCelvFFj2qRxV3BpXvAu7TYYD6OF9SL5BTcvWk3MfbyQlTrXmQ+hC33UgfPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781209781; c=relaxed/simple;
	bh=m+/eIP/iZqCQ25AHq3ghtjO6/bympRBRl/5in5GXNYA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SgpV5WYNUGJPB5LEOT5xmUVBrePzx0R0itFvnECn1SGc0psQxRRgUz2i3nthN0fzpliUOAKx6jHsRnncCr4vmMw7lT78SpXt7om5o0Nmwb1g99xvxa2/n3JXNicd3HiJvLZfSnhtc8jRKXtDEdPmtCw3ePlAcMZlVcKdnnTDErs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RfqH4yUx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iqVBp2Ov; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RfqH4yUx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iqVBp2Ov"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BJ3IDI1388721
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 20:29:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=E+n6OykwlWa3y9hV6D4SEm/4
	WsH2rqp1lyg+6Q6ORg4=; b=RfqH4yUx0e3iufatKRmceB9KDLqFY5qsuDp15f7F
	8hQRGCQf09WBsz9jrbPYBtI3PrYMtT0RI9dKFrIQ1EGei+wkBL2/UwdarRFmOeNZ
	TCArQru85AsxRiGSLfhOKfbv+46NdM0/FgOto6t9pP0grHAkpST8JNQJLuAOYsqo
	LPNM9BbVJqQ0WM0Ub8XBifiBzqt7jHJ3QwUdwEWhu994gYs9EDgAkeez7APbx0SQ
	WiodBQ9LvmtaHk3VG2g4UM8VKuOTAHUZfT+E3Pxr/LFc0KdrqoYqQW6Ge3IljA7L
	JwkvLJSLAPnBCI61U4v3FG5E3WcaMDDRQsyMOW8Ua59m+Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er1658uqb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 20:29:38 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5175aa1a54bso3643611cf.1
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 13:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781209777; x=1781814577; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E+n6OykwlWa3y9hV6D4SEm/4WsH2rqp1lyg+6Q6ORg4=;
        b=iqVBp2OvDy7ObHfMWYs2mOzlOHIpl2hRZ54RKe+JuEq+mdq8LlulSPohcW2JaGGoWI
         Q/ZY4dg9FtSgw3oEEdaFgHPLUEipFGnrFBT5Dph4wVSYtBZbmRooSdmJUu6DJyxh45YN
         x3SFohkwvmIRen2slcUeJD4cXhkl0owjEoV8aSbeG1Tyo6OG8/MSZR5IEfRbKR+1T5m0
         sOqJO8/MkARBOeNkALBfPGiTylSU6WqHUuM7lHTSxYYdQWbKtwC75KGEk9BG7MHD9PLX
         v7UBCGPkPNRmx4ZmSbHlCvjk7Ge2RkDxNlS4RnUN63PRV/V2/gaX/1R8xzPqjiw6zoZ1
         k+9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781209777; x=1781814577;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E+n6OykwlWa3y9hV6D4SEm/4WsH2rqp1lyg+6Q6ORg4=;
        b=RsLUtybOckvowrWJSyOsfm5P3qtEj4CO40S/efq7YEFnXtuhZQpAmRXdUFNobWANp5
         zRIKTv6xzStqlnwSivXHT9Zmer7XVcq06+lS283fL/R0ked+uor5h43dLCkpJL1wLCDQ
         POfFeOA+JEnka0vM1cunG4poTuB783SqDeDLusRSxk0+7TkrABGvhnQZEgD7NE0PpWoQ
         TcwnbLUxBmLu91NqSxBpqAH02WsktMgsB468NGHCmq1TZOsScVouD1Y1UCMN/Bw/Ynvo
         5svomRLqqB261Pb0AcAWRluen8xuJ/EWJJk++Zjozzdfuy/5krCYVLfaYPcjSG1e/UwT
         R2Xw==
X-Forwarded-Encrypted: i=1; AFNElJ89XJWJxeroxRQMec1w8Y4oqX+IzMC84DONjZYYAoXM8EJU6ahFzJThpeXqySa/v5mzcj1RdCQdWM9k@vger.kernel.org
X-Gm-Message-State: AOJu0YwDvQ00x0NCMD5415EKYXQJF/da/vknaU5XngAFje+n5qCtJGDv
	9JybLcQIvg4q5nz9P6ji9SJAe2I/uqchTawAOHalGVWhPMuqLrTmRZqdcoGVznZAPptYc1jzJLe
	sj0lmxMqUn4Ztm/ElO8Rjz9uo5W12jkBrQuuhvUJ4ET1+jsbgtUaMSH3XI5GqNnLV
X-Gm-Gg: Acq92OHH7CFH+G+clBLs0qtgVxnPhVL3Ff0xelS49NjJuJYplpVSMMFz2P9MuO5bhS8
	iIcZYhvvqYBhVCh2J5d/W03VVablV4tnp4jd4fxx9iBLo1Gf/t1l+8lGk45S5tQjF8R7HG7REk3
	ZIuyGJvLNKsH1m0O3bGe7N6LPjyO8BlM4BHs+zivhG5bPxDFTA8bjVdXYFDFr0uGhY61ZY2vL4p
	T/uPLadMm6bVgxPAY5voIV5kU0FdY79fNfKlYISae3x3NCErVtGs29Fgjv5FTrQEWtCnjfwk6nZ
	GwO3Sbia7EqY1IcknyNja9+gyafMep9PrL+YkkWiMmCKF7LHzySaNlrRHhK9Mz5FixkXv8OIvlR
	inuDGEywqCu1AhcwEVhVXnJsPV/mMnr5IEwdBcOyEWsBzvCa76JJ1okWNcIBBJirO047eI226bj
	CxogzdSY5TbrQe69lrHpQLvA6M12pUFqMZ9ig=
X-Received: by 2002:a05:622a:1449:b0:517:6631:101b with SMTP id d75a77b69052e-517ee262cb5mr67946531cf.55.1781209777177;
        Thu, 11 Jun 2026 13:29:37 -0700 (PDT)
X-Received: by 2002:a05:622a:1449:b0:517:6631:101b with SMTP id d75a77b69052e-517ee262cb5mr67946101cf.55.1781209776626;
        Thu, 11 Jun 2026 13:29:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2cd8deddsm120009e87.66.2026.06.11.13.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 13:29:35 -0700 (PDT)
Date: Thu, 11 Jun 2026 23:29:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] pinctrl: qcom: spmi-gpio: Add PMG1110 GPIO support
Message-ID: <o7bgynyqnp3qyiakwckhm2d45zoxdrcqdsruy5huuk2p3itzxu@s4ceq37y22n6>
References: <20260610-pmg1110-gpio-v1-0-a9c50cd8b5d9@oss.qualcomm.com>
 <20260610-pmg1110-gpio-v1-2-a9c50cd8b5d9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610-pmg1110-gpio-v1-2-a9c50cd8b5d9@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDIwNiBTYWx0ZWRfX/soaN0IAE1Wx
 pMXck6HoNbjpEm+LCSSeRIYiRqAd7xyDc1COuL7apQsnqO08MWB6s6HQQKlb4ZDtm3ce8hpt5Ku
 LxlpEmIr8GjIUpkxFQ4qBfBfeiHL0bBy8QsVKPZ51QoCPG7/wKyLsbbuf1YFaBvHXXu4F+5s9Gk
 C69sGLv5QGjN/FA4j9ObEO/uMU1YSzSu1Qv1uO4GUUwtOrfTLrLgolFR/4Ra3qj55IdX2BFlEj8
 8A9K9vie9BCyWYVAhd5lrYZnDhnAVj3tsgY/PT1pkhXbBcYNdL/7RLWidZzuU1yYL/uignwoJx7
 Cn828iM8MsIV0DD5ZU21a7kZ88yoWeyD2U48b3fNoIFllI6n5HgWK5Ln+eifF6OJqUzvoB1OQew
 EzTN4/1F1T3pWm4X9jUP6GyH3Y4PdHPyb7KCz05CEUWekEEI4Qcb0/VtNM9MtVr6VI0ym6b1f0+
 WmDL1ZtLdagsL9TKu6Q==
X-Authority-Analysis: v=2.4 cv=LNpWhpW9 c=1 sm=1 tr=0 ts=6a2b1ab2 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=cwZfksdCj6gr6i6M9HUA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: ykUWAwS8Blb9e7FgyB8a1w09TZn2yoJm
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDIwNiBTYWx0ZWRfXzLyPkGbMSK8I
 WYN1N31u1nETMsYHziIvtwWmSzO/UvOnFxv6qu/WRb0WYtXfUUcoQ/J75ertH37D+RJT1/Ltvw2
 /X/J0VhGqfAPOnDWbsEAbb72Gl2L5pY=
X-Proofpoint-GUID: ykUWAwS8Blb9e7FgyB8a1w09TZn2yoJm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110206

On Wed, Jun 10, 2026 at 12:05:47AM -0700, Fenglin Wu wrote:
> Add PMG1110 GPIO support with its compatible string and match data.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
