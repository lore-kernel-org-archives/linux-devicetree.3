Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515CE33BBD0
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 21:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777412622; cv=none; b=mY0WVriIvxe96clXXwRMYev0OLbG8+e8LI8WPEIsV5cYIYHZ6Dd6+GEwqrXHZ1NI9LZKNPKzLb6+VzfsR1Q9eEgc5k4E3UJ8J8pkdyVv0uhu/hK4dCMzXJOl0Ep/Gemog5+IiHpWqHxGQuWAWJ0Dh94WNO4JukLHjrUrSk83jvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777412622; c=relaxed/simple;
	bh=7/CUJnEWOPR7pSRSxia2dGFhO3WsFu7RsSGosgpdpCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QPSiJFoysnMw598TdXtwT4VCGVwlFosfLpkuepadkfydsc5TPcN1kB0rmp2pap+lWd5ZvzAgRG/XiNWs5/weufk7vPplp7AMzQs6xE4kF+6IROojtVYu4Hj2G3viw1dBJ9r0e2mrOIzvrh+UCmLP+zgttHE9iXMR2RkggP/bU8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=odwSN430; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZD3uzTz9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="odwSN430";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZD3uzTz9"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SIuLO73347448
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 21:43:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FtBo9Xi2atJTWa9QzCnHBCs6
	e/jBGzEmlSQy2fRKipM=; b=odwSN430JS8fFZTbbYHehPGUYf5P01CUVwa7ILlO
	50MvI2iKDRZJjYS8oSfnNTKeq3rpkmd0IMDoy9nonzhA1uDENHW1wuDwyGCMAYnp
	6EtLIJjJMFOeIGWfBljh2ojPhgHo7kn4ALZwtBKi7nfDj5UL79L9LtJlLoUH4pHC
	NSjjASERgwlEKI++hpnwyEtwJ4H9k99NI+Rd+3/utDRK4TjjcqqLw1NacRfhkuZ9
	U90ZEPQBxEZRmWJGbwN+T2n7fSFj7NRUA/aEpdx8mXrm1bUydlHWMYvW6Fqa/LjS
	id+bFnzPfs6UZ5Ai8CmuL8DAGoCGLjKQPvnfLDYzUICtCA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du2m4rfvr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 21:43:40 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50e575a50bcso135756131cf.0
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 14:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777412620; x=1778017420; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FtBo9Xi2atJTWa9QzCnHBCs6e/jBGzEmlSQy2fRKipM=;
        b=ZD3uzTz9odZMQTGt7NpY4QkaqnvhsICZtQS7kxisgh6bFFLuUvPqU5zWuzIGYwlupa
         +VRgKID//vqmBHr+ERoOG/H0fUFIPpKx1DQOtEV0/2qUS7huM89X4Rm9FgBBpW7O/BsR
         Yq4X/C9150wVo9wHNAj2iVABKeCF7aoEuvkhsoGxzXzMMcVGE9+VRbxXYSF8aFui5xqd
         SXPDrHyx44hnf4iNxPmwLU0RleSAZQOjRy8C0x760mUm8qG/yRS93ZGJeNKYAflUq9zS
         GJm9JTUva2J4I5AUg4lHLoi4pQsrwst/zlGESxnpXhNJezLFalvwKbu/fePfR0WxnPHR
         Ra0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777412620; x=1778017420;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FtBo9Xi2atJTWa9QzCnHBCs6e/jBGzEmlSQy2fRKipM=;
        b=gYibC5IiKvFuWTm+PfQMSLOe1GR7b5g6pnY71XhGRwc6PPAoyMf1kCi801ErXHP4Cg
         yrRmFJaYFMsllvUJzXCrBvsy8WfNWWdhhs2+eRWk21j6C6Qiua5zsMTIHS6AOcSWc04a
         JFOu1poVkoIUiCVKxyPe+hHk8aEupckrx0NikJqCgLjSS0DbI0/lQg8H3n0ZrNZXxieX
         zasS/4GXbJGP3d3v/bMf9R98/Ji+U2ic+TN41iHuVjXhx/jFB1xsRQatB/hwOsGlZqve
         H/fan98fo8thORdxlVb9Gyffs1JaPjMwb3/8kj1nQ1jCHjvzIKLOa5RXfaH5Qe9fDhPt
         GSeA==
X-Forwarded-Encrypted: i=1; AFNElJ9ZqW5vfK070rU/o6qIR+LgQscLRm3EeyFTJuGqS+oWRp0fiiPuY4sOZHxL7/SZ/xnBMEKhXAlHW5bI@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd9apUv/OOlwGaEURGzSJN5j0+YhKHuNXmKoYKGbtlMnzocjHm
	wfffkZqd8ymo+c60FqJZZJf9ZJOEsagfoNBRp978x3B0UP6eHVrxuuuDcLiWOsfP/MYeXlgcrAm
	IF8r7vmVj1pXKGP/yFl/YXTexRoV+7ijraGz4f5JLKJ25O8wo+y9ycxOz/H3V8b62
