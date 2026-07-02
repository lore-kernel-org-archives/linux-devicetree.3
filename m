Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB4F35E1AA
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 14:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783002092; cv=none; b=nOvsfJBqUMtAzM47g2jVbDVjAyeS9ZVDGq/NhfM5126acRJ9PRzhkX0gOGxg4xTahU2iz7rlJ6RCPoXDkDz/nSh9JgFLWPwfmzyEZbCkxLyS8RQwPeoK0exBlDMrFDGsBURDt/4Ewk4UT+JoyXszeJ6dCS1wHqS+LscDDcghlQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783002092; c=relaxed/simple;
	bh=MPs05alcI5kyt2xMxJXFLxjTmV0pdLFe+NT8Mu8MLT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZXHOpvh8S1kj2BDF/vew3wgP741qQwYIHKunB+fJK/wmD4wL3r42gTHDwv2vzvzsEyBow8GmyG9Sk5ePo3fhLtGUvEOJeDSonSeQ/MXgG0JrIAk265bYWt4XN+ROc+BKwM/WO1tUnywyyEJS0CE9WYE/XB32SXZ/PttpDv2i2nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bbIIBqLm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RyvLGkWW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bbIIBqLm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RyvLGkWW"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662E3Z6x549286
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 14:21:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MqVtWXYMTfvzhL7PG+gnIDmu
	Na4x7hH2EKxmHvzclx8=; b=bbIIBqLma4/I95h4vPOsI+Q4NmwkE7LEAE9tPxh2
	yVUSMUlAoYZ1zVV3uuXiS8Gy+XhSCbTi/mWrD1cUZ33SVM+eGcNGQAFNv6Vw1CRB
	hlRmXKwSPn4oQVccVd0tFN49S9zFnrCUEAvJUHtfXc2LNOGv32tG0jIp51lu8ZXG
	+TgHyVZiHDP7iyaylM+mnTh44sWguTwew/6vxg1EplRfa1+CQRPZFiHcsV8pUZmE
	eEXkS70XC0aooLoeffvZRSgYQDMCmCQsWbPwFFF9YEItrWIQA8Zo/mluaFw+BFqI
	EzH9rzVEs6m98utB3sKWXijtxGamgGERydscFflP0aID9Q==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5h98j52x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 14:21:30 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5ab02fb3054so643058e0c.0
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 07:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783002090; x=1783606890; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MqVtWXYMTfvzhL7PG+gnIDmuNa4x7hH2EKxmHvzclx8=;
        b=RyvLGkWW8DXn3c/l/3nRPjkku+iSDYiEUVbKHVzenVXzghp6vCu8QxgMWBP2Hm5usE
         O2Tp9N/i+JyKmL9O5obvbZKONYY9s42U4NCmGBoePvf3nVvu9+MhXsquKcH/LDhlx+Da
         PZZhFDNq/JqkuUgu/Ppo2ve+0u9Bo+7EtIZmjV+FWpOtx96GQHAD693xxxCLXU8xpT4H
         +IAVHWrVzLrGV8c5ZdzbldU4oGbESGzdMpE76IFYmt7rukJKzV3qmP2lv46YICwuQiz8
         mGyEf7e+pwi0B9AUHgRPn0/otH3V+3+ANvsxY+w34IUt36gNVBHAkLIc/TEJ1jt/R6QT
         n4Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783002090; x=1783606890;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MqVtWXYMTfvzhL7PG+gnIDmuNa4x7hH2EKxmHvzclx8=;
        b=WzdMmf6RcSkaGJPLbWejo7Vc51Fdi/vOzVDDqKqCX/VgGragPMAHeyLJz3pqLU6U63
         62QIzAE2gv1utzY677QatluoVT1d/LfZbpyiw8r5IeKJnCauwJF8z4SK73UV89iPEzJC
         dGqBVEh5s+hPscjwEdILZzhNYE8hnfSxKgOvlS9vei3micN3d9dLZ/gbW8YvXHuUiSWO
         aLImdoBiHL4oQbLunB/lG2TBTKsxbwj4EUwp56llb/JglpIkSKT/OBbPDRv+dvrMGHPJ
         Z440O9/O1M6qEQCdFQIQzo7+/vjTQytk0M4Cgk7NAKw1TH9lVPD7o1c+exl9pw9QSI8G
         WZIw==
X-Forwarded-Encrypted: i=1; AHgh+RpFHSGxxaEBezrsAOI7KDpdiUyS1FPK474sDDRiFI5vqgC1dZRcHdnn3AMPcYbBOVV0+h2xDAnWPD3b@vger.kernel.org
X-Gm-Message-State: AOJu0YxlLarWnSCEzKPSiS5dFsnVFyoPcci1tvM+XKGsdwAZR2rnIdKf
	N+myCDYH2doWb30FVxbh1RJkHFQHtx+cvgUjmiw2NQCeD9QekizKYzeS9NMGUUMvYgCMGZV8aK8
	Tj6hrZMjhEHODYOJnX/GXdHSwDDEs2xSBOpa2tWb6FSXbAkJmaby4Ocs64cOXSogHOxL2Bp51
