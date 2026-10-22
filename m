Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792665321;
	b=FpffL2I6MRYRbAOj0ENJ3gelQnRBABdIXJp/C42X8VZBE+n/CsUq1IflUVVHEzCvc78s
	 vvh9s8WNmP7qcOcVWhDsT0q/Nn8rkkEA9kYHer0BebHMr9+Grc9he8pu3iTaBdX2O59Qw
	 LEYuquk1/64IaaRx3GxbnTR6Ki+9uZXx2xCr9F+bFDOlq1HeCEcaK8Tx9H2VN8tAiZE5T
	 y+M+7zOPr1or35SZvAoQ3cJPLw6jGOkI4Ucq2cjCNmSnp4vR2QEYwIpXi25frluoNpNRr
	 Aiecw4LOnLo0PZs1fue6d4h7IcuD88YNTuLAHSO4jjFB4noqLF22GzWPNo9x0PKk7ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792665321;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=eMMlBkiBglKEFlIFcMpO1HS8+5XdfdFxQcz6LUDiswM=;
	b=HN5BIcIPyXCrDGLRHXeLEvyM9AqLQB4Mfo63SFGrg7ocurjiLuP3nW/1z5f9Z58Sr5eU
	 Kf1YYxtLZ0ZkB6jxdpNFJvZongyAyZo0/Tbc7xjDGOWXbwRMuLHAyLm448yObuKq8q182
	 ewf7M/FaBbDmwpvU1dYPfPJPc0vmzDgcNr+Y2VfYat9tQUyptVCVHgs0o7q55tcYBTVCS
	 saZCv13fVeEhZMGwNBSXg0YCouWA2fbQQidgeqXs2G6C6aUFyunPCVrl7i7hlPGXUYnZM
	 7zZ1SkvLeUeL0hehV+SZnKPLMn/0zry0rsBfCE60TFIjePf8WAysAyenp/GXHfUibPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JNi5VkQn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JJOfSVxV;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BDAE606A31B
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 10:35:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BDAE606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JNi5VkQn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JJOfSVxV
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA0G0E2397285
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 10:35:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eMMlBkiBglKEFlIFcMpO1HS8
	+5XdfdFxQcz6LUDiswM=; b=JNi5VkQnrtvQpSiIzLwGr1FQui4AhDWIsK2hjoRA
	6GxG1jH527R+2ir5wlhLxQj7vi41bJh2lR3QPYJ4L8NRHg/Tm5AhCHBk0wdRhRJ8
	qxeW/C8CqHzS/2OSDJGBbWMx9/5M6qOYubOtqiJABz1Z/viV3MkaG+76cE8LN4Kk
	qA+GFUO878Ymoyz73H9DYJl1ThUUlffcbOrlOWBvjHnQYFtBwtV6vuzODdfgonpV
	ubFi2KqQVCHq4SaTupEXTiu7ksCPYIXBWjbdaKDIadMWV0UB0J6wQOY84p+MuFlr
	0FZylx9LA8BBdnTRTL87zPf+2LVUl7wcNl4pLaS6iPA7uA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bt2mm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 10:35:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93909014c85so382938985a.0
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 03:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792665318; x=1793270118; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eMMlBkiBglKEFlIFcMpO1HS8+5XdfdFxQcz6LUDiswM=;
        b=JJOfSVxV42wRqAx4xZKEN0UI7ltOQZYSX27xRtzPuB21TFGfOdYb9I0DHSohFiboKz
         okcc3YEirS/kSKmkvb7YJ9irNARsL/I1aJ5HnmiPDzDp7WWhSjx465oRSVgxeHFFyHat
         ZKKO/25lL83F0DrWzUAUdaC8sepsoK9suk3A9oRUbT8kr/6fT6I9d2WMpsAcOlAsTTPf
         oEOknIbhNY1hi7hIJJxdNn+xMDsPtGl3deIxk++Zj1leF/0o+k0eWe3kU5NWgNU2YgR8
         rf1j2qeVsqCEXN/yXhbvuip/h5Cq1bXyohJHEgudtM7KIN0dBVP0SOALqcy8NI11FhU9
         S74w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792665318; x=1793270118;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eMMlBkiBglKEFlIFcMpO1HS8+5XdfdFxQcz6LUDiswM=;
        b=p39te+cxSG5o7FXRC9t3vUTztEeH9b3ACSMoH8k6/7XoOPEBcZVE33ZtndPfI8SKGT
         5HSLKe9+8l3bnKX5J166YemcRvDauQv7iRZoNPEWWwNnzX+1gPwFbQatbtPJldSzsmwQ
         0iRlO7mk/vJCEpEouNQNO95NDT11fAD1+GgKz+hwVADFE6WnFnTikBlTL3fqdn1nELjD
         OtcVwVMmq5DGY7M712ZiHloFYSdGEYivmDL1Eq0t5ENSFpvkwF9NiPOMa6vhqiUXL/Ph
         tev5uS75Kp2TyH6AJsbb97GVe4VweuEsbEPFIzQXbjyb7XO43VCiNeMDEaYXLerM6MUm
         foWw==
