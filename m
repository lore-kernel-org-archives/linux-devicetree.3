Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADDE3D952F
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 12:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786365055; cv=none; b=G3otCwi+ufHFmQL38LQe4miawRi9E6KuktLN+aOINIGRAOzP9yHDzB5JQRXsAwPk1B1dsLUBRtgaWd6RrDkp4O9XdyvvgzvIpHhhgBGPH0xgq2IJwQqoH6JvKGl4RV/glhzfcL/u61vikchuVuAW1w2dMXMPWH1JuBWdlxUDxSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786365055; c=relaxed/simple;
	bh=+T9fxPcqvt5uF82iwF6LbyuG9R0cQmokReqYZr6ZFwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A6vFbybrMNaRkOQVqe3BXG9SZ6zSDEYS4FNkeKfYlpoNSKv09IcH+e0dsbVRj+FIOSugd1t6KMe5GQagfvf2U2lrhuYU80D7A/CYH1dndZIPnwjL86ZCBOW6lcRjKJ7hnNh5iSZGjyT7WNvLRl6XPVjBtfQyIB6auF/Oi76gvV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZIO1c7O0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YNwqz2gI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZIO1c7O0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YNwqz2gI"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A9phCS905111
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 12:30:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6990+4gLoIgUrP2vyV7AlLSF
	3GtnpXF45SUirxMl9R0=; b=ZIO1c7O0BUTRrLkenVpYq8AGs9/bPw2D9OPwjEsX
	DGdz2atar3rWLA20KzP4klCYO6Nc376U7KF4pqkDQKMjd7XVbjhFLyS4KPze05qr
	S0IMQegCpxrqc5+wgne5iGe2sQeJ6Gz5jVRADqwje8kb1nXIeHt6qmuFbgAaAmOW
	pmOzx/cF0cxV7eY1Y5VqupOeAqA6Hor6Q3Dz97AAkxYRJgi+8tjeiS3yVY26tqCT
	Zcn4X3zgsybUF6/O9cUJ4OWud84uVVMUnM5+mzjw+WGZ8zQgwV0ROsUYpurIfaZ0
	+J/gB0B5eay8QL/oet0I0O1Hm2wfAhUtRg7CJGoZFrsYrw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyccqrjs4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 12:30:36 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c21c01cf3so34320821cf.2
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 05:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786365035; x=1786969835; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6990+4gLoIgUrP2vyV7AlLSF3GtnpXF45SUirxMl9R0=;
        b=YNwqz2gIUOKxTzqX3QaQ6CrYohLaI2L7/+Tr/qV0YbQnJm9VCFHavwHvTc9UStbJZS
         t8WCwPT+Wzsoc3oMqjNYSUbFbKIansZw3OM4edX7auFali/yZShRq3vnjY70bUGpj/hi
         2CEq0e5z5t79fg4I8xCd2Ky0Hf56kePGOwpD/4uf6KFjcEwv1mB9hPQdlckrGSxAZ7Ej
         sw5mmSgHVqPhadueVBsr7X6lYMdheMvGRSss51C+VuVSMCJAVTi0dVIdf3et2k1Ag9YI
         ode6uQvAW/GsLZm8dntDlyhopcnCjb01wY5eWoAvdRdUfKZKnFkHU1ylj/KRUerFQhB6
         IAJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786365035; x=1786969835;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6990+4gLoIgUrP2vyV7AlLSF3GtnpXF45SUirxMl9R0=;
        b=R3tj8T4M4YJu65Dmd3oHxxpEFbMHCnD4a0+IVJImmghdiCYfmVftbogHENZhPfGCQV
         sBUqiRvd5/lgJzSY6TJe7QLwF6XftTKJ6reDFMpSV/ewwLR2I4Oa6VfLlkrhkQBAOihH
         eWLe7knmmtvAlee0QhnvenitSFICjWapBLhN7X7ftF+PENplKhbBszJ4jGCT1IDvpuGs
         tW5J7ril9i7SlJzCG2mP8+wzbwJhM9a33/Quna5atfZVijvy6pw9NvUAltWUUckjJL9L
         Duu34IcYtnw/RaaNcy22N2s4lnghrp4hjmqn2KUll9IIusSUsVWJdzKddLHNYxHHeeBt
         fLjA==
X-Forwarded-Encrypted: i=1; AHgh+RoVG7GeO/dKR1TnwAA82Ii/7HN82Xi+2V39KgR+5Tqh8rbAJNkSNFOdOV/i9pZ6FKDIjLmM9KYxaF+b@vger.kernel.org
X-Gm-Message-State: AOJu0YxYuxkkPpLj+7pekM1NotuErH2LcaqrxBqsMeCc2b2WQOmgVeM0
	P53NkxBC05xLJ+l//Bi3luoK/9pedRuxdNw1H5OTisAqCOXL+zrQBsOg2qIBv7IfFlSmXs1cApP
	BFlpspQSUyL0eQVbjTzskK71k3xaRhBy+Mgzy/drAQD9nvdoRV0eKqLiseAQE5Y9q
