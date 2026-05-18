Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7B23F1676
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 11:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779102392; cv=none; b=r+4Q2y0Lk+6veHW9jCwvrca44itQyKMZdv1yXM/AvPacj3+Xn0qGWt8lGk80TbAQaUKNXbiTihKWo6EGw9GZRD2CWkk6aHMpq75OSfLFOsf/g+U9Dh9AJWJvlKjV36dbW5gVQ0sVRc8atcv7g6gt43+UyBV19XfDOJFl4zyyCws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779102392; c=relaxed/simple;
	bh=CpUYG6vS3S+Zh4vlEXo3mC+63dtXNGF7YJZd8O0qHUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DIP6WRMt3542dMWZ9lYGDy3Xd4EgUiLOOotp1AVKe0oOrFKJyqfzfZJ5l0SeH+XeMEy9Vc8z+jlJSFAtJiQV9L0eqED7CSMGlgm1S9mSRYhvSOO6+UirgXMXm+zZLxKI7XtE14t1SX7oEDifsBA6Ef0caqu4IsInnYDVN+FG65Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PmxrNzsi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A2ECIGOx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PmxrNzsi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A2ECIGOx"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IAGxFh3595488
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 11:06:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oxxEq02mQW5EXX7GWmzdPFvm
	pta8PWyHWKrV/zZVHTM=; b=PmxrNzsiVWBqg7AOYPAHkkBkMDVhcHaOhNF+EAr1
	7BU+zZSac8lCxz8GYzEUcsXFfS9fDo28XQ61gAcip/faPEzekKrxiKFwuKY9byVX
	bMCHvw+wqZwssIcew5vV8/evEL5/Y9E4kD9BAzcxp85e4aVPzF4KRxEiNP5TaBe4
	1p9XtEXqPrOp891WhmqZNbu9o5mDrZ1VU0Jz1Wx6sWZCrEBB6fGKnL/k4xr3RXrb
	zpb6m6SwYQ77rAUJa7gMimBaTReSYnzr7mHtXd+k/1LtU6qyKzTg+ocbgK+rt7Ex
	3PQPRANHzt7yjXS1+xyFR8FccHChzduCVLxaex7mvLABDQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6h0qe5jp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 11:06:28 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-369ef27fd09so22574a91.3
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 04:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779102387; x=1779707187; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oxxEq02mQW5EXX7GWmzdPFvmpta8PWyHWKrV/zZVHTM=;
        b=A2ECIGOx+tUTHrYwpex/0UKFqVS6Uy/Voz5KMXCD+YYOIti7cNCIwfypmGt9LMJhUx
         dfuaShznah7lUCmfS13kZ5uzg2LsXgrfD7GmzqFTkEP1yXZApQ+ANqvR33/Y7AZFcxQC
         6LfMx+t0br1JIi8VOKaWZ4T8QVJYwtXB326nYOHLHYK9DPiwkRwfe1bWNxldbEXVyuVg
         vxK7TGX4i2EHvVqWrAxoC8fvr97X/8ydcgiEyccVe745S1R02IXmvRI4mL/LMy/L9ZWV
         aJJdr+le3rFtHNEZHklV1lx/wiNHDG8rK3eQTLbnhVfmfbt6Xvjo/ma6Oxuv2+Wqle0+
         ClSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779102387; x=1779707187;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oxxEq02mQW5EXX7GWmzdPFvmpta8PWyHWKrV/zZVHTM=;
        b=BWpxXl+9wGsm5/8MvNZlqzEeMDRl/ojUt2pG2jyQg27N6dO8oW/73sGwcjDyXbS1fv
         JDGwmtsts7EbdVdfoYvdGiWZ2l4H3qSc/S/en6VYlZYjC7or4ytbZFIge8MS9D/Ec/xI
         a7KHGyVhRr6N3E0lGb0GoFNxwItoHX5ezaAs6SR7Hi2wYyrHESyZoJXw3N8giUB6n+54
         EN7iliNc1kIf+0h3kHgtfT/WZmc68Q5HxobWYTO0/EpOqIbr80vQc/e2Kvzw0V8qJUM6
         QQkxjeC6tM1aqIWjiVxy5NNxUDhG/er89zvRXQuwN94EVwpe42aBMn56EVZmuJzonHN1
         MRKQ==
X-Forwarded-Encrypted: i=1; AFNElJ9x6ecTgfa7KSmKotT2/e5Jd6xPo/O76OBaci3qPj2h28CFHTNfhXXx5WpWzulM0xvj/GwmLn0+KDoI@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm++nfvtP1tApUHkXoqvDXKOYkP9gccikxlxkN8kB3mxbtdNVe
	0Vynvod6O03JLqTlNb7MaWgl8JaPHzlq7WFGkm0AxgUcnCPF7/0JXYV/CLyVEJu4H9Xlgix5V+C
	G5NKTZ6eV9xE+zMY0oG5s5LdrdF+r/be3Gd2jT0dnUjSPvO60irQdiYJdX59NgN4Y+LtVTeCd
