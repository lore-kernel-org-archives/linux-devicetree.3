Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05641387364
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 22:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777934489; cv=none; b=CCA0W10KcU9rZzrXwTto2K1V2qhIOUAiCMHitOau+5svTdzhIE6G1gmaMX8/x1aqRLx2Li2W3ixUvnPVC+DTsKYO5Z3yr2NdyOuTse1sHAmxy8jrgGi0VyAWiziYt+2k7hyHsZ4gxUR1c5jsGXcO/fReLIhQnI47+iDqzNoMzow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777934489; c=relaxed/simple;
	bh=sP6m2Q1icT7q7swqbmA0n9OhyvZfa4URC74dWoD4AcA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JppWmpn2b4Ofj+IEOKYwwkWnDnpCCLc3QxLzziqe72Su46XstledDiVKAe5r1z8QUYlTl72G9xzzSNWsjEHa+iIEAxB+BWTfo8HzhWSAZ9pHabZvjYbZI0ucya7cd4LhFOi3Y6yspFpndlhz+BiR9/IkT6+Mevz/j2cj15cKPVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JFkwYgbS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ETpJnleC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JFkwYgbS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ETpJnleC"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644LWsfJ1186704
	for <devicetree@vger.kernel.org>; Mon, 4 May 2026 22:41:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nwoJXM6+1xp+hLX5E50uMhXY
	2w5IXLa3r/hbeB0B2t4=; b=JFkwYgbSJdNmoSVpJMPbX0CCS6SptV6GgHo2/0n/
	jFC8/oeZYqCZujRkQBp0VHC3vM5uMc+PqKjt2zNudlMnItK+BWv9V0IYZRTBdN8r
	LbJ0AffuVMmBGxhqKPlKlJaFz+mdsDNf0s8BLyQaXGjAs1A8jm8TglOhlLSSl7Cq
	/2vWaAIYopRi8ti7AAwz5crGYzZNXWtGAEAZ1NEI/yTYaMq0ysLhbzsdTiuTVO7F
	9FpcGaXW2HCHfcb+/VoCy7f9AqHVOHYhbnQoQMEv98voFT5uLpJ0RDVcJF1rtR8z
	pY601zgpX+WZreXoyJ8aqaW8kiZKyuoqQfCIVvXpbLdxDA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxvvg9usp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 04 May 2026 22:41:26 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d8ed08aa4so161482061cf.3
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 15:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777934486; x=1778539286; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nwoJXM6+1xp+hLX5E50uMhXY2w5IXLa3r/hbeB0B2t4=;
        b=ETpJnleCcDLALnmkM4SwjTlAS/ZkDT+kyDH7NxVavUntpGFr9pQk6grh6jfVZHnWn0
         bugsFT7RrqfkxliaFt+sw+f6NLV8s0/K+76MKLI/PStJw/6j+0+K3noNGV+yiiCxVuC0
         5sfKZj7I66QGa3Hrk3xU2El/+z7u/22T/YNTy/OJXqie/9I2HdQZeVUhCV+1R9H2Tgeb
         RFLrMc0mWR5o7H2d7JEoAeLKbkuaioakyS3bABf1wsjSqoHALeP2ZZ/mHHfaGDJtbKCG
         yBlvHeQMWAaZEMt8vNzR9YFY4XcJy2xZtDricJoEO8mxQOhoFJ6XER0sf4Ey5R6sPa3D
         xjhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777934486; x=1778539286;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nwoJXM6+1xp+hLX5E50uMhXY2w5IXLa3r/hbeB0B2t4=;
        b=J3rkIeAZZQBiFU2UfgHNaETFDAutIR7LW/d5wmadHPT3oOJixxCr6vCD8teYMpBHPV
         NNk/Mv438bQOdos+94p9mtRO87owTpP3J3R2ISOhafE2tadjjo45eoMTAYcdLpjIxCz8
         kEh6O+i2YfaKNPKSJvA1cDeIyf45FCCp4w7G9sPRVW9aV+CvOKSF3DgUOwcXh6HTOjuT
         xEBwz/htuSA4ZRU8TUpfvpSOfnwxDDJuKqWD4HX10+SxAtGDD2qeZd7nh/edaVXrLN27
         rKQCrNwC6Kzv0/n52r5mZJuxamPhl/o7Af2ViQ75W2D+H5gahw8wpDPA9d50DvUwxUgn
         MagQ==
