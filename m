Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23BC026B75B
	for <devicetree@vger.kernel.org>; Sat,  4 Apr 2026 19:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775331649; cv=none; b=Kxk62WYsaIt0HLjXQgNAcGQ3GFl5scrtJL5bsKnfI3gbNax3RkJoJ9YmTV0QdASh0+aE94ERjGJzaoQtWhRv6kNyPJU6KYdoW5MGjWmDJAufJ8QfWI7G2Y4qB8SmEQFU2u91i5Nw7r/nMENIcSvXYKeypPxL7Qa/F67AXUG57PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775331649; c=relaxed/simple;
	bh=XL3RUXAze7rDI++61/KSU79UhwsGdCSyd1MURMoHOuY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I/6NE/lhXzPI4ODirVlG6fNfgKVQJQImChZ3Bxis8ueIJh5n3UDRafrEt+VNhrku6+nrmlPBm/9qrmb+qQIFXHxkoDCNnFMSwmc5rDzykv652pNuzcYED6O/NIKrJMqf5jyUJy/ZDCntj8d7RDTKPJwC2k/MnlClzc94khUHT00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kyoWOpPL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MP33qkPV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kyoWOpPL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MP33qkPV"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 634BoD3w497886
	for <devicetree@vger.kernel.org>; Sat, 4 Apr 2026 19:40:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qrq8HRbFClCmcNR55C+dTrNw
	+/gWvKkKtrLHgMw4W4g=; b=kyoWOpPLLiG/GeG7FOfe+p1p/1aQx8u4YNEjp39K
	cswz2M21S+lDjPBG08X077BO8UUlO3/uqYE8gxMgYZ7GkwtZg/QhaXVkLOkuQNZY
	c3gfLnX6Z0xvoa0KG3LDRGbJNIkNL+gRvGGtm9ITWArJYTrZjuk0l2zmqIEt3j/Y
	RgLrbqNHu9sTQ1mAz+neR8K9vt8CW4XNzw3dN55zLGhdd1RuB44Ffie7iEuErRRv
	5JxvgW4BkhMg5LbW2noqvJVa4wW0uulTUsxPPyLwYoo/6Iz9IUqOPLF+QBZPOFdm
	M8SsYDe00BC764D+LgJ2E1T+xQju+aaAAYFOtOxjf+9P3w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4datqshb0p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 19:40:47 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5094741c1c1so7697621cf.1
        for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 12:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775331647; x=1775936447; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qrq8HRbFClCmcNR55C+dTrNw+/gWvKkKtrLHgMw4W4g=;
        b=MP33qkPVCmrYztv9X9HTgndN9kOBL7/RWgqQCdplBn+q+9+9NkPu0KGYcG2FobHwaq
         dcekUqSYrdwVyaMq0Qh6ZtmVrg1Idq4D+1/x4VrkQVxe5RbWg/uS0rFDyCBtmIBuIaft
         iZ2Bi8rRvObm8TtTmrig4kfK7sNy2Grw72fmoAMtl083cwlvcY00SViymrFFmnIR+c/Y
         G9cyKAF5GnN3+GdypPqN2jxUx9rdXj9YB2QTfj/0NOOgJ1QD/Ik7iiDtPExkybvHgpzn
         cyqq8WXEAWc/Gb2a6R5dCOg6qKfZxxtF/61rf5Bve5zxWjiuW1pKFIo1spZHMY5U4Srg
         WN4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775331647; x=1775936447;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qrq8HRbFClCmcNR55C+dTrNw+/gWvKkKtrLHgMw4W4g=;
        b=D3rgxlkh0a06Jm1LSau2I3/KWMVVVFoe5FtAoa28hkahDVR4atjRyzTq5cx5ZXmNYy
         yRs34XkghwarTtLgKJl63hkc3iZp6ecot6zXHer2XFj6xudgx3M45f7GBKOy6gM7d3h3
         0dj5NW27fntJZJrRigvm+b0iMkbgR9M79yK+5ey37LdfSRRJF26x1cWUg85lRq+k4svH
         zkOTjujWXajc4AXFNzquYzfj3+o5EAowZnoVJSkev1B+aLwh1w14d1ztQR6/g83BDs64
         BiykN/3yLUIuaAxZh4uImuDdCaZri2lQTc9LNsQKos3Q+fNUwxyC+Smc25IQuNTsB/13
         fpvw==
X-Forwarded-Encrypted: i=1; AJvYcCV2L4mnoKzyN0DxPG3uuM8POp5XcwM803axZQ3m6KsgP5nt53wWJ40c2ZjPvxtsksgopdBc/X16b8PA@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8oGhOFqTYhzBNWSDN9nNXj+7+EuGA+Yb9LhTOSII2jBRcpTfE
	3IGPcWYjeiqjyXn28wETmJXD/bgMHXTWRuiK4WKWiNJe4e9F/YT3Z7b1xWKDYO3TkbO976/IVoK
	AW5j3DYGrJQFdc/gG4G8gpiO6p4JFbTVvvocTYPZFd+3qAVZiR1+/KUHT0vdQs6Gz
