Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12C83BCD04
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 21:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784669504; cv=none; b=hA4A9RYTCgl1h7oszO6rqA6cvKGWAVNFXaTJLYEH2pD55ajyVLrrG154r0PIkaB5eXdnptd5bC5qcaFxEFIZXjtcNOvsHsn33LmvUSzTMX+Tl8xBaU4Aar8x5t0Joa3ei5NsrS8QkyKyvKsKRS/Ut7TbQqTsWmekc6vyOzdLfl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784669504; c=relaxed/simple;
	bh=ghsOcvtIMyp7Jnv2eUuE49/03XKoS3fIPWjk30ayLPk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IylPuPRrZLivTdGkh0YIqG4Ae0R5vb62RmP7C2LJ0ft0KLU9zdAgmFmY25g4c3BH6vFxcfUTTXGMtRb5wVUar/sibsgExOuZrVq3cW/2oAKi8dtw4fjEb9X8SCQBgkBrbOshDO3VMRAjN7JbDftnTJMIkwl4tF6MjUprVHi3uSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZMw6WCLp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DJ+Ct6Wt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZMw6WCLp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DJ+Ct6Wt"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LKllML2701843
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 21:31:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Zacs26RwRJa5c3PMx36Tgw3F
	UuGrJQfN/mmxDci20xk=; b=ZMw6WCLp2ZB1sok/8mhe9Av8ncBNfKzGrn667RG5
	7V7+MHCTk5FR27ZG9uZFV14r8dpwJyyipqKmGpryUGKzOUxl1enFrDM9kQoJNCuZ
	61B+IfuNu4j04HkBaNYaIePwt6J2HMQpEWnBNsWUhxKVOUwwR1TavEyZKo4KzUJ5
	G6xI2pVizgssh765g5XAHzsiw8bakUqjfRFpq3swPvKMNe4P25Q+NdHBls2WZVvy
	MuQvLUtGRw1Sy4fRkMkYvKnQA/AsD3qI6LeOMCs8KwURESdbVt8H8VchcdRkYBI4
	KFO04rvNVikJjFA4yoVZXdYDRiQjlL0Lmazv81CPPaNbWQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9aeabn6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 21:31:41 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-73a8aba30a4so5683873137.0
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 14:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784669501; x=1785274301; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zacs26RwRJa5c3PMx36Tgw3FUuGrJQfN/mmxDci20xk=;
        b=DJ+Ct6WtMibPUVOe+Dn8cwi41OBbYpK/p/8n4Bv6dQkJ143kDymYc5SkJ2Lzf/i5dP
         Nw61JFnzDnrzATTlFajKnYR5b7kp4AKXkdC1wzY6+S8lifiXBkcB8wSJUXDyCLiuzY8M
         5yFs8gAO2igHPxzHpvY5WxThm6Y1a3dAQJXOSvRigfw1dk0hpoJvX6ECEEO9ND7zJBse
         2wtzjwdXvDJXaSY9w7uQD9CZrdz3zB1Sm2Pe/LfT8mlG0MiCBTSlE3r/jTB/uFUAWddv
         giBG2IMIUkggeaZFzzgKYbzDLVmLGQQNQNkw8Jx+DK21vV3Ckc7s0iVtcjdflF13r0W1
         g3gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784669501; x=1785274301;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zacs26RwRJa5c3PMx36Tgw3FUuGrJQfN/mmxDci20xk=;
        b=JaJeYFIMz+wxyWeSitb/mpUSpbLcJUrSaDk06Tla+GJvcrJxNSmmfug9aa5U+D+U7l
         LZolJkSt2OonLUp+QGUdNYUB/dX5UBjLMchXZmIWHoXFoLg9PjvqnyyON90Mt4ZXT6MQ
         4nOwq9irqaHGumeLXl+/xrROv27YNboyzzV/ALfbE4g76r0bx1Bdpn3LhB+7S3XrFyAS
         tvMrzLVGZPV0ElhZgtQCAJy1j87LwZok/Shvkjdp1+sf/L7FaIM3yLh3EB7SZqQ5TVPP
         1SzYlD+a8/A1zwTqtnF0t0Xp2S833LgGBMN9wQWU3ZoVjPlgVgx6Kpbn2CeYQyTQG2Ih
         eLtw==
X-Forwarded-Encrypted: i=1; AHgh+RoHso2C/hV/ZFjfTuILXHqQUxUgD3S8F+gYvVUKAMxmodfOgZCC+tDtNvPB3AAzd0XwCA7Ay0ueZSm7@vger.kernel.org
X-Gm-Message-State: AOJu0Ywhy49qbVZAgicwS0rF0oxyUwXpconUF2sHWd1roDc5pfAPL9Na
	ZjUzFCmSmqAKK398t+If42JjqDjety5Zrr5Z81jvg+F1lGs/FXRne2461HNf/VDrSAf20PGtDb8
	WINoedbnmWmFmPSha85ROZWdZNePrsHSPWhHZn+8SBa+rSXeqQBAp8mWRr//zv0zq
