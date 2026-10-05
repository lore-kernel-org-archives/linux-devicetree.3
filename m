Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4213A4C2247
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 15:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791214670; cv=none; b=QklQAMmtxYQzPraL3lOyIAvFkG+WN6QmBcogtTpdOhoPHZdrqtHnvnlYlfnCxIyMMj/YbMGML2CQH+CrGGUqaDZkJh+6rRsXs5sDpqrfxZUe8CdAcD+bEeL8HWsFqQxnzHovd/bDI++5U3tqAbL705HRyoAD3pOUnfvuDNNJw8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791214670; c=relaxed/simple;
	bh=vgvpS2Lk6t04h09l0rE9jrfZbwTb6cPjhGPRaAfSZOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h2nBhWCrEzh4iAyOaEi+bxwK5rL/l/gLkvyIxt/7pD/Focvhl2qG3Pv8Qb4K2i7XdA3kdKwnnVyxBkmc0YkZihftAgpMe0sbuSQBpL5uC+oU3hP5b8dAQhtPyVU1pW2hm2Hh8Zohc2n28b8CqWkZkUeMNfUWcvdGIJuBoa8vXTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=clNeinDe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KszjiGTr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="clNeinDe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KszjiGTr"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695EP4W52015019
	for <devicetree@vger.kernel.org>; Mon, 5 Oct 2026 15:37:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=86MBTh4FdyWb1ob4vTVauW7y
	JoJdeXbZGpl/ARXQ3s4=; b=clNeinDe7Tk5BhyPcv46soRco1RRK1OSNiyBZsWx
	LhBvPIo43t7TANxY29MSNRs+Z0iTJEkcgxVIyPSMPYx7DamFxZf1IXEpkWHa0cL7
	7gu+qu2Q8IbjLgfOw8VtI6bsXQ+J5cDOV5iLlESEN+oRHh/PobXqWCFMFjQLRInj
	+XBJwsb31d+PCtgzXp3XPazljeiErH0HgLEijkgFLm9KBIHcqdSD+P6JuEy0CYU7
	0ckQBF4XRJqi9BZFBvXksRe7gef6BGITEF/2N/wdBmFssPMFPzkHI5qDVYMhVzxN
	uOYDJ7ylWnDflNLPMu78gAC26uYnrCABCJxO21DYUzlFfA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h3xhs2s7e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 15:37:47 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d7443e0f0bso32863415ad.1
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 08:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791214667; x=1791819467; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=86MBTh4FdyWb1ob4vTVauW7yJoJdeXbZGpl/ARXQ3s4=;
        b=KszjiGTrZq1nxDG3XOCl4KZJZrEDixaM6jZpPMEQ0Cl17S1RvkyLMQ6MSRs1+FlERp
         yQGaGBOUrA/nAfIvo9M0NlZF3ovpLg+kCQOARBF8nI/xjOlSre4nK3TPY9r6ES4m8qh4
         tT5nRo14noLtyl6pI8O4n0d9Y0ib3GvP1H0zsubJ9gV64s8SaLxgpUaDlvqvSCFf4Dng
         btO0kcdCvQ33m18wTCzdc7HlsTya70MaoCYrayDHIzMThh+kVgV65tYdh3vfng5SbUVI
         d5xLd93s8yrnCXTpiFIBwquk8qrYBiJOWQ0ZkdzsnA77qXuhlqwp09QM9qROZtav+aE3
         kBDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791214667; x=1791819467;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=86MBTh4FdyWb1ob4vTVauW7yJoJdeXbZGpl/ARXQ3s4=;
        b=CORhJK4Z1SQF2HzRBkAlDYaJr0QHOsX4ztUok24ZKMXM4zLdXlKuGdwTsqBwqRX+92
         /Mz6EoG9fCK1mbjkJcwbgixxF7gbRggBud9bvktW+z52FLmS8GoASV/osxq0gWQ1MC4p
         s02ZhbteZED1PRlfWaZjx0gmSRcOEXbT5cGAef5V/we/q+7xOiBJAIcZpp4WS16YcrQe
         w/Cc0wV9nyWA6a3kO/khiEI0uDKRkkMRhmOAVp5tHk/GSuunW1KZ28jb0j6gq1D1CHTx
         FXgUvzL8CPrvl5+YFyZ2AA/3by2lU5C0PDuc6vIrmv8+u7HXvpQLJrjyBEk1l4u3to7t
         6oWw==
X-Forwarded-Encrypted: i=1; AKwUvBzTRcyJXx7jsybpYdpIvXB42EOibNhPiDit7k8Sng/Ut8OCHJjMA8zbVceqp3Kmlv2hGbyAgt6So5Xn@vger.kernel.org
X-Gm-Message-State: AFq9FYISg44BOod9GFuhAOchygVJyvKFIm92RLz7Oz5jobEBTFqYp69L
	O0MT2SKNh11+Eb7iCdIoCGhmPY6vVBDny1yogJKoN7cM69twXramZWs9vDufe5pAMZuI5gmh3o2
	ZHNZw/TznJYCDkmPplMgBgVN0brfhIqZG8KPS1Ozj0EnECcgN/aHomgc7VS+23JGO
