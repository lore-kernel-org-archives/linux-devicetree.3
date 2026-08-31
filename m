Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB323C10B5
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 08:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788165109; cv=none; b=foIE64xekRCCJKd1yWz1HhSb/VoHcDVtLfCenUg4QQgnKvXB+39seb91zvnvyVuqzvuGBuUgyaZAJQ0wRMjdvEM2GOXQoq1ShV2qFASr9vtdAj9HfnJRbVFsB+aM7XIFNs178lvHxKZA+1qCZXQ+jaD/owMXtdxps0Aq5t+nyag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788165109; c=relaxed/simple;
	bh=kuGr28k+G/FBXFkLTlJ5L7Pu7zIWGrw6d8n1l/enY2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mnc8oDG4JAoixsk189v3Vl3eNFksu/3xef56qtOK29iJiinHCk8ppycw0hted1tNCG0iX3Vlr4lzTVoBVUR+gamdAJXxCtjuVnFNheNLu+cxaAwBA0aE4pesLPXXXy53mgb7ADeIrzWaWSqF5f0gTRUMCKYpLIrL12D8KB6Mb+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OX5oOxDj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z2YxBIPa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OX5oOxDj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z2YxBIPa"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xkOd3427538
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 08:31:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2QCQEBDofLGKNXUpm45l2aUm
	lkaV4PGy5uUSHzM9U1A=; b=OX5oOxDj4FcmW6h8vw8rNItai69Cg5+CeKG+/ufj
	yC5ij9l1jIdzBh1xHDVJvaxR4kDFQrKdXPH4IeNHvSPmZV1FtvIVVnm14eTtn/8H
	QbiAQN43faoQsghjYGkd/g6KpP9btqmAy4PdpBvwpWkxv2YM6cs1CfE3bqTiNJAC
	cIZFTaO1XtniBegkqhZEkwvYz4o5ZZIRuhjlct4tyDlSwtOG1zQ8wBj6T+lkQlAK
	pc0ZYs3jYCW/E8wTMaBC81Yhe13PV8u3j8/RudnHXr+pWsWG84DGBN5Tfs88dmbJ
	XHqCPJuaF0QIdYLbfZGlj76NqpN23XIf2U1mDkmAss7erw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd4pm8e37-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 08:31:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9382f9430deso506161585a.1
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 01:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788165104; x=1788769904; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2QCQEBDofLGKNXUpm45l2aUmlkaV4PGy5uUSHzM9U1A=;
        b=Z2YxBIPaRLf1v1CDmIZ5gC3ObzsKcEGnKhnMcYTXmJXXMmvVV9F5tBakG7OkRg+YtV
         3zUTJnef4pGsFRxfWgq2HHGocyEY1u7SAwAWkeMXoZUmYV2iXXcGYU7/q48kjxEGEN+l
         h8nZiFDhG1aEVIX8z2L0zbvwrvQyTP2GibRxG0U3LuXBpwUF7WXdsXIzkc8Vm5yYvGVz
         0Yl5zV65S60SE5fEU3urUx/m2rXNnhtY6ZTb0yaF2LSjTZ2rbgyu+BTY+6YbAnvfiEA6
         QL6nSU5i4RBn5XlgGI5q+0hHk8UCNyWP711cnJA1wTyt8t27z0Xqk+Mu6QzwNC83+WZ/
         lM+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788165104; x=1788769904;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2QCQEBDofLGKNXUpm45l2aUmlkaV4PGy5uUSHzM9U1A=;
        b=c/n5a9jCkXpJCn2l5yirlXudpv3rb9cGqGNDdi1SkByf+7zw3dxL3Dr9y+gAjc0/BT
         i/6M2sksEaFwO1+WzX16AgPxUAnKkrwio+hSNJV0ZBCwOapubWcPOcsQqbKpCJhPNIKZ
         ZIjCw/pFG3oB7TuTHdyoqFID40SbZOGdBowwu58pXYhKzPtklCt0d0Ulmd+ybOnYRpAm
         z5IXnbVMzROF0jPX641g/p9JmUYgP13KKlxzDAbrqXHoFfHUi2Upt1Vnp695F18KQ13l
         4Hd+vQhKbhA6emi/nRZynXGR9ZOSneNf7Wp1Nu+Dv7JozahIi7LeZDmh1dntn054fXHF
         Xq1w==
X-Forwarded-Encrypted: i=1; AHgh+RpdpwXset6516ljAPUxdo2E5V0jqR9KA+OFRiQ6bdo1mIPfX5JRvVjp4h6DTl/OcNMRqad1ASwoVYbd@vger.kernel.org
X-Gm-Message-State: AFuF++myutWDk73J1BYyqjfRnzyQni+7U2/3l96EtMrxxnCDs35KKvk8
	mHpGNsrffy/sxtyw5mFvksh0sCRoxustFDeyuxxKiWFeSJ/LSKFIyqXNZQvrWw0gquKaTZlm5of
	8isEJ0026UwKvCVMllG9CUjRLadoP3oHmF5SxB4HZXOCA6Hw1QfGDF8k+wnohGK3K