X-Gm-Gg: AR+sD12aqamsozDmY4jGBQOHa8EECOWWj619Cgp9bIHFFXDmwyydVQec8DiTzQsEqTI
	c0UI7ah1pdAUjgpgY+mMXbcAr8TVso4bL5lCzLo/q6btZ47SWU6HbtxerwUSXQL17baXt+OVNRw
	d6dQcY62+BcgXQqThOn1/5DEhzT0YYhWPlMXE24oN1M0tbX+v1xZMo8yWak7Kv+W1CScqbI7nUE
	leI/BEg4lq/bYuZuzRcxuIOS8bgriDSoWsKTwZz/bSlKV0cruYLKxtHgI0KCi+OJ+u4ADdJ+1hv
	JKMxtRIeRbudlPAmSWqhq7XulY1hLQYmM2wEWjEZgE2NL74kwNdkgpbqes2YtAfsHz8OBLg4FBM
	j9HmfIk2SCVe5o8PvuWYAYDY6UPvGT/bnx1A88TpIlI3spRa+mP4j4zalYKd7zNOVRmzFVHygNX
	tn4+s6OSi0VdcqSw==
X-Received: by 2002:a05:6102:5f93:b0:6cb:b3db:c31c with SMTP id ada2fe7eead31-74ad126317cmr422415137.0.1784669500857;
        Tue, 21 Jul 2026 14:31:40 -0700 (PDT)
X-Received: by 2002:a05:6102:5f93:b0:6cb:b3db:c31c with SMTP id ada2fe7eead31-74ad126317cmr422402137.0.1784669500370;
        Tue, 21 Jul 2026 14:31:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ef6c41f93sm1179221fa.27.2026.07.21.14.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 14:31:37 -0700 (PDT)
Date: Wed, 22 Jul 2026 00:31:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: milos: Add CPU-to-DDR BWMON support
Message-ID: <x5aesfqzdvsfc5rfjefykoljn5cgrl4nzzxwyup636x2qrtfyd@kuolfkfj6cbl>
References: <20260717-milos-cpu-bwmon-v1-0-dfe0bac9898c@fairphone.com>
 <20260717-milos-cpu-bwmon-v1-2-dfe0bac9898c@fairphone.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717-milos-cpu-bwmon-v1-2-dfe0bac9898c@fairphone.com>
X-Proofpoint-ORIG-GUID: AWff1keaRIl0-LDNdxNHAG1yTc-7M4Nl
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIyMyBTYWx0ZWRfXzlPVTaCe0nNi
 LMFbI/O6jFgfexdLKDrFcKL6a15vEcFRAO+8W3/rDtUUW02M9kOtqccetlIVCozQu0nQ8NMcY6x
 Gl5Nom7IAGx3UVYQ4sGPeBNKl7Hlpao=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIyMyBTYWx0ZWRfX3Cur+NgE1Zui
 mVKocoqjlZ1Jj1Z2/JgewkAely7zwnFaNeMdNdIuyaQ5MpGzAUF4w0JwL4R1eE57nTmjKRii1OY
 fqTAWqPkElv9seiXzUPBtGwYHIWn4HwNikt5uMQKxVzaDimv0k5KlMbIZPvkk63dr5gJeduBnDs
 vclAfPHEEziv5DjnrPnjeL60PyjqlIaUu9IpnFDNakcBMUTAVLjR8nyGeCJHdLFGEzV6BlK43YU
 HQudYWVD4fs9tu3CArUaoo88vwLGyMVqOMjpeHfJvLfyH3udtsS5UaZIuvgSsIHTiXXRe5tFWPz
 Iamn/iBTLoK1ty5SH+W6Af5Stiu7vh7rgMosEgACAPYAaYI/Az38IGbPha1D+M43cl6E19oWZmD
 hZXlRLk3sOID/8Oses9AlLVS3/MQWs2Fw3lsukXRM8xNmYPPekc3CUb1SBHMITuqU6Op0b7jVit
 la8rAv4qC7gU/BjK/gQ==
X-Proofpoint-GUID: AWff1keaRIl0-LDNdxNHAG1yTc-7M4Nl
X-Authority-Analysis: v=2.4 cv=Cr6PtH4D c=1 sm=1 tr=0 ts=6a5fe53d cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=6H0WHjuAAAAA:8
 a=EUspDBNiAAAA:8 a=9qgqu1SA9pjVKMr9YXcA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210223

On Fri, Jul 17, 2026 at 01:45:03PM +0200, Luca Weiss wrote:
> Add a node for the CPU-to-DDR BWMON on the Milos SoC and the
> corresponding OPP table.
> 
> Currently, the table is for DDR5, the values for DDR4 are put into a
> TODO comment, until the kernel can differentiate between DDR variants.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/milos.dtsi | 49 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
