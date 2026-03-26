Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A254A322A00
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 04:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774498321; cv=none; b=CxLOWIJZZYsktGRokA2sFTCRge4KHxWKNFRlldqLgiYputIgW2t+yA1hviZdio66zyr/EecxWJmxw2fd5pBCFg+i5KJIPxu3BKgfT8A1lYKN+h+hNka78xH76OGQnAh2W1cQ6kGivH4Jhgp9S7OQOzdNYlum2kbxPOp4PdMaI5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774498321; c=relaxed/simple;
	bh=DhozAv8vNnPSYtw8TLmWK2PoxiA/RC68tK137a0UTFg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CKjt7PVtGHervu0i2HTWdz0DoTHx2ITZ4VHPsKQ3I2B4osRhMQm6/S2O3+6LAvojMKgxxxzKlgsqPTtnrOlFv0rgaEYLX553ajQaDqrRJORA91y+JiqH/mzEeCdKN62swEMXtebgaW6yaYfnuCve4fjUSkWW49U12YsNcUIeZos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kiQOC7Fk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dalTUAIR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kiQOC7Fk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dalTUAIR"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PKwQ971175823
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 04:12:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6GpiHe3XS5xXF/sNBIMhZaAB
	WOl410Ff3QfC2wAxaSw=; b=kiQOC7FkB/YaOu6tDgica+57VcKzapzZSUmIduHZ
	+MaHytm4pwsrwOsJ5PpGS+H0FGwRXPHPqenwjN1UQ7oR7+PWCXwalD6S7CvqjyDu
	v2aWM/DNfrZ2e5hHYbnoBCKih57AW40g7Ca0BxXFGPGcD6zjAIXH9Tk75zA3pK0N
	5xMZ9Emd2L6iE/S/TxUjchwlGasI5CtyaGxQrhqMbmbR50sPYzrVG8UfPkgim8hs
	pFWXM+/8XqcAccss8wZj6Yaw49hZNZkmfxzZenYgfZMc2Gpet4Ic8QVK3afkE9ZW
	Nj7BA49E/R1BRVr0xdADvkupmnSnA+KvHSuYGB9lFpmHqA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4q76s3pw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 04:11:59 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5094ba09affso16086631cf.2
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 21:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774498319; x=1775103119; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6GpiHe3XS5xXF/sNBIMhZaABWOl410Ff3QfC2wAxaSw=;
        b=dalTUAIR+bxVWPvjnPB5JKx8u6prIMWq/Q0p4x6ryy6BbtsJYuhhDOdjXL0Tqj7n2n
         6sKb5dyny9cngoE/zzGPeJB1vAAf/1dfIxzSM0Ynm5rGsVtkgJawsZFBWmGo4w/8FQd1
         56p0Bj4jR0+/CBcRoJsgm5/4Ragq7cgS+EwRS/z0RYpWTECrCKzU7fU5sE86XomxZQz5
         dCjFIqDQXnl9VyprYOo84+8BJr7g+gNCfFbDMXzkNIoorQrjnI0/hRGxU3ECzOUt08Lz
         VVTfgBT76644S+NUJht4CjjaBl+/NIvOVxzJV88Kue6yD0SsN6W94O57aAsfm2E36EY0
         99Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774498319; x=1775103119;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6GpiHe3XS5xXF/sNBIMhZaABWOl410Ff3QfC2wAxaSw=;
        b=Npxqk2QjBGCKQD9kIypvMeEvKXC92qj9VS+W4EBdGDo0Sw1YDj36o48CkBb6nA3MuN
         uHPeFtu3XcuD0tyJNoqZhVp8fOZobcrBW0vOet0VGBH7xzBRew7Ht0TGZmpfI9T8ibL9
         LVljiLRrfrZbjVbyn5vDjmgrew9F2RtJRtwyrw3nvks51pSJDM0FdhBUsPNsOzRwZK1H
         xb5ejUSYL2bTBHUfgf689S4r1MGJ6KMlGWIKtgjpAZXZ4jnWdNEj8B8x3tCHqkvs9t4Y
         iZgZI7putSAAlOwKjwrIwxxk1R6bkF37OR867yvV4zrRpcfqbNsSBTH8r6Y4G7ec7kVG
         oqxw==
X-Forwarded-Encrypted: i=1; AJvYcCU/uV8IJvKmv9va3oFDou1iLWuOGpkdaJ52cmHfy7W+eikSSDhF7INMbqR2kXTWksMEFxULJ2W2NLv8@vger.kernel.org
X-Gm-Message-State: AOJu0Yx79HAwp4ol1InHjHl1JOfbnGrj4RclOu37B/b8OoZhqL2TYua8
	VVUcf/rcQXMZcg1AoClS5uHeH2Ke78HzbkFXqkX3SRWUoiU+oZzh+KZQ5se4JZtxZ1zrKFdb/MF
	mc0QkhH2i4rhpSf6+0M0LUj9IIh8/NiGnKUMPSltHbZILPdx+MUTaR/9UZ+DPOcDb
