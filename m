Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8708A38333A
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 02:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789611312; cv=none; b=bjo4s08hGDiXaEch68j/QTQXKoHQUpupRFr0VQKQpzDz+aw13O5drj5NjgetVFHGgMoR+bGaY6WCqKbLZ5Pl/X7qklMDLCl9thTVgml8r6VRoaBo+CTSbDZyy86uFrINqAEwfl/itk0epEvr1fJ7gkcdAvFl/3lJ3wecNwV4y5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789611312; c=relaxed/simple;
	bh=m0lF0mWr0k8EZhKMpDz0CMkc8BxDMfGtvrJsWJiJ9iY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=clXy1sq07mpzuEfZ8oR4XNGVFpG3xpZGc9gqtjwwh3qKBalnv7VHaedMJd/5ERNJGbL7t/EXe1wYpnSE/2JZx84xh/Ghdb4aO+HaykwZhAemuAghUqq7mol0trnCmVY9T63zE+4UG2EjySMA4P0svCulaBx7cHBten4LbVWzMls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oNt7axBK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dx3six3o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oNt7axBK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dx3six3o"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GNA93w2470101
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 02:15:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0nkxLnWGJPKpLZVwfcJxb6ow
	WJd+MOMDPY4c/u0ORDU=; b=oNt7axBKVncjEHFcBh7gJPyYy0nDVJrzEWF2NHRO
	//10oKhbUh+MxVooNlTmJTI4FXkKAAZr94XsRInA0sks0QOa5kCSXEZGPLN6Cjr3
	F1w7lFS9dAABj1wPoRKUil2E6LDvFoUVh/6Co/rlRsLjiDlsOKkH7mXLbN9Xhk2h
	/CTjVTAH7cCjiVui2nSSLKEu4tIWFOwdrxuwtum7aOKdA57uBlUpnFS+yz4R4ib/
	hX1XgKVoxAhqmvVAZ5jwrDH483+tKTu9iPWcHQKygMHp3N5nDjUeHJow5/Rv2k7q
	nsbplCiHZLXTWaG2sFGnVy5H7/JoLGJgNS9gLu9LqrnqhA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqtn53954-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 02:15:07 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e8e864ef0so618519a91.0
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 19:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789611307; x=1790216107; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0nkxLnWGJPKpLZVwfcJxb6owWJd+MOMDPY4c/u0ORDU=;
        b=Dx3six3oc7C2fRBU8ceHPN6qEuVzQhv9UWzJh2pXMiTNgugTw9g2jAzFx3Jcjz/ukw
         YDcbK5ICCXYIGfCCGoQ0EcLUZTXP+d9nEb3eQzDYWAeG2HrREbmRMltKw6p/FuUuvr80
         0xk9h6T7iD12ojQRGcLBEXlbPuxfCvLkGXSdPRac+/MF6H3eTgu8oM+A+jrxKp32iMor
         YYodHLmo0ZDSX/eYhDSp0EQlilfWuxwn+3bcJoJS4TaksV3tor8fIIhpU47k5G3XiK5l
         2l/XZOASj5LUclRw9HADiwamVnV2pYao0FXoxEDcfZjWrGheWsUnwqSM5bsEHIhfk9Ff
         Wa3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789611307; x=1790216107;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0nkxLnWGJPKpLZVwfcJxb6owWJd+MOMDPY4c/u0ORDU=;
        b=wcx6HGfuvXMiJeW/pOInWRC7JF+hZVmuxISJ2OUsh+n0puBtVQRg5RlLkvaurjDqJJ
         ALutiVcyWPtG3E60QxUUQPifIgM2eWpLszjMgdrRHfNt84tLhhgyZ6fcCYPGEW7sTllK
         lyZQmHpOwnANShNFNfQYNm6Ln3UpcvZZEn6GU78gER51UDb3h7FfrPBa0xL6MfFWY7LF
         4an47AUFE/uXCMWcbNhTCgUrPEFHmq/qz0xFPAKqaw5ljZ2gQJ3fBSZe0lqduJkvacTk
         CjJxUTjb8LU3flndKQBb/dVRcz96WC9EcWyX7nhzNpX719RYtd9hZUp3V1eXAzsMF8Xj
         HmaA==
X-Forwarded-Encrypted: i=1; AKwUvBxTCJwOkCnZN4p7inCAt2dhgegFhQftYNE74wehB45KqtKF2+7gjY56jHtHt0MAAbMQ2ma2+5bG448E@vger.kernel.org
X-Gm-Message-State: AFuF++lBgPFsGaxikBT/CQrY86DnlHLjbBAzOw5jB/2hRxzju8AMdWGD
	1rUa/REtlZ7uEBGd5vwnXbzjAMFdafkdhQ8GoGDRkC1tr6fd5p92c4vBITrWASg9+rqbjGzy41n
	42R3yMK2xNmUHGY6VjnK7Bi5m4xu1dWYBQzNZ0PTkdu99p7scXGIZQkhXCo4afKB+
