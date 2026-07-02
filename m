Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0578043E4A8
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 13:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782998389; cv=none; b=Oq/3DI/PhhlN9yrXUwvdELyWuaYpX81UdeTzvLXUfT628IJtP/ksZW+jGlCDUuzhCHu0BPyjodSBbzre7HfjzzjaXHZEmwra8YN5bfkbWmJfWI49/B9r1wzv1Rk8NwtXU1Zh/BXvlWrG3DeNx8CtC5Q9TtSUOAmD308Kp8obIxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782998389; c=relaxed/simple;
	bh=dR1aTWUCRvBY2I5PtVwstzuVzibl4jzNueUpfxJRmEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YGhlvuHXdrYaQdCNyvZz3jj/btDikoWtNRL8xc9MKIrCJjDK3t2nkAwpSnaltKOwpC+cVMfenh2rexew5+fp7GKK1rcO96lQ30ZnDEGnVOURO9VfkJhjWFOOrnluc7O8eVgGWVbYzrERcdOOHFIgXQv6Elanc/BWuvJNBW5KJds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mdGnnwiL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BJUcdeXC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mdGnnwiL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BJUcdeXC"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662D0b25522901
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 13:19:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kxGnLji2fygxOtG9DCgg4Tsn
	ElQ4YaUAnlvU7bHGohk=; b=mdGnnwiLenyDVMAE3XRU51yS8dYzm0Kaji2J/s1Z
	0SHGf+Cp6xK0986Cs2uQlC0Gm8x5FZGM1WxdLwdo4KBigddR3fCVvd2D2oQB2CXt
	t/2Y9eeaL6vZdYK8Rg6ZjTijTWLDgXRXEU+vB+hYChfCIehJr2aXb7870acagwRe
	7MoQQ1gmlhogq7M6FxwWMo9POj2xxghU1KRxRNVDHbhH7moj59RFkzGSnm6ePPeP
	Fe6hs7Y6h0tnqc+S0R9z2LNsr8J5UCASMQCmvuctndaRVqh73rK4LPeDd+LCcd71
	4sl6tzpB1X8KbP0q5nGxDD59KK9FSFbAvX7UpjUpFTUP5w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5541vvxv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 13:19:46 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c88e0f04e51so1527330a12.0
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 06:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782998386; x=1783603186; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kxGnLji2fygxOtG9DCgg4TsnElQ4YaUAnlvU7bHGohk=;
        b=BJUcdeXCKATb9J5lfdyDRek328YAkvwG7uHqNJRvdf5c+y+WAvuOrTcHyllUsi8DHy
         cjGakORAYyDDgIeaLTDCxOV2K9jLV3OUqEal73A4bjWAIXCpFvTj5W6L4zDYgsIKcPV5
         0OVFLARFGakuL1AtVvVJ+flWVQXDUUdpqRI2C0/agWzQk7OZ3t04e42kOFbCdM0LLYiP
         auTGrDj/mdMw04KDK6UnULuXN9EtoMgK/RqRceXaZsG0exBvQZp9SGcYW2agGsfdmmcA
         JartEL6zttx3v3vsa4xacHLNeLwRglT7fO3HmQ/zcxI1A+5SNuA/59Kr6KVFxvjMGgrk
         B5Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782998386; x=1783603186;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kxGnLji2fygxOtG9DCgg4TsnElQ4YaUAnlvU7bHGohk=;
        b=q1Mj98oLnK7qPhNlycXxG3v2Hh1w0YEGLenrYDt32apTwRAnkyumO1slvOqP9i+Isi
         FXOohiTQkfOD4VyYmOmoWXuq6Y3qcxEo1rdmpFQI4fSf/gkoJhJamdggUkWtG7PWTlkl
         uqliPMJST6dFOAyADeHX9oqREpjLvQS+bnCYitKowtHRCyssMesjMq5gatYHzpI8XRB0
         Xeetxvpu0YTyvi+iwtfVVvcNnLW0vkywbjLkKy7rlD9IoOK02nl8+PRQRqsfRpSxfv8h
         C+6G61OM0RAYKjo+OtIaGklD5+NRkvcu3ii/hDWVYYcv4qLLBuU/P5MQcpS+Qv11XZ49
         lSxw==
X-Forwarded-Encrypted: i=1; AHgh+RpnbAyeulz5t6EdJzsfC7DSKIhcDsZp0KdCjt8Om+yYbCuB9zENzH4mpjUd/YWeNyhy0sIhSYXqTHBp@vger.kernel.org
X-Gm-Message-State: AOJu0YwBwyD/kEm+Yz4Q9pVk3Nub60lzNNPkdPFcLUE6M1A6w+wro7vO
	Fcjbucu1ZS6TXgfLaxJtQ6C5lZxB8rLIS+m/oUuWvLQVsioH4TTKAIZO1mYjQCW3yxh1m9dCbMM
	USf8KhyFvZFVb37qxNwq7vgHiHxwigIQwvaPWLWHQ3Hkv2F99jxSRZGXEIdijXwQu
