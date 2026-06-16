Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46EBE4502F
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781568848; cv=none; b=sZXmpBYRCD/3SeLGVbMNzkm4tJZARMg5qCdLD4YpMGrogCg1sngWlcIKP7otJUWFiGv0mnR59HmEUkAl33kJA9C4WaXWBu9CtZVLAwrRRw42620sdScibyV9S8MeBuqjTz9M0YsHjJGlehEsw16I15Fg361PNmllI4NXX3wJKHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781568848; c=relaxed/simple;
	bh=vA6njvVKQvO+PcQKnWXSk6pTFUZorGi+TZMz/G7i7HM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kwv+Bdxaso2t8f47JalWOuRugnuyHEo9rhhsiTb9QwSOxbIl8+cfjUgEWztAPEvBV1bR2ZVR0783nv8haT/ddB+mhysFqv2T9HteFdS2C07TmMwqTSEqOhtXe8ea0pdtgZBliAaNKOWM/qASKl7+TOOekEc+R1W2dW5jqhd9hDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WD9Ce+BY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a13Nei5w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WD9Ce+BY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a13Nei5w"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FIx0Af881775
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:14:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JnNJHOTIwX4iYYMJUJ/SuFbW
	861fmpZl9xL5fkvctBY=; b=WD9Ce+BYkCAJ1V6rq1IVBUNTHSUsvZAoBFWNeu84
	vAcRKYkNKHyiwlZHNZK2hyMui1eQ/ObWmbd3sLKKJLvxjKbVHzt8H798eOUDszLy
	n0S1GF7KgfGpj0SHuC7LZMXtRZnfhQW/0aY6sM4SKydAyPCcJYGKa0NYBqoBRXFQ
	AmuNWEUWrPuietMbjTTVVK+IDqY1tDr+8Q6+Kpfnh1xLtWV63boSEnfBun1poGU2
	pGQ5pSjjORUV1UPAIXg8MoS1VpA+08/Dqv1DXEczQaSwwsgx3Mi62sJkpm3cxQjZ
	oDRxE1i2MWx7GV0P0A76imbxa0IGawnuRIyTBPFs6PtO2A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etew0krcr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:14:06 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-915b9dd020cso1011632085a.3
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 17:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781568845; x=1782173645; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JnNJHOTIwX4iYYMJUJ/SuFbW861fmpZl9xL5fkvctBY=;
        b=a13Nei5wQuDdaIJ8X2y6mOHUL9fgJwION3JQ8ug1VxEBbUGLX9oU7ODQjl33pQjXcx
         sYbkWTWgUcI67ZpOYfMmACCK54Lu9XZ+Rqa+4Fsxy8DuMfUPyEideOlwK+LIQHQ0QHnE
         oepq2nzJqev09Wl3cgNhXF4SeKKXiGVcU3mUcuuZXYoapJXTECYeV9Stt/7TpqZyPLNg
         m7oNcbxx/+NfEpHJ/T49wtX9xFUSrpKZKUryBoo1VeffcDiro2Q9cexLIncg3FqkPAUy
         ZLUjaK4WOi+K91SzNATV5pYLq0BpyC4l5LlEW9a1laVinANC5PlENnf+OSmrhcfCrTSL
         7M5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781568845; x=1782173645;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JnNJHOTIwX4iYYMJUJ/SuFbW861fmpZl9xL5fkvctBY=;
        b=h5lJboXQCjEsi0sGGJpJTmtyzcJ6B/IZEPSbkujSMOvctV2zmuffYypP1Z4cBU9zD6
         ER6MnPsNZeyFtze/RIrMwA6dwI0zOCKq2XgTAkj9guJK8QjsHMaZaB312Mo4k9eGkocb
         OvrG8VGUXb+z8JxeFCyjhMD919lH+mj66JH/57BVnMOUKNtvLHBT0U2tVHzV6kevZF1w
         aDdwFOlY0T2aqgQK3opD6WJ21ljUN42cCp/NXvwDkylIItpdF/dgw7fkOOS6A2eIEfot
         IOC8aLjbMlLsfiipRE1dd1O5uU4uQziTSUh6+0p6gOILkE1ISqPTH+w0gYXSZggSL5tT
         qzuw==
X-Forwarded-Encrypted: i=1; AFNElJ8u6cwTTnP8QDZSxyjn0Jor8CdA7ohaW4l5sUgFpOTeBAC++E4CvwDryx71HycLjN66Ev3lepC4fKFZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyUJ8imuOw8K/FAIlwQUQXmA6Tfss/x5g2ZT9u+ahdo9b5DJIly
	+bMm+49V6vo6prETLkjmMvNv9qCVxvyB+Wk/Xx0k/9YZTkp1VJsom9V7+h8qesSXh+d4gvscmTd
	RbukpNNCiGTG7JXkYU0OaYl4m1XOjmBDn7A+/Al0mB93/3f4qszS+Edmg+aGB9dym
