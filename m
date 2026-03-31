Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912B7395260
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 15:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774969287; cv=none; b=GbI3RbnEmPoEKEBS7SJdGc3dsvybe+mHqsov8r/W6pnV7YZJM7Q7cyfRT4I+KBL42LlRTmQzvqZ9CbFLdVGDPVQ1WCaUn0ampuyOO1xT8YvkM3W9PhxXih2OtepSgK2NLoPBmUyfEdaiUhFIp9Bmy/paXNKh88nlRKJTYyR9yyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774969287; c=relaxed/simple;
	bh=IGh1DXSTms62QIsuyanl5ERe4A3JOzmSVSNw2ZHf07g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SyTb8WWZTa+5LX3n3eV5oiZjHlJiTFCAUKIL3fiHXh9uhV/XLrKKP24uL3lmN0/+fuefKgpfTpvSPQXG9vnBCjK6V9GyK2sWNwkMWzqH6sqYWAYwaYbtTtTKAInp7yZXlzl6+jx5FSp7P1yfNeMHiTgQ2ClmgR/3GL8IIMf4HqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CtWYsn2X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MCr/lKIR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CtWYsn2X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MCr/lKIR"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VBIuMW2408831
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 15:01:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iGKZX/BUGzT6h8NG+iSYgUMZ
	RnWrIOl4D2qOqQdlIH0=; b=CtWYsn2XGUJ5Albxfn0ABBSzAhT90w06rojSFjcH
	ctdaREu/5goXnHGCmrAQAS4Gn1+SjTZ/Iamxrq8PZS2SWH8jJjcNqcgbKwurWt1f
	S0W813NXBMoYBw6VYrfo/IadW+Teg1mShkYzDyN4fwW48mucZ+hGcmrN3E1TmtMe
	wjYJH+hgTcnzA90iZz3tb+/EL9gA82U3glkVrK5WULFCw2UyJ0H+MoCSQtKqMf3J
	HCaE7hCy4J8LQ5TEovt/p0bM1CR/LbdP/vDeiiH7W4ndlSUyLOdeRFqnvknNcX1a
	KBbGZe7Yz6E4bKIoGsT3PbdGqixRc7BvD/iMZL/i/K/S3w==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d80heut1j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 15:01:25 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-94e9d49f7c7so11811758241.0
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 08:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774969285; x=1775574085; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iGKZX/BUGzT6h8NG+iSYgUMZRnWrIOl4D2qOqQdlIH0=;
        b=MCr/lKIRIjfdEoQuymmk6OhnAzMsMLN5Fp/4VjVbaQtALThzLRbdGPG9+UvAgHaWa1
         yU5FrkqasKxsJTISWjXGufO0sYac4dgINXUkm+7Bk/HyNiwDJTb93D4dESWuFfexL722
         g+mvAQlmhY1fWtVVBvgBZl0+3ZzjMa3qT85R1N1i5wKXG2XRDW7oBkc6mKT3UUjh6q9a
         CPJNvI7zBUaaIgWfsvFfopAg5qJUCnU8zIE+ZdDOAgkDsy2PX/bwq2wRFdsseLnmdzHI
         F4XrjPSTPt4OpiWeX4O9pHGoCGI0RuC46lw/PIOXz2hTHHJJE9wep7VM0fPiwi4U2ZBM
         bz+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774969285; x=1775574085;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iGKZX/BUGzT6h8NG+iSYgUMZRnWrIOl4D2qOqQdlIH0=;
        b=pzZ7GK843txU0LdKsayGYQaZ2PlNRZ/ysyo2T06h2aGm8nj5uVxAOwDM7vluwyiQgF
         yYtckrWaiUQKrkpSl5iBTIqISw34uCCzdud1zn0a3NAUzFcVInSTiv/RGV6KXvo79IkV
         ucF0d3oSkbt7SXfblVX/Vl1EI4vmrz/LtwKRKP6kaHy2EcTc4PaBshuzYa5zAMBya2RT
         E+L+eIqNHnPFJ5G3Q2z9jmYIVD58hzPdavCR6vRGakudrMM0Cnvxm1r/+62pec/miPns
         iyCy4abfvg9KVIV/koXYc4jFV5TI1UU9HKiosgRGcWcvR1PDWcZnWsiZzovQeECrHM3N
         ZikQ==
X-Forwarded-Encrypted: i=1; AJvYcCURzfDtZERhppTPjXu379Qnd4Z3jqgqdvl5YhfVXMqQL13kODbLfxTReFt1ls9Y4jqhvF4n7PEmrXy7@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/uyVpXvDtq28+E7p81DNa1fwcCOm1zIspPCI+v2FA6Zq59pVs
	2jzKDm9pBf16B8KDHn1xMCAwWAODMt/CYuRb4mTqQGPwTC5i/oPrsoO77ZkwfpUYxkktMIk1mzY
	8/36Zob3hccWA6cshHa9LDiNNHXLfgYAFZDKwrnKWC1n8e8B9l/MpmcYNSTF1/q9j
