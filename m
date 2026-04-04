Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28E330C601
	for <devicetree@vger.kernel.org>; Sat,  4 Apr 2026 21:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775336842; cv=none; b=fxa04Hk5a+jwEl9lie3N/E67wSlWau1mEHE5eRqHjrMSDJGtVyC73sVQnz0/ogRRoEM1YvkBVRn4U3YxPZo/obZCOD27Sk7FnbANTF86RKjaXxNUyB+Olik/1o8Mg0LIfQNw9kjZLFdVhXmxhHV5IoWEqqhSTRR5HrpgkxrOF9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775336842; c=relaxed/simple;
	bh=/fVdgJAOJhQOWm5KcDg8M2GeSwxKX8nP6dbTETS7570=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lc/qqYtEzSbrBzPKke6w4Tw03IQFCrLgBqq6LEhUvtBOwl7Wmg4IIEEqW6Pi5oA34EjEnmZCYaRTIDQksTcrsJbE1L9rorktHp+8iyshBoeX+DZQhekjK0J8Mkb6qSCRvkc1ig6qwOHEd9hIMkAAPWJDq+h9sggIX7gRi3ls+ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AylsMA2e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y0fy9+c+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AylsMA2e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y0fy9+c+"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 634ErA1l2142137
	for <devicetree@vger.kernel.org>; Sat, 4 Apr 2026 21:07:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UoNupHwgrjCi79COtfqRtJL5
	HBQmDyoBGF3robCpoBY=; b=AylsMA2esbq7Aa2buVhps8rOzDbT+wekroOth1d7
	4jdllW+5Kh57Y2e/ZqU1IKcFqk9YLGgi0qkuaoAvulnh9KnCRzaDM2D9OGyVoRUG
	2BfhQS5quc/zntDjDG1H8EXSDxOISlMG31+J6E9PwgY1olzjihGNFAb2/mMqEJ8H
	U2PgUj9PcEFmYa/WeQ2Jo27fnfY8LPrO/+K3wKs7HnTg6g/1qqlBVQ5Z8SCy2emd
	ZkWcqLiMhGKERS6HPbjZt8D93x2vPIeYaeuAYKwxYjgxIhCbZn5FVAvJZ1TEPrIr
	HDXStfk/xr51TnLPLwzGm42e8QtWWV86urCeswAMI24I8A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4daux89d5y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 21:07:20 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4987c698so74425671cf.0
        for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 14:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775336839; x=1775941639; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UoNupHwgrjCi79COtfqRtJL5HBQmDyoBGF3robCpoBY=;
        b=Y0fy9+c+hRGzJi9yaJg52JkPNCIWGTWH0s6jOfc0j1pU4/X7x7+T6NtYCRJhLRItz7
         XzSQ0UaT4ZHjFskxq2E8nUgvLBiAa46N9Fzny+Ig400S9DRbyuMR3yoWOsRGPLT6Ff0R
         EjyN3DomrvchSChqqE7kA8zijsGaP0uzM/ilds8DKnAuozzoBvzdi1KgbPHAnSm9IKVy
         xITR+HY9V8aagCkzA3RPIXU1DK/nAb785z4fzM3CyntNJ0NI5UzWFLyGOPfaKl+nPJGm
         4GH9rFNTWE851TfkCKy0eKLIWkcBW9scnWBsRA2sG/gG+9SzmBDlbrUCiirGHbaSADoK
         3lmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775336839; x=1775941639;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UoNupHwgrjCi79COtfqRtJL5HBQmDyoBGF3robCpoBY=;
        b=X+OeNQScU9926JT18pHEruDEazBbCANZFqHnc65UmT1zBQjfSIm0artIB64C2NgIWQ
         OIdIHducIMH8FmesqNPicGnJDfhCs0oR19OQ/G92ZVXjxlTNI3beGZ9ND24MV3pUyMwC
         r00FDMpRrqr6vLWHD8b6rrzv2QPbXuEV/mxwi1G1chLBCSqcTpQ3X+jR92Qp75jNcqzT
         yDERKHLiIrB83eJ+yZV1Us4OdmEGcqaaKAMj7hceS/N0qZdPrYXKmSbhgoKlBFYw5UOM
         +vBACMkQbLZcuyWUpeZohnYzcMVEBk0g8GztRfhM1LB6E2aaTUwADIZaOAwtHqSEkgAx
         8Ntw==
