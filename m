Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793263021;
	b=0mIov+2Jh0gH4ydHJ0ScXgFvjdRx9PaviBwK9VNqIqjEIGnsNT07Ach/Ba5Xqfhb1mY8
	 ObhpNX1S4G4yrmh5rMCM5dVpViP8yQQ0y7+qFVifpuF8MLMxRZZ+fXV5d1M2BNQhFH1Pn
	 NCwiBYfiisURivGJxhoTIBj9kUrPEW+sTrQyqeTpzYGE5aDgqvOZp7gO1GxDx3CjouIwv
	 4LuXAUF8mChzhUi63wiKfEz9dZtiLfXw8luO7484gjywBBvyk0cVNdw97pam0GQIfTWJx
	 euPlavUSjJIv5DuqC5zLP0t9Saw7NqFfyqc7rZTHfvUEWrFudC7fs4jbFGawg6bkbEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793263021;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vujVPiEFr/2gWrI6pDf7goaXpBUcQ4bvbSz+Nt72RLM=;
	b=A9hfYTbllkd5g0RWzmk+oKmHj3Vp81j8dku7UAkN/QcskBxAknEbsy+F81mcIIbHpJue
	 lWo2g8qyUclluREL9wYipSFb58+UYVvhBCYdhrp+eLIKonZipF+ccZFsKC64vBL9nmJKB
	 8/O3ugi7e9RsUpW5S7FlkSsLFSnOi6IvEFsz5wt4xu1PNLLF4QzXgpEIQicbVUVH9uTuL
	 5OfsSy0CSzbCua3lf5xP7iNONDFFHlhB2f2U/ONVWLvQX6riT39povJ1W8rLSxjuehgG9
	 4GHfyt/ncXh0Nf/ETwa1J1BPGYG6B8EpYD4GXPgSczRi4KuT5znTCnsI7+2aGoMaFoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dqnKv148;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Pid5b/xg";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E15606A31E
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 08:36:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24E15606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dqnKv148;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pid5b/xg
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5GuRG2793104
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 08:36:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vujVPiEFr/2gWrI6pDf7goaX
	pBUcQ4bvbSz+Nt72RLM=; b=dqnKv148nup2qvAaDjk8osg/dUi/AcftsIbH7dTW
	aumvlI4Eghetc2/dgAsncGOrvJ3+i8/RJAj7a/exhj3Lyc80t0XBg0luZEORSLoM
	85CcGKlYQ2H7fFhOR89T3W/PprKH73NiQzDrgLPEKny6M8lof4tyLCpld76Mpgap
	qqgqH+anDuldtgvELfxk7cdr5lcz3K5uatabW+xMZGboyx7JG7NTQWEMH28mlELP
	u20nTDz1sKostSKQBoW45W4RaS3Q4maU7Kl4RaFkRQEGkQ2FPGDtMzsZej3OSyhk
	t5qOX0IO045wuMdnuFRIMYFEHBt5//5aos5Pgq/xCiABFg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hks3na3wr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 08:36:59 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-535131e4c25so48183631cf.3
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 01:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793263018; x=1793867818; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vujVPiEFr/2gWrI6pDf7goaXpBUcQ4bvbSz+Nt72RLM=;
        b=Pid5b/xgS46IKCInNIevRl9mfkLrxUaU9eH+1GmodeDW6JpOtjiSpGh/IOLSwnWNi3
         Zm3usjkc9RSNy/6Hm2PUtiJb781qwRDc/74PQ00qwbpt8fAX17GT0gzMlz9tS7H4GIjP
         /VGd5nxh1UTig2KBanmxohzd92N1W428lvaz6rAeyKikcQqCWgB0FgA90LdlT/xbPBGx
         l4rHQ75XeUDt/zlnhncQshdXz6WzW/MBju0NOELHP/vJjxklt+cTSu+If1zUyqGlVuFE
         wZ2Rt2i/AIGfrY4/4W6gMMt9YtxcmEXz6BoMSNo4SPOBpg2So/WYY9BEoqyHSC0eMsae
         96FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793263018; x=1793867818;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vujVPiEFr/2gWrI6pDf7goaXpBUcQ4bvbSz+Nt72RLM=;
        b=wBb0AJM0KqBilY1UdS04lmQ8/c0SfZpxtdKzUxvtWkxbh9FrIu//J/xjuS8SDhVdqj
         4yugeVVxknrCdUW7wgW/20+kl4c9NRqtFtqo4z+mRF5EFQq+OveOvhEQY/p5sqxCb8vF
         dWVE1iIYHWy3p2zwXc0UW/5qzW7EtApPQBP8BniNuY29SJoTs1AMCgmw92c84ls1PoDO
         MJcfzGxTYWK42cFyHARf6H2DJCpRDcABb3p4C3pF71snskS4i8cfTRe/ev8TX3q2zF8C
         4QAYWCGv355gxCjmiZjClJUQVHfmlLLtDs2BNVGrOELGG1uCLKfMbv7Naz86h36E6SCe
         P9Mg==
