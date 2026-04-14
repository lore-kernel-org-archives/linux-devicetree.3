Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8089D30EF68
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 18:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776189870; cv=none; b=BDFCVEI54pgnfF5aFb8B9RA1oSrHfM9b4smgOn6m94lpTCJoeMmKNS0PrdWljqjgqiz/ayvLpktFBKPBykw+nhUJJFVDDGEvaCEJK4vRPtqm6cfBgQXL7VELO2ADWoej3Dw2FTiru61XHJVMCzVzSW8Wq8gVhA1BHszAOFBpuSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776189870; c=relaxed/simple;
	bh=+DmEO3agjpejWBg2mW/6CdIWQlSayhUmi914wcttxEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ixWt5i266qkO/UIbpRXk63RkC/lf6lH41OwuchH2BlV+k++gjgdOSq/nGdxkA3Dt2UV6Je2FmZr6rYzwkcqfLm3jceGx/SjYgJs7FENSADsX4W901HImCpMsqhaj/cxxlB8BnZhQZhyQYnJu2tLeG2LrFAkE0pYKmPbAdyESTmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WpHJlVeY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kggTkXgh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WpHJlVeY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kggTkXgh"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EG3NF5966064
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 18:04:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oqpv8OSvuRbwulk9/BF5xMtF
	ktZ/FhaWStH1wxOvczQ=; b=WpHJlVeYm6dKBx6tro3TSplUtlwX3zCa67fLz2g5
	Gu43HuISgfpH6xH+shawK5RtzyzQjHL2TxqNvQ2SIJR4B3x3rM7rvQZ/ExBE2qrG
	MLfVr14Lr+1CVDJ/gyltVNCVRNhusk+GwH6Y+rdHG7zVXFLywrzVJQzN9OKSolHU
	hOooU8CSv6sssAkTQAuc4ABQhIdDD8yN5/nOzea/qrBrYuONrn8SqZ8wi14Xld9y
	Av1KmDgGUOheJIU11K/XKbre6ieEUxUJEobAlXR841kicrBb+KIo0LICqcm/evib
	dec5Sim4oMpTrfalNWcq0DKfUiGE6AT+ucde03NCVTgT7A==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhrs1rgnp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 18:04:28 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-953e8999d8fso10691823241.0
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 11:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776189868; x=1776794668; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oqpv8OSvuRbwulk9/BF5xMtFktZ/FhaWStH1wxOvczQ=;
        b=kggTkXghaRA/hU/5YroIjv1u2th8+YPDFkWx9NoIWvDjDvfSqVRKBs0ulFiZyHTUSP
         sNzCS5Oa9oeS/z7Ih2EnWLWPX7PSH97pX5bGB2V51JCrSuc6/fP+ndynjirPyekD8WmJ
         0hWS8qSAlx+TUrNFSNqJYgZU+1mMXQTx5Kd86y5T59i0zBaJggMDJE5ulax9fhdb0Djc
         clrNwiJ0JwI1ZxPTbZQlzX/P2RqgTethZIAtrU4PTweK+eIACJIUkho91T3GfiS9AgEA
         BArEAelNikohNnKWj7PWGawCGf4RHRUpE1W3DXSmEjMV0QtfiAcVG3xTtJG3T9SXk2Ou
         et3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776189868; x=1776794668;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oqpv8OSvuRbwulk9/BF5xMtFktZ/FhaWStH1wxOvczQ=;
        b=QBIlOohsBPL9OsiHSzY6FSdcsD7BzsJGfkHDRhQwHJuTrCF/WyPH/8siG99jpjWJb/
         LIaQNyFuqtdGLVXUDeiW9A1/laEKEnhtKSjSh/NO1lSyqVFoh+jOBAVadm73fhdj38+b
         FwINhf1i2455iZeRpSsajK5CqfIBJ5xBSafgPmeD8XD8YcRZThitinUEhff/f/ej0jQG
         2lrqbh0hp+ipHbYP8ZPTy29s25wmo96bVVGBCyypC7lc/vGs7YtaClG5HenUIzIOaV4t
         AOQRwaBSMquJZSLGhSpFziEcRaeMxctrCTEUovNVDFCrNyqN0WwF9sZPBMte/rwNnVEh
         6Jaw==
X-Forwarded-Encrypted: i=1; AFNElJ9g1hq630W+/Dssjw9EEkfbin6YlofJ4589YL6KG6hwVHBkctCUqK+rtQaK2aByJyGlVoetaqKuYjM5@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4SlgcY4i0IcfNE8xwThQ1zxlGPLnliLnIdD2UuGKwPIBWd8mg
	Aje5AU2mvQYfOfviA8NKtzmgitmgslY5IluuYd1yRf8nZ8K9lzDhiPwkbHlxwFEdEjJ0gK263Kv
	eOMNprW5RLxpIJqHOaLngcvJyrVaxp1vsbN65w0O/dq+G+Yt5d2gjzwkGUEnatbHg
