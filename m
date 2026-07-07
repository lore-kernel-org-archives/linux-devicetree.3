Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F1B424646
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 16:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783442406; cv=none; b=mlVdjP+LLhbkQI2jFux8gaXOe4y23gtsEanVy+rZ68R1T8+xfD/U56d5A1as6mN85wILJVr6Az8xk3TEaTAmtWy6Xj5ViF3YtIFKZsMvoCaa05i9g98N089d+f6PrrhxiQcDHk9/fNn194NsEOcYkwjcPb8k6UlcaGhF4NwC/hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783442406; c=relaxed/simple;
	bh=1XRsvNIGdAMhpe6h6Rmr9ffQO30RuYSohh6zIGmdAfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bloN3Ve7WynHjFj0eYtTxoFZ6VwftLvIX7U1lGFd9i/EBghL6blr6vxpL22oX83Pd/Vq2cqJYXMA+FpXIfBokDtjpaEOVbBEcdVhHUaG2ZrYPEGjACYIEsI0+P1aML6yO5SnASd1PsYFVjzB7anIqbVK9K5SqUlSM5Y51I22x30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MiYr/TPI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y9VKBHVV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MiYr/TPI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y9VKBHVV"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667FT1PO4072802
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 16:40:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ngMJFXW0MVpSyT9cIuB08wDD
	gujyroBQVzUzKlhc52Q=; b=MiYr/TPIV1tgnI2ssrts3PiyItGY+zxGj8RBOb/N
	1US8orSQS1Kqkf5lDLxiYel8uxWhE1agG5lZh4l9NrQ1+3s3uU1iu/VQEr93MVLy
	hLqRCwJEW2fTBgHh+GNsCmTRW0NE+TllBeUgadAL6gokqzklRbdaJk/4GDfpKVaS
	GHputQFD0WBQhDtgOgcQjtX3N97uCAAqy2nFq2EYtzlm1iqSm/Qqzu8Zs24Dk0Fx
	qg0cPK8IkgftVeeByYZ39VmtZm+mreJ4g+8P+NdkDKHnkoDGrdFPyJKu3opDXq/4
	EQnaEm8R8JojofSQZN+MI6uHIH2aGXhvJf9hoINEC8deWA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8vun2a9r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 16:40:03 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-73a5cef4811so1034396137.0
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 09:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783442402; x=1784047202; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ngMJFXW0MVpSyT9cIuB08wDDgujyroBQVzUzKlhc52Q=;
        b=Y9VKBHVV6OtObTeC8LPoa/cxQ+VYxkrzQhByh5Na/rOr591GMouVJjQaOf730Q1pPP
         QYeTeF0nOhiF4OEkQb/VF0V3dz8YJEDScY5/N5DclTEI6UvyQdCNJpGMy4Dgm3qovTpN
         eZSSC7jwZZSDTvieLMTcO+EdKGUK0rwQUzo8khXIgFAaSpSBwMAhXrs+cnHd3x+1EgPY
         Qkyg2lCP21TIF/qSi9wyBUYDqM8nJkZmQ9xWQ7/4TT3Bk7mCJez/zMjyolBlQjR2BKQV
         Sj3kZIUBIEPl5++LsWsBpDm7uXUcdDCuHPqTh4fK2Fx1c1ePUvo2s5rGUDTamJCHPq1x
         yWpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783442402; x=1784047202;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ngMJFXW0MVpSyT9cIuB08wDDgujyroBQVzUzKlhc52Q=;
        b=dlGg84Ye4trhBZcZ3JO15Hh6CJ58adBsfR3HvDaW6lwLneW51vO06XT2fSTY8PndOF
         8ncqifqznwTtCsJuXF5OC5ZsJUggoFdeyko74Vq/+2iECTp3PPM/Tdu/AxAiNjwI6TQV
         w0VV6Jk8bsq5K2DepYlXECqEG1fnwCvGbaPGvBYy0EaWCeDixCxjUzh9b+eJJ7BCJtf9
         tl7hma4y9hLuQmnkv3sColQXrQtiRLBD5xtQpvegl4h4VaIcDOlfET1P6nhbTNhJaQ8u
         LueYhj1BjIB0PJKW2lAmj8zS4SA1GHNcykT7EwYW5Oaa2Ws5JLC3L2n66qlBI/eQSuBc
         jMkQ==
X-Forwarded-Encrypted: i=1; AHgh+RqgYTxfgzwdRjt59lBf9qq8dOrJwq1mRkXbibKQwuGpIm2v3VFLya06VA/dQv+tbVY3nxw5thcHDQYW@vger.kernel.org
X-Gm-Message-State: AOJu0YwwFgpB7FEZyUJP5tzSOPmK1fYlTt7TIRsBW+Ju2B0GPD2B7fuV
	qEDm1UoD5ohFA8j+CatNOrZGgVw0EddnsPM4fVdXu35tV2Dg2ggyRCATiGn1tMkDBuTbWX33TR8
	i3OC9vU6xSqgcF/rlHNTtzEmojXfV3ZfHX6LjtluLZMv5ynZtKSdfRZnlJteiiAaU
X-Gm-Gg: AfdE7clb5tUY4cdesI+rVYXsOM8lU2C8/8h5TzC8SGZUzPFuwDIMPSUupQo817CcWRU
	Boo5stN5rZ1MdkUq7YDxcabUKSBknSj7MsuP1cW5d5++veoqeV2SWpQAhSNJdR4UNgR0Al2y6vM
	fQvqB3xti+yyG9yhGV3fUUTekaI0CfGubpcD9l8WX+TxmlO7i05YOqODlRVt5b1WRFNPVlX+9V+
	CZOyUdtLa9thbLgT2g9WSqNm97Y+FztnRBL7Ws8xST/e/U87tvSuQ65jAYLjrnPsIucnI9SDqaD
	VF8gsOOH6utH/rKcW/K9b61aRxODL1YdBhbGwmA31cxsL7awmw+ExhOK3zRJM4SzmZcuCj0LSm0
	fC3e2/pb8qcwd0ngE2uo6XZM9fbnKmj7cEjXS0uQUZjxThtIxAkrZ0fNRgmmCFyUnV+RB3gnf9y
	M4hV/cnlsXrLDbKH1OPhlFAREk
