Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22176360EE8
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 13:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784640299; cv=none; b=FXJ4qN/k1czTd/hlgItJqfdLjCaBRa8CFzZmzpjoQyetmp0tU54W3nz47RQlJGlwzCtoDk36YDgP/QQOBttymAIbKeL8eHw56gr5Zj3VyH4YxRhJHE+jbE41CE9i0p/wAP9tctRqXy8XPzT3wBbXPx3NdbigdVxWuXnq/S+lXLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784640299; c=relaxed/simple;
	bh=kqlUaUNg+9S7I02lfTWEP3yIC96MGDX3Wvb136tIjUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZaowPbqHWTzCkd9JW617ky1t53tkjVpjInahINQsvEo3bCBw83PtitUteW7ldML09YCMz0xcSKdG2S8u+n6h4JTKnsxX3kSNgOUlEYoYIb7Fy5Z5uWx4qsNHwOAZwoOBIirij9QNeZxVA4w4dtfFyIyiRvIiCNf8CBO04FHxxJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TRIYC/A0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h+DrD+Rg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TRIYC/A0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h+DrD+Rg"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDMPkb1352033
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 13:24:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RvV8gtZB0WCQm8Fq2A8UV/ab
	XE7LrOG1ZMiCmRexArM=; b=TRIYC/A0uDO7kga/jrJzZlGyNEX6cDqpGMHVde2Q
	MnP7rADV9I/3XAp1wWwR4CgogjW3T1D67SljUfnOhYqbFAUj/U0h7QVBTsQ2JbBx
	US5Me3dJDG5oOLdzIwh0Cd8jWoNdG8kW6uEpN20uLSzTZ1gPyC0wGiQucLyccsWg
	vbHXtitfhuC5RwCbsdB84f/vT9n7onRc2WlpPVw52krvtXvaR1WXgVMqgEokuM9K
	/rVgIoa++j6+SjnhGgaDR8dSXa3aKipLyWniT+36Hzba0oNDELqG8YGNrTKoezQ2
	QnqhkpYi2/2G2LbSP1iFuS7RdevICX7pciSrdOlOSio0qg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1es2jfp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 13:24:57 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1b4d961dso90410431cf.1
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 06:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784640296; x=1785245096; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RvV8gtZB0WCQm8Fq2A8UV/abXE7LrOG1ZMiCmRexArM=;
        b=h+DrD+RgauyNcoKe1Hz+xcQzuADEMvGTLzLr/EusQsMW3rbDq2PNrkzhV/LK7ajIx7
         9t0+E4LrZWUk3kE6cR61vupjeR6kRqMDG3USllZVTJy3TEUYF1jBaodqHseOC1NBD7eE
         hxWJMVel+iYAiuCwCr7IHKuBMJ6biooU2MccoRKie8Wmpf0Ap+Hs5jFpVS5uAi+UjWGi
         tVXHUfpha2yenBbjscBebQiKCUPuAXwFlXyZerEoshyWy1IzvgeW1taawmAdpFtZcxhm
         u7/QNqrbJ4fwXC582NIb3EGrQ/WG+lOoksN6N7N+6Clfbvjov325VOc4kPbrSg6mu1Oq
         06+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784640296; x=1785245096;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RvV8gtZB0WCQm8Fq2A8UV/abXE7LrOG1ZMiCmRexArM=;
        b=nZNwEqpu1meuEJXqi/BLnx/xx3ckFyoqiPF+ApGTIjDr/smyVaLYtAMfGJpVl57UJt
         hVRmXqUXbwPg98hfc7ItiofBWxYnv0VkwNQV3NlaeiZsHJhUulkJFvNZUxydxSJPZ9Ge
         NqawXNjo4DVW8yhqA4oxWwfgiRVahvf8uqYq1/xhKt49LEipvB6ykXlVmYQ05yvUKufD
         CX73Z0T0t+38HagnBH/ROe5gwzG/qEmkzsOvBKG03Vkw08YaEWycrQRcwSFua0jBqEGl
         HGCZVzJVwMObqWzGtzgJzjsHPv1pPjcXb9Qf59ix7lNX9lakAVaEHWlb05nrwbn66gxA
         u2mw==
X-Forwarded-Encrypted: i=1; AHgh+Rr+UcHB1R7LthoNW7Rxi95DLJico3MLq4Bj8DLluWYcj7kt9GU5pi2VLRfZpEAHsql+mmfXQqJrrP4n@vger.kernel.org
X-Gm-Message-State: AOJu0YzzWB3vLByAtDEOvHMQSpiGDbxfQwFI5O+mMDyMEExki2fW62xr
	q2Shh+qaiEqSwYrW6POmYuMh48/67z7MZmo2UmOgPRejArcPR1ijncvanVIA+5I99WCDfTWssKq
	FNmM+XQ74siIDVgpJsGeXCJFqCkCUgniRxGVoXFdqmG6ab9erm749mGHItKILK98w
