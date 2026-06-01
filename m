Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D60932F748
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 07:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780299754; cv=none; b=jSjO0fQ05EGv5/Cy/smGXswmxlYYcwT72lufFbRum5ssx2+G3GjVB6vZwnQjuZI+l10fDEMie/iV5UZ7oiG6S24PsmDyOwBZSw96unJoo3hgz4mjG14+82G+d9Me5WxT+jOmF24/p26KCuoYHDcNn1+fHWBOM2dVE9BypzABkqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780299754; c=relaxed/simple;
	bh=DYK+sYUL7Av8uBu1CqHUoleYd0NACg90m/0uUKoAfOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ONdpv+/npFV8LsGNXl/dY/p1iNS9zCXWfMyhqe+wQeiy1ZopNNudPMiOaoj1iik7yX5OJrt8e94d/oJ0K+u9XZONeqjI8nmEAGDkPGMBmw0Swcc6LfAJ3E1ce87C6xJoKOXFDAOiX9g485RmmXtHuDNJBxXZ860z8cEguoibC8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UX60/lja; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HvWTUt7V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UX60/lja";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HvWTUt7V"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65150Wkm1642824
	for <devicetree@vger.kernel.org>; Mon, 1 Jun 2026 07:42:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UXkAj/ayfqpLe8vFJe2VET2p
	ub3Jm3brorN1VW1Aky8=; b=UX60/ljaTl3beZFRxSI/JZXOkoOGbKxZ/l9q5qcm
	X0PCIblOwd2YJ3e4fKcscSrIc6Eytmb05K3+JWaqUDALGeoxrvBRcZMVHSKklOD0
	QM3npE4zI3LT7iT4UY7zo4KBq7ViM8TT8nDsCGVqT0lQaXKt89ytbL4jpCJzdJJN
	VqI8kCAR3G38LYrWrLfz7S2VoLqmbRH5CFMcnAX3aOOU8Nrwo5YuhNhzuLc9n6m/
	H7VIbS+eEjPAVBhYGqmlnwj0HNoCkQUKoyoxig5vGDhAx6Is8+g5qqBqDFNNeXz/
	taH4Vy0vWyOgnxgrRvrSdKZFY5+CNSdCjdxdp9+sGa9BpQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efq7fefyq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 07:42:31 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c0532a6588so16586755ad.0
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 00:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780299751; x=1780904551; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UXkAj/ayfqpLe8vFJe2VET2pub3Jm3brorN1VW1Aky8=;
        b=HvWTUt7V0RYrzKtO4pf1mtSF8cIR6TyVNm6BK0D8elTcFeV+VTvMYh8bA8LvvOdtE5
         z143LwmvVLJE9Vz4WweRn7hBezumvRdXJzJqYqOvAeaYiPQ7Xu38puB6eg2RyU1nP0XR
         rOv9QOET/tPtaVBaN037KendwtlwSo9XljVbLhhC/Kw9RpFovB2EgXiMamOLKBeZmvRa
         u04u2g3SAF2nus1OxDf/zRl8XCRguewPOmgoQVnsM86oJSq21yiSxs6WfIs11xRTGzT7
         kLtUMBysYutsZHuFVlwIa9vrHK7YIraTSd6lxpkwNyN0XdKtwbjyUDtKe4bYJF2JSpor
         Vb2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780299751; x=1780904551;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UXkAj/ayfqpLe8vFJe2VET2pub3Jm3brorN1VW1Aky8=;
        b=XHDktQKfb9yoz037m5wJqcPDH+zf4bJCrjFi/VTcxURQ+eLiQFevXH396+qMzsmBOK
         SZbQqJ7wxxeI5uYm+kTDN/rwnD2w82vq1b4O6Dlu1IGt5jlmfMaJ1UQwDP9uXW1A8N9N
         NboOD+rrDd2BbCbYOUrrd3xbZ2j5yDUAUEIP6DYIi5uIZXgsmcOVfcnpwBqY+qtWTVgG
         tEV/8szbpjgfTcHHJW3uIEN8+oJZBsxbduhODh9OoQmm102+UYzFuOCC5yF90lYn6tIR
         oXrr+Yvyz2EgVTxQ6vtDvfEvuWpKRxUBQSpYR65XHZubGCtpA0iGhS/VHu9pjmyQQ+q8
         2VtQ==
X-Forwarded-Encrypted: i=1; AFNElJ9tE8SYN52eNYHnUai6muoLc9TlrwlBnKQCJGsi73KDeNAAqL3qjZXkGlwDk7ikGk7fW62P20sFLshY@vger.kernel.org
X-Gm-Message-State: AOJu0YxTCclk7OwcMl/TosDYm4X8Bm4Iq3ENz0cIi2N4cZBqgvNQjGOh
	glZIaWZKV92EvvNLvDbcKIxzADh2y3i01TZu4tgzzsGSGHdKYODrlO8WkfbY0SDT6iXrU3sW26v
	Pw6v3XXJEkGZv7mUgc65EPl6NtYjuosdffnghuEDWK1qrlss6EMJY5MtyVff1glwA
