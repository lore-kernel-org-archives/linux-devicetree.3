Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0DC131F9A0
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 23:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783122702; cv=none; b=F8KSbgIruwyfXlWjA3sMWwtrRQ9FfyD4gREwj2z8k5Mp1u5mX7+3oqOgUGt/LFEameihfdzG4w/FKItJ7/8l6owcuh3Qhnsq96StIsMmCO2wQIkc+AR/7DyxlQeuDlBAHPjSQT0EdoNjnMgeBX1qkytuOKPNIr9MWZD6UQrvOp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783122702; c=relaxed/simple;
	bh=EbP2c34m00LQsXjfm8+3/VGxcynlauA+XFUp4EypS5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aclmin8vV0GOIqPglTFVnkurbohet1vYUx2iERrbnf6R1nqf8zbQwbK0bzkcMoSBaZ+cATvCKodxs555juQBpBOqt4I8BzrqU2izozqzUhJg2oJG44BUBvtvkszkeXWVdtFLt9hJHMm1P8VuKwNYQ+Xx6sW5sa0Lof6hCazWazU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eHLwx3pI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B86ywHyv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eHLwx3pI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B86ywHyv"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPr9U1031312
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 23:51:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=B4Q67iGHGclszaDZD6EJN7g3
	ErD13T0IW9ELkfR2bKA=; b=eHLwx3pIeA7saAohTieIP1Jbl+DKOlg+7oSotk9T
	+Nag6yniyRHYzCGEfs8T+4KXbeDmebWmOibcL2honlXLcIiolORMYakNgq8Z1u8w
	DN2moLZtMRVRU+T9yvCkVs77VQ3mgTuyC8nvGqwJS99hy4kHwymE1J9OZFhpGXxD
	Kh7IysctXCP6aQfWb1KoAQApsd+ycXFwA2urmR+diviWTr3aBQj6PFdQI7cp8MEU
	kPJ55TH4kFfqx53MPqlUKiuPS1SAy9JVZOeh9G21cxgJPG+Ef3iaxuHxiI40Alhl
	8CKNatP3ogm6WTOLmkizdzk8rAl0f2eMQkksYDOKMzHszg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f64b5c91j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 23:51:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-91ed0e140c5so180149185a.0
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 16:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783122700; x=1783727500; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B4Q67iGHGclszaDZD6EJN7g3ErD13T0IW9ELkfR2bKA=;
        b=B86ywHyvJetXF5ctHyfFh2J8tBbuwJngcLKZ5leR+Sv5RfCBhIg0wqJdSf8u3JDN9Q
         /jBmeJ+aFdWI0E36IaQikS4y7pAJ5DIqKoob47KziRUsskHtnQnlrnQrFSKJXSUd3I/Y
         PtfxoIlZnPtrSpi/R3nUZJzbGc6nHVOCj7rM78N0oKtt1PjqsQ3EcP5PZ2rp48GLD/y+
         2KRKpCGpaOGcJT5UzKltrxKbvzy7NVnOu6yDJ+pOqCfja66Pmuk9qk/J3aeZ8YWuXr/f
         NNrjDTCnGYYFJP13MvKRMdSp+rRSwFk6Fphpmcj31n3wdtdCJf6UOKSzBQ0DO7L8prZ+
         NXvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783122700; x=1783727500;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B4Q67iGHGclszaDZD6EJN7g3ErD13T0IW9ELkfR2bKA=;
        b=QozYp1teG1F/3If1ALqpTIouC8kEdozuTQRHyXaIXoB7qsIZ6SqMw7c2A1w990Th5F
         3BNR9fbp0HNIMpdfVInHzLTQyRCZZBElhOsu+/uV4rt1qhehOPHmwt6fbQkWXEdgZUfb
         5EB/TyjfTeyfN6Y0K/Ebl6qKwGPScyChP1rahdsd+jWinLHuw75s/w3EwBLgKq40wukl
         Elyyb3RpPWL5HL116DP3ttOuqF3vOoR4CF1Kz+4zb8KLGUJ6ZxmcDUUiSBifYUZ83OnX
         iv/12KKbQcH0MP1+BYXMSljSLpqrSZnU9Yf64c3ukyuMLkiki2WNN5o6CtJcSDS1OVeG
         5d0A==
X-Forwarded-Encrypted: i=1; AFNElJ9iNRFHgJULSoi62gPgnzrOf9o9dcYoA1PSXne7dfuJcYbyN8uML+kXSKU0BmCtSJVxeCwbqj31hjOl@vger.kernel.org
X-Gm-Message-State: AOJu0YxTvK8eKhIhbfdQ1bGLGWjrxiJYLB5e+PwygtrPIejDXx7H7/5e
	Eex/dypleZk9AYHuLfMnBNoe1U1oy653J6PAArPKn9WdpUApn2KSqB+OTyqtQGfxoSdO7PUychg
	988CjANgkHwEtZTnqJ1hdpp6IW44KM7fr5ZdZrPMQAFSjwOQ7foR1dvh8lnXMeFL/
