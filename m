Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D213D5C0C
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 11:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785236591; cv=pass; b=mlFlWL95CJ5JV8ZVlOfIQ4sKmqLQ0mdUaclnwodSTyeKFJGKQLNhUmTD1qFtWvOy18Qqf5Fka2seguB9R3WHK6OVbC0s2tkw+LgKGzaPVvSBEcf5WYaEF43Weq7Ry8tTNboNv2AtY3Iq/LJbngmyI3FpSyBMQ0hMD5TDlVn9J/0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785236591; c=relaxed/simple;
	bh=ms3FsfMQl5pt2bFlLZQJz3ObTnfNGwSFWZ0COBLXibo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fs6hqAvRfUQKU6e+/X+7g0FlrHbCco/5PwJgI7PJMOIiEETrC07wuzS00fCYSRLYk7xr/6wdCqXFVf0+tThpEWQE4N4ys8kHdEY8JSxLMeGcNhyui08ljbYxvQafnhv02Va87gUgH3IwwMxd+B3Z1iCxtQXS4Giu7pq58Q4f5Ug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M6/cl7GZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ebcCccd7; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M6/cl7GZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ebcCccd7"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SAgu4R2405600
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 11:03:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HEo90+ufTyVzDZ/DcNd96ylgR0f41XkgBnoTqwgNH8o=; b=M6/cl7GZ4xHpEI5b
	yiOGkKZMzzWa33Wyy5d9w2e2ATGlLWv7CeN19xFJFkSrfXh/ku0hCLYN4+JB5aE+
	GOEgWX9lKEGBeKIyLHvUIFsoM7SwCz91uQI6hstdby8y9BLkTT7n239ULNeDjBWf
	vvmFK2DR1Eb7bn1ti4n110Ab5ff8w09WWPek6kNNECD4xqHd+18lcASpVux/swk3
	Hy9LTXX8SnYXgHvdTSJSaPFxD9wKl/Td9/lhRT0Vu0Vl3xxE95h7AtSZJznI31zp
	gmPcY2HI45MZBSMTtxYE4S5ygnFqqO2wIG5/JRRhXJ9RWJ/z9bEHSV6kxPFmIMow
	Jx/IlA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpq9hh2jp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 11:03:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e53b8a302so424048385a.1
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 04:03:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785236585; cv=none;
        d=google.com; s=arc-20260327;
        b=feWH64hp+cYtuWI5ZupIVhKUryFu4nyVnLF3fmiIGqkMjYlZSncpTI4nnYJYMeCR/d
         qDr9SdFd42kATbcARAmfejDGk33oDQ2chQkDiFVhEzxCegX1NI+221AO2f4RSjC+fGbk
         vKByF4q2mgmEapP3BFNnZZuQMqQaLYzmG25ZTY6XhKBuhsuvppEicgFaK2IZsiwwsb8s
         RKfYjILTT9mnEjZb2j5qBGz0kBOZiOC0df85E9wWwBGZBgXWgyBwTRQsKfRzxtbiWiAV
         gnKCf5guvkJtfJajeZRfl+5yiDm7K1k90qNrmYq2Bct1KqdUusUm4QfeA3MST08RUmXI
         YSpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HEo90+ufTyVzDZ/DcNd96ylgR0f41XkgBnoTqwgNH8o=;
        fh=iZTGC82K9eevXy/VAokibZcJKMfJPpYPhxSaGe1lsyc=;
        b=WrRjoPuA7oLJETJ86zgAMQlOjU23BMyO4VjeWi6Gm7Xt9Qz12bauxcI0EFuOwIw0jb
         5OWp7iiH8XiHhKI8PBw1hgk32YamovBHW/KxY0xKFDHlqn9E/iMcP/vZH7h0XZsRY9RF
         q0RwVZMtzMX45jMFtbWzU0F1zrHEJuPu1w+U8A4UevZD25EDF2jGJmFx/FSl8FMiiDBW
         W0i1bcQPZoJ+y1s62XShj/AdZk1BifuwNrMvPbb7MSg5+j+vk3sqcDcdOieNRYy7jaxm
         Xh/X3CN0vMU+qi9PKNc2HtuNrz/qFYjQ+r2o31k5vig58qA9Hr/wLd2JB2G5F02xSFAf
         Yyrg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785236585; x=1785841385; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HEo90+ufTyVzDZ/DcNd96ylgR0f41XkgBnoTqwgNH8o=;
        b=ebcCccd7dz9kefolw09BfJbTPNaJIa6zK1OPuT6FEd6mFgQE6RuvxBytEPAlszNpcK
         07eidwp+wF7VaFK1gDDvAtX77Top89rWR10R9joYQaC+HkwXEuJwpe88P8G/4ZBZ2kiO
         uLFi1C1d9AYBJBvkPgo2zxac4PVLrebnporQ8AaN3t4L44Nbprnk/lC6Fgs2FoeCSQYU
         jCemVuKsBjkzkCs8B72j2eKl/I055RQTyvC6QrWeDBoo2qpVf9Y3yTYDL/l9IMUhrDQk
         J1Kuy6AtP6TNJoaPhDkfFN1ihUAIMK5DdAy3MeH00AbVClgrArrziJRLWARYG87PhWp5
         TlOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785236585; x=1785841385;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HEo90+ufTyVzDZ/DcNd96ylgR0f41XkgBnoTqwgNH8o=;
        b=Fh3krTGQooAdz2vzqAcaY5iyOKAnQQ9K8SjWkjBBnLAez5bvGqU5lQY9RIwkxtr47M
         ZAIVUu6Vi24+hasB1pIlRYYD0HDe/CGzB4XNB6l2TGZx5KLoRJOz9Yd1yqxAYI5dheKc
         CaXH3SSFy8n5Q2LNTyUyKbiFrae7WWBBiLBwXVkYHNp8UNzthE6zJPspl/neitkOkh6G
         GmmDW1CGg5y5dAMMe4SZl6rlW0hHszVNtRkoyFqGfSiZOq+G/YGcheLV9yjoacfja4ym
         KkkWS96KqIEPsOrHa/TgAf4EzOj2Hw6+KyDojEqqZQOBm6eQQwXyq7quXr9gg5hsk7ZB
         ijKg==
