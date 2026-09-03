Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBC51F03DE
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 13:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788440659; cv=none; b=nG/mWsXilMvW4zPlwd5lehr/UnrPqkNcX5V/0xAC7Jtr5eOpP6Dy2mksJYHOwOuwrujMyGWMqGK+47B7iOYc3FkWy/vVzlAcTTvR72Ib/Dnaw6tI5M3NVMySxRTuj+/xiWL+iE37t6HQJBeiEsO8o4sIKSBVYwjZ0sY1zbRARHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788440659; c=relaxed/simple;
	bh=uKlKDCO6lte9oquheVtNrXZEi++5BjURmRRXHWT7JWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y/jT8mZtIImKNYICznGycWuh7zh36tftEDBLYj2NbTgOtBdCAEqP6md/bTKYb2Z8KAbn+wAtNeykJycvt+gAHD3YyguCZOiEP3UcthDEjhDHnQi72RXaJKOxr4iG5ynMZ0RR6bc0gHFnqy5mvilTy4y9/2hXEaHqHpWki4lnKOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KE3SSoes; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BDjb2HY0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KE3SSoes";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BDjb2HY0"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AHEtu162892
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 13:04:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=n9o9tfc6MP2cm/LhJj6iD6n2
	2+6eraXxnRkI1mIVuDE=; b=KE3SSoesEq1RzZ1pOwC1wqNPDoVtj8xjf4xMQ5JX
	X0oTrmpNrQbbB8EQMzrbok2QLWOh4IemCFx2EE9c2GxumFPPjFDWSZBCMNVCsGP8
	QXGEBNW5//RzDkg1wPyzOyVedlsz8o6iNBItzsWGVl6119FmOAoF0W5EixxElqpM
	Ow0If3sMF/u1h6kN2VpHW/fkyehJUHQMp8RvErVy9ZoOHAs9p37Qk4vg580tALID
	lP2e5U95WZQtzEqHl4xiQZs/oRFQdg5SuD+BLlPUFGluLW/5HbWK/kckUqaZKrPe
	Qys5ifjjWZEcWEKC7lQ6DfUObrenE7vwe00AQvV/uyW3iA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf6tx0n2r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 13:04:01 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-73760a7cd83so1818788137.1
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 06:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788440641; x=1789045441; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n9o9tfc6MP2cm/LhJj6iD6n22+6eraXxnRkI1mIVuDE=;
        b=BDjb2HY0j7hb8dV+QzCCQnMbSFXOaUpBeEI5wgt9qGog9iutTwyB9nBcHOmL84fCaU
         whhrsYh/HyFx5uucO7J+EbLiGRSJhnnBAZpQl6j8mtlI5MktwzsVG6gGm7FoOKh4ImfS
         lFbIlzVMjnKcA3Yqho3btzVURIaBUjY7mg/VGLD4dcSmtuRvda7KHF2I56qzUYQX8it4
         xC9l7c5wlzXnS9QnnhRKJXZBIReHUn8lz2RIlSdxFTsE/8AqhPA82WWdcT5Nfz2blp7A
         neO4Ku7n02CwnRUosyWwVjHf68uzySj2f1slWQbW0G4mI0pKE5sSJERIAihxpnMy0SSX
         qIwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788440641; x=1789045441;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n9o9tfc6MP2cm/LhJj6iD6n22+6eraXxnRkI1mIVuDE=;
        b=SPyBu2G4stoQ3p1UgLC8RSuAUJ8mh5hFeCwiR6A85STHCP1QRwqrLF4V7l7J2/P+37
         M7VLCNto1a6Oqk5k/VykwgW4hnodbMp1eZCKneL2ASYji7SMVmqZ7pdMz5M7ZYD4fMvc
         3FYtosnP72zI8+WcI3q7KXDmseKouazKFbId7XL9NKSE7I6ddvGt7TcpfBCZxnKkdQ9H
         qxQo+v3GgTB0L5odQltLI2tRS0+VTq7XWtF6De9T5EJuvA6Z+/yLAAdXHOXWdg42VH+7
         u035K/4KyOo4rt5EaGjF/VW6EbYM803KTxAk64jjxuHo5vklaCvonR2/gOuBauTGmbNH
         sthQ==
X-Forwarded-Encrypted: i=1; AKwUvBx8toqrZgnyhFeg96EsQ84Fgsv4y4g8rxrvzHDo1GrhgAuN3iBladJZG7V2IJv/Gkj7HfRd27sbFzp+@vger.kernel.org
X-Gm-Message-State: AFuF++mrcVCI2zpQOf53Rs1MVGgpq/ROfIJq3YwUyADMWjz49OtSTo3L
	rl6dOC/fvCqH/M/O3cEtytSW3XVmT0pHekVPsLPpfRtAlKpEGOV2X4JnbNBQDZMNbBUXda7lST0
	jcRjjVez8fwV7XkYVm+hXZh8CsWFj2dswRly+i4NmWJ5ABIUGPRYyia4rs6W9UTKd
