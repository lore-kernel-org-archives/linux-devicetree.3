Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E4B339373;
	Wed, 22 Jul 2026 11:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784719138; cv=none; b=RRAKqrzbdTNIvJYzuLulBSKrq77CZ+x6zvMiC+X/ZzTTGOeA/Ipp0kWKnZOn7OoHAbmAAQA7CFEyDLVMCGieaiyLRwtwX4vGwvYYkUtE4b7qGon8VxGdUSGuOENqYNG9amyYwPSyUpitgAop+uMunjNNY7GPdJ1DJdNXuciVddA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784719138; c=relaxed/simple;
	bh=5H8vIuSOpwo4By0Ny3HFQyGcrvjKq45Mdaj6lRuNBt8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C/CLaZkWVQjc4UvMwjtpicxTWM732Sw4lvHCd9Jh0vqneGKhRtYtQ9LGK0AXVt4WGwQ1myBYd/nS0I9eRbgsVhwEPsnftBL36zFv7p/cYoJLt4z7qqioCzOmaAYhB3zaXSsMB+c5yAbvN8B65feBOvJ7y8jhl/jm9IbuttX84MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KlcaW3WQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KlcaW3WQ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8xKu2401720;
	Wed, 22 Jul 2026 11:18:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=r1bsSHoyMotDalvTuDWFj0G/
	q4eMp+94vxZj14hipp0=; b=KlcaW3WQygM5kjePp49Ylk0U0Hi7KdZu4Ct1esb6
	OHlnb7KC/o0PnmT93voqXYrqvbnJ6ZcvbEHPhtSh42q5wNwKztPykqpdYG8vilAI
	Pm0Je/4T53RQgXTONI4LcHs1wbX55QapXP9suWnKex6aFUZ3QLuUGzXeQGHsgRz7
	dJv8ma7Fzwc2MSTqnjaNGSmqHPDkX6sqdZR1Kw8IV7GMV8PIhqtYsJE7FltVBrmU
	QgdcCJn5PPQ/9Wl4Vr+gmt0roJO4s9UwlClSNbrh1xqQoklhfsCXoUmBA9wktWIh
	NWd+4a+mORPfgrIYl3YAwx/fSuyycitEtCDUceWjMH/O8w==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjt798pxn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jul 2026 11:18:54 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 66MBGukL011280;
	Wed, 22 Jul 2026 11:18:50 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4fgj54dcdd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jul 2026 11:18:50 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66MBETgx008310;
	Wed, 22 Jul 2026 11:18:50 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-kotarake-hyd.qualcomm.com [10.213.97.140])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 66MBIoUw013447
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jul 2026 11:18:50 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2389607)
	id 90037B2A; Wed, 22 Jul 2026 16:48:49 +0530 (+0530)
Date: Wed, 22 Jul 2026 16:48:49 +0530
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        jishnu.prakash@oss.qualcomm.com
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: shikra: add vph_pwr and fix
 supply parent mappings
Message-ID: <20260722111849.hmbly7w7dqihsxiv@hu-kotarake-hyd.qualcomm.com>
References: <20260720-pm2250-fix-supply-parent-v2-0-60ca47031b50@oss.qualcomm.com>
 <20260720-pm2250-fix-supply-parent-v2-3-60ca47031b50@oss.qualcomm.com>
 <wqibfckpvyjlcc7h3iizeovzchyfwg4q56uhlvzufpac4jtpc5@gsrv5hzesujo>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <wqibfckpvyjlcc7h3iizeovzchyfwg4q56uhlvzufpac4jtpc5@gsrv5hzesujo>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=Sr6gLvO0 c=1 sm=1 tr=0 ts=6a60a71e cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=zuZBUVQH1r7p0-yMmxcA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: 95z4AlVTJQEDlAPBzvaQ_JsQJ6JezZF3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEwOSBTYWx0ZWRfX4+t9cF8nNsLS
 vHQYCxbmW6snkxsRNVvyGRSe9djzMHdwZV6FmVbd5uIKFYnJYLyJ9JySZuarYIYE0fEqz4oCU+n
 DNbNNcBHx/AK54DZIWd88OQdRkylgYCSBZ4exsuN536uP6ZJUMhxmRRJEhD9Y+xLqnTzlTpraEg
 7n0XKaC9TWs9advr5Wt41mcgIzHw8i4OLx4AX2Y1v9I1qwFHV75tYQaq8HF1x5OTABqc6LXwg5L
 fUr7722CfFNBogYua+Ah08mCb44DGpsIGuSxzTxR513ZEonnFboKtv2eIxL7pUuGRfZfRL8z++a
 lxcCINXgUH2mfgqsYubGFbt55X+C4QBOVMswLBUEWZcMItrbMZIl/qvYPP5BI9c12GQJveRIZKK
 uPsMd6Y3bQbdXOyRn/XtpjXLRYhIkh5XkldGPimUgEBvVGit2gl6dRXi8YoJB1q7IcUdGjxi3c3
 d/KSJj2l9OkvUPP60Rw==
X-Proofpoint-GUID: 95z4AlVTJQEDlAPBzvaQ_JsQJ6JezZF3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEwOSBTYWx0ZWRfX0IBg7yFZlIBN
 RB3u5pkEhyi09EgL9pd/oTS1pyCkf6WQ0nwJSLKdUANYloNOSbahDcQXDLudTZb0OJwlpMLe7Id
 tdYhzXcxhj+mggsILwL2u4Dx53OVyjU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220109

On Tue, Jul 21, 2026 at 04:24:52PM +0300, Dmitry Baryshkov wrote:
> On Mon, Jul 20, 2026 at 04:25:06PM +0530, Rakesh Kota wrote:
> > Add the vph_pwr fixed regulator representing the PM4125 charger output
> > supplied by VBAT, and add the correct per-group supply properties
> > matching the actual PM4125 pin connections on Shikra. Also add the
> > pm4125_s1 and pm4125_s4 regulator nodes.
> 
> Why? Don't describe patch contents. Describe reasons for the change.
>
Acknowledged. Will fix in the next version.

regards
Rakesh Kota
> > 
> > Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 33 ++++++++++++++++++++++++++++
> >  1 file changed, 33 insertions(+)
> > 
> 
> -- 
> With best wishes
> Dmitry