X-Forwarded-Encrypted: i=1; AFNElJ8/oECYbidxqi9NbxzssjpnjmPxTRRMo5dLySL2iKTqHBRAnGMQ3BhhBRG0l+0FrgvfNdaBVhwNfaZT@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg9S+L0Z6ucPaXGNyjDNb9ciuT3eJF8KHqNf/IlBi7Sm6r8Blo
	LiJPwTO3+4/yw1WG4CQBYoRPZvbtXplO6AoAMvcGRn313A8pu1gFHFy3e73mW+mI1G1/r7Wl//X
	YKXankRZgaagttj+Gae2iW4uthmWyY8h/FWYYw+Z8aTsZYMRBYRZopo5QNwSzWN4/
X-Gm-Gg: AeBDiet+ZdyARKfpwkpt2jSdHfrpsFhMnhHcvTB57BwIbdfpM/5/OjDUD/ETiOqotr0
	lXePdSJnExaC4MlYGm4mmuu2XWd4UFJtcDKfJi7RU6DVLtSt868JwrE+LFOwlC+esTfWlGf5Myx
	95yFGF7dwPeKiYGsGyh6hQgY/+tzL8DZD8xOpJ0oXR2ZD4zLqMmStxHThhFWGApbKAK8RFfMxiu
	Mp3g2RdV9dtNQKMQEQ4AM+tfUIJpWUbybNl9pJYqdnye69Y3RXDQXb6v9gBtBsZlDKBsoYoPkx2
	0GglLe0lafnX/Ua8tbr0XBoujvdcRFqE4mpmmkJKAO3etfzYyAHub0usltsfvXgbjweI7tkirpb
	7D0JQLFE+cXhRuZn/WgxMF4c/eHk697FzYURD8STbT9aKrjEcENj/8RdQ7CVbEn2SMY1PdSBHeF
	2eFOGgQytrfBh3fR7TJzb3+ocDlub8oaewszoGcrUAZ7I9Ag==
X-Received: by 2002:a05:622a:1aa8:b0:50d:5a11:1b5 with SMTP id d75a77b69052e-513069d6e28mr11411931cf.17.1777934486297;
        Mon, 04 May 2026 15:41:26 -0700 (PDT)
X-Received: by 2002:a05:622a:1aa8:b0:50d:5a11:1b5 with SMTP id d75a77b69052e-513069d6e28mr11411561cf.17.1777934485864;
        Mon, 04 May 2026 15:41:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39361300c88sm34342041fa.25.2026.05.04.15.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 15:41:23 -0700 (PDT)
Date: Tue, 5 May 2026 01:41:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: defconfig: Enable Novatek NT37705 panel
Message-ID: <7sujwhy2sbnxhyuo3xajlohsbkyvugciq5but4eyjsfohzojg5@wflekkz65bwy>
References: <20260501-fp6-panel-v1-0-e09cb05651cc@fairphone.com>
 <20260501-fp6-panel-v1-3-e09cb05651cc@fairphone.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260501-fp6-panel-v1-3-e09cb05651cc@fairphone.com>
X-Proofpoint-ORIG-GUID: Zz64Bp3Jgy8J3olzs4dxEOcHLff3FIyM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDIxMSBTYWx0ZWRfXwFU56Hp0CCZm
 hTAX/gw6zAkEyH3tTNKE8yoJtBqtNpx/IowNDlV4CD/ISt4oWG/cN6H7aS6L3EpelZe2jUORcCZ
 tEk3mEJvaPvCrL3UAmgznF6zTlbEWyuBYuj5gXCQgWFfc0ktkozXygscmDhKSwST5y4OB/+QDQa
 C40zsZzs7OSyHMJWjduayskD3AjNjNK8ChHh7LjbxkuiJhLWF3pvzAU7TIrhbEKzj0n/VdxPql+
 b5PYoUSPRR3PIpRPU8Btm7FwAyKwBbX+bRSseQHMCEHfpDUqnSONf7uVaUFAJ/WM3sXlrQF+W8F
 fVQIxCEjZSoN/BnWZgOVUoWmI/HaFUIeCsAJxY0va3vLPutlggCWFhxSjwTwPrGn3oqrf6P7wMT
 iF08GGb73IgLB/0JAbBEd/W8usjzXHZWk2q5QrqTg7Q6WlsFUP0B2oNiCwPMlmsH12lSyboQV8u
 l7Zu/ru+Ki2pGOhwruA==
X-Authority-Analysis: v=2.4 cv=K+AS2SWI c=1 sm=1 tr=0 ts=69f92096 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=6H0WHjuAAAAA:8
 a=EUspDBNiAAAA:8 a=7jsc-R8H8AlhYXVgh4oA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: Zz64Bp3Jgy8J3olzs4dxEOcHLff3FIyM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_06,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605040211

On Fri, May 01, 2026 at 03:52:47PM +0200, Luca Weiss wrote:
> Enable the NT37705 panel driver which is used on Fairphone (Gen. 6).
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