X-Gm-Gg: Acq92OENyPK8BHMEpLmGWYUB/2ruk/B/0YiXogyoRwslegDX0tnPnvbHq9QZ+Lg9n4l
	+HB314MxcgwEXeVUo0HvHJU79DzSrD3YXfIhvf24L6IrQeCUCG9+Utw2KdSDJckPrX2WTqxeIEn
	5cjpwyPpF9GTQUiMiKmMdeTsEqTvVRrcv7Jhf0i2UaJjS9RsJ9o/cBRKtzR98yn2UIrXeUZZ3Ip
	egtrGUSJM27sESenuvCqyq+6w6FsGeDx0YurrmexIq0CsdWeMKR0JnK6h4mvv82+ZtIT9siqedD
	yoIX9gG0gqLPr3tsRZcELQ0dUwRQm+sNmtwKtclE2uW5jrIoEGu3ps7YiBwbJBvx9ynyKKyTxCd
	nbp/LVEhWeWDfVTDsc0G+/aGzxfYzoDZ1sA2Hty4pTLLmyKa57ax9BQ40g2o=
X-Received: by 2002:a17:902:da90:b0:2bd:612b:912d with SMTP id d9443c01a7336-2bd7e8ad548mr152759265ad.14.1779102386828;
        Mon, 18 May 2026 04:06:26 -0700 (PDT)
X-Received: by 2002:a17:902:da90:b0:2bd:612b:912d with SMTP id d9443c01a7336-2bd7e8ad548mr152758855ad.14.1779102386228;
        Mon, 18 May 2026 04:06:26 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5f30bsm167923825ad.16.2026.05.18.04.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 04:06:25 -0700 (PDT)
Date: Mon, 18 May 2026 16:36:19 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Xueyao An <xueyao.an@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] dt-bindings: dma: qcom,gpi: Document GPI DMA engine for
 Hawi SoC
Message-ID: <20260518110619.su7gh442g3kon6ch@hu-mojha-hyd.qualcomm.com>
References: <20260401124028.589931-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401124028.589931-1-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: nYC6y6Kj1DR9CV0qcnLbN4ulGGcNvBDz
X-Proofpoint-GUID: nYC6y6Kj1DR9CV0qcnLbN4ulGGcNvBDz
X-Authority-Analysis: v=2.4 cv=fIMJG5ae c=1 sm=1 tr=0 ts=6a0af2b4 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=YxT5vFHApILTLK8CKXUA:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDEwNyBTYWx0ZWRfXyw2nqvIYd2hP
 H7E6J9czpKikPLtDQw6qBEXBFh+BoIlOOyPTewmRXajE2ZgZ/V/BGX64+U5iOOiLqOiB8FBJCK3
 LrZ3PuLTG9aK1A1NIjB1vusQrYo/qU7T4U0Mr6L4uUiOL7T/BAOjYBLzliv6Q9mRAB8GhwlfGx8
 xEZyQIpX7Yb0OLqkYXi/MkxVeBoGuBuoyGZTuS6XxTPmSJB93wUvttCXjkOcjR/5lyaeAGhl35V
 Wu7uCxPnl3SfJc1rNn2MRfBUShvxUyVaUnwzTkCD7ssreydNQykA6vOx1WpOHnK8MzRI8fPPPFZ
 q5nJ4LHov595m+v6md4w2hPnB0/NZbia2kakj6P9EZT9mDB37CxR5x/oMI2p76TtHwx947SQTbd
 t1IBr/cDKA74MCBNDGcltZi2kvWYwuja+Tlolc/bnQ1VwZYcysuH3P8j5Vud5OMQPQtOGv6kHRA
 dvuJVBaeN46pNZ5342w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180107

On Wed, Apr 01, 2026 at 06:10:28PM +0530, Mukesh Ojha wrote:
> From: Xueyao An <xueyao.an@oss.qualcomm.com>

Hi Vinod,

> 
> The Hawi GPI DMA engine follows the same programming model and
> register interface as previous generation of Qualcomm SoCs like
> kaanapali, glymur, and is fully compatible with earlier GPI DMA
> implementations.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Xueyao An <xueyao.an@oss.qualcomm.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/dma/qcom,gpi.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
> index fde1df035ad1..caa2ef90d8f2 100644
> --- a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
> +++ b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
> @@ -25,6 +25,7 @@ properties:
>        - items:
>            - enum:
>                - qcom,glymur-gpi-dma
> +              - qcom,hawi-gpi-dma
>                - qcom,kaanapali-gpi-dma
>                - qcom,milos-gpi-dma
>                - qcom,qcm2290-gpi-dma
> -- 
> 2.53.0
> 

Would you be picking this ?

-- 
-Mukesh Ojha
