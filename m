Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5AF17A2FB
	for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 00:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776557484; cv=none; b=qC1eWTiUGUiRkpIP/ErMz87KIDMJocF4Dc9BoewqvWhsSP4P0UhlDB6osDNhmEuN4sRJFWbLV1H2YvpFnwlhoz9nttxLvc7xt1tIIGeAIV/l+XqF3RtkEMw/fwGpMCbSmFI/Oj4OTtLJsqx0WFNqYX24iNTeFfZIAett4DR1SE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776557484; c=relaxed/simple;
	bh=sgiIPT/yV5T+hAxx5JEB9ugXvAkAQLSN8uxYixhOCfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bkCEUB3QMX0Syirnj2uR7R1LrLc5VaRUzLStrjMR8TZ+9AIAIZwTrYhlFxeNfWRAPi4BsuNdMnvVk/8Gcrl9EuWB4W9u7IfNVhLDTNLdWaMtJXCHgKDDXVvVfINaVuj/n9ouqSTQDeI3Kl1zyDtirY7wSVssVXbOJ4Y59FKRSk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y2UMH0EA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xy9xJUkV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y2UMH0EA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xy9xJUkV"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63ILbqDi400405
	for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 00:11:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ql2mVfEiRRYaW0U+oJQcl+vj
	348EApjA2RXMnxakUGk=; b=Y2UMH0EAWrq4WXzUnk5igtUMdh3KvGFo3rR7RyxC
	deIqximQ3A26mcU8YceMMXty2R+Cym3M1uv7Jkicl/LQd6wVEM+63V6uM/UjYL5l
	MNd+ik2iybrpo46ueiOpfkRFjafMso9pJrczqN4xhmcHq13vnj4XJGPMH0aSgNDS
	RhdAksORopgZO/JQLvApqGLXAHfWudrAA6nhL4ENUj0EatX3EBOjH8LGI9dU2SLU
	NPszDuAYkVFpoc7v9yl3Hnj2cMp4xNmE+2ETomWkkrrXNEhlBJXmcWmquFdkK+lN
	HKf+uRBFizbGrPGMTvaZD0kC6OvXu+iu1127pDZBJygaoQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm388hjqg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 00:11:20 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4661881eso24254411cf.0
        for <devicetree@vger.kernel.org>; Sat, 18 Apr 2026 17:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776557479; x=1777162279; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ql2mVfEiRRYaW0U+oJQcl+vj348EApjA2RXMnxakUGk=;
        b=Xy9xJUkV/YgT5ba5AW7cDMcpr6P/DBM5XQgpkRf0bPesd7SV8UdS/8RTtdSXhFCGGm
         cqXSC4/fXBGyMw4uBZsmObeSEMXZs1PGTKoh1GhM4eXZt1NSjQV61TvMjZMdAaW9Ajei
         PVFyylwsCVthFZRJY4z0jDJ6adXiPwk2bKa54H50pRtO0EUObu0RlJRx825b8nXqloPz
         Fb1HqrGhudB3+gIeBVEZVLWQ+nc+xihEvQRDKVBa0MwMaWhErwWzIEy4hYJP6SZEXaHg
         iKpn/vGta8KShxDluVH9MGKQ6gisQAmUer08wCdAu+aOcY4lRBI3egUkU1SMKpoBeDsR
         un9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776557479; x=1777162279;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ql2mVfEiRRYaW0U+oJQcl+vj348EApjA2RXMnxakUGk=;
        b=g8hfOFyjGQVzBDyY1GyZxcyAo1BVqUEktd7HAFdX9+vMjX2L49TQ2wR2IAvx0SEKFD
         3vGMxbp0zy5cqfFnAEhLSEjFScJY1+uN7M4ztT30KLh9W1Z5kRfg9yJ1055Y/Z7EV/yl
         z5Ius0rAS6nJFYtpbSw2nMdkEawGtMQ94PIaRaGZv7TNq0p8Sy/8UBYkhyp664Tdrc0V
         gm4cpkixJGlW4MbYMiUmE844rsgt+MElxx9NzQ5hE3XGlbOLWE1VjyPAdHlSzRaZ0Fgv
         z/4oT8eKaJ9eUQ2DHLxcB5lcGB5wcxRoiYb3mgiHjkMIJT+X4dvppdew3x1TwffOV/GD
         nGiA==