X-Gm-Gg: AYBFou3YHzP/6UEKFooMvR3xGIG4TuPCDMLs/EvRwr8gIHuT8OR5mGAFe6TP8tr8nw9
	2mppAzjxiX6L9dE2U+5Dg3UcMVGtY9YDp7m+vnQZBFes6zAlZybDtVKpEIcpWJV8n4bcnaqVSDg
	Pasw63/HfrQ8oGms0qIGDJeE28r4A8oW2nvkrw7p6id3qsGS4Kl3Qpn1IlIfrqN23N3SVjnEAII
	E5MRSeWmvk7dy83Yhall/1WG2yT/EERSI/MnQ/br6V8+cieha5WLYfUJQf11Pe+DB3Bq73NTxZp
	fAX6ZCLpM07tJJ1gONGXJT5kN7kJqtHDLjaIg4ppJ2d5gyAPgDOONorUPpwqTA3D3wTW4VP6C59
	S089QviWbXi6qWHfqA3D4E5qzrg==
X-Received: by 2002:a17:903:f8e:b0:2e5:397a:b70 with SMTP id d9443c01a7336-2e5397a0cffmr67153945ad.56.1791214666626;
        Mon, 05 Oct 2026 08:37:46 -0700 (PDT)
X-Received: by 2002:a17:903:f8e:b0:2e5:397a:b70 with SMTP id d9443c01a7336-2e5397a0cffmr67153565ad.56.1791214665994;
        Mon, 05 Oct 2026 08:37:45 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e5a5edd6d4sm9450835ad.56.2026.10.05.08.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 08:37:45 -0700 (PDT)
Date: Mon, 5 Oct 2026 21:07:37 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: remoteproc: qcom,shikra-pas: Allow 3
 IOMMUs for LPAICP
Message-ID: <20261005153737.opzzuflsioi6cxqo@hu-mojha-hyd.qualcomm.com>
References: <20261005-shikra-el2-v3-0-618f7343695c@oss.qualcomm.com>
 <20261005-shikra-el2-v3-1-618f7343695c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005-shikra-el2-v3-1-618f7343695c@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: PcxpbFSzmTN-dDF4YsrMfPViT_mIjudZ
X-Proofpoint-GUID: PcxpbFSzmTN-dDF4YsrMfPViT_mIjudZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA2MSBTYWx0ZWRfX3zfB7u/CXny/
 +kPIagN/NtqGu91FEvoQpJXoQK/7yBKjpfIzoFnGoNblUWNibqEz5wtICcsFffl9TRfU6UBgmNu
 Z2dwVIR3uymDlgQ3+8RGMIYBKorYA/8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA2MSBTYWx0ZWRfXzKzWgMwziZkX
 1+TdGtrio9E9ScPK7Z/IdPFROl7C/fqlYpe5njnl3nYlo2Yly/QrpVrSPtXW/3SCIUmlelKh5I0
 Ys/c0AsUb6+1GecxJsK5ghn9Io+Wjm556WmEUNg1bT8Wi/yh5cjtw1yV/2OUJlmwt6ce0qZde+z
 o7VEsyXB0ipjEHuSmqUSwYDLfcu/YNAm+2rNJF4XEFM2X8gIywUOBqA5q3kHebSw1dUsxVq98lj
 G0YVALNegH5q8hpkXMvldBTnkSAOns0g2Myi5Yw8hAVI9XJzAWXJ/T9DuEaqolC3SCNAtYFEWgG
 Gz2QKpFsLC92oTmq1++6wyUQ8Xdd7gjn+OU0fGno67K0nbqv04fZxalY7Pe7YIKI7WW/wYB0PHW
 QZMAePy0UCSjPBTA0vmpnOmKYbGC5jCE6LvtzfqXWnJMbOy4mldI8ZVtKk1AO4mNOvcAbRkqeLT
 BqlDG6ZPOcR3shMxyDA==
X-Authority-Analysis: v=2.4 cv=Q6tHcI2a c=1 sm=1 tr=0 ts=6ac3c44b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=jaYNTG2l0Jz8a-xFDoAA:9 a=CjuIK1q_8ugA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_04,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050061

On Mon, Oct 05, 2026 at 04:44:45PM +0530, Komal Bajaj wrote:
> The Shikra LPAICP PAS requires three IOMMU entries. However,
> qcom,shikra-pas.yaml inherits the `iommus` schema from
> qcom,pas-common.yaml, which limits property to a single entry.
> 
> As a result, the LPAICP-specific `maxItems: 3` constraint conflicts
> with the inherited `maxItems: 1` constraint, and a valid LPAICP node
> fails schema validation.
> 
> Remove the pas-common schema reference and specify IOMMU entry limit
> for each Shikra PAS compatible: one entry for CDSP and MPSS, and
> three entries for LPAICP.
> 
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/remoteproc/qcom,shikra-pas.yaml   | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
> index 34a2f15e9361..4196f61a8ba0 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
> @@ -32,6 +32,9 @@ properties:
>      items:
>        - const: xo
>  
> +  interconnects:
> +    maxItems: 1
> +
>    memory-region:
>      minItems: 1
>      maxItems: 2
> @@ -92,10 +95,14 @@ required:
>    - compatible
>    - reg
>    - memory-region
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - interrupt-names
> +  - qcom,smem-states
> +  - qcom,smem-state-names
>  
>  allOf:
> -  - $ref: /schemas/remoteproc/qcom,pas-common.yaml#

I think the right approach would be to remove iommu from the common binding
and let the corresponding target put the constraints.

> -
>    - if:
>        properties:
>          compatible:
> @@ -112,6 +119,8 @@ allOf:
>            maxItems: 1
>          firmware-name:
>            maxItems: 1
> +        iommus:
> +          maxItems: 1
>          power-domains:
>            items:
>              - description: CX power domain
> @@ -134,6 +143,8 @@ allOf:
>            minItems: 2
>          firmware-name:
>            minItems: 2
> +        iommus:
> +          maxItems: 3
>          power-domains: false
>          power-domain-names: false
>  
> 
> -- 
> 2.34.1
> 

-- 
-Mukesh Ojha
