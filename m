Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6BA840B0FA
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 07:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789113110; cv=none; b=ZIRZ4VeT8+bi4CzRVBWr3o/c15upOyvEM5Usbo6Jy3CaI+1CJos+utINmcUNU9mYq0Vi1afqNHJ81TDJGFCleFc2H17zAdd5laG2H2aFwQIKAwCFersYzLjhS216nOp/96OaXpOimKok8EngBO+hGElOtNiUHl5VDu8YBYQfydc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789113110; c=relaxed/simple;
	bh=cJAfgN1KYWp1m6GWysztFt7BByetTfE4jM7/Dt25tf4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HXq6zNr/EcpxQvDj/3mU5ECvYhgV8MpfAWNYEeKTIdd9c2PDCttuLOJYO9/gpuTL+GZ8yNSpPbyLqH3UX8g6QBc4ZjJA3QD6n0VDDb48ZcER0KaOp/kIyypZ9LGxM4tm+ntc+S9vaYMhiW5bIYx5FiQrwW6qgFltbsLySdyT74c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kDGckt9o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=haAX2uTY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kDGckt9o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="haAX2uTY"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7lALl3465109
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 07:51:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rmmrZM6VbrQRpI5MPJAL2YcY
	UInPqlbd0sBOxYA4Ai8=; b=kDGckt9oOH+uSG8JKJXVo6Y0ygPy0pRNaQtXRKjZ
	+G5v66yJ4kE5GbTDITagLUdwv8H4LAUmrAfqjF6A/sH/FDKQVy/gAnYTB5zDW7XM
	PRzWhbmo5e7d16vRA6UNsRn3V6DwjkvdivgCOJI+eb4k/V/OFRqSS+rAFhcXa92r
	1mSXWOh43Bu0OtOCFriLuHLmaVjC7896HO40lJ2APfC0OxgKbzu+jySWtgprRIna
	jugK4Fn6n9+gNgyy2H+uk+PV7Den5Jm1LJbpGwAjuXU1S/ITBdoVsQVjTMK0HiIW
	/X05ikGvRkhJ2h6p88uPIExHHVp8QIMHXoGJSq2pXd/DXg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbdr8j05-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 07:51:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9394ad7f64aso86906785a.3
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 00:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789113107; x=1789717907; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rmmrZM6VbrQRpI5MPJAL2YcYUInPqlbd0sBOxYA4Ai8=;
        b=haAX2uTYlV07oqayI/ltdE4h6aSzHtXd67sRSuWvMAExvex3I4uHTBZo0cZ3hnbwKD
         +OiyWbY8ePCEk5YxyMasCeyawjhG3JehG1SIXPZAmWwBHMfs3HedNKbO60gyCvR1sfy6
         NrIm3SXSykzB2qYj7aiI/t/FDmVJt0CBU91gAypBGuTm38pv21mse5V2LkhEAdSGshET
         xtuesSIfKZNn+lF+ra/mt1KBbpoDN0ot4zpDXdiq9clAgPFmiVZvGgzJiTDGsk7eLAp/
         3RsNPofa3L9Y805m8Ss1aHV2mbSjz+liDeR0XPqgc3r31jD22VuWtZgW9xWGrgyEcpqR
         7ILg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789113107; x=1789717907;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rmmrZM6VbrQRpI5MPJAL2YcYUInPqlbd0sBOxYA4Ai8=;
        b=nplDm2hUoSvxj1Q+QKY+S3FACCtZyuztWnnwkYrvF2lr62PjBYJUvEUKZ/m82erjCL
         t++XmEUakfvxNpjveiZFdtrKfzFfPvLC6LBpgCEYXNSfqQu6MgTmalPb1Bt2is0skdyg
         8FBouYodAoa+rUHo0ZKdhOB0qWXUnUVcZCka9U9Mi1hIcKuByFGMl4HOKl/U+3C1hVXY
         ym7yNtjG54vtkO5yzeBSa+4aYWuJwlDdMcDgcdgndgXdp3/bo75/QC3oGoUKly+EKk57
         zwrcoHXIqUUKH6qbcr0H0+jIXGlG1nVeqDA3AihAVfHTuwvv7NfLgFhdjzua3gzD8nv5
         5fBA==
X-Forwarded-Encrypted: i=1; AKwUvBy+3RISVTCqFjvrpAzY1cOKGd40+YxlHT910fXh3TacVVc+dOdBat4JB3TqgGCOWM6lLnslO7VwwBVK@vger.kernel.org
X-Gm-Message-State: AFuF++mQWNEzNBc+gNdPhL355YnwgNiNlO252f3lsEhndJ/DX+UlbrzE
	F1DwIVtH65y6zI/vkfFrzCn3B8/pV5FSfuFVBenTDYaBWNU+uz3jtpOdHwwFqj68SYJbM/kwS6t
	wx/8xtTxu52ODyvZQDIJQEKE5FaiHj8ymAmdJDIILIcpxlq3icEVoD//xLjITPcGD
