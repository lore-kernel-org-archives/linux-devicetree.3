Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5A5392C25
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 23:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789343466; cv=none; b=q4xlWtn4WwZxwS75NKcpcSwMIzRmDhmJV4JtRMuDoSLtJ0Nktp9SDbadAYi/JDBOzDr0lR08NJGJsdOPQPwOfiBm6ZVbQO7dHkA27KnTFlsWb8+DxmtrtX9UV4KN2jNCZjpJuUZVR482PcTlK2p06Pvy9sj5jLFN7HseMszrg1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789343466; c=relaxed/simple;
	bh=p5+9nTdkKqAXTX4kQasxfAOPRcmCFjL8NQDhgdpg1Ik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VzzegWM8+EXzzCjW8xu8kRZVLlMAtj9UQwuukKHvciWq4HSAgR+57iQtBeqj5VO4OWFYPon3NaeFHeoanbPTcBAhEiOq29r3BAXdXMzTUOMPt5DX10YtjRcNXPZwQJ3aQT4ESZ4AOKDCq42lk/U4TUMPdEOacYdQgWjsQINtZb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LzPkO/LT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cUoy/ntV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LzPkO/LT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cUoy/ntV"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DNZ8YA3957710
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 23:51:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WdFMlmauPwxaVbgf2YMHJgMA
	PrT9/NnB7w9Jx4opmZw=; b=LzPkO/LTASUrCu8bMp3vKWoq0UZutRrM5M8jGYJP
	A8NZ1JwKpiYq+CvFymCSgTfoD4TrZXJ//ZeknSxXaGDfgrvmGOEhBH842JdlkS+0
	rTuYHXLq/JKCHi0M/MS2JVdmwcsyBxJfrBnhAGHiZeidDlEMmfFlbZsIloEKN3Xs
	Uxh2fA+uegD4dQdzT8iIMVdQSrfcyLD+5ZAKWSeoaFa8xwUwRBwwivYTTrbc+j7t
	cYJHVL/hHgXyRCII7aymQtsJ/41TG7D083/kVSGIcgu1zOJXP/mbnyBhhTLdHcaG
	ct6l1vUuYDBJ2k3mVKbfLL7DPVliAxuxwWyRCrgr4of5fw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3k08743-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 23:51:00 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7847917c402so2125563137.2
        for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 16:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789343459; x=1789948259; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WdFMlmauPwxaVbgf2YMHJgMAPrT9/NnB7w9Jx4opmZw=;
        b=cUoy/ntVSHBtlp0xOjKr+qNrV19cPgbyuSvuP421g8d9cGEkdRmcXg7tUFNZPn+An/
         AhIxnbYJjnk7QQoXl+2du6Ki5FB/1+m+T5sgykgUTVEDcQGqWrPJ5NNR3FEQBLsU7TTU
         8qTr9S2E589ZT2l4/6jcUouvHoeD8zlhsEQeK9LV6XcOAX/xCxCTiBin1DCpJohZWVvj
         XGchc5nZ6eEQMbgMA8QCC99PQgXjOomWE8r1olEpN5YDsTUrjo0XH5WETmiDv13ZPU5T
         gOcPwC0flRXXO2l2FAIYcaedb3P0hEyHavNywjcFQheWHPlM1MRy5Iqu0f/xdZYG4+45
         030A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789343459; x=1789948259;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WdFMlmauPwxaVbgf2YMHJgMAPrT9/NnB7w9Jx4opmZw=;
        b=rQGYsKOzacBXjhieru3eovIzFZnF9ngiInx/szoFfapTxNKxh/UuV6ClabiN5VBvTX
         kHm8SpNnp41KfHHkNOA95+if25Rx+TG0orljk1aSCEBQBCca1Y7b77iGDKd3gEiiJWCc
         xvOZ5wXesWxjIRW82KD/mJKIsbsXrns/Pkrxt/xQzdRZT0cmz/f8zB2hn8r+n7FxFbnH
         ZQAU+MYgbl7JH6RrP9fMOsztJcR+34kl4nKmzJvSUe8cLcAxWfbc3/MSGMpLsV+SC3aM
         6Hg/7TKugBZLpIC4C5ckDhCfBbUSRNc81zVTFRTKRmm8UsO/VwgK1wwKQNfXCQyfeR8u
         SspQ==
X-Forwarded-Encrypted: i=1; AKwUvByDRUpW+xuRGExFwG2nE96GyNoEKpi0Vhsb/+NeYDybCv/IH3+sit6vFWql84FUjgXg5WWlD7H33y9E@vger.kernel.org
X-Gm-Message-State: AFuF++laf8cSSxPWQM3akXjRMRoO+CBWdkMdPStSSPMVAbz9xqAOs45G
	3JSBoyEMCTtHGMyEW367NiYQrM3P28Of4h2VRxh6nrDY2yviF4ovWBGzmuGGbPT8d6JpcqiVscb
	v66qAPAWeTE/9rFHDYXtApgyDwCAP0qx6N7MTQvAzOd9DKNpWdMergjTa0sYnKvWj