X-Gm-Gg: AfdE7clDrBeqqXVXRstkDODNHH9BJ40mQB+NCSevIsQWnLKirhJpUkFQDrermZwaXT2
	rOKHXPt3g3Un1cEKMS1Elk2mC1h3f2R/J6jisABK8LjdvPg3UJUPJHjXK+qbl9gB2k7coaQ1pYK
	tSAEve0FujcAdhIocCuRcxdsSYQ9N3j2SvY0sDAKmh6Cgdv3z8i0hrwZxKKcZFG8c59fzQx5b6K
	n7HAZlWZzfQjGXXXsfVTCf0EfCNHnn3Z10W2F9PkSs6zMEjPjkzaIBdbUyDT/t3ciEcfKq/9x19
	TxSYktx7C3kqi//RUO/TCMCGUmkaUMNtTSoxSXPU7Zu+uOe2Ui57Ft9nxE4hHMRvDv22JgBf/rF
	GF8NeaBmhfbxB6LQbMfVQw4dcsnvXoU1WmMNQ4w==
X-Received: by 2002:a17:903:2ec6:b0:2c9:e846:a57e with SMTP id d9443c01a7336-2ca90c2d830mr54120565ad.0.1782998385884;
        Thu, 02 Jul 2026 06:19:45 -0700 (PDT)
X-Received: by 2002:a17:903:2ec6:b0:2c9:e846:a57e with SMTP id d9443c01a7336-2ca90c2d830mr54119995ad.0.1782998385350;
        Thu, 02 Jul 2026 06:19:45 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c85b345sm14334282c88.10.2026.07.02.06.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 06:19:44 -0700 (PDT)
Date: Thu, 2 Jul 2026 18:49:39 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: kaanapali: Switch SCMI perf protocol
 to use power-domain-cells
Message-ID: <20260702131939.dexu4jxuixxnzyee@hu-mojha-hyd.qualcomm.com>
References: <20260508082729.37674-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508082729.37674-1-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-GUID: 7zUVaEggsDWlVL2mPf6Eu2lsFqmAwWsA
X-Proofpoint-ORIG-GUID: 7zUVaEggsDWlVL2mPf6Eu2lsFqmAwWsA
X-Authority-Analysis: v=2.4 cv=Xbm5Co55 c=1 sm=1 tr=0 ts=6a466573 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=fqTeQLrJ5r4hnVr44MMA:9 a=CjuIK1q_8ugA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEzOSBTYWx0ZWRfX7srDimkNTtzt
 x2dDtQs9OcY/TxjF9rdSumUVYoEFMWFxSTDvtVb4pqusIHKqU1eg6e+xWvA8FAtgMbCzwevtJSb
 mRYm2n7Q1enNlFP5gWQgwV/jzEjaPZp4fgozcjoc7d7gwyjqyqv0wtggutgRa5eD8Ps4w92rN1R
 5U/s1mReSFrX3aWhsg8xHPW+sddLCXKZlrjeZmSbK3yYZ8APbHJROdIytkvpPfvRjHUWj6j/gWz
 xv3xSqST5zd5aMibawbhns4wRPgP3crUwBHvGMcML+THk6JJds2pRhuv550aOjtU1reS7iSogTC
 pNFoxE3FgtEqqqw/W9HNoBVuXwYBCT4LR2wNVOCJtfGlfxdyzTG9H/gHYM8jsbdfWIvaT0Lr4J+
 HY4cdONetJCeRGR+tuHot90e4y5w2tN211XeIrvfGUDzxhRz9B7kwebiZV6OBXl0jdOnUlW88tj
 nV+RdyNIZP952lD3FMw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEzOSBTYWx0ZWRfXxXcYTTqlJenl
 CClS1wv4eDw7kmZCy925xSV4zZp/Ih+apVMRHu3+XQi/BMuuVjFxampE0cyR4LcfHSb65AcAmIM
 TIcSPL5jgTb0QyGuUHOZgXGzDej3UGU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020139

On Fri, May 08, 2026 at 01:57:28PM +0530, Mukesh Ojha wrote:
> The SCMI protocol@13 (Performance Domain Management) node was using
> performance/power domain, not a clock. This was using the older
> mechanism for passing the SCMI performance domain index to
> scmi-cpufreq, which predates the #power-domain-cells support added
> in commit 92b2028b00ff ("cpufreq: scmi: Add support to parse
> domain-id using #power-domain-cells").
> 
> Switch to #power-domain-cells to match all other Qualcomm platforms
> (sm8750, glymur, hamoa) and align with the semantically correct
> representation.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Can this picked up ?

-- 
-Mukesh Ojha