X-Forwarded-Encrypted: i=1; AHgh+RodIFTnd4rzOVL45RUKMCpgO5ERxjvdYOVBTB4hN0d3VsUFyf6ZdMWOYjj+6QsvlvZbdXClDlHqTCZB@vger.kernel.org
X-Gm-Message-State: AOJu0YzB8vJcTqVIpLbWLmPvtjbDc43/LbtdFrsmK6DSFT7uUZ/mhIOP
	UPzI/3ora5yhd3zvvaFji3f6l4SCHaekz53Y9W5i+tCBJIrPweO14eZqD3ROYEHz9c5IA4gkBQ5
	kyyO+APx5l3Zx5c1Xw7J3h64oSEYbeQboSFd4EEU/+lbpARNhB4vwOd31pYy1OHGm/Bw1GwAVVJ
	jJ6UD4+QqbW3VEnfberU56vH4bunAtnnLSD/h4tjE=
X-Gm-Gg: AR+sD105L9pD84q/Yws+rOKS6lKlI6RDwby6rHOTZmlTIKhDThqtQ+GAkPruPfGZXWA
	kY6IZBcESqPJVrc4vc/Mq4s0eTgFE83smoaSXffi1rBoaMuBiID9rnJgZb+Zwh2L6Wb4rwKPsH4
	sUDj9BIm06x6pNiGhR7ERO+lenmQ+dA7F/oB9vYf4Br2rVMYFBXVpoo87dye3h9hWeFWYPg7dSQ
	V1Yaaui0P5sUM23IPZsY45fUlnwDN/0a/NqZu+7x6FUZc4hJZIJkYVmiPSXK4cNl4pP2CJBeH4=
X-Received: by 2002:a05:620a:261d:b0:92e:c116:bf0e with SMTP id af79cd13be357-933027cb17emr149042285a.87.1785236584509;
        Tue, 28 Jul 2026 04:03:04 -0700 (PDT)
X-Received: by 2002:a05:620a:261d:b0:92e:c116:bf0e with SMTP id
 af79cd13be357-933027cb17emr149035985a.87.1785236583959; Tue, 28 Jul 2026
 04:03:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-0-ae811e2f0799@linaro.org>
 <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-3-ae811e2f0799@linaro.org>
