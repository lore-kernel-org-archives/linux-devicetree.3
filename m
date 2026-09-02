Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4E2389104
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 08:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788337551; cv=none; b=VQe8Yi9qjoZclLxxxycTXGD/5K8xgC+I38hjbb47G75oEV7l9PRNqAVIL3mwKyagu6zvjuW4HXLL4oEpH+3/oyl28BcG03pDC9PICdTfjgr1VSavNFkGDIxAdjvNdMEvEDcx7nRajyPGqYiSEXXx3TO6R6adkm3U3ld6EzzcsbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788337551; c=relaxed/simple;
	bh=eDW1PymceQ69R/4nuaQ5nGV5Pv7cV4+Zg5HO2YE5KUM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AhaVV/cat5DJ20Azy0mwqfE56gNNl1ZuHtWMkx5lTAdll8XJqUFKRETfc3STnPmHDL/cRlUnNqnFdDlfGnIuaVFiOAOM87mrzCaS0fg07obgJfw6aMfiLiY1HT4BxBIVSoiImySPTO6irtiGPNMN3D8IS9dzu+a9y1QQ+cK4CSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cw44aqmR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eMKqMlcO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cw44aqmR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eMKqMlcO"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6826W5iu1205569
	for <devicetree@vger.kernel.org>; Wed, 2 Sep 2026 08:25:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=U8LjS1f4f0oRNvBA4fn3Gpkk
	oMiN8jts80hvI4ULse0=; b=Cw44aqmRos8OLLOTuEsBzUnZ1xWUYv90P/C55Fqs
	auonVFLTjZI8hlhW4sX5cYu1Zwzr69hbnTw4kHz8LBDp4Fp3/NYP9uAx3RXZmtct
	Xk8M7/iEfkD+b032hSB1RnkNdTRWQj8URLRWZABDoHFgXYGoyNRjLluWt9d8g5Fj
	2LJl0FTatCy9JqEKksi3wkbNngdfnnSMzAgq2rcee6MOEEhT+vNdvt/cY6rgAIVP
	m6m2IzlnNzzy/foKx9QaK7BhSCc1bB102JEs+abdR/WgH31L5AO7k8mgN/j4HpE6
	G464fPLSGZbU/lOTXMdrJlpgSfLdYgKvhWMOFr0W84IFmw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdynt48w2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 08:25:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93922c75037so101188385a.1
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 01:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788337548; x=1788942348; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U8LjS1f4f0oRNvBA4fn3GpkkoMiN8jts80hvI4ULse0=;
        b=eMKqMlcOq4973xpNZPk1chdmr5AXC3PmnZJTxWFRY2ceaORaEf+dtym8XH2Lyf3vxx
         SXzmtEjj9nA4LsElur7Gid7txBmQG0w2pqQlLma5m0MxZ4Mkykk1pu+nLC4Kexwt/uII
         +Y8mp6YJbYYB1P6Ot6SJoNiily5zLZgvgUfRJsW/VI/PAidoDpf75Ye9/n2ANWANNU3v
         50BlfhFFKF5XFVKgOkUDsRN+xGb4pauj6EkEI786nhn0MmQPBAKeXCupWZZcgySib+ov
         OhAed2Eyvh8LlQbh9rai2oqoZh3Y4pjQBjr8Ja/L5JCWm2qoKH4FG/AB+xV/W4BHg2U6
         P24w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788337548; x=1788942348;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U8LjS1f4f0oRNvBA4fn3GpkkoMiN8jts80hvI4ULse0=;
        b=l66dDPMF+KHUVEHUZ1F4LbVfWz7ANc/lxMq6gMsTT4QMf+RGJ7MGr5lMc+ytXt7vf5
         SKn98Oq+DoW1JOioYQMY80N2YlxVX24JHZegAzGSNXmGgAQJNauj6G/n5eD3QwRYNq8B
         NLeCW9iv4d2ahH/FjNJNSVAxUtdSEwkP1BEZup52SCVu9b9DkexUOup3eAxy2ti3RS5X
         3GsVFalBamuC53b3+E6LSsBi1+tM2ak+doeich5L/HtMEG90cmaGNX2uZHohzyZS0H1C
         yNktBGzOdci6x1zty4jahOuWYuxb10HjROCXaVVpef9Gf2nIUk0qWTF0i9sDy1RLpYSX
         4R9w==
X-Gm-Message-State: AFuF++m+SdHhAgX6I5woDNVm+4DGpYEeuJ/AbFvLDq6GIFHEx1QDUgB3
	SGLoTohJBbLCqIqUzzE/wnyGLe+rkcnAAwSMaQ01HJZGwi0slVpMGxBRUWiY301TBD3myo4HY3g
	Vax4SUyeVLYhjzD/YwdZ2K0pIZSY4Cp0Blj/Yr69+qVvtCiyDHAZE6y7gvjVWWLw+
