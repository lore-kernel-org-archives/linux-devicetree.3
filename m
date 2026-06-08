Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FAC379971
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 07:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780903185; cv=none; b=PwiAt/ajbiGDG3wg5gJdWzfKhXJN/CGQ1OONoaqEmAOFQZAp66X/yPT6uw83XlMz3okHyQ1GZIaFRdrIRjK1y3KjtocQnHeIvEK+WJL+Li6pMPY6zUc7JlBTL1hhxGgXDShLrxytt1qk2AnPVlnzIQoRFtd26NJ+QGdGq+qlo8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780903185; c=relaxed/simple;
	bh=qD9e4KyK1fIzkRMHO6aMKPF96czRHshznS/0D0FaTMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hh6fNewlTAAYqQdx/uMy9IIPbLtzQ8i942GU1h243OBWhdw2+UhVeTlMK4clDLhGhpgJiLexgM6zHAyCGQTRof555oRngYk9fV7Fm3IraDjR+AxGxYUJLkkR6vZbOpX73qgFI/c4Dn+6/S9ZGigPpAegO8444Fh0pRb732xr+Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jpcG/D0X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EewQ8xe4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jpcG/D0X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EewQ8xe4"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586OmD12317608
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 07:19:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TszHFZ7K4js/ZAFR2FtK66NQ
	PI9cujME4oGOjetByeg=; b=jpcG/D0X2/E/WrFN1uFBDKV/q4WUAZwxEvep5M1J
	j1BiCdduPfaq02JEUHAzRRGLIAwq7CjazfFRjN+HyM+LAM2dyysoT7hDLqIfAvXz
	9Nwg5sfFc+41cIR/o+5tI5fRue7n2BZoRBGGIh5VJLcSrlIjAnd39++ucNtF89fP
	bKfGg8DXlFg8BDDJFMlnFQDFUXh/JXj1VoZYWzUC8f/bcUENSh+7CQoCmrODHd/2
	YiSkB7eeV7/TuLUszkH9X6BWGlPIN4wX9gb26VtOQ97G5a10pPn7UCuS583WphJE
	jp469EdWpssWsVebwH5dn3ZN4TXUWvfxF6wbVymaoP7obQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcadx850-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 07:19:43 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-963b099b539so6169768241.0
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 00:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780903183; x=1781507983; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TszHFZ7K4js/ZAFR2FtK66NQPI9cujME4oGOjetByeg=;
        b=EewQ8xe40CpZ8jV5y0H+pOuGV2J9Pf3kMDp16Eix0BSoIqyNFNy8NOzmt6X/ZjFx4E
         SRiBox+bnDB2hF5JEdoVn7IcqGjcphAr6E/cRJ0cOZasIGRcYuoGg/oLtAELPQlnuVFc
         1JDHbcmp85QDzyGxjWu5KltpYcZVW4gfcYJklw8fH4o0fC6MTPjuW6FI9bAZK06CsZ51
         QK0KCKnFkyPjEtJ6Wyta1E9WCNs0taLytdEEbOI7+NR9v1fGCrhQ5ekGLu4QgAIZx56h
         3qehLIZBTmBrbos1M6xoC/dTFwWfaIhT1w0ELWEUmPL0rY7xvtr7Spjjfz+MuaorOlmS
         Zr0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780903183; x=1781507983;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TszHFZ7K4js/ZAFR2FtK66NQPI9cujME4oGOjetByeg=;
        b=SkgO6LRkz/eIMkI2+82BKGUq98gOZsktRM3UZI1NjnrWJqJJYYil+xeB+FIoyAUFxJ
         z3xTzvFRWxHo2G3Fsbn7/dqVg4iZm0kcmEYmLJJN66LwHEpd94cvWXGOwmqphftAC4G1
         bhY70LqlUJjwLC8/8yn/B9YPj9qq6Dj59WQeEnPqi71RSv0ypCbjOZ932sl6JnKbltgr
         V73zh+gFuPp2wGLiq2GIuM6ui7wmiPzq5/eCkEI8fusD96/bbsUkDUc6rJTrRh6G9Pk7
         DfoJj8uWtklehwEdhqwbcgsp7/O5sW16bftPxb730vTu38C3ggOryslfE+JUZvhS0Wxk
         2Q/w==
X-Forwarded-Encrypted: i=1; AFNElJ/C0WlrWvYZQZ+JfjoNtsBwaZ4brEHBgzFPnKi+Q2a/zUETaqZrgKbf8/6H2HWZDziYJs78Bn8mNAM1@vger.kernel.org
X-Gm-Message-State: AOJu0YyxqeVzjoNrr/ObaeCJ5ypCOLqfv6ya58iuTKBqtKt5KR+TD4z1
	/4XzYWpPQqevjl6H1ABHUjMrggp7BmfaFIo1QCUtGRyM7cANI7EvToDD2EB5dGgpRW6N7u4Tya5
	GshfVYtMv+WViwt+e0Lb1c2bdcqW9MyN52zJ39uPemuGWEcwlTETdeTbNW25A7e6D
