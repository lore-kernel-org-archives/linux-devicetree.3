Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6F63F5BF1
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 22:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781044128; cv=none; b=kT/XuLYwChuAA9sYY398gS4mCDK2mwzTZhxKJlOB9APWKUDEcs1frNv+w3Qqj5BJNu7aPHhcedo8o+dzqqNmRlTG0lZ4h5GTMaNKalJAqCmQdv7RoHZL3+egezN7HEw/JWoIsmjgjl5AcUzg8i3rtGDm/e1VfugYoYsfCPSVHxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781044128; c=relaxed/simple;
	bh=PdWPXvVpu3sR7/V83pxTB3l/ajc8fSi5X/uX9gnVoG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tdRABpST4ytpjkl6c/FklULo+ST3q4X60yU9fxfURJ6NcliiqVsdkTJBDxPdHuJU2PtJUApdNdL3pgjUIQ0M7TejMpVvj9Ws2SjQHobZrgcKUx7Ix+TFvsvY2lZnYaVQIuTN6xLL/ZEsA1Bs+51/uqSZeTL2zKHglqtDsO1+nl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H2LdL2ZE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QrmGqjqN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H2LdL2ZE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QrmGqjqN"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659MEJOG3440469
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 22:28:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pMV9sIsCMro0CR/kIgUPICoo
	AQ0tUVgnwlz3eG3t/+k=; b=H2LdL2ZEzREmtRRrgWCWX0ru7fKaXBIo2WQpNBhS
	y6F4Qo0A0vd9XzXXfPuzGR7xIGIsQXMMx6FUq/N5HaodKLJXZdR2MXoNCxUWhmDa
	brFh65gQxHIGOr8RvxOV7JxZojRNUEJGcPeuK2flIUSWFd9qOqpE1vpOf3nS/Qa6
	JhiRKOxIkTzEiocST0L5J2DfahmkfHzDOAHzZEbeY7OO7jg+KZFt7QCMqh85jhhM
	x7dYeN0yupyzlC0M9L5se1CCayqll+Ws7cN2VzRREtiILbiDur6cSFeHmhN6pKp8
	PMjX0hpbryEnOEFJHIaXkOSxwaiwm9hERVlQDbQL0RTq5g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epenrc50s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 22:28:46 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5177bddf6e0so21397521cf.1
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 15:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781044125; x=1781648925; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pMV9sIsCMro0CR/kIgUPICooAQ0tUVgnwlz3eG3t/+k=;
        b=QrmGqjqN0oF8hiD7CDBAKT9tUClvJ9CzfeIokU4a3uLlOdLTDYQ6D6QAvtvMrdYHup
         hOTHtpu3JHs8K1hZV04/UY/UZ/5NyojbpJc6j++oqjq53QSS9Q/YkoIL91sQvOCMLX7a
         wCR7rqPASaD/JEiPqlHl0DhoprFW23gT4YYW5PyKEApszE4isoEMnZOaSOvEcIkfwtWY
         +ZT82Tp7m72UsDVVgHHhYMkjje9dNs3RmAVXupEflcg3vrBMhHFTsHhQuNrf4r8CvU38
         i9uzl79bHg03FfKlRRaXebC0V1fX+YKKhdXrT4EFupPlHkVEtWAz6f4LNsmbCoFPseGg
         Fllg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781044125; x=1781648925;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pMV9sIsCMro0CR/kIgUPICooAQ0tUVgnwlz3eG3t/+k=;
        b=P4IXA0szB4q3nd12BCcNZsbcKNYujGk+Woe2Z5B1loS9y/81X88XFUUkPvRlJs/GQY
         KKMAxT5VYpwXZwv/xho0S6nUBD1t3OB/ActY08wN1H7U7SI6PM+QOK1y4f+P8Iithta/
         SHx58bVBfhQfojhqUG2pAp/DDdn7/mS1iU+uJdJ2xWzkepA6QNdshjQESw8/NPC50BUg
         Uheamom7Nu5oTgBFHPJTIIjbB/EmfVkTAPZ1doptuemBKG1SaU1LG5wPUcPI8g0+GHfS
         GYGpPamJmGVGu1amlzNkT1TcrBraQFbN0G0zQYF8F7Qs4B74nc7lbeG7bS+l1EiTEmfL
         xDCQ==
X-Forwarded-Encrypted: i=1; AFNElJ+6F+QC5y4WLM+E/Mex0GH1kNeLZYyvh4MndSxdiMS1+795XXsLY6D6Iy4weipBPmo8YtafOrLeLx1t@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+M4jNsKwKNWmTQiAG0l0vMuAI3GpYKte6R19FDrhmRWvxU9By
	ONzcoUowqumV/rDoBd5iFp1BtVWOWA7PP+WUW3oJATXMn/AVw1xRg9lFNukFz+pbkZ6WF9wpVOf
	16VoQqftdDwqld1fn0yDHrTDgzcKwkIpkvnwu5TLiqDdkPufNyYHP++RU1A2k+JIg
