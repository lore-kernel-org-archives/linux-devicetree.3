Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA5E3E6DF4
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 20:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784837315; cv=none; b=rhBNIhqsJQMczGsvkYOxfIMEFuRr0KxYnkoTFz6UDL1RDX4IxjWKwECe6R+PWk+MTLXuCmg1yRl+dt1ArPn1j73+eaReoesvu4nJVDeelWuBiZbZwft15zvCZpO5ANMM4pFgLPlcea+F+T3oWvYNloS9dLP/5PUh+xD0hs2I//k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784837315; c=relaxed/simple;
	bh=X5IeEyHhqfiU4vax8k/q2znLh+HxOwXq1G3aQlCC6zs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VwoqOePjTmzVJp5QOj1DrEbJ01NZr6Vn3tYXGbuF1dmyEkmto/50TfwSDxOpiqHchsFBtS8iUjc4qh/xQHmUMX0CoYa8VM8RVXWfdCXGYqNTwIt/TkX0n2vFkRQaTGUP7iMCuvYOkJBwEgzvkvpAWnFd+PMjtQTsxqKbLdC3/xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y34WaI91; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LJOiaIS6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y34WaI91";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LJOiaIS6"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NImQWM224921
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 20:08:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QJWpxrpCTfCoev6TEWx7VCk5
	Z60cqaA3jd7et/AfqGA=; b=Y34WaI91d8baTQmfP2a3vb2ToVONN5O8IYu78dGT
	oJuVSa6Ux8g8StSy3zjpmDUCq4cHADsixaIp4kaFr9ABCRbVxT28C9AY2xeCoWhu
	Ngr8jcc0tcqos+gc7ujoyGll+edsVobbPu+8/xPzRGWqnlg/PmCI/eOZUntGt24c
	CH/iOApr+Yj3Nm4XZOMvEv5dkD1nPpquy8ZtFm1xxCHiDWFYz4iyfZ2IfDTZ5Wqy
	/vgoeEBJTrBRao/cxmmUJiaHUv5WAMnzZb5cWc5dYdfhF/YVK53CTZZvb4Ip6elL
	I3HEr8zhNB/dxj0Wj2xXqRsOUxVXJtgbbOklw3nDz0dpzw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkeuqb5sq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 20:08:31 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1a97644aso27905511cf.2
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 13:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784837310; x=1785442110; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QJWpxrpCTfCoev6TEWx7VCk5Z60cqaA3jd7et/AfqGA=;
        b=LJOiaIS6rFXbPvMQebq128HW+nMoA+0PtHDzf5q5fjLAMhlA7jGHsNtwm83DaI5qw9
         whEYEZSkGmZOGnjUYc0m1V0PHDwCuUpQLmcG+PJpjMa57bjTNl7VV3zCfMMCLDN3ixr2
         5Hj89Fa0BORH7Ir9+OrLOX684S77wHkhe2apHNyF3eGxBudev9EbDiZDqlK6okz9K2k5
         xXKHkbf05+d1BD47wuyVi5BePoHxSfMXeJVBF49VjL236iDoNv4YT+Fva+3Mn3/M9qDO
         I6+YUpKHkGcJ/GH9BmHCDESqgNsvzvgPs65iufKzrwclGXWq/l+iKlupy7z4dNytP1vg
         WEYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784837310; x=1785442110;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QJWpxrpCTfCoev6TEWx7VCk5Z60cqaA3jd7et/AfqGA=;
        b=sv3+w/9I/KYGzGn41VrqmFUKypWYKtPT0p4RvBx9/59pVWoR5tT1afzA9pQL8h3IL1
         vQK2beFfTy6+i1BiXOVo+5wDavVdTjC7sGAWze88UrAVTaVqBCSE8H9Cdt39QNNwAqRX
         bkjno0fVwZJqKI/KT1E38PwU67lWZBJ06miXj7ck8vDXkSB7h9/PAXKg9HDTuspj10Cd
         m/s9pZU/mPVu6tUe4WeSgqctTOaoAAqATVWe+smXHrQ4AMJNL2YaZtjHY/orSeJYdBJf
         JZXvrllbYlPjbmijBFiPRn7BIkVRmrADfSUq8xxb+KPLXoBm4RHgr5yFpo+i5vl/0n6W
         1+bg==
X-Forwarded-Encrypted: i=1; AHgh+RpOFr823FQTq8wzEgGT3L2vLgtdZGapeagLn+5jgfacTISCxPABjENuiy3u1+JEm6gb3zjqUuy/ctkg@vger.kernel.org
X-Gm-Message-State: AOJu0YwfH9L7dGkA//zySx+hQULeOiK4BzQ1Gxd9svBtFHVigjVLTQjg
	tcXz5AtpoXWVKcqeE3HbhcFo4QXBe6WoBKkYluaZu49mKFkcLkOq8CsIgzmztI7RjhWnQmzutZ5
	3VBHErMnMfdlauJ/MupjKRGPL54LS0EEZ3y8vEsOQhTmKZlgtawJzBMbSSmJ1UP8I