X-Gm-Gg: Acq92OF6D/unz9JhFtz2FBDPlxpv5COkH5tQ7koW511GT7c6DcijgoLNCx2dAX4HL7p
	t3ElnG1wyeWRTTGJPTlLgiVX1j7g5I845VwBUo70PwnZoSwPYy1f9nhgT00u+KHB1c9TLfvz2Jm
	9QtFGTgsvxUPhOhHOoZ58ODm7soBc0p8QtQZK+13PT6UBQcsdGsfHGbKE5N5gCZtpMaCWkj+BEK
	IcTtMcJC85qo4ybG7yUZvGu3BZFFagkzhv4omGjLl6DjKqhIqH10yXa8YdfwCaBC4PF6q/N+kic
	h/lTPaqaofjGaT6//EReDVWaIbS8jOlxR3SqN35b5c+F/RU6XEoRQGiViWZoEydmwdS4yGkLwnV
	Xqsntp+A0RH11t7zwCvyVhzDcF49J88gp2oywtxXeaguKtnmmciQjKJ9z4FxAmAT0NJJ9DdyhBb
	P0dXP3kIUru/AgF0T+VpwHNAM+RuRTn5XVAW9lltGRQhnPuQ==
X-Received: by 2002:a05:6102:6204:10b0:6cb:b3db:c31c with SMTP id ada2fe7eead31-7001b3c61d6mr2919822137.0.1780903182948;
        Mon, 08 Jun 2026 00:19:42 -0700 (PDT)
X-Received: by 2002:a05:6102:6204:10b0:6cb:b3db:c31c with SMTP id ada2fe7eead31-7001b3c61d6mr2919793137.0.1780903182529;
        Mon, 08 Jun 2026 00:19:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8fbcc7sm3605566e87.23.2026.06.08.00.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 00:19:41 -0700 (PDT)
Date: Mon, 8 Jun 2026 10:19:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/2] dt-bindings: display: msm: qcm2290: Add Shikra
 MDSS
Message-ID: <dhtuvm4ejg456jy65kwbejdo2amrg2khaljlmurse4vkjok25p@rd6wd7tp4rwd>
References: <20260608-shikra-display-v4-0-88a846afdd5d@oss.qualcomm.com>
 <20260608-shikra-display-v4-1-88a846afdd5d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608-shikra-display-v4-1-88a846afdd5d@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=DIa/JSNb c=1 sm=1 tr=0 ts=6a266d0f cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=h5pAuauRZTFNeIU57NgA:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: 88n0-hImikwmlcZa7j2ucQodjvBCuoAw
X-Proofpoint-ORIG-GUID: 88n0-hImikwmlcZa7j2ucQodjvBCuoAw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA2NiBTYWx0ZWRfX61A7Bb8QeqTf
 j+XJNna0Rhqw4qY3oE5zB13q1gvk3TpBhaQCYi0Eh17DiZqD1mojVMdtybqAlaGMr2qO1Mi0LR4
 fQH31tlvxkp8ilrLlgXT1Tl+8+DmL8yo/uUWOTIQAg9vNHWmA9CMc10ai2puBmaRRtoxCl4dJv8
 2d8K7xrSMaKBwVS95yPUTkS3U74muby1pwBgmn9c6Db7UHbVHSV3ebnlJLnGLPlLbbNGAEVFFAy
 LSZ1Hq2KEhyEcvfRZPnqAsV+ayxcgK/zAOQlHdfbpP6XicZoSBDlUDL9xytgAZzYuCL+DzNzrO1
 62pmoD+ZFJSfng044kCitIll6/mvStubVLstr5YJwgoG97PpqNRTg0mS54QJgHssfxTRjpiHxf4
 qS2asnZDLu9JUJLy73m3lT9ixGJvISr+Ft6g9kvAHphK/pDih4lhP6WbYaeGNsQHxTlN3KDvBOc
 zSej2DutjdQqyneB11Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080066

On Mon, Jun 08, 2026 at 12:31:42PM +0530, Nabige Aala wrote:
> Shikra reuses the same MDSS/DPU 6.5 hardware as QCM2290. Extend
> the existing qcm2290 bindings to cover Shikra by adding fallback
> compatible chains for MDSS, DPU and DSI controller nodes rather
> than introducing a separate binding file.
> 
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  .../bindings/display/msm/dsi-controller-main.yaml     |  4 ++++
>  .../bindings/display/msm/qcom,qcm2290-dpu.yaml        |  6 +++++-
>  .../bindings/display/msm/qcom,qcm2290-mdss.yaml       | 19 ++++++++++++-------
>  3 files changed, 21 insertions(+), 8 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
