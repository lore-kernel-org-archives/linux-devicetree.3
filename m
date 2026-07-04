Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F4E7262B
	for <devicetree@vger.kernel.org>; Sat,  4 Jul 2026 00:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783124599; cv=none; b=VP7LhB5tOQiq8TLBzOkhXLgHCysoZa+q6R9PdAMtcdKy1P2iRPZrHjGzEHKkWEMv1XSBbOVYe6j5yJPLB1jAE2IbSkzEU6zo6qvzUmnH8QZjEAswhQdgtKiTtJXM1tIcZcGM9IZQchMYWi+UyIPoa1ZHXHb1lfP2PyfAoMwW6t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783124599; c=relaxed/simple;
	bh=KPZo42l65hTImjZ55/y4AAsr6m2lG5IImpSre4pcMjc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZbCqRq3xcVEcRrJ/KhN0nEjbOu2UgAsDisfE0v+Px3ZzFsFyq1+8Hx67YayCNJEphxLq/r8wzQNmUQ4EoEwP8rvu2xqrce1Z4xbr44a6O3Uv3b6RvNGX+FZqgis4fHrvb/gkfopXuPPNjB5/6JaF/lAWAqPvOypCOvOTUIQc+vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p3yzhfuP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X9K63Pw6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p3yzhfuP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X9K63Pw6"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPRxp1021409
	for <devicetree@vger.kernel.org>; Sat, 4 Jul 2026 00:23:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5OVmVCNKgOLLiZI197tnD6iA
	z9XinbgJfYuM1B+BsNs=; b=p3yzhfuPiXmLYOM0JzkUf3GCCJN8wBIVk/zuXW8h
	kzAqLnnwzdzDU2dIXETT9lx6dBA+/+dvYKeNXd/IZpb8WRlSV9ZfEDShaTMdf+Z3
	P5otFKNFl6yYLPral7yNv32hWU1P55SOtLvMqsK1S8YF+wPQzCtzwaN9dFgqbyDX
	HAERCB2IZiW0v76hUKS7petC+yw3JXAwjHshZSSQ4N+V+yjz6fpk+DWZFykjBqqN
	8y0Xxj11JQO4TxWSX7qL5vnrw57HcK9nOu78Xvwy4PamOnXw7kJUSrQHnoEu9RMj
	Qw/0v2Y4lCJVbye7ViNoYoXCsiKFo5UJS0Iw+Y84AVIalQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f68u3358h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 04 Jul 2026 00:23:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e5e38fbc5so90872285a.2
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 17:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783124596; x=1783729396; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5OVmVCNKgOLLiZI197tnD6iAz9XinbgJfYuM1B+BsNs=;
        b=X9K63Pw61fDqAzvmzSQV4SPgsOzhgS3Gpz6muSa+LTHIFee/PMGBbom4i/oXEuECAX
         kOyGk0e3yRLupaKdpz2otabMoEjCtrCz03mSEgU0ctX7g9JgI1iWcSk1bn/biCEHWo8C
         eycc48E4ZOUhCfe9yqq+6ww2WSpBADGu4WMM5LVos8LfQGuxbHAP7mspM6M74YQSAZcr
         TaDQCAjLoJo1blHbVTJLWtCTWIZFbO6FcsYu8HSuhRU1vGJIoPt0QvDI9KvGCw+bE/8/
         kX987vhbvN4LUd/3ZymdH55aSS9CZ1iqP2KnlvJiqmvpdAktDR3h4J2eSBinBn5GD2SF
         lFaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783124596; x=1783729396;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5OVmVCNKgOLLiZI197tnD6iAz9XinbgJfYuM1B+BsNs=;
        b=jWhNzRkfD1adtf61ibiKCUF5iSFEuJrZKH04uclFURTgmhNeW5KzI9F0swY0KlVDV7
         ihAdJsbJSAAiIuN6Pl1iIP/L1pHFTPqAqgPD3nwjm4iXcTAaaBedrr8PE2SaHt94ri/G
         24lsvihWi8FaNdZhrrlAognp/D2T/fZEE6XDR2qPjpOCZA9cUTS0vahSKu5sovwn/i49
         NcKPqHKMwC5PlaDxdCDtmbhVSe5Hf9o4FAVfHDmXgpp7P/ZKn2DjlJTsu6gHjx1cytyR
         jGIqhDUq/lECG+4jU9Il3zVFElMA3uOaaKAVU+twkQd4MvLQUVzVSmnQYNAK07wJoBeH
         /xGA==
X-Forwarded-Encrypted: i=1; AFNElJ/XP7vfkFATF5hegqMPY4+xIZaT4xsc/tndXPXJR0M2kLum1UFq3346GK02S2GPSFZPOTAY1Cuc5eIk@vger.kernel.org
X-Gm-Message-State: AOJu0YwDR9qJOfDkxpM8uPaAnmQA/cA4bPnz+aSlNx6QOWOalx//8saD
	70MSXe/fmoQBS9L44vjwZX/3HODe/lt/iSCZ7QG/V52aJ12hDy8SJ4PIr03e7QH+njEiLYHKfqQ
	fAEcEw8aq61gdNr+WHBBJ2udbDzPLsfQjIQ+aIBK6EvVzQ9wySmtUTm1DSYqRpzzH
