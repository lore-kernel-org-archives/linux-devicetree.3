Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD68631F9BB
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 01:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775699130; cv=none; b=h7XfUEFnBKlkG3AZOZF3QAj1jru3gOlwWc/DoJ4Qn9LndIUgtke4Dphirn43emnJGn21ICUSom7dXw6W3cwlLkv1rTcaN7zn9Yi2RzLVn/GL/rRkAwg4t0nOdssYRGTZZT2YLUFbvpBpxAdIZ/A5aGORG5LEm2cZkhncJl9yT88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775699130; c=relaxed/simple;
	bh=A7OiPeDVqfI9y90vgpOUe1guRE2QgQrmXaqIoA6mjAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qUPjUnsvW5Yvq96TzENqr1XmFRg2tuAdKxCTlA97Mttvk7n83GUjrpx5hlld3/InS+hF5dhAOxlrKfYLh7scdDUwL9epRzHxtZ2Hqq/zH4xWv5XiT35TYW930fCppXtbx29BmMJByg7UM7zCFBSfWjiJWfGNBvLOMit4y0eWP1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hMam3GzT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KnjQXUUk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hMam3GzT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KnjQXUUk"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 638N7EEN1923825
	for <devicetree@vger.kernel.org>; Thu, 9 Apr 2026 01:45:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yF3K6jCyIzB4qUf5GHAn+Gx4
	W2p721JX0X3qaCwgLoM=; b=hMam3GzTG429qX4ttEVsBAp1ZS85g08tvR26GdNd
	QNCVxLwQXZ0msw7nld4RfI/P2vYd7toEwvesfQwJI8Fysc6K/BA7Hsl0GHOHG5vO
	dZuqAwfVerh5hG4fEJYFLO20u4yKVoV664ikSeOoWcMU8uUqMf8/JYqpBX/Mcv01
	PXld2YCEv3B0U14selTLR+zVO6sSLEbSaQj25zm5Ntw2ka5zPp5FS0QGCRmAWREf
	3Dq3NKQlWuKbIZzCv5iNkgJf4FvdBSxjL3AG4Ia9CZEqLDHUsJIEXBUwwMW81IlM
	nX2JIIG/b5015FlzYPb02pXi6vh8w+uk0Vo3tURCKqXSuA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddt28sx64-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 01:45:29 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d5aa81907so15767541cf.0
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 18:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775699128; x=1776303928; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yF3K6jCyIzB4qUf5GHAn+Gx4W2p721JX0X3qaCwgLoM=;
        b=KnjQXUUkxD4fBvI0L861AYHneYAj1CYokqKF7C/GWGEakJcD5TVCcLUkErBw+vzvMj
         uP0r9lY1tP4jCbFPSz4T/Tbpv9dpfAXiTns7q7dxyUJL44H9e3AKeyW0Gxzwr/52j/sR
         LmlBHDgxMNxbdjKJnKNX9xVZHajDHMAWpTNI8ZDdeltECl1sXLdecQUb3NngMOs2L6R+
         y2yy0+AKW9vl7n4Uv4LB0fVKcDAIu0YDX1OPzAkf0d6GMqZq6pz6oSd/I/TvFU5FtuuF
         Fq2eAzTmLjiJYPiEApc10OdGx0UCR4wbWThDSqFXZqSWMlAlsWva7G9bff4kTeShfasI
         qGdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775699128; x=1776303928;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yF3K6jCyIzB4qUf5GHAn+Gx4W2p721JX0X3qaCwgLoM=;
        b=QR7puYB9zG+ik+oc7X3NsGyT0TfNNrdle2Bqy1f8WHBZVr/twyf37137gD7wzF0kC4
         5gdX54KWKWWIP2xBH0JV7u9N2Z6gMOgZeSNzSYESdjra8XHg6wVSlEASxLZ3WpWu8jUz
         QYS5j/b1TAs1J8BoJnfn5kfLYPqDQxQPiMNNwqDjZOYnpP1vxEioo7XR6jwIEoXjocP6
         c4/U2Zw7yEBv1shTenOBB3NEh07sSrh8kiUKFVChUQHC3WMrHDWZDgxj+FndbvPw2BMC
         iNixdY+VqMN7A4wUuuINuypyXRp2eWDs3EMgAr0WqPh21hY60utXpDUU3WLgY931/rl+
         71PQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAdtYQb6WGnglNDo50YfuCIdf520AgGR2oZFV6y6JW2/NYoIgiaNGOGh+j2jyA64fcmBZbM+xEwaI+@vger.kernel.org
X-Gm-Message-State: AOJu0YxSu+DmsojUiFgrNNOlJjGWP1UUU33h3YYa6h2VR1JBdUNjMOb3
	dxRYJsIu/mln+DE1naXNKLrP6ffJINrgo3RTO3yAgaiA8iBi0iXhWTnJxAFfrrJs3f+z/Ei9hDU
	iJtdjpjwcTUqEvOy7GQJq1ojF+WUlpPPXI3xUHSnFXxU0SToPsMIH9Isd5U2rPoGD
