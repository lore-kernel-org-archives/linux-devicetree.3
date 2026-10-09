Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55863D7D65
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 08:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791534901; cv=none; b=A17Try1b0SZ8+o8vvoMhaGuFdr4VxTfIfKXmiLdEBJjHq0iM+vjYbTw4nR6FMaiQgw9DKVDp1gm75vObB7u/lIr3oMxT6FzexC2mJMCJiuvxVsLobVH1klwISHpsNHyWZ1DeLZpKbrjvPHRcwh+XeXevCF4YsvdkwkCr5kQgd8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791534901; c=relaxed/simple;
	bh=NC+2eeo2n5QNMbUUG22T9VrtpoJoD3PzWFKPk2u4F84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jLBRUmXXvqHfn+Y76BdUQNgFDmFUg62ovbYLcgs1MCEQ9AhEzxYq+stZikk3oeKWn0YJNuLx3vg/rNe3SSAeQrIHYcmyTL8FYI5TIyDq7k4rbjKJJErbz2ZPBZv3S0FbVK9z17smrYLdTyNJ+2dV0Fy8kiTtmjFPq6V7Wyn5JQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ty7vvkaM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K3YJWw/1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ty7vvkaM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K3YJWw/1"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KJ1V404416
	for <devicetree@vger.kernel.org>; Fri, 9 Oct 2026 08:35:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=s4pQsGddClrCrII1kmbcET5k
	ZqpNT7v4RjJRYWDy9+I=; b=Ty7vvkaMmZ7MDralAPHqHSDYwDUbfCAa43KeasGQ
	rLEYQltkHcCPXhVtDYD+nzS00pGeRHaK//i+cRlWM/bgEkb26UrTd5as5r7vQCE/
	xiXkMKtwZYX/aERJHu2a5P2mf+gQtgQkg3pBUDb2+ZYLPAP9DrJEYqMRjiovwRBi
	/TaZDYy58zPDhfhpkjTMwfLgUoOWKsHmZibpzLdujJlszB6vOI8PfJIBoLbsxs4z
	mkfJx1dnP3fB9Z2AbvX6JpIJd9jxDr9I5t/fmgQmk71oZ6m7GP0QVUHOruxushEK
	l5aO5lEoYt6GGnMe0rpUOIdVQpZNkmjX84Qxd6/ieXnYnw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxk2q5p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 08:35:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a082c014aso462783985a.0
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 01:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791534899; x=1792139699; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s4pQsGddClrCrII1kmbcET5kZqpNT7v4RjJRYWDy9+I=;
        b=K3YJWw/1uSB0U7PTwoIlOdeEDVTKHk3mdgiqHPnv4phC4nIrZe6PdxGTXZ20Wck6qL
         se3c9Osda7wWtQGiLn5I2FeEROBtXq/3ieJBzstv1reTNcz8EQCBWUHayEy4BC+lEVTN
         cgIp2SiIoz49yTmJOO5U6gmfHcs5cGh49bmNu34bK66tku8q9j0Q3L0z2l0eGXW/u6/T
         0HW9fdQFD5gP+1HXHHRi5hC4+RUB9YcUHtLmyVMfRDlJi8akbI1Mra2xGhhedTfKH53N
         q2yYarQ/lA2uzN7GMHXQ/VzK+Eck6PEDrcsxisXUEa0+L4eDeepPaUlQrPOI0skDoyFQ
         4imQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791534899; x=1792139699;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s4pQsGddClrCrII1kmbcET5kZqpNT7v4RjJRYWDy9+I=;
        b=zfrM5QUww8mDuXg6YZo+XSjZ7AznIuJ18CqcNzFKSzFy25xYbYFyEbP7EL8ly+89py
         xUX6GFc2FxAuMJpO/IXXWJ2D+LyYecWZXLaGrFSWsY2JivtpYw1fccJ0UqyfmNsgkJv0
         BNDshQvxFZnw0Nh3STXK+WudnstAZB5kXrdW92DsCVBEFLDFs7CyE0CYJGmgBrzJ3diS
         Fsg5D5H2CIh6qDYi3QQJ9Z6y6duSwheBL60q2JaneJrjztf6YMzje6qH7HEv4RHLtj8u
         3W6vGntPa4h+KXxVIPeVuCBmiOVu6/ZLkjG/7/y6BnXwJ37PwbtSkXBygBV4wdk0f/iR
         Ed5g==