X-Gm-Gg: AR+sD10K37GlNe5B605T2otcPemvh3GEtLhDWkj5xuD72eBlAVGJqVxZJ7YZvnrCNGH
	CdEVOPCnTlM6e2+ASbnetrA/x9g5ZJYlrZlzxypqQ0KsPl4ADOKAbmKz9tMQhcXq58G/UvT/aQx
	UupD+GaU1zbMOVCDYCnrVPsvBbDfTkKhLNDaccnnTMj6gRk0P4B8DvSiR/Q3hWyreptxHh7kRLq
	ZtxaFmoqs4RiwDLLAxrKwWkxzZHCqAczpiWNZ8zcMyINAkj/9aJ+Lfc/oeOHMeKJTA1HUuLn31y
	OVocX0xhO8wDU2rzcnzp/x8TtOFLHRpZQy2x3jcx/2ulJH9fvpRM83IvQzNQzh8dGWfyfa+BPQP
	ShlAq75lYbg0GlsdAHwbYSeQLon3cA/pFWfJbdIq97D5Sdau7Onut/TTxVejXHG8Bi88aEs907K
	4I4OIxu118Vz2HsA==
X-Received: by 2002:a05:622a:1f98:b0:51c:7b11:41b5 with SMTP id d75a77b69052e-5283dfae386mr45938671cf.81.1784837310223;
        Thu, 23 Jul 2026 13:08:30 -0700 (PDT)
X-Received: by 2002:a05:622a:1f98:b0:51c:7b11:41b5 with SMTP id d75a77b69052e-5283dfae386mr45938151cf.81.1784837309623;
        Thu, 23 Jul 2026 13:08:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9b9a801sm1165095e87.19.2026.07.23.13.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 13:08:27 -0700 (PDT)
Date: Thu, 23 Jul 2026 23:08:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: glymur: Fix properties of usb_hs
 node
Message-ID: <jczjf34ucekqisjjp2bo7sl6gd47vdk4mv46ueqdiufqzn57zq@dxbbnaxpz526>
References: <20260723-glymur-usb-fixes-v1-0-816357d5319c@oss.qualcomm.com>
 <20260723-glymur-usb-fixes-v1-1-816357d5319c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723-glymur-usb-fixes-v1-1-816357d5319c@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE5NSBTYWx0ZWRfXzNQdWV6UY1x/
 XThJ3TTFgYHpsFxeDifN8vpyX0Hb6j+UKLLekr/R05TQDAj9EX2zbhhaGfy6QtApCbsY9v4VN4a
 EIoGa5OBRa8f6LUm8ahI74FFKxxqQKE=
X-Proofpoint-ORIG-GUID: EEeB-OaxdGC___D7t50hLnxrCToD_TCB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE5NSBTYWx0ZWRfXwQUfWHi37t0V
 FG992wh3lNBcicHzGBW/19Xeg/xqkFuvtMfyJXMGDfpuU0ZnyeMtNRhIcPUx6EZgh+TC/a9z9Y6
 uV2oZjZkarWCGzhLmQ9grshkWD5UKw9zfX7TqH4rFH4AsyuaXnuqyYA/9c0XXKfdRi7cYO33veH
 c4owtW2cswHrnjTB2N50mkI85sXYRbwCPtjr8XOtXrYhxWHmVjHTYyn6xgbb9xWAS7FVYafOc9l
 GK8mu3C3UWR8TLyrLnRGcGsSXmE1gEvA6FHS4YrN24OuJXxCbT4aMqwNHNYCSmRJc1nGlNtH3L+
 wZH6gmoTSqQ7zctHkwOXBZ8U6FeBrbjVuiGv3dzBSEa7cj0mgqvfZ2tPqe/TYAXtK3bEdNxzhbU
 GMtWyhbhTx9fsT1WXjr7eyJe8TrZiOrLYalJoJSG1Dy0KyCEufZcdM5Rn7ek5Af5W00/QGeQyDQ
 30xbl8NR93hHD4eRQzw==
X-Authority-Analysis: v=2.4 cv=cPDQdFeN c=1 sm=1 tr=0 ts=6a6274bf cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=QLsariRrJL-ENzfB6-EA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: EEeB-OaxdGC___D7t50hLnxrCToD_TCB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_06,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230195

On Thu, Jul 23, 2026 at 11:02:25PM +0530, Krishna Kurapati wrote:
> The High-speed only controller is DRD capable. Hence move the dr_mode
> property to platform DTS and mark the controller as role switch capable.
> 
> While at it, since its high-speed only controller, disable pipe clock
> requirement.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 2 ++
>  arch/arm64/boot/dts/qcom/glymur.dtsi     | 5 +++--
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
