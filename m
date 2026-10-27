Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793098347;
	b=2ylpymVp+urdCXi6yTZkRWtXiVLhQLFulMB2jvXQmGaXteKU9hnvshhqmEiBGvXoex3F
	 fEQcC0FVz37h3bhXn1JxtCO2tSSYK3TGKuHIGC3j3snvDIuQrHmaVMiNhZU6y3jzntVWp
	 MQGIVL4mDvwngSSBs76sfpOHtD8OxLq2kM0M3W1g4QkZZc1eSmUjibYLIObdeJ3+1ZBKE
	 JUEEiVVLwmOqqhqFuMYwibmMw5sjaYIppnHiIXYrHRWLlzQslEuCC2hsQE15Sr7zwmgZH
	 vJ8IRwDU4U6YeX2g1YELQFb+8EaM/pZvOS216+epKLSe9By7L2aU+CUs2k8phPjWaHg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098347;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DUhODUYkbj7YwSAO7e9lxcIEVTvWrcgFG4thBV6K17A=;
	b=kQpY20WkOKKfrKGw9tUvfJlTLTPLKSfBbzSHS8yaii2DDA2rpaLuGYot0592q5Ww8snQ
	 vcxNYZ8+c6yrscTUHMXrwmO70nM0mbFef8Sd6Py6c+KD+FUnHOpP40PQBv4S4e7iRM19a
	 tRCxuDw7NAK6gFLpE3jt5AmkZTaLt9wq/J/k9aInfFwJRxSvDC7Lgtejf4YRNWtl4RuS1
	 8HpzLqzBWyAxf2RNtx0UCG1zYyBQLl/FJIheNRVUTk/5MSlwy24bpSl6EC0Rfd8SvPqcz
	 PxKCeBGKrLNUnBYjU13whoeH4U6GdaIUWc1BtEFwLIqwl+SqB/JToQfbrkoxXivbJhg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UJNJebC+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hyMSQV3Z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68AE8606ADDE
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 10:52:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68AE8606ADDE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UJNJebC+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hyMSQV3Z
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeCFv3026391
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 10:52:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DUhODUYkbj7YwSAO7e9lxcIEVTvWrcgFG4thBV6K17A=; b=UJNJebC+srj8kNh1
	No1muHd6VgXNBoavmCmYSGJigq5SqZbxbO487zcMDIle3IUBr8V+h/q3jIB9I80n
	J9lEkQmeWpt2L6SXdLxohQ97LwLQvO5StpUyHru4Q+VPueJYhVQjHlg8rVbbH9jO
	GsCjDQ9DsX0lpQtdpVwsxJp1YL13gZwNqo8hRWCRSKvLgnOEw6lETvdwG9J+rUev
	kePlRNXX34Ekn9j2NgHeYxdpWklZBId0r6lzQf8PF8W9CuXDy0BfPdRSVFIBDTWa
	Wy72flRiJrCQ0g6QJLD8C/iQMquK/0DbOiQvmNGmsgW2yZ8LDse/4JW95CF8tyd5
	2OBVqg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjh91a31m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 10:52:26 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5339739b343so15615131cf.2
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 03:52:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793098345; cv=none;
        d=google.com; s=arc-20260327;
        b=PG1EsM10b67nATdulzr2NZB350uIQsO7DxxX5zq50wfzK+DbtfQQRXuEbv9tvBBEal
         qMg2Ffe4vyPf6Li9zVIHw3fn250I3ukRt/0jpO7wxXF0umZH31XE7uqg1f0hOIMTF23T
         74XegyqH+Wcido2izB22jHFAaHSU8xGlRCGgUn0yyvEZu0H1r5IvEq7+6/eA5tM46Tnh
         7o+dCrDT94ude9/BBtL/nQaqCGb8Dyof7GVyemTxk3c94HMFGioURGkhBg8Y0LCs6ydp
         dwUFyRzMcGnmNcxUcZ5R97WCQwW5bTZRPnd8/VSbk46wG3X95zOFe4tUEC2dyIKdJ5Az
         Qz7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DUhODUYkbj7YwSAO7e9lxcIEVTvWrcgFG4thBV6K17A=;
        fh=Tj0lmHU89ytZzi274dALRG5i3NPfVBcbvqVot0sKtl4=;
        b=ne2NuPa15JSMiqwqS3/upQYK1/rDcy46VpXKH14Mfiu+3PX814LcYWf9k+TBA2IjK3
         YIZY7lAVXIk4ypHOefDMvh0Jnji/ej0/crgeSvcdTAwWoqwU5gvBlN7CVeYJtk1wQDUe
         AOwYLo13dvqbIJH+iRRvc2JCg3dLQoByMzlaltmt+mOWVM8GVd9H/xM+KjzIkHm92gUE
         LyQcbLoK76Ri2jRncSIQ4iTGyFoQwsRLN+9XyxsWBCbz0Ux4hBxR9MoSp8HgTp++MfQ8
         MJ0BiXddB4BePhyc5bWlp4CVVyPnJsIh7Fvd9+Qv9SEDKGGtCArefbHwvMb548GZ22wn
         xbBA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793098345; x=1793703145; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DUhODUYkbj7YwSAO7e9lxcIEVTvWrcgFG4thBV6K17A=;
        b=hyMSQV3ZARguLjsMcA+bVsBggl2efRQlFZlil9vytOnGM9A+RvN4t6sKPjMKKcz6/3
         pHlA0EEUpLE9mAwq3hRRTtehJDY7J3pefs7kJUoSDmIxz3VhXkT488fMsyGOa65lqWqy
         i9Ctm/T6YQGE+BPs9tS2jvi/gr2ExjhmB8dQWXaArqocJRucIFIsvsUODqOe+jdOmD6B
         UI3Wao4RhReodfIanZjvN6/cjrO/PSG1dCbcYVD/Nn1asmoRfuIN4nKG3yT/C1jri0Nb
         iuwIB27Oro3gGhCSUjI42ygAjWLUke0/Py5cy6QfILLhG1iVswnJxdNgz09dtWLDAwhG
         HDYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098345; x=1793703145;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DUhODUYkbj7YwSAO7e9lxcIEVTvWrcgFG4thBV6K17A=;
        b=m+YOOJ9Lrov9byM2w8WarmV/PTmt2l6cVbAdZdqMj2ngBB0UcEmnVJqer/tWC/pEIy
         BFTuGtv2uAlyWeP0XMW/63q6wLO6WWGj1hRLT8wXVNUN9E1Q8PdCqIiAjgI+sRaTC/Rh
         R2n512b4m0OnAW7TfH377JPZat5zVcuihotfoYcHRQtps9nhHprpWIIc81JKHuHFHgYQ
         0VxKm1DE5DqVNG6Mp/PdhdcJqG8hXnwgxjOb1XtwSRSpMXXsEWoTVUWDmsBVY/APynO5
         p024AcOB1+NtGKdMIntDY7xI7TNyhh2bJlknfVBXH7pMPwymExtZ5vvtjlSHt6p5xdqF
         12mg==
