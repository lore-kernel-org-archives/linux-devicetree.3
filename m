Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC9F37FF4B
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 04:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776658786; cv=none; b=Mrg7vMGYm2Tn73r57UdXOvOA6fnk0AWiEITTNK2+KZVczVp7XO/UnxHMKLhKE60Ld8lUGRSkTrEfATNJxDRKTuT9xKvdiRgKcaEFFu71ncQCY499GqBU7qqqRGgLIo8Fgy/zf5tJaWB5HD2K9IE8MtzwTg3CCCsv7EJreUb3A6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776658786; c=relaxed/simple;
	bh=3m8OEi1Nen5JrUTIx7Hn3xTV4VTySV7tKJw1t7oywNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=joCkEf/y3mpfJ8xH89WMkZaCo5x62wrZus235/y1XDU1yQldw1dvY7tQTwlIbsR4dV4PSzmiqGolAKHxCw8NyezKb/wEQibeSe+au5g7vbf2SzbfyqfwIiuqKaMoZUqAWom9H5L+RGfIMTmM9LyJGNY3rlgW2X5/vHm5y+vdKdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jHDyj9Jh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aeFna5QR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jHDyj9Jh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aeFna5QR"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63JNKKQh2219663
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 04:19:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=N93f9sl7+KieV6Dfe8+14y0W
	rMTy8l1cKYpC7g89BPM=; b=jHDyj9JhSYbz8nktg+/SjS1xZq8vbtozVkI3KbNe
	O2BATo0l/CTb2Yzz2HQ6Mv9mp45OtVrQNh0twzbwLrMJ3BiWOK+wJBd3uvu0J5CM
	c1+Ed0KlRl6cLhDJ89fOdRyZ+j+JSEVeiwAlrDzjAiOueU3o1zEgGyoAbo/D54x6
	FMPd02IYlSqgZPTxaYHhmpUkRkirKzde8/5yKzdhWgmCpyx01qSrflpmj1i40vuF
	q24SXRTZyFFe36F/Luqrn/rczP7ESBKwfo0nG4O6ugEC7snJyBOVZQBMxDwj5OnP
	pN5lmTGsa21JjlhD4cGSc/rRV7gpBSDnI8SLFQpIAEWJ+A==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm19fv0xb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 04:19:41 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2dd1c74508cso5043500eec.0
        for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 21:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776658780; x=1777263580; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N93f9sl7+KieV6Dfe8+14y0WrMTy8l1cKYpC7g89BPM=;
        b=aeFna5QRPqEWppkZhDOrO+3RxoHwEzlo47aHbdq4va+FkcCwD1UeQjLzymVt08odT0
         dTRvnkWYuCYtwQBofRcraWFIjeDhQ7f3dKDmyFpc3Bf+o7sNXJCZa8PmjxLa8fgFr67a
         Tuyr07BFti9KJ3Qw09ooyuUxWx8kOV7ImDq8aRJPg82BvNRzSCZhWNqWX5aAIhDNqQxp
         ZnP27aXhezdZxEk8L9KZOftz0xxJ1Qjf6J/fAmBQGTFKRwFC4DXWO0N4g2h64OCckZlz
         DsT9bZKKEvzwKa9AGjVuYmTJlXKXnyGUGU5svLVrJdqio5LeqEXoamXJWFGG5dQguxLt
         9K6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776658780; x=1777263580;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N93f9sl7+KieV6Dfe8+14y0WrMTy8l1cKYpC7g89BPM=;
        b=rIVVCfgWfCxy+XU+628kFJPgrTfAd5XJxrGDeVeFwtEETcShmWKp5CcEwu6ZhRbaVQ
         wCE0m3oVlZal/Yd+1Nyh9YuW4HxJx9SpzBOJKky2mH+sq2cmePFEVT7Ic+ibRNR50qv6
         uVpY1DmQrVaF4kSnCQ9zTel2hzs5NO4+HH0MYq9rvUe+bHMyPU1QTbF5L+4/EepuVAnD
         E+D4jpMPo8QlP0YP9MWG1kl2e/n+ZMhksg6w10Pa8hT6nfhhOa1uCLuqgQgp1gIx0H5b
         +2viFLN3+371n6Z8buEaOXXkhq43l+DO3mM2eH/lCjUShKJ8x/ktuFbwASQjRJMPbaGe
         2Ugw==