X-Forwarded-Encrypted: i=1; AKwUvBxZer9jMe7rMA4kBmgFKSWZD4EMb1VNQKNUY6VqoL2CyCVNkucWnjzHq76SXdK7ox5GE1s8MOji1Qf3@vger.kernel.org
X-Gm-Message-State: AFq9FYK3HgIM8h7hO2YHbdLrYI1+Jd5UP+G0KfKcjeN02uQ8sVlxxht1
	YoXSpgGHvzORVe0s5H88ugs2lvl4AMrssdz2Tq+7LuwsUMrJrAVYPVRoNo3V1uWh6dSTHUduUlc
	1AEaU6NXT2l7iKqTXhbqmveh0kezgNL9u9F7cehF2LKaZOeMkQcZCGDHTXuf1mC9a
X-Gm-Gg: AYBFou2f4cTX5x+QsV0MW6tdsUVb4ao6ZZa4RGP5XGOwkqzU2C5rdOKSJev4SwodPQ8
	c+MM5llrqIZm+Q5+jyPCt8+sjOtBWM0NjtP5PWmXXKrGMg49YDgqaqESoVBhkuhI4omNW9P8O2y
	vPEZOSzWtONkGfgf0M2BpMPzjlfqbBpXJSVQ4B72xwIR2t7xqQyAN9dA0yyWVV2S5yxJ4iWDG2v
	qxtrLxwAPQzaoat9mDnFrmQ5LQGTJNQO9NcMFC7jOutZJO1XIcl/IMTkEtxoYYRsHs42Zc7SCZo
	oGDXCbhjTf/9y3mmVpkQWbd3kQAl9yUNqE4GoNC+AXNzRuRPZcPKVd1s1WqkLZ+wZ2EBCaPePIw
	uDlOi34cLy3Jt24EnOW5NuAurdMMbWSsuKHO7BqIFIVCPrL2Sg1xzVkWVhrzKaEn/
X-Received: by 2002:a05:622a:40c:b0:536:7669:7eed with SMTP id d75a77b69052e-53fcb20d45fmr76937791cf.21.1793263018113;
        Thu, 29 Oct 2026 01:36:58 -0700 (PDT)
X-Received: by 2002:a05:622a:40c:b0:536:7669:7eed with SMTP id d75a77b69052e-53fcb20d45fmr76937721cf.21.1793263017581;
        Thu, 29 Oct 2026 01:36:57 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f36asm32868551f8f.1.2026.10.29.01.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 01:36:56 -0700 (PDT)
Date: Thu, 29 Oct 2026 10:36:55 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 1/3] arm64: dts: qcom: Unify Glymur/Mahua regulator
 handles
Message-ID: <227eu3obyadpuhtbvz6o6memq37rahvv4qw5gohff3gibo6lhd@fz53zt3kz7jw>
References: <20261028-topic-sip_cob-v1-0-80ab6704aca3@oss.qualcomm.com>
 <20261028-topic-sip_cob-v1-1-80ab6704aca3@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028-topic-sip_cob-v1-1-80ab6704aca3@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 1c4WfRaImrCdaCMDC4GKDYSafN8mDEe-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzMyBTYWx0ZWRfX+rs8PrF/alQ3
 5zkFdVMz7aftPBBmJD1zLYpoovuaKpL4ETQJ21TKhCnWhGv8HwImWEJizkMCQnkKGLhdALjbn/1
 yS2AyBolU6wvZopWA/X0+1NjvvB7GqXMya6h5zepZ3cAzGFIs8VKAnpds1zcNPku9KAlG/vzbP1
 mZAk/lg0h6qSMvsKRXESdvq6kf1z0kbDHGLyV/iSim/mji+DYeNSjUNbIl2vqYTkAZZYgwPvOnR
 lwU9RfEXnZ9lVE/SxMQWcAhaOa6DBc1bRL5/2quxzbzhs37f/tIo+mcYSnAnACffXmg3ZvVLgni
 ft5lQJfDj4aZcNsq2ZlRWywSTog5d9LAW3BKWQ0iSUXEbm6VRlnTq0idc6uwCcY3bH8D68WYQWN
 81DELhOGvZFDw21yQgfO6BMJYn7nI6McY8WG/27Pn+syiciepKAYkG88FnVaIu+MeuAEMRM6lAK
 aKgIpAR6JxS0gUFA7Kg==
X-Proofpoint-GUID: 1c4WfRaImrCdaCMDC4GKDYSafN8mDEe-
X-Authority-Analysis: v=2.4 cv=XZEcX455 c=1 sm=1 tr=0 ts=6ae305ab cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=E1C38_a1jRb_IkRbqHkA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzMyBTYWx0ZWRfX1C/rIZUzKpbt
 xRxKYrTRNJwZpNvagG+5Qb/b8Xk74ZWJifbqHeWQ41J28g7JtQ01QuhJlVPEc91le/XAK+/5ptk
 6nTDeLUVNHE64Awrp8iWENMCIJ17ZCY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290033

On 26-10-28 21:04:24, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> In preparation for removing on-SoC invariants from each device's DT,
> start with aligning the regulator names and phandles to the format that
> appears on schematics.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
