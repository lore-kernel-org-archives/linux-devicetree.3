Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0707D23EAB7
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781571487; cv=none; b=DVES6DZNelugIdF8cOzY0PhwKllObLymbjH1MDid/69dHvb3/lnuzDk1ET58BB9AvpiGv0PPQA7JAtB0fZAlUUP+n6u82lQP3OfpXMJKkKpXO4Nqo+RxDVMd28td43HkpbryJW1twqt2mDYxT4LpNWtSXzlNgc47STZZPSXPrXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781571487; c=relaxed/simple;
	bh=V2izehxJHiz5lHOcnoDYAHcF/YhGu+nIUCvOKbDgH3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SbMJNclUta/wMUCkDVXk4+E7xzDUGS1KbNHmWJ29psRNs4UoS4+5Zq2LQnhLp0sPtXpEVMSa5cKL97jAO4V4AGCx2KEE8lLJAubdYy8SsWdSMutD0ahJf8BB7jpb0/taPJWlnhpy6fWtk36XGA+3619RavR83GpLpwLl1Ib0bps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c7ge/V1F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Luhk3rd6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c7ge/V1F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Luhk3rd6"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G0OPYk092150
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:58:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OiyIJgSEwfIFbV0JUiz7Djf4
	fEFq9snfYC04/f9wwkA=; b=c7ge/V1F+A+RO8G2+cW3mG52ytI1zAoYhxSqdq5L
	mgv5DprWep6Y51lqjW0owMchRhC2g45k7MZPsbkMlh0HouPwnQMDWwitCRqFKX+W
	WnIq0g33dKn7UQAi8UsZ+0dIE/INvcdMFEzbfIg710FU5/3ebRGETxvND4VCsvnc
	gU+wjIGLGw3mOKc7A874s0VLqb1XHHPA+oaVjOuMOJ/vZqetKovB3aWcrZKepK0z
	twphHXyrQAOXZHmJF7RE10r4VLEjl2UV0+pOhlgCr1Srz/fvIXdkGTs/XBQFR3dZ
	Jp6lAdo6/BRyV6wl2W1txsEDBe7LfBX4T2dJhtFvvtNyFA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ete9840p3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:58:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-918622c3c7bso592335085a.3
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 17:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781571484; x=1782176284; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OiyIJgSEwfIFbV0JUiz7Djf4fEFq9snfYC04/f9wwkA=;
        b=Luhk3rd6Vi9qBXMKrZbKv9r91SZ4/0OvwFUYgr2QaxMPcuIqqpA9vErV8K7a2tzUDy
         gLY/ilB2y34IhvDF5fPdiMlFMqYNfMK9PPaayTYwBH/QaxKWRHkNYIaVhRMSeeF+NiuX
         NZaeD2xYqtyzFZNhWxR5JXwTthLqW1UzoJv6QKZ8UdDMMwMDoPQlEP8FWJb5rmXEAo7F
         ERYgrh8GLQ8CfQIutoSuadP4Ighvq754p/ptJ4cKLiio8dkAh6YDdpbUmBNx0/ae/+S9
         Wq/ecdhrDAFJZXi+uUVOFuwuhjPb6k5IbFPdPKW8+LZzD8sSfY2QDIYdEcul8dBziB0U
         P8YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781571484; x=1782176284;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OiyIJgSEwfIFbV0JUiz7Djf4fEFq9snfYC04/f9wwkA=;
        b=XXE+yAhxbrIFYKBbA/XjhFxUHEW5QW1Z6nR/uI9xU8ciBfMRtFOTjUUIFTxMZTNb6N
         oEgSSR/q4gpwUIeDlaYaCflC6UsvtbFkC+I+0kSQKzPUqQaygmOcCgDtZEKD0CxxONg0
         E8XAVphwVCTerLvweUaUmSp4+Ts+mDpbBRp/06Wvy/05DpWBXTytOdFYYR0pKcIUgAtw
         4C92p529Lffg2Bb8XhRdpibXjeKPOOBFzJfCoXXpca3iiT3aJvD9c9JxtoRpnnShjOYn
         /lOkdVgDlfESoxuOrRQx+lqAeP9+gfN73CEYyWM4hG0jRZbHG4JfRkdBioZ/7BpuGIse
         qIPQ==
X-Forwarded-Encrypted: i=1; AFNElJ+/l9Yi3Dg/TiGNRddznVlk5QjYpNJ+1ZHnRoQ/cHDq/d6xWjUE61PG0qGW9ahFfdsX2kfGVOaoc5dl@vger.kernel.org
X-Gm-Message-State: AOJu0YwHE1mvwOjRUkd9Km9bdrxmO39FCLx4FbRURlnRsfHyN9lKUnxH
	CsVG/IuXV8Fvrz9hLi2lUIspPoNn4+EOUux9RC3NFZt1qdVt3aojkSo5vNbDHZQqDzSySH/GPZg
	kZyPrrISPayVoHvuyfI3JjLQ8iy3x8yJe7WQuYF7B1dvPw7B22D0qgrAGoz6M9OsJ
