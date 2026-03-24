Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26721D555
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 00:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774311295; cv=none; b=JHayLiOiF9fw88X86adus0Ffwfhi0blOI65nZdcqmEsYh+DuXQ0iN/oga7UG8MoRoaK4J/ViZDenRx7f11/0zlw4jsMDZocSXSbgFRh/NSZwr1qb9qxC1Vk11D53v/B7htfwCjdmhQvxZNa7xHgtzCywUHNKWiB8vMdXW2nhvNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774311295; c=relaxed/simple;
	bh=9j09q0k3NPk/W0D1Mv7Z4HyOO1Fb7jqm4O93lRXLmOM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FXzaHCPMaCEpeMb/Q9vhVnDOZUOv+eaHcyEtrRoE8aINRncutTnZfuxa5RHw0Oy1KcjYkrK/uBBUXi1gpattWirIN6uMSqYjh1qHYl1UdXNoxSXSwkp98V0S+J36IuMOiNy3BmfcQoqsY5d2Y13mUrB2BmWDrYF6qONCeh4ncEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cko+SQ19; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pmq9nEBT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cko+SQ19";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pmq9nEBT"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqZ7w943558
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 00:14:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=J3sy8D6eHBM8dtQyfghIUFTJ
	5QTZQVrPaBV+09pQxmY=; b=Cko+SQ19I5/wdL89clpobSqb2dQW6xAwzc4RuNCp
	Sd2/vDqK9nVwOvxTeUeE4zxT/yHWYk5c0CpPh4WtwWda2QsY200/u6tR5uDjF8pk
	4hTeuR1qnwC/A4FTT9da03HsoNRe5daokCn9CzEShUPYnWSGmSfVjKJH8jE5t5JO
	7YIXWypJr35ZsBE7L7/qEAMPDC0mdlmsUmtZp8x/NM+voIl+b6mMW0UmeT/2CNaZ
	2ESeYdx4K/FupUO1FLhMNAr1jZhqJM+loyQAO5npILweTh+iKl7T+NhUCNHLZksd
	vXsJgtTKHEDHrcq1W/pHcWMjQ3oj7fXwS5EacLs3oisOPA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d34vktcch-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 00:14:53 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50917996cfaso60519231cf.0
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 17:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774311293; x=1774916093; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J3sy8D6eHBM8dtQyfghIUFTJ5QTZQVrPaBV+09pQxmY=;
        b=Pmq9nEBTU4L/NMuo/uWeRPRNMx/14YBJvi32JhbyTwea0k9DhoiKgIbEelepyXvlkl
         +fdcrZ9nm4JvkPd4KoBDaz4uRglQSH2/vUnbSr5RBS73eM0Oz/LQv/oYjkyGEqN4Q2DO
         gu2TVM1+A9wwolr/F991KLpVEpIgiggDgX1vCDcRuwWC7mD0HledjV7FK0q3LHlavTd9
         AV2Bc/sAvsx7vJdausFIohowFvVBzyI4iJhdK2HykJZ/LH78a2bPyy6tEFsDgIF5xdFF
         Y702u8eBy493yVivaiPGCixS6cWO/fc3IsKEXTz44H7tCX94ZVRLg7yJ71u98NXYCUwK
         0z9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774311293; x=1774916093;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J3sy8D6eHBM8dtQyfghIUFTJ5QTZQVrPaBV+09pQxmY=;
        b=sY9NBHPDQ3I8DEgvqNBUaX30yPidsy3RQF2B8GjS1Rzz/e6C6zBmzzCNFTDgo6qTg6
         l8d7bvMKOd+pUfIy4tL1q+x13H5eEbfl86OAErIip9e39TfoRQ34N17tPhxCdYzJ8SX1
         RXBjHOsnnVlb8A+AJhgtHA1kk06/2QSngQ/Iacg7tMwS1FwccMjSwBISiT8mBSk/Qqqq
         0J4DX21v0XYAvnUIjUDSQErJyul4We/VDVXtnPJiXLuPtIaNi8osADrJaBJUcFa1FCtD
         SItIi5a7QDtx3HsnSlexbxZzmFPoPDkKDWU2GdZIaPuRWpWKz4nHYVMpFVMBhMwiG51c
         YRFg==
X-Forwarded-Encrypted: i=1; AJvYcCWhcY8zTaoVj9taO9A9auv7clDIIw66+Jf4nQ+VDUXRgzbSkhY1YhIr5mKhsIazt7A4Nw85R8hdHSe0@vger.kernel.org
X-Gm-Message-State: AOJu0YwA4s/vuMLH600jA0vPf1zckJHMHmNSa1w0h5PDyMyeHZc1ynEB
	kuoZbuxuWbfsGGAUhxBneub/xEhyt8gz0y/BSW2zoq+XuTARcESXu7SptG8gDlQa4gFsrOFAbAg
	PElCZSBF0RTJFBeg9BVO+gyKbpHIHHbsTBSo1qeXzxBSpJvGg/RZHUxP2Eghgqm7y
