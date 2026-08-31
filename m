Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307063CF200
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 08:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788164207; cv=none; b=LuBSSF9i7UIQDBUFo4I9eT7A3pFXgmh8EBQ2suQ1GcXEaO2piLaAPXPTiyh3tYu9WbI+JQuF9WFx9WhJi5IA4QqwHcBcabxK/5KNAChmJ8zxX3teiuUzQMhicXEuWi7x1EKylDBx0x/IXq/YfIuRC8rwLsTlLYv5PwxxEGjijhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788164207; c=relaxed/simple;
	bh=vZi5S7ZP1eW0VNgKaU6jpf5sIBl2piSGBMCPnTu33yE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nyUAQqreamsSxJGNkDyv+2iOvv8ozbs+dFt/oyLjldM7I0ZToxVN47zBOSUlcswUEgM1RtWGwe3tpZvl+LrIvdgAe6V/Jc3BUdqNo0FnB/Sm33nbFBK8TDvK8qFZsJhwAQwxq0sUK5OnXj2DNQzi5cVL3wJO+Kp3Y+0h462Wh/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ku+l96Bv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gf5+V9j5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ku+l96Bv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gf5+V9j5"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7x9qR3664469
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 08:16:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=o5Mqt86zslYM87bOrJaqJw3p
	pv1OLdoxFWaouUU8Krk=; b=ku+l96Bvyz7ShvMNqbdo/8u7+hQvqMrUsbjutG4h
	zE1vGrurjEYmTe4UdRQKmPbxuNDR+nqmZ6q1MjrQKlIKuaVrR5+QGUzBDuunI5XM
	XHge6dGHZXCV0Snn8DED008GOlOZ8AaHhROI99vsBwd2Il3VuGKdIY+Ryd8d1Mci
	6IA1yKrA68pulGLq7V5chdt/YWqJEIjbpWhQMZGSF6+s+zucj4/v9kWm7G0TMzjp
	kYwEJ2v7Kl5VUztY7fSUbryFf2HGerkZDheqFA8OO3LL4oSG4HONBOcFKcVd1IdH
	9MZhP4Du0ArBS5OxrDWJEaXXWrrvcM+/zJGYpFtlqLGDXw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd4x089a1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 08:16:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e52306621so416032185a.1
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 01:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788164204; x=1788769004; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o5Mqt86zslYM87bOrJaqJw3ppv1OLdoxFWaouUU8Krk=;
        b=gf5+V9j58slsnsMU2qpKyqG8UMJ7kiKHaSw5ROT+N0mUdMMmyCvoAi0bdd4XrEMMtZ
         ddP+OPLsPgWlf5u1xScXk6ysMvOyZAVKfYGv0kNS/LB4XhQ/nQFyJJ1SGWPXeQquJoma
         iLIAu1cXIORYzUVPKH4/R9BXg8p6f82L23wTlbMbrMP6lHI1gRtcEPy6Hnvy8eO7kVSE
         G6IGBqjbvssOlFHgQ14+IEVyZy87FEGmD+mlgO/gWgQifQg1xpm5N13GK89mFzAyTYs+
         EzfsEM7E5gmMXyB1zys5ENNSSZy/1GfSYsbdnSq5dTM6Xxcl3D3rL/GncYOJaeyIqNhD
         47lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788164204; x=1788769004;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o5Mqt86zslYM87bOrJaqJw3ppv1OLdoxFWaouUU8Krk=;
        b=AfU/thVMnivRd99Im9+Hgz8A2GQG0hPYHE6Qs5Bh5iuUsgfAQ+n2ZvZa5UPWgpJXAN
         ejVcRdR33ChVUCVby31bwrreyTfhSgRxPWzcDbuZYzhF8oOp566JxUyoEIZMzmt0eTeN
         klmi5CminLn23U35kCuzbU7CNOPcTY3Fwadj6REtx6XPeyknw0QS4LRqgUL0lWh9+3I+
         SaT7uCfSFoG2KfLV+OiUX46igcAD6mgTjAW1dJ9Jqxh93peG7nLX0SumcB7Cwcj7iyJ8
         qGRwBpmtIWtV5HPjB89k3h/mE6DLxwagEZyMil2q/hoc6AwAkDNwJrH8GZ21QiAS9ezS
         JiHg==