X-Gm-Gg: AR+sD11+8bzT/n723tcAn8URWF8wFxygzG18njLrLNuaXYMS4NKcm8Tmyn5FdRvhjvJ
	OhwhaxXNplBHZX/fzrxblYNWSTPkloRTqK/d2B7dNaFrojuqiMC0ekwBQv/X+9lDB7w80UnP1wr
	aR1fSqSvCNMbHbjzLGhlbayn8mEkRQ68TVdbiPRlxiSFkGnjE796g/u3p6ylLIlqIYS/4Z4fPDN
	ulYESHxhOCBmo/HecFoK1UF6SqwW3B9ZKmclKQgOSjSPslrfzCWoujKFSvKW/2ZR6s20+Xkvv4s
	gb9/qjV4pEox/1VD0v+IeWzlzbrCKHZHmY+lbI36MMANxMUMZGlQsQAfy1AoAbEobYivm8N6u6N
	RjrPIpKDrMSfhgL4=
X-Received: by 2002:a05:620a:6a87:b0:92e:6637:da3 with SMTP id af79cd13be357-93960fd096cmr348228485a.38.1788337548347;
        Wed, 02 Sep 2026 01:25:48 -0700 (PDT)
X-Received: by 2002:a05:620a:6a87:b0:92e:6637:da3 with SMTP id af79cd13be357-93960fd096cmr348223885a.38.1788337547749;
        Wed, 02 Sep 2026 01:25:47 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-484492ce5e5sm4459993f8f.36.2026.09.02.01.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 01:25:46 -0700 (PDT)
Date: Wed, 2 Sep 2026 11:25:45 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: eliza-cqs-som: Enable Adreno A722
 GPU
Message-ID: <q4u2bxbguq6klsutuypulazvyod6n5ifm5n3pfdqvuumgdcbsc@bhuyaqeoh565>
References: <20260902-dts-qcom-eliza-evk-enable-gpu-v2-1-51b452a460a2@oss.qualcomm.com>
 <20260902081850.C15861F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902081850.C15861F000E9@smtp.kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA3MyBTYWx0ZWRfX153ti6CKzDJZ
 RCRdF1uEVTcYnxi/7YaZCIiTIz4Vz0I3omYxrb/8F/rXbldxJ9nonhDLOmHfKqGT8LV6SMKDLAx
 Q2F26hokbtJEUsTVuEcnMpz35U3e8gk7YXOE4clyZUkuLgNvS8bwsvrkxaEXPp2Hd3tRarO9fZ3
 DNP5tmg+IzxBqMZnBKywi0xrVDMZSdO9RBPkdPMhBbOG9dKQQI4gMugPF4H2OPN9UX0YGb++Xxo
 gVPNfVyWMquPto3SJxpZdYOkaLTJiovmYxqBrjnhsh67+KvfpIj0wdqFXssviFGmo2ahQpU76ot
 Fy1aPHITFGg/FQzYGuQc3yuNpcV/stIm4+D7LjjSrFbZ8GzXj57dDrFjMUQviVZCATYKQdR7tjg
 QwyYAeGZTwr6DLgtPurAxu52muM8Q3E92Gl/272toXReMMS6bmgZNVwvcBes2KJQx4iIIZqzQde
 G/0YTa3klgtwl4+XlOw==
X-Proofpoint-ORIG-GUID: 5nguuV7xGdjWxGh6dmmDjSwr68WQuY89
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA3MyBTYWx0ZWRfX2ZpTYkiGYor6
 yNzsGos7UURt3yQXf4+VX56deE5FWHSqPAGUZoZiSKVvaj9KoG031mOV14our1irVgPGx1wTpaD
 gdzMnv5cpmruo/03iffN6akqdYdGijY=
X-Authority-Analysis: v=2.4 cv=LfkMLDfi c=1 sm=1 tr=0 ts=6a97dd8d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=4NdBFP2jvZ9CJdPtIxQA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 5nguuV7xGdjWxGh6dmmDjSwr68WQuY89
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_01,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020073

On 26-09-02 08:18:50, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The overridden DT nodes are not sorted alphabetically by label.
> --
> 
> commit 69d2b599210486d1fb104df39a0da4a840c7aa02
> Author: Abel Vesa <abel.vesa@oss.qualcomm.com>
> 
> arm64: dts: qcom: eliza-cqs-som: Enable Adreno A722 GPU
> 
> Enable the Adreno 722 GPU on the Eliza CQS SoM board and provide the zap
> shader firmware path.
> 
> > diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi b/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
> > index 5ef6c51618bf9..918f5289ca45f 100644
> > --- a/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
> > @@ -374,6 +374,14 @@ &pm7550ba_eusb2_repeater {
> >  	vdd3-supply = <&vreg_l17b>;
> >  };
> >  
> > +&gpu {
> 
> [Severity: Low]
> This isn't a bug, but should the overridden DT nodes at the root level be
> sorted alphabetically by their label to maintain consistency?
> 
> Since 'g' comes before 'p', the &gpu and &gpu_zap_shader nodes inserted here
> in arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi should probably be placed
> before &pm7550ba_eusb2_repeater.

Urgh, good catch.

Will send v3 with gpu nodes moved in proper place.
