Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6AF13D9045
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 15:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775836673; cv=none; b=s1UtqEtjNVvEpdzYKTefWqJ3n01d/TjY61fX8DfzU8dEK0yWf95/rE23tIwJnY5GoF/tTY+vR1bKfLdA08I3N7LY77m0VcHxv6b3tAyneJBVfnOv8Fc094HkHBUvafZjeSI3kp9a7GLZt2SPn1xwdsxPMVDkEanNBCUitTybUf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775836673; c=relaxed/simple;
	bh=fv5OMOu1zNM4pDbfg8Pmy6EMQUZjpcDL9MDQ0YUeFWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m+ivcLrDfaqUAFHxTb60wUBxkbRluw/ey48QooqUYgrLzhiDxqYsc1DnVhK0kGuSGKTyu9vTDWxWeBZoOfXay4VjZSohfylga6Ziyr5/pu6f52A5EU5x0Opl6XwbhCXEibgTafccnpYdoxrvdVd1kM3HDsRdP4krkp/JVX8n0AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DdUAano0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GBcDWoo+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DdUAano0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GBcDWoo+"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AF5msg3759304
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 15:57:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LqlI1O8H1DVEX4GBIht8xh6h
	Ovxmk7hf+alBV7/gD/k=; b=DdUAano0YtU1zUtJpvEimlyOh776s/+YXfnQMn1N
	ZxYdQeAWYYM5eiE0elyzYp29eZuJFxq9/OPqjTSEvDmuRNsDfTOvlkvmOTig7Uuj
	TvIj3SyMQvIx1pixzKoVYTmTsaIooL2f2/y8dB9WnrVjc36QQNDRcUk6JQzX+L13
	EY9Euh9MAnac9cLdDc5Nx/gO+Moc1Y4yFiXHkBBKbmkwmKtGUN9CIfqry0qG0F+g
	4/89kJcLPJ+NWCsI2lczA40OY7q7kUuHWVFnqUfmIhb8acAMxwHJBGFY5ruaccuw
	++/BbdJ3DtqiImhZjt43DXpsVb/iVH39GwNZBGu9RrlgXg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4df3j1g55p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 15:57:50 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1273dfdaf5dso1796322c88.0
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 08:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775836670; x=1776441470; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LqlI1O8H1DVEX4GBIht8xh6hOvxmk7hf+alBV7/gD/k=;
        b=GBcDWoo+6C6DY/20EnaoUq2rD4+vH8WeJpX+VppmJX7o/0oFcNf9mumfwwmFM3Biqj
         s3mCtQcnzPgetuzrQQChqDDl6UzkpL2sf76fRVtkYPAP3u4TDzrcb45n0/0fvMWPbDxN
         gnaiQnAjyIBWv+b1IWNoQmIsGwlynHQeToa8gN0JuOEUFMZzYHb0HXd5Cw5A++yGO286
         6i/K34X8FrDjPTnZe9xHd4ovFHCzbHJYVHGjGSSvOLgvRmCd79N8Dtoop0quR7jiCmv1
         jMzWjIiXuyWuVEiQs63cnzL/sbteIRG8Wl7pXrinPPUI3P5brY+Z5uvFumGp11wryaJd
         cgLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775836670; x=1776441470;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LqlI1O8H1DVEX4GBIht8xh6hOvxmk7hf+alBV7/gD/k=;
        b=CVza5QLdR9bqZp3DfXQkbUKDpjAql5xDmhN0AiqA45eJz6NqzkC9kxpPOvxriLbDT8
         TTwKL/hLG9lWgnqjyv/Bu5uAOIIQ9TBSIGMoAlw6q/EGE2ltXR+SJFAhVuK2nPSva1Va
         hACSlezb9fl+mdx4xMM22Xo0fuRP6k63h73Hqc7wCGUCrMfhmBDqHUu8qXzwe+6N0J2A
         FFq2qYXhDzbyy8QVLaVT3LqrYqPZr3DGBs4coQ2S19xAbGnj39Ln19PhNprg7Jz6mbbe
         4JbpNJqq70dq2jKodmsio00Om4NgQRKff5yZGhmD2vAADCFuZsxhqEYAjpGS8twPrtPO
         jS0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUYxPAn4xS8gjZMWwrVgHR39wAhEKsbS1ak7UMQPXDP36FDVKdrDS1iajN2TXGuDF3PgHQQHL8uQ/TV@vger.kernel.org
X-Gm-Message-State: AOJu0Yygxj3KzmxsNmhEgbBqetaQ8XXhqDfw4lS2z6FcwXhU3Fxq40HR
	PrzZO/htaxBD2OIvK7vcnqg0gv82JWLhfQewHV0NxHK7KAKA8S06c0bzncw9vVPl7rgTOmA8V2y
	2DDT0bW8PBceP2Hsap7/e4Q2A53nvBYtYYzw8png2R0kC0UrQpWQB9pou92+rEn9Y