X-Forwarded-Encrypted: i=1; AJvYcCWsVtSPJxpwYLFdrzu6GEvquH1WTEieXG36bds7KkPEqSdFW4bXB/a5oj+W04yrYBIITph8Qr4jo0zk@vger.kernel.org
X-Gm-Message-State: AOJu0YztZqQS6J7WRgytMzzaX/Rz4JOVOJAI6oQ7D8Zv68L6cgT6K+C4
	fVTNRn1+Sg6VMNOLx7vymaw3dxxrAO1T43iaV5fVMgszxwiqkgeEhltUloww0R1PkmgWDL9bM3H
	617brqx8fqe+zRdOUjXRV89+yct8Qep+yIRbsuXaRKrpAl2e0V0s9C5PjF0Ui+hrs
X-Gm-Gg: AeBDievmipEyrhRgX/dIA3HKSheF+MdDSlxzCwzFkk6nNGsBTvA1E5M4kSMfa22dPR7
	fjGi2aRkPYgP9yEVaJkpIndMEIpakcZaTQy/IC4pJqKLyy8UvCNP/ETubMb8FHepmrw1MhqwN6q
	YkAXhBrJMM6mVKX2qTrlHT5+Dl4y5DNmufTsiLXlBt/9PdP3+3q2tHMJ6BkNOcTKBtAwN4cSstt
	9KLcj4GJDytVYbFMzIPhEBjbMlqd9UWmGfJhmZDfRNowh/3iywFwtoEaMyWxJ0IbjK/imZ5oyl6
	JlwfX9IIXU/N0FlNZdQkqBjNcnjNj8BOmymkNNP19Fz1YintvClaLZ4WesqO5Gn6m5c/GM9Ij0r
	cX351Jr/shfULdDkoOExOx39yPvMQlMIREtEeHKzXfPN5L+OqGkO/whTAzOyUjJX5xhBCqZtgDE
	DhG1uOe3f0yJ3GjJAXbTNAOdZDCIss2ag/Qec=
X-Received: by 2002:ac8:7d4a:0:b0:50b:ab9a:eaa2 with SMTP id d75a77b69052e-50d4fd46c5emr132187271cf.40.1775336839157;
        Sat, 04 Apr 2026 14:07:19 -0700 (PDT)
X-Received: by 2002:ac8:7d4a:0:b0:50b:ab9a:eaa2 with SMTP id d75a77b69052e-50d4fd46c5emr132186971cf.40.1775336838669;
        Sat, 04 Apr 2026 14:07:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cc5fbdsm2260486e87.43.2026.04.04.14.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 14:07:16 -0700 (PDT)
Date: Sun, 5 Apr 2026 00:07:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: jsandom@axon.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] arm64: dts: qcom: sm8550: add PCIe MHI register
 regions and port labels
Message-ID: <sdr64ldaoitb7rj6a7eupmqrsh47wgir6nkbsnbsv6bpftiqyf@youdquby6sog>
References: <20260404-rb5gen2-dts-v1-0-895f8fc494fc@axon.com>
 <20260404-rb5gen2-dts-v1-1-895f8fc494fc@axon.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260404-rb5gen2-dts-v1-1-895f8fc494fc@axon.com>
X-Proofpoint-ORIG-GUID: Sty0iK09SgntdRfy5jswVeT_W0dY2SuN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDIwMCBTYWx0ZWRfX03N43NW7vi0m
 A+VB3VzyJrNHQhHN50QRiwUzM8O9m30BFQu/OHVcrk9S0c68BnyeMitdvRHeWgskvppNOqnQiNB
 6Rjlx3+DiYDECFg+5CFEITWMCKbYvOqTpugJUGisLU41NpOI8Ecr399jk63Yl8x7A8IQk7W4HxM
 icLpEbo7uE4bisvQPHdOn0q2yXqK9jYh/2HEXzYh79d4x5cwqf3Crl98HAbTgv+aE2Z+FyJfrdG
 Fhgi5OX0mwpGK7CA8akVdAQ0IH45jTbqjYi0fhbKarWw8hMFp4Xwgk0Y9LnpawviPWA6ZNrJTSW
 yh25pA2dAIdAY2Anra9DXMz5vpp2e3wCzE8m7jmwq0sKTSfSOrwAgndQ2Lq6msrz3CjAjh+/LAg
 3L42jT7slNQqECjdoWLzfj8vZ1/jwOQIKLhgKm+jbS9bfKQxgEpperqBuzf3niWexahP2KYju6I
 BRokGtgi/aL11HWqpgw==
