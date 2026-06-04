Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13AF2421F10
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 13:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780578188; cv=none; b=jDfVJ6sQL2dEXhepywbLwo1PqX7kaywqVPICGAsF5uxIOsWZX3Z9sKf3RQzdzaNviRxErE8q7tWPCMRrk12BUXwJ6s5J0t108XydkISCqNFy3uXkZeDtMH2EBmfnDe/oDdOJAZLn/h6BSOij77wl8VK9yKc0KHXrTGWpyVBypmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780578188; c=relaxed/simple;
	bh=aCZ+AS8Mf9BxnQNj87m/hj2teLLK19zwB5HLLG8xeL8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UIGK1sLffVafc8e8Ys4htPAIgs5QpiksAzqVFfpAuppQrATIGxIPRESKQC5MJWxJh6hnn3ootYs0ofrvUNIrJno53vYObOCJZMvnb+QoWpWY8IsnBnHpQCfJ4vHnf9Lzpc56kgQI3gtzvndX6qrItwmRSOKdQRWGiJinJ9Lj2kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H8KFaz4v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SX7f0Xyx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H8KFaz4v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SX7f0Xyx"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 654Ap5vQ1993560
	for <devicetree@vger.kernel.org>; Thu, 4 Jun 2026 13:03:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JfgOto66Y3BLWLac1kUqpihI
	4RTvBJSSkEWoerZ0cj0=; b=H8KFaz4vgr9C3gNzdMlBYO6OFNtIQCeo1LdaNXs/
	YpfqyoP1Aa0ccSgUiwDXvz0HasZVd8x49Hp/pU6gksfHztq/6Wy3SKKixJTHzMtX
	3H6SmVJmEDX/HT4mdzSaj/+GXrz97sV0TjpxBSu1IjBnfEEisk/puCehARlyz8Ii
	tquZx0zMSUtxv1yU6U8NbBjtAPYUH4Zs/xHsTtMR1llEfTTIKRQuayosNPeVyuI+
	cmoNGQr8Kw4RmphkdGO4DLpS3cXrGD4iNN6BxL4TnhLJId7KslM7EV0TSYddCGxi
	pa4BGp9+7X3brrSKDNw7waXFKI4KS5t+xzjkAZnPNif/rw==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejs8pusgm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 13:03:05 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7e6fd5f007eso1267856a34.1
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 06:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780578185; x=1781182985; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JfgOto66Y3BLWLac1kUqpihI4RTvBJSSkEWoerZ0cj0=;
        b=SX7f0Xyx96tWTyEjzgz4ar1YwWA4CoUei5P/OdIbb23tJT26g5pfY0HP7AdNQraWnE
         GiZvl9km11+Q0yiH+PT2hRJC7jbCXBh4S6tUA4ukNe8sWHW8Mbp5naZPHfXei0YtmDx9
         Lsw15/diyaRw1jhEg6eqAMOz1cwJTXlwwXq385gOHR07I+/3VXJiAbIyCQXe8wVo7QSt
         Q4YnCT82Q0rFKJLbB/XXpCu6FWdbG+5W6MYQxfrrnDNyBHq2WaqVcrofjOBojDrKdzm7
         TY8vtHS/US39PZzHJ8vnlqr2TwILkNFAd8Na+eiPvGOXhQBbwyob9El35ajhp1NfKARH
         /0IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780578185; x=1781182985;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JfgOto66Y3BLWLac1kUqpihI4RTvBJSSkEWoerZ0cj0=;
        b=otiqaKnGuK6el1qMD/I4VbahF9ie8w85p3CY9xlRTLD0cI7sBycEnGnNE9CfSvaNYs
         A0K3WxIDBMaEBo1q+JKbclr5fw0+KZd08/MGOXSaW4AD5HFZMoimc1NSIgS2nhozllTK
         EHbmGdmiJb8QFKmJjiLcJyWP1sX4vUFISNeSHDlCCw6wSBUSNn7Y4Dt6+ATGwpELKb4t
         1vUJIitCfS3jPpptJCcAP9GWynvdPlTWBZRE3MysORe/dR+wJOAIIE16SSHu3KkTwaZe
         P/S3Q45hT1KWC7D9jzcvm+8vjvKrGmoaWZprGISYGf+tdksF5wUZxHGnbH6/L0cjK6vS
         TYTQ==
X-Forwarded-Encrypted: i=1; AFNElJ+hWVdTSMpAMqOaNcmvfLDhaCkp6+psqP6EqxN4u6Ipv9taM9djXh7DGwDiivLqCPpeuQpjaQkryXyg@vger.kernel.org
X-Gm-Message-State: AOJu0Yyoi7UJcpA9pMSTAByO+2f23nbCEdpJ3pVq4UxcvoHEzT3CNQyP
	lGYr0W8Y690k8IQVGz2zYZgEgXLnxQfuY2BIdKioH05aA5btjuKcP9J+mvqf7K5QJ2mP8RqIWYw
	MWAcMcdJ+IJFzlDLb+Zp4/qRGCk2YhqgiPN52NszD/mq6uQaRQIsrvlE1mmQQNs4Z