X-Gm-Gg: AR+sD12F7mx66zL7LFhI8EfAp+ccLvZ3jClIiUETOJkfbvs82jrEyFju08ACtuScIQG
	eH+Msf0yWqZq8Wh5uWCGOGuLr9qZSuKVr3KsLnLJTBgtRn5l9HR8xwZ/B7m7jKC2P9l7PlxXM11
	rg6zZinGNsP/3YMCiJ9gDCGSZzc3o7WolfVFovcs1Ja7c0SU/ps+Mkk+k3UaV9qRiJdbxxHw6As
	6gz/n2hK+GUeGlYe5VfTVEZylc0TNfzNeKy1NiOlLFLNIq8SqznDzNYCF4C5gYlnJRsXVgUBZOL
	uRX7tPYiwQF7n/OgYuXJ/FGT87+JWsbPfjLzaId/UbVWeJHi4m1wK6/00YutYyN2d4aTSoS2CCJ
	HLleT0Ktug4Q=
X-Received: by 2002:a05:622a:2448:b0:51c:1117:c79 with SMTP id d75a77b69052e-52d0b193284mr340763881cf.24.1786365035219;
        Mon, 10 Aug 2026 05:30:35 -0700 (PDT)
X-Received: by 2002:a05:622a:2448:b0:51c:1117:c79 with SMTP id d75a77b69052e-52d0b193284mr340762601cf.24.1786365034749;
        Mon, 10 Aug 2026 05:30:34 -0700 (PDT)
Received: from oss.qualcomm.com ([82.77.85.40])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995ea2e038sm288451685e9.14.2026.08.10.05.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 05:30:33 -0700 (PDT)
Date: Mon, 10 Aug 2026 15:30:31 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dongfang Zhao <dongfang.zhao@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: qcom: Add Graphics clock controller support on
 Qualcomm Maili SoC
Message-ID: <qnkn3p3bcwou5endlvuqr63m2dvhzlt4iocbulnulrdjol2u4b@p72dfaawclxy>
References: <20260801-maili_gpucc-v1-0-9d8c37bded69@oss.qualcomm.com>
 <20260801-maili_gpucc-v1-2-9d8c37bded69@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260801-maili_gpucc-v1-2-9d8c37bded69@oss.qualcomm.com>
X-Proofpoint-GUID: 9wDrXlw2_fqMzugl04Wc8mzQOscbpgNM
X-Proofpoint-ORIG-GUID: 9wDrXlw2_fqMzugl04Wc8mzQOscbpgNM
X-Authority-Analysis: v=2.4 cv=WNVPmHsR c=1 sm=1 tr=0 ts=6a79c46c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=GMu+mMXmPKlJm/I3Pt7gOg==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=fCNx6FN-KcjCUQZW59UA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEwNyBTYWx0ZWRfX2fHPTO2oN/Rv
 4jqfdCMof4PFSqI+8LZs3f5rZJ670ToeJQ5S5go1MMvYQ65WVsnnfAt6gt0gmV/i0jEvzFpOc7h
 wMUFBnroOwWeCrovRSRxEGtldSau4sXS8RXc+ddCk0H3LHiNaEtB6/JISqDI+E0HHLEdDBARMw6
 fI9u9sWGmmRS1OVEoiWOgN+A+757x3/Peu0x5li8aLKOZNttXxHdtm9LuDjlnU1haUIjaaRIkxt
 7J96mIW7BFe7hIsy9dFkOvvraR+HLkHTVWzGpnozLeQVopiQ9nF6/OMDak7g1ZOH3pK0rU2zfwQ
 7qj+PW5aKvA2zP/brn0VjKAwsydYCIClm3ynHnf94IjVfo7mVtdTheMMaWcu3m4hRfzUtw3NAjz
 ZTHjBJQ7DGuXej9KYl9HW1I7eM0uFbAKeoR58+D85rOzUhNSt/bC9nhoaG5BraL0WwUSGh4ULsa
 E5hbSE9XjznhQQHNRKw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEwNyBTYWx0ZWRfX74xFu+RWG9xT
 dTo11m9/Mzk0/cZbKG7xkKn+1ypl++iwzmYftfk/9yj06geqSvmlLv9isO/LVHOisil4W9EV6pr
 0/3L870oAcdHV78Myac2rIxHjN5En9Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100107

On 26-08-01 00:42:46, Jagadeesh Kona wrote:
> Maili gpucc is a derivative of Hawi gpucc with pll0 configuration change.
> Hence, reuse the Hawi graphics clock controller and extend it for Qualcomm
> Maili SoC.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

This looks neat. So:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
