Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D0F1D516C
	for <devicetree@vger.kernel.org>; Sun, 22 Mar 2026 18:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774204814; cv=none; b=RxH/cG2gIzOFwzabs7va78/VBYLqOBxjJtzh33zuj2R4b4Nd+gxIox+SpIJPzp3fBKNvixzRfh4jhqTrbAnKDI2df5ezoEsgVsL5cMelp+JZ/B4M0bSG83eokUxYh+/+nJ4fP1J/4ezSSILrLYOn6i3sJ4GA2wL8FhA/M6wofFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774204814; c=relaxed/simple;
	bh=h5HtI4g89HHUABB364A0BS005oJU8lHafRA4E1R4ppg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Odjp1A0lcera/y/nbMQCSNkM0NATCB+LXWFuclGulJ2Pv5K3ZARLfVZwQdwcNP8CxQEC76ir1B+EVRk0RTi1xUbCKwebf5vPhRJsMtMMYxjlxc7u9qqpnKRaN/3mHLojWAXIROxvJYSs4dqI1ClRZjMsrBSEok1kdR0npXXpGyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GtHs88tH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PseATBtK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GtHs88tH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PseATBtK"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62MHjIju1685219
	for <devicetree@vger.kernel.org>; Sun, 22 Mar 2026 18:40:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6WnTGWvbfme9vkK+WWLMjVHb
	sxN7MWU3P3klxEyldoM=; b=GtHs88tHqh/eyJ8qk0MX3LkpYaDPpqNSkuCV0Asj
	Zzeo6sIS/1X6Y1OAEBlQlDTf7WZ8iOB1fFTDZLF1SQnXefFYeC3+39qCcWm1Mgbv
	QtGnuU81rWt0TUjozHfC78j8w5Hd6qfHmXUctpzbroxzLGZAWajNwX/rEsJ1+5s0
	iSj/x2UtLuu5zd2Ll3Pov2qSdyorbv8qaXlEsEqIKskgjO/KOqbRS8xi1gQtY5lz
	/+RZZdjdBTcyhIhXYw1+BepFcEN034ycCs5isqLnrHDyqlso3umcD9711lrTWnE1
	uqIAz+3iwAgqjatNtyF5FzI+NtT3xEHnQpchbof/x6+QJg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1m3ctpwa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 22 Mar 2026 18:40:12 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5093a985e21so264505291cf.3
        for <devicetree@vger.kernel.org>; Sun, 22 Mar 2026 11:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774204812; x=1774809612; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6WnTGWvbfme9vkK+WWLMjVHbsxN7MWU3P3klxEyldoM=;
        b=PseATBtK+UAWUr/zguI7WHi9o70le9VANvSQZoI6MshxzPcTBsW9yhCTbz8Ve86M53
         I1aFk7gnlC3FHIBnR1pcW9h5QMRwBsvDY+mox5QkPsY8ydhv3hUgFN/YgZOqfjx7k0Hu
         /QcZoQnFN0jWmXhIx1p2mvyGm2QykOWdezbQS7R5gw/6DXfeIwbzR5L1baU10fzvNlJg
         sRDChvv912uqce6M06GkNZJp/Xf+zHA2ntOeFkpJZ/rTRZejGxEPJrAHKy0vyD0qQeJF
         HTwJHjQzJn0TdeqsIJwX11upb1E0TxrXug4gPWGRVzW+6hnkGGHPLVTHFmAzhmrLOUrV
         q/9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774204812; x=1774809612;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6WnTGWvbfme9vkK+WWLMjVHbsxN7MWU3P3klxEyldoM=;
        b=o9nY4pOYZZ5BFQiclUZfSl4xsubiSKH+RNmVyVJFY2rsoCINrg0N4TjlwbcXgf3+Nr
         kkoKK29YDTJkRtTyCRp+r+ZaBe7vYTaFLq3mnedezh3TiFEVd1SOOOdkZYKKha5avBL1
         WuqfQZhXZreT6GGITz8Zi+XiRO2mlqVxem6KWjZdF751OA40d5eeZkodTSsp/QoidyiK
         8D9KL65ybTSfKeZuUdIQinbcFjjymNyvgytmk57Hu1Y+lnTEPcZFQfzoGeJ7HxHrdPiB
         boJNzYfPCwyjxMmwP6v0vMQadt3YyS5NNbMYRBYSMZJWWESr0XDnBlk0BJD9Tk2h/9Xb
         a0Dg==
X-Forwarded-Encrypted: i=1; AJvYcCU1r6w7VbRVlhk6YLupCCv5jTwAj2uipj6sNTiplbQnCMGF96Ljy5Lgnk3mRnNCzs+AoJVdUjhYKYx5@vger.kernel.org
X-Gm-Message-State: AOJu0Yzeq8ho9Nw/6hsvFbFlB9DM2V7pu6+Gmqo20Y9KPlYbg0EDXLak
	IztPnohsOIv2nxxsRW3JVikl9qNyFvHS+WWe/pAkkj2mnMMM8+rAiSZBwY9Sl4wIkpPdkGSRch6
	tQ2F1fcc114rAeJngbmJF8wDJzhu21kqOdvZYNBTolbklYctMdFHVzAr956/ipYp+
