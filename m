Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4216F42124F
	for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 09:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791709701; cv=none; b=Rb4y7BgzhIzxn6JIChdftz8slWYVhpUI0mGQ+pDcNvOVsOQWqunPDLxZ0Rbq7ZkvQH5wkPehcc+d5cHSKm0it9VhDiqARdPJLFyfcMbi730fHTmr7LdtUhPm+BlW4lntB1eTcG6HLfUp5R6FOHY0NtOMPrsNof1sgt56ewqaDyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791709701; c=relaxed/simple;
	bh=5oHe4n5rbLwyg7OqY/yYUv5kuFE9IDPOKywLKt7K5uM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=q5v3TQg9oWR5zB2WPBqEtZ61pK6wF6OV1QWkzGB0NnVUp4uGtc3IwyUGJtjGkgb4K0kVoeLxtEmQuLADBpB5G+y7SHuPiDIgSamgLGe/58XQyp5U8bFzc/f8CIp1e5xWBTz4/AUxrbFPbzGVBsqnEft1moB8V+Q6ntnoTB2e/uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IFz3nDqW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cxpGi2o6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IFz3nDqW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cxpGi2o6"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69B8579L2381412
	for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 09:08:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C/iR2mjTCid+nrePpQGbvgdRC2IVUI2A0iMsqmLXvp8=; b=IFz3nDqWtEVZKMXr
	DjsxrI+VQ/SyD2PupNiCm5RropHru1KtK8wTldunls87r9tUfIzKoqR7XGjMP5R1
	hsidtLi0LhQWcRwW4rYcR5vIG34FdRRbovpJX08lR/ibXqZA48QH23yq/bhKQ33d
	mzESyyGnSstar+PM+NUMoizC95TKHH/i0NSc7BiL866bse/quPNvbLdl3zUkypCk
	HiHA00UV0Jh7IBTJ/vfmocqo/hUb9lQRLA4HYnXoBbL/ZUKeJan/juJ8M42sxuYH
	yX+lVy4wyW9162Q1j56vozPGECQ1OGOp+LJ/a9ddh4KYKMvYHMbhBWKFTrfE9Ppo
	ecCLow==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7e4eakfe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 09:08:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93c5ab5c136so184083385a.3
        for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 02:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791709697; x=1792314497; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=C/iR2mjTCid+nrePpQGbvgdRC2IVUI2A0iMsqmLXvp8=;
        b=cxpGi2o6itdaUoOcNyn2/qvqt6rX24yPpSYz4fMw+lTC2+VmHU9Hy69ht2g+6eSrIV
         D0Iuo2wvVJbqRN99mQqI23ZIHM6zTBZ1YoSUXvQDex56vfH04Kv6hZ3SDEB1yZ504MRU
         mV21gpiecOjMxzHcAHsVUY7+ME2or35Z7TRV+MBu0M2SLRFGJXxrkLOl1DkhjJMsRIu1
         WNXxqDHzVAxXlEyFsjIGdV4E4OWUT7AsjnBdoQH/0eV5kepAjY19BRwUi/EkuxoCAJ05
         f/HvFxdmUv712f2WM3S+jJTSnJ9A71FCnVCVRfs8S0ExakTuJ8EbH43AZ4rg9Wb6z9bW
         tG0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791709697; x=1792314497;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C/iR2mjTCid+nrePpQGbvgdRC2IVUI2A0iMsqmLXvp8=;
        b=rvh8uA9sJZlVUa13w4QyRa5tnhz1cz+bppnp4gDOD4cu5jXC90IjFu45WpbM/eUVle
         UzO16BgrUmCEZCYXN2GZ4DYMlnElD3cKNbUlpaOHva7uyxchwflMi2Trvao8n5CImOjd
         64kB/VLpXZ5W2AJqIXce/nrB9Wy7uWJZfR4Tsm6eNFAE4F3okQbgGtblGm4CBPaRo8Hx
         P55s9GJYVtPGJy5S1bMM78XiaI6sazMqpTefPIxYFVpm/3TbKwQBvqkbmUmDbrjZJFWo
         dxdACqSAvpCA0SdCwMwioDLgRDjjQPgTvdoK6flYhbAx2lRX7IkNlztBcj/ShUQjRbMo
         UsBQ==
X-Forwarded-Encrypted: i=1; AKwUvBw6zaAuVPhpPg5Ebnm1L5R5eMSeCzTbMTlooPqMELEDWX7II+h6Ba0P9lhqpGTeuvcQVd9i64onf21e@vger.kernel.org
X-Gm-Message-State: AFq9FYKWs/gT7HSa3WcZhyemQUHWqbT13ydbsTl/ZtKuBZEf7dcs4nf8
	vlHZ/2XrbmUmEcBRQAgslNBeABzFJNDjecPGKG2b74M6WyvcjeJo0wv9ReO8aYGjPaB9Yl8HUjn
	ShTzkhksM15KhZhtPsM80JSrfVHuCZGzNEl8kXjeYxenx92WyTImySx7pJfIiN5wS