In-Reply-To: <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-3-ae811e2f0799@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 13:02:52 +0200
X-Gm-Features: AUfX_mxzPf3RUGkchE_wbbm2kdz3L_JjYCt-nFSpy8HDx1MDQybRMBJNEWByLfg
Message-ID: <CAFEp6-1hsyWr0KJah=r44aXK_cKuFM-k2k4hHK4QP=iu_CGBVA@mail.gmail.com>
Subject: Re: [PATCH v13 3/5] media: qcom: camss: Add support for PHY API devices
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
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-phy@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA5NyBTYWx0ZWRfX3ihA+Jb6bVF4
 soBRYNMrA7nvOzLPdtcj/2F1blcfDEEGqSVnwFXRdzrm9Utuub1vpDugQ0XkXdxIuR3NRu5wDFt
 h7EFUXyApogt6QnHbMeBHLs6WVzHzuY=
X-Proofpoint-GUID: nVngMIXUMPYgmEstnC6XvaHcoe0ZIM1v
X-Proofpoint-ORIG-GUID: nVngMIXUMPYgmEstnC6XvaHcoe0ZIM1v
X-Authority-Analysis: v=2.4 cv=Aa6B2XXG c=1 sm=1 tr=0 ts=6a688c69 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=1bk27lSsA0qbyjSzzSoA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA5NyBTYWx0ZWRfX5qiHkkIc/asi
 8svwR/4EYtcQQAPaU21jF/zIkbnxJkd5Nwew0SzqZhPP8c7nX/J66qFnedO8AY7UinyL42BfA3w
 RS0cpllSoVCXh5KSdvxJpPd3X5Nii2J4fm8q4LnctJSbOGAYHIe3A7AlgFvfwT2wPIoaC4PdDpB
 FTe0n9JAZnB9uEMpyhpqdIvnGudhHslNELjjxYx3756EfGb8dgIbd0lASGwuhmwAnlmF6y8mWKf
 NA3681xCHwEA4FFWIRwZANYG2OvYs8ChWkeApziyZ7Q6RNU8j1PDg5hGS2tOjlfcABASTowZXx0
 CAEiETBqCug4TYqPGn1S29cPWVTLMdFB6IdA896VK9Z6apLAKsyxa0t+m9B6dr2m70XetqJazlu
 Htf0cygvjx1U7Tvv8Ww0OdD+2R/RU2ELtmSSeRQti57q3ywg9qK591ajADlxPshk8EpdbwwZ5eA
 LmbuEifoW7+IhgqTQdw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280097

