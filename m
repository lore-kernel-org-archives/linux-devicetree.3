Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7B74C33D7
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 06:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790057868; cv=none; b=raua/5i+crROQJnW6i+zeTLhawTWs7dB3Je814JtcD2SMf6Ruu5fwgHUu5Pu9ow66nwvQ2gTO91rqll0fxHSRfoXUcg66KIhslF7j0nPDX5fnDuvX2K1RGOsFFixiO4/iwunCwAQsrWjw8f7LTKH4FdhD2RbvBxtG9ivy5xwcpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790057868; c=relaxed/simple;
	bh=k8MmBGqlD6vtzuFFuLfgaTpxSsHu0xPgmRnpcwvoEpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iDrdNydo1MkG6SI6hMZKLyWq1Vq49JexWgDbD8OvOekKJUHrOKmcX+hfRX0rCNUlpcDzx02uMTZYTwmZdapsygtQO6zovitPKQ0N/AtyYCkPSXnGZ9CXxplQcW6YVKDmABsAPm1Kd2sBBxmdXbQEm7oje1RyCg3dhNYmroOaXcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GnBDRBIw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LUQtU3Gi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GnBDRBIw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LUQtU3Gi"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M1B7EG2174421
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 06:17:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WWkl2gI4Dl651xy5p+ZRq11f
	rqsemeLyAmJ3wzayKPw=; b=GnBDRBIwRxwG2hKdfSdL1C+/oagrSMerIR6B3ast
	gFSZ/l8MaIiWqwgNwE/LPLZ0gkTGMtbMpyY3ICt+6LZQniNcJSGquYjnW9/FWXu5
	A6mBhexJb7PnHOPLt3Wf5WtvGbB5sGwhXtlCwLUimuppaQaUmqkAxFA0Rx/vjeQX
	N9GmrL0AvaX6roiraAWk+qzahYA5CDxHf+6w6fGN3poa/IOhSiqmqKAHISoZeQ0D
	7XPAA48EvlTtyLZ7qciYsvJ8NbLgiD9/CUo07DIr+L1LK/5mueVsJTaQxVa52Ec7
	evFXgRB3NUeag3riS3J/fqYsa7SCplCPT1TPplD3b5isQw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gufsq8xn3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 06:17:44 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d7443e0f0bso69863885ad.1
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 23:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790057864; x=1790662664; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WWkl2gI4Dl651xy5p+ZRq11frqsemeLyAmJ3wzayKPw=;
        b=LUQtU3GiqLcfyHglIhmhUHrcWQ+5ByuIW/7V3EZVZpX/IQjnZuLWiEYgKrZX1OeOfe
         lHOn7+Lkj9QYcujLJ2ZWL/w6k31bOSRpmYkJr7zTGONSIvojCqlsVHkbAJjGlifkQMge
         6JiVohTeX44+jnE8BfJiwP7HVY24xFSGlWcXo3b9cPzKhWnSzt1qZJegqmFPP/SPgZkP
         FxqRjRz90bofbTUZBuLg5YQCdsac8uPI9tqpEEnJA9ySnjIq1O8Xrf0nzjqTp/18TXGr
         rnTVbS+QeHrX2iCWtIRlMh7buwaFzyk70ub1PfAxNb0aJ6fx8CtwrnwOniiTb3BbGtcR
         7VsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790057864; x=1790662664;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WWkl2gI4Dl651xy5p+ZRq11frqsemeLyAmJ3wzayKPw=;
        b=xnSNF2ElFi6hcpjXfRuagOcFVAY1XgWlLbFjlleLF4Zf79dpTHC2mrcaec27c+/zjK
         sffG1HfmUwKKhfTkCP113cpRyF/d0wwpheAypKhNkC/Y85lYH1qaSzyvKACuJZuHm1OA
         TdtQzObblLGwGUWBRFAMp+ei5Mx0qwEZ1/drSvq+tcH7cPVJslj2traGoC0yUGNRx1Ly
         8Prs3oJGe1lqXRtcB42cGJmnAoBjCiMfe91w1V9cmPMq0BNF1q1XBZPk3A7KfvBZok7u
         deLglj3Zkgvl1YjzRfVlGFN/rd0L+9E+QxXZB5CSg+Ez5Lg8gUssTwxkxOFZRk3SDtNW
         c8iw==
X-Forwarded-Encrypted: i=1; AKwUvBzw54bF575eDfiuzEhLr0K6axc9kSWaut8cOg4SId5gjmkf5pFGtTBA+kQU3fBH0YeHVcQXSE+uPXhO@vger.kernel.org
X-Gm-Message-State: AFuF++moYDnSNCYFdyD69do0WLR5mnz6dVUCjaDZNa56zxJ1cL/VnFAd
	llpLKBFTWIoxRNQULsQcYVaVpRoA7usvqRVsVLgID5TN1dXmi72zq1R0O+9H5l2va607eIBZc27
	lOshFWN1SK4vebJOJwSx/8OFKdpvsFiocCl8hF+9IdN7NTEtBoGbgrbLst8Hs1Rs1
