Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F6A5A0AAD
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 15:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658362; cv=none; b=RdNW0TuoYnlMLRLzWomie3nLBA5mcEwHKrK/EsAeNodJf4qdcGlOG03DfTyB4lQc2gbVFqskklmmxcOqdHE7NvnNzNlS5jXf/IlWoXJewIhoyN7Dum25U8nFUHT/Y+Pel1zYiujwjLRt82dUmQUk8l5W/WEj+G8OEQasymcfi1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658362; c=relaxed/simple;
	bh=/Z4wTl5LbY0XS8lD0jM8Zpl6/x1nCA9cmHP2BE9iPO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lJVElAfjD41F4b1lzBJx/Vow5HzuXk0gQC1TLttusMr87g2NveBxYyhpiObhwudSiq46bhPaLbEp8RlXYkKEMt803U01dqf2AByz7nvv8flWM1HB43RXdPecWu4GcsOOSkWYLSlcS/dtDbRM+wXJidNQpJ4QaczjKvswGKbe/y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H3M5a60c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FtQOm/4A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H3M5a60c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FtQOm/4A"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HDiVcK2974883
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 15:19:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dGdv5m0CdvJUBahz873MblPC
	ZhKo8nu4pgz+cDmXb7s=; b=H3M5a60ctYzdxN2N+tDCL2JB9h7NHZ2vDRbUUMJJ
	FjqsxjgfCNm7iLveOxykFM47WSJHYNo8aoTzdvPfMw5w749p0mMsCxon3WfIMa9F
	yxAXiumfSU9dP3e+f+G729+rRXGPf+B3nBuInG8eRKm4CZVNKbAMpulCrdUJcIrb
	JYRaT5KfCuQ3QDxolfMKQoQRIln1vazGy7+x91DsA+vTLTpKOY9QxXd27E4jzqV7
	BleHw4BSgCMwzsEtXWtAcd/fi1/gNQPXMNCm0qHF1s375rNHiKI5fqhELFthrarM
	axDyVXUZ5Jj+Axelxd9HqGiFR7PShDaySCvwOXwkdO+Q6w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grdd6hncb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 15:19:14 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90c8da50f8dso27299706d6.2
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 08:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789658354; x=1790263154; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dGdv5m0CdvJUBahz873MblPCZhKo8nu4pgz+cDmXb7s=;
        b=FtQOm/4AVogV/CHNnd6yJSgD2DqglRqWdQXtMLJgK9vQsppsMqyKicd4qI74KnzfH9
         N/NPtVl+ibXtUOQB7/RCS3nUfo/uS0vM6H1NeNMXtXxdg5WUD5j1wQjmhPQpOw3xVdSE
         lLuW9YNuYToJara0rHTLrhkELxdDrEKImy1MxPQp1OwmFkQ5qalS1qJC4sKSg5VTaFJQ
         KWwIi7R9EbsH1u9BPXKeLyaobZvQ0KC7gdDgVa8gSR4mq0afwXtK/ZmQqswFtD3v3W/m
         UWOAMErO9YLQj4TFpUrQy6hfCnGwVRXg2Q7ZFIC8BUuj84zwSj1XqMjCpgVxvYDDeIvc
         zPsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789658354; x=1790263154;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dGdv5m0CdvJUBahz873MblPCZhKo8nu4pgz+cDmXb7s=;
        b=bTo1/XOXYHNo5OzhUdv3b9B5cawf2Kvag/Lrf22r41zABy6iBrNwSYWkHQGLFIq6PM
         19I39gnDOMTBFBfQaq/m2tPgjPxHJaKxYZWY2PygyVTyfGfJerN9RedJCVVn+sUqknCo
         GisamYWWCwW28+bekxx47Oy1wxpFYihWHFh+L8XCew4pWJZ6lXnTTOJoIElFd/h5KT0v
         il6gB4mzz87TjjX1l2R/7xVoZi6GyiM64e/LKiHxS3cl/nqAxdfSQ3zirWcU7nMQQqJk
         Hd44qkU0/3zBZCY+X7qrpKMZ3qrCEUqiMMlR+odCfhvP/vEnWa6r9DoFXiANyhbKYrB3
         b1NQ==
X-Forwarded-Encrypted: i=1; AKwUvBzritFQRm54U/V5sQEsMDnWCegLV/DB6EdowyMi/SX3n8wmBOmxOsQkXL+9txi5Zh/kczba2zRYso86@vger.kernel.org
X-Gm-Message-State: AFuF++n0nzxWsJ58kY8VRCHZxNm+pLmBRK4TyBpxSQGxUbFd6NciREft
	39fFztSpuQykHpaRRiZBZa3fqHtjklKpqAldEAsiYQElOz4Q0+4Ujas2FFuhrr75rTOyMtI9mjs
	4HKAuU2OiCyFaRdHsMleSMsUb4dhYWSvgI1QnDRZJOSFr8x1Ro5uH6F/ptwKLxnyPzPU/nBZq