X-Gm-Gg: AeBDieuA57WupnLo43dDmztNzuaBi0GY9K3J3Iar+rWo+MR27dRQQWKsOaskUppmiyG
	KE/tuB0La5A7qK+y5SoZ80rY74TSA4UZSUSdmwvHCHfmoKsWkcqZBYROIjpCpGfuRi4LLo6H91b
	J+gZbyYJJEejHDUKT43MQHJQnJ0v4isbTbMB6yUH3JZ2ZhbYFBJf3vzgh6YPSiM+wbAg2O9803K
	8L6jbEIiavmLlrOgzyD5SUxc76YspsfCVqjDC51V+lL9GzREu7xkiyqXqecsMBdwSkvAirTpUJN
	Q+Mw53+ldynV0IyFg68z0Xuvhnx+y0OgosE6YSRbuhtS/UETWt5EqkLx6Mk53/hI1S752tPeHqW
	bTSqdVYMo78ktwGP1rYqV5Y564EoA0UqiTWmGVA+bmBi6+26waJCXdSrn75j7o8Ij0f2xYajV/0
	9bajNCMNYeDo5NBbMcVWn5Biv3iWcwaw67rgwpZ2+1CaBweQ==
X-Received: by 2002:a05:622a:58cf:b0:50d:9f02:86c7 with SMTP id d75a77b69052e-51018970b12mr22176121cf.13.1777412619654;
        Tue, 28 Apr 2026 14:43:39 -0700 (PDT)
X-Received: by 2002:a05:622a:58cf:b0:50d:9f02:86c7 with SMTP id d75a77b69052e-51018970b12mr22175761cf.13.1777412619204;
        Tue, 28 Apr 2026 14:43:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a74a6f4d71sm51235e87.26.2026.04.28.14.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 14:43:38 -0700 (PDT)
Date: Wed, 29 Apr 2026 00:43:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sdm850-lenovo-yoga-c630: lower PSCI
 cluster idle
Message-ID: <iy7wetiel2b4vvksfjxxrnflb4jzcs3vrubtiiim3fe3aqtj25@7nz3kak3gvda>
References: <20260428-c630-fix-idle-v1-1-29d0da326eb3@oss.qualcomm.com>
 <dl35jhcdlclpxssnhqbvu6ae4hf6oyqh4rmavul4helgxwrijl@jbqtgv3sva4f>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dl35jhcdlclpxssnhqbvu6ae4hf6oyqh4rmavul4helgxwrijl@jbqtgv3sva4f>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDIxMyBTYWx0ZWRfX6/WfkJZ0IUHL
 9jR+z2/ZfxTuGp/Tw3QxIOfOE6V8fnYeTdtGKYXeLxzOC97HcWhw72X6NbSGJRiEva8WpH1I4Yn
 6SR3kXfaN+la7vmbgd1QVrVsTeXlOR11pBnNROJnVW9N6g5eTzF0m/lwutO6H2x/IjBgemmbXSH
 pYEV1p7vxi77Q73gs+4I5hPSPJY3pEOTPoOEGt/PDkiJyXeDNJaxiU9nvnTRJZ2blHDKXDHyHmb
 c+TkSRitpvHWtifUW8Y2R5kiy5KkD1njHrOT8SKxvJM6QySijsjxvrc5haik17S9GpYknNIkLjW
 OkruHC5t6jIPe8FXQA9udWtP/3/QNADbMLtdK0L6KyuaxRhHraZ0cswI1oBxNbJZVwZhbe7+/Rm
 Vd5wFdj/5XxBJxSjhk059vXQnIkRP2X6aI2O7vfj0+EhGdxjci095tyaFpjyQ0T73Kj1RfExfa3
 ix5wxeCCxnxNSlqRDpQ==
X-Proofpoint-GUID: ULSb6-6eBj1Llm6pdcVq-32B7nu-6Rdx
X-Authority-Analysis: v=2.4 cv=MuFiLWae c=1 sm=1 tr=0 ts=69f12a0c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=seaX-kzRb6LWWMeLc1kA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: ULSb6-6eBj1Llm6pdcVq-32B7nu-6Rdx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280213

On Tue, Apr 28, 2026 at 11:38:30PM +0300, Abel Vesa wrote:
> On 26-04-28 22:36:49, Dmitry Baryshkov wrote:
> > With the default PSCI suspend value for cluster idle state Lenovo Yoga
> > C630 isn't stable enough. For example it might reset if display device
> > isn't probed early enough. Drop one of the bits from the PSCI suspend
> > value to make C630 work in stable way.
> 
> Now I'm curious how you got to this new value.

Good pointer. Let me send a more obvious change (which I probably should
have checked first).

> 
> > 
> > Fixes: a1ade6cac5a2 ("arm64: dts: qcom: sdm845: Switch PSCI cpu idle states from PC to OSI")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> Anyway:
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

-- 
With best wishes
Dmitry
