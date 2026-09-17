Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835543AAF7D
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 03:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789616506; cv=none; b=oOupsdCVrkJRLGO/NZJv9xQ3joMmZtNDvkY8qvcL29n7nmDzYUciOzCzG570BfdPSZkU38BehGF3eW1MHyZNCU3jvET8khvENzi6payJol4CHa7KjPwPNmQjjn8tZZspq3F3lIlad8YUndAXH1V2QMDnNfhQTXXxQHBCXt73ea4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789616506; c=relaxed/simple;
	bh=4XhJsmVizhzHozwZPuPySnL45oeWWBP+08eCboV7Wms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RTH558yD06F5SMlOKRswuojq0V0mkVvYgu9xti20P0IUZNrv9ibg/5G51pPBYcd5aed/f7jsbIHSe/VSINJPEdzx7iSvt4LUjZnJdRGRDrizLhKi0N17JvdUZidf6eg/3Y7hMnC9jarvqmVoDw4xdPCTWGCUfoOqDCsQfSF83Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NzC194yH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NbLberWq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NzC194yH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NbLberWq"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H0wIDA3238492
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 03:41:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=B5C8wjP4LGLq/ehI6YaOhoiR
	mBukehjstLcbOo1B3qM=; b=NzC194yHrdG/MscmREOBfbUZ903PjJFPlId0LMff
	8LF7xeLYFhyMg8L9w8CLKaR+2cERYqDWwH+C196qRU8pHzBZVJhhwzpd9mwH/n/l
	t6jTQje1Z8NMCeZTrx5UXR7VaeJanhYmwnvfWfQFSNQPyfeplHymxCpdk92Oi5iA
	X1KA89i6kUS3t9mCtzBYai3aseimxWYadyXtiPzl6bdT9dvjAWS17aakMMKI6o8E
	AXAy+ENC/VZ5nDE3g1BxNmEWPFKZLagcPnDotRnMhsoK6xCLtNfjoSbBfwYNQ92z
	3L11sFXAbM8EXoKx2kYheR0IR0mhgOgjoIoBOxCJGYCQzQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqyga22qn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 03:41:42 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2dd1631d291so5823815ad.1
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 20:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789616502; x=1790221302; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B5C8wjP4LGLq/ehI6YaOhoiRmBukehjstLcbOo1B3qM=;
        b=NbLberWqtJYKv+HqLZDItfWUd2V26KJB0AtdtCCBn1r3yaBgGem2qM2t/fCTwIkTCa
         ntF1dZVhi527FRuxJJtuCSMPg779A137rh5sUhq6tE2zFe4gLtHvbJ0CAtsylk48e0Xk
         CAx+85fNOksVC2P9UjLbTSi/ui/JYdIBYVdsXBuIs9aEiK0hKm9T1uzDN5sX2wq2eUrY
         08H37RqOQqOavR0UOkSMreQYGb3rdcWar5CTDvxaCY5N2uCyfMO7IxQSCABA4rA1BDG8
         L5qm1hNfeYH+cw4B6pVjKTmRlO3sBS6IvzlZUTCov27+rBemdgSFACMDR3i7zN+YbFjX
         KCWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789616502; x=1790221302;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B5C8wjP4LGLq/ehI6YaOhoiRmBukehjstLcbOo1B3qM=;
        b=bBHnOGci7y2KuwehJ/Ld3zARccI7sspuFFgx7UYazHZ+ocs8VOYSrf/n34YApHAIIC
         irXOUFl9P5q1LgenLvtSRAKYtlQECEnrWogBT9KoYqmd/OZ93BMaRHKO2Rnp0VyVUN73
         sBUDsAeC+60DCvIaCjWi5SWYNaeodhrBO8/KBjPQKHUz2mBhC2ALXRSG7Vywhl+nMlxA
         FfnJ/MhC3pMY9r4BtHHi8pmUwFphPBVnryOzaNsHLMpXAKJCNbxjpmHQHaDg4AOHqtGF
         LcPrJ/pZhzmtIp8czmiqhuSBSACJYMkFWTbEA2DR9+J0THOKVkkvIIB3cQ+Fg9ai9CQ5
         JCIw==
X-Forwarded-Encrypted: i=1; AKwUvBxKHBjlclK1DMpY9gMTEP3P1Lkd0hf7I0s9IYbdLUqqa4lzPHwFYSWmvLBZcEWwCoENjmYpvxDvdhBg@vger.kernel.org
X-Gm-Message-State: AFuF++mbJDC8WhEkevMJHP6Nx4VP6oefOmpxp0+yhjlJdp4AdUGr4jzF
	S1+Ynbj3aBnEHdEGYkOd75XuL9TWPv0DlYU7svSo5DM29jDzZvHdqprFP4Pn6oSk73x7KBDrET0
	kzkaD6AU0M0bZkNLhgsss7UT1rrV7+27ieg4wPpKCcfKhx9A3qGxzECcCW4eovdrbHLw8rI8cWH
	g=