X-Proofpoint-GUID: Sty0iK09SgntdRfy5jswVeT_W0dY2SuN
X-Authority-Analysis: v=2.4 cv=AuzjHe9P c=1 sm=1 tr=0 ts=69d17d88 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=h77gEMGJAAAA:8
 a=T-JG3vmuzL3lLc9ejwsA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=PYyYjrCoJcZo81GydsRF:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604040200

On Sat, Apr 04, 2026 at 10:50:54AM +0100, Joe Sandom via B4 Relay wrote:
> From: Joe Sandom <jsandom@axon.com>
> 
> Add the MHI register regions to the pcie0 and pcie1 controller nodes
> so that the MHI bus layer can access controller registers directly.
> 
> Also add labels to the root port nodes (pcie0_port0, pcie1_port0) to
> allow board DTS files to reference them for adding endpoint devices
> to each pcie root port.

Two separate changes, please.

> 
> Signed-off-by: Joe Sandom <jsandom@axon.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8550.dtsi | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index 912525e9bca6f5e1cbb8887ee0bf9e39650dc4ff..d4caf4d00832d7f1e8f65bf2bc873cddadc42168 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -1964,8 +1964,9 @@ pcie0: pcie@1c00000 {
>  			      <0 0x60000000 0 0xf1d>,
>  			      <0 0x60000f20 0 0xa8>,
>  			      <0 0x60001000 0 0x1000>,
> -			      <0 0x60100000 0 0x100000>;
> -			reg-names = "parf", "dbi", "elbi", "atu", "config";
> +			      <0 0x60100000 0 0x100000>,
> +				  <0 0x01C03000 0 0x1000>;

Lowercase the hex, align vertically.

> +			reg-names = "parf", "dbi", "elbi", "atu", "config", "mhi";
>  			#address-cells = <3>;
>  			#size-cells = <2>;
>  			ranges = <0x01000000 0x0 0x00000000 0x0 0x60200000 0x0 0x100000>,
> @@ -2092,7 +2093,7 @@ opp-16000000-3 {
>  				};
>  			};
>  
> -			pcieport0: pcie@0 {
> +			pcie0_port0: pcie@0 {
>  				device_type = "pci";
>  				reg = <0x0 0x0 0x0 0x0 0x0>;
>  				bus-range = <0x01 0xff>;
> @@ -2138,8 +2139,9 @@ pcie1: pcie@1c08000 {
>  			      <0x0 0x40000000 0x0 0xf1d>,
>  			      <0x0 0x40000f20 0x0 0xa8>,
>  			      <0x0 0x40001000 0x0 0x1000>,
> -			      <0x0 0x40100000 0x0 0x100000>;
> -			reg-names = "parf", "dbi", "elbi", "atu", "config";
> +			      <0x0 0x40100000 0x0 0x100000>,
> +				  <0x0 0x01C0B000 0x0 0x1000>;
> +			reg-names = "parf", "dbi", "elbi", "atu", "config", "mhi";
>  			#address-cells = <3>;
>  			#size-cells = <2>;
>  			ranges = <0x01000000 0x0 0x00000000 0x0 0x40200000 0x0 0x100000>,
> @@ -2288,7 +2290,7 @@ opp-32000000-4 {
>  				};
>  			};
>  
> -			pcie@0 {
> +			pcie1_port0: pcie@0 {
>  				device_type = "pci";
>  				reg = <0x0 0x0 0x0 0x0 0x0>;
>  				bus-range = <0x01 0xff>;
> 
> -- 
> 2.34.1
> 
> 

-- 
With best wishes
Dmitry
