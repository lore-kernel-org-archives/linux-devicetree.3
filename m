Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1FAF37F8A6
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 06:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776925792; cv=none; b=sCl+H7vChu/QhzkwFkU3uGAHxcuQeZ2B2BthCw8AAUe4yt++zYheqTD65ZTgKslmMUG95XfOBlkohkw/WuenE/MIP4R5GLAcLo+4YLqYtqU2MSmAw+W3XWqzDVYSS+MM1P10NuW838byo8z0tzTu4cv1ozcPq5f1G3xxfUq+u3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776925792; c=relaxed/simple;
	bh=lWfyMIyMoRLJG7qsDI8i7QMbJoMWcg8Yp81uHSrvvIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MJNIn3x8nOno0OFSfXNQBQ+qsin+KF39WFpX00OI/HacwbdYT4uBUFVipaYRCKXzsVkVpz8qQK0s8jbO/6V5/WsWVewCwzHm56NW+5angG1dbaC5UEZDw3mx8kF/iYEksgJ8Lji8H5/ZmhvXmJVS1W7FA3QFom1MOEOcWnjYOp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UTdwJ5uH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LzzRsL+6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UTdwJ5uH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LzzRsL+6"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N6RQYH4037434
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 06:29:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UyC7CCp74qUg3I7ppKeAkn+Q
	uNwtibiTJOLMOe0x83c=; b=UTdwJ5uHi7EFiJct6qZhLrJTPF0QIOPWLsIcVYZe
	0aKVJJZIfcYM8QFm7xrbf23iQS963VZ7vLiJ30E72yEdRMMFyJPSwapB+Ax/9qJx
	LJXgFCfEf+0204HAApwp+G0nP1fbs8/ok766QeHjqDYLoWfQrVIdBTc7h3nIsJw8
	rArQD22m1iTazGCcUe4DSRTDWhCyzSvqEvZHg2O7f4EjS60ifLSLOlvpU9EPMzMc
	cNHkWrAIQYH5wX7VYPUkDLCJiUqW/2irnqUNXJKigiZT8pSuNx1iiKVvliALeomg
	76/hy+lOYXL6E2YnrE62Gl0iHHC7qOaPZysuHp12sHufTQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqe62g06k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 06:29:50 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2ba9a744f7dso8233719eec.0
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 23:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776925790; x=1777530590; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UyC7CCp74qUg3I7ppKeAkn+QuNwtibiTJOLMOe0x83c=;
        b=LzzRsL+6H1EDuSeD54qpG2EBgOhJQvILmL4GWw1ihH41c1bwpbwan38FzmkTOlaha3
         9YFZ9cYzVnIgZ+4hx1ldMlixtcq51X4aEoRf5qoAAoKH/dBO5uA0nVauNCDq5AqwVbW2
         5C70o5pUSLN0GqRfDeo3LjmBYrq18l2v8TrgLpzG5vs7K9AkZjRBP15PzNuVMOhbCDRq
         hgGALj10/AZH5yLnfCtHBgBrIXOp4Rw7PHt5zxgvWGK1e49WcupqBMXgcNjr09cOTbXy
         Y/1Xx8/MGP30rKYzTsB67vsg85XKMluXfk5D6o9l1OJT1BF8T4YhoI09Quk3tkJRw6TB
         htbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776925790; x=1777530590;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UyC7CCp74qUg3I7ppKeAkn+QuNwtibiTJOLMOe0x83c=;
        b=mcrn8GE3ryi5XST2GokKWC9CbyAO4PeAiTDmyqf99F0PIHBZKkQlu6X+gfp70+fNH2
         YmfewgNU+yDboVUPdmxQSkIiIPIBM/JU0MMNjQ19U/Kcmma2I+T+Efzn2+dSxuY3DthW
         l8gMfgcFNdhWc9LjBosG2IBoxuhU6/XKPvwxRuD42ERRIFmTWkDun7DuI/9al3H0Y8ZR
         YXdYrufsaUG82BSehieUvfANNp8+ZXi4rUcUCbICjShbw3oSJ9CmzQuvqWllWz+GEV4+
         vI+vVgGjSX1L6Jp0BYTAbQrjAeC7gg2HraZPVH2MvEs1ThsSSGvu4mFSEpJqC0SogXr2
         vdJQ==
X-Forwarded-Encrypted: i=1; AFNElJ8cW6OMsnfphHyJK24pyznSvPNQBxeQXPF/N+LEESwoYYf5agSTcxRpGdUKzPhGrUVKOtxQSvDiGcvb@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3Hw4iD62xpq4IMfKPl6zK0kfiLyrwVG9ThgYWLIldp6SAIOrL
	QXRh+njJuCeUkAHS9vn+pVeEL+gu8Kg8lRiLgwFHm86zg8v0yAVFYCRALZ8YELf90sHfL90Nn2n
	dlQ4ba3pGYk1B+2cNVmZ/dtZwJGmBOL6pmjBbhnL4+U6Lu2EjVnhgGwMQkjljHbue