X-Received: by 2002:a05:6102:5f05:b0:738:be7b:add3 with SMTP id ada2fe7eead31-744b7ade412mr3295748137.6.1783442401886;
        Tue, 07 Jul 2026 09:40:01 -0700 (PDT)
X-Received: by 2002:a05:6102:5f05:b0:738:be7b:add3 with SMTP id ada2fe7eead31-744b7ade412mr3295690137.6.1783442400917;
        Tue, 07 Jul 2026 09:40:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bb3aasm3792026e87.53.2026.07.07.09.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 09:39:58 -0700 (PDT)
Date: Tue, 7 Jul 2026 19:39:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 03/13] drm/msm: look for lpac from dts
Message-ID: <m4vwrqt6yyaawpvkyrqfzs3kbipbhygmtrhphuthl2gmjvkgyt@u2d3dnvl2phy>
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
 <20260705-descriptive-name-lpac-upstream-v1-3-01d50c3e0c99@gmail.com>
 <rwohvfbsw2brpxrfg26egu5arwe6g7n2etelo33eegmu5cz65k@3syofuxzsjrc>
 <dc5aef2e-600e-4e97-b76b-dcc8bd72c709@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dc5aef2e-600e-4e97-b76b-dcc8bd72c709@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDE2MiBTYWx0ZWRfX4cSn5sHMZ5XO
 KNS0uV52hOywiBGFVXxWoEEVHvs8zRInppkvjbXOJrIR4pNYE2fsWQGmHMLT8FpDIw7RY654eHh
 vvZpdyU/xr6IxFj80RX5HksY+AOWR7g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDE2MiBTYWx0ZWRfXxF2ZVSq+j3/Z
 CwZ9JJUFpOOx6fCgabdo4u+M5DUk6Gr+xVSEY+spWJymBt3AfFCnIvm2796UM4T2bFVkygp1O5Y
 XGtgTOD3LVKE5cYTgrRXGDKPiZ57YHkEQBDPTaEkp2laHq/Oyj0/5LItU+40ARQMNjGXpYbejhZ
 lmlJH26S3BJeeCly6c/pCHSdpDqO7IlxVsGk+3X3QNZQMKKRCSnxKwFxILQrPfThDGXX1T1WzXm
 zrwHkrngefTt/hWgUsiTW9Xb+TYMcZ9csV/vIHXwEizWo9dY3ZI7aSko5dtSywaG4OlnSntkglG
 iXf+uqsPzFJAeMPCrGGgXSMoU6CZj7X93Q1gjnqCbty6lUSicqoKhmFhHC6PW3jHVXSHBnNmBm/
 fxK0UeCwh6g7ZBOVo+ymXLrfTM2DN/TsW4MKmt+mWeRAy3XugQApsgVb84p72h2R4HMr3hoSahv
 EmHnXUZj0FXrjsMmV4Q==
X-Proofpoint-GUID: jN0_MroszPKWPZsGxihZKcgDBiBbtTzJ
X-Authority-Analysis: v=2.4 cv=N+IZ0W9B c=1 sm=1 tr=0 ts=6a4d2be3 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=pGLkceISAAAA:8
 a=1fOCVGvR8NE8L1w4xeIA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: jN0_MroszPKWPZsGxihZKcgDBiBbtTzJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_04,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070162

On Tue, Jul 07, 2026 at 05:02:43PM +0200, Anna Maniscalco wrote:
> On 7/6/26 5:04 PM, Dmitry Baryshkov wrote:
> > On Sun, Jul 05, 2026 at 09:13:37PM +0200, Anna Maniscalco wrote:
> > > In order to associate the SID used by LPAC to it's own domain and
> > > context bank we need a separate node on the DTS.
> > Can we use iommu-map instead of adding a new device using the same
> > addresses? You provide zero explanations, but it seems like you are
> > trying to separate a part of the GPU into a separate device, but it's
> > unnecessary.
> 
> What I was trying to say is that we need to map sid0 and sid1 to different
> context banks.
> 
> From what I recall, so long as we use the same dt node, the iommu drivert
> provides no way of doing this.
> 
> What kgsl does is having a node for the iommu and then subnodes for gfx lpac
> and secure.
> 
> The address on the lpac device doesn't really matter. I have very limted
> knowledge of DTSs but I think we could just leave it out altogether?

I think, you were poined to the Glymur Iris patches. Another option is
the QDA driver being submitted too. Both ot them use iommu-map to
describe the same usecase - a set of SIDs which are used by the device
but which should not be a part of the defaut set. With it in place you
don't need to have separate qcom,lpac devices, no additional properties,
etc. 

I'd recommend following the same approach.

> 
> > 
> > > Add the code to look up that node on initialization.
> > > 
> > > Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
> > > ---
> > >   drivers/gpu/drm/msm/adreno/adreno_gpu.c | 21 ++++++++++++++++++++-
> > >   drivers/gpu/drm/msm/msm_gpu.h           |  1 +
> > >   2 files changed, 21 insertions(+), 1 deletion(-)
> > > 
> 
> Best regards,
> -- 
> Anna Maniscalco <anna.maniscalco2000@gmail.com>
> 

-- 
With best wishes
Dmitry