X-Gm-Gg: AR+sD13ZLjkFtt7QbnB67mjKrHYhU3hC+Cogc9wbKtO6FOfbGoN/jCvZ+QIc/uqHOxU
	YKYse+5nyI3rYKgdqtkszhgTw4bwFpPhCmj5RmwAU1HXdyVsRHjNos1Dh9Sxkprl6w/lgwtOWwq
	SBaGKNPb6q2P2N0R2WOOtsE6+mg2QOY1yGTqQJOvx6pK87wJ7awwFyJW96YK3CQmvxnuJ7VSmEj
	/uDNFm6sgulZi+gl5Uu9Xlwv2LNXygvDnbi49wsqKKHJQREjQDrQiU5YJx/PAz3+EGKR4ilJKFx
	Z32pRnvGQyiYDIHTrBv3PvPUh33Hadjo7JVdAQYXITmISFvFtWiRu3Spwt72Y26XRFR7bv8la9I
	lV3rK+7187hsU
X-Received: by 2002:a05:620a:1d9e:b0:936:78c8:e286 with SMTP id af79cd13be357-93913909f14mr2166924485a.25.1788165104088;
        Mon, 31 Aug 2026 01:31:44 -0700 (PDT)
X-Received: by 2002:a05:620a:1d9e:b0:936:78c8:e286 with SMTP id af79cd13be357-93913909f14mr2166921885a.25.1788165103674;
        Mon, 31 Aug 2026 01:31:43 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b9617179asm123518505e9.2.2026.08.31.01.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:31:42 -0700 (PDT)
Date: Mon, 31 Aug 2026 11:31:41 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: defconfig: Enable PMIC5 Gen3 ADC thermal
 monitor
Message-ID: <svh7vbt5wzojs7xv6on2sfrdvutkigsptskvrjg3h5u3s7hqqj@orqs2wfmyzhh>
References: <20260830-hamoa-sys-therm-v1-0-27108c40fba5@oss.qualcomm.com>
 <20260830-hamoa-sys-therm-v1-3-27108c40fba5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260830-hamoa-sys-therm-v1-3-27108c40fba5@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 9bVpOaNTtXXwWBqh36PflLktENKCT4iW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3MiBTYWx0ZWRfX48SgDyyMEdMz
 dVkxVWMWlKPNc2qHMCDyeFnvJxOjjxZg+XLGIvNsveCNuLzMtd0+ArYse6lNT/Tv40Zjf0mSFhk
 5c+OMIupvJyzftRqAVJDxugbHpz+g/9zNWNt1jMRjZIMopicDtw2ytjJ1ETMM0C06R7MlVrsLsG
 184DGzFbSuUCyHCtS+Y4UNAjagO511jyLriv+RvRS/9Gq1VMk2f25bR9yo8/AT6sr0E28qtUxW6
 ztDKfaiCn8fGsjfA+tBr6ExbFRIcaOwD/8up6100YqRbYZ72RkNExFT/ZBxO5uCDQ9rKGGv5EKj
 VuYo/biffKJGCb8/lvWs+EqPFRPF9Xwo/qG7qFEhRhLwLKY+myaYq2uZTY/Lov5Q8o1JcCiTTWX
 bvntb/uw26MaBbJbty8jgIZMgRQiotgZ3yoeb86kJoOdnlB4TbnOpJ9Hsun8mOs/M1bLSkMzMJU
 eaXX7EkjIURmmJyzhTQ==
X-Proofpoint-GUID: 9bVpOaNTtXXwWBqh36PflLktENKCT4iW
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3MiBTYWx0ZWRfX9zvPFIn9DUX9
 ABSrXSXVNJziXVMpRbtgQLl4uZ0qvyItUp9cc8TUqmBnhm2rLwW9L3GWRF8KAJMNx3eedML4Vo/
 1CL7D+ZQ2pOvsCe+yr3mXDqtnpoJTbQ=
X-Authority-Analysis: v=2.4 cv=GbQnWwXL c=1 sm=1 tr=0 ts=6a953bf0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=FBXW8Om8NeiFsvgFa2AA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310072

On 26-08-30 21:02:04, Bjorn Andersson wrote:
> All Hamoa-based devices uses PMIC5 Gen3 ADC connected to thermistors for
> measuring temperature across the system.
> 
> Enable the Gen3 ADC, and it's associated ADC_TM auxiliary, drivers to
> enable these use cases.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