X-Forwarded-Encrypted: i=1; AKwUvBy854VsU+RW7HYMc0Iv21DX0cePVwtiPicmreNWIpiLJeEVTnDu9R6cvYpmGAcRv8RnEiHQ+Bvbh+MK@vger.kernel.org
X-Gm-Message-State: AFq9FYJmqK0hwaWTXJ9Klqhy7yimMw5h7Y7RCHIRl0k8k58VlwRQBR7P
	vtbYpehKEp6cbV19OFRxtk1YKWUilJfJxIXkT7aYBKPg+Z0OcRtskFJGPJCPujkbAnlXmjIEGcF
	AUKv3tMMsDNKIBZ7CxKOPx7U2e6wssqr6Ia4i2ixW4phcRah2YSD5XzFdaFdwKXu/J/dL+kguew
	Ir25V1T0d5NWSCCiOwZoP4eCfBTzj2ngkVxTSMKqo=
X-Gm-Gg: AYBFou1yb194OFqNG0rL7Ok3oZiAnpDpEpTRQkClv2ZCXTNSgeqOzfAKQF4dYZL+uBc
	62steU/s/aUt07lcj2u9bePsB7T+WCeK/h6cCDnJa8koD8tpS4Kw/Q0VVig4htoo+ArbeQW+i2s
	z2688eE8ATlfypqIz6kxlkT+gXuo4JxSPUiXtsg7OrrjBU4LcFlLpCpfEIffxSizVh8rmMpiU9I
	kLHBFwR4BxWaHmFb2+E6D8RoJxLzoxRzWWPpKzEk67DR6kTAt6WZM96nA7phtOE0nFKPk3Ldxy+
	UM+k0aQgZ9eiQ3tYLjDdopU/qQtK
