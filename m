Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B94296BD2
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 13:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783604045; cv=none; b=ZNVmkLe5thpvBQlQFS68vU3zl/OzvaziABT6uRC73ZXa1YJrsUygnUXfw9ZxoSOKSSEaCoR0SyXKhw2MXMyw6MG9XV+9nNsNWKJBRXg56/W9FqHofpDQ9NGAekH1v5isKyyFC7ZTgccEvTkh6Wrfzzh4+t+Gb8hJMLOZrJGPNwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783604045; c=relaxed/simple;
	bh=qbTuCRun0yTlo1Y60tPmYuf58Hlf6xKFKs68d+vsyko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V0E+Whfhi8luInbtttO5KTO0KWWKS3Qp4d2DkEZqc1B2k95Ynt/lJuiFOq/t5MBBlPBaKH54ieNb024KU4XldSB3j0zI1xqd20i/hMRTVsO1IQMuBmBDDaMAGqtfyAU+Nvbu2UCux0B1a7r1UYKBCE+Se7OZ7HUBOcqLs/MR/48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kmWajrZE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TOWKsvY0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kmWajrZE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TOWKsvY0"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNDRw1716200
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 13:34:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hmAfXmVSyr9czNHTh55PG1BO
	jt5uvYuY8fvRq7n/YEE=; b=kmWajrZE2rBXVRk1j6Eh/h6uTAwcYzbks2LYt/Ea
	GePoMRdQXhnWXCe1Ja0dyY0mT2sKGHWZYco4by32sm2kP5tx1l6aToFgQHYgBbL5
	2B1lInsqwLXiXP8N7T24q1l79apyJkCMyvF48Dmiiz8ER2wk2ixIh1d+QfJ5lvmi
	rNAgwWdSSwhEwzcdLdtwBUg2P84qlJyOqCx8w50Bb++W9PfftoOmp6RaQfM3FD77
	YlcVy76C85nYVdbWr+W3ghrqkXWgs2TIMFXFY5Q3R/6valbiYct4cI1NIx2IrRvo
	GS4dlrkHvCQV8reRazTfCBvxBPjRt/qyOIc1tJcUzRsxsw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9v4vv3fs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 13:34:03 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-738de163061so937492137.0
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 06:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783604042; x=1784208842; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hmAfXmVSyr9czNHTh55PG1BOjt5uvYuY8fvRq7n/YEE=;
        b=TOWKsvY0xyLldTbGc0/95miyCG0h5WlsQEZylmLor07CMO2OfEfTcOibRJIX8tQr7u
         hBICK7p9AtShjIRL87VZwV3IJbqxRebhbGig+ZCfB9CyKfEht5uChGAZYvIfWP+mjk9/
         LWLBNHglciqylovf4ScZ2AoICJyByEUUXKPv9yANteapugdqrmppx9rDByZ2BeZ+Do+n
         anb3vsQ+t1d3RIMeeeCj2G67VZPsRrtC9i3lvTEHDkaIVBjVSu8+2yNibMHRL02skk13
         wph0bumjMCi6k53t84E/O2FP/ls9EhIurNl7nJSsdw8Ee37nOQc+XAk8LWCaMM35J1vo
         ThmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783604042; x=1784208842;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hmAfXmVSyr9czNHTh55PG1BOjt5uvYuY8fvRq7n/YEE=;
        b=iJHdONKRLjU7CxJ3scuRkxvZyi0GvsfPss5vCvIHRVjWlfxZLqCYFoU7nkBLRYMxh9
         k3nxpJX5+4BdwXyxnQmGwjGoLaOqBOu8plLxJ+D91MgleQefkO2nfso6Fj3UXwrPzqzA
         avl+AyYp8MGHopkOoXIT1zK/5RnxpEX7416sCaO2HnEm1/S8eHlXRCgVYh6IeKH4zc7v
         WmU3mFsvXH6LMk26iwBrKX1Z9Uc+E3uj4UKMukRddI6go080NRgS4Ghomow/GC9a1j9g
         aL8mwbVVwd8gaC4opXJ7JO0Ami2bTpYZLx/hv8Y7wWY4vcGt+wIwqYItS4n7nQEZVUOL
         FafQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro97VvjnCyBeNHyqtcxe373u9eY/bm6tA3vRwtvLLY0apeIf5WqyuUR1Jq5BSrK/BF1xFkIrg+JItAf@vger.kernel.org
X-Gm-Message-State: AOJu0YyFCBRQFZY9WHDCmn8yv+sqR4s0Epw7TReJCvZnhdCPaYqcxzFn
	azl2EG+J5o+UHsEd0CC74rNyNXFqgB8ji+yCs9NMmbBUOjytFUPGgYMR5M4cqFWluDqk6LbRNg/
	x8XTK5hDY16rkyHmpBc8sjsQ/Z8Q920wAI0As6JC2TS2EJqnpRrlcB4cmr8W1hpv9
