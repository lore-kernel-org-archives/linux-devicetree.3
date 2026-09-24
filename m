Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E195C44238A
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 11:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790249199; cv=none; b=USVU/OZHU6dZOQnCt/f2unliur964jpNUccJaK9x7Rci96h8WntN2nK8cpzjVOHybtfgGn5TeNmHORNSuC2xk2eZSHcLAG2ZhSsaH3t5ebfppAMu3qpzKDAj+/VEKBU5B9PTYkj3Xpaxrq4JVfHOHWuzewawvBpVbCWWQtQ7g0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790249199; c=relaxed/simple;
	bh=/Z4vt1sZisFgwjFGYsD9AMj45o0OCyK5HsXd0f02nLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IpKBCYhUgL0acMQoPTmMEC1XJZAJqjCR6pSvZ6eP4puLbs3j0KtAePStOBVwhbe+sXlm7OgpAsPPIXT1jyjGmNtQVr9t07lXyRP3TI//D9+PswjjOnB8R3Htpmfa8vCg/OMMDpOHvnwXrKqOw0OK1GKRLBWzVex3z8Thwif1Z/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AkBIMPC+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HG2UBLX3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AkBIMPC+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HG2UBLX3"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9PhgW1270219
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 11:26:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FluhcHGj0zIp1x+edRPk4zsy
	7sg7V/Dwe/xU2mNaGds=; b=AkBIMPC+1zH+THqOWrcUCGvrePQlvAlO4pQNpOXw
	tkfe+wZRkODxGtd8j6PUorWR9Y1Q2sAhhEsSMGZlys5cW/2Ge8Grs/qZ3Wsh/8li
	Xe2bTXAR64ddOMXEQvRKXTqIu/AVs1On1Ug/2hloN3MgeB4tgmWxLop8dK54UpRv
	KPwxnC5jihh9eVK2vzorg4MFHeaf7O/qFV0v/EM/PAZ85GHtt8FY+XVJIVG8NayA
	Hl84iiZz7t43RK6D3vfczzEma/CALHnAKk5gz27yC223Lt9e+y48tF/VttYDJeAC
	oCXzr3b/TaTxXCDRKMuk9irJsE+3XkyHKZqjvLy0og8zTA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvr90as77-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 11:26:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934963b2bc0so398105185a.3
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 04:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790249196; x=1790853996; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FluhcHGj0zIp1x+edRPk4zsy7sg7V/Dwe/xU2mNaGds=;
        b=HG2UBLX34rg0fm1cCC2xEMOWPF2aMU9T1LG3VPORV9+z8wg2in/L2xK57dfOIjuYED
         jKX37UQLuh/xjSCrgq4zU8e+dMprGJzIJUddmhfawIutSICxB4Hecz5CuFAKxvt8Crx0
         e1ncXLwLFpAybjStOOBkU3GNtSBzm9kSXsOedgrxrn51NrFGYSPlgF3nk6KuZ+V1In5V
         oEbq5b+txsPcTF0MIVfQgiegbHvDp6rx0kl2zpEJL2vMDFbSZyq2YRDNLRLIrr3/AoOf
         pV9Bv7U2b3WVpFBOMiF7P89wTdGd6/s22sQ7mHv2xlLl/SDkLg1JU4xWfo7Gs2d1mAxa
         2GVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790249196; x=1790853996;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FluhcHGj0zIp1x+edRPk4zsy7sg7V/Dwe/xU2mNaGds=;
        b=Zu4TUtWj7hD8rR9HcVsIYJ0qNgOvGE97Idxtu+WbFV/PrkDu1/l134bktulMoAgcsx
         5lu/V9XqgOOKbhVc3g5Yy6J54WOqsMuzsNDJcrPeUtgcpQwUpwkfIOzf/OcvgL8TllNM
         ETFAl0QSGcMxNzJ+v2QCWz+bcOb34+F/JqAQufgcWyPxjGwnuXtQWMiYFXnJLcB7Wn5R
         //sZf5xmwwQI/RqyobPeCiZx3mxBS1OOsCf8Bi0JFCKoQ2OtQ47duhSjUugNJxEw8MnU
         /GA7KUFZvavIoyjbrwEFdn8dtzN154j76PHkYx2TthoHi2a3Txt4u5f8CBDF2U/VWgyQ
         VRwQ==
