Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D4A511E7F
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 13:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789650359; cv=pass; b=oGCT2+KQzkeULMTXFJIWfDKOEodR/VjoIFMF40dIkvbF2yXUZpFdSOLfooOJPvou9EPdE/Fspy5FFOm/try1kStk2QEtU3/JQPkTSuMUiDfaZ8cOLAx20Mf7kKg80yFyBP7Hp9OExKYrSRQctnyEh48yB45ct8Shsfk0V/6zB6k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789650359; c=relaxed/simple;
	bh=8IL+9d/MUTxeEtCVy0R3kJv8unHhhXQBzwpVyCii6HA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jIxFnK9BVo2Y6K2rJG8RU95aJlsV8XW4g0JCtFUKjQKH+KNG/72uEDxma9N/EhPvRubLVW2iRBt1MY2gew2C09OmzoWGRsjiV7RS20/fA2iSrekFGD0lGsmS4qmESVl6IM6TLw/yizW/ioKErrqXs8cOz3www8qW4yeZ6aIxwXw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ItBkVj2B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LhqC9v8E; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ItBkVj2B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LhqC9v8E"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HBoxo62013666
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 13:05:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dcpLG6DMML8Weg9JX/ObKCjgeBkwW9cRNv7d9wKBVx8=; b=ItBkVj2Bg01+5DVV
	A9ABdg3vzKHIuZtLrjMF/Es16yvvPGMZsEHLHt+Z9ymwOyQ+6OLWB1P8yVJH4BYl
	Fk7nT1p7Nhm74LxmZnbUu5yqAK0PTn0reKoeYiLJInqOgBhj27UCOZpWAhb31ecY
	qqZ7aU0Xy23DuklGx1/ocnQTY85eORgZw2cIKDgdR1M7WFEO0qN7tQlN8mZZQFMG
	mS6tmwN+pRFGRgm/pIcjqmU49r9LQn/tJAP5UB/ZOLVALnw4Jb3a4zV23/e47BDr
	Z6mIxYSKKA/0yPQbOczWLi8Swb2FiV5ED5FiWCSe8L11ihed2L7B1ebIu6Uq4NPC
	b7WpWQ==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grfppg8pq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 13:05:45 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4c5a1a0b54eso1697928b6e.0
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 06:05:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789650345; cv=none;
        d=google.com; s=arc-20260327;
        b=kATjRON60AkX//aasPV6jR8o4zCTXpKygZ/KMMuc7uwBn3V8FWVCu+nphFNM+pBSiu
         5SZ8Zf1i+ECqLMWmBD0R3vYhqPnn5+BpvU2jRmRFZncaOy6fH9zvjfp2rPj1PCHPDtHZ
         SY61X9O/Ozq3XFEurF7tMn28ClRVZOXOSfRtZG7npvJNIzZgiCoNM/bYuB0vXZcm/m6C
         27VH5n1KJrucCt7uSgeenndp4GnZ7vO4bhsMMZvOpnbwREzNYPdC+o3tQlWhj8i8U3XL
         EguniUs/DpKuDW/OpffvvAUu9rMSstQNozHKo8EN3H0+z30mYl8VVFoHhvEVczjnBKwJ
         jCxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dcpLG6DMML8Weg9JX/ObKCjgeBkwW9cRNv7d9wKBVx8=;
        fh=B+MbPSMg0j9eQbR5sj6nti8VQ16qGmGPIU658WcaF24=;
        b=nnkbs8EVB8sJdXI5m0xD5lwfhwLbRVdmGtHOKnuJejF8zJ4mlhWBlyILe7TQv9l1uQ
         XuiiisOMrZd8kEfYgkCogNMryPNIO+N4Gqt0D366TiLijJL4ts/jFgB44sOERJYnEprh
         8z2Q2UJNsxe1uUU3NIGRno2xjVi2oi65TxQUuPb9P7wLr7Z3vc1RN2B6c33Uu14v5aad
         /zSHhbif2xVbNfALElsjVqIe7/pKdnO5x+un9WL3rCAINsN/6+Y3+sfP3Vz56WHqi0zK
         3EMvsnGAdg4m5PMi9q5EyvHm+oe4/LKRhuX1wRVccvwnHY4mir4sJKiQQR05aN6SviTr
         xe1w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789650345; x=1790255145; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dcpLG6DMML8Weg9JX/ObKCjgeBkwW9cRNv7d9wKBVx8=;
        b=LhqC9v8Etozb6CdBUdxiq2wuFrg/A1nP6C5fWiXxiQuHngsOZmO+wjdmikCKCL7CpR
         EozXy7ON8M1D73P8YvoRWjB4bEl9IU4zHi3AKSFtGUYTdITTXvE3C0F5Rph3rl6jr9Ii
         GwoR1TKA4az18KlKJTk9hK2sZp7lj73ilrGeZjvTVURRGidhyD43jENE/brvx3i+s1zP
         fP+xrjiqBpjavPfTDYA6Fmtfbt6nmIRh4S2NLQJxEB5P7T8NNJv6RLdUpB9P4wA2sYia
         /pFrtXM7O2R/VSK/RiOOGPrmR2HkukPlgnmKPxbRB338ZFc1zYfD9Wpo5uiyMBmq3Ozk
         65tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789650345; x=1790255145;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dcpLG6DMML8Weg9JX/ObKCjgeBkwW9cRNv7d9wKBVx8=;
        b=xhpxayXw+vxpihGtQ7Shio9tW6+VgyCAIaABeLtt4aJY95GmnNiLKufrHEntRuU8wr
         kGblHdx5vzhwd/8PjVykbDQ60gxZmyxPi/vWcPvM1m0E8qUKxE8kDONAkF3Zx4nHkBYW
         JEVbjJ9JPG+HXIdktBBUTqio305c9OFXIkzuDMY1wLJpasVYSF2+AsL5v3uYxzW8Sfrh
         FbBdhN0nFxHmEyfvabAK38GLJi3oWtIBpVtWrbttzDgezCEX+6ETbaxOL7cqxpuoc39q
         vlateudVxp8kNrlgKRxI8ew7kKlqWDFcWjERPFm+1aL5QiVYOzNg4FTi6OE/a3KDT5FG
         f/Mw==
