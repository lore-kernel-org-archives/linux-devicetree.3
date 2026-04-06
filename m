Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40B231F9A6
	for <devicetree@vger.kernel.org>; Mon,  6 Apr 2026 19:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775503707; cv=none; b=J34RMmv/4MhKOJEF1awwZMjXRjWzNa81qBVG6l/2+qbCvEDWAFHQA3HnCrt85NURfOhnXUxsjVC7+NMR8f2D7NH5C5uFTi78QeL/1Qj6yKZF7xvAPlf6rsPUKmyjAs5wLGMSw/Pi/Ryt6oy4NxBIZ5GpJlNDzN3n59dFOm99ipA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775503707; c=relaxed/simple;
	bh=5CQHjk8TxMPBOrtnMSVXo2rDZRTZx2RTzqeY8eEF4eI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kR4FdmQ+O/P00m+yWQzCTTBu8RjIXcT8Gk3Gp/vUh4uI2aTYk674j+2bzO0C3Reekb0rIRcrf2oYVkV5fBDfs6UJqm5AlARxfxFG+cIRqcUGoSYPlNp8/N+XmSmyT9uqXXV5i96X91DRGySiDLqVIRbEQNyvtwxShcgPxSn3UHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A3aT39X7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L9YOzAY2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A3aT39X7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L9YOzAY2"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636IfkuR2209384
	for <devicetree@vger.kernel.org>; Mon, 6 Apr 2026 19:28:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TKs0hoZg7/Rf4Ax71tDzHhOn
	63+/78a1xhBYwtl24Hs=; b=A3aT39X76B8XL3aL3fKqK59Q/5Ynwv722zuEDiDl
	0kPTvjMaduAf5Jpk+PGh6UO0tHelloIQSY0Jz6PAgiX8nIr6DonlFVBCW1CfuZYE
	Iq57ScPaBiVI9EjIJt7j8PCFF4rtbnO2z1m+zMniVHkr+6AiXgqnDjPZaB3zQBdA
	q6Ez8frP43UFs4WJXiWVqAQSnIrK+BBeZQgxjpSVQTJcwvFeIdHihb8qpnyo02VY
	5+DkRzLdj9LAMxicUHCDtUMO4PKNaPFYcZw7U/G5UCTnmCSZRGwUb88LOIeRJW9x
	AQ9Bv8s66qLZj4HuT7bMsYPucidzDlPdOWpx8pKcDys22g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcck09d5p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 19:28:25 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d826ed6f9so45864501cf.1
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 12:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775503705; x=1776108505; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TKs0hoZg7/Rf4Ax71tDzHhOn63+/78a1xhBYwtl24Hs=;
        b=L9YOzAY2kFzinQz80/qO2aRYk3AZFOlQ4dQoQHmz92+S/Op2krmamvfmUa8CxTzq2N
         l5LTX5UlXuGXZ5LtolJ6XOPGxEWiIYqDTRPo+LJ/0kKHkewNnsZJpKu8E8/4TyT1ZHE1
         eqdS04F+F8AB070LCcDpSLxxsZ7S3GN+Wm2ge39diaJtdgxHG7timXdFd5JVJHqn9Fna
         hsNKMq8215Pi3pKmNLT7rJkbgYGAVYEm7t72y9fcoTXyoNKV/5C8+NjEYNWpoJZUXSox
         dXHRCkxMMTevZDdhf1IIYrL1xGZ/w/ArXAeWHKfTciGD8Ub/k6l/7CPU3x4h4y1GiUu8
         +wYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775503705; x=1776108505;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TKs0hoZg7/Rf4Ax71tDzHhOn63+/78a1xhBYwtl24Hs=;
        b=Kr7q0KJQjhM+qhcn023uJBJsu+Bepaq1d3j6bJreMg25FO0Wtko+3dW2sPtuDIfjVX
         hEv88cgTP/aGWeao2MVKAcatzxBB6osAvafxaM4BUZ9lBdyacv0zK6GmqHD/gh6HLG9u
         WXsqCUcpJiHxWnBFuaI5lHvSUw53fT5/6/yMDI5Arul5vNQeH2LysGVe7mjF10pezaaM
         6NLCDGyIMtF8dcHqE7V+zUNjiu9KY7/N1z2JxsFM55I74jx5MSEs9whMMbzW9fsaecRw
         KIR66l6boJ/mgxn/oc9e6Go5dUXG1ePL0bRdfsCr5VtDKOGCtg/8zsgoLGZ2COu/IMyj
         GUlA==
