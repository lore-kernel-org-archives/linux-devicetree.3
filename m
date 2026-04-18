Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869462EFDA6
	for <devicetree@vger.kernel.org>; Sat, 18 Apr 2026 16:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776528668; cv=none; b=DE1YuvdiBsnWtps2uzVeGQvatXkf/95/F/Mg3faEsfFboPApPBOuU7ffEUhcwg6Je5Qb+nBXmwuRhijMrVDrah7gLtGhcypHmSNjb7mUIog2+b102B/1lFGJfkcyLCcML+sgD7M7S2h/s4u0DJRsS8v+5MyZ2/zwH3DLOWthDFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776528668; c=relaxed/simple;
	bh=UEnZF331CsgXJwwFeI3HufONJrEKbDvBmT7uOVLUG0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iwFIst85iMyLqrg2k/Ppqsw4Ez0n2RRwzGtdEWmzYIARAxtAqhi/HT8ed0wUE2lZHFEa5dmbFewRfw2RA/XX98j4n2OnnueVgltlu5xuWu2/Yy2JUzVESDG+oqyk3Jku++oOvctk+IK6Y8RyIfUglA2deaBJb7p0mTGdnOaR69k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LDmBt9WM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EOZdOUid; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LDmBt9WM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EOZdOUid"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63I4UBtE2011803
	for <devicetree@vger.kernel.org>; Sat, 18 Apr 2026 16:11:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FYJXR7Vj/iJOr5VO40dA1IKT
	kKe0B9u9fRBgsMHKSoE=; b=LDmBt9WMbGw9sw/2KlRhymVsKj/mgG40TZDP/8NY
	5JVyk11bzWAjDzWlw9fa4odGrr3KJOVF1mPB2BZ9UO8+b6CBuIj3+N+UoVDYRklT
	A0HVZ75AlqcYJZlI9qyIfaVYwlIkLv758dyG6WUS0qgIfleTyao/3wi0hpZNguCM
	+oU2fUDQe2hpUeSEperQbnImKkcWh2TYVa1jveov17Uu5MdOt3QoDoehRmU+nHuz
	CSPjEPRxYusObVIut1hv2dk5acmkQtcsPmOQYkFiKyN+MAwtLWoijjnQ9tYz1otk
	Q6Oqkz7Zmzdlj+JRy9X1IupD/WLx3TiHXKp4pd/8W37K3g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm0y617tb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 18 Apr 2026 16:11:06 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b220c72bbso47804721cf.1
        for <devicetree@vger.kernel.org>; Sat, 18 Apr 2026 09:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776528666; x=1777133466; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FYJXR7Vj/iJOr5VO40dA1IKTkKe0B9u9fRBgsMHKSoE=;
        b=EOZdOUidQGCgh5DgnMchCvQtGrdPSkuNUpXww+zp16KuSHZadF0nGpSUJRp3kemX8c
         vhNugLKLBUn6Sl6zhrCo1No1niQqJ3fopXI1hg93d+bCmLEEjIRcbDec5lCGJTPhQozA
         M/T85pPyC0rZurjdR/sqRc2JphQ+pyBNyPByetQ5KIZW0FejBYZrwQk/MvjPT4+Ba3xu
         VR5jlQjy62Vp8ibGxDk0qMOpKGXbLVXDwXg4mShIdxB09uP7NQjFmHbBukuIT90Jw/CN
         sxc/Rziu5S2qZ3tkM74jiQ9O4qmS5Jq770QGbmou6HSXxGMuq9FiIv7WMyHYUVFf6QVo
         mt4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776528666; x=1777133466;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FYJXR7Vj/iJOr5VO40dA1IKTkKe0B9u9fRBgsMHKSoE=;
        b=HmwF9Z6xFmGP+27ea7sk+vW+q7V8gPNiznJEXMl9LwrpF2FpFccUwAfWtagZEYxkkN
         wZw/tch43hTgp/3lYBjpoMoMSJ/w0khHa8pIEs5L8DDapCdWYqZTPr7Zj+QCLIdm+if7
         qE34T6ryV5a8MXBzWdFJy2d3lwjsGrE8AV/bpCKN5NLl9XdAsWtNfpKJtMIEOeHSvWhq
         jyu6sMVRKZBPvd1+7vLtn/WDd2VasSxb1kgzmhrnEZG3uPFaU51Wpye4qYwFyDFLb22f
         kW+yHGNrplUGPW8cV7gshsi7u8+kSxwMf+nKaK5EO/SEjfnSRP9dw2ciz1Ancpkrwkkg
         gtBA==
X-Forwarded-Encrypted: i=1; AFNElJ/007MFqOUO2qAU+BXjGRS0ZpnIQuwYQiuer+5YbLpsmDaz0StEUxa65O5dq6jB5GtMOVNi8wjMBa7Y@vger.kernel.org
X-Gm-Message-State: AOJu0YyJjR37xI7U71AVmLJ7tzYs2Tq7SFMKj6FWfbhVXJc+UEJcwvtw
	vQJ/vGfLMuzXWB8HikgCla/23QYTV+7n04UQrcOJOgGCCaq33mhVR1vPMxIu3qYFF/c1KZl74NS
	w/feVshxINRxvZReiim56opkNDtpU4fUJaRtFunvd20GaEDrqvVJYkf7LOtovgLGh
X-Gm-Gg: AeBDieuxsaucq63yx8iXx++WkNqI/SLmFxwBOc9L6RvbqQJ+7DbtQF7pNfKlEg0ybmf
	o5J9+XwBW0v/BT5a0EcFGjXpjCflQrJNHa7dijg/9NuLAYP/ER1bWGDHQAw/nb4WRqvdImoLCYk
	1fd6Jzhm0oj/hX8U3901iAGNuq8o8iSIBFQS9GZ0336ZLHbbqTQUzhTCwYlkAyBXu1Ape7eDk3G
	QiJsTpZ1yI+2Rh4H7frq78Z/wBER9QjhKKdAXT3x6Kzl+aiZKCkU42hthKLeGRuAnjTGjV7nABS
	uUldgt41KwyiYK6UX7rXs0OEvHM2coNFCJSNb/OYImEB0XAueW8czDaGMU6IRW1xP8qakfwELzx
	ZBQUVPugv5AdicvIUh33f5Zr93eCnkTy2FqC2Nn2xFfqvohGnVADU8yl4FTbzxLPaiW5qTK9tGh
	I8qRkXUQ0I5F7FuIGDyoiF4DrerIflbXTJ9liII6Zs+OCCcQ==
X-Received: by 2002:ac8:7d4e:0:b0:50d:a5e8:39f5 with SMTP id d75a77b69052e-50e36b5bae8mr106235751cf.27.1776528665891;
        Sat, 18 Apr 2026 09:11:05 -0700 (PDT)
X-Received: by 2002:ac8:7d4e:0:b0:50d:a5e8:39f5 with SMTP id d75a77b69052e-50e36b5bae8mr106235441cf.27.1776528665507;
        Sat, 18 Apr 2026 09:11:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185c88adsm1464383e87.35.2026.04.18.09.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 09:11:04 -0700 (PDT)
Date: Sat, 18 Apr 2026 19:11:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Antony Kurniawan Soemardi <linux@smankusors.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Rudraksha Gupta <guptarud@gmail.com>
Subject: Re: [PATCH 03/10] mfd: qcom_rpm: add msm8960 QDSS clock resource
Message-ID: <rnpbdbjlpx6wemeuzsm33njmnihhli6mvjzhwu4m64vpgbxait@7pnk2rdt2djk>
References: <20260414-msm8960-wifi-v1-0-007fda9d6134@smankusors.com>
 <20260414-msm8960-wifi-v1-3-007fda9d6134@smankusors.com>
 <c63abc0e-e060-4825-b595-a46ddf262673@oss.qualcomm.com>
 <caa589af-f026-4664-8fb9-6b23b0e087f9@oss.qualcomm.com>
 <71751331-651d-43aa-b30f-135cc62e8915@smankusors.com>
 <00e40481-9e62-437e-ac75-a04594ef6879@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00e40481-9e62-437e-ac75-a04594ef6879@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: O4gm4HtjIGGR23Mp5EryKeNbDRUneD2l
X-Authority-Analysis: v=2.4 cv=Fpo1OWrq c=1 sm=1 tr=0 ts=69e3ad1a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=wxLWbCv9AAAA:8
 a=wPxmQtTReXDiQBvha_gA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-GUID: O4gm4HtjIGGR23Mp5EryKeNbDRUneD2l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE4MDE2MSBTYWx0ZWRfXznerh9vpYMKY
 s1zAHYYMrBgBSzcDIdAZpJM7yB4L3sKOBAXF0LwYj4wZg/paEJgMilnsvKgdvTak9Q9srANvRtQ
 aF7yNyULOPhmV9Sf9wzJEuE0Padjj0A2a/TcovXdN/yaj1tWf36GiaWr2poCWetMvi8L1LmTg0i
 35QaVWJQlzEz7gXpgverpP24AXPRQnI9xeCjXZk0inol6j6PNL/bojdPpEGDJ49qsBegO0yC1i0
 sPDYGs5X3zW9R5JP5S7W/cPgazmV+WmZoudjnEQiTXM7eR1Q2CNvn+mS709nnqO+TFxlV6uZTZC
 FY+34EmqWGgYx5TvkQB4Ou0ktbvIHA1mp+rv+0517aLhbY3jJIX8E5SCYQEgbtzaUcT3k/8ZxQ1
 KmMSU1awBGuNavFHroOivZcsEX9inDEkqvxUBs6UNa9T989E76RheW5LbPL/Nyd5sTmRoIlRdeZ
 DvhxejjR72Tm0FKF69Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-18_04,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604180161

On Thu, Apr 16, 2026 at 03:49:33PM +0200, Konrad Dybcio wrote:
> On 4/15/26 5:20 PM, Antony Kurniawan Soemardi wrote:
> > On 4/14/2026 3:07 PM, Konrad Dybcio wrote:
> >> On 4/14/26 10:06 AM, Konrad Dybcio wrote:
> >>> On 4/13/26 8:55 PM, Antony Kurniawan Soemardi via B4 Relay wrote:
> >>>> From: Antony Kurniawan Soemardi <linux@smankusors.com>
> >>>>
> >>>> msm8960 uses the same clock descriptor as apq8064 but lacked the
> >>>
> >>> This doesn't quite seem to be the case, some fields differ and
> >>> apq8064 additionally has:
> >>>
> >>> QCOM_RPM_PM8821_SMPS1
> >>> QCOM_RPM_PM8821_SMPS2
> >>> QCOM_RPM_PM8821_LDO1
> >>> QCOM_RPM_VDDMIN_GPIO
> >>
> >> Ah hmm, the MFD driver seems to provide *all* RPM resources..
> > 
> > What I meant by "clock descriptor" in the commit message was
> > specifically the subset corresponding to RPM managed clocks. From what I
> > can tell based on downstream code, msm8960 and apq8064 seem to share the
> > same set of RPM clocks, even though the overall resource lists differ.
> > 
> > Is that understanding correct?
> 
> If that's struct msm_rpm_map_data on msm-3.x, then I see that 8x60 has:
> 
> +MSM_RPM_MAP(PLL_4, PLL_4, 1),
> +MSM_RPM_MAP(SMI_CLK, SMI_CLK, 1),
> 
> While 8960 has:
> -MSM_RPM_MAP(QDSS_CLK, QDSS_CLK, 1),

You are comparing 8x60 to 8960, while it should be 8960 to 8064.

I see that there are differences, but the QDSS is the same.

-- 
With best wishes
Dmitry