X-Received: by 2002:a05:620a:3704:b0:93f:3193:ac02 with SMTP id af79cd13be357-940ef980186mr1471686585a.51.1793098345367;
        Tue, 27 Oct 2026 03:52:25 -0700 (PDT)
X-Received: by 2002:a05:620a:3704:b0:93f:3193:ac02 with SMTP id
 af79cd13be357-940ef980186mr1471684685a.51.1793098344925; Tue, 27 Oct 2026
 03:52:24 -0700 (PDT)
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
Date: Tue, 27 Oct 2026 11:52:13 +0100
X-Gm-Features: AclHuK_W73gHmnyhBWT18CczdSRYkFSq34tLIfhksbP66i2-mLn75HpT6SxBCv4
Message-ID: <CAFEp6-16WAoyS+aY2BzPknsMtHa1cSfVYNmYvTKHm_MWqqW_ag@mail.gmail.com>
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
X-Proofpoint-ORIG-GUID: bXwAytmlzop-ZgRY3-e_Ao8FRNMwmbpu
X-Proofpoint-GUID: bXwAytmlzop-ZgRY3-e_Ao8FRNMwmbpu
X-Authority-Analysis: v=2.4 cv=TuxzFzXh c=1 sm=1 tr=0 ts=6ae0826a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=seWYDaW_jbbixs5KtssA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0MyBTYWx0ZWRfX4UeInvGG3Uif
 IzHZHuKWash7IEz7wfKBOgxiDZlSpe+3wGFFIlK5MDHqqmcgJDDJwmg41GgrHOnC2OMVe11e4uC
 VkYq+eCWuWxPj53P4VVelsIjcWNYlnUTgRaknJ30eOfieDVQcdUR3458QKsZXFUPCnJ2xpdBoe9
 XeXPtEJ2a7Of9Adsmd5+dr+xOyBBEDJKgpBfeAsHIH1h8+eO5Mrio344q5G7TsfqDf9ljzunGns
 W0mpFgd1ElkPmdQERqNEcMZob8b+BtPMoNhd2M27kO9XpkeX3q/gfgsl6QoUqdeC9vBzNORxkr6
 Msvm/VoLhqZ10pQVAaXkOgwjlnulCLZDxm0sIhOCfHsP0NXv8mVKEZHvZYc9WS0d45UrmvsCOo/
 gXitAqlejcgaPy70VGdmdGGdg0usnkO/IrN1bcMSRF19GLYY8se6NdFhzYdzLkkHChL/vwu4mC3
 hSkSffAeTZb+gqTxlIA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0MyBTYWx0ZWRfXymdpUWyiXf3n
 dPrQlMIt+M2WJtTN/mlIYXz1ClEAxisid5azzxeLYtc4PP/aOagJUiVqR7TOZN27J2CxP7jrrwF
 16eMtV8d00fmwvYowLEnbAiKZ4uvycA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270043

Hi Vlad,

On Mon, Oct 26, 2026 at 11:50=E2=80=AFPM Vladimir Zapolskiy <vz@kernel.org>=
 wrote:
>
> If CAMSS CSIPHYs are supported by the stand-alone CSI2 PHY driver only,
> there is no need to provide description of legacy CSIPHY resources in
> the CAMSS driver, therefore if CSIPHY resources are not given for some
> supported platform, use CAMSS CSIPHY port numbers as CSIPHY identifiers.
>
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
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

So, can't we simply drop the above assignment and keep only the
port/csiphy_res_phy below? That would provide the same behavior for
all non-legacy PHY initializations, regardless of whether legacy
CSIPHY resources are described or not.

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
