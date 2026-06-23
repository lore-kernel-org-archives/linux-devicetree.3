Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF743BE156
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 11:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782213747; cv=none; b=gwQ2HKSVp9wlijNE7M89gj5HYKk23j9ZjSPvSmKwA6csURGOta/oMY+grb3cKnPTHQ7pNzMg4jFDY5j0WIRxmEKnokdZ/EXJnXYhRl0ADRVuFKhQzezrnbvPDQXveJV2N1pyVc3j9qpRjwN5vBUsFDus2fM+ivg3y5uAp0XQOuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782213747; c=relaxed/simple;
	bh=N9l5zfh+Dx9NXmodokz0Nl+RZxeBgcy1N8FWqTUhpuk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dCSVRiCJx9QRkW9Xd7sa8c9aAMYoOt9ZcP4C3MK/xD+ki/n5NFnOavBRquILVhnA482EPSSAKmdiyeIUWNes+cGMfXtJqcfS2dnpfnTzjP6tWX3kQ9zS7cAmSBmwzvPjL09kPUbnvhVQg94RMifzzG5G2o0fsiaQb47StKC/TeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QjyLGovS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X7raw4SH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QjyLGovS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X7raw4SH"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NAsld84152427
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 11:22:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JFYvKDt7UN0l5sBlS0a46MhiBKmTIx2FMhqjTWclfTE=; b=QjyLGovSu/+f9Oxj
	90jdC9ydivNZH22sK6nL+/nZm5Cdie66DB6HGNwoKDFK53TFvqWHBv8yaTb4CYsD
	g5z3VYuorUv/iQ7DIouCD5uUild/N41EhpX8of/lYG55TwD99I438nMupzoL8omO
	ZV4Yhgrup5vQROyJrKZ0Mo/Ax/FStUgAqu6cYEmdtSXFvoL4Q9uDb+2W8VSVNK2q
	xhsQj4Ps99B6FS3pw1QyY0lxjiNaVZGV87gEx2JGX8ZGuQyTCtnl+rg5d9vsXLkR
	FAOkPx5R93FCfcvMlsw0ZTnq4WNGgblqUBnC3X23RbZf2PA8qf8g3Qi3RMuzZg8F
	XDrjuA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey5n44ggx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 11:22:25 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-37dc9b82e55so1118955a91.3
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 04:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782213744; x=1782818544; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JFYvKDt7UN0l5sBlS0a46MhiBKmTIx2FMhqjTWclfTE=;
        b=X7raw4SHkUnSaccowi0HlyWL8k7J9m+nfB3a58t/yQUOe/6f/jC4OAzr8Sceh+HBs5
         DwiwV1zzDfsyTt5yqXVEI8aZr6m5EedkI8+zgWLgAitoJD5+oyvFktz7lLKUD9RjJe0p
         uEwZsEXXpLD/6+Pmf3vN1pDHsbR+8nXKw0e2t4c0SHJjjcko248Zf+ggWqHW9/UZZVr3
         ESIybCKh5q6DN4IOrFg0J7Mjuh6EywqCrhEpLAxoD4FQzNgPqHQAMFyNjuYBqA9BeG+G
         JQruLVGe27cZpr+6WH/T0AYE7PL11twml6v2d7g52zX377TgT6vZBnrKmp5+uIVKGDSc
         yGeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782213744; x=1782818544;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JFYvKDt7UN0l5sBlS0a46MhiBKmTIx2FMhqjTWclfTE=;
        b=iIHEOiQ1LWSY9x89fWx2hfJX1MBaitNOEpvBT/RGBGbyYcNqHu78rkRMPfbKggnhs4
         5MqA+S9LOi2e4JkwkOX0k1h0NLbE665UlnMJnCUzdcmlWZwhgST0KnkHuQH41rHFplQ/
         PSl06l9CUbVTy0JBaP+R7YXg1P1dnHUBOhrwI7F8SBIPp02eWCRPh2zK6PgvGio3xHrV
         7RKbNM2IfJLEdUAzRmmtKyD6PYLVkB3zx1+VsTPqqSpXGBhgPuEnvFewXtYiWPF2bINb
         egJIn2KD28uVU8KT0ByvAVL5QfVH9xpxLkjmk1Ljc4pRMUbAgaU2VSvKwNtB/8g2Jajf
         FOGg==
X-Forwarded-Encrypted: i=1; AHgh+RrcYW9egMnQztSRN9Bp7AbTL1KHJA8wQS29hl1cs7JkRHUQOaraOCGN438ysu0KvGPgttKpkpb+mJyr@vger.kernel.org
X-Gm-Message-State: AOJu0YweWFirzMP/b1e02UI2kWYmuKUo9q/D+Ot2/ma9C2LUfLVLUwzA
	gPyT1BF0SrC+jVaW40JrJYIGI6rizHtLt40y9yNNcJVwNceJUvmzLs/nTp0MrKHlnndNoodprU4
	H8qdCbQ5ejMCZpK+wuhyU3URO14ap2E9xeazuVDMTrf/df2zDGfeshQsabnLocL5t
X-Gm-Gg: AfdE7cn56T+1YR2aI5m/tuBtIbdtsj/DpXEeSOcXUoeEGaGjXwxbw7y2E2myCrvg86e
	VJvLOp1sPqVVVPAmGyY8wju9IXBvRNi3xZV7nKtNlmkDOA6+NLnYUEG/1WBQSI25uF2H7zxgRgQ
	L393OZKsPDC+SUFbAdymqKwdr9cNDk9qXOEgzR92gTZzAs+sSsb8eeVF2syxCmH1u/L2xtYEZGu
	dCmA+XctYQ/H5puc4H3lfWjxl2zYTNZHiu4vNIjn3PEihpqi335oRp9IKLa68Kl/vQuZ1oJ0nNa
	mjugjH8izRpKsc8ugiBiA/q4sa1s9mDojLeXjWn9ieoUYNN7t9HlCubClnAOj+t/ZnTP8hL+jIz
	y04KphuvgQdTwW3uihKzTaTOW7tWqeP21iD47tLP+tJUWalb2PAjQY/2FGKE94aPQHqVRfqA48U
	3dbdR0TttrHoWGc8Ziwxlvf+4vAGTMgw==