X-Gm-Gg: AeBDieuKBFNhb4ih/IQX91mpfT5UNJg3d8UcgOPoUdhpReCwvG0M6jiz6/zH+mlpCq4
	4ZgU4UiqkAB4R//KUqucl/nbIe43+btqzaDHbD55oqtamSMrUTkZWrAUNxItMWDSCU1nfTstMMD
	8mAD2TLLhSedpi0DUyPa7LgeZBJMzmFisMs1gtLi4Xvt3RVCvWvxx1gZvP3JfzrERwevunAy2Y5
	CL0lpddpN5DJBx1ctZ9fbYfPS3ortAaUylIyTfK52XhIE6KwXCFcKELjCkDEmA7G3nml2A2ij+I
	ws/X2D4oFKEwKck2tXDcz8xbknyIqgD5fv+cuSlJCc/KR7hKi716qeIFp4axrknw9J+1yNyuy/m
	cVPUH+gj3YUrWk7KrI9ZXcVV0rYsTuCCPm9GoxGUjqIZg9w3Qbs++vYbSxYvvKM9ynatQzCFUnk
	z+tyKCnhQKG09UwmhfR1Pz61IXmJwHwtBt078=
X-Received: by 2002:ac8:7d02:0:b0:509:120d:4311 with SMTP id d75a77b69052e-50d62b4b204mr346668981cf.60.1775699128185;
        Wed, 08 Apr 2026 18:45:28 -0700 (PDT)
X-Received: by 2002:ac8:7d02:0:b0:509:120d:4311 with SMTP id d75a77b69052e-50d62b4b204mr346668681cf.60.1775699127678;
        Wed, 08 Apr 2026 18:45:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6c951c7sm5090676e87.17.2026.04.08.18.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 18:45:25 -0700 (PDT)
Date: Thu, 9 Apr 2026 04:45:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Joe Sandom <jsandom@axon.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/5] arm64: dts: qcom: sm8550: move IPA properties to
 SoC device tree
Message-ID: <nwpdaxlob7sumv442qhiy34opi45p6qi4xldmijkfkvt2qhtcr@5eeuj66nrbdj>
References: <20260407-rb5gen2-dts-v2-0-d0c7f447ee73@axon.com>
 <20260407-rb5gen2-dts-v2-3-d0c7f447ee73@axon.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260407-rb5gen2-dts-v2-3-d0c7f447ee73@axon.com>
X-Proofpoint-ORIG-GUID: 2gm6je1Z24JaVXL6dX3S9AmpuLYEk7AX
X-Authority-Analysis: v=2.4 cv=fIIJG5ae c=1 sm=1 tr=0 ts=69d704b9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=h77gEMGJAAAA:8
 a=EUspDBNiAAAA:8 a=-5q7LgwmfLsncSyo2ooA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=PYyYjrCoJcZo81GydsRF:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDAxNCBTYWx0ZWRfX5aTN0d72SVIw
 D6RmIX2EIVqg04A35Ma2XhEPpU7TFWDvmcJgl6JsiBt+v30i2YJ2Gtuv0wzESVWAAt53WpBuPRh
 WoLgFa+IqP5Q3qmLILeRJW5ryXHj78l0Fo7T2kJzwncU2yF+TTxQJRtD5TgoJ//OY+QX2GnReJP
 Bq8OTp8SS9oz0PgI9fAUxFWzwZAZ6RkOFVuyJ1+/XfLvdRkeoDUZ07TL5gU1LHPN6xUow9qO3iL
 3Oz793w/y6kaC+6aDYkPljDchu7OzowdimhjNZKY4BNE/CcZC0JeMwh4k5VGFTKR/ELYtiiB0RC
 tOOz0m2VZ7fEdtm82fMDruzlnfZEa0F64DCf1TLBjQy7b8Y/ty5/vdPSfTrcOkRT0EXDr55V8kJ
 Yj8clS/O/C3gs8tu53sXGEQ3wsf9EdWDgDvP+htW4uYB5LkhQutwV2qhSGgQxJxIxffpPidBG5k
 odxMrqTBFdJGKxxIRaA==
X-Proofpoint-GUID: 2gm6je1Z24JaVXL6dX3S9AmpuLYEk7AX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_07,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 adultscore=0
 bulkscore=0 malwarescore=0 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090014

On Tue, Apr 07, 2026 at 04:46:46PM +0100, Joe Sandom wrote:
> Move qcom,gsi-loader and memory-region properties from individual board
> DTS files into the SoC DTSI, since these are common to all SM8550-based
> boards.
> 
> Signed-off-by: Joe Sandom <jsandom@axon.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8550-hdk.dts | 2 --
>  arch/arm64/boot/dts/qcom/sm8550-qrd.dts | 2 --
>  arch/arm64/boot/dts/qcom/sm8550.dtsi    | 2 ++
>  3 files changed, 2 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