X-Gm-Gg: AeBDieu8iizgdhz59DYKYOMMfqHM9CIUfliq9uAf5Wdece6a4W6WWOhoaUzN7oQwNKg
	KjL5CfgNm8gbzOKBH2VivAKf2GlGBRBa2ay2JuHLyQRlzP99u6CcRIs0tYeowd84nP4VHEWrvdX
	jlTkEACHuRUcJ/6G+Lcoh4YsBnuHioEGoodQarQV+3pRR0ixfTM65yrN3EhLh7crfhF4/9wcuKC
	1ppSfurN3u0im7o8QNB7MIzUXf2aIhWwxilXMPwmlvCJH378PzfNcmB5RClWFK3zwoQsSryrQMO
	1g7YqHO2OEb/sM3d4HmMlJVH932N6CfrUoUa1OoPIEULQj1sKmnlAVLeC8Yl+ZrdccPNF8CsGN9
	pocOfnLr/iL0cPX9Qevu4v/ypy/kIU2qBb3GWj1OgFGhV8N6o/Xp/XgndMCs8u8hIUyN7hUmodb
	L6zOrsyD7BaDgT3Xw0kIMf7UOEXrZ89Lt8Q4SN3Mk9q4OpNg==
X-Received: by 2002:a05:6102:d8e:b0:5f1:606f:2a14 with SMTP id ada2fe7eead31-60a00f4953amr8894963137.23.1776189867670;
        Tue, 14 Apr 2026 11:04:27 -0700 (PDT)
X-Received: by 2002:a05:6102:d8e:b0:5f1:606f:2a14 with SMTP id ada2fe7eead31-60a00f4953amr8894910137.23.1776189867232;
        Tue, 14 Apr 2026 11:04:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3ffd12014sm1258141e87.41.2026.04.14.11.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 11:04:26 -0700 (PDT)
Date: Tue, 14 Apr 2026 21:04:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 03/35] irqchip/qcom-pdc: Tighten ioremap clamp to single
 DRV region size
Message-ID: <wvccqkr7mxhub4g2a3ngn7baonqo4k3ujpt3ceh6apz72lfajy@dewzwf7stl3b>
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
 <20260410184124.1068210-4-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410184124.1068210-4-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE2NyBTYWx0ZWRfX5mfdMPLwe6il
 W0SQjjBgq2PrXLWuw/+0LaHz9Q3ZUTywp/GAxGYtIbEDkAQo2ESmAboRaNe1j67SZpcrth22/TQ
 +7N/wvlkUATClGH8ULoBWU4n/x6Prc7DH7lA5ZT8dUZLsdSnxgc8cb1q65ijoP7xB3f6dWRZSGJ
 VfXtmQJxObFX4IKqf7+dJlb/Y7UWmIbI0qJwhHk4aQj6MQLM4BlZCzo/i4P4RRcNpbGLvw5lhAv
 Kqv8qHLthMSb0OSWyUaz6F8M31v8AP/bMgnlul8vf673xbNDpzfIw0N+AONF003MozTouGTkOwz
 6ViaEYhcJ0ROranQZ0xCArnGO92vHpkR+qVCpcZsWfU1Bv2WGEZbRQXnXEtLdzE236cR1rtm8RT
 kNPzGpUkFTuHdOIePrv3VR6OazoxljVTIB8G4tX0MJkDQXPrtWsEPr8QycjF4pkVf1lKQkz03BP
 RfznEGxbEM8mL8ht/DQ==
X-Authority-Analysis: v=2.4 cv=T5m8ifKQ c=1 sm=1 tr=0 ts=69de81ac cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=PDkayDdhMvzo2kSqcdMA:9 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: tXTQGbUi6XXlZUFvvMFmV-YZnJ28u3rr
X-Proofpoint-ORIG-GUID: tXTQGbUi6XXlZUFvvMFmV-YZnJ28u3rr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140167

On Sat, Apr 11, 2026 at 12:10:40AM +0530, Mukesh Ojha wrote:
> The QCOM_PDC_SIZE constant (0x30000) was introduced to work around old
> sm8150 DTs that described a too-small PDC register region, causing the
> driver to silently expand the ioremap to cover three DRV regions. Now
> that the preceding DT fixes have corrected all platforms to describe only
> the APSS DRV region (0x10000), the oversized clamp is no longer needed.
> 
> Replace QCOM_PDC_SIZE with PDC_DRV_SIZE (0x10000) in the clamp so the
> minimum mapped size matches a single DRV region. The clamp and warning
> are intentionally kept to preserve backward compatibility with any old
> DTs that may still describe a smaller region.
> 
> While at it, rename PDC_DRV_OFFSET to PDC_DRV_SIZE since the constant
> represents the size of a DRV region and is used as both the ioremap
> minimum size and the offset to the previous DRV region.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/irqchip/qcom-pdc.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