X-Gm-Gg: AfdE7cle4sJ8JITPZGFmfjP8XrdHbJ3G3Uj2VY7QqEQ5jJhuwiQNCUAyNNt+PH8aoWw
	MRm7DBpSAf/llyDbIa3PnVo47NOe7GkNfKDS36n15mlVuS+NrR4fZcpaJdBp9XufIyXlSGa8Y0Z
	YvPC2v6GXxz2E3Yd/3q/eMO3XCrNG9WWnFglaJ+E36MPerIos//rODdaKDMyBuJI0l+oO98YG8q
	IBMVaNWq8kYzxRQ/TQBXPeL+RZ00LkTwULfebHbrQKTU6pNOTVH6t9dFLsmqX6ARt0wW66tHb6p
	0AFA2m4d18OUbuRWjsKSTmGusiK2H9b8F0qZHYF5Cv2XW5AUeZ3bTfXXks1sngxaNo9bzCjsE7E
	nZxDHuyhS1tQbUc4bOIOi2KBc9DyFZBK8CzjlPwpm5zc/5qq3a+aztW1IuWjGeQ9EqycE0fxx+E
	ilBjWB+9kiyEdjjM58mOiO4e4v
X-Received: by 2002:a05:620a:2629:b0:92e:675e:8ede with SMTP id af79cd13be357-92e9a362180mr224157085a.13.1783122700270;
        Fri, 03 Jul 2026 16:51:40 -0700 (PDT)
X-Received: by 2002:a05:620a:2629:b0:92e:675e:8ede with SMTP id af79cd13be357-92e9a362180mr224154285a.13.1783122699811;
        Fri, 03 Jul 2026 16:51:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b4adf5d1dsm5770601fa.27.2026.07.03.16.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 16:51:37 -0700 (PDT)
Date: Sat, 4 Jul 2026 02:51:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: Add wakeup-source property to
 usb controller
Message-ID: <ggyv6ipv2risdpv25nsqfzrj7zbydu4no4j5msf5cx75tdrfeb@rnwlgvki6wpx>
References: <20260702184511.442129-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702184511.442129-1-krishna.kurapati@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDI0MSBTYWx0ZWRfX/YZATOixEbB6
 I7vEHxuQGWF1D9A6OHoRS2MFF//YSKa0qldVmo1NHV5S/O22dUPt4ymTGMesDQzRCS7+3dcbqOY
 Hl2YoinA4Q1fMwL4F3eKtVAf8PXYBgI=
X-Authority-Analysis: v=2.4 cv=FOQrAeos c=1 sm=1 tr=0 ts=6a484b0d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=W5a9TBUDmymgAInc3kQA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: s1MLD7RLba1PNapPd_bXLFxf4E_pV14_
X-Proofpoint-GUID: s1MLD7RLba1PNapPd_bXLFxf4E_pV14_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDI0MSBTYWx0ZWRfX5wyoca35i0wz
 Yq/f222QuvKFs7Zs+KIX6/xLPyU1eybJhpqNV9Ljls4F/Jn5J2u0ECLn7WZZoqfqbTPybd8BkS1
 OcEx5oPMgaGN6o4mXYthrsNbLg2NlhAMP/ECoz2gM3DDBg/PdITInRsTK5NmLqnFTzsKMy1EzsW
 90UekLp4o9wk00jWgiJRJvE1RGlN3j+bsXiUgFaOMfa/jvMRLYTx3jlgZBBYSaTeN8lwWdS1wwq
 BJKAKZZW7H4b+0nW8G2OlwHNqLIlX2+ucpsgypMgKLYnfwKdSkRnRmbiRUWIwpJ4Cwyg5VbRgos
 iHX+nwDWzTAqpgX6EtA91kbTrH64tBwZ9RBqNiuW5r1DPrlwzG0yaTjpiuTznTUj633UiH80DpZ
 G0JAmlDhanhFuE4YutCRXxobmC9FUcKW1IvuRWlSaMyXrZpcfG5SJLg4hJ7Klov901i9WY67U4X
 qWqtrfYvuOpXbjhm86g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030241

On Fri, Jul 03, 2026 at 12:15:11AM +0530, Krishna Kurapati wrote:
> USB controller on SM8750 can be configured as a wakeup capable device.
> Add wakeup-source property indicating the same.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