X-Forwarded-Encrypted: i=1; AKwUvBwj058ehEWrMJvbt9BhriG/H5gSRmympEIvGn6ysHfV692rKMnlt3t1KsJ9ryFkn+/svop2kbknjRCg@vger.kernel.org
X-Gm-Message-State: AFuF++mnuIzWn8mMYptnQcrkgKDXHa3QYlM9wfumnyziY0FMuT80ApAl
	9KvRX3Ud1AIRM+MhB/8XCpNm5CNYmJJr+/nywA6om7M4jzsB8BkXmUk1iJXh+4u2rDS8Ms5zlvC
	+T41iQThEkPPmbaat/VxFU9BhsDtxZdmyUfhW31B5dui7Yd3W4b8U/S8JDaStDExr
X-Gm-Gg: AYBFou2Ygyalkr2/wkTA8Selg3fAmzLrvPq3xzpWfUfSAfX0ubDa9XAuFtkOj1lY46c
	R9Uv4u7MpY8tnZsLW9v6zGIVijYzn2CoX0VdM7UdTrbnHYHx8xbfdYWRbZgmj7o2E6Xv+ORRPY6
	QG6J+78U5oYXx7fGr/zNueSR7acNp40xoVhP4W2LivR9dUX7cSh08Lv85K+qovlDWPcxl5igywe
	iDo+h37dylec01T4eOnrjKlmkMCnnyYWyas9qedKi61tfrm996KhO/yGISUdewWBYqsYIqaF5Ks
	Qg1XWZxACe9F8CSy6glojkaJedU7BnFsHV89cCbLCEuzX6RHkPkIGFRPMH6xwMX+l5lQsFgxlw3
	WirukRA2JDuptK0nIyOpOnPbLU1G0gS5uA5sdHvrB7/s8cX+q1oLWA/6zDG9CZNfqmTariIdaJz
	DXwTg1YpuKHxbB
X-Received: by 2002:a05:620a:3181:b0:939:fe55:402a with SMTP id af79cd13be357-93eb966845dmr239801385a.31.1791534899064;
        Fri, 09 Oct 2026 01:34:59 -0700 (PDT)
X-Received: by 2002:a05:620a:3181:b0:939:fe55:402a with SMTP id af79cd13be357-93eb966845dmr239798485a.31.1791534898596;
        Fri, 09 Oct 2026 01:34:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcdde36004sm446004e87.8.2026.10.09.01.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 01:34:57 -0700 (PDT)
Date: Fri, 9 Oct 2026 11:34:55 +0300
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
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: qcom: kaanapali-mtp: Enable DisplayPort
 over USB
Message-ID: <mh2mmbrs5omoo25u4je22tq32ka52kusz6u3xkeohea4oa5o7p@uww6ugjnutho>
References: <20261005-kaanapali_dp-v1-0-6faeac3a6d59@oss.qualcomm.com>
 <20261005-kaanapali_dp-v1-5-6faeac3a6d59@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005-kaanapali_dp-v1-5-6faeac3a6d59@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=fKesTpae c=1 sm=1 tr=0 ts=6ac8a734 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=tbCzt_ceUV_s8fUbo54A:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: DPGA1FL5ROiDfRIy55w6-yyGqGcWbS-6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAzNCBTYWx0ZWRfX2eFVgmnfkWEB
 CLwh8jRVpldbZjyyAJEm+thf0ODqBC16u8bLnoKUf3bcQad3ao9Wkxfb2VpN645FL9gPj7JGDfL
 HXWlI1C9txBCdFx6WStbOohiGcHknjc=
X-Proofpoint-ORIG-GUID: DPGA1FL5ROiDfRIy55w6-yyGqGcWbS-6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAzNCBTYWx0ZWRfX1YcguBZJs+xd
 qTT4EgymshXs9HUOiZh14FKpO+a5wUIxCfLQIVjsM9D7MfQmF+bydyqkH211xR7WirEAZrEBDFY
 1VO6O0idaF09sKMGAsgC4q3mWXXrfkoEbvkN2xZwn76xvbKOngmLUdktF/IlCPZ0tf861cDMeGh
 x7EldxrnKn+4AMLPn5JIpxqKCBCiEOuXpwPHjHVcvkqw2AwynFFtwd9q9eQEcHYhGKDa6nqjPpB
 vG76l2UR0VrL3uW302my+nHginoDDLKbU1wGeqw7f0VNPT4BDMfh97pLPehv3bCtuoH/qt0PIRV
 doNetKoWFTE/GPGy4qrgXZ89EE/jZp40Awm+90PEnFa3HztYgVX9DwlVgeG2oqkJm8cM6Ug5kMZ
 2Bx5Z2LMyPyYPFEysC1NK2nVq/4Azl+yy5S8QRID0aIsStiUdczz3W3zHJUQGjX/w5Ir3FBxql2
 Ck+BvHmQDThoMW0sF4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090034

On Mon, Oct 05, 2026 at 12:54:30PM +0530, Balaji Kalkonda wrote:
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