X-Gm-Gg: AeBDieuTNZ4Ee2exSVUBxvPkUv3wuQWEqD0F5aC9Bkep3+6uL8YdLzIj1l9NTbflech
	ZX2fnPHW/B2fjcEMk6OQR7FRPlRcKURZmyQ2N0bcdxRq0/9sHOa6Ua7H0nnMGI9E7UpMA+UcUEh
	nB6B7ZFBRd5TCxCDM+w+tInCrv0HQ2imrbdeF+Js4+OZRUipZ6rDz17n1dntLKJ2DtNsW1FRRGh
	ImP86KJG0UFRdPOA69DZB/ohg5j6mjjty3wHlv2bS9HWPz52P+Jzoiiq6h8j2SsLvhwwAXoniVg
	ACBiJXBp4TKG6/FGI24aInbaWyLjOPq4LA1+qKjIU3gyee8a4uUFiF1n3NhCSzSlsrTXN907/+P
	w3GmngDmx4bMM8isqdh7vYTaDwzXccPvXVxyxYQp5hFlFFxQ8fUFy8XmeOCGMIsJqT/1YZMYk9h
	Y=
X-Received: by 2002:a05:7022:793:b0:11f:1e5b:2dd6 with SMTP id a92af1059eb24-12c28c30fc1mr4140109c88.17.1775836669570;
        Fri, 10 Apr 2026 08:57:49 -0700 (PDT)
X-Received: by 2002:a05:7022:793:b0:11f:1e5b:2dd6 with SMTP id a92af1059eb24-12c28c30fc1mr4140081c88.17.1775836668991;
        Fri, 10 Apr 2026 08:57:48 -0700 (PDT)
Received: from hu-mdtipton-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c346eb314sm3734038c88.10.2026.04.10.08.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 08:57:48 -0700 (PDT)
Date: Fri, 10 Apr 2026 08:57:46 -0700
From: Mike Tipton <mike.tipton@oss.qualcomm.com>
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 6/7] clk: qcom: clk-alpha-pll: Add support for Taycan
 EHA_T PLL
Message-ID: <adkd+rbJZom/BLf3@hu-mdtipton-lv.qualcomm.com>
References: <20260409-clk-hawi-v2-0-c7a185389d9a@oss.qualcomm.com>
 <20260409-clk-hawi-v2-6-c7a185389d9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409-clk-hawi-v2-6-c7a185389d9a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE0OSBTYWx0ZWRfX82NVedcuOhOm
 7JifEQsCMidIZIQpXd1X58er2hvASLm9ImREXpm2j42LPfroiJ5HlIjdc0Egx8RWO9pY8YMRYlA
 6k5IvK9XHFX5n4hXZD79kez2Gpv+iU5u/mYvBQ/IC9cgOTo+jgOSgToiDUppddypW8mC2rMQVdZ
 vjiJWQyV5pGdTK+oqY+om3e5J/vOUo5U8WevvRdcjwmkszlszyKcEfZSeoLSleOjjUGO731N2U5
 ViFOLXYPez6WFypFR4/+9QZSZu2TY0uzXcvQak+DSMOodVAgaNb0EJNntDRAaYcTE66YZ98w1t+
 UBi8hiwUbpInaCXh4ubAwWTBnRq1JIOqImu0sXCKsAk/FLOVMLPCauTsOuPetcSyScr3v/+8obk
 wx+/A8jWTRZyVjfDxMG0dNTMissIknS/I74N1e8PzK1XnFdzueyzLqfKdn2oc4JVtG2yyqHWoIG
 Qes7+HJVEunfB1IOx8g==
X-Proofpoint-ORIG-GUID: ykgKaTbaOijF_ztBSLTPj_ueUnH2qxyS
X-Authority-Analysis: v=2.4 cv=AbKB2XXG c=1 sm=1 tr=0 ts=69d91dfe cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=ejiLYX5kVw-NK1-vaKUA:9 a=CjuIK1q_8ugA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: ykgKaTbaOijF_ztBSLTPj_ueUnH2qxyS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100149

On Thu, Apr 09, 2026 at 01:51:40PM -0700, Vivek Aknurwar wrote:
> Add clock operations and register offsets to enable control of the Taycan
> EHA_T PLL, allowing for proper configuration and management of the PLL.
> 
> Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-alpha-pll.h | 6 ++++++
>  1 file changed, 6 insertions(+)

Reviewed-by: Mike Tipton <mike.tipton@oss.qualcomm.com>

Thanks,
Mike
