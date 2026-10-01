Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999D028E0
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 01:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790818228; cv=none; b=jTw4vTsvjXSxHjGJBd7mA3aT8JBIYccuFmsNGioycHDOH0K1X9DgsrEdrixVjrD11hp286/YtLt00C8e8FAfczbfg78GVvhPVFq3nqXvwZ9UfF9d+KlGu3ne5TeVh2nf0fNeROqydo5oCcQ1SZhHpYzn+e1dVEYYnk0FL0N4cJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790818228; c=relaxed/simple;
	bh=ZXgnVr8vrxSlT+suTKuGSZBoYlHrJqfLt1b0lFvpaUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gI9kFAtpBbJRmZbky2bgwdJK6opzxvTDXgibTNbsbbUfdXXV22UF5BaKJXh3lDeMIZnNvsnvNbV79hZLImrLc+pI0DIZpHw0UUSgd7UFvCzVzNbLgGYHExMhULWPmWNQcSbY41YUBzl7neUPCNA2gnznj+OSpibKLzeAHcMj2ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jlohJp8/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FKtZc36N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jlohJp8/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FKtZc36N"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6910jxhH868184
	for <devicetree@vger.kernel.org>; Thu, 1 Oct 2026 01:30:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eGwclrvkGkFDi/gd8U3LJ8vU
	MTfgL1qtLx/RYSRBDR8=; b=jlohJp8/meS2pus0/0/GbJO4igfnxXNFvB3Z1YIX
	TO+6PiYRgG1i9OjsKz7xE9w0Wge+QTakFSyR8BuA9kKknRr648JMXbF8rBVJ3Kr+
	DQ3f39iOBaPBx1pu/FGvlkDn3BHqmU/GnTCvdOKyfSrn2ew51vOKENDoakS158xX
	LD/Htc8wKX5TI2XS9RtItvyMK73U2DNtIunQja7Wu6JYA5AifxCWNbFIU3Gg2p4I
	ONUQnURYVhtAiF8j8MtKmc+Uztk6Rybqg6LaHZ/opYlrG5lZsiHDUVk/DOdD5aad
	uoM/u4y+6+a6F7HFWxOX8QuXuINGB5KfjgLcJX5FE/iBVw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h167phxhm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 01:30:21 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93caf7856ffso215285885a.3
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 18:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790818221; x=1791423021; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eGwclrvkGkFDi/gd8U3LJ8vUMTfgL1qtLx/RYSRBDR8=;
        b=FKtZc36N5B/C0LeKDO8TRS4rGB6Q8zNNCSB+BDINbVmkTtISblZkG7uvJVnp+Unshh
         DdVPQIkoB62HKkJUo98d5pWnShtgFowWhzzcibn3OxueyjJrQWFVxygXCmbzuk6yjKPq
         xPxPdQ3KZIpVZskbTV89M9r5rhwMKuA1w1BNR1r03EbTY9ZrJ6A2Qc+UL7ovuO79+Oxe
         1er36UoBzwnsYTynkr5BgNHPAzIYOBa8e1JqNgEy25/+OdnP7y2SprKYvwpjhCiSomCC
         ui5I9YnLnNyodiWHQhBoa64mMnYAjoSHV9bmWaLB+c36tDsal0afJpcYrihINpjq6cGt
         /x/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790818221; x=1791423021;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eGwclrvkGkFDi/gd8U3LJ8vUMTfgL1qtLx/RYSRBDR8=;
        b=gEsm+I4rJ0hnRv//csvixNS63V5BGU6osxf1Nk0D5tUtpxDWC4mwlQ4Pe5AOCA7RDf
         jxEOL2niKlv1rVM1NSYbWDnj9MWPb0pQOh6CG7VD3nigEQyx5w21G76OySAuiNhbNkuU
         by/1pU9GRqKFD9KXf6fajO5zHh41I6+SXsUo3p/a9XKvo3J2rvnis5I2ECA2HO8+Vkb1
         bBp6/h4hB00bW0J7kOt1VzOBec7xSOfJbAW2dAZ0xdvKF5vCm4m/x9PFz2iYkK19xrXa
         as2BQVCUupbBl0MDm3c6If6FDHqUjhPovd6CL/I5iBfiylgbSjC5EL9OXgr6pX8bl3Ai
         CtaQ==
X-Forwarded-Encrypted: i=1; AKwUvBzN/h+FFM+TBtooUlWMsLgJ8pXGNozriWkTOge2Q51bPoJwV6EsdsIM3WUtc/KjNowBXgsY4PWbSyq0@vger.kernel.org
X-Gm-Message-State: AFuF++lrdU2Ck57XNYU9txDPWyXkUGhXr5PwyQdrddmDLn2qdkpvcwvi
	xoY+82Xa1ZDVm+UguTyQTg8yx9Qw8VGEDePrCK/BrwcKHCis5rgSLeFvyxirVXdnzuipjhJ/sfy
	AvU/08xfKnrKWMYYwM3qQ4PHeOMPjYCYFH24L9bA1FsCuQlStEvLZR6oCPKr7s1sx
