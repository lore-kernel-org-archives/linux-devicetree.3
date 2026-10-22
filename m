Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792664041;
	b=jRWNgCEkVkqOchTrwANxEztlZ8aVPPvxuI4MSyF//925o9pGd4LR9bSFaVB14K1e86Fj
	 uph4h0C3VKeRfWjT6/7uqfWjdHm080W70Ug24yKDOZJBxCyn1W+Que0DBXcJEvUu2eoF1
	 AwYVhOmq9XJfrpCO3bmBgUOq33GTIFpQHHrA0bsaURAixc0nvcJk041fk9KJP/Ru4dBS1
	 tC4y4Ed6Za+nIA6U9Q/jywcWLLswKdzH9Av34qINp1R/MTIOCZQyAjiuFrhFqb//f30ou
	 LtW6pik2DbExelqeIby0zDfM/RiqG+7SpuZOCeYblhKLB14qhvJ9u238MvF1JXvy30A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792664041;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7yWfrvru/Q1OyZVwkw14d4BtxF9a07L9+eZitoLa27c=;
	b=fk5vcVrPCua4p5hYUG/YvfsQU2Y5FR9RbhVQtKxcpuog6JXbBxe8dnJczYDgHo3garlh
	 s/+gG92UbvtPlFqETisn/4TFmkf7CweKYDccbbAm1B8WCI34rVTtwkHTMabMw5kgRO5EM
	 O4gV4FmnGseVjzfLa9CSiQpNU6auuOpKoVftCdEBhGXqlrlcaemfnquUKaLKCeScFC8P3
	 HXIz9F6gYlkjKNFH8y4fcWDaMp26OuACD/K0e3bmKLTPRHhzGoRsOEmh6+zQsmcFX6tDA
	 8jpNou/LYH8Tvln+YPMEkdjpy9rUGixrW9lxsTjJugvt0zIlra3bQLxnJMsgDNs3lrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eoOfQDU3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a0q4KltL;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2642606A319
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 10:14:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2642606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eoOfQDU3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a0q4KltL
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M9xwSo1962204
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 10:14:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7yWfrvru/Q1OyZVwkw14d4Bt
	xF9a07L9+eZitoLa27c=; b=eoOfQDU3bRY7mAVH3hmtcXkjrdH6IACjn+phqOdC
	tA2VafhU5tiJl4E1ugTgm8zVX/Lb/EUdy3ReAizStqNLvcpQC/FFTbZv166DoaDF
	VhIzJv3gDis0/ejzom7d0KDBQIRlYdbiA/ybY/fuKsZGNdI6KCcZI28eNyK70TDh
	wRqAnTRARMOtffz53zEmZVtNjIwR1jvPwpdmfADsIf0MnqGO0ojnRbe47YtE0eow
	XS9tQ8dtDz1M1nRIPmzt3TkRaveAOEHZBu6ng9TijkLuOh5HIOvUlQySei/HRUiP
	lS8vRuZqdzQbHPhbLNCOAzhOyom5uSivP3+lNl73roGr9g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ahxcj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 10:13:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f559420f3so176876785a.0
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 03:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792664039; x=1793268839; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7yWfrvru/Q1OyZVwkw14d4BtxF9a07L9+eZitoLa27c=;
        b=a0q4KltLx965qeQ6BcssIoLXt46Ay6E77xNE3KJkvhtlyHucHWQhCypsWCJzZ2RnUx
         oHRWGhzno5isCgxesev1MONXGyJ1CRoKS/yj8f3Mvnbd+laC0NilrmZg3ocVFaV45V0g
         8vbgV19B1oYD0XgE3+lNKMcSWTWtiEccHY+U88ToRr250F5sUcoynqsIYda6+1d77Pvc
         4cp6tITcb/96J+iInij8vXSejN2SdSF4ELOT2NI6/zdRL+eWG2U4C2akpK84f8JyeZcJ
         YGOEmg15vGQCmD/yxoQsq4z9nvCjagjCNOAcZCMh6qNX09m1RzpzRu7LRwSxyOCRDypU
         BH+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792664039; x=1793268839;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7yWfrvru/Q1OyZVwkw14d4BtxF9a07L9+eZitoLa27c=;
        b=1jq8BJvo0cWiMy9QysHsIy5ylrqv0Qw+cvv2N9Dyaud5URqxXlk4XQPBn1DWmGDnYz
         Xkv0WlSwdJ/DoY7SFJuq2f7uEABhIoj13kd1oniirpIUAfJkxgLNBpOlL0xnpCbdStLG
         DVy73ucgBtCsEWbt7uvdoz2pqeCS0C0BQVWjkxJDRZ41Ch5u/wlvWo1SAegDS9/Fzung
         K6aOH/2g0D8rqX9iJuuCpnWNlHpkR1hFfjteCK1fzJR0hGo/t8AG/gh9PHkcRBgcXD15
         H2hOr/U6Shn4t+26Pd4z1df2lRWAy5dtjealgFc/coMi76SJcfOtG2TuV6d592BQM5cP
         CUig==