X-Forwarded-Encrypted: i=1; AHgh+RqCQg4MEYeQRm0jyQSibFYt5qWeE9msAF1lP461faanPguFTM8QFZ6dhqCEMObsUUhsmxkNBCInSHTM@vger.kernel.org
X-Gm-Message-State: AFuF++nbKs9BN+AWtVC4gfC9YpSDVbR1EtP2XK54JjjA2xORU2INRhWP
	ER7zh6I0lbpnJjofu78evC6bp94U/1ba+qZoxb5Jd0Sq/oIxx71c8rqq6d+1pANCADSK5lvQmPz
	Y4sbg9dTJhDTGLL8lCCTIMPVz+X/iW2L6PeSRZM63OSYQSDuFaTdv0NyRztUB05V8IzakRGri
X-Gm-Gg: AR+sD11kLdK3Mhg7TXV5XMXD0NUidh+brnbEYrl7nRbIrcr9U1dSYZBR8dRl79FRlxy
	jsr2wRSFGGZ9Uebor43CQPsYR7GAjhDQb646cXxl3QDEdGR17RV2g/b+RrQqMuKA5Ki/LdNAa6M
	TqmspZtalHv4jphzDEt+cm+vRhwYG5FUgFp7MogyNeEFqehhwVTUcKA9v5R78QJjOqBYjMnj1jU
	9/GjI0LEcMzalLDxnV5lPp05KecGlrzIsm6IJ//aovYiBjGc4g5zdnuS6iEgotzm80yXuL7v3z1
	7yJOVhPGLB2XDBhGzCaRD2uAZiHvT4SvGdELpo7mjnsNLPNvySdpR/S4EfpfBwLjM00jhmPTwq6
	/EZZYMKlkTVDT
X-Received: by 2002:a05:620a:620a:b0:915:9e84:85d1 with SMTP id af79cd13be357-939138d1cc9mr2293028985a.23.1788164204259;
        Mon, 31 Aug 2026 01:16:44 -0700 (PDT)
X-Received: by 2002:a05:620a:620a:b0:915:9e84:85d1 with SMTP id af79cd13be357-939138d1cc9mr2293024685a.23.1788164203684;
        Mon, 31 Aug 2026 01:16:43 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cd2fa779esm114204405e9.2.2026.08.31.01.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:16:42 -0700 (PDT)
Date: Mon, 31 Aug 2026 11:16:41 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH 3/6] arm64: dts: qcom: nord: Add the SPMI PMIC arbiter
Message-ID: <h2m6oky5kqmm7ci3rrtbkjme5w3brtgljivgkgwoqf55upbgbn@pcjlbqf7c67g>
References: <20260831032103.341633-1-shengchao.guo@oss.qualcomm.com>
 <20260831032103.341633-4-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831032103.341633-4-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfX2Jw+b+I+W+XZ
 dD2BfL2Boo8N94HyoTNQOU2QhjJupLZnN/ZRW9Ky+0zHnMzHrHBpQZ34EFLxHhpPSM6exC9eBCG
 oqHo1urLChk+4XmrACPW5vnK5/eZNbs=
X-Proofpoint-ORIG-GUID: O_AgR1UijORcOI_kxftBpKqJlYOf5-DL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfX9pJHYAczHLmq
 VUhhYUicz371ZI0SUIazH+0oEjmln9g/kPwva6l9bCT4N61TEuGnoQXwE8Bjfv1ETSm+fn5F1YU
 pJLY04rcaYWHN2CiJP3Hny1XG98JG9qwlpJQ8syap9aauqyShrh21QgQOVUUYxjDfagSCXPJC/1
 sLbbEB2LdNptoZ2OatPSN28E4qTlT0lro+KgwVgxiMt5xGkZ7EZCz6rGibpXyvhvByzn2BxSA+r
 VCxKgnfeJzopGnhisOOe9o71J5MofSELCxhMoJ7RAFZdoFzwvE9ZqJLCwC85AFL4i+EIU/NaMVn
 EpRcG0WgoSsbcTe2St5ql1w+syHOovMyeGEJ3NfirGypruRpBa9pFSOsOyOS1KQKgnl9MedQ53z
 49NZgehjDHk+gbGs6W3Y8eSfcOBYImCCv5+YBlnVk8/NAa9EPLjvVMEFlJGBaIX3fX52DyOkPwZ
 AIr+t59VZBfIEj1wpLw==
X-Authority-Analysis: v=2.4 cv=Iqsutr/g c=1 sm=1 tr=0 ts=6a95386d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=r_5Z68Ezhs6jPTxZHdMA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: O_AgR1UijORcOI_kxftBpKqJlYOf5-DL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310070

On 26-08-31 11:21:00, Shawn Guo wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> 
> Add the SPMI PMIC Arbiter node for the Nord platforms.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
