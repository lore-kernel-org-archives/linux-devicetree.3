Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795168203;
	b=LRmxWQ4ofKmI7jgWLh9DNPw9nHEUSCRT99nYtyFqa//AOY9baGCW1pBcnBNd9B1S0mVN
	 mHsFKocwYwH5xpK7hvt03TAmgzGP4/4U8wGXrR4kpjZjCL1cbMxU546GwZ/fO/N4HcG6g
	 e7NK8LxI8nD3NBVyPwCHOupiswKoCEK7i2nNPNmvZ9KItRWsdzO/Gbf9tI1kjVPPiS5j6
	 R9pBuuggb/HY1/tAXjJAyb/qenufgeQGu+LRCWOrEXEkPettVWT5fLx42qouZbFd07eCN
	 PkgqcvhSa+Kd6eGexJzyBj0maQTRnLtr8YZX5l9yoga7cg1aHaVsoJy/ZBh5Ko9S7Hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795168203;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=btKSo5BXidED8vJ9NCAxgb4Jb5p91Creg660EJQWOVw=;
	b=z8aonbe0GV4V4yigDIGmd18bMFKfAX98Uk/NOnMYKZKnzWyEPdJs8dZH74dB4f7ehN42
	 73aJbGTcTQxdTWozHgmUY615QtxNTgvh1rwxL8pSmxTGSLShVCcnRXxkchd6BTDjpQF+m
	 k2knPZDxVOznCtvTlHTW5AGS9Mpg6LAGZj3N2Fkg92sEUOUn/VRZUa6D3tWm/A9QHf+lk
	 Bat6K/hmZg+c52Yk+QZRatkSzxa97FxmQismkFTFYUSp+78PItucVBuG87Vo7iEYEZC/A
	 FKK3ymJ2yu11cGJ8nJV5v+FplQ6rIiqZ+M0nTWMHmrSqd5/sxiVx59aTKJRtW1UKhAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eXqeABCi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HSa0AOtD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76AD606A339
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 09:50:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D76AD606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eXqeABCi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HSa0AOtD
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7fQsk606891
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 09:50:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=btKSo5BXidED8vJ9NCAxgb4J
	b5p91Creg660EJQWOVw=; b=eXqeABCiXtEP7b0ixlF+/asBaZcSBH25X1IqeNRK
	+KRqErrPys5/vR35Prm5xuHkmjwnMaqJDBdBAXEcYU1wE80QxWeOiYrgCKbJcpqF
	/ubyek/e8gRQ1w9VfE/+4XvTVk9I8EZDYoucRHoq9Kek/GvVLRM4mhLhi2wplRWC
	NuyvBGWwrAYuktAsGcfNivFf4WuWT3+rhZDSRRht9eXkcBw167p42LaxMxipVsJA
	I7OLKKHpii7G/n6PB7BAN75rU54WLod6VO82uYcetJRVzNkoxRnYnOSgnVz2Md06
	uJi41zOsnSChj54FPyxU+rKFM32J9SrSWjP0f2o+iPErNA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2ggqrww9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 09:50:02 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f559420f3so79802885a.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 01:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795168201; x=1795773001; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=btKSo5BXidED8vJ9NCAxgb4Jb5p91Creg660EJQWOVw=;
        b=HSa0AOtDE8yS/7BArK2n8E3v+Vw2xuYPKPiunt17PDMlaNZ7Esoxw4DXAnNayoqBCs
         lPHt1LQK97XFcK6FUKqkfo4Torima8vAjZlTrn6jXCLpwi3m3D4X5zYbwzExFZeHhEOY
         5gjfvryb1SYF2TnM+7HDjcsjkmw68sUhCgTLcQ/GPXjAIg8BY5BZWQn397Go7SMLAWqx
         F2ZFlgobhwI9MPDp8sDFc4us/i31sRuZsI0iQ0FHO5WI7IiapZhAaTOTjEN4yXaZ+Mhp
         /8ELFtGZCFPp6OhtduRafCt80j84Pq0z+QLvhmyW1s2U5J0jjCxfHwTRztvnulUnzXzz
         G5uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795168201; x=1795773001;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=btKSo5BXidED8vJ9NCAxgb4Jb5p91Creg660EJQWOVw=;
        b=My5JbZR0bqqwJ/a7nHoaJ8NQDYlKt7Uz2bGfHLGno2c4nM8I8aaRSe408MHo98PEr1
         LwwltYa6T7qd01k7eOAmwnEJ3qtuJ0/1/1gBU+L4ofqbvg8owrgWNw/+0hVtz4Bs7koh
         69po2XTQppB9v+HTVHsa774FoxV+zTffGQQfmNGf51kaZTFRKwsXB3ODpR4bzdRV9VFx
         mSemGePH0vlEktmkxp+W60DU6EsPG5rZK2l8/CxgCR6c1sPTVI8/xnrj1xFLDt7m17Mf
         KqZzBewkERV2bgVPHYhucurN8qliCgFYFuYU7EY4jaBOxRjPygVm5aGm7WLq0gqxKLYn
         HPFA==