X-Gm-Gg: AYBFou2BuFYgIVAXZ41pxw2yzprjaKtPPZtfG8HC5aI/ktrNCSxCvMKDi4L/lem9JcM
	nDBs89LRWCGcejUo0MRtwKDcbKi0ScOc+T+IDvoa89DVZ8HLm6/uEgO0Z58JbvzgtdxZPpn+eMj
	wTzM6uBXey6YNqV865BIh4HSW4Mlk1RJWGJx3VyOgm73xqOtyVrSLgboW9fkBYn+ybPpTX2qeJO
	MqKzlx5SfLCUEKaJCEU1+YygmaTydLW0xU6lx6FosUVfpEJ7PjQLuLe2Atd9tZUnWuXDLGUQh4b
	uR+3UqQj1Bm29r+8mHtQy5RBDKY66AFMaVGctIWPCzo8xoAB0LKNNaobbAG2cyXdBKlJqcrS+VO
	1xPlP7ERbs4yKMN2NtwXCqO9+iURZCMPkILQvZv8EK1E=
X-Received: by 2002:a17:902:cf03:b0:2db:31d5:1448 with SMTP id d9443c01a7336-2dd8e77cddcmr113408575ad.22.1789616501738;
        Wed, 16 Sep 2026 20:41:41 -0700 (PDT)
X-Received: by 2002:a17:902:cf03:b0:2db:31d5:1448 with SMTP id d9443c01a7336-2dd8e77cddcmr113408045ad.22.1789616501347;
        Wed, 16 Sep 2026 20:41:41 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5aee8b0sm22826369eec.23.2026.09.16.20.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 20:41:41 -0700 (PDT)
Date: Thu, 17 Sep 2026 11:41:35 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, brgl@kernel.org,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: dma: qcom,gpi: Document the Nord GPI DMA
 engine
Message-ID: <aqthb96f2zj_dlK5@QCOM-aGQu4IUr3Y>
References: <20260916-nord-gpi-dt-bindings-v1-1-857bf9e84999@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916-nord-gpi-dt-bindings-v1-1-857bf9e84999@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: pRFY4t6qRHvJOOkJkCqfvnn02qicyybk
X-Proofpoint-GUID: pRFY4t6qRHvJOOkJkCqfvnn02qicyybk
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDA0MyBTYWx0ZWRfXxBWqLdDfKZbQ
 1siRZVUYBle01SnxiIh386yITjZSM12vJPxrgnzUGydbdSEnUKE+ayS4lxdFGe7+UFBLgyzeom6
 7VGI8CffpbaZ345V2LUPW4w1YbLnoGE=
X-Authority-Analysis: v=2.4 cv=I9fw19gg c=1 sm=1 tr=0 ts=6aab6176 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=yOFVgSGORKUhaciPrRkA:9 a=CjuIK1q_8ugA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDA0MyBTYWx0ZWRfX8fLv5J5QoW4I
 Fv8SEhQZDpKnaqRxXM6Qh66bDta6jOUJugs60l9PvXPLr85SJWweN7Hxq4LAUJRgNRKZaktcs3s
 zV5zjwkJ38t1dJuwRc8l5E0joKr/QCddRAc9joibXWm2gI3SabiEkqFpEg2nYiO7M6A6N9w5AJN
 bGtsgXgou1u8UACv4TCghAoP7TXebNdc4OmO8R299FX8xeLCHHTBWH2bZUlepUWr+SG7DGvJuvx
 SXmJ1KuJbnxVdO7zgQBrgIZQgjLHJMXhcbNeWA7pzEh+H9zu/V94JUHTk68qhi4c9Eu8XFvdlbv
 AJ3dMemdXFZSX/9s2KcmRYBOLuy6eshAbbM3k5eyWL6tOR/eDFAPoT9T96s9thWnO01GmYFa6RO
 06k06iiUj98dGretPH/Q/JzX3Ck9b77SheVUl8kpZf2AnrLvu7kf2XYZzfNgCy45A2yHfHYzYYZ
 DS3NlJbM0TySGzdF3mQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170043

On Wed, Sep 16, 2026 at 05:21:29PM +0200, Bartosz Golaszewski wrote:
> Add the compatible string for the GPI DMA engine found on the Nord
> family of SoCs.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
