Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3047135E1D4
	for <devicetree@vger.kernel.org>; Sat,  5 Sep 2026 05:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788587364; cv=none; b=fDf/5aCCq9vNxKw0e46qJG0Mizemy8qkkhFVHQ98xcXKY0N3Ang2vdJq/2sTiZwTZmPc+hdGii3zgyqiKe94mvUvFWgSqsusItAAhm/19TBqxugGWPrqq88vvEH+SDEofSwOWxvmBajKXOYRngUTt424giPH7VAJ9KqxSf4/R8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788587364; c=relaxed/simple;
	bh=QsTgVmF9fGNlHhs8Dotl41agIQun695iLSHi1YGphuA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YMDIBIVT9thSFFEYydQALOO7qA0TLO/g+a+V0xKlVKwJxGsElfEyPtPd7ugsAMYbroD/j0k5Jger7TeG7iel+NgFAkTjO53br4WehPabVgO718myFYnczWdaDjvzj0iK1hhWibTf8cVu2nFx3XopoWnw3wJA6UXUwlSd2W1dA9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mVKqV6re; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q3riFkxP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mVKqV6re";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q3riFkxP"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6854qPlY1738955
	for <devicetree@vger.kernel.org>; Sat, 5 Sep 2026 05:49:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=52LwPd8oEeP8aoMnp7OeFQ+L
	TBv871tOQHiSe7XaJQc=; b=mVKqV6rexTYjLUQtZchTmL4fsv16ScWTpEQc+2Ep
	QL/5jAT3so9YJwRPo4L4+bGCqy9eq3eXF9+Q8C4eBk5Nbso1/svOGkctGFy/GX9+
	JoyQQRrBkFb/e8t2iHD18rWAE3IFZNY9TVfs0vDGB9KQY7KAUTXtUy2VmlSrlw9l
	1Tmt/3jWRC617sPZMJzrEpmijiKrwCizA8ST+bcaXK6dTX3c9FH0Obm+vtuauply
	ZLuph5byIU8KTyQQ6BLphCJm1Zf7rlX0kvc4N0FN/hmsekSDoA8AAHzUGYqIJT80
	LiokmLwxsH6gdckFgg0y6oci40Zrak+4t8AYFhdNDk7MQQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gga370crp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 05 Sep 2026 05:49:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e5e38fbc5so292035385a.2
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 22:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788587361; x=1789192161; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=52LwPd8oEeP8aoMnp7OeFQ+LTBv871tOQHiSe7XaJQc=;
        b=Q3riFkxPxsFwHnHbKolsH790zFfjT0EKDPTRxN9HKpPdQwRT5a6FCV2kO344z5vWMB
         AufGKbadGvPAww2exxpUvXBriZUkjrUcNAx0Odx/PtYPAhrYDLkcHtkRCZOualaV2Gto
         Mdv5Soe5M8cBwpBumu2DpA9uXDLZ13VsdhPO3wWbXgw1GFClBtZ8E9rAOmWinYOHLPEa
         VzO6jKI2dSZ30e4Umq8EnLbrpUy+RNy9xFd21r+WtPPZJwZIVKM0ls7z5KRomKeb3NWD
         +WVzFKs6uKJM9fSaVP+eyekPU0fEmCcTA3I/nFLNdYCCy4ArVWt/ROJ1O+9CFr01NnEJ
         EuMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788587361; x=1789192161;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=52LwPd8oEeP8aoMnp7OeFQ+LTBv871tOQHiSe7XaJQc=;
        b=MPNuiMAv9dTdmF25wT5YIs9E9M8pIKe/VhRTQ7WDbcMF3zc+ApfdxGoA5jv+BXYF6q
         8jff4MQt0WNxNdEcIVPJ/1U8Z3On1yOwAWQ9oUzFbvtvaYLcIIwTcpYyRnZnoP0UNbmP
         fyGslSbfY/1eQnUotTQVGSmf7nacZvhxmCjWnX6hlxY7zkv0Rcv1BQIpyS6dvPJCzxnb
         xEotCp0M6/mwDNCZafAqf1zhh1sz+LrEraiHZ7WUMDPWQp/6G/BIIGOy4sN0g43OfXsi
         0FQ7NYOi+IIW9FZeEvTZl6UgceqzxyQTLYino+UH0npk3QLazRlfkOWtjgTaPk0p3OKE
         /bJQ==
X-Forwarded-Encrypted: i=1; AKwUvByY79TiTX6a9BCUUcAqoPWQnEqC/qtQkCbiWN1h9tCEmWzMm4XvoT68TXi3U5uqWgPPdkCJV00VcMRJ@vger.kernel.org
X-Gm-Message-State: AFuF++n718so/76BKWehx6Irf9isgpVlnWpbTEb9VLyhJ8fMLgoIQYCA
	nRbDv7H0TOhLaViDiUExgia9mvMfl1axTD9/f4dRANztjFR8Uvv/kq0m+0G8gy3TMxDwpo6VaQf
	QYGdpbNvA7/LXDzrYtXBMvywz3VZo26X1bKlM31KibVO1bn/P/Zj6hBKtivSvfWFi