X-Forwarded-Encrypted: i=1; AFNElJ+bIMyGiLvUdF9GmAFevjVK139kNspPpnLf53Fth6nLL9dqkRhPcPLHAKXoCEp9UWgwL4+DgVTuq83O@vger.kernel.org
X-Gm-Message-State: AOJu0YxXXmpuzN6KMIR5nYE4Xt+aITASDoI9ivPdQ3zEsbqSbXqd7+A5
	BYkLoZbMW3a2F1AnHeDGI1mnKOACGRioQ3ZP4E736UmTfVe/1/ZYhaXiTTZbUDElcO6RvywQIif
	pjLJYv+89HPY/e1AHdciOmwrvOAYZP++VgH/znajarDbRUcUagzz16tds5FU2cSwL
X-Gm-Gg: AeBDieuJDHStmimNYO+Nw+4QKSOkltt4RRUiCwHtUuFoCSgtp5iY2kdf9Mpo7gFaqCd
	mN/3h07tMlQwgEv1rAtV86X1fv5RCfnYse6dtwW9YnJJAETdOGEZizJuhVLeq7JDRzDk+MX028+
	CwAgsdsyJ1d0o72PTHgkPqqiNh8W0Vf1cZYIDonQqYm6xwBFyO8YARJigzGJv5BR7jqlCsphUhy
	OZ2ioBSp0J3y1I0hKGSOBmKkQ5NWktXJ2GLpv1DAf6CLkRzV304DeziyVTBYJI6a+z4Pg/62zy4
	iwEm3hyuriFHUExXeo3Dzm7C6uI8sHCWS0w0ZhBbWzumxj9q8tuDY2uX3cffrE9v26I5BPel/wW
	5TfazP6sbdduesSxNRiWlqgs+13QUUSsMGIwJIUfYpkxYM91uRrSBsOc8svgfa07CQhsH3xLcSu
	g=
X-Received: by 2002:a05:693c:3006:b0:2d9:d062:4cb3 with SMTP id 5a478bee46e88-2e478e28c6amr5286132eec.26.1776658780036;
        Sun, 19 Apr 2026 21:19:40 -0700 (PDT)
X-Received: by 2002:a05:693c:3006:b0:2d9:d062:4cb3 with SMTP id 5a478bee46e88-2e478e28c6amr5286118eec.26.1776658779430;
        Sun, 19 Apr 2026 21:19:39 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e536e54562sm12622006eec.0.2026.04.19.21.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 21:19:39 -0700 (PDT)
Date: Mon, 20 Apr 2026 12:19:33 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mfd: qcom,tcsr: Add compatible for Nord
Message-ID: <aeWpVXMezplE1K96@QCOM-aGQu4IUr3Y>
References: <20260420041318.1247875-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420041318.1247875-1-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDAzOCBTYWx0ZWRfX6sCYpacfcsrx
 QyS5fTbssw76JkHWgzAQZDeh0/tz8znVUS84UJPlc2gIJM1o5B3tGTy2h8Pm8b6SH7XMB0oPHdl
 OQpIpQsgR8I8abzeGuKKVnMPxKw91QZBAP7bpWP/PwaRExHhyjH2fHbvc1aqXTzjnvP9c74n13/
 22LmNx0QTa5XUna2CW+DfTusnomBLVXR01hD4T3orOFU7TaFMtJ+YQICOcYVcarnbSGpF9vb49H
 YCkCdD2CtU2eerFp59c11lQRtTdIvfwSwqnKJfa56sqNqqOx01BVdDAWWIlkbNzFE3/NbnN4f78
 klDFKKzp0YUEnsi/jLywweZvsX4HUl8ryX06d2otUN85Eg27IKZ9Ia+qHDLMYFgWQVP12QkLKmr
 UxFKn/LF+n6Th90rNCi/eEpGIwXu/OpTicOrOahphY5/CohmaR38r2qQHg+GNR6hj3ECZHkBQnH
 Wn5SQLhDhnk7JphhFEA==
X-Proofpoint-ORIG-GUID: bAiY1yCjb-ncS0pWXvBZa4sXAh7H8umK
X-Proofpoint-GUID: bAiY1yCjb-ncS0pWXvBZa4sXAh7H8umK
X-Authority-Analysis: v=2.4 cv=FMorAeos c=1 sm=1 tr=0 ts=69e5a95d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=r8GZQKSaGxLjtLWlYeAA:9 a=CjuIK1q_8ugA:10 a=QYH75iMubAgA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-19_07,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200038

On Mon, Apr 20, 2026 at 12:13:18PM +0800, Shawn Guo wrote:
> From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> 
> Document Top Control and Status Register controller for Qualcomm Nord
> SoC with a fallback on syscon.
> 
> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

Sorry, but please ignore this one.  I forgot to add my SoB.

Shawn