X-Gm-Gg: ATEYQzxrkuXHC2TZrkPRBokzyt9tXc6Moijl7ugpwpx6yESJOcvHD+rZ8DVYCWi/ycQ
	WlH1e/CAUV45RJ2gaxPSHMrfwWAZnrGaMtqWiuRXrQYxS0o+HVy/0g3zwjD+gJx+684rvLu3Ip8
	gQAXr/nNsNWfIIMJ2BtjyzygVbMzbj6hn2UquWymnqLEdtm0V1bxX3W1CRpgfLL6LcpR8T4SDWI
	fwAuPSQfrVGasfNyDj/rPWXHhZOeqwi8ufNj+YTzmufmSG7+4qdRnTy7MeeUhJ2eivUN1KOeF+C
	PjrLlTEwxFkxK0ZxHEebSZyfbNekj0Rc+ND1cQO1TkrGDAIl+/49EJR6TxeFBxYAqWmQhYtNRBH
	LCy+XLARoxfi0fBILKsPdsdq0Gl/+kzqRofngTNiadYDuJDqTOuk8x/zDwB/z694h/z686z82bP
	T6dZfVQNwswd3QbIxvEQRv2pTWoiir2r+Oeww=
X-Received: by 2002:a05:622a:1922:b0:501:1795:9d52 with SMTP id d75a77b69052e-50b3753dd41mr150905751cf.33.1774204811719;
        Sun, 22 Mar 2026 11:40:11 -0700 (PDT)
X-Received: by 2002:a05:622a:1922:b0:501:1795:9d52 with SMTP id d75a77b69052e-50b3753dd41mr150905361cf.33.1774204811278;
        Sun, 22 Mar 2026 11:40:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a28520731esm1892470e87.45.2026.03.22.11.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 11:40:10 -0700 (PDT)
Date: Sun, 22 Mar 2026 20:40:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxim Storetvedt <mstoretv@cern.ch>
Cc: andersson@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, marcus@nazgul.ch, marijn.suijten@somainline.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, abel.vesa@linaro.org,
        abel.vesa@oss.qualcomm.com, johan@kernel.org, konradybcio@kernel.org,
        kirill@korins.ky
Subject: Re: [PATCH v6 1/3] firmware: qcom: scm: Allow QSEECOM on Samsung
 Galaxy Book4 Edge
Message-ID: <ab5mwfn5rdcdufbx7z2ddrydtexckcla2trc2jlxuqhwhmsxpw@dxbjoksougkv>
References: <p3mhtj2rp6y2ezuwpd2gu7dwx5cbckfu4s4pazcudi4j2wogtr@4yecb2bkeyms>
 <20260322160317.424797-1-mstoretv@cern.ch>
 <20260322160317.424797-2-mstoretv@cern.ch>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260322160317.424797-2-mstoretv@cern.ch>
X-Proofpoint-GUID: G5R3ZxyAQMKyREjZnEij1ox4wh4Nyter
X-Authority-Analysis: v=2.4 cv=Z5rh3XRA c=1 sm=1 tr=0 ts=69c0378c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=GXGFvHOBr2iSkcKxInMA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIyMDE2MiBTYWx0ZWRfX5YoP8utrkRBL
 gxL53mhXLbfDANUZsvi+/8sRjUsSSeq0wyV2BYCT9lrSi47sA+/1GyZJY2ZLUJOgomrzuRhc9Mo
 Rp53heV2amf08yCDF2XcM3aHBXZpET5bZMynIIEtH1Q+APS69E/QX/OOs6Jch6eT6FKJ2DSUHpE
 VfrDH9LEmVxewr4Ds07N4AlI7/Zxu51iU2a+copbyGFwB4ofjpZ/fmx2HrA0jolodo6SjgjmeE1
 +41KWAkQW2yeSv9iZkz2Ktd6t3WHRo3IiSW6O5Czk+tSOa/6kkCQQ+B3vrKgeOSp+pRpTV3sbCJ
 qmr1XFOufmj2YgEMAQKCcnP7oyc1br1uv9YhYNAN9dRhaBLcu9yfv/l5ObdZqP1Pw6BTdhcAWBV
 96jl+cXZxhrYir1spCzTtyiJRqH0rXf3KalnKKrP9Te1C53xx9YN+qNe415ratp/F6JI3LVNJ5E
 g6+8GSd3I85GVZf6aaA==
X-Proofpoint-ORIG-GUID: G5R3ZxyAQMKyREjZnEij1ox4wh4Nyter
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-22_05,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0 clxscore=1015
 spamscore=0 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603220162

On Sun, Mar 22, 2026 at 05:03:10PM +0100, Maxim Storetvedt wrote:
> Signed-off-by: Maxim Storetvedt <mstoretv@cern.ch>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 1 +
>  1 file changed, 1 insertion(+)

Missing commit message.

Also, please don't send next iterations as a reply to the previous
series. Always start a new thread.

> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 5c4375a7f..5d3de476c 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -2318,6 +2318,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
>  	{ .compatible = "qcom,x1e80100-crd" },
>  	{ .compatible = "qcom,x1e80100-qcp" },
>  	{ .compatible = "qcom,x1p42100-crd" },
> +	{ .compatible = "samsung,galaxy-book4-edge"},
>  	{ }
>  };
>  
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
