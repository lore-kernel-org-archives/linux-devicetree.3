Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793610455;
	b=Fe71UqyIKbwCZO0hKsnkSVOHG8/zu9HxYwacCbdpDjTmFUST8ApC/AH0JVCdLeN9H4Eq
	 4pWuUjPZiOQhQEB8nJYjGerGYvC7oaB8B6qbDkIfgY9dYbt5CSTNjY/tEGgIdaGGWDVBC
	 xulCJezUagQtEkGE4c6mk6ZoE9A7+40LGkCgc5elYRfb6sS3dVonBiRpEXhpOPXv5v5f1
	 xpqst0M1JTILgeCnEtGEjSNh7kDNemNPL9LGOnNlm09k4tF5SNLXzcJhEbwclZ2TWm8Ag
	 lHfY8hyoE7uUYEY0FETiXphzKqw1eFFKwyWXRIFwWYtn6EtPhIIcE/ZuoVYm/h6N8XQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793610455;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SONysu3rtiNT7LYpY3uzOoN07A0fuvG8d4SbPJMEAw8=;
	b=Pow5KivD78mWKR6tJCNZ2vOfgOTZdsNjZqCxBEefkOEObNlioH+zlEUKfJFs+BbLiDUD
	 Kq1Pmrwel1liWg1GgV4Q+hTsYDu40IcRwIsQtQsqh1yEJKvoHHNfrhMoRMX6+JoaxOfrL
	 Z5Ehp14BfRv0O8fTX62Ih/e8JM/UK2gC4tvrOum2+iuRBcGpuYy56CqAkMgr4ZqAtJmov
	 TIQjaLQ+n3WVdv7aRiSHu9vVKVxj9JzapAesQ7wlfIDQADI6gnnkiktHZymONbJk6IdGW
	 cBeYBWf+Y5iT0aZgICFqd5T0hlYtfC7KhQ11nUNQZqYuhDpnv1cN+tKe+MJp85c+4IA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SutbqeKr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="C/4p5whp";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6448A606A332
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 09:07:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6448A606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SutbqeKr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C/4p5whp
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A24vv9Q1261894
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 09:07:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SONysu3rtiNT7LYpY3uzOoN07A0fuvG8d4SbPJMEAw8=; b=SutbqeKr96Cb63qy
	mpgas1pHXMIBIQkUNjYxJVsH2XgpHVqKrcEFUKYs00zCoWPePw1mV2meAKOQnl2i
	PNxjvu48aZlwg/belftXKaA9RuG3CD6gPm8IIqkbUZvaFVP8j5rmy7P09h/Q+w3c
	Z1WQoo0QFU3DdZ+glswTLKHsj6b+o/urn9ANrPK9oRnOGuggIMrSqKlk4wHjrX0a
	tZe7iloNmb5SjHq036uwayL82mbKVRTJvjaZ9rczAnJ8WmIeD2lLxu/KWsntds+A
	Ta+0wk3wtCHYJHueZOYTQCRc7MoJmUlLuW0TrIYkE+Tg0GiqHhlKaydfyFSwrYtL
	GmY7Qg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpky4gvqm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 09:07:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f13c143c8so510745785a.3
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 01:07:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793610452; cv=none;
        d=google.com; s=arc-20260327;
        b=G9tR0qgzJrVQdaOM9Lk2lvphd8m8nq/VHvIcRlyRzPehoAcXEEf3SVAZsuUdF3SQ0M
         zxdEv3Q3Q6BwaxsL2ChKBPSh/DYIzQTMhX1aIKunihE4+27lFbUbeivXCO1dB/wMDf4o
         C8fgK1fgJC/N2rDPrzS6dI1hw9gRDZorbTEcaUi8nm86GtiyoqpI44lOUS/tAb3i8Ees
         b6RayjCcjyWlTTukjI5CqDBsKgEV+Lyb9bpcpjYlJ2alCtOWbTvdEA2AZnOEz7CLhs2Q
         rcBuckQQ4hUX+BDD3TAas2HGN/cSB2/4vtR26eWL9O+mh1GjessCSRikJw3fP4NCZQX8
         HNbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SONysu3rtiNT7LYpY3uzOoN07A0fuvG8d4SbPJMEAw8=;
        fh=uV5LlX5zmFvC0X3Tn0lp1P8Sq283oHXn833b7STKlXo=;
        b=IkwqqYw585uRcdarctRFzvxgnvqe1U5/bgP1EcImIw6qULfuFLR0zlYNzmamSxQZ3b
         B7JNZB3VPqhjlmo9zR15/s1I7m9if1VfbRm7WTyANpXzqJPMlg7wq7DgIdcbgsOm1EUp
         iHKG1tAguvApEVk1lr1P0CEscZEC+OO3nlIMq0KAorThoc3WJ5EWbIx8jWpqtg6Vbpo/
         Rwqjnxc6H8fdgwhjQ9+fu3/llH1XJ6wwj41ckn38L9yrOBIxhXh2oaPF5iYTfFivBJtd
         9GfiBTNOajGgGe2MiCE/dkf6cLdKlsAiWk/1n6AjgZA8TmtG1xo1aZaycnHZ1LZ5k21v
         x34Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793610452; x=1794215252; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SONysu3rtiNT7LYpY3uzOoN07A0fuvG8d4SbPJMEAw8=;
        b=C/4p5whpXmi3JW9ueD2TkaAEp3yJ04QK73r+8JrTZh3q45iXKl+7sBjSVCukW3VKLo
         HRSzyIGXXG9knjJMNjr2CmThlpK9DO3coJWifETL8KaItfdiqWjsSIHwALQyGJE34Zsb
         PyOgpvuQPB/B65lWQaFHddbtCsjWv3GsQ9nP8L038p2JXLHPDGXnamsH6N2c1nihd60v
         WMrodVwJDawdztuY980ZXouZJyOZ5L7DHwpamvyl0wWddlkYYXCXBYycwaRe4fAg+Aa9
         A+wsITo5REBKTv4z6Juxz1v9z/78genoj6apIFYGIY/xWDulvQTGTAeJZVcW3HACnzWA
         06BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793610452; x=1794215252;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SONysu3rtiNT7LYpY3uzOoN07A0fuvG8d4SbPJMEAw8=;
        b=SxULUiVmF65bGgI3PYiXRdE1voPcwqCdbXQFZj+T20Ys5MYe4vBLiMp2gBPZJEZGE+
         1HuguJUwtOlwlV8Rp6okW8s6zuDt3Al8IMVG9zNmjG7xJw05RKSU6v8AYe04Mbhvd/5z
         IBEs1hrxqdPFERtzPkpXNR3MyUmMt9vi2S70OIhOJpc7nZxVvZjy4Z3HDRzOwzuBsf6R
         WpWoQRZMZnPIgC3SIHaQAFvDDlMDqZqubkURQbz29lrWTIV8XvhaHW5mVErlWM4z/7kD
         ks+XMzBaVn/gPXCA0Pk00q+L4FVuB48pJR4/qc3FqnSRmlTjVnpcyBe9FM01icaBbUPh
         /CYw==