X-Gm-Gg: Acq92OFhnkzlCwO40MIPa3SeH+gVAaRNzqIuOWO8g5DJpPoL079wUKmbW+pms3iN+7A
	UWKZelXv5DCPvPo2FT7pvjmdfsSe6QO+zyFMaut9yinyQ7pThTmHLFRTTLnWlZnjg/Zo7crA5wy
	EvET0JQRLUIk2ITLu2kp4wnhGN9N3eAisl3K1JxFW4jWFLf0tDvRMSEOaZo5wyLmDJj4AL6E/w5
	TI16hXzuKbZXIZVgIOZrF4XNhLpHVCm/od4SHDVJoJbmn7/Xb0FigVZsx7TEdZRLlgqr296GIr8
	FYmP1w2Ev84WRSS4k8IzCh5Qbp33PjgBARinUAChHopUpOtdLIfkpAtWN/nqawUW3WTcDHLVT3u
	5Y+94nKBM6TZ2RG0wpxHBlhsj99+Umy341/sngM811h7GzssX8yv4iBpYIFVhLDUfivV+hVrUXY
	RB+FBoT8ZyEyTJzMD8NyY1Xs3/1JDN/o8uaNecodMz1dKR8A==
X-Received: by 2002:a05:622a:4807:b0:516:cd8d:c7fa with SMTP id d75a77b69052e-51798882e6emr238426591cf.39.1781044125370;
        Tue, 09 Jun 2026 15:28:45 -0700 (PDT)
X-Received: by 2002:a05:622a:4807:b0:516:cd8d:c7fa with SMTP id d75a77b69052e-51798882e6emr238426371cf.39.1781044124971;
        Tue, 09 Jun 2026 15:28:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8fdc6bsm4879966e87.29.2026.06.09.15.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 15:28:43 -0700 (PDT)
Date: Wed, 10 Jun 2026 01:28:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: shikra: Add Iris video codec node
Message-ID: <o3zjmtmordfzeimgowakpsz7jit7q4wsxb3j64gmvgkvre5y37@ztafjbpwqavd>
References: <20260609-shikra_vpu-v1-0-3a32bb38b080@oss.qualcomm.com>
 <20260609-shikra_vpu-v1-2-3a32bb38b080@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609-shikra_vpu-v1-2-3a32bb38b080@oss.qualcomm.com>
X-Proofpoint-GUID: P3NAUmv4sriC-XSY9QjCauXnORRJ8XTO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDIxMiBTYWx0ZWRfXxpbCqfFLhHYq
 AE1Wy43RWp8KzvVTa1M7TN2BfVD1/lp9tRueZMpk9fO7KtsdpN/+8WQRiYA+NPfgZmjlN+2hmTc
 BzVpkcfTf+GvSgFrv9Ah95PahSzq6jqkOyB9ZMLlYYwYVqshKRYfHfin0d3BCZr+6Uk9NEE1gtD
 3W6fRk7eFM3oZgcfs6VKC2eGQV+uIEmDgBtID9SViQN8C4xuR4OYIdBl+Z7sxreZeZA1KoOMGKU
 g8PMa0x9h9udO4wBUTF/tCuFKpo7iguNuAj2UAThBULZsJrq034/siBKAIIymVo6GX3mOeSXMZE
 NjzUh9aElyOFaeb8NVzwbFhJZ/EtdvX3DIkm7J1O7DXPbjuU9AS1OYd0D6glwO5FcPCfdezVSs8
 hzAJL7llqnYGcdi3U4IBBxYnTnUyZH3K2rgKLu+OWN9awPHlHXzLb4MnVKqFLXgLGeLoK89Suaw
 KN/y1uQEnl8z3HsDFPA==
X-Authority-Analysis: v=2.4 cv=NKPlPU6g c=1 sm=1 tr=0 ts=6a28939e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=gZ9Hao4PvtIMPGLi9fIA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: P3NAUmv4sriC-XSY9QjCauXnORRJ8XTO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_04,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090212

On Tue, Jun 09, 2026 at 09:45:41PM +0530, Vikash Garodia wrote:
> Add the Iris video codec device tree node for the Shikra platform.
> 
> Shikra reuses the QCM2290-class video hardware and programming model.
> The video node is added to describe the Iris based video decoder
> encoder block, allowing the media driver to probe and initialize
> the hardware.
> 
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 61 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
