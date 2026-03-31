Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7420B2FF675
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 00:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774918062; cv=none; b=JKfLMlcWFIGhnK0F+ih9P01unBY+F2QhclyD3yJ08SuOxudVRyPpnrsehwhpExdVAK//4243GsMne/6nBUbr7E1v8pbEkTfTpDBJHC7KgYtJiO8j6aAMpPMMoWYlgNuO7RGyz7GS7a3NjIDwjpDxsXpGK9G3LmaVRR0cjx4Mg1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774918062; c=relaxed/simple;
	bh=UkRdJUdZpZZHT4v9BpxTkD73SSfqTtiXvqdqJgtaJlE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u1XoIyHhm7/UTrhitVIPaQCIBfvIAPa5Vf3sqVB6AE3zg21R979zzvI6sWY6C8MMa71gf3UBOZox4izQTrh6RA9C35eb8ec5Er5CAJPMFQU4WJmM0VGigV5UjK0aARAPDpvLkpEV4OhqC7JRB5tqvcMNGyiw1pomXhj1Y76qNJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tplk1dNF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FoKmcM8v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tplk1dNF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FoKmcM8v"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UM6m5g3539619
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 00:47:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0ks5/MECiU+6M8bwHy2sQ/Az
	zteX/sEkGMHcLgyfLDw=; b=Tplk1dNF1X+HKHFLmV7EUninlPstXsnxOpF6LC2H
	XxNbSUAD478CTzLS5wmU/Y7+/FRKRneuACXgqb4wGYEA4XbDHyEAu4IYQ/Px9Pv/
	UABgHZNBfYxWNm3LYYYJf1PpyLIIgeU+T/IsKT+B/fM8QgvjO+P8yJ1SGWBsF18/
	EIzCJMllYxhzsovUuHFNQ/aVXTWkQAPHhlJT4Z0xO++FaRsLEFcAp/YthaBKzOYZ
	arotXznbVbZLVKQAkYPdlDYVUOFosANeDM4dRm0QX1ZowzCk894rXaVoPNupfTNk
	VVD6H05kLwHXu911I61/ElF2QGBaPrUoY7wQ/TB1Txllbg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7q59u378-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 00:47:40 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50937cf66b5so265326081cf.3
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 17:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774918059; x=1775522859; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0ks5/MECiU+6M8bwHy2sQ/AzzteX/sEkGMHcLgyfLDw=;
        b=FoKmcM8v3GOsSdqNbiUYhm3NOvqpVp2OnRdNK1tMu3MMg7ujma3IhoElSkyE8pewB+
         qfufnhg5YXNhEGHLU3EWvxX3Lk6aRdf9JhFn5udh2F+LCUQpcx0kKLz/SaJhiJ8uYFFW
         zHQJrJbfFRl7bI/POdFhwn4UR42xZfrjO7vgF7hFpKinsHKLfvkgH5H6A+xBD9HSr+U1
         AEF9BTM4BK8nhl+ZGCkdSb/V5/C1OzvZ/I35UhFt48HFfsiM1W86CaMmawv6mLi+BOeA
         WS1Y5ywGMcY4P+1fz8JlFkwj7geuNA3ZR+BfFWAKLZbc3KLAvyJAxsTkmC07fHxWxWfe
         bAqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774918059; x=1775522859;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ks5/MECiU+6M8bwHy2sQ/AzzteX/sEkGMHcLgyfLDw=;
        b=dQ21Mx7p7HpnDpsuXokzwH322bk9M1NlDCilEmdn6BCC6xsrLG3R2782DPf9UUy2cr
         gu5Lrp+8zoWrrAuV6i4/k3B5yqvfoB6KFkYJ4UAfce7ckas4ULjWdDCqVw5Rp0bHOpRl
         Z3AyIbYr+9Vjma4wBXTqEq0Q9PboQ+idlEgsMlkljTyjQzHeb+XD9XNjmUSPNWBQPT5O
         YG0sQIv8WwDJlE7R3W3O8AxNmhVa0kB3UXAhdXUiP/DrpkoqAOPgSvYLbYCtINr7+9Nr
         9eUDMvo69jb6fbOELlNVhEqopjs+Y3yc/EM7CVWClHw9UMhWW9qKTMwNl8HoFQsLxhSX
         3AMg==
X-Forwarded-Encrypted: i=1; AJvYcCUTNeZRPjHjybfl4236B1yMT0ubxd2QmRMc2LP6qZpfw1IUH68BxUVM5HAdhLSdF6B0UWIhHLHFS9ul@vger.kernel.org
X-Gm-Message-State: AOJu0YxgUMNF20dFHDchkgwt/zd3mkPYzkm5zrV6qSNsnMeKhDVzLdCw
	E/kaHSvbhgIS4vrVec/PwJL+TUa8trbhES1Dcx/uRFyR8ZeSVVhvG8ABJFKkfpQSAchx/v1FepN
	fyG/Ydsa/WBCGSij2YF554c/3AgtB9WWLj5ZH/SbOySosCYgTCdQUMEuvk27OEaqZW1zz2o0P