X-Forwarded-Encrypted: i=1; AKwUvByyoI/VHQZG44ygQ056VUgD2vjYwMpqua7u7kWHseAGvJBeCPMExvChTPEFa7SENNcBymLXk4HiNtq1@vger.kernel.org
X-Gm-Message-State: AFuF++kq4xgY+LhRTTRtOaLJZ2zrmPVOSq6g8BbTMUJvYJw7OZIvQTO+
	7Pw1nEtuUx+1A7kM2MIGuAc9BPfV1Kj3m+AIcKBuV/MZgZxm5uc3yAWvhTMlj5LSBVeNf+U25Ob
	1oab2itDGuzWhgFmEWrwsMxAsaiv5C4Z3+F4ef46d7W5jmr/yPUT+08wmzcmjsBQ+Opyh1Qcpl7
	J4M2PJOPMMJe0fAow2khW54WSHFds8zi0LlQGLOwE7BeCMXIw=
X-Gm-Gg: AYBFou37Rc5cEG6su4/PPestLRfm01XB45KDtOY72st4Ic5jN8Vt09uzjyojrHbdP9H
	oEerosp6susmkpJWy9vfaXncewjLPkFKQy3RpSruIGBRMRjJABn3LBZZYPOnEGFtf1GaIK+iM5u
	MqKjswfdJf4syvSqB6M4RHUoP9dw+6Thm3bb6aMNvM0NraWDo/rV3pXh9GG4nuNBNalkbrNiecH
	X77LOa1n3G9CMSc5IyVHOfb5R6FWkndLX7FfbePpvd8NZpYdtDIembATYUHSMldhX5X6EPGEQ==
X-Received: by 2002:a05:6808:2221:b0:4b9:e65b:8c34 with SMTP id 5614622812f47-4ca4cce354dmr6980269b6e.34.1789650345220;
        Thu, 17 Sep 2026 06:05:45 -0700 (PDT)
X-Received: by 2002:a05:6808:2221:b0:4b9:e65b:8c34 with SMTP id
 5614622812f47-4ca4cce354dmr6980206b6e.34.1789650344582; Thu, 17 Sep 2026
 06:05:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v18-0-f85c9103177e@linaro.org>
 <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v18-5-f85c9103177e@linaro.org>
In-Reply-To: <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v18-5-f85c9103177e@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 15:05:31 +0200
X-Gm-Features: AcwNN1X4DA6jbYE-gBOX2kSb59KYnpL-Q1fbs5emwf1TV0R6vxzWt_eKkq1SKk0
Message-ID: <CAFEp6-0QcUpJ51ud5tOQAX9Vy5U26oJKwe10gSOQV+_o-crFRQ@mail.gmail.com>
Subject: Re: [PATCH v18 5/5] media: qcom: camss: Use data-lanes starting at 1
 for new CSIPHY mode
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        "Bryan O'Donoghue" <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Felipe Balbi <balbi@ti.com>, Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-phy@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: erKPlOsyU84xxNe2IHdif2DcPKhU-ce7
X-Authority-Analysis: v=2.4 cv=YcYodARf c=1 sm=1 tr=0 ts=6aabe5a9 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=WXF1KB85Zuouuk2w01YA:9 a=QEXdDO2ut3YA:10 a=TPnrazJqx2CeVZ-ItzZ-:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: erKPlOsyU84xxNe2IHdif2DcPKhU-ce7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE4NCBTYWx0ZWRfXwD5BhwcL5S4d
 tqpd+Y17/r8+tMJWbDTuUWJpmM0REdR/hDOvkoaardR9QtYngqoINXHwIWmyBYqyBJ3vquNLPR6
 de78l32u/7WI8C7eNDaWGsjHlMZnO2ryoHD3l91tlxWBXzAC/RgQV25hqmlzV4/N0d362BW0jKx
 LrVZSNzZzvjNrb4p5cHzN4judSPFgKs1dOZXz8WhMaiXdKY9rV1ZUNe37nkVkqDDh9tmoIRhRtw
 NCZiCYXpXvm2mX3AyvW/t3WopJCNyrlic/8Oh2mr9yTUKAoFTdZnbA+NrCMImF5ZOISkvfycIsO
 EcauygxHZv39RXJxT3qHLlk0rUg78NPUd20IdkczjI9Z1eZ6PhayWzPxqidesAX0zih8J/Aalg1
 GWKlLlGzT7N5rrhH2H+6hhUKu70/z+Qd/ykyb4rBtd+8NHQ6H9zcA6PzjMyEE9gOcjz/TA56ddD
 3rRMMR2yzAOcJqkeBxw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE4NCBTYWx0ZWRfX27Jpo7TJHw4A
 CkzHUEWYlxbLu9na5iGTTzQn18tvyeiIp46wQ/1xyaYg/rzbZBEtygX+QZBfE4BXIBodwNQoujr
 SQ3Q3j/pWeQxbAWwauvkJQdcgODf8R8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170184

