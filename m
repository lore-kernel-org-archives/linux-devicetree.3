Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B243D7D7F
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 09:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791883145; cv=none; b=HZDZ6jKs4mjaCh5IGPgg7+GCJLb0gDzaQ86t5dB6RFjATSlQvxu+ZVEtia07gIJmQHYDJzTJb7u6BNpvRmniSNHCq8MI3QVwo8ub5+Q9nWnosBCzeMNGO1Zb2i90gZy9XJQpAReVQsoRr7UKjPvdSuORPxICjePBIEWDKeRjZ+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791883145; c=relaxed/simple;
	bh=ZjDJCoA6MxAlqVBWalgo95rJlsZqJs5EHam3F2kFqFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DCG6myWpXCmD5DfjXeelMCqcgjRCLItf3CQsc6xocM0fJM9jFsGLeeCPbBFPIgTdfohOcL1G46swERZz67oG6PuGcPBg5TtqCtcW0BmZp3gHgQVLIpWSMWCiUrouf+CIJbR1sHi8TMZxkyIMheQln00JE4CeV2gsnFJzjJoiofM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m+3COEDl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XegUqucV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m+3COEDl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XegUqucV"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D45sQt173328
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 09:19:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uQ82qhE+xbrPharhAgsD9+NR
	Ct+bFTtwURK4hSdKntQ=; b=m+3COEDlKoRKIgnoYo8+Ib/egwZwTuGWIqvL1820
	I2EeOkYgsfW2+9Ww2MmvcNxsU3HwoM7ARx9UyGQdxP+XtKGbZv1SksVPwiPIVfeK
	VSncdCH5da4DKRUneB088gg5LtLq4ddjw3Ibmcek6fERcag6jMxbwI5t9WXkvg9t
	qsz5z6AelYxBQs10BQdiQ11QcS9mhrWF5Wd/Zs35pADw8TOH60x+6/tx+FCl54B9
	PwIugTzhc/Kj53lLHxl4VRXIqnN6P3NUhO4y7he2H+PSj29+iVXOVrgypBcy/XmE
	duAXPHcP0lUXixC+f4ymtEWCMBM/WBRXOmpL5jdzwjznyg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9daqs6t3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 09:18:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93caf6c528aso481260985a.0
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 02:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791883139; x=1792487939; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uQ82qhE+xbrPharhAgsD9+NRCt+bFTtwURK4hSdKntQ=;
        b=XegUqucVk0IawPabM9lY0vVVthc16hJXk8o+Y2l1v/jfVPsFp2FpYUOBIEujSFGM89
         ZCeBBkPUcDDawMZ8dQNQ7GqXlFJ0ue6MM82ge7AkURT9ODArOVqnwGwD+SjQdtPt5Zae
         NAYLvOv2xAVQGMEPwv5iPXVDwFXH1WB4h4lGHSHzRvtdnXHFAtexdfwnMws3kMYmn2zT
         zlIPuV0huaL3YQCMoc7onxx5iRqCI6He6X16nAf4JbwKNWV1SRVUJoxzwwbnZY8BETxN
         flEwEZw5amVGbm2v3Twfk9W4/0IqLGfkBuJvNFM+ukaJfdhJYCXuaQaapxiOdCRqSDTz
         5Awg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791883139; x=1792487939;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uQ82qhE+xbrPharhAgsD9+NRCt+bFTtwURK4hSdKntQ=;
        b=qnWXHhE8aQuNdSXsSIiBY1tvIZyysKuxid9FaFSAAmy8gKiZuGDd2PV4dR/P41aIko
         xAGRbsYcTvG23IRoHNmKNphQvSBgaNYaF8OGqU5Pjzt2S8bXNArgKXjIpNcsP+0Lqzl/
         l6UnW3vdD9OKGvPjHpuT3gjCA84iUPezvwGOqs/SRBZoXfGP+bIncNlQqB8XYfjSh2Qa
         x5OoaFbSsrwZF8y0PFlvM5Nsbbx9Vc84DILqRU8Z00JmfNP+z2tC6d4ddMTRecAWzUVp
         jtDrd2BVaJQpiZyNGUPx7FmV2ffBeptpYUvUlZl8Y1Mo6UHPSnw3A6OVr+dXu8TZGh+X
         NRRg==
X-Forwarded-Encrypted: i=1; AKwUvBz3oyvZJQ8nUDvN2MRjCicnPlBvLbuVIvS++MfpLaTipNrc0JJbM3AuuOh5V9rJqIEJwacPPuiws9XL@vger.kernel.org
X-Gm-Message-State: AFq9FYInCWsIHpPD9ViW2kt9v99rOsB6gWahOeAnKSgQ/D8a9Fj4Vt10
	iba3Q5RaVwYirhKqMb3Z7/qbWj7C7ksu9fa4Yf/lrrfqYaWkGQLt+Qp33aZS1G4BdK2F3Ulzdll
	9SX3quWST3vccSMkbOYxoNV4TUdbw8LpZ/HeaqVB7pP1l90Fx76WgEDk54d/2QEJqY8tk+aKb
