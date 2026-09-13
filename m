Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19ADD3A0E80
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 23:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789342206; cv=none; b=KvJQv8FfcAplQsl9I3e2L4y2wTVbrjEl/e1vaXaGEW5oq+2BVePex8olpp3x4roihLk0EToZkNZ9VXmtQKp3sB/PqKLUnwtrKJvHer812GdpZnz8E5bwQBfmhPUYZ4rbQllIQ0nC6Zz0XBFOiwHM9ZpdarhgTu1TF6kq9Dql12g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789342206; c=relaxed/simple;
	bh=KoKlgFodyMeMDkO4c3+6PwiXXy554h7lVzOO6S1/7pU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cJKMOiIcwZTSG+/drzOqty0rhRESNomMAx5gHNOumJzjtQMHaJmk7q72uO3K6oS8xLTNTPC6gjBjjoMD3wS/jOE00+1sbHXU8O1JlGFwXpS2By8t6qoyzuT8RNmDtQvGXBDsd0tdFmH410XvfEqLuOMa3dv2rABMI+wTkjY6gEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BLIn0b1p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E1ExI0ls; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BLIn0b1p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E1ExI0ls"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DK03mc1986783
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 23:30:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Nj6aKZsVdCtHBveKqJbFsHIv
	5njnLbiwoSwtuNudUX8=; b=BLIn0b1pzYHzxP2Lv8g7Ru4r+UzUaWwIzfJTe7C5
	Gco5h/Y/50+2s8218SsY6pJwkOj0Tj9Argy9lEkx9KeQY9BB4rzOHhIPt1Dpsbns
	tcMOrz4D9I9ubaNrCCi0sKJmgE0xDEK+yiAkZFiQnwhrOFcvQddF4sWcTKFu80Yy
	w15BITzYT6HFX1S/xuzogHTDpVMaB66o3Zzjiix3Dw4dZM7UBpxRT2qeoIa8LMyu
	gfYUAS+5wwpbLlJFMyl5eUP/n/xnd+xFgIyvNwGJLn44xqT6TTsqpd/A2TlEFfZu
	RjmIqTRv+dtfv/4O8Qiwd+v6KUfuZUQXlRuV7ATNJAj8fw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9ccack-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 23:30:02 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c7ab4af214so780176e0c.1
        for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 16:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789342202; x=1789947002; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Nj6aKZsVdCtHBveKqJbFsHIv5njnLbiwoSwtuNudUX8=;
        b=E1ExI0lslKfvmNUatN9LYa6P9ehrZjL4POGZMMMcfbpNiT2HoUCIaRW6bdaQ4EzDVP
         QFlC4dZ4xZqjiL13MlBR8MvTI6GTtODFU0nAKbsxI5khfhQvz5EUgSp75GDcqZDUsLu2
         zgccU6TUFmOqVNz84apZK8EMksALkg+uw3zmhib788By8Bobx7ZNBZYgdnU0Wd0HLNkt
         7J6m+nbd1sHFogPvU7YWGLp0CMTux3uiBBfPf7n29KpwxjT8S8zV6R9g4lvGSGQpe7ki
         ljLGZ8O1xn2eqhYUzmGe1qb5ODANnbpd0rUeu/p44PrsuZQsB8YRycJrGzT0yE/0vTef
         3dUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789342202; x=1789947002;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nj6aKZsVdCtHBveKqJbFsHIv5njnLbiwoSwtuNudUX8=;
        b=ZvMEXXYvniJDqwBw8SCE6MfqcgAs//016PUuk+CMP2SyHBKTgoq3OdvJVAZwYHIoUU
         A+e+SC8P6iy7MgLelpF1ielujE1lKibjFWog1tsJRN3BikQ2xhlWPMLmpfsrLFoHl/UZ
         a9hUXy6u8zFJGPL54Ds6GcCrWDp05EwVaDa24/2KeJMay9zJPsaYKzwLypr9wmSIKXwp
         kv17URieIrf0+afDf5itiIHw4mKBMfQFfo9vWrcZiwhdsSAdcUQAkSC8WNWdghRrgeV9
         C1HRmzN2Z/Yek8AYCleLBPe1rCYQbN9teqHUj6EoPOidaShsiBnCoSEXcb7pdVCf9RjO
         7+3Q==
X-Forwarded-Encrypted: i=1; AKwUvBx6sloJRWZma4Ceg5KI8jUZj8C7pwS4MIvIvIWMRePyxX1vHExYmje5SgBS40zNr7H++UC/oH+t1Q+w@vger.kernel.org
X-Gm-Message-State: AFuF++ktdkN+r7Vp4sNOneerKyt6cJZ8GpTSzlM9RC535OBvx+/HCAUN
	LiKCGP8UThzJeii3J0+HQFUwYZY4jv2gYfb/90OOvKlcKCnEwg6/fHApCtrH7TxBMIj3L3kMwdy
	viCZ5wn89WqZBCIN41fom0n794itjuZEc9KvqViGN7m35t6HGnoOjUwfcyA9Vu1vm