X-Gm-Gg: AfdE7ckTFesUSxTflyIZkTbuRHV5wYujvUdIPcf50kVOsm/+u69OWevpLeRf/N55oIb
	UffSYIkWR3bw2n3Z3hnwcOHnwlWwu1TkfDE+S1e/TWqz/Smm2mMHlzGqFVR7F1r4eqzraj6+6Hj
	hnS3HtM+DTAJ2Yl8U1pNdLgsnkZzwOD2ntoWoRiTZ5z8aQwDAJi7zEA06qdneKQfE+53Z1CGLen
	Uo3A61xK3b1n9czXyiXg6HDd77+SDff68lwNVBxulue4nrZn38iO7YRBgf5Bg49YyOPWAWgQxYV
	MeWcIob/7BWo7OqtvGOTV5nOl+tC/6sadGRw8Wrs5JKhT5orwVJ9KSxzTN+zLUUKV5XCD1FsEth
	AauFBBoH5bDO6wysmdNmrCgjdN7EWv0Zdd/ltP2+3qIxjDHf/4DgoHRL8riy95H0xc9AC2f0HXS
	ypi6MX35BkoXxwcsPcb61rtzDK
X-Received: by 2002:a05:6102:15c3:b0:737:4ebb:b474 with SMTP id ada2fe7eead31-744f6727d93mr1355555137.11.1783604041992;
        Thu, 09 Jul 2026 06:34:01 -0700 (PDT)
X-Received: by 2002:a05:6102:15c3:b0:737:4ebb:b474 with SMTP id ada2fe7eead31-744f6727d93mr1355529137.11.1783604041522;
        Thu, 09 Jul 2026 06:34:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c84ba1b9dsm3370601fa.35.2026.07.09.06.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:34:00 -0700 (PDT)
Date: Thu, 9 Jul 2026 16:33:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: kaanapali-qrd: Add SoCCP node
Message-ID: <dfpwm4qodjtrdyz7hblnn67mwds75qzuu3knrxuyfa52meh6hf@5rgdxzcamk3b>
References: <20260709-knp-soccp-dt-v2-0-6e2bfca96088@oss.qualcomm.com>
 <20260709-knp-soccp-dt-v2-2-6e2bfca96088@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709-knp-soccp-dt-v2-2-6e2bfca96088@oss.qualcomm.com>
X-Proofpoint-GUID: Luyxi-s6RFpUn9h6EdSDDEOef2hyeMfI
X-Proofpoint-ORIG-GUID: Luyxi-s6RFpUn9h6EdSDDEOef2hyeMfI
X-Authority-Analysis: v=2.4 cv=GIg41ONK c=1 sm=1 tr=0 ts=6a4fa34b cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=MlDfNhLudHztO9DQPjMA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEzMyBTYWx0ZWRfX3AeoauU5mUGG
 kvPrAFEZqnRAHvjOsuneE9P8dKXXqVbKj1y7xxqutV2NXQRQS2XYELp9OCwtKnMC1d+HUrUlwHs
 IIjOylJKgNPTzvqL2DG1WMjnKHhvdJjRfubt7+U+tbaR5d+/9H4hR4msg1VZvykx/rG//VqI4Vg
 v+zlf4YJuQeG+LAFOoToZ/1dJhUwaUx7ST0AULe85X2f0iaG4LDFJOlPRssXR8rrWsTo8e92OTU
 3K/6yU7ny9mANxUlOoa/y4pIwUCUCwEb1T/H9ozjfGeSNO3aqWfs7Br57DUWu16EEeIp7jT1MsN
 EVaThAAQ4NPZzdwp6xLoIX9rZcnBLhe/e3LHzAfDpWm2lyA8PyHHw2HPro3qmjEQK/qtgUIjuAG
 UOdVIAEtB1n1N68VUuSuXKNYOjGujZVh7b/DkDIFQvfOG8Yf9lERWTNdtyFRKVX6aXdogczd/pW
 ziLk5cfwOMMje1usq9A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEzMyBTYWx0ZWRfX9wF9LeMTWJhu
 ZUUJxl5guGTPeg3tJVLD6nG7H5fF/bmX5LxX/hkHzORKF7kd39MKaHz5lB3L2H+a1LCoHoQ5cZp
 bMO9cGupMtFvAoWrW+ElAfXHOe9YEt4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090133

On Thu, Jul 09, 2026 at 01:14:24AM -0700, Jingyi Wang wrote:
> Add SoCCP node on Kaanapali QRD board.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali-qrd.dts | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