X-Forwarded-Encrypted: i=1; AKwUvBxVWBH9f64T2OKYabmfM/zaa5EXYGfsGN1ljYH0oaPiYGLcJIhXzRldssVwxopo3L8BHGIpLd7EL73N@vger.kernel.org
X-Gm-Message-State: AFq9FYKdumpwUsp5o9lPff7jVxClxV2tazNx84QS+DFwavidQ+5g1wrG
	W3uUfm6l5DOAmXiBQpxUV/3Q2H6p0ucBS8V17mm1YaY5KamQmyhoGmbVRmHF1jJSunZ+vc10QS4
	h7L/tPQcoxPhIYEUv46bu3Hx6pS5LTnwBsDbr59IxEsIA+Yw+pAnoAyISM3VpSxtCOk46/yhkWA
	lqUPZm+dKpmSz57DdMVZ4S9yXG0VIviZDufvgLOUw=
X-Gm-Gg: AYBFou0adYfMuewkduO+3tUHLWNeAm6m0SR9Bk8dPXlxbGbPcFWMGrsZP+KieInjAy+
	B+2OmHc2iauePM47KCkSW9F7mGSGxFjUQlmEnHSHCsJ3O8I/RuzV7b0cXiM2Qmdrc4Ae81PAGT+
	9KNaptpGCNl/Et7D8StO1Lw0gfB0mDpV3SOXN66TWHLllmaG9+L038LUl7T7UCX6t0aax+dSZiW
	8Exuk3JKKugF6sGycBjFg/IdgnFcgqq+cQK8GZEHEm1b4Tx2AURC1UxdVqO+oMf+tkNHrmXL6M=
X-Received: by 2002:a05:620a:72cd:10b0:945:ae36:d318 with SMTP id af79cd13be357-945ae36d4c9mr443312885a.61.1793610452474;
        Mon, 02 Nov 2026 01:07:32 -0800 (PST)
X-Received: by 2002:a05:620a:72cd:10b0:945:ae36:d318 with SMTP id
 af79cd13be357-945ae36d4c9mr443310485a.61.1793610452047; Mon, 02 Nov 2026
 01:07:32 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031112203.545319-1-vladimir.zapolskiy@linaro.org> <20261031112203.545319-5-vladimir.zapolskiy@linaro.org>