X-Forwarded-Encrypted: i=1; AKwUvBxiZjI8H+u+v39lxVlJyZXYWKpcJJEytr6dy24hp7c+pe80VRtYTPkf8ZYNFVdhqRC1TWyCokhFgNaf@vger.kernel.org
X-Gm-Message-State: AFq9FYLDnH64u68eA8PxNFPOYcoCJgDVJI+ZJVVpHcTsHQnZfG+XpHY9
	XpaM9S4UpVP08QCA+m919D3NhR5Yd7pl5gwWqcS2I6E5d1d91C594PrwWl8ZDW3K6374DPZ2wUi
	udiVC8/NpIVybwmRtgaA4zHmy0hhiFhqt189H/EGTxruO0bo7PoJHbypNXcBpha/f
X-Gm-Gg: AYBFou2bHhhCpns0FmPWsbxYNzmP/XpYKadA/7uUOiFGLiaTA/4KdrvECey+9hTL7Qr
	s8j0aI5Y/qSexOtZ8nHFubaOA5C1uk6kIukKBvSuwdAFNSDf33gzJA78DVkId4MeqaQFP3YDL1n
	VnsRsoJDkfp+4nI0En/eatVzJSnxO9ZYT/2TsRv4Ts9CZzanSpO7qzUIy1LMqBTXgsDYq/LuvFh
	TNeVtp1Rq4kcwzKP8sHtjQrqb/8lqbvI5WIADo/pLWjW0mNjJWX+x/0Ob5aUfZlGR8yv63skuyp
	nra+P/m8GmX5uyyM7Cht5gZ/htQilUxj4MEs7GSm6+MLAo0wUHORVig3HlheVXDQO57ZKcof26+
	iRWVChlf6X0sgxWzcMTpUYzC7lueVdCp0iScozNtKkPhh+Eikzh6+zzkbmbqmHlEMOHwORcBt/N
	Wg35Bwlwoxg10O
X-Received: by 2002:a05:620a:45a1:b0:93f:32c5:69b0 with SMTP id af79cd13be357-93f57fa3df6mr758336285a.60.1792664038728;
        Thu, 22 Oct 2026 03:13:58 -0700 (PDT)
X-Received: by 2002:a05:620a:45a1:b0:93f:32c5:69b0 with SMTP id af79cd13be357-93f57fa3df6mr758333385a.60.1792664038225;
        Thu, 22 Oct 2026 03:13:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfae6337dcsm16234e87.72.2026.10.22.03.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 03:13:57 -0700 (PDT)
Date: Thu, 22 Oct 2026 13:13:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
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
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: kaanapali-mtp: Enable
 DisplayPort over USB
Message-ID: <ygtcipnjt7dxtkohaolkshopuvxigfx5gxpedjqdudazuk6qhi@t363kbfe3c2j>
References: <20261022-kaanapali_dp-v3-0-b5ae8e6083c3@oss.qualcomm.com>
 <20261022-kaanapali_dp-v3-5-b5ae8e6083c3@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022-kaanapali_dp-v3-5-b5ae8e6083c3@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0MCBTYWx0ZWRfX7WoDHekjofje
 RJIFJFZzSVUdjegDSHcwnkxg9puZSiIgILYR6AhnEPOnepwcqWPaMetwyjdjQyAYZ4PmMLjbMur
 aiisxl9hJaUStbiy1U//3D+Facz63bSpIGi9I2GMSQpjzAdtp4wf4g290uw6fZ8YCVH4lqCfXW4
 QWuHoOHaAUfOaoU7np0ipZAtswiiKCIpeg+HcfbMEWgbSrYWlQb6ZsjgzrcwWyfnRY6clZP00cu
 KBiJR2gPusBGX8xCF9ENgirikzoABkAb8Oruo4OOVtGLE7MQ/9E1BEdWyP34bPwEgVcwwDdRQlr
 KJlBiwA+H+3bI4Nsmt2oS2zhWI/K0zfx07qZ+zG3oU8T8shWsDdkLqftAvOnZYPDNydTdzDkAzM
 WJKuD8zHUAfXGzCLp3xStsRTvNvQfZ8zhaOpWcfbhztS4B+Wq5TIE+0zngJHGJBXh2+PtCSAsvK
 NibM52wy2wSJfG/8hKQ==
X-Proofpoint-GUID: kvxIC4etl3zNL_LMte3C8ciCegMRuRRU
X-Authority-Analysis: v=2.4 cv=feg4WEQF c=1 sm=1 tr=0 ts=6ad9e1e7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=tbCzt_ceUV_s8fUbo54A:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: kvxIC4etl3zNL_LMte3C8ciCegMRuRRU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0MCBTYWx0ZWRfX6okhz/jFntyk
 sFj8CCUHPgeIaJ/Wtvi+8A7cP1Ve0HRykBTQR9lcjeka41+wfLk+tZLCPmVY+hHwgHFfTkIdWig
 6WteIr5Y4vOhf15FashjE07YHNV2Q5g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220040

On Thu, Oct 22, 2026 at 03:19:46PM +0530, Balaji Kalkonda wrote:
> Hook up DisplayPort parts over Type-C USB on MTP.
> 
> Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
