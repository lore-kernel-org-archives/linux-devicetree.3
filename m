Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4CB37B41F
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 23:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789342268; cv=none; b=K1DAgYPb/FCKluBRRuCpH9WFkfqlPbxzX1unJEVQxQwLdQvoVbJ695VS2BDysOjbP8XR8+r6gSdCzAchjou/WV3ALiBcMI/tmfiXnT6XX5LgG0khRNnXbg2b8TO6gTwJO3DBKc/1PHxxa5HAy4f3/kK9GaeJsCdNdOSBRUOXmKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789342268; c=relaxed/simple;
	bh=9ExU84slyAwDQlKmqAhicl+Xj5XhAq8i24BFAYfIM1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MMExT1E/5Ty1kzCXdjSVdpsAhJHiOlelC3qAjFUXwJEDJKgTgoR/1XH3092wbXzHVWlbKgLrMe1JuDtYwX5GQsGvCL0O0gKFKMwlOYmdP06TncBjaQ0Ii4CzIyXSP+ezYZyhYAwGAaY3C5GaZZ5F1zOvhsdpfAz4Cag8mcjAF3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h6Z0H9Hc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SIEeG6mV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h6Z0H9Hc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SIEeG6mV"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DLF4bZ3672586
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 23:31:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DNWkY13/F7vQQirOcn7RyLrj
	8L/7ZC6/5Neaz+9VVak=; b=h6Z0H9HcHEhQBaja6fkvXBbrNNPS9rFg+FpgaM6/
	faehEqp0/cj9WrrcglZi+FVs6s3GYk0m6/+uh1ySJ07HvMB9MEqfit0uNbrdX2Hj
	FbpF6MJp6HX2y24ZL5YMGg3eCdleotfk3u/QpjwLSqfKthfQG5Cc5a4V00a/APr5
	xFe7nQLUoPu6uX+UH21axp829CT3l3M5Jgs4LFdDd5wDqRSc4ozYOz4qxaAplHAr
	EPGPTpEnRSk2ynvKstsuPuhFxntWtXu+P+89BLO1YYZfaijKFL5XD1Mt02aOHfbJ
	6usUxLdxxWYJaRBX9IvzbRjiuNZplDAoZ/CLJbOPe5xw8w==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3k0868y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 23:31:05 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c851df59edso972476e0c.3
        for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 16:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789342264; x=1789947064; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DNWkY13/F7vQQirOcn7RyLrj8L/7ZC6/5Neaz+9VVak=;
        b=SIEeG6mVzvSQa2MmtfDyupL3Q8jyeApcXtGl0AUqCYN2oxfMsBRC8y/fxSo0glVfxG
         apPxjZwdwTxRqfEzLyPM7xsB8iiX1ZTtezQeT66J3b0wayZHsirawUMZpADKu9HDMVwp
         uzs1Z++plAMSSHY1dUiVmamyuG/lr6pvNheAknk9u+AVRGnUy8dMldOBGfiXLA1aZ3Ij
         +pGAm4qXDX3LOoMVkL2t5YmdQukzb30/+Y0WtDCRbVTNmFase40Hx6rtyXvsLK2wudMY
         FjZoNRqMBArj8UNPtlFMD8n1dWPomQKtId8qSVWxZ+7JMko4/wHwF5VIs8JZVqE6Q7X8
         QHPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789342264; x=1789947064;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DNWkY13/F7vQQirOcn7RyLrj8L/7ZC6/5Neaz+9VVak=;
        b=H8zCNarLsoXlrux4cXan6uPVfKa04muWJvUbVnlaiX3gh9b566/hAaZlzKfmDbi3k2
         J3mhwOxRZtrsEGufXe30vrUlH92iVzc5pKUdsytaQwqdzqUgAMIanC3JIkZdNVt2Zx+P
         6P7tCn2ohjxoDibBDORoS14dzpGuLbw13xSWP/KdSbpN1T3GLfQLcLFvOeVwYEhVyCqI
         zyljZRcaOgeDB4z+G8/PQlC62Zd8z0fOK3gvLLy21Emr3BJPVYUgThkjs6BJYMJVYEMZ
         NkWla/B+FZ92//sCNFGVSur4uJ6BurdkCFRtJeOtye3+tPn3vtfzRkOewuuR7qzu2HSu
         GUTA==
X-Forwarded-Encrypted: i=1; AKwUvBzvy8mpvXfKwWiUXgxJYRvFT+6jsJDMQHEVRGXvsHYRZNRk49ieDqjs64XozDMWAL5ISBjI6DEoCJYN@vger.kernel.org
X-Gm-Message-State: AFuF++l6aUECg6rhlA7gFYddwspmryPDuP/UBkQRMW4deTwQ0JXcyiF3
	ibjT5h9S53DKMXtn7z+GaRJfsfS8M5Uyu4+l8sngdMgXMzv7XBG8r+CkWDo46//Z1BJ4XkqKSjj
	DmW9s7m4cDAzE9Xs3vgqDXLOUjJVD5BPC0L3Kc8GRc/w5c2LVVfLx95hCW75IFAlf
