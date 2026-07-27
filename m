Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779933271EA
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 14:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785163642; cv=none; b=FryLw5fKNw4SIwwLK3YW/wga+eiHyzRspD1vqPJ0k/lsRsfot8x6vMLv2GWq/mIc/bP7AIS5E64eWPSjidzXQ6QaDVCCTj5VUY1bKGo+MHCpDZcfvK/aebA+i/gf6+RuUG3tuoZ7nGi0JfnnQbn/JgJj2msV6vjLZlaTcb+tjQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785163642; c=relaxed/simple;
	bh=ZoOBAVuzzUEBayIY5FdUSy9hYrqYBElShK7awRqiR1g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dgsgsEQr3IBIYnwCDneb49D2cjr+TQSPSR7MPeS+aBBVv1ArYmtx56VoXo7JrC1DYy5on5uac7WwokZwxdiDf7+agd5wDbC2nm+Hip3jp/EeNElkPRmibl8LNPqF36MU+0atFksjiZedjkkgD8HtNOliU12r94x0nJtLFNVKlvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SUHR2G7W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ir2JNFld; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SUHR2G7W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ir2JNFld"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlSDR4065482
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 14:47:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B3requD4IAQNXc5E2nRkD8aS/Y4Rit+KA9DGttDek/U=; b=SUHR2G7WyeYlRs/N
	i4tIA7dNcavko6rq+jD9hZSjYgVa7ATMqsUANEhi0rQay9ruucByCUtamjl7/AKh
	4C0RCJv9c7Cx6wHPh2bMoz2SbVpp4gOAm7jd4ugwbNsY8Igx8d+yKL/mjdglNlr3
	PDKIEZC9lCDPWO3+HxzzTzf9UWC8tHteaxZtc/voKB2amKnaglZpEu62Gs1SZgTt
	fbv+Gx16xqfW4Pnhf+egZ97LaUwj4fYXZ6GC+JtnCv23Ye5+J22xIfo6pFySAFs2
	drZqM/WuoIxCMGc4Nn2Z8V58uxTsJMxkvVtZfNlB/Y4ZYypwSDCH86V+GPeycfVy
	H01DOg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fngysuymv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 14:47:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e5e21552dso8096285a.0
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 07:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785163640; x=1785768440; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B3requD4IAQNXc5E2nRkD8aS/Y4Rit+KA9DGttDek/U=;
        b=Ir2JNFldLbxo5KUpTQenW6w8/V7EWMTV7ufE3MK7O3FQXuSb7LDpDHrLIXhOp5DUJz
         HBOszbNtoeDPLUkViSjtHTRkC8JEA5j4EliAa2tKRPy0qn5z2mdAK6awN6rZ4MrBFRer
         +q/3uEbIsy8JgwZfvomV/nf0U5UtBzqHZGaoHokCbVB60rDsusStf4JmHeyZzIQtPnNO
         czzY8FMnn74QI6yrghtKBcjnp9SFn3FjD6irh5gOU+ATyb8cN+t/lGiey686FZJuFbOT
         Bm2lUIaWyCoXBlBohkI/JZYo+mfhzEuGdj40MK8kMCVaas6VLWG1XKyMN0tO4DUlyMYo
         Sblw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785163640; x=1785768440;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B3requD4IAQNXc5E2nRkD8aS/Y4Rit+KA9DGttDek/U=;
        b=nTtHTV1AjuB+qKDaboseRBrJ9q9PFJg9Tt1Qw6KHieAzivrZfpM1sHmiNxWQls4C28
         BCk3WYU7IrsYwxFkY78caL3dDTCMsgZEg82R9JT+SIMKm4VLPAMxEyfVGPHJAqcPAGC3
         CJyjxwTi4l8SkQGAtaQxQwVjp4A9jmZ5MQ+gXkNJJgQQrkh79Tfv0vfRhi6xcE/Q2Leg
         pYr3fgSFZItAEg17iSTQybcVYkdlUkck1u9BhjPAaL5qXmsikUe6mqxs0ZQLzU34Pp7Y
         JvVhBXCcBJr4c6f9NChg8ErOOnW59njHKel5X6xdPAIrWN+j935NNgfsvUenXMnUzTi6
         DjGA==
X-Forwarded-Encrypted: i=1; AHgh+RoPGqpVOWlbLvR0REesY3drbdNVojwiv8WloKEdlhQfR2FpNTMM2N7/qm0QH3gatVqmqR6pHBJ5gid+@vger.kernel.org
X-Gm-Message-State: AOJu0YxEZeKPmgqnferHLehrX5FzYQczYN4DkQSs/3rUGT7NEgK1WRtR
	Jhwos3qBN8rukEz3RBKRuLpzL6DR/EFNWJct7tLjwLsQKbvzWHs6FhMZ6uysFs1TstvSE1ORwJ5
	++pN+y+L2GdMFaDSDMPRb3FUQChlXVUyJ7NIpc83jTCzdfkfcN/QftOv441VhcXQA