X-Forwarded-Encrypted: i=1; AJvYcCVyKCZ1UIpTvdAkDd7ZQSpAqw1E+l/ip9OuJC3gX227y4NBCi81XrQXqL+67PFZnygD9AmgJIB7hbUZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9mexy04OLpcl8ZoHuIaOVSq4ULaF2Yvhs4G6l9ZD2Avn7s3U3
	HGZLc5gDO+KlimrRWnovWIOMOB+1doNgW9Qv3i/rsDXdYR9WJ+uqoT6GBLeHwkVRugHXGlO9gFO
	zr/bCFBks3hrX/WnngruPs8aO3QhKq7E25tPk2a3YdjIe2Wj/IlDYpE6Tqr+8HbZQ
X-Gm-Gg: AeBDiesHPFGz/Ebden4zXKnWsn0tfQTl8LBkXyh+JWywizxAyqwoAb+O+mnUXyoCS+Z
	aBNGAs/cd2NQ28UIyCIXRwEaYX1DCjXIOjKo5cANEjRTUFcfWhT3VuOH5pvfsZFmbQT56m1wROo
	LJOy/67pjFSkq9IO0/EpDkrCmEC/ponJRXf38CQruHAXhFFc/uK4+GPXrV9P9TlrTIO84x+1jwL
	jiBqLruKZVsbj1X8s9X/JuE4KPekLWsBp2WmbpIAq9a42pYZTK/L7hp3f6qqL0jIEkkanyuQs6E
	WTrmlyH4wFms6UzJJsEZFxtf0hFXuc2DVAnkY6a0vPf+3U2L7Q9t8/EhEZtxOAYQs04UMEiuGZN
	1gCtLtC7+Avsj8e406oh999Xa87mvrtH9ian+bGdki/4YJPPjDrMPQzUGpABlJVRYb0pDndWJmU
	ifNIs9aUuRVPM4tizsAT2BrLRlfYGTgq7ICp0=
X-Received: by 2002:a05:622a:1487:b0:508:ffad:4bf4 with SMTP id d75a77b69052e-50d4fa37523mr202608711cf.5.1775503704940;
        Mon, 06 Apr 2026 12:28:24 -0700 (PDT)
X-Received: by 2002:a05:622a:1487:b0:508:ffad:4bf4 with SMTP id d75a77b69052e-50d4fa37523mr202608361cf.5.1775503704361;
        Mon, 06 Apr 2026 12:28:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd217c708sm32326521fa.39.2026.04.06.12.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 12:28:22 -0700 (PDT)
Date: Mon, 6 Apr 2026 22:28:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: kaanpaali: Add USB support for
 QRD platform
Message-ID: <f4txdswnaprtgoomdngtbmi4juirntclxzcbe7ay3vglz27osk@pepbn5mcuceb>
References: <20260406174613.3388987-1-krishna.kurapati@oss.qualcomm.com>
 <20260406174613.3388987-4-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260406174613.3388987-4-krishna.kurapati@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=dZqNHHXe c=1 sm=1 tr=0 ts=69d40959 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=lzcha0RWJE8jdVfZHw0A:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: F452joOAmIZ_2oip-aKbB2cQb-epDGFl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDE5MSBTYWx0ZWRfXz1cJpuvv4/1X
 QhPpY7thkUPBv3S2iwqLOR1aww/d2LQdFtmksLIAFsmtYSmKFtPRJYuGNXv5yglLOGcTfc8cQ3P
 Q+CtnGNft4nNewMKWcQ05mAFeYMYepwzGHBVATxdJHgdTArCDSYntBdntfzLKITJ37Pb8x7hJO6
 jMEm1HFOC8MQzOB0B4azYmJ4NjBhDWmL2gbR7Ka7O1Wk6opms5dlyqAa2sM0cEI1kXqVDh367rO
 c9CUxQhla952PGZ+FCj06tgJhxcsDF0OdDfPODoXovvrkcKfN9fwwmrmNissFCPG/nhluaZ6Z0N
 Z/OP7vZ2r/vEQOgqyRLszn9dGlwr6pBkz6vF0u22FZir9VfDhg7f2/zoKTEbCAaVVZTxBVEVJ3m
 4i0lTXf/THMG6WtIa2ETJERs/s1DXJQ7x1NsiPB08CdhUXpa4Gi94jXJzuzoEUKKiCcOQ3l9HjZ
 tR7qVRPcLp61RTbpkJw==
X-Proofpoint-ORIG-GUID: F452joOAmIZ_2oip-aKbB2cQb-epDGFl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604060191

On Mon, Apr 06, 2026 at 11:16:13PM +0530, Krishna Kurapati wrote:
> From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> 
> Enable USB support on Kaanapali QRD variant. Enable USB controller in
> device mode till glink node is added.
> 
> Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali-qrd.dts | 27 ++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