X-Forwarded-Encrypted: i=1; AL+hErHvfV7u+W3PTbGSVRVh3YAph985l322UBAi972mSynT9q2lQRf+Da5SK2WzLkdbPPpRAfo66Sx8G1Lt@vger.kernel.org
X-Gm-Message-State: APuU4Z+M5o90h4eUVJtpwvOW4mvTiAp2iQsqB14cgebPWLPromwAy/IV
	Eon5tc8oRbzej5wmEgwJVqTxgobNZo0q7qf0dQlDE77aPXUua/SOwfhy2iCe6o2/ZEYjaXbp4bi
	DTqRM75/N1G90dFAjQAEtz0pWIjqMtsQiicJSsW/33W+TaTckwh5r9lUJS4SUXvEH
X-Gm-Gg: AYBFou3YhAqntIEYMXrnxNIBIhK+pcsFQgmk3WkXux5/AZQMtULnCz+Xd0aYF1/ASNa
	qgAiK29W0bhvLGPnWHBlHdoDU72+XM/+5Mw9QriUr6T5nxVcj4urBVmMJLCLFo/V6to8DYbbUn4
	ngaa7xkmNSONXh3K5vWHXjToO1O+1g8MBm2t40+hmQj+H3Ww5+PyQH1xDNeSyx4iim2Y1IDHbPE
	vGelMx+I/v9mLnd5C5HvSVgG6aM7XYNGFPtLNfNlwNKQzHKCQ6mJBCbismpQrR0bA2ztNvzTkaa
	8M7Hvn87qc1vQ4Y8zGxhV++/oBcsIEkpvB//WH4S4DpyOuGvulPBEqXbxaXZ7kcZdJ17urE2xcu
	Hr6/XK2vherzxg3EIW2neZWTHAt6UNpY9TU7ciLBtRgd5JxmA2PoRyGtJyL+qda/z
X-Received: by 2002:a05:620a:31aa:b0:949:3066:5551 with SMTP id af79cd13be357-949bac80948mr413719985a.79.1795168200885;
        Fri, 20 Nov 2026 01:50:00 -0800 (PST)
X-Received: by 2002:a05:620a:31aa:b0:949:3066:5551 with SMTP id af79cd13be357-949bac80948mr413715385a.79.1795168200326;
        Fri, 20 Nov 2026 01:50:00 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf61b8sm4189249f8f.19.2026.11.20.01.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 01:49:59 -0800 (PST)
Date: Fri, 20 Nov 2026 11:49:57 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] arm64: dts: qcom: shikra: Describe the GPU CX SMMU
 aperture
Message-ID: <nny5rvdlbd7dxbc57cemmebswdzbubs57h5fhwxftvcskajpor@shl26vygzqb3>
References: <20261118-adreno-scm-fallback-v1-0-e99cdbf3121d@oss.qualcomm.com>
 <20261118-adreno-scm-fallback-v1-6-e99cdbf3121d@oss.qualcomm.com>
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
In-Reply-To: <20261118-adreno-scm-fallback-v1-6-e99cdbf3121d@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzOCBTYWx0ZWRfX4/tpX8PrwWAr
 N00oR5mqEdo9lheklUNWb4MOy1ceGNg5b0vcvFdDv8TTWe5i/1lYdveKr/NmvBhVrpMkcWfsLwM
 eX3kNpMPHw5v5rrlaMRdXZROzMIqlYzYBsEEUJoomq9r2ksNWxWxg2kPEufC35TbbDpU7d4hDqw
 G9rqIKn2FXVongrGmMnclAetxsOMxURv1z0rZhIlLq+754J14x97HMkj8R2Im6ABvQlkMq1LXvf
 WWxyGIICH9VzoHqB/21scSvQXFk0fTHqF7XosyiuwbzC7c/Ze5k67W3UpcrqxGQfAR8/6vyw1cH
 fvnvLt7Js0D7A8YHIpjo52j3m6yoM82ztC4tIQrKNEBifkhscKoDF4cv3IKszkbUoeMuXQudSoP
 hR/HoaaaBGbvegOY/Q6qc0SS7FkWckMbbB1kPuPxB1TgLA7vIoy6gIJiH8vfxrTJETLnkabriHz
 yXO1ZbPUqHajULdA0bw==
X-Proofpoint-GUID: 76Kwa6mPKicUGM4ivrEOdAKNvt6Mgqvu
X-Proofpoint-ORIG-GUID: 76Kwa6mPKicUGM4ivrEOdAKNvt6Mgqvu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzOCBTYWx0ZWRfXyFAo8NolBLP8
 4/5r90kKdwfXEwjOByzJagijIdGGbY11OrVlMfgWuMMXU8R4bO70R2Xm+7EKVzeVud+maloWi4n
 7IdADJb/RQIkTHXsW8VVKg7wU4z8LTg=
X-Authority-Analysis: v=2.4 cv=CNy/zhrD c=1 sm=1 tr=0 ts=6b0017ca cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=gzqzoBdNbbgndB324-sA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200038

On 26-11-18 18:38:30, Puranam V G Tejaswi wrote:
> Add the CX SMMU aperture register region to the GPU node.
> 
> Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