X-Gm-Gg: AeBDievtkOzcQlA4KiLpgZyoxCuXJ0Akq2GQvp5rOHBubE/QRaOsXLABY8NLb/NSYZN
	KNRC60QS+NmCGJPUXorUxnq6x9pTTAt0u4EG/uX24jx8cWoJb9uiACSswTtiXQoNMFrhpM/ZwI0
	BarN/7ZeGx4XnpedFmDOmTeZWrcGd8FdKk5m2so8n2wI8+G7Zzl5i7Tx3vzvXmPCNMo5stc4220
	JzYDs4g0m8aY1vwN1utT0bSgh5cv1/0JTdZE+g91wZDggPkwcB4eJD7ARxVhaTO1qHsRbXLs2rp
	hLXlIEbqpk+qTVlV47vqzuET9A8WaIUoofQaMLc1f7Ibss/pV636DJBgMYrb9W5imJl4qiFUOYo
	THS5B2JYy+XgKd+eWcLriJkuS7H9LYrt3Vmxs+dASe1T2XFjuHtVRjN0ub1Ww8aGsrkJ3I8mpPs
	HEb1M=
X-Received: by 2002:a05:693c:310b:b0:2dd:649d:751d with SMTP id 5a478bee46e88-2e46538dc17mr12387000eec.8.1776925790175;
        Wed, 22 Apr 2026 23:29:50 -0700 (PDT)
X-Received: by 2002:a05:693c:310b:b0:2dd:649d:751d with SMTP id 5a478bee46e88-2e46538dc17mr12386981eec.8.1776925789616;
        Wed, 22 Apr 2026 23:29:49 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53ac84c38sm26929968eec.13.2026.04.22.23.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 23:29:49 -0700 (PDT)
Date: Wed, 22 Apr 2026 23:29:47 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add
 support for glymur Gen5 x8 bifurcation mode
Message-ID: <aem8W+tV6POa9VRF@hu-qianyu-lv.qualcomm.com>
References: <20260412-glymur_gen5x8_phy_0413-v3-0-affcebc16b8b@oss.qualcomm.com>
 <20260412-glymur_gen5x8_phy_0413-v3-1-affcebc16b8b@oss.qualcomm.com>
 <20260415-wooden-prawn-of-lightning-dc1ddc@quoll>
 <aeBQRStG3imY0cOe@hu-qianyu-lv.qualcomm.com>
 <fb6e8d3c-4cb1-4c20-a570-e9f6ae9a651c@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fb6e8d3c-4cb1-4c20-a570-e9f6ae9a651c@kernel.org>
X-Proofpoint-GUID: SDLyCs3rb1IK7d54vljSH6wECBCfimQ0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDA1OSBTYWx0ZWRfX/mkBLiezSjs7
 fIMA5wz7aGJnTdXSF0p2kBgR9dhsUBFqRNuHNyyPuBtPx+x4i5Q3DKQnXvdqYMwqAB5qJeYclqi
 hjaWqS7BBCQEmpzhCV/jWDsHEdVvdbZ1GZsmWiKaoSuJhPy8hmf0Ob68iP0ICM5kES1KXW62eKf
 A4XySgRKnxDHi6ifGOmQ237+QM1t3SH9M2Rm0nQsvBcTJvCFb/MRRMqyE3+PxQBAFa4Nr/9YpH2
 RW/ufSeJ3Bv+k5VbOGWbCOsNYF8vRLXj62yuJNVGlV4PUAPBBRU2OFiEwo3suAqvk0jqB9fkZ9M
 SiMb27JpZC9MzO1wT8NWMpEjnH8bdNWBSyXXjvO5t09hI4W43Cpy6Z+3Kqc1jmnp1nitqwaqV6Z
 2iQFqc+n5Xs58K7LdoC0ePT6bd1ULlEmEJeWuqgOhCijjLSWq6/Xo7PScepN7y/qamRjfZ/YQNn
 d8njSEI5JJ7LUCzp2dg==
X-Proofpoint-ORIG-GUID: SDLyCs3rb1IK7d54vljSH6wECBCfimQ0
X-Authority-Analysis: v=2.4 cv=Nv7htcdJ c=1 sm=1 tr=0 ts=69e9bc5e cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=sVFJkvLo0iv11KXttJkA:9 a=CjuIK1q_8ugA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230059

On Wed, Apr 22, 2026 at 08:27:02AM +0200, Krzysztof Kozlowski wrote:
> On 16/04/2026 04:58, Qiang Yu wrote:
> >>>    reset-names:
> >>>      minItems: 1
> >>>      items:
> >>>        - const: phy
> >>>        - const: phy_nocsr
> >>> +      - const: phy_b
> >>> +      - const: phy_b_nocsr
> >>
> >> And now I doubt that all the changes here are for duplicated node.
> >>
> > 
> > All the changes here are for 1x8 PHY node.
> > 
> >> Maybe just the commit msg is confusing and instead of describing some
> >> node which combines two other phys just say what device is here being
> >> described.
> >>
> > 
> > Okay, I will focus on describing the required resources. Is the
> > description below clearer?
> > 
> > Glymur has two physical Gen5x4 PCIe PHY blocks: pcie3a phy and pcie3b phy.
> 
> 
> I just proven you that it is not true.
>

Yeah, I see it. I have to say you are right. It is a 1x8 PHY. We can set
the phy-cell to 1 and controller driver use different args to determine it
requires 1x4_a, 1x4_b or 1x8.

- Qiang Yu

> Best regards,
> Krzysztof
