Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F244518C332
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 15:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775835730; cv=none; b=burNgpKHTvoLUHEUYzHJmIDTVjFeHRgBldSqW9xsfHMjxIzB04JCjg70RCxPwxCcBX7QuTBVu60wA585o6O7F0CeHbG/LxzFq2sFPAs70ttm2RjQtjdqnJmJaVLxQzTQ/J7oAB0T7rgk/y9LnU2HrkRGPs9HazxCcBVYxZ1Qcvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775835730; c=relaxed/simple;
	bh=xIVUY+Pbg5/QfKf7tkCdKCtUq81gJSTuDxFQHY4fwOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SDtW8YJrnPXuGyYJSAJl17rVOdoo9tiyBPCYreqDtJUVyxLCqtgxFBWjNUG4JRyV+UEwIREHUdz1KtaThi/GQfGgujNDCGGelYFwIzz0DRAjBJCpw2L2DgTVx2Fxhrz3NsEx03f7Q6KPIQvmvmh4ZnHuHFLiM6AWtwxISgM8nrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OqL9tOyA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OjPVtr66; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OqL9tOyA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OjPVtr66"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AFJ9Yi3118215
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 15:42:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uqIH26VW1DMf9T7tCXVZqQOX
	a0zE5Lks7d0a2XG7EJM=; b=OqL9tOyArpbnVHCfupxXUVAzJAmzzWPrObveAXHg
	dcHRlhTD+emIPU0fbVHmKp3DNXGAgBRvzJ34YIM5/MtndovTK77DdDNVaoByJkV0
	ZGgqK9bty1/mSsRlymsWRgQI5pVdAmFObGVh0gTNBGs7LlHDiGZKNLtnyftqtgcv
	ANrg0WDgiQrHX3Q4QbqOQTaUryDxsV6x4KKOX130fgNfuTlN8e9ZigkFxQEMHgv4
	Ps9mqJa3DMt7GYkY3WfikZYe54TpoQC3e9WinQiqS4bLcIFVZ5j2rhLeAie2q+0P
	JPgnMjoTxn7NavB1n+qLGQzgIm85mz4EB8gp2sWXqxDlkg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4df3rar2cm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 15:42:07 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12737f276a2so12587524c88.1
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 08:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775835727; x=1776440527; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uqIH26VW1DMf9T7tCXVZqQOXa0zE5Lks7d0a2XG7EJM=;
        b=OjPVtr66I+Kedymg95P4S8e7s7M/GrI27DHNWoQIbMojGy0lot1CqDWO7oy8HOSNHT
         QaRriAhitWuevcmW5f8xnG+A5YQk2BnTXIn0wPqeIAd/id+lucQN69b/CCmL38KrAbkb
         Ja/A2PSACVoDZv7G/5ofzy6xpRJfsfW+GOZutLEBW9eRsf7qi0bgQN4yFN85AMFNyx79
         s4kFJ0vxpgioBp1f6KpD4GG3CyWLAJ3WRFRBQvuVVdZkgc+NsNRPCG7gXjK6PM9AN7WK
         HYQSfhfBpEC/W81g4v1o19ZLSWnr7rmPBUAK+W9ZJkSrz4NsnLa/qQZ2OSmD9d2NyYJJ
         qQhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775835727; x=1776440527;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uqIH26VW1DMf9T7tCXVZqQOXa0zE5Lks7d0a2XG7EJM=;
        b=PQKNaswo5HK0sUc1Ky3iOqQpkbICWnCs29TTZQs0c1XTTlnGRTIWBOSmVS+GktlsAn
         sr3L2dh4L44faD86GAavaT7rofwFqXiXHrshZ4jt2Qid9zUTFEDSQWMR5oi/7e+P2eBK
         WJ49w1hdPJ+srSd/bxuoO7q6efRg8BxKPkrtdD/9b4gVTwuXQboDdz6Cu1xPr9dxjnbE
         1HXxkN+rC4z4VuHfxm/MsjTgsEf9ienJHr9dcji4SnZl10/rA0AQfkr+aBEmGxGDYy1B
         1tfrbOrrhbvdGWR1y5jrxxU2jvF0PVQagqA39kp3ZpstgAbayPBSC2Fo0su/CTsFkPoz
         GjfA==
X-Forwarded-Encrypted: i=1; AJvYcCUj2zBH5iIY3kl1bPriTokh34F8e5Lt3a4tfNMJcwvKMHrHZiHdeDVbFEaIpWlwT9O1FkmMvaYiA0cB@vger.kernel.org
X-Gm-Message-State: AOJu0YwxPj56aiDTPYLOptAsELfSr+Wu5qpQ3Y3zS3aTE6x9YMBLNJ9a
	FFDiBwVeAarDzhZqlZVZxOhyNFNos9Xg310E50B+QF+esGluT79IPDlE9jFXz6gFAh7OYq7rxFm
	5MeoRGKVfdW1XRV91Jxl6FUxQu53OmwgtvfL0aQ4AhoSweZz3++ed40qCQlwr2vYX
