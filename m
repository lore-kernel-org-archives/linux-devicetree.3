Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DB836AB44
	for <devicetree@vger.kernel.org>; Sun, 22 Mar 2026 17:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774201893; cv=none; b=q+1gHWIjsIGAhvhT+5LX5QkAPima2bla+vxCMNeYicmXx2YHA5BHBVxPuh2rPS6Ui79Zaq1W5GozpTDAbqADXAC9j3TEMx5/T4H0YTAdftJ636PA3elpcWRIn3nw2k4bs4hNgk6K5veoxb/Ei+JzSd1PwQN1NyMgzlndnmuaT9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774201893; c=relaxed/simple;
	bh=BR6ks9C+tiIaqbWqbymHyezXUzSCeunWrVZAw4lzMaw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rxYLeRWr05iqrf3ik/3q/1dLTxqIZU4PbpOwif3r5jwKEwmu4xNbUs7TM1W+6VyR44dFu8+L5VmOnaFjGm/AC8l4bqCD9Cea/yxBSO9swHst0mlhs6Cn9StGVLovXlDBg061iE2U6EIO2wrHCncn83DtWFeGI4N0P+Mp/7Se1P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hxCshyGI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kTYu8AOZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hxCshyGI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kTYu8AOZ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62M7DZkb2770715
	for <devicetree@vger.kernel.org>; Sun, 22 Mar 2026 17:51:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Gn3xvwDQZF6Nc0mtO8r4Mvv1
	J1b5vheHkTGYLDDSFG0=; b=hxCshyGIbFHwQ9WUACajdyhtH8ZOq3xfCoKcXJ70
	zLUbkfKOr9Gehqu7nq3fTdMsX2oKDWCxzCATCwhaSqao+4WdCqvnS/1gAU4Q1Suh
	KgYNYo3uUa+hEj60wP4SiuWz9/IVnfeHtgdC37MeC8cDPVhNg1Q3ht7EWIyV/e7T
	8rjQ52CFEaD1hp9rR08Azyok/S5bvtYyzYmvinOYLtkmH2i460xbXFlhSk66Pxme
	l7TbTvYp6zNMWZZODsiK59bKAr8h8paLF4vJQLVMUA4nvt9R5+2n0OVvc/oTxs6V
	Pq7F4tk/m9KGChZ+hF+b5hoRR5ZaiK8YpyxH3f51grGUqQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1kj1jnvr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 22 Mar 2026 17:51:30 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b469e5543so14149291cf.1
        for <devicetree@vger.kernel.org>; Sun, 22 Mar 2026 10:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774201890; x=1774806690; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Gn3xvwDQZF6Nc0mtO8r4Mvv1J1b5vheHkTGYLDDSFG0=;
        b=kTYu8AOZjCBWqJNtasNqpsgR1YrKaPxl6g99nm7kHuoaGKgG+HTsWrBI4jOEaG+b7W
         wt8TonR33aX1gsstGSEKev8x9DsjOrGmxtCTY/BG3jF4fPFwzIkr2ZI3jPGgU8d9X6nm
         KJwOW6RbQsYPoHbPebyOXW/V3m6q1j4Zjln7IpBJ9/BwcVH9SKE9GV5P5A98BLSjQkdY
         u/aJKlwdEVHCLGDdlrfUJ1hKnvJDHE1HH+eC5OLENabVF3EbLVXQf6Z1EVGLP0G8Vo0r
         qVcfwRxyoTTGWqFYrN5qT10m835plL+r5QG0V9zOHY9YaWU5Qmsookc0Ygq/lnDjvDJ1
         Wv6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774201890; x=1774806690;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gn3xvwDQZF6Nc0mtO8r4Mvv1J1b5vheHkTGYLDDSFG0=;
        b=jAciwHbVX6hLeRcU4zUCyJesuhLp4btmaWe4NxqGxkcYpOQ5/UDXBVErQH5JngugqZ
         x27b67wNtUjN4/h5RW/alJHDH4lawK81kDvIVnWrJsbj0BE6LlJrK0TegNb67ixo7dlR
         DXyDZL3Gj5IRfrVM+0n16o58EsEAv83NAqs9Et4Poa1SQ14eyWie496530+6A4qvok0b
         Adm15oOfs4jMrNYYqdxPqNFzbs9JJQc9/p4BSBx1DDmDrP90IXfv7prr7irqFcLWK9tc
         9IzD7XLHNxMyoPbX7Slaiy1UbmEYKJxC5Jpauycz3GGu/K+g6RcVHH7pJfpwXBPwAFMh
         uOJg==
X-Forwarded-Encrypted: i=1; AJvYcCUPrKaTs0InBhNeZu+jaqhkMzJMyH5B4B7k8kwG4/v0h5O7WL8zEhOwW4WSina878SiEejq9ywu1FT/@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2Gnqu34g7GE2AULGwAz6p9Nnhj7mCdYC70tkuWdi0tBdlGYlS
	OLp5wq8KUIUUW9hzlt0LrkhwMQYg0v76bSpo5armUq8Didqrsz8inuzM7rvWYnBAoZqGvjKmH3T
	/EWDa/a8hKoxzTc2QnyYBiweJyBDxSOlGtBIEEr1BPDP4z7JRRTAE4aoNjAg2fCvd