X-Gm-Gg: AYBFou0yPGBY5yB4Oxz91ST3cYtUZb8aGRhYHGS9E6GfabYyBDc42mPoykAKuk5u+65
	1lbQ1txcoVj3OYngR4Zfa9nkeLNr2IUfroFc/Jq/E/qXeejw1UMpD2GUGNxjZO0gYRtzWVhMtVu
	uIeIe4Q/NosEvI+oYpyiIehr1da0ZMdgQT2GrHfSPRnS1U7m/LJ5kh5tjg1A65eRmCzMVodY5la
	39YCxweY8uA46kVWiSXpG2kTpTrPRoI3DCVPbgS8Ss/bCvfpbJKVuKyTBvqpaMEZ5sBoyVaLEFE
	Izk/yUgJeenOq6//PQLtHYFNXUlec715KCjm4jTH4KmhFcRtiDjLb97WyECOkoAKZqZxn0quZ5n
	i7lqzhGHnmD5+n4FYQnsMPVk7lpgzF2qM9VCxolTcWKw=
X-Received: by 2002:a17:90a:f09:b0:39e:218c:d47c with SMTP id 98e67ed59e1d1-39e218cd674mr8456853a91.9.1789611306706;
        Wed, 16 Sep 2026 19:15:06 -0700 (PDT)
X-Received: by 2002:a17:90a:f09:b0:39e:218c:d47c with SMTP id 98e67ed59e1d1-39e218cd674mr8456782a91.9.1789611306226;
        Wed, 16 Sep 2026 19:15:06 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bfb19f8cesm14368985eec.2.2026.09.16.19.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 19:15:05 -0700 (PDT)
Date: Thu, 17 Sep 2026 10:14:56 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH 00/17] Add Qualcomm Nord display and eDP PHY support
Message-ID: <aqtNIFXY2OcL3SPB@QCOM-aGQu4IUr3Y>
References: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDAyOSBTYWx0ZWRfXwcPgOEnwyxcE
 FBFbJV2gcj1omzN+abJgI1XAdS+hFBSNqqiUW3qV8qeDxAz2Oj/41KLMUBoG4wqZaJsfxcb1ErC
 V9U5UBx/FY6VJlFPJTZ6+CuNxjHaYg3HLkAoEvYLrwVVWz2UNMVVuA9nDHR/rq+Uojmj9z19BGL
 YwcOGO8LJ5oZYMHao8oNstiqyAwYrgBsXQ/4JNVk9PPwrfDb9Nr3RFuGOx3Fd1NKpY7rNvNuSjH
 bJ7HfY1gh5ykbsZ+Jveth1Vs/E9CrBnF5KnXhEKjSKoUJCxxZnBZEiiuDSWHlz34kGdHr3F0/Eu
 e1oocLBBkly8xHd/C+u7TK815jm43yIYwMhiKorJNYB+slu/KvrLNv693FRv0QqLoKz5fClUqoF
 ntzUZqzenV8G2+789DloPQDRsYNwQaaohEMHduiwwpnXaGu7IQToqNUoPqquDooqwIT2ssFKyl/
 tZ+08h2n1UUXwsYzC+Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDAyOSBTYWx0ZWRfX+t/Uf+2WUc0y
 63WN+5JoCBwqswbjXaLKntGChZ5jc1OB8qYUrqtKUnzaJC6WpKslrc01FSW9Kz/g0CE6W0fWSBq
 /IBCDSRuIVKZm5mcXJX+nZvl/rQ13wc=
X-Proofpoint-ORIG-GUID: v-EzSS8EGXu3DXDE928TD8lLoDs0vZcV
X-Authority-Analysis: v=2.4 cv=K7O3jCWI c=1 sm=1 tr=0 ts=6aab4d2b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=NcJHP3AOhwWrRdeD_j4A:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: v-EzSS8EGXu3DXDE928TD8lLoDs0vZcV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170029

On Fri, Sep 11, 2026 at 09:06:31PM +0530, Nabige Aala wrote:
> Nord is a Qualcomm SoC with a DP-only display subsystem
> (MDSS 12.1 / DPU 1499A) and two independent DP controllers
> backed by eDP PHY.  The PHY uses a different register layout,
> PLL/SSC coefficients and TX signal parameters compared to
> all existing SoCs supported by the qcom-edp driver.
> 
> This series enables the display pipeline on Nord by adding
> DT bindings for the MDSS, DP controller and eDP PHY, DPU
> catalog and driver entries for MDSS and DP, and full eDP
> PHY support.
> 
> Tested on Nord Ride SX board with one DPU. Both MDSS and
> DP controllers probe cleanly and panels render correctly.
> 
> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>

Hi Nabige,

May I ask to be copied on Nord related patches? Thanks!

Shawn