X-Gm-Gg: AYBFou33z+3CcndDmTrGXKhUsbLlkkLd4WwWHqk7VmKI450lMUvbooXLWHmjXL4FltM
	kfP2r2tSzWtlXFvP/n2OWAvgwAC61L8Bh5hwSbYgbseWrVN6gLEE8IlDejTPjPYIQkZ0E6t4TPi
	viw0/Qci5q9F11RjNImfyh/aJZcKOk/Xrxiwl5xCJTJb6T2bteYjhjrzbfZbBWAhtUw1lkx2dcj
	g7WxFHPq7ohHr0rLjq75hdCdNnLu8wgj2iRwNir2WMlIclgNTBDYerCQwoeOIMIqbGIhngCSu8T
	1gWMleMLPrk7wC8DIS/RLMHXmVLRfMy9/Bwnq3lFpibzbdPh6nlsK0/KBAEWJY90oVg7E/yCPBE
	/BFvxU6PHaFGaiw==
X-Received: by 2002:a05:6214:5b01:b0:912:517b:4105 with SMTP id 6a1803df08f44-912517b434emr16106756d6.55.1789658353584;
        Thu, 17 Sep 2026 08:19:13 -0700 (PDT)
X-Received: by 2002:a05:6214:5b01:b0:912:517b:4105 with SMTP id 6a1803df08f44-912517b434emr16105666d6.55.1789658352927;
        Thu, 17 Sep 2026 08:19:12 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd23ac75sm83193285e9.13.2026.09.17.08.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:19:12 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:19:10 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 08/15] arm64: dts: qcom: sm8250: Move PCIe phy and
 GPIOs to root port node
Message-ID: <dn5syafhr2z3ezwr5gqi2ssr72g6ikhxpkfztj2h2opj2aqvmd@a2jlbfecmz3x>
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
 <20260917-root_port_v2-v2-8-6272b7caae9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-root_port_v2-v2-8-6272b7caae9a@oss.qualcomm.com>
X-Proofpoint-GUID: Bn-hJ5mkSh5uanO6U_ttqeuBXN2QR_95
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIxNyBTYWx0ZWRfX0lCwCdRLDuim
 00dvwPUSrTRmWUW5L/C0Ot3HGrn8m2gm/clCEJ2x5s69wq/Q0SYK5y+bbUr68DH+LNjdNEjiiBF
 dtlAdFgf+AFuyHqjixEAVJE0oxsxTcCnMr15kXqVur+OUaOszyHwJJA7JmPY7EaWlgTjYiE0O2P
 tsrsZNF7rBoYbZC4NOqu9kKZ72Y/dJkZqjeEVsIXQP/OG66J+orbqY25ljZrLrWRbOFe+qLnLp5
 Rv41dMCk2qc/L5upumhE+cj9QHPR0y4F/P3cwZh2Y7OIJAky7yNgUvDS2qTTNnZkUuNRkrMqT5v
 Eh7bZcP/2lf4fj3FQWv2I41mL1Wsa9VFUjVd0qAo5Z73trEqZdK3ASumjGlWUSz5U7m409/6+nu
 rXncChcUpeEycndwhavNdx+AhcMl7Bk3RCZSdbnH+/4MZas1Mj1nMbMfNp3ld0ABzWiHUXatDgU
 Ok/xCseno3S2otCZzZg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIxNyBTYWx0ZWRfX+M506TcENbtB
 nlsy3RbjlZDNuj28rYKfuKfmhhTPkgknvhppd2Fxnohf8X87ETUgs3+aen6p1ULdvSDTV6VCDEc
 M/3dA/b9WeyeAA0Q6Pdp4aPgs3rRH0Q=
X-Authority-Analysis: v=2.4 cv=GeOCDgXL c=1 sm=1 tr=0 ts=6aac04f2 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=adJbRHicXYsKkr84VsUA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: Bn-hJ5mkSh5uanO6U_ttqeuBXN2QR_95
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170217

On 26-09-17 17:55:22, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys, phy-names, perst-gpios, and wake-gpios
> from the controller to the existing pcieport0 and newly labeled
> pcie1_port0 and pcie2_port0, allowing board-level overrides. Rename
> perst-gpios to reset-gpios to match the binding used in the root
> port context.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