X-Received: by 2002:a17:90b:224d:b0:36d:cf58:b79 with SMTP id 98e67ed59e1d1-37d4e64c341mr13284957a91.19.1782213744554;
        Tue, 23 Jun 2026 04:22:24 -0700 (PDT)
X-Received: by 2002:a17:90b:224d:b0:36d:cf58:b79 with SMTP id 98e67ed59e1d1-37d4e64c341mr13284908a91.19.1782213744008;
        Tue, 23 Jun 2026 04:22:24 -0700 (PDT)
Received: from [10.190.200.172] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37dcd766898sm1100410a91.0.2026.06.23.04.22.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 04:22:23 -0700 (PDT)
Message-ID: <d52e10c2-8642-43e7-ad49-f246b05290e0@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 16:52:18 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: glymur-crd: merge duplicate
 &pmh0101_gpios node extensions
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260602-merge-duplicate-pmh0101-gpios-node-v2-1-251107b3d9fe@oss.qualcomm.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <20260602-merge-duplicate-pmh0101-gpios-node-v2-1-251107b3d9fe@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA5MiBTYWx0ZWRfX3K1UsvMi2iih
 XdqdKqO2V6GqMV1655Sg/Wq6eAs1KPOe4rfsOGXSSIod1Di+BU/wFPoRm+Ebbpxvu75ge6H4Gxt
 lEoF6VGJhw6IOMPV/V/422Y/En2d3HE=
X-Authority-Analysis: v=2.4 cv=R8Uz39RX c=1 sm=1 tr=0 ts=6a3a6c71 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=PenRSrQLYnnCCcSRWQcA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 1ehZm6FuC0MumUmMcxN5rj-3FTmcWfOj
X-Proofpoint-GUID: 1ehZm6FuC0MumUmMcxN5rj-3FTmcWfOj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA5MiBTYWx0ZWRfX68rlgDq+6I6H
 Lcs/ub/6aRJMME3L/a8GxL04VWdLLbQfbVY8bFH2YNTBpxlXgB0YfT/krF0lIh+G7YblQcL0+qg
 c1/rKBrS1UbgNEiQrMVETd3uVnvCQwf7Bl5y0eCfCJabPKF+azAI7JAeqKZlm1sUUwKBL4/MW8C
 I/r7Clv3PrPp6jK47vO1vbi+t8Bu/qjlUbq64Fk9b9U9v2wTJXy1J9rYaOmsDHUrJRjSDrJmmH3
 cjqw3lZB6ZLBz3cWiBD74CZVuDygDE5XuOUFuF6QNQoMakIjVXLf723k3XTC4aXgmbKfW+yo6il
 x3mzp4MkbwUPrHWGP5v8kMpIIJoHC3xvsNxYktPbAUCQL5n+8VEiAqch0SRoiElcshCQoj2goP9
 3KAcXmMqk48pKP7/zYWQo/EyVtZ2UGNF8g8LdG5ir+BfDj0GhnIXPt3NIAVjtw8Re/mb0G0+S8s
 VFK0ryS9fcgaiatHjRg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230092

On 6/2/2026 3:18 PM, Gopikrishna Garmidi wrote:
> The &pmh0101_gpios node is extended twice in glymur-crd.dtsi. The first
> extension defines the nvme_reg_en pinctrl state for the NVMe regulator
> enable GPIO (gpio14), and the second adds key_vol_up_default for the
> volume-up key (gpio6).
> 
> Merge both pinctrl states into a single &pmh0101_gpios block to avoid
> the duplicate node extension.
> 
> No functional change intended.
> 
> Fixes: a5ad8a8e473c ("arm64: dts: qcom: Commonize Glymur CRD DTSI")
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> ---
> Changes in v2:
> - Reorder nodes in alphabetical order
> - Link to v1: https://lore.kernel.org/r/20260526-merge-duplicate-pmh0101-gpios-node-v1-1-c4ab4983f8be@oss.qualcomm.com
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> index e784b538f42e..782578a2c5ff 100644
> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> @@ -538,6 +538,13 @@ &pcie6_port0 {
>  };
>  
>  &pmh0101_gpios {
> +	key_vol_up_default: key-vol-up-default-state {
> +		pins = "gpio6";
> +		function = "normal";
> +		output-disable;
> +		bias-pull-up;
> +	};
> +
>  	nvme_reg_en: nvme-reg-en-state {
>  		pins = "gpio14";
>  		function = "normal";
> @@ -553,15 +560,6 @@ nvme_sec_reg_en: nvme-reg-en-state {
>  	};
>  };
>  
> -&pmh0101_gpios {
> -	key_vol_up_default: key-vol-up-default-state {
> -		pins = "gpio6";
> -		function = "normal";
> -		output-disable;
> -		bias-pull-up;
> -	};
> -};
> -
>  &pmk8850_rtc {
>  	qcom,no-alarm;
>  };
> 
> ---
> base-commit: 08484c504b55a98bd100527fbe10a3caf55ff3ff
> change-id: 20260526-merge-duplicate-pmh0101-gpios-node-52eaf99f8485
> 
> Best regards,

Reviewed-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>