On Thu, Sep 17, 2026 at 1:08=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> Introducing a dedicated CSIPHY driver community feedback was both to move
> to data-lanes starting at index 1 on the PHY side and also to match that
> indexing scheme in the CSI decoder - CSID.
>
> CSID consumes the data-lanes property to determine which CSID lanes to
> switch on. For indexes starting at 1 we need to amend the logic somewhere=
.
> The PHY side code normalises the input data to register level meanings so=
,
> replicate that logic on the CSID side.
>
> Introduce a simple flag to differentiate between legacy indexing @ 0 and
> new indexing @ 1.
>
> Existing bindings are not affected.
>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss-csiphy.h |  1 +
>  drivers/media/platform/qcom/camss/camss.c        | 15 ++++++++++++---
>  2 files changed, 13 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/m=
edia/platform/qcom/camss/camss-csiphy.h
> index 7a357044b9fdb..8c3319f2ca1cf 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.h
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
> @@ -21,6 +21,7 @@
>  #define MSM_CSIPHY_PAD_SINK 0
>  #define MSM_CSIPHY_PAD_SRC 1
>  #define MSM_CSIPHY_PADS_NUM 2
> +#define MSM_CSIPHY_MAX_DATA_LANE 4
>
>  #define CSIPHY_GRP_ID 1
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 84097d82d99c9..6f58e729eaceb 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4742,7 +4742,8 @@ static const struct parent_dev_ops vfe_parent_dev_o=
ps =3D {
>   */
>  static int camss_parse_endpoint_node(struct device *dev,
>                                      struct fwnode_handle *ep,
> -                                    struct camss_async_subdev *csd)
> +                                    struct camss_async_subdev *csd,
> +                                    u8 lane_base)
>  {
>         struct csiphy_lanes_cfg *lncfg =3D &csd->interface.csi2.lane_cfg;
>         struct v4l2_mbus_config_mipi_csi2 *mipi_csi2;
> @@ -4777,7 +4778,14 @@ static int camss_parse_endpoint_node(struct device=
 *dev,
>                 return -ENOMEM;
>
>         for (i =3D 0; i < lncfg->num_data; i++) {
> -               lncfg->data[i].pos =3D mipi_csi2->data_lanes[i];
> +               u8 lane =3D mipi_csi2->data_lanes[i];
> +
> +               if (lane < lane_base || lane - lane_base >=3D MSM_CSIPHY_=
MAX_DATA_LANE) {
> +                       dev_err(dev, "invalid data-lane %u\n", lane);
> +                       return -EINVAL;
> +               }
> +
> +               lncfg->data[i].pos =3D mipi_csi2->data_lanes[i] - lane_ba=
se;
>                 lncfg->data[i].pol =3D mipi_csi2->lane_polarities[i + 1];
>         }
>
> @@ -4794,6 +4802,7 @@ static int camss_parse_ports(struct camss *camss)
>  {
>         struct device *dev =3D camss->dev;
>         struct fwnode_handle *fwnode =3D dev_fwnode(dev), *ep;
> +       u8 lane_base =3D camss->legacy_phy ? 0 : 1;
>         int ret;
>
>         fwnode_graph_for_each_endpoint(fwnode, ep) {
> @@ -4841,7 +4850,7 @@ static int camss_parse_ports(struct camss *camss)
>                         goto err_cleanup;
>                 }
>
> -               ret =3D camss_parse_endpoint_node(dev, ep, csd);
> +               ret =3D camss_parse_endpoint_node(dev, ep, csd, lane_base=
);
>                 if (ret < 0)
>                         goto err_cleanup;
>         }
>
> --
> 2.55.0
>