In-Reply-To: <20261031112203.545319-5-vladimir.zapolskiy@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 10:07:21 +0100
X-Gm-Features: AclHuK8qwpJ4t97NQfYBs_D9ps5xva1LbxOD8GCWXYj_2Vf6LGgnzwQQZn9XolQ
Message-ID: <CAFEp6-1Z1_DivMsaZbX=00tbG-xw5ntqAoe0QKyM4iA8SrfGbQ@mail.gmail.com>
Subject: Re: [PATCH 4/6] media: qcom: camss: tpg: Support TPG hardware version 2.2.0
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: sIlvH2Bjtdth8_txqXm5Gz7rM7zI9_1o
X-Proofpoint-GUID: sIlvH2Bjtdth8_txqXm5Gz7rM7zI9_1o
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzNiBTYWx0ZWRfX6Zl+4wpdcqzr
 Xzb2fsEKeYg1VgkPHu6YHzskShDAvFLiNBmpEn1i3cpExjhh9E4oSivPdddjxELLljhLN0+86/n
 S6vcSjeUkipE62h1YM8J4DXc+erHOWI=
X-Authority-Analysis: v=2.4 cv=QoHLTlyd c=1 sm=1 tr=0 ts=6ae852d5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=XBxIerWLAjSjZTh_gn0A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzNiBTYWx0ZWRfX4WdBXJHN/jAe
 sVe/goU1LoDnEYxleItBu3894mNF6es6NZCZyv+p9UmgEUn32TBxfvETGiuQOo2+DmUSXCI0Xoe
 l3b/kjuWzyrbOFcbm8d2ZCVoas1TAolIsNcCxIOS9/BE+TB5joVRqH22P/1wVVxmS4Z93dwfz+Y
 EB91ZmenhIBBfDvD9J6n1QqCBMEoFwjPiDhv4J5yhqpqNguMgB/BaXNA+3Gwk+ligtE+zb6otQx
 do2SclUh6W7ovWavHjrsmt+oqAx+aYxCCvoOOV7CWAI59aXmysbXWwbM+KMvABusUdkD5H2FGyQ
 qvVLY1oRaCn2NrrtuShE+Iqrdeiief2T5PU7gx+UCOm6l5tpYp1wprEf3sM+L48mLsCtb9z8tty
 WoLoLB4CMt/zoxE6x/uUb8QYjfZD+f/RxNWuItX3GIH8O3vAUm+L45bp8RlES4ZgTfLV2jjZaF8
 3Pat4t0I7Kip7Y80Szw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020036

On Sat, Oct 31, 2026 at 12:22=E2=80=AFPM Vladimir Zapolskiy
<vladimir.zapolskiy@linaro.org> wrote:
>
> Qualcomm SM8650 CAMSS TPG blocks version 2.2.0 have no test enable bit in
> TPG_CTRL register, test pattern generation is started by a test enable
> command written to TPG_CTRL_CMD register, which is also used to reset
> the TPG. This is the same programming model as the one of TPG hardware
> version 2.3.0 and 2.4.0, hence lower the hardware version down to 2.2.0.
>
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss-tpg-gen1.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c b/drivers=
/media/platform/qcom/camss/camss-tpg-gen1.c
> index cabbb2638cf3..a83f9a80c2b6 100644
> --- a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
> +++ b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
> @@ -22,6 +22,7 @@
>
>  #define TPG_HW_VER_2_0_0                TPG_HW_VER(2, 0, 0)
>  #define TPG_HW_VER_2_1_0                TPG_HW_VER(2, 1, 0)
> +#define TPG_HW_VER_2_2_0                TPG_HW_VER(2, 2, 0)
>  #define TPG_HW_VER_2_4_0                TPG_HW_VER(2, 4, 0)
>
>  #define TPG_HW_STATUS          0x4
> @@ -170,7 +171,7 @@ static int tpg_stream_on(struct tpg_device *tpg)
>         val =3D FIELD_PREP(TPG_CTRL_NUM_ACTIVE_LANES, lane_cnt - 1) |
>               FIELD_PREP(TPG_CTRL_NUM_ACTIVE_VC, last_vc);
>
> -       if (tpg->hw_version < TPG_HW_VER_2_4_0) {
> +       if (tpg->hw_version < TPG_HW_VER_2_2_0) {
>                 val |=3D FIELD_PREP(TPG_CTRL_TEST_EN, 1);
>                 writel(val, tpg->base + TPG_CTRL);
>         } else {
> @@ -183,7 +184,7 @@ static int tpg_stream_on(struct tpg_device *tpg)
>
>  static int tpg_reset(struct tpg_device *tpg)
>  {
> -       if (tpg->hw_version < TPG_HW_VER_2_4_0)
> +       if (tpg->hw_version < TPG_HW_VER_2_2_0)
>                 writel(0, tpg->base + TPG_CTRL);
>
>         writel(TPG_CTRL_CMD_HW_RESET, tpg->base + TPG_CTRL_CMD);
> --
> 2.53.0
>