X-Forwarded-Encrypted: i=1; AKwUvBx3thawz63+0m/7M2b76+FJpM5KKhjXnKjg6D/l6Tec/c0grHrS/tce8Azl2L2h1b4awCdpMJE8q8v8@vger.kernel.org
X-Gm-Message-State: AFuF++lcEmRA0Jkwtp5PdgDgWhC4m+Px2BBK1cpqpa4IBLK4+DxeRZ5B
	35TroxvoAsM8Hp0B498QxE69o65Lbr98opNUFx+qeJGFrJW6wV4Lh5fmcFeMoBKPjf5gQIrrGtU
	7Y4zL4ieuxwUKNalimBEIzwL5sP0yaKlIMQtpJjoKyoS9EuPhk+3fzcTWlyS/VPTs
X-Gm-Gg: AYBFou1OeUpFw/C1jf9fL1wJZWjHNcJ38gbqtHqR+mBKxkZXaV+Yviq5+8eTUcMKoJp
	+qgGibjIlKxR2BP2RqXYxr5LGKz/pxPrpwseoNcNnbjGKfeekA7K7hMWdskTnujAXZPX+dQXea7
	3uU02Fd4ENSblpnJPNYK5fMnpAK89+YS+4UnPgW6vW+gsmQmLaGaHy9sGHDJYtgH4Vk5r2kEjRP
	44eaw+qszqgDSoIBO13y0GPHHRDxP4LHjmVXktG3DofVMBT7UuLiDzSk+4iJQI1pN+U/6UlatGX
	xjWoxKjB6PAfQ+YBOaYcAVOIC7vOz+75V/nV0Z1SzMZi5PrI+WGeNqMPsqQJ6i68oVj807YpTfE
	7qM9C/GWKvrYJNI8=
X-Received: by 2002:a05:620a:2b47:b0:93b:d79a:c45e with SMTP id af79cd13be357-93c364444a3mr217393585a.54.1790249196019;
        Thu, 24 Sep 2026 04:26:36 -0700 (PDT)
X-Received: by 2002:a05:620a:2b47:b0:93b:d79a:c45e with SMTP id af79cd13be357-93c364444a3mr217389385a.54.1790249195463;
        Thu, 24 Sep 2026 04:26:35 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5cbd134sm62001975e9.9.2026.09.24.04.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 04:26:34 -0700 (PDT)
Date: Thu, 24 Sep 2026 14:26:32 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: nord: Add more clock controller
 nodes
Message-ID: <4klth6c664hafslo567luio5cx3t47moupzsowsqpcoskmqrob@35jaicyn3kbs>
References: <20260924094448.1030807-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924094448.1030807-1-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NyBTYWx0ZWRfX7r2RXC5Y0Dt2
 EPjYm8Qc079lHeLTVv7980vNzZ0KEXJif5vB5yq0VByawkJn4tn4yoGQTzUQ9UNc2wv3IKVaw5a
 ZawJpMiEC9tEyGLD4uVuYUPuzcQCvGM=
X-Proofpoint-GUID: 4Id2z7wMCoPTnQMCTQ-_BNG-KvNmMWMk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NyBTYWx0ZWRfXym2czcidzw88
 qoC9vizsWGQ9PfT9BtLyHTN7Ov2qBgk/VRqfvn3uRBcsSMiPmvkWeFFPfzflJWNHLkBdFVry8B/
 IHwKf2e8t5UIZzPpXaYeLYAB94NYMcjlMKbaRcxmDBtg8TzA8scv+W4iKtHG4Y0ANM6CpUdN408
 sodnQAkLtBr44X8OVE5MdlX6fle97GlITTo+KfE3E7s5kNQRW3nyWnO11S1OtX5JcrOHAOIhwpQ
 H5zb+YEEvvv81Lue6dbEOc2bH9xJpB0Z+LUIHQpmwMNibMo0rmcfV2KkaHnMsT0H+/ZWBqnG8/v
 IZXW3/95JDHUh8xv4lII7DSbbZPJlEnwvICgiM9oO6mgMSfrmFRUq68gwvqE6uqIN4bXfon4RR9
 4QCcd+r3aZUlZjiVRzduxyghqat5H+mlz1iHm0FsV1VSoPf9czrz16b4vWjsF86oCUErEMcZafL
 R3rm+es4ILR98mFlsQA==
X-Proofpoint-ORIG-GUID: 4Id2z7wMCoPTnQMCTQ-_BNG-KvNmMWMk
X-Authority-Analysis: v=2.4 cv=fMusTpae c=1 sm=1 tr=0 ts=6ab508ed cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=NnZct687kdiKRUGfDC8A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240047

On 26-09-24 17:44:48, Shawn Guo wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> Add the GPU, camera, video, and display clock controller nodes for
> the Qualcomm Nord SoC, along with their required dt-bindings includes.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