X-Gm-Gg: AYBFou3EfrpbHLGeV4jwjQGufNfL57or9WnE/EacB5BuXYs7a92NlvsrzUytDKIgJo7
	94SLb/W99OGRQ9V47iU/AfNEuhqV6iUnbRq5qtP7HXsjhZ/QrZ/YgrMMaNu+Ie5xLyXLcHdPr8/
	5ukl0kXPb4aQ0/ryDD24E/fmrMek/jyrBvKVSrtg1V9EFxcM+sp+JbZ8Lnf/jV/3g5dveFrfxRN
	Pa6yKpsJL3pHjZGumowtOLutL/82WKzQSqBfceq9G5NwhedlcbJvsyjYOfNVmRnwdA6F4cyXN11
	s6E5jRfyydLm6g4EeCZlilivq/rMeH7uwAl6/8G7F+wORVqfFIZ4W1rZ7w1L5KVyT8x5kPlUWVA
	ipOvQUduqHH9aPXI=
X-Received: by 2002:a05:620a:26a9:b0:939:7162:911b with SMTP id af79cd13be357-939ea21332bmr406986185a.32.1789113106985;
        Fri, 11 Sep 2026 00:51:46 -0700 (PDT)
X-Received: by 2002:a05:620a:26a9:b0:939:7162:911b with SMTP id af79cd13be357-939ea21332bmr406982985a.32.1789113106412;
        Fri, 11 Sep 2026 00:51:46 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e636f7fa2sm34366775e9.15.2026.09.11.00.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 00:51:45 -0700 (PDT)
Date: Fri, 11 Sep 2026 10:51:43 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, zhangfei.gao@oss.qualcomm.com,
        shengchao.guo@oss.qualcomm.com
Subject: Re: [PATCH 2/2] soc: qcom: llcc: Add LLCC configuration for Nord
Message-ID: <2ar2mbwsbhmsdodo24mlckgj4fz2au35c6w4zcqorwhiomux3u@3uthjwyommcm>
References: <20260910-nord_llcc-v1-0-30fd1cca65fe@oss.qualcomm.com>
 <20260910-nord_llcc-v1-2-30fd1cca65fe@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910-nord_llcc-v1-2-30fd1cca65fe@oss.qualcomm.com>
X-Proofpoint-GUID: 1gyVSV5t44cdFPeJYb7JPgzkfWJp1Dp5
X-Authority-Analysis: v=2.4 cv=PLmaavqC c=1 sm=1 tr=0 ts=6aa3b313 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=OxrQ4fpuk6iiGASJZ2MA:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 1gyVSV5t44cdFPeJYb7JPgzkfWJp1Dp5
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDEwOSBTYWx0ZWRfX6r0/VS9OPaov
 bb4GYElWdeyCsSsbVls1w43poOvefx14nP+5J4aBTdSZhOLTYDsrD+M75gqBnuy5+KtLSltTAzB
 FksA9Aue+1qlewZ+Fo/DOWL9nyZEBSs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDEwOSBTYWx0ZWRfXxx7OEZlBg1SY
 iaSlkbciSwBAPbqLyueCKkQs0YlN2vXuKQ66TsHaa8gQhSzfQIH0XiTzolDczAUChSC3+64gYk0
 8oEzJsrQKqHiTCL24eTpv3MemwG5+ch1F1SWS6j1+YSYZtDNBLli0w1A3oUR+oOzGNr4RCf20CX
 Jmh6gamnmcxcMNeALPQKLxWOoAIpemHbvdmPo8RxK3ChEVBcKzOiLCHcpmJYac0rgyPKqFzgMFN
 cp/j2VPg6Ma8rVa/b7jZWN/q/Q/zKAs6yADHZn0hhdEbZP3nLOWCIPz8HXBQfoYgE66UqM3UZlG
 yl8U7dNyOKuykvZfY6Qu5xIyhBKrN/rVde+BaHdjSGhD2vr0/Uv5rGE+vq4EagVyRg37JDjnsGa
 6Oi73wSN05if6g8NnbarvtGwRl7cEk1PBB7Yl/y1ey+a6nS7TGmJFt1KNP5ZUmfOKE2o7klNIk9
 WXIa6h77DnWNNVZfXOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110109

On 26-09-10 18:30:44, Anurag Pateriya wrote:
> Add the sub-cache table for Nord, derived from the Nord AU (Safe IVI)
> SCT table and limited to the POR use cases that have a unique SCID and a
> usecase ID in llcc-qcom.h. Nord has the CFG0/CFG1 pairs and the full
> ALGO_ALLOC0..3 set, so it uses the v6 register offsets.
> 
> num_banks is set explicitly because LLCC_LB_CNT in LLCC_COMMON_STATUS0
> is four bits wide and cannot report sixteen banks; a wrong count makes
> the driver map a bank aperture in place of the broadcast region and abort
> on the first broadcast read. no_edac is set because the bootloader
> leaves the LLCC EDAC registers locked, as on Glymur.
> 
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
