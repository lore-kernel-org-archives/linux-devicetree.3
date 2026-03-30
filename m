Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD5B39BFED
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 19:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774899556; cv=none; b=llrwOIthzY7LWDALrE+9v7liD774Youb4KbbhgHt8+M6hdQf+tMkeKheahSS3zZjPTkiYAK2nXVMpdZn4ayaOQ+2ysDjYrZMbD3ZLt3hXn2zJicexxSYQH4Zccy3kN1OjHM2UlX0ohvh5dxeZpfiOuB9mz/S2TUIJTQqNqUEc5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774899556; c=relaxed/simple;
	bh=oFytcoXIiR8Opsk3w+JvaLgCTxxpDh1YFywjXAt9ZJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HCArbTuxSEDkV1HJwh6ODnshv+jFqh1ronQFcTAA/9bYf8nPbiU9xhBo25zb2PUCV4pb5pAybbPcsvkDiy0B5v056Fp02yms0cptxWmx1LWOqzTl6QUkrESdhdu49sNxjMwt03PfWkU5glpo8lyiyhP1kDn26l8GG4S2vG79XHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ozLdK5hb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=agBiTFJj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ozLdK5hb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="agBiTFJj"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UDchkj2458393
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 19:39:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+34cAjsx8bqZcK2OkX0asGC0
	QUBSB0eVNVg2SXT/ntk=; b=ozLdK5hbRe0J/retiIb5TPOC868uoqZHr2IQJ9fL
	WdmtH7fVwbeLsAcTMgpcl3GGvM0aRjCTfPNLrT6b/mpzZL/lL1F5/Mfi1640T0qY
	k77f71kn484ZiR/P0Yd8dMsb+YshgLoh8am/RkRV3GmaYe9WAWT1VpcRFAxASmWX
	6ZH40ifh7mNVYUlicNt6YpykDGKrdU9GcLv55e4tU7iSGWJhSnMLERfz4X2uVAWI
	DF2pUkMubT7xFOeOeYcXEFceEX5FPkKWrO35uzQ3ydW232+LQahI2sz1ZpQMUHoP
	6i2LdmzD4QkHHyKeWrX/jlBJTth26VPB/dLaWiqsrZvUnw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7nnmtrrs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 19:39:14 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5093025ffecso155117781cf.0
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 12:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774899554; x=1775504354; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+34cAjsx8bqZcK2OkX0asGC0QUBSB0eVNVg2SXT/ntk=;
        b=agBiTFJjf1TxCaN7XxfgN7fA0lhULaPzA2cZTJbqCMBZ3yH/y3LSMa6g+KtwOvJ1LG
         DcONJG+7mlX4DrPWEYbGR5ISiGGWnIYsmfoFy7BrzHcNtpKxetCChYl8HgDU8UEsYZ9p
         ghmrKGTg8WL5AlJWvjkFYW72cDZ90jBE66/LA7H5EMSxOm/WgBaHSzVFqa2K+OycAy9/
         1AGhxhn18b/IbRNpJDmMwuWbgYiqPQvvd+oocW6sziNg6SyCkio5xoOVcAmXjOulL+ts
         Tz+qL4Gtn+7AFH2BTSHUkJUbTQUkbLSIa6A55ISTBBvouLz94IUGAkPeSAAtZpNNDsji
         T5lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774899554; x=1775504354;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+34cAjsx8bqZcK2OkX0asGC0QUBSB0eVNVg2SXT/ntk=;
        b=mJrynvXO2Z47eXjIecISzmvjdashOwvO4FR1Xql2fHJVou9pTYx5AVaL0xRwy6tKQk
         iua+DgA/LCYPejIqa264v50Zf6DmlMwBDf+5VCCEikGPCsLQeKFShtwBzzNmyZAtsGMg
         OtBdw1pqENv98Iu26ZabxiiyMneGdyP7O3y0eKGVADE+XUElZ9Z9nxHiiGZB60+4EKlK
         IcH2idpvMN7SJZCt3EFwOwaXs/G3wIqzMZxsSJ84dF7Sg14pNypyYyGU+wshhB1P8DgZ
         cDHzDJNeZCdzwGSuuFbCbKeRFFFGDrl1VGGpcp5Pk8KkybbqGwtFL7eM+1ElunlvNrni
         IEdg==
X-Forwarded-Encrypted: i=1; AJvYcCUWNC6FidKLWZvpH/oizeH0d0bJcks2zRf5TwFN8f8mFt8XCCxS1S51Pu+0IKaquUuE1xY5u8OQ6Yn1@vger.kernel.org
X-Gm-Message-State: AOJu0Yxdwo00sZ1tBoQWlNPR63U0ZVEXd2NOpYWJTLVf6jU2yRZPv3w8
	vvBh7KoCZTmCRVUdF6qk4fbkOMY/+FARStfij8wdZMYtoP7Hpr/MkjgtZe3PnsUmFw1GlWb4e4K
	IPdQwzKy2XmyveMyBmPXUZ2CAIAsKRkb+FgfFXoxwqZUSVlNjXK6FDrPCgZlx0upx
