Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D43B2E3709
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 13:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781615921; cv=none; b=HDIvEjEpUAJrK0rQveswoRN554uqnRt2aPX7fmWQrcI2yBqzMgI8z4PyZvKK0jS5Q/C+KkyCezXhIIGOR34eKNLQlfZnVsgrBv3wS8qnQHqX2G8Tp+VCgUDwxBeaokd/GEyzFrLgIvLoFAvTQELEmP9C31UO2OVMN/fJYVNxBu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781615921; c=relaxed/simple;
	bh=9HKmJxmZbh93QuguriSz9qxa57OuUO38rdnI+Tie/HE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KzrKRommmvsRRZ6arwI+byh8NzmMiFlaybpTIzlYLVgYMPPWZDqiKVN75ZutuunkoIl2idyXLAuBkEMxb/Yw4pW4rk1gvlpHmwcHau3FsQc2Ra9riXRWKtrhsdNzgDjxHNosWaOqltWd9H8zqdoo6yzILehflfdjpLrETJ0yXEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G0/g/S1F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d1ws/Hsl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G0/g/S1F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d1ws/Hsl"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GA9hxw2799373
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 13:18:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9r9d00/B2qPIrDcuZ6MLi2lkTJhfEfUMswMZ94qwOYo=; b=G0/g/S1F3RkQ2tG2
	nw8qT2t0cucXgZWclNl3UHINwKevRrmD4TavQdkQiwAoIxXJjhM2FzE0oWd+FS1Y
	7FCEwE6K1f8B7UV0L2IhNvMhvaVgSDBgGDYMnAwYSBUgk5EGqFbGlMiAm/QOsIM1
	IggCqDKuBO5enz2+gkwjuuRLB28My7fI0A2NI0WlPzjDthg9u7496ydS4u8Pistd
	CObDyhABaGph0GqLu6fieH0RBLtbp8opSLsVCNrQxU3crLO72R6R6naZa5S7Y4Mn
	StxInZZsM9/ooqgPev5zKOkOGnCEsrcaoTJLiynw/tBpnNVNfgRR9OwHD9/xZQ7w
	tB6bdA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu0a7t01a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 13:18:39 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-915976b2dffso34677185a.3
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 06:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781615919; x=1782220719; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9r9d00/B2qPIrDcuZ6MLi2lkTJhfEfUMswMZ94qwOYo=;
        b=d1ws/HsljIVmpx38xkw/y/5RbFQNujtRffm1Gd8jx7HtEU9fPcIlS+nLNgyCK0kMNH
         L2XK171qBHpHx0pGN3DjVfCTu9bQysgU2RHEw771VGX8SLmkghnW90myFXzqxJqyxXcv
         HG78eejYieKUON61JqC1aMu9xmq4qlFb511kXXzoGVONuBw5LiUm1OTtVg2esStmaiqT
         0Cg+Eb1poCuKszneOveGkWH3p9NvwRfOp2lt2FhpbwPggBAmg2y9EWr7dzS3cLz1MzJp
         zFEk91z3RRWOhB6pGGwnH85LienID9oyue7ZK023sxk6MR/JPaOZWqWMyapyeZZdgyNz
         1FPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781615919; x=1782220719;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9r9d00/B2qPIrDcuZ6MLi2lkTJhfEfUMswMZ94qwOYo=;
        b=EaSMMU9x741KbG82Zzbgp2SnqdNlPTSJHbmJFeWuSXvnsWqag+V65+hs90WguaTGKp
         CuLQtAENTQp8O3JIof74EgkKaRVqDTy1Ehn+9mFX+r7ipDZ92yaQ9NMriQDigKjhGGSC
         RoXX4PG0LujjdHk5Gf2Ase4b+sj93H+GpLgOQNYDQqkRY3Gkb0vff12NukJaf8kNS11p
         mm5cV/mCNzRBDhQ0R0JF+cqBc9Q+U6nsFUUrD9L5NxsZDj46vY4rQC79eSG1KnbRFPv1
         y4v+0vNtd1I34McwQEK7MCrs6zd78UEYCx1QTqNlpkNQktw7pXnTURnLrLr6H8eo5bPq
         basg==
X-Forwarded-Encrypted: i=1; AFNElJ//6Ano/sEZucYX+CmeUmWD2tUus4dMzdcCL5MdINtT6+X9fuasDqu9llqfpeX5zLUdtWFLxZsn5SCN@vger.kernel.org
X-Gm-Message-State: AOJu0YzG0CGHuOI2yaJV8qzp5+YNg2+kcsStjcdlXgLapgMK5rEvh55w
	QQVwKN9vq5ToYoW7MnG0YwKj35kY1fHrrRuAmTxH+oKMYuKkg9hs7wZ1rM6b1soUQTJwtAPeYDc
	B+1B3s/Ixt0ha6LSwmim2IxhIXXji2kLLgq16f4x+E1NgyfsBddNKZLo1cmn8vj3z