X-Gm-Gg: AeBDies0+MTwnfsH0sBOnOWX5nC7AbeWfpPN7tHfozxWk+yZ+C05zceNWABcG4Lzare
	OlnpDIHNKTOqKV/QWHIZKoJEfqvweDwXSYej2GDnOxM7rnYy73aIQJYxzgGBpYx4Pj6U/hUdX/s
	ljKIuA5nbVQRIMCYbQqzAXdgCxRdmDR96JM0dIJxzBCIQ4lu7mvOT6aeSm8le0C+QwWztknwDA9
	oO5Iu3PDbMakp/W/XnB8NNy+f0J1d5qQrSRcDAY9i+2acuBFrf1Rmp8SltNMMv1RNEnsMDH5ru6
	skJIl54lmtdUHtZ2Stfv8DBSg0WcYA3KlNGZn18SOaM1x5cxL31N+0HRYgtSXrbI/qLwtPqG7gE
	rM60eW0FNFMitwMKd3pbJutkqsFpJnXNHQYEL/D09DzE1BFZfRAtZMGH+4VK/aYBvA2voWh+/Tl
	rNK/+zNeTqh4twQWIU3kD9zzws1K19jdE4Vz8=
X-Received: by 2002:a05:622a:544a:b0:50b:4c27:9c29 with SMTP id d75a77b69052e-50d62cc0327mr115302841cf.42.1775331646672;
        Sat, 04 Apr 2026 12:40:46 -0700 (PDT)
X-Received: by 2002:a05:622a:544a:b0:50b:4c27:9c29 with SMTP id d75a77b69052e-50d62cc0327mr115302501cf.42.1775331646229;
        Sat, 04 Apr 2026 12:40:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cc607asm2347208e87.54.2026.04.04.12.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 12:40:45 -0700 (PDT)
Date: Sat, 4 Apr 2026 22:40:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: Re: [PATCH 5/5] arm64: dts: qcom: sdm845-mezzanine: Fix camss ports
 unit_address_vs_reg warning
Message-ID: <mn33xnzyf6qodyi6hlli4w46wzgamm2jqaryqpr25gxqbhy6gr@x5iqzh55yreq>
References: <20260404-dts-qcom-w-1-fixes-v1-0-b8a9e6806e0a@oss.qualcomm.com>
 <20260404-dts-qcom-w-1-fixes-v1-5-b8a9e6806e0a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260404-dts-qcom-w-1-fixes-v1-5-b8a9e6806e0a@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=ari/yCZV c=1 sm=1 tr=0 ts=69d1693f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=V9vMjfhfzPYCBo78LHUA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: Reu2GNnIXASy762hQPQn4GtGDECtuaOW
X-Proofpoint-GUID: Reu2GNnIXASy762hQPQn4GtGDECtuaOW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDE4NyBTYWx0ZWRfX2X7mr2dTlPqH
 5BW6PUfce2QMhlfZpaDYuqYOOAuyWVczapRunlS/nl9OV01z04R16hLlJJriuabBlWeTNjG9DqT
 7m+wkxugHsNE+a+wKRNh0QTSuY94lVDCOJ81N3Of+f56IIlFK0cBS0B+SmXKKr0aVcUFAASfyrw
 Vx1qAeQnA+e00L66f1J3YuWzxlj3+Fo1l1RCtmE4LtnhGZ1Z4hi+R3GIcSClI/zd/y1/Orbj95l
 6CoC2eJnBw5IRvObvgPDr9Yr6ZhQO4nVpkmZz2hfeblrfXVLEhB/pr24mnGNDIOhjRBmQagXn+X
 LbB8hSYQNDBPFhYGJ3GDmdGJcJsUsYMsLvbFc6TbQKJy6/r95vo+BfCF52QdJAOGjSAYexAmQPL
 KxlVR8Kzf3nQZs5lmILYmgw3Z4Fy5TDevazyiNFRBsKfwRRY9RxfdC2u7UzqKgR5ylnYa7Gd9A5
 LnGYcof/ulrR+AO2EWA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604040187

On Sat, Apr 04, 2026 at 11:51:04AM +0200, Krzysztof Kozlowski wrote:
> Add necessary properties for ports node in SDM845 DB845c Navigation
> mezzanine overlay to fix W=1 DTC warning:
> 
> sdm845-db845c-navigation-mezzanine.dtso:19.10-24.5: Warning (unit_address_vs_reg): /fragment@0/__overlay__/ports/port@0: node has a unit name, but no reg or ranges property
> 
> Fixes: 30df676a31b7 ("arm64: dts: qcom: sdm845-db845c-navigation-mezzanine: Convert mezzanine riser to dtso")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso | 5 +++++
>  1 file changed, 5 insertions(+)
> 


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