X-Gm-Gg: AfdE7ck06KjmqXdlIQRIGP+U2+h2IcjCKI/zhlby82ygcE710JdK4legWM5SNSZbwXc
	EHrkHcoeOoDTkRcqTkwV/spQ4HdS5KnqAsbAX/QJ+acD3e5AeZTziPRDKqTjFzyBSGb7SeM7iB4
	Q5rUVujkal28hZHZbbIyxfpUbkolhrVicyzR0IVSeSA1PJpzsrZv5dBSEbEeR+hXgiis7sRiK+X
	dXCCT0dvy9opk1hOlFwykIEuE7WyoSqrHBHekCZmJWaFGTNFTstJ1uPR55+81FmA3kR56kipIRR
	94hftTTHnBHRV50RYChPRbyO0TUqgSBkIwv3DZev8040Fz+2STvLzg7kqN48ViEI7xQUeVtTHJk
	0l8prxVPv/LRMIPDIjoQzKQUKSAioy05llFzYmzGGx//GfuiqpckLahXBo8STkVo8d4bNY2CNVF
	XR1pB2fAxVBrC4zA==
X-Received: by 2002:ac8:5d4f:0:b0:51c:f8f:130 with SMTP id d75a77b69052e-51fc1f58216mr222387801cf.39.1784640296374;
        Tue, 21 Jul 2026 06:24:56 -0700 (PDT)
X-Received: by 2002:ac8:5d4f:0:b0:51c:f8f:130 with SMTP id d75a77b69052e-51fc1f58216mr222387371cf.39.1784640295901;
        Tue, 21 Jul 2026 06:24:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b291e0eb4bsm2883547e87.46.2026.07.21.06.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 06:24:54 -0700 (PDT)
Date: Tue, 21 Jul 2026 16:24:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        jishnu.prakash@oss.qualcomm.com
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: shikra: add vph_pwr and fix
 supply parent mappings
Message-ID: <wqibfckpvyjlcc7h3iizeovzchyfwg4q56uhlvzufpac4jtpc5@gsrv5hzesujo>
References: <20260720-pm2250-fix-supply-parent-v2-0-60ca47031b50@oss.qualcomm.com>
 <20260720-pm2250-fix-supply-parent-v2-3-60ca47031b50@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720-pm2250-fix-supply-parent-v2-3-60ca47031b50@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=SPZykuvH c=1 sm=1 tr=0 ts=6a5f7329 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=74fUUoaEURcX_QxnTv0A:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: SRE4n-B1UjsqffTTbw-rX3Tza_7phAXz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE0MiBTYWx0ZWRfXxzYpaWCg8QRd
 stzSSO4eXm0AeNJEtrRJIidq9AnpiAp5giB2CvnFOYcfAou198aeGFyynrJDov+aGfoWCEJlg+Q
 1B/CTfGFOqHDZfYGGjEaAxSmKsUNsNgPCQB2Vjk6zloEjEDoNixQmAaUXCRlsuK+qDeuhtUBwsX
 9ZjeblZoPnJNvc1DqlFFzKx2yUKqvxE+sTsvap1bB9YMqr17Fkvbwb2fhx6RsSXEegOfdeUMkXV
 Lo3d4415D/gngMXkui04Bq5PjWePdclP7yCk2PxeMCez2lBBIB34Xcm7VHVIP45LfPCRKYYvmQ1
 isZvSV6H1VTn/ypCC2bAkhojoCmkOnvB/iwFj7NcrRlbNKYkj4+AE45upZSXq+pd2IXfn1f5AxW
 8FC6uSxvBWaHUHlqNVSPAtySDbfaUSxuEv4hYpvoPJy0L6DDe5nlb3a9FgLFvQkZ/qiwyJyAeET
 Re7+bbW0rt/LlgLGUvQ==
X-Proofpoint-ORIG-GUID: SRE4n-B1UjsqffTTbw-rX3Tza_7phAXz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE0MiBTYWx0ZWRfXzhnI8n7VYD+B
 liQv+ykbHf+q22Py56lD9TzneIBDFka9sy1oStV/dlSthwIMpKFezYMwXPIO3nXpQ+cSenlnwCp
 lA4HYeh8xc9HQXgP1wa0buR6kiW9y1Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_02,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210142

On Mon, Jul 20, 2026 at 04:25:06PM +0530, Rakesh Kota wrote:
> Add the vph_pwr fixed regulator representing the PM4125 charger output
> supplied by VBAT, and add the correct per-group supply properties
> matching the actual PM4125 pin connections on Shikra. Also add the
> pm4125_s1 and pm4125_s4 regulator nodes.

Why? Don't describe patch contents. Describe reasons for the change.

> 
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 33 ++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 

-- 
With best wishes
Dmitry