X-Forwarded-Encrypted: i=1; AKwUvBzfJESxM30VgWZOfyMTkIcMxKUzLBOoIhlj+cc6l3nEqPHijORVPE+w+BW0PgJwf6RHE9oX5H3R7Dsh@vger.kernel.org
X-Gm-Message-State: AFq9FYK6Ipn2w9QHhIPLyrHBgEVfv55TePea44b+SNt0lojf17sAI29h
	rnN+aGgkW/s0tZopv5+Xd3RuUu+JSRaEdHI6rWMsRj67A/Tze+8SzgP/aiZY8bpSI1bydC+8EUM
	6oiVfV7I2OyI+xMfPn+AXinKZXjfervhSr4Z56EB7V5+cBl/dlqfhXQfWbFi2JZMs
X-Gm-Gg: AYBFou3CbgaVnlHwv64r5R+7BWuaAsY9oN8NxNIXw2KP2xpLQKdKwF3bLDXFlrxoZ2r
	IfC1k0fbCrj47uVtX6AdYKp6I2SR8viZApBOfpg8h2kBpTQUjb3tGSkYT2U/C1EMgaA2+FFTZ3I
	tF8jZSHxlW8C/ZawUgoO7dh3pxQByRzolsdg/WeuTqZBQBZGDf0m6ikTRGxLjvlC8BHzO3qZU2K
	S3vCJGtxYTO+bY9ON6MwM6mX8BO+mhntGSZl2ysN4Ho5TTPUWFhlCL4DYf4OEb2kTtYgWmI0nXl
	22IoTx9nb4OhYiSf2zI8OTwWkNr5ECQ/m5doOsYFyubMc6YxacwY3yOmFOAyvxgy3Tzzrxtimli
	eGR4R5IE5p2MtniJ/TtFUkpXsvh4H6ojDgGtw9mPoqjk9Tla4WaOajNv6fMUIbE5Gof/Bnch/Fm
	2NmbwRJUc9CCTQ
X-Received: by 2002:a05:620a:1a1a:b0:93f:2aa8:c555 with SMTP id af79cd13be357-93f57fad39dmr836391685a.57.1792665318340;
        Thu, 22 Oct 2026 03:35:18 -0700 (PDT)
X-Received: by 2002:a05:620a:1a1a:b0:93f:2aa8:c555 with SMTP id af79cd13be357-93f57fad39dmr836387985a.57.1792665317902;
        Thu, 22 Oct 2026 03:35:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac4f563b9csm7087601fa.21.2026.10.22.03.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 03:35:16 -0700 (PDT)
Date: Thu, 22 Oct 2026 13:35:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: qcom: sm8650-qrd: add DisplayPort audio
 playback support
Message-ID: <u7odzamh4yvuw6c4o3arswpxf3g4uf422pjhioryqxjpsempeq@u3pulod5wuel>
References: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-0-8a189c71938c@linaro.org>
 <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-5-8a189c71938c@linaro.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-5-8a189c71938c@linaro.org>
X-Proofpoint-GUID: C5zVz2hd18MrPplmEb3_VJW9VKgh802B
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0MiBTYWx0ZWRfX9XUp2Lir6f3X
 7Hfs56O/C8JMSaPYjE7Vul05B1RGx3iuss/3AnofeLbj0oM9jh0oIHnTJCuixwN3HOMVrw5SgEl
 8flFlfoDs9E9lDgPh9EdUHhFmwhmgJg=
X-Authority-Analysis: v=2.4 cv=F4fC5ahN c=1 sm=1 tr=0 ts=6ad9e6e7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=lwKPvcPLtPgdvEeQYCQA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: C5zVz2hd18MrPplmEb3_VJW9VKgh802B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0MiBTYWx0ZWRfX/k9pKi2bfJt0
 mUF5Ay3Wxn2smufWFHfc7059yEqZFXZIBH+oe2PC3PAlKetQObgUy/dhZ9/HbIZ9GCKBM+b6DkH
 kw1HIbMLolvthSFID9glEpVzUNE7tAxMaDTTdDBXasGpgBc2HgVpTeczmrbItgs0UgfPE5NZRYj
 vIAU0vKKhyZ9uSvvPslETGXFyRa2STB1Wlw+yJt6z4y1DyOIu/YhJ76ibagSFWvLNvV0eyokCQi
 UhxOJBIwJer5TG1yxH5cLxtz38ACKbMq/1YrGITKMVhtCYa45osNVJN+f+/LDcK7UCgKgqtg93r
 +wjl7RzvPRgeig3ullpeWMu3EUihNNrwNvikuCyPm/wu2AnV01+q+ntLxgdukvdXF4hof5Wk//8
 Jgj8oOyJAMid67ntkq2F6nzTWenLCDS3VDSKbY9Cb9B7A/L/cdTdL1sVbFC4n4pukhF/FwY/8Hy
 GV3fA6svY2oUTyBkgJQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220042

On Thu, Oct 22, 2026 at 11:36:25AM +0200, Neil Armstrong wrote:
> Add the DAI link needed to enable audio playback over the
> DisplayPort altmode output.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8650-qrd.dts | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