X-Gm-Gg: AYBFou3NVmBMsy7TcAfNPVPzwWeHWpp5FeyfsPGwdJ2TPy/c/Ji2IxFIMjsy56h7BMf
	2UeTAh01m3YWfN6mOJvFHqwLLAWPIPnDIkrPdmparqvB0LqIJFocxJv3F85IgHxrQGZt2TAVVQj
	sLzvdJMaj8BX884PkRtst4zPNDb/NW+NlwFzZIS1aGB3EUK8AOs6KQCe1iO28iVd833u5bPPtNH
	mqtl+f2nH2XgSLlHniLZGoHc29m7+95t8G9KfdqtjVBTL4hkYeW5khyy8bbOf15K0QSYtd4rn4n
	GV2teHkXiIcsOk4eDIwPItMy4rnVWaE1YsjOmLVbyB/Zp2gCZVN8bsY5RPrGwgBxe6u+qaY8DFh
	28a50GahMIs2qQg==
X-Received: by 2002:a05:620a:8c0e:b0:939:6dfa:db9d with SMTP id af79cd13be357-939804fa21fmr744224485a.50.1788587361408;
        Fri, 04 Sep 2026 22:49:21 -0700 (PDT)
X-Received: by 2002:a05:620a:8c0e:b0:939:6dfa:db9d with SMTP id af79cd13be357-939804fa21fmr744222485a.50.1788587360670;
        Fri, 04 Sep 2026 22:49:20 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5563c6csm200724465e9.4.2026.09.04.22.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 22:49:18 -0700 (PDT)
Date: Sat, 5 Sep 2026 08:49:16 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] clk: qcom: gcc-glymur: Use clk_regmap_phy_mux_ops
 for GCC UFS muxes
Message-ID: <szdua7tz2cysqqqh2jmkds7jxbfcibdtkfmbxwzp2uozhevo4f@yyn6y53bd3ps>
References: <20260905-glymur-ufs-clk-changes-v1-0-cdff2c67a8c2@oss.qualcomm.com>
 <20260905-glymur-ufs-clk-changes-v1-3-cdff2c67a8c2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260905-glymur-ufs-clk-changes-v1-3-cdff2c67a8c2@oss.qualcomm.com>
X-Proofpoint-GUID: URasAURJ3MdQUW3_UG8XD0wSVdcSjGXq
X-Proofpoint-ORIG-GUID: URasAURJ3MdQUW3_UG8XD0wSVdcSjGXq
X-Authority-Analysis: v=2.4 cv=CbQ4Irrl c=1 sm=1 tr=0 ts=6a9bad62 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=vZgVdhwgRuDMrAwUH48A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA1MDA1OCBTYWx0ZWRfXzfUvSr61leur
 3Ni5uRKvcL+iq/guA/IPACoiQgSt6+8mUULpxXynkgEbKYO4am4o4eXc5MNISiFUXBYDUawSmBu
 PA5olemegWRQqLaorQvw0ijMLrPaRSs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA1MDA1OCBTYWx0ZWRfX8JUi5m7vrg3p
 kCXzaACrp+p7sLpHXe3a4kjzrq9ld8WQSGs7QoSWvwuB+02A3+vSz3y1PaPZEbFSm2o31B7VkdF
 PIaq7hk2VWwbkpsHToxbxzL3nJYe5P1VcW8yM7y+KirNnAJdyWYUWaHV1QKms4qy/UD9w7VdIea
 0cZw/Nfqrmz8LmRTXWCG6Ys48vkMH5H/M67lhpKMlF8Ec/LX9tqt2NO6X5yeaiaih1adXCFp/1s
 wefX9QAW8QW9cy8VEFgMiI4wX1tDQQ69tJ5gPzu+OOr0Fb9x/3AzhR3UQGGenfD8PZA7ynDAyAC
 5jJ/N24Xkl22yUz3J8QecfVvAZczZdqfx4QBC9x3/1Q8z/DhYDBPBvrz6uc2z+/C2We2EbrXv+6
 DL0Ci7N2Dccw4v8o/z5WEQKSaE+43BcNnyszyuMFXnZRLhotUefGKMDw2IWEolUNX2Oo71RcUBo
 YDaUnVEcatCkmOriL6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609050058

On 26-09-05 00:20:44, Jagadeesh Kona wrote:
> Use clk_regmap_phy_mux_ops for GCC UFS muxes so these muxes are
> automatically switched to UFS external symbol clocks during enable and
> safely parked at XO clk during disable.
> 
> Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
