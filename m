Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADADC35C185
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 16:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775578575; cv=none; b=gk68Hke6kK0BBhW40tM0DZ/YD9yenk5xVAPmGJM7ktpQMLcYVZd1sYnb2lQSAmy7QW9xfwEAFF95vrVaXLKi90sAYd2iGaj95BrLzxdYOlpwKtleErpIzfg3gNOmUqQDmwDh4L7nBNUP7rW9+RwOGkc6A10skOIP/3xNp6GMppk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775578575; c=relaxed/simple;
	bh=2J4zbkyCRkdxpNFBhWUmGJNe5DuiJpTy1rHHoz6v0sg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OH5InfpdhEcIjMo/N+f4VB7/ra/H6kFB5dk1PZ/x3CE3D/Ap2n6wfSgsUZxAjfXiORgcauRfQ3Uy/qFBOdgqfKv3OJCT53Nzcn2nP+UxJ+BWe5E4EzNbov1U06/8qAGWlaunJ3j9PJ6Z2qZYfBH2n2RPYUlQgPMXnBgmAaNNgw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cr5xdDtv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kkRqQyMH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cr5xdDtv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kkRqQyMH"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637DIBdi4008693
	for <devicetree@vger.kernel.org>; Tue, 7 Apr 2026 16:16:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qSJcvPei7/x1R8FChuHMtIgl
	/NlquKOCcLN6Tv4gsmE=; b=Cr5xdDtvlik4Drtz1kPoA3z34IKBFzqnTMjxrSd3
	ojJPDQMtaeGaI6qTE3fa+FBqTwweOyajC/unTRF9d0NdiLw4p6nbaU0su+1jPoox
	iyf45rI6ks9tNu2Bb9gE3+NjVx5denIfZkT76VV0RVntOeXupCGkQLNj0wMVmz0z
	+jRV2jOITI+joE/VU36q92+U4HlUdtZr8B4CerlNA2itA3o/knjaieiIwa9DVdR+
	98CSOtQEd/nQvZQ1fPxU2RNt2UpwmkbG8CkCQthvpN0kd/f3+CHty1ie68stgnBo
	VFaatLb9STrj0S8NCoanCMwmViKg46MLJxbI5qIgNON57Q==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrkuh8x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 16:16:13 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2bdd327d970so26735eec.1
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 09:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775578573; x=1776183373; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qSJcvPei7/x1R8FChuHMtIgl/NlquKOCcLN6Tv4gsmE=;
        b=kkRqQyMH5q+sH4/tzqN0tGTFr3nufjZYbfMO9jLIv0ByxIIvz+kZGBem0L8ZGYKm/N
         DhPwq31cFQtFVHkQoNOmkmYIo3E4M6qui6C2C3DszPjueNIFWbldcqh6lQFE4DF89T57
         Pml176a0+PQSu1NJf4SybK5fYMUI5V1ph1OyaVDRWvfeK2HujLeAAB5fxDgvTMPhhJlV
         5e9+xLdi683D8H/eRoqix1LZBtTLvIt+wDOIB2qKmPV2natWWZnxyLQMOdxEl/HfI0FN
         dAO5uzWa4nESmhfOi09g5WWG30lKZkeqRb5ibmXXE1ppgxxhHTSlBNVxGZcOzXCmz9Lz
         UOZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775578573; x=1776183373;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qSJcvPei7/x1R8FChuHMtIgl/NlquKOCcLN6Tv4gsmE=;
        b=kYuAKlCJHpLxyXSaBfRnqWUfxp6pIiOwOyk7dwmPfC+n9AW9d5je2S8LIpBCqVcVOL
         7FNd2byUSxdYlP1WL4il8vJtug2slJOVmV1NRc4pLfPdKfacwLXNmsLoCDFrwPdRAVtR
         CBlWxiQX257D3qfqUCWATe4Y2sstuoaxsQ5N8H3pEnKXCDbsQ/E+ApDG/LsvJQICKGBR
         urdA/iZ6uPEM2nR1sowpfScGNMOg3sDdr47q2tKENFjHx8InOlCkEQtGZKOXsQveUyKE
         q9+1r0Y4KACRM0j5jKuIkHpimmUQKZZNqUCGya8QYqQp3grnkfeMPyJx/v0C+xu9xhTn
         faiA==
X-Forwarded-Encrypted: i=1; AJvYcCUvt/lhHrw6g/3DcICu6qu1L1pzYTuY1F9c/RVQDnuCBLPDjAVqAEiUgMvtBn4f8cf6Pgizdl+UuNO7@vger.kernel.org
X-Gm-Message-State: AOJu0YwEUZYOoX0l23IthVBZLKpGZ9DJ4nlcEnRtQn24j4F+uCbTZcfo
	Cdb97uYB0JHvY6D78+LjZ8zfo1Ek87kPgTftaMGz5lZ9ocNBw5CzV+G4zqDmNOqLoNxtN0e9Pgf
	oDavUO5eZmY41Ak5jGPStJL1v9Agv7B49cUW24hicP1FrEs7CSFkJ30GTwOy8Wwyi