X-Gm-Gg: AYBFou22S0KfeQTts0OuORDiV6yp6B9OdvVMj2bA+E8RYZgZSoAF3Bv7GLkq6s8eLvw
	RE3N8dFfHD6gq/EioU45eEJ8NTSswF4vs9pvzFajgum9168ukCsfAVl4g2GvsEukUFcNcLcheBJ
	TdlCBse8IKPD/HbCMZa2j4+gl+h4hG8E941xtNi61pO14GMMbizsO9ijDeiMBnTXVrY7/bv6Xry
	+4cXCt8oPJOkJfgAhxP7SWCXZR/utMnZfsaNo1x0cdX6BmYBq/6SVTQGmcNiDjRhneOlpaFLZaL
	vvT12hElP0r94dQIThUpK0sov1gQgHhS7aWI+qsnxCmWcy7FwDu7iJn3AT4lvA8zj87ydKYMN7w
	FHCDMvibYkB9pr/ghTHj7pHHruMKyGZ49paUXggamdVtr4dHZNB7hnKfx5XJD
X-Received: by 2002:a05:620a:a2cf:10b0:93e:c12c:f133 with SMTP id af79cd13be357-93ec12d074emr701305485a.78.1791709697115;
        Sun, 11 Oct 2026 02:08:17 -0700 (PDT)
X-Received: by 2002:a05:620a:a2cf:10b0:93e:c12c:f133 with SMTP id af79cd13be357-93ec12d074emr701302585a.78.1791709696517;
        Sun, 11 Oct 2026 02:08:16 -0700 (PDT)