X-Gm-Gg: ATEYQzwXhrhwfHZGUjTx+UeRLDCo30mFRCWHSIMAiNZak+FC42UdLt/gEPOHCIeAW1Q
	IQJdU1wO/D1LWLxD9zKr2VPTOYOOzL51TM0OkNRYojuCmZw7QCtoZYlg1gXY7J99CB8TR/LL9qB
	/6P63qIPX1bVmgOfa9ZO9gQuotgf5iz4UYL9dV4ShmsMcIvO/hwRRz3tx50aS/LLLOscFQ4Yrg+
	1SjjQoQCwoepqFF/1xL2Lf6M4s/QHTRs5bRT0eQhyTDI2d8Ii4uhuTrdMHqWy6CpQs1Si0p2WN2
	2QWHERxGe1Sd2Ofvgvf4rAdLEPy86EjF8hYGnBIUuRPYh6mhCEJApseMLKXz2XR9H5BnXP3sTZQ
	oZg6cDBXqhVQrzGFUdSpYqEZJPMcy+UXzYr5+OaQv7IvIfqioCut6MbF7eFjBfYE+1GbYSEcWXX
	4s1pV2i3viADHzbH/SWey3m89H273V05wPC38=
X-Received: by 2002:a05:622a:15d0:b0:50b:28b9:b0a1 with SMTP id d75a77b69052e-50ba391db58mr184558861cf.45.1774899553839;
        Mon, 30 Mar 2026 12:39:13 -0700 (PDT)
X-Received: by 2002:a05:622a:15d0:b0:50b:28b9:b0a1 with SMTP id d75a77b69052e-50ba391db58mr184558421cf.45.1774899553358;
        Mon, 30 Mar 2026 12:39:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b144f4eesm1848348e87.57.2026.03.30.12.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 12:39:12 -0700 (PDT)
Date: Mon, 30 Mar 2026 22:39:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
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
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] dt-bindings: display/msm: qcm2290-mdss: Fix missing
 ranges in example
Message-ID: <yjow6vpqb5cxyhnvepa3humyhgnea4vrttlpdvzvh57ubbet5k@vuqpytq2qq7q>
References: <20260325122209.147128-2-krzysztof.kozlowski@oss.qualcomm.com>
 <177488647743.633011.6769674149013868210.b4-ty@kernel.org>
 <wsf7oet6r7d55i7f6cdwgor4cqu3hzgqcv3r6lmyfsoivzgzls@v5z7bbea6fxe>
 <05610919-fde5-4cde-92b6-a35c93e84547@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <05610919-fde5-4cde-92b6-a35c93e84547@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDE2NCBTYWx0ZWRfX60/l5LA+RYM8
 1Ekx+TeVdOBlAQq6Q5Ge4qy595PpmBw58/jn8ZCIZ49jH4+GUsq/AaxO6C+xbZ7lLwqof8c4u30
 PnkSvZhZg9qPfXAqgX17C4WqO2GWT4C03IW3JhWrxRzYU0eDqeixUzSX8LS77vTVXVNhvf0MWvQ
 A6BM9KMyyLGc7tuh0zLMKti0OD78Iis4Q8rDYuCqo31c3wcNMknd/8d2WerjhOrT37aG8bw0vDP
 WwloMzQkRn1DJSotVOcPcT0CVCxnIMY/tAAdnJEgb1GzlUSmLjbCLnm5HbXSuetTQHVATCijGj5
 Ug0jWYrbl4YODMt6u0YdzrAFOTyGBroKrND/pVfjTEeOOscX7HyNN1daPHaA2aXYf0PUx4FMjiP
 r2UOY5Dn35plVHBDhpm7EmZTAKsUND/92pyW73mPY/uRNF2YGUk/htTm2+fgyObDN2eIPu95cAk
 gM9q+qBACwkEKb/UFBg==
X-Authority-Analysis: v=2.4 cv=M4FA6iws c=1 sm=1 tr=0 ts=69cad163 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=vZIQzkT8WsM8uZE4rHEA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: u9-ufr4RtG6etrIW1aI4Yo5l6LodHlsR
X-Proofpoint-ORIG-GUID: u9-ufr4RtG6etrIW1aI4Yo5l6LodHlsR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300164

On Mon, Mar 30, 2026 at 08:55:04PM +0200, Krzysztof Kozlowski wrote:
> On 30/03/2026 20:50, Dmitry Baryshkov wrote:
> > On Mon, Mar 30, 2026 at 11:01:21AM -0500, Bjorn Andersson wrote:
> >>
> >> On Wed, 25 Mar 2026 13:22:10 +0100, Krzysztof Kozlowski wrote:
> >>> Device node has children with MMIO addressing, so must have ranges:
> >>>
> >>>   msm/qcom,qcm2290-mdss.example.dtb: display-subsystem@5e00000 (qcom,qcm2290-mdss): 'ranges' is a required property
> >>>
> >>>
> >>
> >> Applied, thanks!
> >>
> >> [1/1] dt-bindings: display/msm: qcm2290-mdss: Fix missing ranges in example
> >>       commit: 88bdac5443e5269bb39c4968d5ee0becbffe3f82
> > 
> > Hmm? I don't really mind, but...
> > 
> 
> Please read changelog in original patch. I was also mentioning this on
> msm IRC (although not towards you), so this is not done silently.

Okay.

-- 
With best wishes
Dmitry