X-Gm-Gg: ATEYQzxA+6bfprOt/wYMrIdtGYPlfoNyTxMAM1ynf6MUr8MSGpxIEnq/8bG5oDX++Xi
	MQnLQJ/q4wL9HG8GGnDNesqlNHUmbMFZTt58ZS7JULapTFjaxIlZhHxqcmAmcf7znUtQZDt3kw2
	s+IJ4v8sd/uDKzLjGJjuXuRmvra3Im2lc85DRp6uQRU3U2OjRr98FOQbAXq7zWwXizti6+CSR7Y
	S7or41l2bHHK8HsHnz48xESEqMjzbuYtVycoGjwsIXXVMl/8wZzdjmfimRArKdVESVFhJteSKk7
	IXVFZiPr7zUjxbKHtHlmUaVo4c+GX85j1gr6Yz1DbOAOe1dxQHKKS0ok5C4rAx4pJGGHZg4rNgZ
	A1RGUaxaIe11HsBvxudM/rPtrWw7VFxPLV/mbyJzA9cVdZZKd6UWXijnVAfgj2Lp2Uvy38t4Rup
	nX9YAijBNlslGdzeMz2HEHQDiiKdTlFpAwhf4=
X-Received: by 2002:a05:622a:19a9:b0:509:50d:b9c8 with SMTP id d75a77b69052e-50b80cd0762mr88199731cf.1.1774498318934;
        Wed, 25 Mar 2026 21:11:58 -0700 (PDT)
X-Received: by 2002:a05:622a:19a9:b0:509:50d:b9c8 with SMTP id d75a77b69052e-50b80cd0762mr88199451cf.1.1774498318449;
        Wed, 25 Mar 2026 21:11:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c52fb15ddsm2856731fa.16.2026.03.25.21.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 21:11:55 -0700 (PDT)
Date: Thu, 26 Mar 2026 06:11:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjiey <yuanjie.yang@oss.qualcomm.com>
Cc: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        20260224-knp-dts-misc-v6-0-79d20dab8a60@oss.qualcomm.com
Subject: Re: [PATCH 5/6] arm64: dts: qcom: kaanapali: add display hardware
 devices
Message-ID: <aisc36hfwhodqbsthph2o6deattxhzykcyphhzjn2i2hf4fwx3@gxhsr2juqntb>
References: <20260322-knp-pmic-dt-v1-0-70bc40ea4428@oss.qualcomm.com>
 <20260322-knp-pmic-dt-v1-5-70bc40ea4428@oss.qualcomm.com>
 <vqj2pvtjs7dgkr65e4mzt6ezoxgq5gl5kyxbbol3tbtvw6bltx@yhf2x7oix2ss>
 <acSb5F9gZAVg76V9@yuanjiey.ap.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acSb5F9gZAVg76V9@yuanjiey.ap.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=NOPYOk6g c=1 sm=1 tr=0 ts=69c4b20f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=I_l-K_a_3XEW2LnFtesA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: BtuSJjMORaUx9XETglnNVQQmmuFbeKSv
X-Proofpoint-GUID: BtuSJjMORaUx9XETglnNVQQmmuFbeKSv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDAzMCBTYWx0ZWRfX11h4kalL+nCp
 TeRlrVF7OrCST+msVEXT1dp5SHmcSNrK9B357t1BUEJ9yqdsjbabgEvex4+gMVTH6dAcjt4Z9n9
 DLf8ECR922wnJtE9nVxirADWHSzjH4H5Rg8niJf87a4ixChs8Ao1BlAintFw24FUoh4C+h/btFZ
 ek+DCFUltJJLGxWKRZwVFuBPjmkGTIP64txT1iaeMV8GycLd8z3WknD238VjZOVtVso6nvfpkKM
 nV6kDWMweZfBDXkFF+zzMQdYR7U0ck1Up9DJMvEizRbDhkPIVAkJi7HC3aMbEDrp9YmH62FEhYu
 t7zlHLa6bUPaIZAiKOHTHZaNbGLt5k8KZO8yCpSLve12SK4IWb4lTX8JLMgFZ5QLpgXvMo+5CBd
 GO2VhSdR0pVNpdTFptXQsnHhDgQR0EDWH26mugOgG3oLSiGZIxv2n7LgoqUXbf6MHCmx9AGTz2g
 iZMwlgnatgalDZZ9/9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260030

On Thu, Mar 26, 2026 at 10:37:24AM +0800, yuanjiey wrote:
> On Tue, Mar 24, 2026 at 03:20:15AM +0200, Dmitry Baryshkov wrote:
> > On Sun, Mar 22, 2026 at 11:19:45PM -0700, Jingyi Wang wrote:
> > > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > 
> > > Add MDSS/MDP/DSI controllers and DSI PHYs for Kaanapali. DP controllers
> > > are not included.
> > 
> > Why?
> 
> DP driver is not ready.

=> commit message.

> 
>  
> > > 
> > > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>

-- 
With best wishes
Dmitry
