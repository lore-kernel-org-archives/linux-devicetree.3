Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795151418;
	b=B7pCMZB+oU8k7jwBRBzjt1WBSzHjZ+2PdOZvy4ovoFW9YqSOiuzmBnYpEz6ytLPZUva3
	 S7uqBromO5fUa5lfKVm8jjhHVbxlOloHUSRO/6zZocUvZXC+S9NoeyIxk28E5yWNL3xTs
	 pc32W24kh8y/uVry6LNX5pK/SwEUpMeSaj1MVyBadTt4wTfI2seCbto2IeRCHQhS/RPsb
	 8IfF9opH/fcZL3URYN0+AaqPyO9lnVzvy+fyUZSHnK0NU4YuR6oNheutuTWI7CmD8J9ne
	 0EvHtsikaHTRf3uyvRUHF8TgfcEowzf+alq0qMNPrSZEKASbeA4tHKUKg5fKgqEYzvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795151418;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=7Zk2KIRwTz1BoEqg6euwnZZFOAKnOCtValMdoxSVAys=;
	b=QS8k1oJ3Stk5ZNaDm/n4h/0zB+uI7/32kqeYtBrdsNk9BJBJwCyewKHA2/JwcWcaVKlC
	 vIJTKjbH+DIMoT1IA3ql1w7Y9VZ1K9B/zRN6jl2IX7rfcP59O0vIFA6GkFyFEmU4M9SH8
	 3zHoHEv6vp+eLaDM2ePbnBd1xCjUo2sQ1a4LB61Qy8BCqFbpNQG3A9xeCFt3IQusHqy+j
	 IvP6ljHvB4oEbKUpEagvL+sI/DYM3ZwBNFldcg1kCDBT43bQnSGlSCIyrrkILtTEE3k0l
	 qu/i5cXLdVutPHnBkWiYoaSP0vqhGEHkxU3D6P3/4ALe7QVcqwSMyfxLGRG9UfJJUJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KF5uHerQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IGAsbe0m;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CAB606A320
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 05:10:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82CAB606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KF5uHerQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IGAsbe0m
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK3V4Xf204659
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 05:10:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7Zk2KIRwTz1BoEqg6euwnZZFOAKnOCtValMdoxSVAys=; b=KF5uHerQnQnfOptU
	9I+G9iMAvwaZgtQNcgAClizK3HMPx5kdyZMb0W0ZlnlnL+i0P9UfHW+Q7QKtRIlW
	FMT2sf2KBNE1QSNeNcCOoHcEvn0+Lsjnxbi7tJbvWdY8TEgTevbebdcDniwOv6kr
	ssC57EYJa+eyQZvaUr29xtIx14/uVkZWkO3YqQpfalYDV8f029uh3h63yaTb+9XQ
	b8YX8mp8J0OZnhtPepGy8i1qILB+WNpynJ+ruinAyEfs+kn6cSxBmAOvQTIEWZQk
	Oh8E+9JTrHaTa4P+sHkHyUqyXlU1GzCTlFyAstWc3V6QjjqHmPhhGa18u0Qof9nk
	LSVUDw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27b5sxts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 05:10:16 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a01e2962a1so537348b3a.2
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 21:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795151415; x=1795756215; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7Zk2KIRwTz1BoEqg6euwnZZFOAKnOCtValMdoxSVAys=;
        b=IGAsbe0mklBeevLAE3PUPB71V/w5I7vVL2VVmj+UxOSP5FU3HM4EYY3JDgm7gC+6Jp
         1MFNY00MJiF+NozdeOvBkhyrN1S185tyI1rMj5tmWl8Sxgxk7CZ4P2ADAW7deJH93TQ1
         HxiBwSkeumd2A8WEY3uFGjquKdOKmxqMcc0HlPApzMm7nx0IoWT9KYe/tk0xmLgpbLDL
         4TomU5EMzYh1fUAeSK5AYu24qMoveMguLGUWAoWeiv3U/YZOMiZqqAVzHoXgYtIbZwIP
         pUzJly/P0dOxzWSWdtJbP0Ql6w9QQBdPrJT8t+z3wsokWdx5rYrQrUm66B7eWFnO+uLQ
         l6Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795151415; x=1795756215;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7Zk2KIRwTz1BoEqg6euwnZZFOAKnOCtValMdoxSVAys=;
        b=2bHsn+szGe0+ikqsAzl0nZBahqIuGYL/df3xlYHVjFZpQyKEpdzr4CRgF5ax5xpLt1
         v55HNXi5JeiJWz5s1uIgjhGPn8Ui1mslvl7TVvV6WNhUKNFEhBNhXc1VlA7QhjzwdTSF
         Z7O2QZAtveuIdWTFaYgwID+2DVK4KY481Rv5iANgsRYD0WY89tgcpCPrgRfgzZI9qQ7H
         LSJbYUZuq3ZQ+t+MojafpOs3XbX3KjM712F853lZoUUplF3Z50L+KZY/CxCJWh3U2gkN
         GNFqrqQ+33ewaZZnrjUdspb4+mwQqtR8sSUbCuKu6yR2DTopE8/n702iFUras1d7LYuD
         7Y1g==
X-Gm-Message-State: APuU4Z9v1Hu5Ktd7X2C+6cgUF8BP2XY/icpnOBhb0OrtMUXJisOEkyFU
	gtsfgDaUNQ0BWtt3jI0Z7CMNBk13Oibj9TI65LT0+9OUFRpsJY7KqC442GjD18dR9ukAWPbRtgJ
	sV8IjJvoyMg14/8LDGAmHEcinZBr017WvqHhw6SlKUXQewRWtQKTlbApw21iRvfCZ5uMAYIf6