X-Gm-Gg: ATEYQzwB+wO5LEPBG/RrZCszF5BJoU0cOjQURqvbWmbu+mbapfDWbAIB7HuNaIik3ov
	6Z1iflLeC//VWK9CPljGq1gDjGx5UeVsHxumT+PBdoAvl11TlZ1Ne2UIOmcX0KwnQDbwXj1/u+d
	VjfQd+qJ+93musZSnekK5Ja4SZAfB8jd5EvR7r+46KNI6cJYufDzUS+V9z7OS2PGhCxKTGa40yd
	hF3AJ0VhQqaRnI9YmmGQeer6trb1Tlg53flr35Zq3pDeTXN8l1x1pIGvLYzmAgTTaKOe+CzmMIo
	8KlT4c4ZLzW4a8DvejB3g1J+ia2XW5Z2Wj2MrapKzGHhSPlFMpfmhBJ2gmbJKthspJ5RZ2d0WIW
	GYs7SgINKJMS9DHgS96K0snUqkRfEGvywXZBtCXwIf4RwV6d0Az7Jvkq3vDhZZ7F9IrnU0axLkz
	sPQT7HUEQw9YsePKP1cTmU26lIHbms4oyJ440=
X-Received: by 2002:ac8:5f54:0:b0:50b:3f50:16c with SMTP id d75a77b69052e-50b3f501f48mr198988141cf.15.1774311293086;
        Mon, 23 Mar 2026 17:14:53 -0700 (PDT)
X-Received: by 2002:ac8:5f54:0:b0:50b:3f50:16c with SMTP id d75a77b69052e-50b3f501f48mr198987811cf.15.1774311292577;
        Mon, 23 Mar 2026 17:14:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf9aac6f5sm28265831fa.33.2026.03.23.17.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 17:14:49 -0700 (PDT)
Date: Tue, 24 Mar 2026 02:14:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Val Packett <val@packett.cool>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: kodiak: Add LPASS I2S2 pinctrl
 definitions
Message-ID: <xxh5wwzte4ccqc3tcsokx2oaj5vv4jz2mvvop77w56olae455y@cq6ddiifnk3k>
References: <20260323095247.92890-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323095247.92890-1-val@packett.cool>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDAwMCBTYWx0ZWRfX2wLbergo1BtM
 +l2ARwhGX1l4ZXkZcHVaJukKIa3uMblW6+Cc8ASs2tr+ES0/tvDl1wCbSMr5BCnQJCY32eaSLgc
 NYyCfpyGNIy1OXrMbLjDdd8RUougeo+APviv8RttBRjsiEDh6PJ/ctrtt5yhopusKKbTbQoew5g
 CnnC+zOn8uOF/W6sQQyGNQduFNIGW++BDBoORFT9RIr1MfIV/L4byPZR2awIbDRhJNyvZaS3J2q
 uJOQ13WU4yi5jexzbL53WTvu4AM8ismrMxD8bXwZ0awSq0jZGN/wxfY3VzF3YpY9YxzAic5dyHD
 eeWhgygbl+aL/mHpnI5MVW9s4FKslWiJAoC20pU/i/YTxOx/mEyIBil4+EoOTYU6ra9JqtenrBt
 kt38nDxovJrqgYWddEQgyHP0q97qGXHqykRtxibTfnrjUYNW+AMU6w0tTgm1E2jNZqv/2KEZE07
 AdKGidSs0zLB911Dskg==
X-Authority-Analysis: v=2.4 cv=eMoeTXp1 c=1 sm=1 tr=0 ts=69c1d77d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Z3ui5y-J4bSPkrMtwxMA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: qOb2iI7bQlb0siPxS9JCNbAB_iJS9TQr
X-Proofpoint-ORIG-GUID: qOb2iI7bQlb0siPxS9JCNbAB_iJS9TQr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_07,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240000

On Mon, Mar 23, 2026 at 06:40:47AM -0300, Val Packett wrote:
> Add the pinctrl definitions to configure gpio10-gpio13 of the lpass_tlmm
> for I2S output.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---
> Similar to ff9c117c32bc6ace7 which just landed, this is for the other MI2S
> interface on there. It is the Senary MI2S, so actually using it requires
> the series from [1] and then more changes on top, but I have sound working
> on my device with it, so let's get this DT chunk in first / at the same time
> as the other prereqs land as well.
> 
> [1]: https://lore.kernel.org/all/20260320144918.1685838-1-srinivas.kandagatla@oss.qualcomm.com/
> 
> Thanks,
> ~val
> ---
>  arch/arm64/boot/dts/qcom/kodiak.dtsi | 52 ++++++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
