Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291EA411616
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 15:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774971887; cv=none; b=uzBVXNKTCy7OVKa+9kRiHUZ/sTsxgm4D97w9qHCXShlUIXeHKbbWmTws+y6E0oIhO2QABBxugATngj+wyPxz9Vndtv/khGOGkF/wMY/g+9yidxH1+Cb/Y9xfxyG6zz+ckhcvi/WSXTzwJpgDnk+KjlI5L5bXHWho5Hb01Cb/X08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774971887; c=relaxed/simple;
	bh=V7ZQyqkKmH28mdWpIAXA3DSSDJFTH64RBUtkjqO3p7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OlmTHbY4SsHYVpX9f+2yH/H4wFWaNHvuy/6JnY9y45al3q3Usczje7NWp7ypZtPtj9XGvzSCB6VzwJMTknqIPgRx42zgpegHbyhZpFhfb+FlGpd7gZzJlvhWBWlLj93kEKaXQwaxCkGQwyE1tqda4ci6uLu2qtAtH5XPYRmQ+H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fyw1gg6T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xm/H5U6W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fyw1gg6T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xm/H5U6W"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VESWMF331977
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 15:44:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6TAf7nEBKKkrb6urwtK+2WvS
	R6mnnMsyYenmFBA8pss=; b=Fyw1gg6TkUdSA8BJP93PR/LKuBvTeNeDCf3r8ygR
	YjOeDevTbWh9g+LP3pWOHl1/wPr0Rc3Ub3oTLNzMpvsuP+WaWSJAg/D3Cm81ZH8w
	qobvJM4zHAyjucIhXx6+4l+sduvt+QRyZGHV25+hDgDamj8ZEeeeuykHreizT0Kc
	tGQZGRMWPgg3rKrS5GgMcIAp7Y0pKrKuwB9jw5LyHgrBjLHdOs94DOIYS0mzF8B5
	HlB5GK7l6WPr+hpUiBtE4upJFDYRvfecByuZnbgYRPZdT7LEnAF/nkF0Z+d1rdLS
	A9cc3tP/FKPk7QLwpmvDSOkDi3fkRMlD6R4/sIC35Y+RYg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8g2arc8y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 15:44:45 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b44f7b7bbso187699331cf.3
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 08:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774971884; x=1775576684; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6TAf7nEBKKkrb6urwtK+2WvSR6mnnMsyYenmFBA8pss=;
        b=Xm/H5U6Wyout3PxXvkeBwbAivwFYb5BmPAaqAKZV0cs6+LTclnomvIX73HQtq7GQCC
         v1bsvxJltxbpgKYaeVAIFchOTGUlTINGA3b5kF3rSq0jbHY4lBuw5CKe8cYkWdJIfQFS
         iTKRUfiZWxIQBsVLvlfjoZVJXitjNlGQfvx6YsJUesIbUZ7R/qwwgUseIRgHiK8HCrwN
         W1WSd/91ut0wgyc9MRAtDoW/2EH/GKyYlJG5eP0kuJx/1DiIa3rQw8ea+buD36ZWrUot
         Ri696LxEPpdmM/dWsTYeZ6Pm5WMEn1yvscTZAALFn6DeN8ODG8er9pYSi4e/XLJZIKWt
         oJuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774971884; x=1775576684;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6TAf7nEBKKkrb6urwtK+2WvSR6mnnMsyYenmFBA8pss=;
        b=Kzip58lmyM0ZoXYel0LR8q9tM5FEyzj1suNkNkGvzpvVd+8XM+JrL3KbuIMxtCY0ll
         YwDQyjxHUiHsH/MdRPYAcK/6ljVU2cyBmiH4LI3BYjLZfHXC1GnUFK/iqaIuuhzQgwtu
         WAFlz4aqJM0a1Yyc8WpiB4NX7lf8VCWbMDNv910YxiJUisBEzR4m9RuHGwhVeflzs1+H
         xGcLUIN/SkQ+pt2RC8Mpt+dNregAQ/xpqg8OAw+zEl5fCAr5BysPUnH7W9osoDCLA83i
         XXgNZWKrl3GhkiW6dti0iJ3bT/JJ2e5vB28mwrdmc2rDaRLzTnCO6hdlKZA+UVHo7srl
         1htg==
X-Forwarded-Encrypted: i=1; AJvYcCWM13Al4hDjyCUAvYS0y2HxZw32Tj9rZXj02oezFZYctWAGcAonAZEoji8SMN6fa37H0fwFPIYEhg57@vger.kernel.org
X-Gm-Message-State: AOJu0YwPVINtSLr1zugO42vJJh0e+sSMc8AuQgINSHETj8j8yGtCqDev
	Gv2pWYB54L7EjuWPbgaUodh5ZGKEBopdWnEuA4ePiIUdUNw+COjKZFcToUlfMR1YIOAXqJHhNe5
	n+vAmqj8QMru/bZbJh5GrtTkfNhAeSPmkHpTJ45F9FCorwPCVRBlzUzE01Wu+tOff