X-Gm-Gg: AYBFou2nZqJT8+z1SEJk51pNqA7kPxqgDeD1v/B7hNAuxEiYsoA6XgTHCFjlj3+Kl9W
	ve0ZQwDbGuPEDvA36ttq4nh0jER6xiO3Q+r/TRKrhqWBhqIWqXTPPz96WX28J4GCGTV7ePoIwdQ
	WkoMAu/gWs/HDZRuODSPPAi3UY7uRJPxnohuQB+qq0inbPe3HnIHoMQSHDweB4IJRtL/ZT7LYhh
	XhFjnw2LcpDXmPR89VznY0scgp881trmj6OH02fWRSE69W6OY9vATAuo1VubWz2BChMWdBc2du4
	34gVDcGZ8sNPC7yHlNyv2OHQ6DcdyhWi+ddlkyKQncS4Mu/McUIa4TJ9PJzBGVdBIJdYr+PNIY7
	A8bPltgSs0VhCQEst4k/yexBm1kAVriBZz3cYuoJ4ko6Fcoudbusy+fYESo5XOV7Prdms6Q8NcD
	2d5g==
X-Received: by 2002:a05:6a00:3c88:b0:8c7:c13f:9ad8 with SMTP id d2e1a72fcca58-8c87c85ef62mr1552239b3a.30.1795151415161;
        Thu, 19 Nov 2026 21:10:15 -0800 (PST)
X-Received: by 2002:a05:6a00:3c88:b0:8c7:c13f:9ad8 with SMTP id d2e1a72fcca58-8c87c85ef62mr1552223b3a.30.1795151414675;
        Thu, 19 Nov 2026 21:10:14 -0800 (PST)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e45e32sm863722b3a.24.2026.11.19.21.10.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 21:10:14 -0800 (PST)
Message-ID: <5083f607-afb9-4eb0-95d1-38cbf51ba5da@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 10:40:11 +0530
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] media: qcom: camss: Add Glymur-specific resources
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org,
        media-ci@linuxtv.org
References: <20261119-glymur_camss-v3-0-71ab966c41c9@oss.qualcomm.com>
 <20261119-glymur_camss-v3-2-71ab966c41c9@oss.qualcomm.com>
 <sashiko-outbox-223366@kernel.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-223366@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAyMCBTYWx0ZWRfX7Z6VUb9fqnbl
 ysUXfe6G+eCh1cNRgF///d8Gq66cuVzjMNTuN+GrIzEKRB2TnN7GLmyK7vg2VPceT+CWBJ3+v/D
 8o37WqMDtasTMLqNKjNV36lVX9lKxbc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAyMCBTYWx0ZWRfX2vI6vDvde6Nb
 OCw3pP1xWhmTglIxb4/rWLWkNhvvL8hzhxebqMtdpTE5c+3z0mC3eO1dYNEEirhdjxQoafM673+
 4MXXf3OZIDun1yFMGt41B8AENWI0ccsZF551mhDx7uadBsgWQav1GxybUPDyT/SeBRwxjMkulFQ
 +HfCzX/3SYxRfc9G9x93yrQH/Rb5HHiR3jsFOmfPJSKflq4iK5fhhYqavsyXWLOrhd2SPS6lSVt
 4dH02pZ9LQf45niSWA+FT1FBUTGvCFpQejmyR7/g6M2zAXSnfUr0aG8+o8mHWLLure/XsZklbGf
 b+T72G0WQepzP9rpnUkHUivY7RtZ95nAiFw9MZOh9XTplpvVnZ+yt6TVrOa2VscOZ5LoqAop1UZ
 3s8YVMng0BgQW+wgh5YaBj7xD5wio6hHq038h4HzKQZqXq7gjqgRsS3syGp+IC/cfP3WPGFe1OS
 16n38SrN0eTDVcgJ98g==
X-Proofpoint-GUID: D1qQzRyWG-_VjrM02MlDpEoYn74Y1aoV
X-Proofpoint-ORIG-GUID: D1qQzRyWG-_VjrM02MlDpEoYn74Y1aoV
X-Authority-Analysis: v=2.4 cv=LPTz05W9 c=1 sm=1 tr=0 ts=6affd638 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=R7ERM7q0SgTlKnAdGugA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_02,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200020



On 19-11-2026 20:50, sashiko-bot@kernel.org wrote:
> Can probing qcom,glymur-camss trigger a NULL pointer dereference in
> msm_csiphy_subdev_init_legacy() when no CSI2 PHY remote-endpoint is
> connected in Device Tree?
> 
No, Glymur follows CSIPHY standalone path. So, It won't cause this issue.

> csiphy_res_glymur leaves .csiphy.hw_ops NULL.  In camss_init_subdevices(),
> camss_detect_legacy_phy() defaults camss->legacy_phy to true and only sets
> it to false if it finds an endpoint with a remote port parent named "phy":
> 
> drivers/media/platform/qcom/camss/camss.c:camss_detect_legacy_phy() {
> 	camss->legacy_phy = true;
> 
> 	/* Find first remote-endpoint and determine if its a PHY */
> 	for_each_endpoint_of_node(camss->dev->of_node, ep) {
> 		remote = of_graph_get_remote_port_parent(ep);
> 		if (!remote)
> 			continue;
> 
> 		camss->legacy_phy = !of_node_name_eq(remote, "phy");
> 		of_node_put(remote);
> 		of_node_put(ep);
> 		break;
> 	}
> }
> 
> Because endpoints under ports are optional (for example when using only
> the internal TPGs or before board endpoints are wired up),
> camss->legacy_phy remains true when none are present.
> camss_init_subdevices() then calls msm_csiphy_subdev_init_legacy(), which
> unconditionally calls csiphy->res->hw_ops->init(csiphy).

-- 
Regards,
Nihal Kumar Gupta