X-Gm-Gg: Acq92OG4rrF1HgRg1Jrii0cuQ7f7zy9g6J6T+huY44o7CpXMkBnCSPSTFPPFbSiAKnH
	teUzWG0AV8KdmeUXXrm0pzj8BtNfh89WnBc1UDzB/ZVJ91Qb52N1j8lOCeT50VbAVYQo7juyVtK
	FByHxIJZQsAkOzd5gDoPTccBkK/t6RX9KUV0CnEMgSThl5S0NIr7OrqkAtlpUEtxRwu+Uu9nwF0
	1pVtbryvJ6BighjGnIm0gIKZiNJ+vpoPueyR/J1cBoEwnVB27AVVgR5CLhCCQWzoUtBwVTRx09X
	i4fqXd4E+PXHfpZX+Q5m/Oi6LvGK23XTYtohWvwrb/D9vO6sgA43GcoYGgD3ETMw5PNcdkHw72i
	PFGx9YjJL2t2vol4InSTIY88X+EkO5fHQqjm1sDCgIiozRAkSaw0lwkp9p30=
X-Received: by 2002:a17:902:f641:b0:2c0:baaa:db94 with SMTP id d9443c01a7336-2c0baaadf6cmr78918255ad.22.1780299750793;
        Mon, 01 Jun 2026 00:42:30 -0700 (PDT)
X-Received: by 2002:a17:902:f641:b0:2c0:baaa:db94 with SMTP id d9443c01a7336-2c0baaadf6cmr78917845ad.22.1780299750231;
        Mon, 01 Jun 2026 00:42:30 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c26b3bsm96095185ad.64.2026.06.01.00.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 00:42:29 -0700 (PDT)
Date: Mon, 1 Jun 2026 13:12:23 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: qcom,sm8550-pas: Add Hawi
 ADSP compatible
Message-ID: <20260601074223.hit3f7mkgj3mqamg@hu-mojha-hyd.qualcomm.com>
References: <20260427190614.3679937-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427190614.3679937-1-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: hxHbHSwCzi9IPKT8NdPiaYFfYy3Sfumq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA3NiBTYWx0ZWRfX3R/7+8daSlY0
 rjswtOD7fj4MPywka3z4UC8uNg8doSDtYAlE8D9T9eoY2j9+K58j7U7TuO/gSIb9LEZ+wxAjKhv
 W/UUd50jtmrLFdocoVpAVwudGcipJa10zeX+wessotDOiq8m/+44zi6Uh3d0confk1H+OR/UmZA
 IgSmnTUn7jEZa9CxSAVj7MoMWmn+vcqZVZOOomfT/Z3yjddlJG5lqXPE+KGjq1iAlRz8S1OIGtq
 W7NJfJcQISJqZNN856X/vg56Pr9rkQhB45b9rAR3/COI7S3okn+T2hncGG4g3R9o8Hlar95zOUO
 RbjZOm4dgqeYmQQuDELYwYIt7/9HR91ggFjPFEges5rrmFerqX0fMoporqAubtv3sAXj9/VIDqB
 R65QZDFaf30fuPZafz8q2EdJbwkIhrmAz7uxp4V7f8EBaaTgLSPup2o6fBPZf8CV2Ket/duEO7W
 BBba08jIiS/RnY9YfoQ==
X-Proofpoint-GUID: hxHbHSwCzi9IPKT8NdPiaYFfYy3Sfumq
X-Authority-Analysis: v=2.4 cv=XqzK/1F9 c=1 sm=1 tr=0 ts=6a1d37e7 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=JSqdKX-yHs5N7urRZRQA:9 a=CjuIK1q_8ugA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606010076

On Tue, Apr 28, 2026 at 12:36:13AM +0530, Mukesh Ojha wrote:
> Document compatible string for the ADSP Peripheral Authentication
> Service on the Hawi SoC, which is compatible with the Qualcomm SM8550
> ADSP PAS and can fallback to SM8550 except for the one additional
> interrupt ("shutdown-ack").
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> index 1e4db0c9fcf9..161e9b55cb3e 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> @@ -30,6 +30,7 @@ properties:
>        - items:
>            - enum:
>                - qcom,glymur-adsp-pas
> +              - qcom,hawi-adsp-pas
>                - qcom,kaanapali-adsp-pas
>                - qcom,sm8750-adsp-pas
>            - const: qcom,sm8550-adsp-pas
> @@ -104,6 +105,7 @@ allOf:
>              enum:
>                - qcom,glymur-adsp-pas
>                - qcom,glymur-cdsp-pas
> +              - qcom,hawi-adsp-pas
>                - qcom,kaanapali-adsp-pas
>                - qcom,kaanapali-cdsp-pas
>                - qcom,sm8750-adsp-pas
> -- 
> 2.53.0
> 

Floating this up, if there is still a chance to get this series picked
up.

-- 
-Mukesh Ojha