X-Gm-Gg: AeBDieuz1WfZ9+FR+0yV4g95b4Hp6STWp5ip8All0ZrF5N12W12BTsOOMjRvbug/jUf
	Vc50PkrhwZ0+ZOXk8dGU7Pxj9zsIyOR/xnPDBy9YhG9GEoc0gAx4axrKG4ovWnV8rwWt0GavQuN
	wF3egHPgdj8RfM1V5mrYz/y2kSoZhe/8SEDHbVjnAcpMHr5rUyJ9655itua8+tLBAlRjjd+z1+V
	uhFa71ZqxxWo9IA2MdSabGL61iDS0UDfDn8iyOSb1+v4GmAVeNWA6xVqT3Kwg4b5Bulsis1kaxn
	KmvOsNpzFEQRRysRh8m/7l8rK1zQDJYQeemynfUodxMoOJ3jxTgAIxP4SCY6ZUEfyI7VttXljbN
	Li4R/DGinTdbVgRrIqrdYGWDir3NOfCYeB/+jUnxsz7475PqSkawrQMwX28t9JZnI5CU18Gqlzz
	c=
X-Received: by 2002:a05:7301:3d06:b0:2c5:6140:54d6 with SMTP id 5a478bee46e88-2cad60cbee8mr8792159eec.1.1775578572542;
        Tue, 07 Apr 2026 09:16:12 -0700 (PDT)
X-Received: by 2002:a05:7301:3d06:b0:2c5:6140:54d6 with SMTP id 5a478bee46e88-2cad60cbee8mr8792136eec.1.1775578571936;
        Tue, 07 Apr 2026 09:16:11 -0700 (PDT)
Received: from hu-mdtipton-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7c20c0c2sm17775196eec.17.2026.04.07.09.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 09:16:11 -0700 (PDT)
Date: Tue, 7 Apr 2026 09:16:09 -0700
From: Mike Tipton <mike.tipton@oss.qualcomm.com>
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: interconnect: document the RPMh
 Network-On-Chip interconnect in Hawi SoC
Message-ID: <adUtydkb4q7FfbS8@hu-mdtipton-lv.qualcomm.com>
References: <20260406-icc-hawi-v2-0-6cfee87a1d25@oss.qualcomm.com>
 <20260406-icc-hawi-v2-1-6cfee87a1d25@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260406-icc-hawi-v2-1-6cfee87a1d25@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Rrz16imK c=1 sm=1 tr=0 ts=69d52dcd cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=5zgHMrtXnVmdyp8FnAAA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: AuRnTTX9ee92IbQjpOiNdE2bf9d10jET
X-Proofpoint-GUID: AuRnTTX9ee92IbQjpOiNdE2bf9d10jET
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDE0NiBTYWx0ZWRfXwI1dWR0O2+Da
 XdPJBavtKSpiWYU/tdY8v8PVtyEsNY5PPoX1q7c0s/38iE2aALcWO4HvTnFbMJdrVKeIfgVIRH2
 VExVyk+Ot5LIrv8cbp2FkyeT+EMYdM0rthavi9eL4sbV+IsBEc5rVmUNMnWTZpmE7zaKHdXLh1Z
 9P16cJc5tBbtBcDTSF/gsyRaoGAphXkF0OJAjocux5tQ6xAQ1LCj4tEI/TXy7D5RWio1mLwZ4Hu
 kZ90jAcRBGGQiF0w4+kO9L/k4r4uBZDYizDVVXUfpAX5+laC1t4xbBrxlGv1G3oO52Ykm1VQ5kV
 knZ1FzcYGBlze434usYH/s1TspzOzNHFHcv1KCmsCgHFbolGQSebSkn4hyYOCmGBezxm+L5MF+I
 dyDn2Ww2y2z9kDdLFb0e02c1RxIv9CaU3ZBixumuXLx4ekAQxNy7IO23YjYHxjLRvn+mHHw8d/w
 Qnk/g1q6ZG07N5b5+Ng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_03,2026-04-07_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070146

On Mon, Apr 06, 2026 at 04:04:41PM -0700, Vivek Aknurwar wrote:
> Document the RPMh Network-On-Chip Interconnect of the Hawi platform.
> 
> Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> ---
>  .../bindings/interconnect/qcom,hawi-rpmh.yaml      | 131 ++++++++++++++++
>  include/dt-bindings/interconnect/qcom,hawi-rpmh.h  | 164 +++++++++++++++++++++
>  2 files changed, 295 insertions(+)
> 

[..]

> +
> +#ifndef __DT_BINDINGS_INTERCONNECT_QCOM_HAWI_H
> +#define __DT_BINDINGS_INTERCONNECT_QCOM_HAWI_H
> +
> +#define MASTER_QSPI_0				0
> +#define MASTER_QUP_2				1
> +#define MASTER_QUP_3				2
> +#define MASTER_QUP_4				3
> +#define MASTER_CRYPTO				4
> +#define MASTER_IPA				5
> +#define MASTER_QUP_1				6
> +#define MASTER_SOCCP_PROC				7
> +#define MASTER_QDSS_ETR				8
> +#define MASTER_QDSS_ETR_1				9
> +#define MASTER_SDCC_2				10
> +#define MASTER_SDCC_4				11
> +#define MASTER_UFS_MEM				12
> +#define MASTER_USB3				13
> +#define SLAVE_A1NOC_SNOC				14

Let's align these values.

Thanks,
Mike