X-Gm-Gg: Acq92OGTBoFbniM7hyS8eATUp0jPtJHNlMfT0tWroWT6WcmwL6R9VeghdcVd2aXLENE
	RQagafhGnY297ALZ94z9DIhXpVDvr5j21cl1Dd25DPhpWHJaorktQI763qkbORsn78+aw0DUQAc
	kZ7qCiwNVcSBAMXN/Jtuque/MYtZEIEicLe3ICuMaJ8CEQdaFqFeCYgvH40Y0rTil4P0nQjGG6T
	uns3nTIEXmDPjjSawgXH2pKUV1YIgdYvLRs82aK+FjoLlKlyvzXURsNINan++eMwlrvVmUAaMFS
	iLk/ln/xLOm1S3dvtyrkpO/BrVTpMaD6jXE5Re+ejG3xZcyLzx366gHvMze2Bbn0irYWQB/v/8i
	n0odAwTS6iMBNsV82OvXFMfIsXRrJLFZdAJK6bBqSd/G2tf0ayfbQgAg/0V4gsSzya0UegzApfG
	84jKVwcy3uRZnuS8ya1kmzz2Jrw+JI6P8Yi78=
X-Received: by 2002:a05:620a:4056:b0:915:db15:a24c with SMTP id af79cd13be357-917f15716admr1886330185a.37.1781568845484;
        Mon, 15 Jun 2026 17:14:05 -0700 (PDT)
X-Received: by 2002:a05:620a:4056:b0:915:db15:a24c with SMTP id af79cd13be357-917f15716admr1886324085a.37.1781568845010;
        Mon, 15 Jun 2026 17:14:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1715d4sm3038584e87.34.2026.06.15.17.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:14:02 -0700 (PDT)
Date: Tue, 16 Jun 2026 03:14:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 1/4] arm64: dts: qcom: sc8180x-primus: Rename regulator
 nodes
Message-ID: <tgv2ebvv2fzs5q3fcyc74t6ctppx7ktu6krrgkjie6fa4tscky@ttbskwbesqum>
References: <20260615-topic-8180_disp_power-v1-0-18d36b548c48@oss.qualcomm.com>
 <20260615-topic-8180_disp_power-v1-1-18d36b548c48@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615-topic-8180_disp_power-v1-1-18d36b548c48@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDAwMCBTYWx0ZWRfX7RIbDXeNQc5e
 wFz8PhRec4zrjOQo+RbF1SZmTPC5bARzIuddxTMUnviXVurv8me45U19vejqNAqYDtBl9G7ujLN
 ZZr51qR2gCm49p/IHy9dvoPS9AVEoYQ=
X-Authority-Analysis: v=2.4 cv=QLlYgALL c=1 sm=1 tr=0 ts=6a30954e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=JkdAgLO8MhltecbaccIA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDAwMCBTYWx0ZWRfX3FKlvIoZ/5Mz
 qunb/Ezx2Jew3RK0WdQqlsTldpx3s1iae27lLoLmdA1AIlmi3t+58VA/tHQaVLJJDfmnZmh8uja
 R2WAFuOncA5HqDahpmecgVqviSYyldJ9nuaKs8vTc/gHAnwdKwW8NtPoN6fd1w56kNJ7xyIAZXL
 XUsYTlMzsIbpYSbykXjMSBLazQmATKcXjHrpQm1L1fJOIf0bUC0WQrkOeYA68VDXoxlT+3CHVNk
 NjBs9c4W1IO9wqEbumo0iDUKcdOoiMVPS2nsV3hmWIpoEGeYn5xiOtvZQe/nFBK3I4p3M70o3Zd
 mLYpbinP6AkOTMuPcP811IBryb9FIRCY12I3Oi5btbaJHzv94CFEVzJlG6MgUegE6+Cm62GPA3e
 nyViuAZFvrCRERyNUrqWsR2kxOPS9l0QPZzXiQASCE5mosvkjU7YZQL1GwBndcgZjUB/ed34gjD
 oMHGqmoxLqtwXKvrcMw==
X-Proofpoint-GUID: mlydZFp7yQZeynLb-kL3VEwGlM4fUikl
X-Proofpoint-ORIG-GUID: mlydZFp7yQZeynLb-kL3VEwGlM4fUikl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160000

On Mon, Jun 15, 2026 at 04:22:04PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The nodes would be sorted correctly, if their names started with
> "regulator-" (which is the style used in the latest submissions).
> Touch that up.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sc8180x-primus.dts | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