On Tue, Jul 28, 2026 at 11:35=E2=80=AFAM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> Add the ability to use a PHY pointer which interacts with the standard PH=
Y
> API.
>
> In the first instance the code will try to use the new PHY interface. If =
no
> PHYs are present in the DT then the legacy method will be attempted.
>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/Kconfig        |   1 +
>  drivers/media/platform/qcom/camss/camss-csiphy.c | 177 +++++++++++++++++=
++++--
>  drivers/media/platform/qcom/camss/camss-csiphy.h |  11 +-
>  drivers/media/platform/qcom/camss/camss.c        | 104 +++++++++++--
>  drivers/media/platform/qcom/camss/camss.h        |   1 +
>  5 files changed, 263 insertions(+), 31 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/Kconfig b/drivers/media/pl=
atform/qcom/camss/Kconfig
> index 4eda48cb1adf0..1edc5e5a1829e 100644
> --- a/drivers/media/platform/qcom/camss/Kconfig
> +++ b/drivers/media/platform/qcom/camss/Kconfig
> @@ -7,3 +7,4 @@ config VIDEO_QCOM_CAMSS
>         select VIDEO_V4L2_SUBDEV_API
>         select VIDEOBUF2_DMA_SG
>         select V4L2_FWNODE
> +       select PHY_QCOM_MIPI_CSI2
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/m=
edia/platform/qcom/camss/camss-csiphy.c
> index 539ac4888b608..e00748dd83b02 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> @@ -13,6 +13,8 @@
>  #include <linux/io.h>
>  #include <linux/kernel.h>
>  #include <linux/of.h>
> +#include <linux/of_graph.h>
> +#include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <media/media-entity.h>
> @@ -131,10 +133,10 @@ static u8 csiphy_get_bpp(const struct csiphy_format=
_info *formats,
>  }
>
>  /*
> - * csiphy_set_clock_rates - Calculate and set clock rates on CSIPHY modu=
le
> + * csiphy_set_clock_rates_legacy - Calculate and set clock rates on CSIP=
HY module
>   * @csiphy: CSIPHY device
>   */
> -static int csiphy_set_clock_rates(struct csiphy_device *csiphy)
> +static int csiphy_set_clock_rates_legacy(struct csiphy_device *csiphy)
>  {
>         struct device *dev =3D csiphy->camss->dev;
>         s64 link_freq;
> @@ -200,7 +202,7 @@ static int csiphy_set_clock_rates(struct csiphy_devic=
e *csiphy)
>   *
>   * Return 0 on success or a negative error code otherwise
>   */
> -static int csiphy_set_power(struct v4l2_subdev *sd, int on)
> +static int csiphy_set_power_legacy(struct v4l2_subdev *sd, int on)
>  {
>         struct csiphy_device *csiphy =3D v4l2_get_subdevdata(sd);
>         struct device *dev =3D csiphy->camss->dev;
> @@ -219,7 +221,7 @@ static int csiphy_set_power(struct v4l2_subdev *sd, i=
nt on)
>                         return ret;
>                 }
>
> -               ret =3D csiphy_set_clock_rates(csiphy);
> +               ret =3D csiphy_set_clock_rates_legacy(csiphy);
>                 if (ret < 0) {
>                         regulator_bulk_disable(csiphy->num_supplies,
>                                                csiphy->supplies);
> @@ -254,7 +256,7 @@ static int csiphy_set_power(struct v4l2_subdev *sd, i=
nt on)
>  }
>
>  /*
> - * csiphy_stream_on - Enable streaming on CSIPHY module
> + * csiphy_stream_on_legacy - Enable streaming on CSIPHY module
>   * @csiphy: CSIPHY device
>   *
>   * Helper function to enable streaming on CSIPHY module.
> @@ -262,7 +264,7 @@ static int csiphy_set_power(struct v4l2_subdev *sd, i=
nt on)
>   *
>   * Return 0 on success or a negative error code otherwise
>   */
> -static int csiphy_stream_on(struct csiphy_device *csiphy)
> +static int csiphy_stream_on_legacy(struct csiphy_device *csiphy)
>  {
>         struct csiphy_config *cfg =3D &csiphy->cfg;
>         s64 link_freq;
> @@ -306,11 +308,88 @@ static int csiphy_stream_on(struct csiphy_device *c=
siphy)
>   *
>   * Helper function to disable streaming on CSIPHY module
>   */
> -static void csiphy_stream_off(struct csiphy_device *csiphy)
> +static void csiphy_stream_off_legacy(struct csiphy_device *csiphy)
>  {
>         csiphy->res->hw_ops->lanes_disable(csiphy, &csiphy->cfg);
>  }
>
> +/*
> + * csiphy_stream_on - Enable streaming on CSIPHY module
> + * @csiphy: CSIPHY device
> + *
> + * Helper function to enable streaming on CSIPHY module.
> + * Main configuration of CSIPHY module is also done here.
> + *
> + * Return 0 on success or a negative error code otherwise
> + */
> +static int csiphy_stream_on(struct csiphy_device *csiphy)
> +{
> +       u8 bpp =3D csiphy_get_bpp(csiphy->res->formats->formats, csiphy->=
res->formats->nformats,
> +                               csiphy->fmt[MSM_CSIPHY_PAD_SINK].code);
> +       struct csiphy_lanes_cfg *lncfg =3D &csiphy->cfg.csi2->lane_cfg;
> +       struct phy_configure_opts_mipi_dphy *dphy_cfg;
> +       union phy_configure_opts dphy_opts =3D { 0 };
> +       struct device *dev =3D csiphy->camss->dev;
> +       u8 num_lanes =3D lncfg->num_data;
> +       s64 link_freq;
> +       int ret;
> +
> +       dphy_cfg =3D &dphy_opts.mipi_dphy;
> +
> +       link_freq =3D camss_get_link_freq(&csiphy->subdev.entity, bpp, nu=
m_lanes);
> +
> +       if (link_freq < 0) {
> +               dev_err(dev,
> +                       "Cannot get CSI2 transmitter's link frequency\n")=
;
> +               return -EINVAL;
> +       }
> +
> +       phy_mipi_dphy_get_default_config_for_hsclk(link_freq, num_lanes, =
dphy_cfg);
> +
> +       phy_set_mode(csiphy->phy, PHY_MODE_MIPI_DPHY);
> +
> +       ret =3D phy_configure(csiphy->phy, &dphy_opts);
> +       if (ret) {
> +               dev_err(dev, "failed to configure MIPI D-PHY\n");
> +               goto error;
> +       }
> +
> +       return phy_power_on(csiphy->phy);
> +
> +error:
> +       return ret;
> +}
> +
> +/*
> + * csiphy_stream_off - Disable streaming on CSIPHY module
> + * @csiphy: CSIPHY device
> + *
> + * Helper function to disable streaming on CSIPHY module
> + */
> +static void csiphy_stream_off(struct csiphy_device *csiphy)
> +{
> +       phy_power_off(csiphy->phy);
> +}
> +
> +/*
> + * csiphy_set_stream - Enable/disable streaming on CSIPHY module
> + * @sd: CSIPHY V4L2 subdevice
> + * @enable: Requested streaming state
> + *
> + * Return 0 on success or a negative error code otherwise
> + */
> +static int csiphy_set_stream_legacy(struct v4l2_subdev *sd, int enable)
> +{
> +       struct csiphy_device *csiphy =3D v4l2_get_subdevdata(sd);
> +       int ret =3D 0;
> +
> +       if (enable)
> +               ret =3D csiphy_stream_on_legacy(csiphy);
> +       else
> +               csiphy_stream_off_legacy(csiphy);
> +
> +       return ret;
> +}
>
>  /*
>   * csiphy_set_stream - Enable/disable streaming on CSIPHY module
> @@ -572,16 +651,16 @@ csiphy_match_clock_name(const char *clock_name, con=
st char *format, ...)
>  }
>
>  /*
> - * msm_csiphy_subdev_init - Initialize CSIPHY device structure and resou=
rces
> + * msm_csiphy_subdev_init_legacy - Initialize CSIPHY device structure an=
d resources
>   * @csiphy: CSIPHY device
>   * @res: CSIPHY module resources table
>   * @id: CSIPHY module id
>   *
>   * Return 0 on success or a negative error code otherwise
>   */
> -int msm_csiphy_subdev_init(struct camss *camss,
> -                          struct csiphy_device *csiphy,
> -                          const struct camss_subdev_resources *res, u8 i=
d)
> +int msm_csiphy_subdev_init_legacy(struct camss *camss,
> +                                 struct csiphy_device *csiphy,
> +                                 const struct camss_subdev_resources *re=
s, u8 id)
>  {
>         struct device *dev =3D camss->dev;
>         struct platform_device *pdev =3D to_platform_device(dev);
> @@ -709,6 +788,56 @@ int msm_csiphy_subdev_init(struct camss *camss,
>         return ret;
>  }
>
> +/*
> + * msm_csiphy_subdev_init - Initialize CSIPHY device structure and resou=
rces
> + * @camss: CAMSS structure
> + * @port: DT port index
> + *
> + * Return 0 on success or absence of link, negative error code otherwise
> + */
> +int msm_csiphy_subdev_init(struct camss *camss, u8 port)
> +{
> +       const struct camss_subdev_resources *res =3D &camss->res->csiphy_=
res[port];
> +       struct csiphy_device *csiphy =3D &camss->csiphy[port];
> +       struct device *dev =3D camss->dev;
> +       struct device_node *ep, *remote;
> +       int ret;
> +
> +       ep =3D of_graph_get_endpoint_by_regs(dev->of_node, port, -1);
> +       if (!ep)
> +               return 0;
> +
> +       remote =3D of_graph_get_remote_port_parent(ep);
> +       of_node_put(ep);
> +       if (!remote)
> +               return 0;
> +
> +       if (!of_device_is_available(remote)) {
> +               of_node_put(remote);
> +               return 0;
> +       }
> +
> +       csiphy->phy =3D devm_phy_get_by_of_node(dev, remote);
> +       of_node_put(remote);
> +       if (IS_ERR(csiphy->phy)) {
> +               ret =3D PTR_ERR(csiphy->phy);
> +               goto done;
> +       }
> +
> +       csiphy->camss =3D camss;
> +       csiphy->id =3D res->csiphy.id;
> +       csiphy->res =3D &res->csiphy;
> +
> +       snprintf(csiphy->name, ARRAY_SIZE(csiphy->name), "csi%d", csiphy-=
>id);
> +
> +       ret =3D phy_init(csiphy->phy);
> +       if (ret)
> +               dev_err(dev, "%s init fail %d\n", csiphy->name, ret);
> +
> +done:
> +       return ret;
> +}
> +
>  /*
>   * csiphy_link_setup - Setup CSIPHY connections
>   * @entity: Pointer to media entity structure
> @@ -743,8 +872,12 @@ static int csiphy_link_setup(struct media_entity *en=
tity,
>         return 0;
>  }
>
> -static const struct v4l2_subdev_core_ops csiphy_core_ops =3D {
> -       .s_power =3D csiphy_set_power,
> +static const struct v4l2_subdev_core_ops csiphy_core_ops_legacy =3D {
> +       .s_power =3D csiphy_set_power_legacy,
> +};
> +
> +static const struct v4l2_subdev_video_ops csiphy_video_ops_legacy =3D {
> +       .s_stream =3D csiphy_set_stream_legacy,
>  };
>
>  static const struct v4l2_subdev_video_ops csiphy_video_ops =3D {
> @@ -758,8 +891,13 @@ static const struct v4l2_subdev_pad_ops csiphy_pad_o=
ps =3D {
>         .set_fmt =3D csiphy_set_format,
>  };
>
> +static const struct v4l2_subdev_ops csiphy_v4l2_ops_legacy =3D {
> +       .core =3D &csiphy_core_ops_legacy,
> +       .video =3D &csiphy_video_ops_legacy,
> +       .pad =3D &csiphy_pad_ops,
> +};
> +
>  static const struct v4l2_subdev_ops csiphy_v4l2_ops =3D {
> -       .core =3D &csiphy_core_ops,
>         .video =3D &csiphy_video_ops,
>         .pad =3D &csiphy_pad_ops,
>  };
> @@ -785,10 +923,15 @@ int msm_csiphy_register_entity(struct csiphy_device=
 *csiphy,
>  {
>         struct v4l2_subdev *sd =3D &csiphy->subdev;
>         struct media_pad *pads =3D csiphy->pads;
> -       struct device *dev =3D csiphy->camss->dev;
> +       struct camss *camss =3D csiphy->camss;
> +       struct device *dev =3D camss->dev;
>         int ret;
>
> -       v4l2_subdev_init(sd, &csiphy_v4l2_ops);
> +       if (camss->legacy_phy)
> +               v4l2_subdev_init(sd, &csiphy_v4l2_ops_legacy);
> +       else
> +               v4l2_subdev_init(sd, &csiphy_v4l2_ops);
> +
>         sd->internal_ops =3D &csiphy_v4l2_internal_ops;
>         sd->flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE;
>         snprintf(sd->name, ARRAY_SIZE(sd->name), "%s%d",
> @@ -828,6 +971,8 @@ int msm_csiphy_register_entity(struct csiphy_device *=
csiphy,
>   */
>  void msm_csiphy_unregister_entity(struct csiphy_device *csiphy)
>  {
> +       if (!IS_ERR(csiphy->phy))
> +               phy_exit(csiphy->phy);
>         v4l2_device_unregister_subdev(&csiphy->subdev);
>         media_entity_cleanup(&csiphy->subdev.entity);
>  }
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/m=
edia/platform/qcom/camss/camss-csiphy.h
> index 9d9657b82f748..7a357044b9fdb 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.h
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
> @@ -12,6 +12,7 @@
>
>  #include <linux/clk.h>
>  #include <linux/interrupt.h>
> +#include <linux/phy/phy.h>
>  #include <media/media-entity.h>
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-mediabus.h>
> @@ -97,6 +98,7 @@ struct csiphy_device_regs {
>
>  struct csiphy_device {
>         struct camss *camss;
> +       struct phy *phy;
>         u8 id;
>         struct v4l2_subdev subdev;
>         struct media_pad pads[MSM_CSIPHY_PADS_NUM];
> @@ -104,6 +106,7 @@ struct csiphy_device {
>         void __iomem *base_clk_mux;
>         u32 irq;
>         char irq_name[30];
> +       char name[16];
>         struct camss_clock *clock;
>         bool *rate_set;
>         int nclocks;
> @@ -118,9 +121,11 @@ struct csiphy_device {
>
>  struct camss_subdev_resources;
>
> -int msm_csiphy_subdev_init(struct camss *camss,
> -                          struct csiphy_device *csiphy,
> -                          const struct camss_subdev_resources *res, u8 i=
d);
> +int msm_csiphy_subdev_init_legacy(struct camss *camss,
> +                                 struct csiphy_device *csiphy,
> +                                 const struct camss_subdev_resources *re=
s, u8 id);
> +
> +int msm_csiphy_subdev_init(struct camss *camss, u8 port);
>
>  int msm_csiphy_register_entity(struct csiphy_device *csiphy,
>                                struct v4l2_device *v4l2_dev);
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 2123f6388e3d7..84097d82d99c9 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4799,8 +4799,43 @@ static int camss_parse_ports(struct camss *camss)
>         fwnode_graph_for_each_endpoint(fwnode, ep) {
>                 struct camss_async_subdev *csd;
>
> -               csd =3D v4l2_async_nf_add_fwnode_remote(&camss->notifier,=
 ep,
> -                                                     typeof(*csd));
> +               if (!fwnode_device_is_available(ep))
> +                       continue;
> +
> +               if (camss->legacy_phy) {
> +                       csd =3D v4l2_async_nf_add_fwnode_remote(&camss->n=
otifier, ep,
> +                                                             typeof(*csd=
));
> +               } else {
> +                       struct fwnode_handle *phy_out, *phy_node, *phy_in=
, *sensor_ep;
> +
> +                       phy_out =3D fwnode_graph_get_remote_endpoint(ep);
> +                       if (!phy_out)
> +                               continue;
> +
> +                       phy_node =3D fwnode_graph_get_port_parent(phy_out=
);
> +                       fwnode_handle_put(phy_out);
> +                       if (!phy_node)
> +                               continue;
> +
> +                       phy_in =3D fwnode_graph_get_endpoint_by_id(phy_no=
de, 0, 0, 0);
> +                       fwnode_handle_put(phy_node);
> +                       if (!phy_in)
> +                               continue;
> +
> +                       sensor_ep =3D fwnode_graph_get_remote_endpoint(ph=
y_in);
> +                       fwnode_handle_put(phy_in);
> +                       if (!sensor_ep)
> +                               continue;
> +
> +                       csd =3D v4l2_async_nf_add_fwnode(&camss->notifier=
, sensor_ep,
> +                                               struct camss_async_subdev=
);
> +                       fwnode_handle_put(sensor_ep);
> +                       if (IS_ERR(csd)) {
> +                               ret =3D PTR_ERR(csd);
> +                               goto err_cleanup;
> +                       }
> +               }
> +
>                 if (IS_ERR(csd)) {
>                         ret =3D PTR_ERR(csd);
>                         goto err_cleanup;
> @@ -4819,6 +4854,29 @@ static int camss_parse_ports(struct camss *camss)
>         return ret;
>  }
>
> +static void camss_detect_legacy_phy(struct camss *camss)
> +{
> +       struct device_node *remote;
> +       struct device_node *ep;
> +
> +       camss->legacy_phy =3D true;
> +
> +       /* Find first remote-endpoint and determine if its a PHY */
> +       for_each_endpoint_of_node(camss->dev->of_node, ep) {
> +               remote =3D of_graph_get_remote_port_parent(ep);
> +               if (!remote)
> +                       continue;
> +
> +               camss->legacy_phy =3D !of_node_name_eq(remote, "phy");
> +               of_node_put(remote);
> +               of_node_put(ep);
> +               break;
> +       }
> +
> +       dev_dbg(camss->dev, "legacy phy mode %s\n",
> +               camss->legacy_phy ? "true" : "false");
> +}
> +
>  /*
>   * camss_init_subdevices - Initialize subdev structures and resources
>   * @camss: CAMSS device
> @@ -4832,14 +4890,21 @@ static int camss_init_subdevices(struct camss *ca=
mss)
>         unsigned int i;
>         int ret;
>
> +       camss_detect_legacy_phy(camss);
> +
>         for (i =3D 0; i < camss->res->csiphy_num; i++) {
> -               ret =3D msm_csiphy_subdev_init(camss, &camss->csiphy[i],
> -                                            &res->csiphy_res[i],
> -                                            res->csiphy_res[i].csiphy.id=
);
> +               if (!camss->legacy_phy) {
> +                       ret =3D msm_csiphy_subdev_init(camss, i);
> +               } else {
> +                       ret =3D msm_csiphy_subdev_init_legacy(camss,
> +                                                           &camss->csiph=
y[i],
> +                                                           &res->csiphy_=
res[i],
> +                                                           res->csiphy_r=
es[i].csiphy.id);
> +               }
> +
>                 if (ret < 0) {
> -                       dev_err(camss->dev,
> -                               "Failed to init csiphy%d sub-device: %d\n=
",
> -                               i, ret);
> +                       dev_err(camss->dev, "csiphy %d init fail\n",
> +                               res->csiphy_res[i].csiphy.id);
>                         return ret;
>                 }
>         }
> @@ -4917,6 +4982,11 @@ inline void camss_link_err(struct camss *camss,
>                 ret);
>  }
>
> +static inline bool csiphy_enabled(struct camss *camss, struct csiphy_dev=
ice *c)
> +{
> +       return camss->legacy_phy || c->phy;
> +}
> +
>  /*
>   * camss_link_entities - Register subdev nodes and create links
>   * @camss: CAMSS device
> @@ -4930,6 +5000,9 @@ static int camss_link_entities(struct camss *camss)
>
>         for (i =3D 0; i < camss->res->csiphy_num; i++) {
>                 for (j =3D 0; j < camss->res->csid_num; j++) {
> +                       if (!csiphy_enabled(camss, &camss->csiphy[i]))
> +                               continue;
> +
>                         ret =3D media_create_pad_link(&camss->csiphy[i].s=
ubdev.entity,
>                                                     MSM_CSIPHY_PAD_SRC,
>                                                     &camss->csid[j].subde=
v.entity,
> @@ -5056,6 +5129,9 @@ static int camss_register_entities(struct camss *ca=
mss)
>         int ret;
>
>         for (i =3D 0; i < camss->res->csiphy_num; i++) {
> +               if (!csiphy_enabled(camss, &camss->csiphy[i]))
> +                       continue;
> +
>                 ret =3D msm_csiphy_register_entity(&camss->csiphy[i],
>                                                  &camss->v4l2_dev);
>                 if (ret < 0) {
> @@ -5131,8 +5207,10 @@ static int camss_register_entities(struct camss *c=
amss)
>
>         i =3D camss->res->csiphy_num;
>  err_reg_csiphy:
> -       for (i--; i >=3D 0; i--)
> -               msm_csiphy_unregister_entity(&camss->csiphy[i]);
> +       for (i--; i >=3D 0; i--) {
> +               if (csiphy_enabled(camss, &camss->csiphy[i]))
> +                       msm_csiphy_unregister_entity(&camss->csiphy[i]);
> +       }
>
>         return ret;
>  }
> @@ -5147,8 +5225,10 @@ static void camss_unregister_entities(struct camss=
 *camss)
>  {
>         unsigned int i;
>
> -       for (i =3D 0; i < camss->res->csiphy_num; i++)
> -               msm_csiphy_unregister_entity(&camss->csiphy[i]);
> +       for (i =3D 0; i < camss->res->csiphy_num; i++) {
> +               if (csiphy_enabled(camss, &camss->csiphy[i]))
> +                       msm_csiphy_unregister_entity(&camss->csiphy[i]);
> +       }
>
>         if (camss->tpg) {
>                 for (i =3D 0; i < camss->res->tpg_num; i++)
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/pl=
atform/qcom/camss/camss.h
> index 93d691c8ac63b..ba3d51d9c0bf8 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -138,6 +138,7 @@ struct camss {
>         struct device_link *genpd_link;
>         struct icc_path *icc_path[ICC_SM8250_COUNT];
>         const struct camss_resources *res;
> +       bool legacy_phy;
>  };
>
>  struct camss_camera_interface {
>
> --
> 2.54.0
>