X-Gm-Gg: AeBDieuBc4rMeSPqYpNARUrq0Q3u+uoTBIAP5Qa2RtzH4eB8ELqLdshzCN1LVN4GRia
	5kGdA2UO48IHw/KLqcYYLuX9X2xSeDcUKZdPvoGGEjGFd8RrfnQSKGYiXDjyWK/nir+NqEBO659
	r2Zt32+O4HViz1NtnX9njvvz5fmu0gdoSDKR5JeCvh8sc8TGC+kUX2PtatVZ+KrGMBqzzYgFnP6
	PzHMC8ypLtGdAminZyaYNKafxY7VqC3R34driYCUKFGGATOTvUvBzm0/uM0FDr6HoyTVEk9cZR4
	4beQSc0CBS9aWkz3XlsriGKVBO1SJWGKNXHc3jaQgPvQVyrqU8aFtqy1GNYLm8xx5rhA/4kn2n4
	cXTy0h+2TlHI4lr3QIWKwXtoJYnxJ6ZS2raTvZrv5IRluz+GwCWYEecWxwpQ7WIvEyHGB7jAjkX
	w=
X-Received: by 2002:a05:7022:60a6:b0:128:d9a1:b68b with SMTP id a92af1059eb24-12c34eee7abmr1952887c88.33.1775835727014;
        Fri, 10 Apr 2026 08:42:07 -0700 (PDT)
X-Received: by 2002:a05:7022:60a6:b0:128:d9a1:b68b with SMTP id a92af1059eb24-12c34eee7abmr1952867c88.33.1775835726421;
        Fri, 10 Apr 2026 08:42:06 -0700 (PDT)
Received: from hu-mdtipton-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c347fa2c9sm3838370c88.15.2026.04.10.08.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 08:42:06 -0700 (PDT)
Date: Fri, 10 Apr 2026 08:42:04 -0700
From: Mike Tipton <mike.tipton@oss.qualcomm.com>
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: interconnect: qcom: document the
 RPMh NoC for Hawi SoC
Message-ID: <adkaTBk50KYo7XEO@hu-mdtipton-lv.qualcomm.com>
References: <20260409-icc-hawi-v3-0-851cac12a81d@oss.qualcomm.com>
 <20260409-icc-hawi-v3-1-851cac12a81d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409-icc-hawi-v3-1-851cac12a81d@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Vs4Txe2n c=1 sm=1 tr=0 ts=69d91a50 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=leQ04dn23ONfhV9bpxQA:9 a=CjuIK1q_8ugA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE0NyBTYWx0ZWRfX4IyFca5uCL15
 WZiDzmt+SDtnKabrx9dclHVA8M6grvJejdp//DHpANkf63r5G7VgR39/bqt5TWWH2BfN1Cgt6p/
 AKNux99lFqCmiXfPxqCx9SrFzhHP9EaLkNTBZFNfe3DR5dEL8VoxRoLOHgYukbEUexcxefGyZEj
 AXGQNvx5W/Yif2DpHTY30rZ47CHG4Z4NuSbiTFx1vZnuEacty19v0blEzfKwaI6DmaAlOoGJVnP
 j03q4qoJuMB0qPrDqiCkdohCbfv0ynY02DdvsMXzc30wFps4kfX5PboTG6LF9Ww2AyKXUOw3tKj
 JmCukJlZjD0GEzW96o44atMx+RNpreiy9Z9j6Gm5+caCc/QRQsx7QJXmUq4utqSLOoG5JJg2uNU
 VJgORj+GpoVvVB5zPNQlO4Pgfn3/0vDC22uWXJ4DETI6LOdqlPW+jSLUlcHUUS/5/66TuktKgHh
 OirvaayaOOpKKtAZgww==
X-Proofpoint-ORIG-GUID: DeTsHmlTnjqdB02iTzwzoz4P9ING6qGl
X-Proofpoint-GUID: DeTsHmlTnjqdB02iTzwzoz4P9ING6qGl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100147

On Thu, Apr 09, 2026 at 02:01:37PM -0700, Vivek Aknurwar wrote:
> Document the RPMh Network-On-Chip interconnect for the Qualcomm Hawi SoC.
> 
> Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> ---
>  .../bindings/interconnect/qcom,hawi-rpmh.yaml      | 131 ++++++++++++++++
>  include/dt-bindings/interconnect/qcom,hawi-rpmh.h  | 164 +++++++++++++++++++++
>  2 files changed, 295 insertions(+)

Reviewed-by: Mike Tipton <mike.tipton@oss.qualcomm.com>

Thanks,
Mike