X-Gm-Gg: ATEYQzw5+s83NnNtTkhe/lmE6eQVENUvnnWyQqM+MQakgG2H/s8hn0Uyyr8PDP1o7Eb
	5eLilhL2inr8OM96QXS5n6AF46xG66D2jy7nxw+dbBENgUu2KwUwvKzD5jzD0QHUTJb1OGyD1MP
	i9vzslTQtwmX+55Ylwg28QqHX0i5gSTHE+8n4PtyFgF0ZWE3yCnqpszaLO2LmRnChwQ7CYq1LzN
	yrI/EmQPp2u+1bW/HcfXr+ZOpNq6BcrqFSmHcSmHf4aeXu4rIbazR4ojbGIpprpcD8P3WAmtOgH
	MFTBBiMhElA50AKVqm1VGXqt8QBUJzG0LWFY1iw53lNHWmdGtxVBCnFo2Y8mAA+XFrxad6uns2M
	lrf3DUSeAXNc2ydAaJEVr20yrWm1ZUYM5ZIgK7vCeYPuWolWffFzH3xXoCm8vE9gvrcNWfXCLqj
	2311s3U3ht1fhVhG1lscej/kin43nmtpMDZ1I=
X-Received: by 2002:a05:622a:2443:b0:50b:4b81:e376 with SMTP id d75a77b69052e-50ba38b2183mr217156031cf.42.1774971884367;
        Tue, 31 Mar 2026 08:44:44 -0700 (PDT)
X-Received: by 2002:a05:622a:2443:b0:50b:4b81:e376 with SMTP id d75a77b69052e-50ba38b2183mr217155421cf.42.1774971883843;
        Tue, 31 Mar 2026 08:44:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c8389524esm21709301fa.21.2026.03.31.08.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 08:44:42 -0700 (PDT)
Date: Tue, 31 Mar 2026 18:44:40 +0300
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
Message-ID: <ffnfk5styiydummm5pb2psvojoucrfn43k5f6d37hnbhyus7k5@3blckxmwunbq>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE1MSBTYWx0ZWRfX3PsuqkCNnCcT
 U1Tfki1HG7VxbiCmrymQbnx2phBc6KgDR28UxHeNLb8lfiTYuQsns1aTXBfVWbADuRJlaQXazOA
 D2SlTc9dMJMCdp3aaehQOORXePsJDtyifXlsZKCZhWL1NXeg/lDd3aCixC7yW7fzSBg3qG5Nskm
 UUQR0mHWWvyo4pPTOhBSabtG9gQkbaqkBFcXWAPgheyw+pxNdnzpRZbl0jgJr1WcLtpA1V2cXZ1
 7iG38inQTy/5xsKa8FfhFqTBrbHnsj6pR5V8JKjDe+gP3PefvabVbnV4dLb/hrp1hmsvgWZxixL
 CK9tuBlix9ajK8NutkMk4PzsONXtvfxzXmS/95K4RlVCvaX+moOfp3aLpkdfNR3sgm/eRpk10b0
 LDLcEIOGGn4EJXZUQHs3UiAdsSLqp2WyoNK7Pp+fbUgHONDlCxTV4zSAH/NdiVtFYaogfTkxoGI
 QXHgPaT4wGjmNLDlpsw==
X-Authority-Analysis: v=2.4 cv=G4ER0tk5 c=1 sm=1 tr=0 ts=69cbebed cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=DPn2wOqBzvvA9j5Ou-wA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: mjANKIqqmtfdpckNOV3vHpSQTSLCZtKd
X-Proofpoint-ORIG-GUID: mjANKIqqmtfdpckNOV3vHpSQTSLCZtKd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_03,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310151

On Tue, Mar 31, 2026 at 10:40:12AM +0200, Krzysztof Kozlowski wrote:
> On Mon, Mar 30, 2026 at 04:25:50PM +0300, Dmitry Baryshkov wrote:
> > Several the Waveshare DSI LCD panel kits use DSI2LVDS ICN6202 bridge
> 
> If you know the hardware bridge used, should not it be the front
> compatible (with waveshare,dsi2lvds fallback)? Or even alone? Can the
> waveshare kits come with different bridges? I guess yes, they could.

After additional thought (and an email to Marek): the actual ICN bridge
chip is an integrated entity. It is not (and it should not) be
programmed by the host. The kit handles it internally. As such, I don't
think we should be a part of the DT.

-- 
With best wishes
Dmitry