X-Gm-Gg: Acq92OH/ilS/wg0v/9hNjeaZ9qM1hnaTd9Wfe2F9zMevit+zlHPVDVH72ZYIs2impDE
	8XqoGXJN9rAh1QeJliTtzGgyDOJt7KyscjVdu2wiXdNRrV6GNp76Mqse4K1Rc8iL5xz2XjjMGaQ
	BggHSAyxJRB/DiaxvvqLpwzOaPgOcxpiaOB9cVgE0nS+Ysh7nksTsfZjK5dvttYu63syRzEy74V
	Aw/2qWxiMK7zWxtJz6J4YODlgt+KZ3MSng+w5RBCYeGb8JddVlz3zPIyN6LpNkrFtFF51NglWCX
	A/Qj0OZN3eiIma1yGPuC94moVZfwlG89mSRLQKZIxKqpF5GCa7kY6sJ65lIS81MU+ADZe6CGMfG
	4crZerivWafRw7zQ1mE0qghWy4LzBOTqGm6TK41txmnM2LfmDPlFBy4gaJKtiC9ItYub2FXNG1i
	KZhKvVEqV1KDvNE38SX8DO9SKtRkF4/KB7iIA=
X-Received: by 2002:a05:620a:3185:b0:915:cb5c:7f70 with SMTP id af79cd13be357-917f0a8a62emr1951642985a.29.1781571484377;
        Mon, 15 Jun 2026 17:58:04 -0700 (PDT)
X-Received: by 2002:a05:620a:3185:b0:915:cb5c:7f70 with SMTP id af79cd13be357-917f0a8a62emr1951638485a.29.1781571483893;
        Mon, 15 Jun 2026 17:58:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1a6fc0sm3153341e87.51.2026.06.15.17.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:58:01 -0700 (PDT)
Date: Tue, 16 Jun 2026 03:57:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Daniel J Blueman <daniel@quora.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: media: qcom,sm8550-iris: Allow IOVA
 reservation memory-region
Message-ID: <ipemz4xvo5yr4wmrkdepsglxtwa6cgbwayjgoxu5br44yix6w4@jxpc7hz6ugtn>
References: <20260614145113.84243-1-daniel@quora.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260614145113.84243-1-daniel@quora.org>
X-Authority-Analysis: v=2.4 cv=V5tNF+ni c=1 sm=1 tr=0 ts=6a309f9d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=t9ty7G3lAAAA:8 a=q59RblQhM_AjlM9mRcoA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-GUID: n3LdboqFX3abeQqJJFkm6LKJ2xbuHXYS
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDAwNiBTYWx0ZWRfX0mKhK9AwTIvY
 cxT+A9A+NfYNjF7Mnwl1ca4CrAvpb4jf9dPUOoKejHlkEhmeSVoooEZ8uhMJLthX2fyBPkEfHvZ
 oPhvUQGAMm0i95vYa2hYiw4Z1LcO0ns=
X-Proofpoint-ORIG-GUID: n3LdboqFX3abeQqJJFkm6LKJ2xbuHXYS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDAwNiBTYWx0ZWRfX17+GScUR4BWg
 3Rw7kUO2fQJdjIsjhj9/ipOUpuTQyE4aWqUp8vILInnYHi9qCUAF2xG6WYFCA+zZNdCRMJBlsSA
 KpziNUQO+jibfHXfTKfz1ge8W1Mhbpgs0K2n8Ir6A0dnqbcCvVsgT9oFyKw59VMsdd5PVuAB7f/
 XX+VhUm38HtKx9SPRuBVtxoO/dkRtfsvB033UAROAYWafqmSvcuDEQBnqDExwHj1DlsTD7LtMie
 /cMdQgN7bB/jQCOVFL5TKbkdXWCUAg03tzyH5pDdLTiGESX3Z+41IYX0n78gZzexXN0Zkp4SJFp
 X82OC1/YoaKipYwO5w5XeXiT74MmuXWO74YfDIK/M+/k7ESv3hfYoBPieBQqSpax1x7E1iput/+
 W/KWTIwboobPhE5jBPjB+F9fyFjiNT9tCKLPKyqrT3fOlfLt0Sv8LSPiUCxdoE3XDgU7/2C8JvR
 HBPcNI3BivD1gBqj9pw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_01,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160006

On Sun, Jun 14, 2026 at 10:51:11PM +0800, Daniel J Blueman wrote:
> In addition to the firmware-loaded codec carveout, some Iris platforms
> need to declare an IOMMU IOVA reservation (a reserved-memory node with
> iommu-addresses) to keep DMA away from IOVA ranges that earlier
> firmware stages have already mapped through the SMMU.
> 
> Permit a second memory-region phandle for this purpose, and describe
> the meaning of each entry so the ordering is unambiguous.

With no driver changes?

> 
> Fixes: 9065340ac04d ("arm64: dts: qcom: x1e80100: Add IRIS video codec")
> Cc: stable@vger.kernel.org
> Signed-off-by: Daniel J Blueman <daniel@quora.org>
> ---
> v2:
> - drop redundant maxItems, keeping the items descriptions (Rob)
> - add Fixes tag and Cc stable for the backport dependency
> v1: https://lore.kernel.org/lkml/20260601041336.9497-1-daniel@quora.org/
> 
>  .../devicetree/bindings/media/qcom,sm8550-iris.yaml          | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> index 9c4b760508b5..5abcaee4101c 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> @@ -80,7 +80,10 @@ properties:
>    dma-coherent: true
>  
>    memory-region:
> -    maxItems: 1
> +    minItems: 1
> +    items:
> +      - description: Firmware-loaded codec carveout
> +      - description: IOMMU IOVA reservation region
>  
>    operating-points-v2: true
>  
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry
