Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793198617;
	b=ZoUeRkJ4Xfx+5Vl1jTPyQOMtsjjJb+BNgXnhyOzYJ8TXqTAUgsyg41+FgHL4mkAhh3wl
	 Al4BGdt2M6KAyGjWELkYzoqtDLhEjqYVGZkmeHcG68sdMq3X6Xn4pb1xunEyRgd2CBra5
	 F7HL/LwZzwj91qRfwDqxSKy/8LIP0Sush2pPn9vyezSqB9fWIJLwDcIun8aIBLLh9gLdN
	 mk9kaIzaxC4K//hBDRoOV1ANaKN25FTVfuk/B98sxZEji8BCr/nIan+NIurMklWklHayj
	 b7z3maAXVfFhMDuX/DdSINIik2I+n6gvMP5vD01BBLkTx/A4uDKjTrilMKh9Mt7So9A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793198617;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=G1sQ0KTYK5z76bmjBHXp6Cb4x84OHC71FX/y2W7OjeQ=;
	b=cmynX7VflfJ8Xng4syEqGfZcW3QYfV6j7ZhOEaugv7kYB8Dz0PAuOvBOCo/H7fe7eGow
	 vijxufVdyXI2lTCDtuxnlF2/iP6RSvzPeXc3Va5IK+UGscs99K3CyDab9yUHB7PEesNx+
	 0JA0bg0OWdOP3iIHV4S5Qb7wtz9JkQ0j+ixB+CLNMgWAwSRqmeh0djuAeGpvmLRKaQp0o
	 fSs/f2LCIwq9aal7LhxxogXzC7ZLCzjAoQ6N1kqzdUKM/MYaIBP0xWap3IdMN2+61lpCg
	 PIA7JJVN91OqcJz7LU7vIvrPH2KoPiQfSSHs+wkTpvX4l7cgWujIML/w38e488RtNug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FpczSe1P;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CCIit2tl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F263606A325
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 14:43:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F263606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FpczSe1P;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CCIit2tl
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SDI5j6718076
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 14:43:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G1sQ0KTYK5z76bmjBHXp6Cb4x84OHC71FX/y2W7OjeQ=; b=FpczSe1PtrDQZeMF
	xAcDEWutCYtpKyczMPByF5MOKSZUV3PuS5n+siKPN+V5sXJCpt0P98t5cpnrk+zR
	mOxHXZPp5eHLMelOwCWzai4r9W+jwX7vbl6kHe5//sq996xcgxyZo1Agqdi1gmkX
	hXRuGFqV7KWCAdVazORIDlv0onlm8L49506IDfJHhzulBpRd1ETmFY9942Log2b2
	3fdkj6gCDL74FBpwtj9+yIOgUy4vriUtjZhdZXywkeJffAVEgrcbIRSg8tc2tJ76
	VkzOwDdghTlU3+28wjC8hgyNAu5IEsNv4yROZ3dnHYtLPtXSuOUPljakbOXc/hyZ
	gCuFnA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkhtjgc1e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 14:43:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f322ef7d3so216486185a.0
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 07:43:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793198615; cv=none;
        d=google.com; s=arc-20260327;
        b=qRNsPyoD5Tj5J6ATWnk4Uvq8RlN92mIB/pgwicW9kD82fTWvY0gMu/0DfiOPp/FMvh
         X8Oi4pEkFvfgfuj9aqfAMdvJWRuH+C3uSPXlPClxMbrP+6MCRnCi3lW4zCjjtZkRLP9u
         7GUXT48OTc6kRG9yYUWlS/opI3v8vGkqKZ85jaRl6XWmWviJJmaMk6Ec5Q5n9e8vJvJN
         LJEKqjQHQONchkmQCQ/eDY8JsU9JLvVmoZtj6jvqXHaozkHdOUbmR4tu4gFzaKzq/+4p
         yRbTLdVwLLGZqKLTnlWMxn33jslDwKUnghXZ5FVi8aZ8aLWGhCwpnr31govQ9l88wHEP
         lGQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G1sQ0KTYK5z76bmjBHXp6Cb4x84OHC71FX/y2W7OjeQ=;
        fh=HYsX0xuH7onbwGvgLnZDVG/aed92tADOpV6fK7Ndnqo=;
        b=Hya1gNxqaFTA/aT3d1JgjIdyVciOwdupIvs6gIPoheZbx+qno5788rrQrtzc3GwdZF
         T+7RFzyIcj2g+GszpmUrr9NbjZYruyhreXT52wGKC7fz43541L5Vqrv10b5XFxf9K2Sv
         npjHfK/Z70ZJ8glmsGpm/YVVY1V6xlNTJGWX5P5Wb4MZyII5RSS+UdH8azIWL0tYr5nG
         bnHpgVULUDkzhe5MpDP0kqtsD5FvrO/5iWZ4IaaVYz8OowIu1WWQ9gRv+iHR0gAOExvd
         DrvP6xU9faLBJqfhpkduO1xu08vc6wUWNHIQjv45TynnGa+z5jt1NuFOsaqRQ7MrdzLO
         mYkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793198615; x=1793803415; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G1sQ0KTYK5z76bmjBHXp6Cb4x84OHC71FX/y2W7OjeQ=;
        b=CCIit2tlHHsKedLvbjwfgWe1PgWJBseAnpREr+Li5MYk95ff3nkaaCugJjgiGZd4Ie
         V7FV9qsh36QeglwVVCGQaRYi+jH7/kYEIxIwuZ1w7uy25uIWaQ2/fItwap529vsZcgCq
         IVBiNBQtew7LThYYqD8hjQOWunlVyCWiZ6CfYMFxo5Ge28dAStW7TjxS4yQNvd405yEu
         llbT1I8I/o5yh0QLZ1EQT5uDiKED9koEEfVasG8M2HMF/GkDTZkcRZneef/ht1+C4UZz
         JACqLeRKGGmbMyq0Or8Zhy27baYNJwYduvXgERtST/AFr4djiEv7LUjt/VRBeCSh32lX
         scZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793198615; x=1793803415;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G1sQ0KTYK5z76bmjBHXp6Cb4x84OHC71FX/y2W7OjeQ=;
        b=m4fQSyEBGTCB9DjXauQIl9CR/4NCMBphLR9wfD5jYX4fHn/QMowbTmWKI2b/8yB7N6
         laf1G9iFsVaKw9BP2pA8V4YMliebf18LvS0/ByAbvTQmJcdxZlPG7Gz/k0AQhWzUhWzF
         53uBPWcemqh/pECqLbqq79LehrN4IhxvbBdayEwrReKqIviW9kerlETwOyJxeCIl/vjs
         url8DLPhWx8s/rdr2RREKJV8BNuxweHPUxszJXIhA9zaXGukHAcP2nZWeycrSv71tpih
         FQvyxfD0J1V2lSQNvexJXEe0x4DFZpnCyTV9ikGaTqCsR0OUpxdNN0VSgCx1CCCIuIKr
         HJpQ==
X-Forwarded-Encrypted: i=1; AKwUvBzPXos44BPVrc4QCPTo92x8K8vEWOXEQ8k/5BTS/OXTjI7VrJNsGTt36D4QMXSac0w/+1lZPzeXL/mR@vger.kernel.org
X-Gm-Message-State: AFq9FYKGWuHeq6BFPepGuUUfEWE7/cYBbI8hc6ySW0TpqCJ4CC47JZeZ
	l7roN7RzyeZ03xMlYIPIDG7HfbvISHu6EI0PA6qRuOHCMFgV9REmYuszW+53qc0gfVV/RjHpwB/
	T34C6Y8VuGXQ/aVMEkMhUcMPAEXVIJO/gBgKwFLEXcxMRcvaWthg1wrEnzkyhU1o1shCVJyvLj5
	gCWBz70vBK8wRM2ICtJzUSS/Yx5HMH3+E8Kzs6kfI=
X-Gm-Gg: AYBFou2Jo1/FcjXDdeSWuU8rWvc9tQLOzLccgvXiLNBSW//g0giuE6Rt20/VdrF7pUI
	/CN7uwX8cC2nBaihp0D00a0KKGztalEo2dbNEMs65pamCaBfZLULmts2PxkUdvbYAGYMQ+3c/qT
	y//6mNNXMPpVMtkDnyBgJtyri1LiaokVdku7TqG9DyQ25nYFavrbb7gBEKNBjMwokqwHiXify1+
	+2nJh1niBOPEh2Jy0/bGwxILluztYBBXGZUJQna+nQEr7arC7j1mmKPB75aCNy06zcQAy8j7uY=
X-Received: by 2002:a05:620a:4689:b0:93e:96e0:25a5 with SMTP id af79cd13be357-94408c992a0mr358637585a.41.1793198614678;
        Wed, 28 Oct 2026 07:43:34 -0700 (PDT)
X-Received: by 2002:a05:620a:4689:b0:93e:96e0:25a5 with SMTP id
 af79cd13be357-94408c992a0mr358630485a.41.1793198614157; Wed, 28 Oct 2026
 07:43:34 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026224957.1115370-1-vz@kernel.org> <20261026224957.1115370-4-vz@kernel.org>
In-Reply-To: <20261026224957.1115370-4-vz@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 15:43:22 +0100
X-Gm-Features: AclHuK_taK_aMlFswRYK0_FTG2aOOebWlCbuvM81f6qI_UtBtqUvnrbidwtdTZI
Message-ID: <CAFEp6-3kDzxU3=37b0KEwGoN-e0or2KzS2RO=h-a3S4ZOdDSgg@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] media: qcom: camss: Allow CSI2 PHY devices without
 CSIPHY resources
To: Vladimir Zapolskiy <vz@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, "Bryan O'Donoghue" <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1OCBTYWx0ZWRfX05nkhyA4FRu8
 G7s6WuQgsPapkJkc2/IPw/EA7wBs1aNFq2S7/PShnbi8QTs1BCO3OvWHYSXg26jYyuVY+c2SESQ
 +JW8ZMHAiH3f9g7jfSSGg8j6PyVOOBZewnf6wHPin/A0U099JkYnWqi6u8kAdVqga8/E97HEOJA
 BBIvutAj19fmXff5IlPNNu3v/qFU3Pj/C86PTkj11Am1am9z8F6mibd4OHQEfQC8usguRxs3otI
 +HhFErPwR+MAQMJXjVjSA6BdVo+zM2wxLaT1KH3fwowk2IFZDyGKih7/pvhhHHiOgPD7AliZoEy
 QIZa/3hqoLsqkVAD39O5pgJCCfqIA5K64eMla+DEkcHdYNZcAd970PlXyWfP0qbwOa/x3eGuMc+
 Xb3eu5M5XKVLK8uBoZTEpfovDOthAkjMWyTWZ+4GGOnWS/WedT2w6wkgKpYxmZUsHRho5p4jGtG
 Ofd3Z8qqPVOgyGw6ZZQ==
X-Proofpoint-GUID: wzzw-CUY-4PIoCV5jo4-1Rs7B_rK7q0Q
X-Proofpoint-ORIG-GUID: wzzw-CUY-4PIoCV5jo4-1Rs7B_rK7q0Q
X-Authority-Analysis: v=2.4 cv=LdipeTfi c=1 sm=1 tr=0 ts=6ae20a17 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=h-S-3Q9jTzTep4s1cPEA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1OCBTYWx0ZWRfXzWTR21Tk9Gy4
 n4qmY19BCAaB17+6rs3xueH+F5jcBmvk9ZTgW+hM78S/TNLYzstNn5SnXOPw1NBQwZIbfg96kYz
 eul/P+DIbURfTMZqJhQzKZA2E6xIgPs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280058

