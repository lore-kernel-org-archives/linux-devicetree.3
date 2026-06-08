Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E8B347500
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 03:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780888930; cv=none; b=eLQuK5sSFGiQkF9SDQ/lrCf9la8Hue3Pww5jFk/+FVVqu8290Dx7tonNu7A7Qdzc4/2LTLqs1ezdp47EnRCJzLbxDcVW18twxEhR1hLdSiawT+IDcyKNwL+zHfIL/H6FbTfLXlFRKbebhgsZGv2qzn9WDerAy9w8kyunilQ23Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780888930; c=relaxed/simple;
	bh=fx3r25rLt6VUivKdQcgb2nSA7OkctUBrtqGABis58ns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JGQV2ZCRXbk3owBTx1h7bdpLT7ookeLWCwuc0ghwdhq44yyfOfdKJKK71FnoZyz8Zwm+HHxZmRXW9dCi9CNVGOxmMcbq9WpuqEMqWfkHHi11SwAoSI7oRf/7G4ZV0uD6zOmWka3U7aebQMmCy4zue633N7kTNZgU6O2kFDt3moU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HyVOYLIK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g2IH5v2y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HyVOYLIK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g2IH5v2y"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580EVmm1511333
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 03:22:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zdGfDGBoMgDf1nHklX0qM1Jx
	g1iBzheuZFvCVbKMi04=; b=HyVOYLIKEIxJo/YbMRsnXQSMvxVOzUdw3xKH+iB8
	h9JPYfImIPYTUtCUaf+h2VywcteJ08GgQvnMclbwCltvFiMxr1muP0zv9RwACChG
	5LdQGaBxuYhqTXKbRE90TsNx2MetS9pe9Y3qYGJIL7z/k/11gGKdjFRVSK8lqPVN
	mQPgW54svNRq9Ea3rYfUZhd0OSxuhHjbjatp75y7aI1pa9zU7dw9pS1bkgR+SWaT
	2WdYzKog69jaq3vds0zrWCF7etq7eB9vO6ST/S83m6pCciA0M03szL2+iCoE/HmD
	JuHxHrAyEZxc4PyATtCg6pQuxzNzZmSCbbFXaYZ//upLMQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcadwa6d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 03:22:08 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51758177935so28864921cf.1
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 20:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780888927; x=1781493727; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zdGfDGBoMgDf1nHklX0qM1Jxg1iBzheuZFvCVbKMi04=;
        b=g2IH5v2ydCSleBH9e2b4I9m+s/bgVqhM5yV6zuJlsA/UZVVHaBNOcAFiByCpJxJGjW
         Z92Zk7xHXcB4QaWWozrKJEpcxpYR0KJhZGRMlS+SQj55k7AI5+QttybdS0Jd+GRldMGg
         xmwyhop//pd9SQFotjLySJBVlWJ8A1idtK6hhP2dd+On51vp9RRDUFV/qBEfAfz/Zcdy
         cQdznzcaMMp06ZcbaPfjvMnLFkBB1n2FAoTSadFV1KkG8Xph/8394j421UspuPl3CmYw
         zUdXH6faPxo4aMSZlIqAWyvGcsVpv2OYLh8b73oKT+O3IUEgXp5NhqUXCtnKwsIk7+Sw
         wCdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780888927; x=1781493727;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zdGfDGBoMgDf1nHklX0qM1Jxg1iBzheuZFvCVbKMi04=;
        b=ssBARcmB0i+9jH+9gEcxMCdDP4OIYO10B1u/srCTmyo7zajmMsjIZpmkNAaWljb9uY
         07By5u9GUtF6mjuJajSvN4opJ/mhvOoW1/grUBUYl0MQE0iZDdrnRJxsp42Iv2QKAeto
         9fR8Z3FOB1NJz2stwxQSMmyvCWukOpLLEzsF2DGP8t/hW3dWovNixc1ed5DvTofUC9jZ
         IJSOsUWqRyidzjLUnAxhEZzgCxDuWDjChBr0NmZIhsux+JQ42jW42Kg2Y4ywM0bjRuhG
         ZRZscDeLm9EeNAkDJhg4Bve7oNUV9dzkQIveBWevKzu13KWTIcqSZ8WWeR76IPVnAc9s
         8osA==
X-Forwarded-Encrypted: i=1; AFNElJ/8N13+9pgeSuQcfP9En5nSfWzlrPN3DL+NuEH/uJb2RPES6XOLBtPUODnpDzHET8kj54Yu33tTKrrA@vger.kernel.org
X-Gm-Message-State: AOJu0Yy76QZy6LEK2isjqGDJ+nK8IMvEfihDkA+wT0jtJj76r8+uspWS
	hJSxAHex7/wJvtIimg2yJ1ewzXehkvrMzx6gJxhidY+I/HSKsliHs9DmnReg+h4VHAIbabRwPzf
	Q257tKgm1gckbEkXV1we9mgoE+bPi2NmvuSuWJ/hhBv/AJfZi5tTag1CG6H9GkzwP