X-Gm-Gg: ATEYQzzWu4vhXCrxkfd5yDEQxmOr7x8q7lXEVvQ+IgAB9K3/6cBfPwmebzfZNL4LjVM
	IbwWfYf3Emrf7PCdCg0CWoa6aQXJtWk31b9sSJ7tF+IT7Bhq9vfUp6gijGHIERlHlJgWsum9XSw
	423GDh0+GIOvzgH1oXqI6PX8QB5jbxR6ygLpDiAp8Lj7YStIq5jfMo9gyNe5Qbw7mdn8jsrgUSu
	KHOLu5e7ht21cYvudj6CjW97BRRk2s7R+gDG/lZ85N9xiuBCIG7LOEM3t/WYBZUkHclbOQkgWJW
	SbfOqmWuZAWHidxl2yWCahgg1QchMgDb+LaLXpKaCCDfBDvxT0fB2s3KucQTIB0JJKiPkZE1P3f
	ZGBoWSALJC+2DZeLUv0ajFGsmdM+OnuwfK8CDq7pbpb9VWN7riNs6G3aAjF2duNYd6wwD5Lyfwj
	Y1PrG4M7aRLLuQdZgM4jgmIWgPFoWDJImfUGs=
X-Received: by 2002:ac8:5f13:0:b0:509:3940:30ea with SMTP id d75a77b69052e-50ba391e97dmr194703521cf.55.1774918059515;
        Mon, 30 Mar 2026 17:47:39 -0700 (PDT)
X-Received: by 2002:ac8:5f13:0:b0:509:3940:30ea with SMTP id d75a77b69052e-50ba391e97dmr194702741cf.55.1774918057633;
        Mon, 30 Mar 2026 17:47:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2bc25ad35sm157626e87.20.2026.03.30.17.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 17:47:35 -0700 (PDT)
Date: Tue, 31 Mar 2026 03:47:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] interconnect: qcom: add Hawi interconnect provider
 driver
Message-ID: <3jsmcfrpmjapron5jc65ueiz4jwunfss5r2saarsfzebex3bf2@mase353jnpgw>
References: <20260330-icc-hawi-v1-0-4b54a9e7d38c@oss.qualcomm.com>
 <20260330-icc-hawi-v1-2-4b54a9e7d38c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330-icc-hawi-v1-2-4b54a9e7d38c@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 6STAjxU_EVLWTdMiHhZqui_Pf2Vvz4Sr
X-Proofpoint-GUID: 6STAjxU_EVLWTdMiHhZqui_Pf2Vvz4Sr
X-Authority-Analysis: v=2.4 cv=EcXFgfmC c=1 sm=1 tr=0 ts=69cb19ac cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=X2bA-DTC1ecWuKQBpGMA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDAwMyBTYWx0ZWRfX/rF3Ehoum2uF
 Cycs0kNOAi9iqjKc1wyYpdiP5Bz+eN3jZ0pS3fJ7Pdz7MXF6LNKsHhPgez+Bce7UWdcITrDLR/Y
 hh2L4kYoH/qNvB7tZ0++udqJK4z2MsLI0YNmtKKsDuDpAc3Gn1540lbcFhkVZOPQaSg1UawSsRy
 k/zUQ/nWL/py5zSu6MkZ9rm6hi+gmxoFs6KdzWwW+F0OOGrrzvN+AysDYXQgx87ep/PCrtrd34s
 wBMykY+bflQaSCNyuExd+eHaEdd+TeiPPYP1JxTYQMdu1gvFEi1EL/JpYRIExZeFFQIBFEePdQ2
 yygTb1N72njzzfAUV4jMDIbKKxYfq8tLUJb8B3RiKQh9Fk8Mjo+g41JLwU/O0PaH7OIkeTEbRKq
 7mbrRWBaLQL0/63b935bNwoFa47/e45KPsvzj6DYvTBs5vMqyDe3Udf10V8dk+e/ZkBGFokW5Z3
 m/TcHR4HZqi7A6+0FJQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310003

On Mon, Mar 30, 2026 at 05:40:01PM -0700, Vivek Aknurwar wrote:
> Add driver for the Qualcomm interconnect buses found in Hawi
> based platforms. The topology consists of several NoCs that are
> controlled by a remote processor that collects the aggregated
> bandwidth for each master-slave pairs.
> 
> Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> ---
>  drivers/interconnect/qcom/Kconfig  |    9 +
>  drivers/interconnect/qcom/Makefile |    2 +
>  drivers/interconnect/qcom/hawi.c   | 2021 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 2032 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