X-Gm-Gg: Acq92OFXWOyvTwLtfK2daguWjtUR+tr2NFaePIyIITYEPkkIv2J+tix6Nl10RwubJo2
	3zXMscjjUAQwDzcUtiea9z/gxxhl47YZ5Uf7Qb+4Qn0hFmt0/gEyt7q0B0WEKbx/AipsLXTM+1X
	k3++Dc4DlMMBfAqMoHZ0ewWN6s3C5v2wtzKy/xatC5JCOxST4vzxcbFY8fWLiIqp9yspP5Zv0uW
	oaUZ9Z1NCNvsSXH1HII7YOCSw31yx+FRk5GbKd6H2ZfAsNMKeV0/fTnQcVRyLPMyWrrRKydcYKr
	ud1SaWp1RnDWkx1w/PwqubkJ+cfzf9CWa9Jdh1dbfSsl/i1mdYlr9NCUzisFj8ttLowKfct4gVL
	pSJFbNL72ukezJjtwXYLZK8+rrzacfrQqFgiVG0IBx2+YY1e6Uf7PBsfyy9v3VT3BG0HcctC+CI
	E4YjSxC4wnQDxHoGigduBT5g/eXq1J11yzrIgB6tQb24w7Lg==
X-Received: by 2002:a05:6830:1e3a:b0:7e6:c8e:89f3 with SMTP id 46e09a7af769-7e6f9244026mr1380369a34.6.1780578185148;
        Thu, 04 Jun 2026 06:03:05 -0700 (PDT)
X-Received: by 2002:a05:6830:1e3a:b0:7e6:c8e:89f3 with SMTP id 46e09a7af769-7e6f9244026mr1380291a34.6.1780578184514;
        Thu, 04 Jun 2026 06:03:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2d5034sm16257901fa.29.2026.06.04.06.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 06:03:03 -0700 (PDT)
Date: Thu, 4 Jun 2026 16:03:00 +0300
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
Subject: Re: [PATCH v2 0/3] Subject: [PATCH 0/3] Add Shikra (QCM2390) display
 support
Message-ID: <cvszjw5psd6cenek7ujczjkmcvrzhtckknrifb4pphxotca75k@irvape42pzzn>
References: <20260604-shikra-display-v2-0-b3c1b2b67edc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604-shikra-display-v2-0-b3c1b2b67edc@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: FPO1B7RSHaM9vpcFVXtiVvdE_M55OUt7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDEyNyBTYWx0ZWRfX2LLqC2JzY1nN
 0d9nWsjzsiQmdzozsiBN2e8zZw2ABQHxxYS+YjaB7ZbLF+3n/1GCSsfJarbF9eEZ5bmb6qjNvFJ
 TT3VjGQYWqTp13QOKX7aN7nG9Y14QKWNFkpKlXrQPXIfO82t52PLKSPr8pUIOz0z2ejdmZX6hXk
 hKy8098mNWUSv/XOcMOPsHOX0LpLVfZk8nWJjPdUiNBkvwrF4UzEOC12Ew81kHOmRmry4EUkMhq
 aTUT7SJlejB/jp/T+b+EdKF+tWVBM99e2Wek7sgitqAvKusf1Hx3Wy3lJNBBBjUR0t252FkR40a
 CVUuH7PNQnsIF/SXiso8dG/xUX+DJ4IO5G58v28o+mccocoxAQV7rFhj7AyNEJk/spwHb+ABNDL
 nfFWPXSJZ4vU5P+xneuwfwo/9VtoIXCWG2uLkFddkqbsT+JjBRldSzfRHIe5oaobIsZFbVHtBXu
 jqBWNled4xoFIbeTjjw==
X-Authority-Analysis: v=2.4 cv=E779Y6dl c=1 sm=1 tr=0 ts=6a21778a cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=FTaq_hUnWkcAyd37DvkA:9
 a=CjuIK1q_8ugA:10 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-GUID: FPO1B7RSHaM9vpcFVXtiVvdE_M55OUt7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040127

On Thu, Jun 04, 2026 at 06:00:46PM +0530, Nabige Aala wrote:

[PATCH v2 0/3] Subject: [PATCH 0/3] Add Shikra (QCM2390) display support 

The subject line is wrong. Please use the tools properly (I'd strongly
recommend using the b4 tool).

-- 
With best wishes
Dmitry