X-Gm-Gg: ATEYQzxnj0kbpSb2I9lm2Ug9uq/9WdLWU3HfLTz7/EMZiHyfr/h+B0mWMnoSQZDg1SZ
	+c3pJtO+eL3fy/5qGx/s5ZgbF/ogL1O++yOlxChfZXaNEsza48YKfQfAlbSv5Zn37xk652bFCkD
	b3pwdViPLt8em4dvUvj8zTFIUOSwHhSMl8R+KiaVn/MU94m1U9ihyjRrrvuiij2Yfa0jNmlTzvn
	NoYWf9134Y/hZ2oO9wcR5GzgZeG3TzaUDigubOe2uLezdwry9oR3/uhVHAwW8OX5OnnQxHxFQBW
	QdAnA/YQSDOstP06/TLBOe7vQoxxu46+73who4YZf3Mi2aSmfGSwe9QJuveZzuFl1DjCrwBVbRZ
	Od0mVtLB6pL6crPUcSXJZFeSHLy0YHasJUFMTtZd/OvuMeJMMq31CNS/GwmwU9iFmLBrpxq+GVw
	d994ERLGVAYI+FAUxagY4+LhHSAfPdZxlQ0HY=
X-Received: by 2002:a05:6102:808b:b0:605:38d2:26c4 with SMTP id ada2fe7eead31-60538d26ed1mr3475622137.1.1774969284628;
        Tue, 31 Mar 2026 08:01:24 -0700 (PDT)
X-Received: by 2002:a05:6102:808b:b0:605:38d2:26c4 with SMTP id ada2fe7eead31-60538d26ed1mr3475468137.1.1774969283481;
        Tue, 31 Mar 2026 08:01:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c836d4381sm22780401fa.2.2026.03.31.08.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 08:01:22 -0700 (PDT)
Date: Tue, 31 Mar 2026 18:01:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>, Joseph Guo <qijian.guo@nxp.com>,
        Marek Vasut <marek.vasut+renesas@mailbox.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: display: waveshare,dsp2dpi: describe
 DSI2LVDS setup
Message-ID: <557vnv2cpd7onrfkrzv3wngfdbznrb5bxmtmp2t5utjzmuhu62@6z3ihzgsr6po>
References: <20260330-ws-lcd-v1-0-309834a435c0@oss.qualcomm.com>
 <20260330-ws-lcd-v1-1-309834a435c0@oss.qualcomm.com>
 <20260331-roaring-carrot-stork-edaef8@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331-roaring-carrot-stork-edaef8@quoll>
X-Authority-Analysis: v=2.4 cv=Gb0aXAXL c=1 sm=1 tr=0 ts=69cbe1c5 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=UKDlnwwNcwxo8CKECkgA:9
 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: hOXcIw5LnLt-iyqBwiIZfHbU2CVIv_Hl
X-Proofpoint-ORIG-GUID: hOXcIw5LnLt-iyqBwiIZfHbU2CVIv_Hl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE0NiBTYWx0ZWRfX8NPzMp98688V
 6amH2IViS5JCtGGTgMxA3xkVBsBSUi/UZzLVmm/w4tfmvXyaf8QQvL9il2yQc/ckukuq5UgM+W8
 4JjNwj2ALvOfmkgbsf37MLNBdSjd+T9vEIIFhIFBkr4VrK5kL6kukRUPCBmdEion4urh+bKxpkb
 zm2o3GbDVcwIYwCGBuMqtA9fvnYVXY/qjHjZ08zI1NyCAneT2sm+++vl8OeaGN3nwRos7rFmHjY
 OyCyrtrkGnA4WgAUlHEkoIwC0so+hzLR/sbD103jLwMtmOBypKZwUz7GQRblS43+ZeJzRmQf93R
 omPyvDB8fGbAtTY4BIoMnt+QtTNl5Cn1C3OmcejNgkkPkItA90yz4Ts9VoJIKMGQGumdq1mwZ49
 7Ka2Lb5S+xZXuIxqjOHpdVRHpgsE7ppiCwxWwPkkO4XOU1mfPrdTB7O2IR9x7b/h04lOSpgzK8D
 nnMEaIVPQOr6l1VsvMg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_03,2026-03-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310146

On Tue, Mar 31, 2026 at 10:40:12AM +0200, Krzysztof Kozlowski wrote:
> On Mon, Mar 30, 2026 at 04:25:50PM +0300, Dmitry Baryshkov wrote:
> > Several the Waveshare DSI LCD panel kits use DSI2LVDS ICN6202 bridge
> 
> If you know the hardware bridge used, should not it be the front
> compatible (with waveshare,dsi2lvds fallback)? Or even alone? Can the
> waveshare kits come with different bridges? I guess yes, they could.

I assume so. I have only several samples. Probably we can decode it from
the kit images, when available.

> 
> > together with the LVDS panels. Define new compatible for the on-kit
> > bridge setup (it is not defailed and it uses Waveshare prefix since the
> 
> typo: detailed
> 
> > rest of the integration details are not known).
> > 
> 
> Please also update at least description:
> "...converts DSI to DPI or LVDS."
> or similar.
> 
> Best regards,
> Krzysztof
> 

-- 
With best wishes
Dmitry