X-Gm-Gg: AYBFou3r2btSBb9NoMFdIY956kMOegd7ANB53cnyn0PP2Iy8cTDbeaYITnw+APA0Jp4
	ENJFmfhTQ+t63opX643hUkg/LWWF1iSZxaOZ7knGFmsBO0dQBB0OJMHZVc7WNuW5kH6biBnx83m
	/q0aGu8wFHeOsQu7Sj0lDc3lfjsLsbC56jTUYvcy7e7TH2AlKEzy9srAuBekQxVIvzoVDGhDYbv
	i+MVuOspRMXkJCL5JePzkMN8oSjvLegFNPkbl7oCvFnTwwkqmW2fAmCpMfnTm8v6z6row3OF+nI
	c8E3sorThiypMQIX3FX3H1zblH/j0vCgxw2FEHaIKQDJ4Sv5GpE7nOEVigJtwtC6XTGPfwWojwo
	rOyb/pBc/lsTWdckotEYi7Nv9fB+N3ez/g1sXng5ztM2BbompKqTRejkK3A5wCf0u7En4QQJTBG
	Eed69ooEV383go
X-Received: by 2002:a05:6102:5f07:b0:786:c86c:4f5e with SMTP id ada2fe7eead31-79b579afe80mr41633137.3.1789343459198;
        Sun, 13 Sep 2026 16:50:59 -0700 (PDT)
X-Received: by 2002:a05:6102:5f07:b0:786:c86c:4f5e with SMTP id ada2fe7eead31-79b579afe80mr41592137.3.1789343458764;
        Sun, 13 Sep 2026 16:50:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a0456c06sm2080930e87.28.2026.09.13.16.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 16:50:56 -0700 (PDT)
Date: Mon, 14 Sep 2026 02:50:53 +0300
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
Subject: Re: [PATCH 06/17] drm/msm/dp: Add support for DP controllers on Nord
Message-ID: <pzcoffvcnailaqogewwys2zf7aizlxwzwz7scpixngc5ootds3@fjxeopzxa53p>
References: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
 <20260911-nord-drv-dt-v1-6-e25c073cf1b6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-nord-drv-dt-v1-6-e25c073cf1b6@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDM0MiBTYWx0ZWRfXzae7eLbT0aGu
 jRzn/iYhEQjwQmxE8tH73xz2dJCvpq0By3PbVLmHnDPWjvZ+7mVZEsdV/A5nR5FI03YIDrP8iw0
 jDhZTMWPAaHSBMgyjIpXYwchba7K88c=
X-Proofpoint-GUID: CNI2kJcU7m_qonulmAWBUUFtmQ9MmTzb
X-Proofpoint-ORIG-GUID: CNI2kJcU7m_qonulmAWBUUFtmQ9MmTzb
X-Authority-Analysis: v=2.4 cv=BtAIUoX5 c=1 sm=1 tr=0 ts=6aa736e4 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=m5hMcXIjv9hwPX1ZnFIA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDM0MiBTYWx0ZWRfX05wxIIRRRnMC
 ucKhm2xvxjrVNNbKU2jANkpoIUZtEpVSZli/4QEgfj/lKZjiSeuywkPny3xwjqABHfT6/Rb1z6J
 Yjti07/WGHyEgf7x0MB7uqPKHxsKqgSA2jTB1sJ2IPt1jVGxA/Dp38PiZKKqDok/UOFX8LhAve8
 2Oz1tpU8R8Z9hEaj5Sv8htbsVWH+ssahyHIyNfxNxArZrXaJRXi9doTQkTLaZE8G3Dw9U0mc1Sg
 BeqESK2uCsY/BH6cPIE0utHbxTc2eCDk5BI2I3UL8f/+ot4wb13sfghVgws4NXMVnX3fthP8905
 VsAwGNITTMSRcsr3E6OYEaiaIZx4/DwQHOT0ovhbXjpkcirux4/r/yXKFLLedHM7BAp8CM6VEzi
 SnmecUPjQ8w8z4NcXCp6KuDhoB+aC22G5kpsD9xywZlaJGho5M9Y8X13b2AK6D1M/G370SeRB77
 U/SAbBzHAXplkNa4iPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_07,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130342

On Fri, Sep 11, 2026 at 09:06:37PM +0530, Nabige Aala wrote:
> From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> 
> Add the DP controller description and compatible for the Qualcomm Nord
> SoC, which provides two independent DP controllers, both wide-bus
> capable.
> 
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