X-Gm-Gg: AfdE7ckI/j89jwPILDtsdZoM1mxK9srQURXR1f0nJvZ2tRijPLrMber0zQVAk7dhtc4
	KMmtIXswfpIM81TiynAChs4sJsNRBekhFjgIvuoLM/wpghfxsac4YptAxwvgwNPmAMB/9ZJ8B/G
	6Zwav7nWyWKcFoCyHodIcIVfbcvLXuD0/dD3AwuXdMaqNOww1P7O3t7gGHOaeGopSfp9L050iqd
	l7EaP+rVIfsed2oDJwC/lU9Fnumb5umSl1OgruDSxc6diQH2981HGzcFyjU4hUtqDhzIzyvzSBg
	g/rNFUA6xyCRaE8buKV0/nPQjKVb1cMS7OIIyMJYYviQoHwr0WiqdQnVO/bYcFFnXIES2cZXSIl
	5hdnlP81eXqmgaualYuDvKQS5mrzw8Y5PgBtnY+KGy57GOgtnksNZQ94ohqzBmUY7AvXftUspOc
	smOC7zaeoulmuxi+sJLC2RRZAV
X-Received: by 2002:a05:6122:e1b2:b0:5a0:370:f12c with SMTP id 71dfb90a1353d-5bde3b0e0f1mr1966162e0c.11.1783002089928;
        Thu, 02 Jul 2026 07:21:29 -0700 (PDT)
X-Received: by 2002:a05:6122:e1b2:b0:5a0:370:f12c with SMTP id 71dfb90a1353d-5bde3b0e0f1mr1966141e0c.11.1783002089444;
        Thu, 02 Jul 2026 07:21:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aec89dbbdesm707197e87.60.2026.07.02.07.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 07:21:27 -0700 (PDT)
Date: Thu, 2 Jul 2026 17:21:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: monaco-arduino-monza: microcontroller
 LEDs
Message-ID: <55xdfva5yytsdfk2gy4fyjnhoiekqrew7c7i6ag424ltn44tgw@vdgthslyf6fi>
References: <20260701-monza-leds-v2-0-c1be0b472926@oss.qualcomm.com>
 <20260701-monza-leds-v2-3-c1be0b472926@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701-monza-leds-v2-3-c1be0b472926@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Esv9T-AeU8iL-M3bBF1ptFuXkpoR0diE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE1MCBTYWx0ZWRfXxlKBFgIIFsDm
 Q+NLhi9GvEOF3K23lOmEld3n3ZkvoJi7+tJTCSvv/CVZt9ErrrO0t9JS0IJ0FtLqOnqTPA2rTwU
 zzbZNzZmTOW7f6+mnxK7suBXzNDnMixkwlXR21wgxblUI6dLd/eukXO5qR1FYnC6O8g6eR2Luld
 9BTuBEtK5mzrGDfmqJp9JtaK4l7NvdS+o0xxZKIVvM1yzNdsJfG43lkPJwKXNKdF66Dnq1qmInf
 Y85G+PwhwyuP2fdo7NzJ/KAhb8MG13M5iBSaxGt2ODGd+VY1/oEC1LeOZzPyZISGW1Uc9ZiwMBV
 CcZICzvHq9KXDswAsv4WrycGR3TXtL0FCoaQcMqo58KWNO/8IFiG7oPhYXReUC3m0iUDNQTdPLW
 tfqH6tnlq40UwvUtRNts/LNaGYvZUOX7DppD9jMAUQlWWc5jHCKb4jAN7GtRFrFQvqGpIM5Ebd2
 yY11XyAOJSwaPi5SRGQ==
X-Proofpoint-GUID: Esv9T-AeU8iL-M3bBF1ptFuXkpoR0diE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE1MCBTYWx0ZWRfX0ap8Q8gdfFB3
 4M1euKn9pR0wKJK4neP6qddn5TydaTURGT0Wza55BigNJFYm65zj0U0B0i+SD9YeJpGFdJdCAce
 pYQVnon8VNYmAVoHCZkiCSkGReIpafA=
X-Authority-Analysis: v=2.4 cv=bdFbluPB c=1 sm=1 tr=0 ts=6a4673ea cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=F2uzNt_Jvis__oCUEkcA:9 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020150

On Wed, Jul 01, 2026 at 06:15:53PM +0200, Loic Poulain wrote:
> Onboard MCU/STM32 implements a led controller compatible with PCA9635.
> There are four RGB LEDs controlled via channels 0-2, 3-5, 6-8 and 9-11.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 110 ++++++++++++++++++++++
>  1 file changed, 110 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