X-Gm-Gg: AfdE7cmxLwuyBtjRN5SgkWAFZYmNQsguY+0Ou8/fzSJslLs/geHDlFqCHfYbqPF6kMl
	2XR6Os9VoXLmyrSumF9J3fw27gvrSa0Mtw04cFWoBM5HrzIqnV0fFxxRYA37Gs122KpvO4rxMzT
	K03QV2gk9UTjqyTFKDZn3FXSKzEj4exeifDbbk0ArIcSWmDfMS+TbAdJcEA2TP1+wqY40olxNwV
	o90EYgMo9kMwwaj6Qj/sEMxzOr2k5/bWeuP/5umpUAMhYBEZVwal3ZQOJJeLzC3Ymh0b9wG6TNJ
	g9jAbR35QU+HdoZWqqo13STxs7R6sIy532Y1o5ZkH7A5Ji9VOv0qVO63h73H3XRou1BkyXz7utM
	6/OYFUOemRo/0edTXHrDEdWmQJmzCcXdYfivrMrE+77jhj7q9KGdZgObmo9UbFBcgNHz1LgqeXQ
	GmSkeO98tbHRW6jeOYfOPdwlJb
X-Received: by 2002:a05:620a:700d:b0:92e:64af:3e59 with SMTP id af79cd13be357-92e9a512f0fmr246529485a.67.1783124595808;
        Fri, 03 Jul 2026 17:23:15 -0700 (PDT)
X-Received: by 2002:a05:620a:700d:b0:92e:64af:3e59 with SMTP id af79cd13be357-92e9a512f0fmr246525985a.67.1783124595311;
        Fri, 03 Jul 2026 17:23:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13701a7sm866645e87.12.2026.07.03.17.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 17:23:12 -0700 (PDT)
Date: Sat, 4 Jul 2026 03:23:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 15/19] clk: qcom: gpucc-qcm2290: Park RCG's clk source
 at XO during disable
Message-ID: <pct3rk2jr5ed3apeniqv26mmhkye2dvzkxb4banvvnbn46jmq4@vgde7zbudux7>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-15-cc13826d4d5a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-15-cc13826d4d5a@oss.qualcomm.com>
X-Proofpoint-GUID: ZLlLNww1DYuAXs3pAeNzz1b6Tzduuwhk
X-Proofpoint-ORIG-GUID: ZLlLNww1DYuAXs3pAeNzz1b6Tzduuwhk
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA0MDAwMSBTYWx0ZWRfXwyQ4rMraxvZ2
 vTazyftrzqfDV7nS1+tv1xD9CP16OvNkgLubkUWACzrcHYpdfV5FUildrg3gA6NWfdmVyx7vmh8
 Jv+nfge6qW7mslFmMl4QSPWu66B1ipw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA0MDAwMSBTYWx0ZWRfX6tUoOa7ALflI
 7UbhJjoRwlABpLRRqcRX4mmZYBBrzrPfi+FEwBdQLrIQOnRj4Lo/bcKekKSl7dsQhSt/IkdQ5La
 84S872EovPwVgCBBXtBtF3CiVs1aTsqWphqYDt5EDoRNyDYXvAN8gnAzb8VwrKVieMlsKjHitMh
 swyGHvAT3vFKsUchTi90dwoklBUhr4unKz34XnS6O3N50uQW4uKw713iwYESFTLJs04PSh6xR0j
 f8IdYWNiDgVZskteUr7z3A+HpUQEXCIkQhHnNMzstKWhWNgDT4Ap7IswX/NqquAXveNbj2zkYiO
 gfNWJsxSm1v1KlYTXBdbAstjCFJQYykExFQs7aNW/F01BtHYW4GCOcv7TfZ28P+oho4c6KzJAtW
 g+LnWbelm/roKhIP9W25fJVS1WonAzBoHQuz0oxdQ+QthPOuaOQgWjLQ+7xjSJjN9y0JBt30Vr3
 wPZj9ZQBBjg46KCR6Iw==
X-Authority-Analysis: v=2.4 cv=OaKoyBTY c=1 sm=1 tr=0 ts=6a485274 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=OumLNwlXtCAUlcyMYLYA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607040001

On Fri, Jul 03, 2026 at 12:01:37AM +0530, Imran Shaik wrote:
> The RCG's clk src has to be parked at XO while disabling as per the
> HW recommendation, hence use clk_rcg2_shared_ops to achieve the same.
> 
> Fixes: 8cab033628b1 ("clk: qcom: Add QCM2290 GPU clock controller driver")
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

As a reminder, fixes should come before all other patches.

> ---
>  drivers/clk/qcom/gpucc-qcm2290.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/gpucc-qcm2290.c b/drivers/clk/qcom/gpucc-qcm2290.c
> index 78797b77d7c7ba053201064ace3963cf2bd5281f..fc33d82bcfb6843307d002d67674253f0174cb4a 100644
> --- a/drivers/clk/qcom/gpucc-qcm2290.c
> +++ b/drivers/clk/qcom/gpucc-qcm2290.c
> @@ -144,7 +144,7 @@ static struct clk_rcg2 gpu_cc_gx_gfx3d_clk_src = {
>  		.parent_data = gpu_cc_parent_data_1,
>  		.num_parents = ARRAY_SIZE(gpu_cc_parent_data_1),
>  		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_shared_ops,
>  	},
>  };
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