X-Gm-Gg: AYBFou12TAbLT5DCO6yGphXx/ag6aGGN+I2knZZrCueuOE1hTUUGsudkbQJoB6VBiaE
	Cptk/lW4teUkfGK1YbtED2VB//xUbMuVRpsuEzuTDooU6ubrYTvNlThNUDYeksnjbm3VL4M+SJ9
	ZrI0DA/Uk2F6cJJXcIaiNyHEu5B8RWivAGurOjLOenMd77PuyjSY518Y6kBRDJeg3ZIGGRdsGa6
	UVMwHlWgPukv1HeR3+YAWukyrttjTR75UfNIY66b9gXVigUqFccVgdNpyIu/8iClfSrzxpXYJNB
	Eq/cwMHMdhIJL3YRxPilAtBWd/LYfHEoWEZSxGSSANzPpSObEddsCwQkoCaqjgHh0yRTkA2RGV1
	nKrbKphYYo5M7MA==
X-Received: by 2002:a05:6102:3fa8:b0:785:d308:cc2e with SMTP id ada2fe7eead31-78a1f363e2cmr4307736137.9.1788440640431;
        Thu, 03 Sep 2026 06:04:00 -0700 (PDT)
X-Received: by 2002:a05:6102:3fa8:b0:785:d308:cc2e with SMTP id ada2fe7eead31-78a1f363e2cmr4307694137.9.1788440639785;
        Thu, 03 Sep 2026 06:03:59 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448eea961sm13755345f8f.28.2026.09.03.06.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 06:03:58 -0700 (PDT)
Date: Thu, 3 Sep 2026 16:03:57 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Luo Jie <jie.luo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com, quic_leiwei@quicinc.com,
        quic_suruchia@quicinc.com
Subject: Re: [PATCH v3 06/12] clk: qcom: ipq-cmn-pll: Add PPE clock support
Message-ID: <kx7vvg73j64dujbmbhblwr6wkoxdkimvw64uew4llzvleo74sd@wywugwoqv5ks>
References: <20260814-qcom_ipq5210_cmnpll-v3-0-21c3db378611@oss.qualcomm.com>
 <20260814-qcom_ipq5210_cmnpll-v3-6-21c3db378611@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260814-qcom_ipq5210_cmnpll-v3-6-21c3db378611@oss.qualcomm.com>
X-Proofpoint-GUID: xrFCx6wX0tpWcLBP9JYEtweVSGYIiMGw
X-Authority-Analysis: v=2.4 cv=TqjWQjXh c=1 sm=1 tr=0 ts=6a997041 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=1qdZy_LgBuSf-aNzAIkA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: xrFCx6wX0tpWcLBP9JYEtweVSGYIiMGw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDExMyBTYWx0ZWRfXxsI3F1DxmxRC
 8ThA9P675IiOza2qb/Fd2mw8Pnr8bWHv7869i0+4O+CppV3K7q2vaD30ICHbRxJUV/709i0Oaar
 5hktJ8JRl0Kd23j584CFVPthDrYZmlLxo6Hi0IQwRkN41AkT4x/qfs0YsLrf8Z34LLH8A8nwo48
 f/jtRqsK2q+8wfkDauPq9NyEdsZnqIgyJYnZadBdqAUiUUIM36veT6ERpSfdBH0Pymb+I6uFuBJ
 IsR6dtFsI7G0wCandKq97fffohiqng3HkfPNNcjjka5ea0YGVPPRYH+COmjPLkORGkDaBkUVFrw
 OCNWGieCUhQhMXuKKEyxd5CUpO6EyiDnTKlTFKyqu99yBX32tlOqN0zcGiFgD9xY53Md+oBicMX
 N/209JbR5h3e9sKOusB2GUOfExPs43u0OsSrUpPfo1vmZQAluPIr86IFKoO+DV3hno13+wjeznd
 Y/hIDD2+gf4oX6gNMHQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDExMyBTYWx0ZWRfX61rk+Jz4aouy
 ZpQG4LvIu8QA6LQWulWSQFmW5esI8eI/XZJMJIxi58w0ZSyzZ4OSfG7McMAwBLVI13wv14np2vF
 0y7MeBWKFh+u2ZFttxeOk1gx9jYel7A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030113

On 26-08-14 05:48:16, Luo Jie wrote:
> The PPE (packet process engine) clock is derived from the CMN PLL
> output divided by 2 and then further divided by a configurable 6-bit
> divider. It shares the CMN_PLL_NSS_PPE_FREQ_CTRL register with the
> NSS clock but uses a different field (bits [5:0]).
> 
> Register the PPE clock through the ipq_cmn_pll_regmap_div_register()
> helper introduced for the NSS clock, passing the PPE-specific field
> mask and reusing the same cmn_pll_div2 parent selection as NSS.
> 
> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