X-Gm-Gg: AYBFou3FnsyEsGNZw2x1y8uGD1mf/vjIWiIQrDmMs7oWvRh5siCQpdYkapUSizz13fN
	KYSdPTrnH2gzh7Ob7I+oCjlcO5g2BR1MjIkvpb8BVxU2XeK26JohibMm+fsGHSfiGEkepuuCi+2
	FwSu7d/yJsFl3QdDsSJzceyP9pAADHNjF0aqLAjDpG0Eu/y1pKW2H+9+yC1Fsx5ysg1HFChmcUS
	054bPLxOyeXITYvZ5537iKosa+W4NHIVRmn41ROxkoVHHuuprl1NmwP6o+kWQPoeLaiedl/hZn3
	oOSdY8SP+sspezxKYAcz534mSQVgpNgUmujt2y6K3/J8Mwn5TLw9E8kHPSalZwqZ+YfSB3uBRud
	kYG3eL+J0cLcDaWe24vpUgtvIuvEDAptBrSsMiyYCvXSI0KhUQWNiXJnB6R1GoBvAbfplMu5jvq
	MFH68xfT38iHDd
X-Received: by 2002:a05:620a:6601:b0:93e:7192:191c with SMTP id af79cd13be357-93ebd1e0044mr1950630585a.17.1791883138859;
        Tue, 13 Oct 2026 02:18:58 -0700 (PDT)
X-Received: by 2002:a05:620a:6601:b0:93e:7192:191c with SMTP id af79cd13be357-93ebd1e0044mr1950626285a.17.1791883138276;
        Tue, 13 Oct 2026 02:18:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcf8a3970asm1038505e87.79.2026.10.13.02.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:18:57 -0700 (PDT)
Date: Tue, 13 Oct 2026 12:18:55 +0300
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
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH v2 06/13] drm/msm/dp: Add support for DP controllers on
 Nord
Message-ID: <gmsyzeugteg67h5vwzf2y2e7k56eg6aicbonzjl72etgedd5oe@vlizd2npwtn6>
References: <20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com>
 <20261012-nord-drv-dt-v2-6-a2ab9af954d2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012-nord-drv-dt-v2-6-a2ab9af954d2@oss.qualcomm.com>
X-Proofpoint-GUID: wv_LgjXnxOJle3-6-erhEfIBLRYJKhLV
X-Authority-Analysis: v=2.4 cv=FZuiV5+6 c=1 sm=1 tr=0 ts=6acdf783 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=rMXm0_BZOgqvqhzNPSsA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzNiBTYWx0ZWRfXx9BKkue8ixwe
 bBsMP37z40qvHjvGcOgZDOsRndm66WLpTHw+6qfIGoRAxHDgYUu+dGr9Oq1uZzFX4vekvJ9Mu5O
 2oKUn1f/JZjJfIdhYP1Y2U7F2dAmLE8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzNiBTYWx0ZWRfX+I/gxbgF9Ccb
 7PyFZSynr2yywcHjkh8IPWH3fCh+2wNaoB/xx4y79+IkhIejZOrqg43IaOBB4SLSr9GvfdI9hec
 W7UyB5mb7HYMiFWf81tzsFfOk8OdEi6eYz09me7dHF+xykFIMe2tDVGemoc7o/JXvgTXFh8EN9+
 FJlWdLIR8DTw4IjckXBW88JBUk83ud82FDWO585g+0Nycz8Ym2y7GXEpbpzhbBAItjAMElIdBz0
 AEtUk2Eh0eBrVOZyfrbkipUfJkaHnBdvwH1PGhLcP+WMJZk2EnyOWjh2N62PqpdFagfWspNnFrT
 Gr2H8hlcRlWaFc1Yjthlq5L+2nS21NPILi9jnW3sAPPZQW8+ryumgw4yezNH6yIxSUbcORdziUe
 zLK/+clyZjfXquoBb5ZQoorpPYeibotIwIBcZluTvQrRlxsg6a9LBIuesa23Dgln33EbrWfWGF2
 TmzbShrOuRiBod/be/Q==
X-Proofpoint-ORIG-GUID: wv_LgjXnxOJle3-6-erhEfIBLRYJKhLV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 impostorscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130036

On Mon, Oct 12, 2026 at 07:02:16PM +0530, Nabige Aala wrote:
> From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> 
> Add the Nord DP desc and compatible. Nord is supporting the
> four DP cotnrollers, two per MDSS instance.
> 
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 9 +++++++++
>  1 file changed, 9 insertions(+)

Why are they not a part of the existing entries? Is it a newer core?

-- 
With best wishes
Dmitry