X-Forwarded-Encrypted: i=1; AFNElJ8kgYAxc+Fl6BeLmK5h5d63puj9P4XfIMyfOyBWy2g1A+rT0Oiv8gZKla8Kt/BooW7Wne+EOnUFBtCV@vger.kernel.org
X-Gm-Message-State: AOJu0YxB3nClEflbVN6xvBEPTP7BslAL7UhsOC76245oTLO75VlRWuhw
	UEJ8lwSE12UZ61kEsbtJ2SHXVNSlKq5ToRtG7fwmpBQiK5P8p/nUPhfUT5SF29bANl3cJyCz8SY
	+SbOKQzARXwyJNxtAs4qLfh/L5nnrrF6IY8E9jBxwl4VDkDE0Hpg4VY9c8hPCuElE
X-Gm-Gg: AeBDieslRDXHJbE312Eph4bxOxromgOsjrAGf2SWwtMNb4Y7JoIoN+hDOt/4FW1UKYj
	JxNITl5L4Y+ts+H7PolkmzVpo9yqO+lAmxjrPAIXhCUaL8NZ+5qtWJ5lEWlcgK0YgLXsbRnMFBt
	WFhNLJqMHLXVGeTj/qtZp1S0LxOU6KPCpkscGPLPv03njLJOhkyFD1+gP9TMg5qQCJfxuwRAETR
	tBljEJPS8Xcxj0kfTFL11cOv49l7+KtrrOMHHydC/Y757GY6lpFT4tJlx+Pdu1kDbt+dCo/FIdS
	syUuxIH0fmMovQ0xEgiq4f8rZFmSylMFhTiWfpzx3Q3PMXQQPSt9yE9bw2A4LZQ+KaJq1PijzZg
	LX7kgiX6Elh1y+1df3+OJHtwTVqNmcKKjCWfV0y+iqyQviFonf69Le7SS67th2UBQxUPuQDyq36
	8qiX40HOyyh4NWeU8eVaCaQDwnt5fJqim6mtPp6QHI4oZQ8A==
X-Received: by 2002:a05:622a:1e13:b0:50d:97e8:939b with SMTP id d75a77b69052e-50e36bd4f1bmr122210851cf.36.1776557479373;
        Sat, 18 Apr 2026 17:11:19 -0700 (PDT)
X-Received: by 2002:a05:622a:1e13:b0:50d:97e8:939b with SMTP id d75a77b69052e-50e36bd4f1bmr122210571cf.36.1776557478938;
        Sat, 18 Apr 2026 17:11:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e1248sm1747814e87.38.2026.04.18.17.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 17:11:16 -0700 (PDT)
Date: Sun, 19 Apr 2026 03:11:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: eliza: Add IMEM node
Message-ID: <rrqhfxyelaiasxzwa44rgefmsmrp2u6uret3gjmpdx4okx4oh5@varb2zud5iot>
References: <20260415-eliza-imem-v1-0-4a90e8683799@pm.me>
 <20260415-eliza-imem-v1-2-4a90e8683799@pm.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260415-eliza-imem-v1-2-4a90e8683799@pm.me>
X-Authority-Analysis: v=2.4 cv=GthyPE1C c=1 sm=1 tr=0 ts=69e41da8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=LQb-txNCcIPzF-pISk0A:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: jZS5T_RSDyD1wXFnQjDDG-sHkpms_CmR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE5MDAwMCBTYWx0ZWRfX9VeTUQx0s8yx
 i7dsD56XkrAzp37LaXHLWdcCoAbWpUsH1UXk0otyb2M3yQKoio3B4lxnzPPxZ4cTsU7GEviFSRq
 0THpkL/b9JxjJ/XMpZN1PSNcTFyUnF2F4+F5huAwcNyUsyCfM+G0WhYviJ+pSDue6Zw5slaGVbl
 EPrNVGQDJQ0MMdzIG1uytNSAx0oljIBCWrHrbOPlwJEv6XFR/u/v2v4F1WjzO27vf4bURcjDBAc
 CGDKrk5/M1qiQWgWw+5xq60mI0N0g7CfU+JggJ+WqriH/WKdShdMDgcCy9HkpLtvc8Q8ohy2/H2
 H+OIEOAp7rV1xfqez60surdMvpEqS8edxMQ53+uSDlpyuWZM9KzxdUZIX95Q5EuLrx7akxToXbl
 8eqSQB0gB2co4osnWTlaOlB7R/642BlweUpooe40OYSQxPkp9tj3ED+OSl+RoBgGnC4s9MIBJdm
 ZlgTZF1jk3QMW2U6doA==
X-Proofpoint-ORIG-GUID: jZS5T_RSDyD1wXFnQjDDG-sHkpms_CmR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-18_07,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604190000

On Thu, Apr 16, 2026 at 12:23:41AM +0000, Alexander Koskovich wrote:
> Add a node for the IMEM found on Eliza, which contains pil-reloc-info
> and the modem tables for IPA, among others.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  arch/arm64/boot/dts/qcom/eliza.dtsi | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