X-Gm-Gg: AYBFou0PpIkWo8GUPFqGlhhAOxYsPKEHJBrFKM1J3XEnPp1qR4yVadc4dELWStq5Pjj
	m1dL05VrNJ9s/1Izn0zfmePg/RHLemhlr7DbZWhAhXW6k2teGn5sQKC1I2/wJRX5fxWAuo190gV
	ylOqa8mZl0/TdNsnQ2XjIpDhc3CgHM2fJpIDRX08sLU9a6gS9uaLlnB24G5MwcXO4AHjE8zjWb1
	i5MgNpwNa2yRUOnpe3m5kVD1bqK2GFRAvUbtyiTcTNGo3nOkF8m3UH2HC0zdYHyoqNpZCQskBA7
	xxdaGsrM6GUm+xcTR7fZgxYsJ+bRgxgS+YzzDRNI5JaVt9kjzF5RWJan3dxyWgPwfibPz5Nvkuw
	5nCIf45C6x75AVqlWyg0qSj2wLkg+Z16C9+/6Ea11OzKMnpwW/d4MlbxEQScTVVkf2JwKebnd4G
	h1WbZ0ALsbyEB1
X-Received: by 2002:a05:6102:5792:b0:792:2a1e:f9bc with SMTP id ada2fe7eead31-79b5963e001mr7205137.6.1789342202034;
        Sun, 13 Sep 2026 16:30:02 -0700 (PDT)
X-Received: by 2002:a05:6102:5792:b0:792:2a1e:f9bc with SMTP id ada2fe7eead31-79b5963e001mr7177137.6.1789342201620;
        Sun, 13 Sep 2026 16:30:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5a33042absm22708231fa.14.2026.09.13.16.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 16:29:59 -0700 (PDT)
Date: Mon, 14 Sep 2026 02:29:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH 01/17] dt-bindings: phy: qcom,edp-phy: Document Nord eDP
 PHY
Message-ID: <evvgtf6b46zqpolvybz6xfklakgoyv2llnvawrblgz6np7viza@gtmqflkwwmgk>
References: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
 <20260911-nord-drv-dt-v1-1-e25c073cf1b6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-nord-drv-dt-v1-1-e25c073cf1b6@oss.qualcomm.com>
X-Proofpoint-GUID: btz_wMdCCjaCfjDYIENSHucrJshNJ4E3
X-Authority-Analysis: v=2.4 cv=Pv4G/AM3 c=1 sm=1 tr=0 ts=6aa731fa cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=07SeQkCZaLl9qT1boBYA:9 a=CjuIK1q_8ugA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDMzNyBTYWx0ZWRfX+5/GANqZYmTW
 CcGDz1yUVYTzS8BQn/LebhZppGqXRrMlsGh2RNjjF40WG9fYK+efAf9nSexRGDMMWo5jV4AhCGI
 cOSPzbtRF/qwJTbW75kinquJdwTLBY4=
X-Proofpoint-ORIG-GUID: btz_wMdCCjaCfjDYIENSHucrJshNJ4E3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDMzNyBTYWx0ZWRfXxLCi3hVjvKvK
 dt8wWWMus7QTHfYiVxhsavNeGUazQA3ZkL6s8dZY9Hj67RURtJonGQbKMqtZwumjQWbK1E0pQ6n
 NyFvEM+zsYWqzwzOL7gAR5SN/fxN2xqVs+Aq3NGQaBNd4ZhP4jWYaaaCjOZSSOGNqUHrQrL4Ram
 phvPA35o8+NUUyILAtd0+gO27205wEqoYVNFYyWFBE0ir3Cf73xv5l+XL//AnXAr8asQY6EYeFR
 7UBlePUUFB2I9+3wBlzqg9yFhrphpFnWjNVV/9gQpDmaSn1lxgwi4j2nD3iNbhWYhdvaF+39PxZ
 xMAr8w6aOMy2Fwov8dQ5dAuAVfBKvyJ2iNIwhGpdex/VZ8Qea2UzfIkwxtVd8CIuzxQwzSy13mb
 4z/SSXSnOOtkVs6aFl3riWINVgz+9Q4uADDC4PlKyi2s/ccWM0Cq3Bm29fggF3qd/KolScRTK2G
 4FsGnrjgWJ6OmL9XnZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_07,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609130337

On Fri, Sep 11, 2026 at 09:06:32PM +0530, Nabige Aala wrote:
> From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> 
> Add the compatible for the eDP PHY found on the Qualcomm Nord SoC.
> 
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml | 1 +
>  1 file changed, 1 insertion(+)

Does it use ref clock?

> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> index 0bf8bf4f66ac..91d7a5c8e19a 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> @@ -19,6 +19,7 @@ properties:
>      oneOf:
>        - enum:
>            - qcom,glymur-dp-phy
> +          - qcom,nord-dp-phy
>            - qcom,sa8775p-edp-phy
>            - qcom,sc7280-edp-phy
>            - qcom,sc8180x-edp-phy
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