Received: from ?IPv6:2a00:23c4:e5c9:901:c496:8838:86d0:bc8c? ([2a00:23c4:e5c9:901:c496:8838:86d0:bc8c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db94e2f08sm13334523f8f.15.2026.10.11.02.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 02:08:15 -0700 (PDT)
Message-ID: <9a9cc7d383b668bd2c96596a96ca30b73e9ccff3.camel@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: x1: split PAS remoteproc iommus out
 of x1-el2
From: Christopher Obbard <chris.obbard@oss.qualcomm.com>
To: jens.glathe@oldschoolsolutions.biz,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa
 <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski	
 <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Xin Liu	
 <xin.liu@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Nikita Travkin
	 <nikita@trvn.ru>, Birk Skyum <birk.skyum@pm.me>,
        Stephan Gerhold
	 <stephan.gerhold@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date: Sun, 11 Oct 2026 10:08:14 +0100
In-Reply-To: <20260914-x1-el2-unfuck-v1-1-00d8bc35a635@oldschoolsolutions.biz>
References: 
	<20260914-x1-el2-unfuck-v1-1-00d8bc35a635@oldschoolsolutions.biz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDExMDAzNiBTYWx0ZWRfX13AmfTdHcJyw
 wP/G1VjuDT8FD0bURhV+M2hc16Gd3ikNkvhYKwMNEPSwXAojOnwpM3y6d189TclnKIcQA9Ok3MF
 EcDJnW1s9CsOI++Lo0tp4tooNRvNFxH97jFEfLsH7OBWXcCxL/GMsCQviHVET0wwuxsHsQlza1k
 y6DwoeqEnP6R0IeMT6n8vJ0oyZkz8fbzaC2eGUu0lTlS9rHw1lqtlWBIxZwPPTenypksxKLde3/
 41ejOzWRzlHtODf0bncsubNC1zTDkSsn75eFlfoXZoh43/06U2Q7M5SCleIBGLcbPWN+gX6AIZc
 NwfKD9pIo5+1fghf8/OApTC9SHWHtot5/P3ntAhit9AB9IX4JdgYucTDfXHhrg15p4rj4ENihN1
 YaeDZpVsc/PwiKT1yAEkIaxEwbKIwDfjqV8UX9V4NV0f5or5vkIEH2jTAAhhPoO0lYiF01IzfYy
 LQRY4PjOpZGk7X7RcYQ==
X-Proofpoint-ORIG-GUID: FAZi8pPKJEGHZyGE006Ec6XOMjW2r4F-
X-Proofpoint-GUID: FAZi8pPKJEGHZyGE006Ec6XOMjW2r4F-
X-Authority-Analysis: v=2.4 cv=W5utxhWk c=1 sm=1 tr=0 ts=6acb5202 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=gxl3bz0cAAAA:8 a=InlpzHCLAAAA:8 a=ud_x2R5wYZwBytq8-mIA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=kiRiLd-pWN9FGgpmzFdl:22
 a=j9sqBCYxEfXq8HZXc0HF:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDExMDAzNiBTYWx0ZWRfX8RoEFiqXsnqZ
 YZmAe4+KRerg547DLyQio5WqBL7BDnP4tjgCRNqM8ZLaSkPcqQzzlHaXFlCN70jDChv5TKaKwWZ
 j7nArZL7TG2r1ayrwWmouXvFWVQp4E8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-11_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610110036

Hi Jens,

On Mon, 2026-09-14 at 21:42 +0200, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
>=20
> The shared x1-el2 overlay currently attaches apps_smmu streams to
> remoteproc_adsp/cdsp so Linux can program those SIDs when PAS is
> used to authenticate and reset the DSPs.
>=20
> That is wrong for the common WoA EL2 path (slbounce + shipping
> UEFI). There the DSPs are already running from the bootloader and
> the SMMU probe path leaves their SIDs in bypass. Describing iommus
> on the remoteproc nodes replaces that bypass with a translated
> context that is never set up, and boot dies in an SMMU fault storm
> on SID 0x1000 before userspace.
>=20
> Move the remoteproc iommus into a new x1-el2-pas overlay and apply
> it only on hamoa-iot-evk, which is the platform that actually needs
> PAS-managed remoteproc under EL2. Other x1e/x1p -el2 DTBs stay on
> the generic overlay.
>=20
> Tested on:
>   Lenovo Yoga Slim 7x (83ED, BIOS NHCN62WW) by Birk
>   Lenovo Thinkpad T14s G6 (21N1, Hamoa)
>   Lenovo IdeaCentre Mini 01q8x10 (91B6, Purwa)
>   Lenovo Ideapad 5 2in1 14Q8X9 (83GH, Purwa)
>=20
> Fixes: 47c88db49f6c ("arm64: dts: qcom: hamoa: Add remoteproc IOMMUS in E=
L2 device trees")
> Link: https://lore.kernel.org/all/20260130073113.3091884-1-xin.liu@oss.qu=
alcomm.com/
> Suggested-by: Nikita Travkin <nikita@trvn.ru>
> Assisted-by: Grok(xAI):4.6
> Tested-by: Birk Skyum <birk.skyum@pm.me>
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

Tested-by: Christopher Obbard <chris.obbard@oss.qualcomm.com> # Lenovo=20
T14s Hamoa


Thanks!

Chris

> ---
>  arch/arm64/boot/dts/qcom/Makefile        |  2 +-
>  arch/arm64/boot/dts/qcom/x1-el2-pas.dtso | 21 +++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/x1-el2.dtso     |  8 --------
>  3 files changed, 22 insertions(+), 9 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom=
/Makefile
> index d6547fb18edf0..1d1cdf057fd99 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -22,7 +22,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+=3D glymur-hp-elitebook-x-g2q.=
dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D glymur-lenovo-yoga-slim7x.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D hamoa-iot-evk.dtb
> =20
> -hamoa-iot-evk-el2-dtbs	:=3D hamoa-iot-evk.dtb x1-el2.dtbo
> +hamoa-iot-evk-el2-dtbs :=3D hamoa-iot-evk.dtb x1-el2.dtbo x1-el2-pas.dtb=
o
> =20
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D hamoa-iot-evk-el2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D hamoa-lenovo-ideacentre-mini-01q8x10.dtb
> diff --git a/arch/arm64/boot/dts/qcom/x1-el2-pas.dtso b/arch/arm64/boot/d=
ts/qcom/x1-el2-pas.dtso
> new file mode 100644
> index 0000000000000..05364b439182a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/x1-el2-pas.dtso
> @@ -0,0 +1,21 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Extra EL2 overlay for platforms where Linux programs remoteproc
> + * IOMMU streams because PAS is available.
> + *
> + * Do not apply this on current WoA firmware. Those DSPs are started
> + * by the bootloader and rely on the SMMU SID bypass set up in
> + * qcom_smmu_cfg_probe(). Attaching iommus here replaces that bypass
> + * with an empty translated context and faults SID 0x1000.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&remoteproc_adsp {
> +	iommus =3D <&apps_smmu 0x1000 0x80>;
> +};
> +
> +&remoteproc_cdsp {
> +	iommus =3D <&apps_smmu 0x0c00 0x0>;
> +};
> diff --git a/arch/arm64/boot/dts/qcom/x1-el2.dtso b/arch/arm64/boot/dts/q=
com/x1-el2.dtso
> index ee006742d6f3b..175679be01eba 100644
> --- a/arch/arm64/boot/dts/qcom/x1-el2.dtso
> +++ b/arch/arm64/boot/dts/qcom/x1-el2.dtso
> @@ -52,14 +52,6 @@ &pcie_smmu {
>  	status =3D "okay";
>  };
> =20
> -&remoteproc_adsp {
> -	iommus =3D <&apps_smmu 0x1000 0x80>;
> -};
> -
> -&remoteproc_cdsp {
> -	iommus =3D <&apps_smmu 0x0c00 0x0>;
> -};
> -
>  /*
>   * The "SBSA watchdog" is implemented in software in Gunyah
>   * and can't be used when running in EL2.
>=20
> ---
> base-commit: 1a1de54f7369cd2b5bac0f265910e60ad3a6b4c3
> change-id: 20260514-x1-el2-unfuck-0c46167538f4
>=20
> Best regards,