X-Gm-Gg: AYBFou1sI23oHYSeLgG/xHtX7IBPCpiAPZ09N2z8+fIOlVz7RX/jvYBXPHkK8lP4TKl
	ydtUYuUnz04KNmGqKfXP7XoFa+3o/9zGCiNX72jQ1T78U4vVjZjriHUUkqA0Xpg1RI8jcEy4GMu
	BBuQtt2qSR/pxJJa/vpCXczbzy+Gofm3oskLAt734/N3vFfeplFXM3A630OybcXOvFrZC4jr/o0
	LrtAhsPY29KTSQdmPMetMrGiE7w9OPaIkBKYxZ0Z2BdMPouFJWPXNuRiAWDpxtJXmKAfiLyNHFg
	ttnIdBuA6+Du61zSZEw7/HFxC+P6LRB4NKx4zrP7MW/twr2+bGe/PO42Y6U2CnCa6Gj3idGp9bY
	BsDNvd8B6sU5cqo7dsN6fdbu1iO95d4QMMhk=
X-Received: by 2002:a17:903:3b86:b0:2dd:c100:a5e9 with SMTP id d9443c01a7336-2df60b7ab72mr1331775ad.61.1790057863726;
        Mon, 21 Sep 2026 23:17:43 -0700 (PDT)
X-Received: by 2002:a17:903:3b86:b0:2dd:c100:a5e9 with SMTP id d9443c01a7336-2df60b7ab72mr1331645ad.61.1790057863321;
        Mon, 21 Sep 2026 23:17:43 -0700 (PDT)
Received: from hu-ssmaurya-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e610e786dsm2974252eec.1.2026.09.21.23.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 23:17:42 -0700 (PDT)
Date: Tue, 22 Sep 2026 11:47:35 +0530
From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: monaco-evk: Add Raspberry Pi
 7-inch DSI panel overlay
Message-ID: <arIdf+RFybbdI4ki@hu-ssmaurya-hyd.qualcomm.com>
References: <20260907-rpi_dts_overlay-v2-0-a4989322ce00@oss.qualcomm.com>
 <20260907-rpi_dts_overlay-v2-1-a4989322ce00@oss.qualcomm.com>
 <7266e78b-6768-47f3-873b-920c4f7e5d80@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7266e78b-6768-47f3-873b-920c4f7e5d80@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: BKbkzon6IhcNwUOjYFFADsmd8KtykrUx
X-Proofpoint-GUID: BKbkzon6IhcNwUOjYFFADsmd8KtykrUx
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDA4OCBTYWx0ZWRfX1PVlqBCkbrS2
 UU0EHrIy2dIqBCA+SU6CI6DIk/yvcm5r01P7N47ynI/NWpHnap4ADihMH9w6+GDOQ3X0vJt4eJL
 KtkVNDTiru7Vdi7eRNcvQpVBLsxxrjE=
X-Authority-Analysis: v=2.4 cv=NKBAaE6g c=1 sm=1 tr=0 ts=6ab21d88 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=x-C9AHaFmKqvuEDWSewA:9 a=CjuIK1q_8ugA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDA4OCBTYWx0ZWRfX9QV0HhbyAWQK
 VCs8R9N0yztL3UK2HbE8mwO9AR4fbZ7YiQvOUocanAhoxylkPjNBTIsRB5s0xrB6UUoXNFhHRfM
 dIN69WVe3U/wnGjDi33IWNxKZa+6BWrm+vtF5CRVaFGNalZSslstdBqlezMBpyMgg4LKnG3TgD+
 Clr6qmHvk9mdnHfpNQRFA20nthJGWz72Uuk2xSKpd04DFAoH7yyPt3drVNrQvwkSOaLCJfPbo8j
 I46uw1dAhvxa+poOAOC1Wo1gRb9GEhAXEjZnv2+ajWHpsvjb3WKCru21MDWBA9aORetKv0xsssa
 xRlLsKKo+EG822A+tIdEkyYEnIWXJQ9pZG8O/x9aCHNRs5tR9g/J+qDlPp2WS/BeZge4fbRZTfm
 lUd1avfOJb44tveV0mAFmIbx7t9dW/K18D/PN5wAYuozIv0N+3OsuVEjO0SbgyvTOqkoLU+W9TC
 2VSdG+u/pMSW4BbdY1g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220088

On Wed, Sep 09, 2026 at 04:51:01PM +0200, Konrad Dybcio wrote:
> On 9/7/26 8:33 AM, Shashank Maurya wrote:
> > Add a DT overlay for the Raspberry Pi 7" DSI touchscreen panel on
> > Monaco EVK, using mdss_dsi0 with 2 data lanes and the panel MCU on
> > I2C8.
> > 
> > Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +	reg_dsi_touch: regulator-touch {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "rpi-touch";
> > +		regulator-min-microvolt = <5500000>;
> > +		regulator-max-microvolt = <5500000>;
> > +		gpio = <&expander3 5 GPIO_ACTIVE_HIGH>;
> > +		enable-active-high;
> > +		regulator-always-on;
> > +	};
> 
> Does this need to be always-on? There's clearly a consumer for it
> 
> Konrad

No, I'll remove regulator-always-on in next revision.