X-Gm-Gg: AR+sD10QGght0Es0ilWmYOA5ge6Ubj3PGCQNq3IJ7mgoIu7MX8zEExZ/c1ALY6sTBrC
	zngH9ywl5svAMpAvemoaT7opCcYTFGP/YNYDB1cFQDLTLrHG50BhCOZfqq/ivNtvw90+c7+drmD
	pPHxoiFg3DfrzD2G6UnpNX4xsLFsqB2TIj1Caz9FrS+b0ljcGsLxxFschlGgnDJaFutAoaz21Io
	MCDVIXoOu3teH1AQ4e5LmuP5rbt1APG0xJYDAjmnCIRW6gxCOacagLnJvbSzJpR00/9L618etOz
	bA7X2rBtY5aunMXoB6QscDZgiGJxpVe+xIXzZH10Ir9ihZRoQhFj81kAW+5JXfhcOcVT0d3mwUD
	8ug4NYHDBjV+uX3gE0tKdrCb+
X-Received: by 2002:a05:620a:a493:b0:918:588c:d095 with SMTP id af79cd13be357-932fc0eefe6mr37200885a.8.1785163639698;
        Mon, 27 Jul 2026 07:47:19 -0700 (PDT)
X-Received: by 2002:a05:620a:a493:b0:918:588c:d095 with SMTP id af79cd13be357-932fc0eefe6mr37197985a.8.1785163639289;
        Mon, 27 Jul 2026 07:47:19 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39f2217313csm13939121fa.7.2026.07.27.07.47.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 07:47:18 -0700 (PDT)
Message-ID: <74907d0a-cf14-43b6-bcfb-8c283926a820@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 16:47:15 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/6] arm64: dts: qcom: glymur-crd: Add PHY supplies for
 pcie3_phy
To: Qiang Yu <qiang.yu@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260724-glymur_linkmode_0724-v7-0-65c8469c6b65@oss.qualcomm.com>
 <20260724-glymur_linkmode_0724-v7-4-65c8469c6b65@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260724-glymur_linkmode_0724-v7-4-65c8469c6b65@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzOSBTYWx0ZWRfX8sDqN3Lt+HNh
 /UUrT/xmXbBKLmUgb/5UiKsBHzivvci9HSBi+9mBi3J3VRzUsLlfTT57W/MRa/s8LN0JX9eZBph
 XxvhbdXoi3Bl6FbE2tNwfOlTsUf52RQKEEQHmtYhvZTzTFulV8P/g4UpGI5Lp9dBkpMr07tFTbn
 y1tDgFhQqOmQbWH+CgJEmPIZpWeRImGkj2yQYdv1eYs/BcO/FW6Hc1gN2TXXAiL7qdkjsaIZ6vt
 tfojSi4wQdhqfSYr2Hljm8iGVMoSXTJ6+Fte1qPe5DKxzNdleyPvr8FXZMpNzoFUqQTuVYcrV5t
 /ADoTBaYB9OBg1zRMYMybSBpDxw4NuDbSoASwue/3Z6ZVSzb25Es8Y77urJhl6SZxjf9nljd7Nj
 2QvOdHbaK7g/r3Va9cY+y4b6gI/xoUFU8a1qU26ky5ZnIiCwVZj6bOiGaryqhSRXVTAe7SI211Q
 O2+JJLzFW3d//UDSmQw==
X-Proofpoint-GUID: 7ni9cFdWVFMfFVC1jiaDehLbKL-l9-yw
X-Authority-Analysis: v=2.4 cv=DNG/JSNb c=1 sm=1 tr=0 ts=6a676f78 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=z9rpH-K2X6tSt-NJzkgA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzOSBTYWx0ZWRfX8M+VwvV4wtUa
 MFXO3hFfy0LN9z2NyzELF1auZ+zDsK7r3ivwS63Odf0dwzZDTN1rnJ9YLj1o80Gso3fu3YJLjHE
 yN5q+TvRL0FOuuSr9E7gURskfCQwGxs=
X-Proofpoint-ORIG-GUID: 7ni9cFdWVFMfFVC1jiaDehLbKL-l9-yw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270139

On 7/24/26 12:01 PM, Qiang Yu wrote:
> CRD wires the shared Gen5x8 PCIe PHY's regulator supplies through
> board-specific PMIC rails. Add the vdda-phy, vdda-pll, and
> vdda-refgen0p9/1p2 supplies for &pcie3_phy.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> index 6125617de82a..0aae613a33ad 100644
> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> @@ -28,3 +28,11 @@ &mdss_dp1 {
>  &mdss_dp1_out {
>  	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
>  };
> +
> +&pcie3_phy {
> +	vdda-phy-supply = <&vreg_l3c_e1_0p89>;
> +	vdda-pll-supply = <&vreg_l2c_e1_1p14>;
> +
> +	vdda-refgen0p9-supply = <&vreg_l1c_e1_0p82>;
> +	vdda-refgen1p2-supply = <&vreg_l4f_e1_1p08>;

I'm guessing you also meant to enable it here

Konrad