On Mon, Oct 26, 2026 at 11:50=E2=80=AFPM Vladimir Zapolskiy <vz@kernel.org>=
 wrote:
>
> If CAMSS CSIPHYs are supported by the stand-alone CSI2 PHY driver only,
> there is no need to provide description of legacy CSIPHY resources in
> the CAMSS driver, therefore if CSIPHY resources are not given for some
> supported platform, use CAMSS CSIPHY port numbers as CSIPHY identifiers.
>
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss-csiphy.c | 16 +++++++++++++---
>  drivers/media/platform/qcom/camss/camss.c        |  8 ++++++--
>  2 files changed, 19 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/m=
edia/platform/qcom/camss/camss-csiphy.c
> index f99eea2ef228..8ecd514451d2 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> @@ -799,6 +799,11 @@ int msm_csiphy_subdev_init_legacy(struct camss *cams=
s,
>         return ret;
>  }
>
> +/* Fallback to generic SDM845 compatible formats for non-legacy CSIPHYs =
*/
> +static const struct csiphy_subdev_resources csiphy_res_phy =3D {
> +       .formats =3D &csiphy_formats_sdm845,
> +};
> +
>  /*
>   * msm_csiphy_subdev_init - Initialize CSIPHY device structure and resou=
rces
>   * @camss: CAMSS structure
> @@ -808,7 +813,7 @@ int msm_csiphy_subdev_init_legacy(struct camss *camss=
,
>   */
>  int msm_csiphy_subdev_init(struct camss *camss, u8 port)
>  {
> -       const struct camss_subdev_resources *res =3D &camss->res->csiphy_=
res[port];
> +       const struct camss_subdev_resources *res =3D camss->res->csiphy_r=
es;
>         struct csiphy_device *csiphy =3D &camss->csiphy[port];
>         struct device *dev =3D camss->dev;
>         struct device_node *ep, *remote;
> @@ -836,8 +841,13 @@ int msm_csiphy_subdev_init(struct camss *camss, u8 p=
ort)
>         }
>
>         csiphy->camss =3D camss;
> -       csiphy->id =3D res->csiphy.id;
> -       csiphy->res =3D &res->csiphy;
> +       if (res) {
> +               csiphy->id =3D res[port].csiphy.id;
> +               csiphy->res =3D &res[port].csiphy;
> +       } else {
> +               csiphy->id =3D port;
> +               csiphy->res =3D &csiphy_res_phy;
> +       }
>
>         snprintf(csiphy->name, ARRAY_SIZE(csiphy->name), "csi%d", csiphy-=
>id);
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index c54185c93a8a..b0d60e70e4bb 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4796,7 +4796,10 @@ static void camss_detect_legacy_phy(struct camss *=
camss)
>         struct device_node *remote;
>         struct device_node *ep;
>
> -       camss->legacy_phy =3D true;
> +       /* Legacy CSIPHY description implies the provided CSIPHY resource=
s */
> +       camss->legacy_phy =3D !!camss->res->csiphy_res;
> +       if (!camss->legacy_phy)
> +               goto done;
>
>         /* Find first remote-endpoint and determine if its a PHY */
>         for_each_endpoint_of_node(camss->dev->of_node, ep) {
> @@ -4810,6 +4813,7 @@ static void camss_detect_legacy_phy(struct camss *c=
amss)
>                 break;
>         }
>
> +done:
>         dev_dbg(camss->dev, "legacy phy mode %s\n",
>                 camss->legacy_phy ? "true" : "false");
>  }
> @@ -4841,7 +4845,7 @@ static int camss_init_subdevices(struct camss *cams=
s)
>
>                 if (ret < 0) {
>                         dev_err(camss->dev, "csiphy %d init fail\n",
> -                               res->csiphy_res[i].csiphy.id);
> +                               res->csiphy_res ? res->csiphy_res[i].csip=
hy.id : i);
>                         return ret;
>                 }
>         }
> --
> 2.51.0
>