X-Gm-Gg: Acq92OEdybpU58f5BNi+8EZC559Yk4jkiQx90baF+8VXH8lKkCoG1OAcBZ5PRYykmb2
	0Daviz3oUqgzEU+Z1eZiV/7G8QrHOVFKpSH7zQkgoQ3BnSE/DCYxXYMh9b6ksUO0OCxmmiSoIp6
	NznNzHLaLgofEzT3aEU9BD8vb+D59EybY4TfTHRukOZjvwIgZdRTiBG3zcFQfzCyTno46v9lWAo
	/OqApOknF4LFQrap++qN3Y4Y+hb8zTdiobhLSr3xtA2LJ5Tn9Y1/QUhwATzvJO2vSzQElxq4prD
	fhg6rZISC3GQLuyWoW6jjelIJrvcpPXG+90XoVMTB+/m6YOlZLyPYD2kr3KdixB+Bg8WIHjajjq
	ESy0ZZSWr6wXoK6L9Z/C6HJPIXLaf7JfMtslwX9doXZUipg==
X-Received: by 2002:a05:620a:2729:b0:911:dfb8:37c9 with SMTP id af79cd13be357-9161bc7409cmr382852285a.3.1781615918726;
        Tue, 16 Jun 2026 06:18:38 -0700 (PDT)
X-Received: by 2002:a05:620a:2729:b0:911:dfb8:37c9 with SMTP id af79cd13be357-9161bc7409cmr382846085a.3.1781615918102;
        Tue, 16 Jun 2026 06:18:38 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e16a0fasm3532627e87.20.2026.06.16.06.18.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 06:18:37 -0700 (PDT)
Message-ID: <e6dd7006-bdec-4669-acbe-2c06e87cc781@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 15:18:34 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: ipq5210: Add QPIC SPI NAND
 controller support
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        sadre Alam <quic_mdalam@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260514-ipq5210-nand-v1-0-cbdd7492e826@oss.qualcomm.com>
 <20260514-ipq5210-nand-v1-2-cbdd7492e826@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260514-ipq5210-nand-v1-2-cbdd7492e826@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEzNSBTYWx0ZWRfX1U7BvJYGTikp
 dlXAyQiGsPH8L4yKSjyC12DDDv0C+1H78nNxUdriuaMV/n1CSAYQODp4o0FAw/ZXOfe/srmBOCu
 z7Mu5pZL/oJ0s1mJjopV8j8C120LN9fiNb4I0kq+xilurnC9wmdA5RElWL5v2GEKmE8t1sAvEIQ
 08zlx0+ZmpHS5oIlmpEKaMaG3xOKhn+6TTsxpw2aiAL3c4NiAyjm2AEKleULPMJYitkXjnM+lmR
 fomftE3qPIfLQUfbEEafPRdvT2RQtX40bQ4Dh3xDlLVbth0b9PbvrL7e/LTS6r6NdNRl1Ft8C6e
 BSUHI1zh98fcDBxQ/vonGeNFxxlg9uvLqYSk44Q3uquM55dYsBORrWy3A/VmXPa7ViDLoQtg/gH
 MT3WtJKr2OIUL3UZuiDqMN/TJmcPXj4NFnFDigxcALGp/n7uvBocHzPqjaYY1O6XNkg0j9zx/v4
 H+Xuz/f8Arybs3Y++/w==
X-Authority-Analysis: v=2.4 cv=JKALdcKb c=1 sm=1 tr=0 ts=6a314d2f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=Ju4C-FNr2R-pDinXp-kA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 4s0e68gzO_pSvJV8U0zTXGHwk5wTVAGC
X-Proofpoint-GUID: 4s0e68gzO_pSvJV8U0zTXGHwk5wTVAGC
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEzNSBTYWx0ZWRfX9WVx1bosc7le
 sdBEeDAo81Uby49ETU+YeXKM0W1ICenYydJYAhfbn/pyGb8B5eyMX5FKEBtoBzXCj6BQsFEbPr5
 D/5rBKEJ+CKbIRUp1e3+IhCjLe98n5k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160135

On 5/14/26 8:45 AM, Varadarajan Narayanan wrote:
> Add device tree nodes for QPIC SPI NAND flash controller support on
> ipq5210 SoC.
> 
> The ipq5210 SoC includes a QPIC controller that supports SPI NAND flash
> devices with hardware ECC capabilities and DMA support through BAM (Bus
> Access Manager).
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts | 42 +++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/ipq5210.dtsi       | 29 ++++++++++++++++++++

Please align with your colleague's submission for similar platforms:

https://lore.kernel.org/linux-arm-msm/20260306113940.1654304-3-quic_mdalam@quicinc.com/

->

- separate commit for SoC and board
- is the BAM host v1.7.0 or v1.7.4?
- style: clock/dma-names, 1 entry per line, please

Konrad