X-Gm-Gg: ATEYQzzWV4DmaSvsIog4Z7W38S08WzwiOfFrxshyTueQW16ubnjqd5xtleSowrvdpCT
	3WjKeB+7ciWyeb0m1SPZGEl/RSKssw94einooey/xtRyH+y9w3M+WjMSKT7iX98mI1h8+oui5U3
	FN2/Jarea58O/ZLHsFMd/0+HTkDTQT7e1elkVz5PiJYytsip038sd4mNw22KgTZDCZKZLEUgY7D
	x+WCzv87pI6ix3iPNb/kuD9UZcuyBg15ztd4ksmV30qxVnCYyfpQmwo4QI1uSz5yoBRdqFomnkG
	LmTUrGAasIFNXFfZuTbuAkl7uQK513IOdVOJEmWfi/RLJI+Nnmc3b1uxAYdZyKXdl0iWXHSd79s
	RTQ07UAQxxxo/F21YQwzrlVFY2+5IU1nJV+o4HenDGWMqyUUWT0xwerPRkbPyEdb/FoaTOceHQm
	1D8YhofuLZV0NdZqb6jjNx2SK1y2ue04M8g1I=
X-Received: by 2002:a05:622a:4:b0:50b:52ee:62b6 with SMTP id d75a77b69052e-50b52ee68f1mr46214011cf.38.1774201889676;
        Sun, 22 Mar 2026 10:51:29 -0700 (PDT)
X-Received: by 2002:a05:622a:4:b0:50b:52ee:62b6 with SMTP id d75a77b69052e-50b52ee68f1mr46213711cf.38.1774201889233;
        Sun, 22 Mar 2026 10:51:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a28530660asm1891911e87.71.2026.03.22.10.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 10:51:28 -0700 (PDT)
Date: Sun, 22 Mar 2026 19:51:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: eliza: Add CX power domain to GCC
Message-ID: <hacarw76ftbkirg2ko4t4idpcyqouekodiqb7o2jf2ciscwfi7@egg33tcpahzp>
References: <20260322-eliza-base-dt-fixes-v1-0-c633a6064a24@oss.qualcomm.com>
 <20260322-eliza-base-dt-fixes-v1-2-c633a6064a24@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260322-eliza-base-dt-fixes-v1-2-c633a6064a24@oss.qualcomm.com>
X-Proofpoint-GUID: _e9gxF95AyQIkdBNNWPGVk22qoZWpao-
X-Proofpoint-ORIG-GUID: _e9gxF95AyQIkdBNNWPGVk22qoZWpao-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIyMDE1NiBTYWx0ZWRfX7Gg5LIihkGV6
 +yM4lyALPC2ONzWBwHz82GdT659o6t1dsM1ZO/7ZX5MIHjNTfIoJmcp8SxsVLP/WBhIFIRzZp8C
 HSPEdUV7zq9DUjkDvMNfnyFaGYRnLtE6XkQ1Zjsu7d++0Eq6D6CD+bktSpkjZXYte7BugXy+4Bz
 sMsDQsRiRDn2bmTzu45sxyeNT0NAoKiGfxcZL7QkWiMGHNloSoswSpq/W9HvvaYPpayGIXdiU1J
 RMWoisVwNnkxAnRXfeEM3UGznE7LFGMkWfjIgLwLQL37iK+RXsmIDq9L0GwJTp35KiSHqgFUfWf
 9kE7m3yZDIt1g35GW5KVxF484jHFw07g53j6rLIMwbSX73N8GWnNDHnNN4ON8CTilqGNa7wRqx9
 LxK6Rgt6s48gMqibgr0v+wEk1tjaiZMrg/BWv7kjub9B/EQF4y5aCqQ2KOxoEezlRoVt+jVuQih
 Potviu3YKrA8qU+b7sA==
X-Authority-Analysis: v=2.4 cv=dYiNHHXe c=1 sm=1 tr=0 ts=69c02c22 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=ac7HRrgMY6L2oGsqopwA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-22_05,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603220156

On Sun, Mar 22, 2026 at 06:08:20PM +0200, Abel Vesa wrote:
> Recent discussions off-list highlighted that the GCC should vote for the
> RPMh CX power domain on Qualcomm platforms. Without this, RPMh may not
> aggregate the correct load for the CX rail, potentially leading to voltage
> drops and system instability.

Should we add it on other platforms too?

> 
> Add the missing power-domains property to associate GCC with RPMHPD_CX.
> 
> Fixes: db7fe6963466 ("arm64: dts: qcom: Introduce Eliza Soc base dtsi")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/eliza.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 

-- 
With best wishes
Dmitry