X-Gm-Gg: AYBFou2JCiJem2EnugMtKbuo5Y+boj13mCx5ULdoB9vaQuWN19jS12sY5MPTnx0WtBE
	ERZ0uKAzBpjsbHml9fjPf6yf0uD++dl/Fn4kNku37hPpQnNpWKm6ziFIBZNTNn8f9MzrXFw1CA8
	5L5C48ahvYq5I8+Gt9pxOLCFbZt+yCMCSTScsdGcNYpOlSZVuVyBaYTj6ATz8W3ei2q0xKDzZGk
	1ZptqGiJ9hFQX4G89cRRq+TAFc67rXHgVcxASa1LyN0fbDzlv2hIQ3K3TrqJjokO6gqPG22NUIX
	RRJ93GgcU85K/7u+MHC+asZydKiRSq/88Er62L4enJcg0MoCsTgRhAoPHdFyxZO9d7kgXv6Lzos
	nW1owzUCaNOVabhf1OmVuFfIPKsJvNvBFLm8JMFYHkYSLTJMpTva7GUlhgsm4tfGDukP09qCoZt
	AcSAZHmyxPJhZn
X-Received: by 2002:a05:620a:440c:b0:939:ab90:8f6a with SMTP id af79cd13be357-93ca9779e92mr539017185a.18.1790818221127;
        Wed, 30 Sep 2026 18:30:21 -0700 (PDT)
X-Received: by 2002:a05:620a:440c:b0:939:ab90:8f6a with SMTP id af79cd13be357-93ca9779e92mr539010885a.18.1790818220566;
        Wed, 30 Sep 2026 18:30:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba44059a94sm170385e87.6.2026.09.30.18.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 18:30:19 -0700 (PDT)
Date: Thu, 1 Oct 2026 04:30:17 +0300
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
Subject: Re: [PATCH 01/17] dt-bindings: phy: qcom,edp-phy: Document Nord eDP
 PHY
Message-ID: <vj37teqcz2gzmwjjn2exvadtby5vugpsloa46laktwiyv6yjlz@px7ludjbiub5>
References: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
 <20260911-nord-drv-dt-v1-1-e25c073cf1b6@oss.qualcomm.com>
 <evvgtf6b46zqpolvybz6xfklakgoyv2llnvawrblgz6np7viza@gtmqflkwwmgk>
 <a5a4abe4-17a4-4ee3-a213-a9e136e31648@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a5a4abe4-17a4-4ee3-a213-a9e136e31648@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 7J0xPKlUKdqaBa4ddCQBWpz3DyuYaoLa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAwNSBTYWx0ZWRfXz0LIKA0BvgXG
 HunO/eedq7NL5htaC8GtKt7Mp08LAj6xdOaeABJNFxAgY9/6RnWenrDrKExRqI46drnbrXSoFJw
 vb3WeKLtn70ylRhHRol72LNiaX3fmps=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAwNSBTYWx0ZWRfXwpHBLHTFc44u
 7zmhtjsNxvssnHix7i99DhuRejEVD5rixI2c2poV9aqKjgBx4K5mNgplqQKJ8tuCkFlWo09tE5C
 c3aqDFj5SGBAUkJGmgH/wR84cdf+93nlwIBOU8SnehcRBNjuGuR43XLE3Lb+1M64zEHK+DnA7Yj
 EiQV4cy6cBOmA6oOEtoi7aoKHOGmxV/Gd5LDREYm5S7sI69Azh/iKV+rlTo3NMsVKx5Hp7ak3PE
 X6/7mMnppZumPmDAiAVXMMGnRIf9Ho/mCjYoPcQOFL3Wq1ZP1G+sy1FOzoqoaiA3E+VqsPAVgyG
 oeRgTVIgKykkLeSKc0ASXLey6DCtFSkaIbQFSZW9WO3oiEdcMdJANQbV1Saj6N2BXDm46LvP5mN
 cY7f14qQVuUUMOABgqs6mftV/VFpoiawKJwMH0j3Z7tSZXeZpZTUW+1xQIKNzvS0RetwmEeUlUj
 nLjcxXHNwU6n0T5UQCQ==
X-Proofpoint-GUID: 7J0xPKlUKdqaBa4ddCQBWpz3DyuYaoLa
X-Authority-Analysis: v=2.4 cv=WpC+otfv c=1 sm=1 tr=0 ts=6abdb7ad cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=vJekXL2k7A3vZJSvyLMA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010005

On Mon, Sep 21, 2026 at 12:26:54PM +0530, Nabige Aala wrote:
> 
> On 9/14/2026 4:59 AM, Dmitry Baryshkov wrote:
> > On Fri, Sep 11, 2026 at 09:06:32PM +0530, Nabige Aala wrote:
> > > From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> > > 
> > > Add the compatible for the eDP PHY found on the Qualcomm Nord SoC.
> > > 
> > > Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> > > Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> > > ---
> > >   Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml | 1 +
> > >   1 file changed, 1 insertion(+)
> > Does it use ref clock?
> 
> Yes, it is using the ref clock.
> 
> [PATCH v2 1/3] arm64: dts: qcom: nord: Add display subsystem nodes - Shawn
> Guo <https://lore.kernel.org/all/20260920091930.2215803-2-shengchao.guo@oss.qualcomm.com/>

Then why did you not add it to the list of the compatibles requiring the
ref clock?

> > > diff --git a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> > > index 0bf8bf4f66ac..91d7a5c8e19a 100644
> > > --- a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> > > +++ b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> > > @@ -19,6 +19,7 @@ properties:
> > >       oneOf:
> > >         - enum:
> > >             - qcom,glymur-dp-phy
> > > +          - qcom,nord-dp-phy
> > >             - qcom,sa8775p-edp-phy
> > >             - qcom,sc7280-edp-phy
> > >             - qcom,sc8180x-edp-phy
> > > 
> > > -- 
> > > 2.34.1
> > > 

-- 
With best wishes
Dmitry