X-Gm-Gg: Acq92OG6kuYcWDD6vmWeXCDkw5le5HWDtL0aOVEunFX3MR0CLzHfqGD4O6JoILu2y+p
	/VXruS2HsQxilCpkJoBghFqv5FZJ3YX3FYRLVxsVXQ5Idk2tORrZp1AdD38+fYcPy0SkcDeLpDh
	c8/PL61+dRquGqD/r6piF0bQ6tvyshIG3giqErNbBBpK/gA4/mw96/zGqaacDRjjp2rbS5UgRVH
	k9S1A4IiSoG3BZh8J6Ypqu/kpJy/Ied5+RsiO3V6pqMylDqD3+Rkm4YuH32m/xRdIJKdU2k0NBq
	/q5Y3l9xFMl+zBN9CZk4Rm/7pM10qfKxnZDKK/pHVUvoCL7DQ7k3xus+t2fgrNsPm8Z/Y1QVXai
	7bbyooSbr90du5/qikNh00T1/lyGmrFoTnohN3PYJr3SN6Js6zOE1KCAlmMi/heuBP1owTKa3vk
	KEoNQmpO6wwu4NoioySlilUtVkdW+Y9uDibJb1jMF7fnm/VQ==
X-Received: by 2002:a05:622a:17cc:b0:517:5e32:f3bf with SMTP id d75a77b69052e-51795b9e179mr203628501cf.20.1780888927220;
        Sun, 07 Jun 2026 20:22:07 -0700 (PDT)
X-Received: by 2002:a05:622a:17cc:b0:517:5e32:f3bf with SMTP id d75a77b69052e-51795b9e179mr203628351cf.20.1780888926767;
        Sun, 07 Jun 2026 20:22:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2d3a1dsm43897391fa.28.2026.06.07.20.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 20:22:04 -0700 (PDT)
Date: Mon, 8 Jun 2026 06:22:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Herman van Hazendonk <github.com@herrie.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 0/3] clk: qcom: add MSM8x60 LPASS Clock Controller
Message-ID: <3j6l3q7sxrwgok65tgkjpkwb6iz4h67rdbuzzv3iwopc4u3zag@qrnodft3j55s>
References: <cover.1780148149.git.github.com@herrie.org>
 <cover.1780197511.git.github.com@herrie.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1780197511.git.github.com@herrie.org>
X-Authority-Analysis: v=2.4 cv=DIa/JSNb c=1 sm=1 tr=0 ts=6a263560 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=cTwmTnRGAAAA:8 a=OF7aXn1xDe1HAw4HkrkA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=GUWCSGlMWfG-xDt5EnV5:22
X-Proofpoint-GUID: 3jixkoScG4nVzyejcPU1ZGANM9XI8qrO
X-Proofpoint-ORIG-GUID: 3jixkoScG4nVzyejcPU1ZGANM9XI8qrO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDAyNyBTYWx0ZWRfX2XZ9t61pkqBS
 GM7fpLA0XflB/i3KW35g04UgR0fLyIJArr7HaAp6sYLhywiZUFc4+f6vdzHsd2cuTNjtfsKh7xa
 bhGBEOgCfxMP91XgkdBwORZoSQ/pEF2vzHXomk//hXOAfIB1+x8gX5E5YwgvsTJ9Dn/h31TfBC1
 AjNOEYK8h32buV6ExGYlVGabpnl+R3E6aqLalkTbswCUsEVYQTeb/XLf85aAlawC3abNbCFZkoq
 WD41Mav3KpFL+UpoCdPmv1YUYw41yaJeRp/d+am9Zbtp/+oYXUhZ334CQ/vmGH3nLT6OQI0J6kP
 wz1/r+WP3t1XQHTs4N+mq1S8bNFpivvexb1jpuATRzFjM8xgvup2/fhLIKxvsIB/gzi7buOCVq+
 8WwORUaaieh8oIsP/rm6+P5fWRuZzCtG5ZTJW8NaiMLsi9SsHnSrVYwjhgaS/vMI3D/Gp/v6Cgj
 N5OS8kspV1pmvmAqVgg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080027

On Sun, May 31, 2026 at 06:08:59AM +0200, Herman van Hazendonk wrote:
> Hi all,
> 
> Self-review (with Sashiko AI assist) caught five issues in v1 before
> maintainer review reached them. v1:
> 
>   https://lore.kernel.org/linux-arm-msm/cover.1780148149.git.github.com@herrie.org/
> 
> v2 changes:

Please send each new version as a separate thread. Don't send new
iterations as replies to other threads (or previous versions).

-- 
With best wishes
Dmitry