X-Gm-Gg: AYBFou1htI/eP0xPureDwi9aieWNQBm9UXENcKmAuU6tGis2C81pUxn24sI0x0h1OV+
	nrc3LDpSdKggbPRKkC/Uh8hlkma3QShwtbc1c/Ha0DdBkizbKnOFOGZ68ep70XCBqW1hWrABSYg
	r/C5AYksMVnXJlZdFF3Mviwwax2/m4kOjUm+rYvyLFCF5aBSgcwRQFALLj8UswCC6uo2S/4Suay
	OSyVuAskTSLU1CkMSCkCMy9S3KCEa5N/K6qbXQaF+wQyH5NbrUtRNadNgDxaGLutvx8TWydO7Je
	tgh2yEzu3H0KLCNEILjNDtHgPq9Cm+SL+JL6JedA/X2bcN45gWeVf7leClw6j/fjafv5bUSD05u
	zJXSNTuu3bSBBk5zQECOLubSCkkMk7lQTVa/ZSxpUPSzssAPJiLM4af8BJO3QCyTQyl3AmQZUY5
	siCbxqckiWz5Xk
X-Received: by 2002:a05:6102:32cd:b0:79a:47f7:6cfb with SMTP id ada2fe7eead31-79b5c700894mr1555137.12.1789342264421;
        Sun, 13 Sep 2026 16:31:04 -0700 (PDT)
X-Received: by 2002:a05:6102:32cd:b0:79a:47f7:6cfb with SMTP id ada2fe7eead31-79b5c700894mr1537137.12.1789342263937;
        Sun, 13 Sep 2026 16:31:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a0456f85sm2019892e87.29.2026.09.13.16.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 16:31:01 -0700 (PDT)
Date: Mon, 14 Sep 2026 02:30:59 +0300
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
Subject: Re: [PATCH 02/17] dt-bindings: display/msm: dp-controller: Document
 Nord DP
Message-ID: <pxrdizcozxstimw6qortyrhyqdeicgdir5stjqxridexmeehes@wytomwupuxnq>
References: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
 <20260911-nord-drv-dt-v1-2-e25c073cf1b6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-nord-drv-dt-v1-2-e25c073cf1b6@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDMzNyBTYWx0ZWRfX2BTZReGkbham
 OLgB7KI/JHx9nOZHhBNwcWF3M05TFM3qLdsuI53NYF7mxxzjHmYQ4+RQr4JAVz1YTrkD9UjN9LX
 UNtERjfp6LURq1oJxgsg6cVjZpRlVn4=
X-Proofpoint-GUID: Xwc-1uRxQW6vnApuN9pIi5uLYI0O6Xjx
X-Proofpoint-ORIG-GUID: Xwc-1uRxQW6vnApuN9pIi5uLYI0O6Xjx
X-Authority-Analysis: v=2.4 cv=BtAIUoX5 c=1 sm=1 tr=0 ts=6aa73239 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=07SeQkCZaLl9qT1boBYA:9 a=CjuIK1q_8ugA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDMzNyBTYWx0ZWRfXzkdJ4mbxsZDk
 rQ/AFs9CKKdlwSt3Rs4zQCfymuvUvX/mV87KP/dzO/h2FfNMvbmt+Bf8YJZjbAVIq3g+VjZvR/1
 Nx+cwKGWEm/fr72srLaXoRzVAd6TJO6jAiyyw0+b3Md6qKfDMabkHsQ5dnD/HI+0i1nmDATUTRH
 IiLpqh8bvuuf8wo6ab0WuKTbppGTUsxWAMgd4C+xSc4SFPQpAcUIcWonBTMaS6SK20KdkoCb+z2
 W7d596OwBnxAVjn0O2nqQCMthG42vvxngckNy7BeUQ/dv9tBsNBKDZVPW72AyAlYZm1eEiNxior
 Zth5eC1gR4bICromqjNAbuVXhqi7jx4a9RGf6yYKJb+X9CtvfVnww0IU+8Pcr0OLvNBu/OnxYA8
 Il6i+o5tmydMCMnB1VoJv0fYOIJqTJjFmu2UZAEHSjvpQil7hAF0i8BkZd+tTaTJYq3NYHvpIFH
 AK/Me80MpjYULANwAGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_07,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130337

On Fri, Sep 11, 2026 at 09:06:33PM +0530, Nabige Aala wrote:
> From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> 
> Add the compatible for the DisplayPort controller found on the
> Qualcomm Nord SoC.
> 
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
>  1 file changed, 1 insertion(+)

Incomplete bindings. Check the conditions in the second part of the file

> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index 094a6383bb77..8d980acb1a16 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -19,6 +19,7 @@ properties:
>      oneOf:
>        - enum:
>            - qcom,glymur-dp
> +          - qcom,nord-dp
>            - qcom,sa8775p-dp
>            - qcom,sc7180-dp
>            - qcom,sc7280-dp
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
