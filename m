Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E1437AA6D
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 16:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783614839; cv=pass; b=fqFgV24qPk+iMCNwAfukMZv/JlEysFs0dR4wSJ4e/m+e4Ec+U4BHNhSGoA+YMS8qJGe0pklgS0XIqOwr0N5+Xb97Iqyf8hA3IULEFm40LYpBwBMg+V+AXP7v6S0dijpkHTr0YiOj/eqwZts93c3rhdKvQsSH2Vsk7JlNB3nPAIU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783614839; c=relaxed/simple;
	bh=xeFfrz6h8yMo4SlaHzqhiMDslcgOYLX/u46LE+HL1N4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B3qYO2OhjoJNI90GFhPwC8XOMjQJ4jbL5wBo9HjUQ8Qve+oZ3sqUdwDuCao1X4e93cqVrhq7P4wkbfAiozeZvStTi80AjXvm6vnz+OfTxw4vtkTR/IOaMI5z7rVte/dSxGvR6Vg8Tm7R+Wp1gkBo8CGJWp54MdZw4zfuCW39Gtc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gJK+cjCB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fpt0Ge61; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gJK+cjCB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fpt0Ge61"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669DwiHT2014121
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 16:33:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xd9eNrOSCFFAWaQdLSMEnWBSlqv0nUO4Pn2WJ4es7Z4=; b=gJK+cjCBtngOV7iC
	igPGm0DUQGrCJ4j6Nf3o2zSH+gzpMxI2RKaRYq2YIFHKLcoslxd26PqvM049n4rD
	w4QcL9+BsLOFQt2iXsHoiyqhZLl+JrY+L+CszR+J8Ijs69uPXjd1FCfV1PmLnkvb
	+DTac5yISgY+QT0jLVZPpRJTfJM9zH2DvrgCQSZD4Li3h1HB0DfU7KOOLyqzA6Mj
	03iGCkAbIeJqHP1VD40uzx7rQ9aP+PgEyQWaoVAx7DvvZvAY8AhSXbDZeV64BgeH
	jA6M72Q/Ac4jzxMz8MlDnxeX35icerG0uAnsT2Y0zGVT/NFko+kGNXnXNy8peEf4
	S0nXRg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa418kaj5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 16:33:57 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92ec3146553so192225785a.1
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 09:33:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783614836; cv=none;
        d=google.com; s=arc-20260327;
        b=Xi054Z/w/NZCIRPWRcEpmeOcvIsj99JF0K9F39OJGJupPjs3lPZb0FimmdYIxEZREp
         VBHLoo/4A4bWTODp/LcRZnAHrUTBUVyiQR+gN7oqg1JdQ19K0bbXrm5KozJnbQyo6qi1
         Gd9xE8/1ReSysbGZoETxgWVPxn7phL5YfTWskxQSq135dygYOYokSs1dN7s5F3CNS4zc
         7GtqGXEDKYlR1VJAPvneFBqq4y/7SrecxrpCDOsOrle61Zf6tpPEbDa16eHjIbM6/EHl
         6+Rux8gTIGzt3I1Ul4IeGDszJpeVjWLzro8+yEP/Ru+Z3/OY20p9D4BJob03p2xHIoQC
         i4cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Xd9eNrOSCFFAWaQdLSMEnWBSlqv0nUO4Pn2WJ4es7Z4=;
        fh=bquDIPLrQfk43CUiETPcm54MdOr8mvbLHcZ0ZaACeqQ=;
        b=qMFmZPWobTOa97mkaVE14p3nw7PgA2TkHDv48QRWVQ6UeYEUrBEmjTJlRSk7W29n6n
         jvOvWQ3fHxQ6nEmPfEcWosaQBY9jZVfZWgboAaOkllDxKvPTn/GTIyKI648WeF4eWS+N
         uRCD+EMMqO4SJc4d7GTGBM4dll6Qyz9LVHwlQ6ygaqMpvb0HQWfA6NX6ZtvOrpi76F3h
         rqlh10g7JANaNz+vOzwP01PyuxzvvIRlH2kcUyUIVgWqNX4DsMMZpqYBGnUd9uzjTlJC
         FPOgTsrJqOm+K7bvZJfzRqjmcM3jX0qroM9UIMIKEhFlRLN0raq27tN0sB8o9Sl4phau
         V76w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783614836; x=1784219636; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xd9eNrOSCFFAWaQdLSMEnWBSlqv0nUO4Pn2WJ4es7Z4=;
        b=fpt0Ge61k5eCyN9EOd3N/vQYe1fzWqSuCP/YYZPD/aFxIGX2YRsVyaAUtnzEi8MYgu
         2FjfEotctKoJ9D4aeitc+mUcMEOchaYZNOYMn9JDxUgfpYkwGZHwIU+5mOlqdXaIaEP8
         1L3AcgYdI2Gjfbv36p8hT5FrGdUzHj/E3yoV618uY1seH4pCotPsGrhAVI9OP70M7G68
         CyAbz/m5UOLEPCL0cLym2skivYF3sV/Fr0K3vOCoZaxGNrzF5XrlA+nuHOhy/ErQmAsS
         GtGAHWvnGXFqdu0po/7VzbVtipFMY5yLGrqObJbWaUqlcdnXFam9QFAIgpxGaMqriq0S
         rVwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783614836; x=1784219636;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xd9eNrOSCFFAWaQdLSMEnWBSlqv0nUO4Pn2WJ4es7Z4=;
        b=fTsj2MaP0jkLw5sPr3l2aU03xfDz4z1kkXyGbWIVrhg5mpN6YfhbmsQfFA3PwWpswS
         tp22QQlFhDVwDb9TyvZSY/5RkQM1d43DAl0CdhPhAHBCvhUUs/rSlo4OP1ms4SwZoycD
         ftc8YNHu81u30kBzbG6Os/yupjfwEcoPXQV/rd6pEmRmCoRdn1e9vZYK3HX89br4VU00
         5k1DTBtW6Qg/7G8+sWVX6bnD4TYw3R+fAbMKAX4usl2aCu2NcmCXerFSq4M2koao+997
         18pn8qGcSQ8g0f4kqkefjfZ07Tpa0Is8w4vJLUuF1ZAHjIdcSplgMS7pBp68lsyQIfFS
         dobA==
X-Forwarded-Encrypted: i=1; AHgh+Rqy9+RJC74Oge3CdSk6N9fmprtxUxwvpCDz0Zj6/BnMH8gelcd8nQWxhrMcf6vLq8bFdu4+I9VM65er@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7s4hA7IETuU21j4B52H0WPRStpN9f63CXrM6sBhfG0xJ96KdZ
	8kVqlhETxx92O4bclNo3qvavU//CsvriEYiTZh3fGaibrhz9EEmxJ5CeGtYrOXJ/G3aR92gl3vs
	whDGDK5ZlTq3C4086IJgt8szmqpT+MmhkI9qrmmbbOqLkZM1oxaK6SeKOrKeXHl2bPBaAjvOWnm
	6sQt72xW3ZPx/ZJSo1mluJwZJrGiyLMoeA/5HQlP4=
X-Gm-Gg: AfdE7cmZHCP+VOOuU4A+SqyIuGLQAY6n2k2/4NzgrCdXl4MhclKz1MK0P3pztoDQSEu
	W+A4f4RMPvkfY6ntpgHrRLvgBEuawSQrIv7j7kS1SjtSjcA7who8R7krFlI3XLZVjUOPpBumOOK
	uz59ZzCB2UdqeWX6NiK4px+WuHUgRkkBI+jgqQ71pmCd3ZELE9ECEnPvuSxghHk8lQpeEoXSVDX
	zKWLVB/7934Inb6oABBvpREntD86vrw0iO3t8b0UlOQsnN5Wb13vluJ6ioJ8nlscSDkI+3zSBPv
	m4HGZSOIDA==
X-Received: by 2002:a05:620a:6cc5:b0:92e:c117:9ea2 with SMTP id af79cd13be357-92ecf8edac8mr795068485a.80.1783614836247;
        Thu, 09 Jul 2026 09:33:56 -0700 (PDT)
X-Received: by 2002:a05:620a:6cc5:b0:92e:c117:9ea2 with SMTP id
 af79cd13be357-92ecf8edac8mr795063985a.80.1783614835839; Thu, 09 Jul 2026
 09:33:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org>
 <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-4-f8588da41f16@linaro.org>
In-Reply-To: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-4-f8588da41f16@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 18:33:44 +0200
X-Gm-Features: AUfX_mxrvMsfVaIuwsAqRlu-SiIqeRWjw3dsC18UJ-fCRtJqc3yI7XzxXZWCYk4
Message-ID: <CAFEp6-00rJSrOCyHnCQ-VkSWLYHA6C-MCGNt2oMwAA6ngi=Dxw@mail.gmail.com>
Subject: Re: [PATCH v12 4/6] media: qcom: camss: Add legacy_phy flag to SoC
 definition structures
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
        "Bryan O'Donoghue" <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=UI3t2ify c=1 sm=1 tr=0 ts=6a4fcd75 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=LRu0fTMIKIkxnFiMMFwA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE2MiBTYWx0ZWRfX+9vxKRWxgv13
 ZCo5idzGEsI0DM2HjIjf4hzR61c14Y9WB6z4VhqsXrb8bdDWMq9Tgv0DEi25A1ty+UNjLvDj9O2
 BPIdRF9DtTflHJsbWDjSOyyPyz2eYmDdIr4JtRMk4qqVDzDdiomDmO2bHXhcpNCk7Axa58NP/z4
 T6NEm/lOygDHwEWVK+LX3I2jm8o0onHs5hrRfx94IyWc1fOMlauszawdaY1KvoYLACEBbGYWSe7
 UOeUoMgJDfyGNmRC+NljOzy5MeS32KcDdZRIJNdgtGdDaLLTaWhMIvfNz3FFB+bkb1BcbXV3Atn
 RG27vZMooi0kp3CduRSIXQ1HjrZLtCjsG/BXATVJodLyXpA6gypLQ9Kh89eq9TvdSoJqmD8b3O2
 0AckhfeHWDrWKBgwKeGcmC8KOCtvPLOwIbRcAIWWjfxiCsNfEaS/8LeiNgaHrykrzsgSt4WOxjb
 QdUwHi+mrm6G0GjB5/Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE2MiBTYWx0ZWRfX1lXEQstaKM2Q
 sLPvxVnjgdqyekZQtxWXW1egvbzHDcS4dXIOOjekkeJ9oegZu+FiXM5Pqk62KW+IRjJQB432fML
 C4UwStG28+lbzVpLdN0gW2Zk41Dha+E=
X-Proofpoint-GUID: 8boV1m57u8HPPw7F9cakohKmLIGi9Zk1
X-Proofpoint-ORIG-GUID: 8boV1m57u8HPPw7F9cakohKmLIGi9Zk1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_03,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090162

On Wed, Jul 8, 2026 at 2:07=E2=80=AFAM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> Flag which SoCs have legacy - builtin PHY code. This will be useful in
> subsequent patches to inform PHY bringup logic if legacy bindings are
> available.
>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss.c | 17 +++++++++++++++++
>  drivers/media/platform/qcom/camss/camss.h |  1 +
>  2 files changed, 18 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 95e655a8b6aa0..e814a96953b1b 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -5512,6 +5512,7 @@ static void camss_remove(struct platform_device *pd=
ev)
>
>  static const struct camss_resources msm8916_resources =3D {
>         .version =3D CAMSS_8x16,
> +       .legacy_phy =3D true,
>         .csiphy_res =3D csiphy_res_8x16,
>         .csid_res =3D csid_res_8x16,
>         .ispif_res =3D &ispif_res_8x16,
> @@ -5523,6 +5524,7 @@ static const struct camss_resources msm8916_resourc=
es =3D {
>
>  static const struct camss_resources msm8939_resources =3D {
>         .version =3D CAMSS_8x39,
> +       .legacy_phy =3D true,
>         .csiphy_res =3D csiphy_res_8x39,
>         .csid_res =3D csid_res_8x39,
>         .ispif_res =3D &ispif_res_8x39,
> @@ -5534,6 +5536,7 @@ static const struct camss_resources msm8939_resourc=
es =3D {
>
>  static const struct camss_resources msm8953_resources =3D {
>         .version =3D CAMSS_8x53,
> +       .legacy_phy =3D true,
>         .icc_res =3D icc_res_8x53,
>         .icc_path_num =3D ARRAY_SIZE(icc_res_8x53),
>         .csiphy_res =3D csiphy_res_8x96,
> @@ -5547,6 +5550,7 @@ static const struct camss_resources msm8953_resourc=
es =3D {
>
>  static const struct camss_resources msm8996_resources =3D {
>         .version =3D CAMSS_8x96,
> +       .legacy_phy =3D true,
>         .csiphy_res =3D csiphy_res_8x96,
>         .csid_res =3D csid_res_8x96,
>         .ispif_res =3D &ispif_res_8x96,
> @@ -5558,6 +5562,7 @@ static const struct camss_resources msm8996_resourc=
es =3D {
>
>  static const struct camss_resources qcm2290_resources =3D {
>         .version =3D CAMSS_2290,
> +       .legacy_phy =3D true,
>         .csiphy_res =3D csiphy_res_2290,
>         .csid_res =3D csid_res_2290,
>         .vfe_res =3D vfe_res_2290,
> @@ -5571,6 +5576,7 @@ static const struct camss_resources qcm2290_resourc=
es =3D {
>  static const struct camss_resources qcs8300_resources =3D {
>         .version =3D CAMSS_8300,
>         .pd_name =3D "top",
> +       .legacy_phy =3D true,
>         .csiphy_res =3D csiphy_res_8300,
>         .tpg_res =3D tpg_res_8775p,
>         .csid_res =3D csid_res_8775p,
> @@ -5587,6 +5593,7 @@ static const struct camss_resources qcs8300_resourc=
es =3D {
>  static const struct camss_resources sa8775p_resources =3D {
>         .version =3D CAMSS_8775P,
>         .pd_name =3D "top",
> +       .legacy_phy =3D true,
>         .csiphy_res =3D csiphy_res_8775p,
>         .tpg_res =3D tpg_res_8775p,
>         .csid_res =3D csid_res_8775p,
> @@ -5602,6 +5609,7 @@ static const struct camss_resources sa8775p_resourc=
es =3D {
>
>  static const struct camss_resources sdm660_resources =3D {
>         .version =3D CAMSS_660,
> +       .legacy_phy =3D true,
>         .csiphy_res =3D csiphy_res_660,
>         .csid_res =3D csid_res_660,
>         .ispif_res =3D &ispif_res_660,
> @@ -5613,6 +5621,7 @@ static const struct camss_resources sdm660_resource=
s =3D {
>
>  static const struct camss_resources sdm670_resources =3D {
>         .version =3D CAMSS_845,
> +       .legacy_phy =3D true,
>         .csiphy_res =3D csiphy_res_670,
>         .csid_res =3D csid_res_670,
>         .vfe_res =3D vfe_res_670,
> @@ -5624,6 +5633,7 @@ static const struct camss_resources sdm670_resource=
s =3D {
>  static const struct camss_resources sdm845_resources =3D {
>         .version =3D CAMSS_845,
>         .pd_name =3D "top",
> +       .legacy_phy =3D true,
>         .csiphy_res =3D csiphy_res_845,
>         .csid_res =3D csid_res_845,
>         .vfe_res =3D vfe_res_845,
> @@ -5635,6 +5645,7 @@ static const struct camss_resources sdm845_resource=
s =3D {
>  static const struct camss_resources sm6150_resources =3D {
>         .version =3D CAMSS_6150,
>         .pd_name =3D "top",
> +       .legacy_phy =3D true,
>         .csiphy_res =3D csiphy_res_sm6150,
>         .csid_res =3D csid_res_sm6150,
>         .vfe_res =3D vfe_res_sm6150,
> @@ -5661,6 +5672,7 @@ static const struct camss_resources sm6350_resource=
s =3D {
>  static const struct camss_resources sm8250_resources =3D {
>         .version =3D CAMSS_8250,
>         .pd_name =3D "top",
> +       .legacy_phy =3D true,
>         .csiphy_res =3D csiphy_res_8250,
>         .csid_res =3D csid_res_8250,
>         .vfe_res =3D vfe_res_8250,
> @@ -5674,6 +5686,7 @@ static const struct camss_resources sm8250_resource=
s =3D {
>  static const struct camss_resources sc8280xp_resources =3D {
>         .version =3D CAMSS_8280XP,
>         .pd_name =3D "top",
> +       .legacy_phy =3D true,
>         .csiphy_res =3D csiphy_res_sc8280xp,
>         .csid_res =3D csid_res_sc8280xp,
>         .ispif_res =3D NULL,
> @@ -5688,6 +5701,7 @@ static const struct camss_resources sc8280xp_resour=
ces =3D {
>  static const struct camss_resources sc7280_resources =3D {
>         .version =3D CAMSS_7280,
>         .pd_name =3D "top",
> +       .legacy_phy =3D true,
>         .csiphy_res =3D csiphy_res_7280,
>         .csid_res =3D csid_res_7280,
>         .vfe_res =3D vfe_res_7280,
> @@ -5701,6 +5715,7 @@ static const struct camss_resources sc7280_resource=
s =3D {
>  static const struct camss_resources sm8550_resources =3D {
>         .version =3D CAMSS_8550,
>         .pd_name =3D "top",
> +       .legacy_phy =3D true,
>         .csiphy_res =3D csiphy_res_8550,
>         .csid_res =3D csid_res_8550,
>         .vfe_res =3D vfe_res_8550,
> @@ -5715,6 +5730,7 @@ static const struct camss_resources sm8550_resource=
s =3D {
>  static const struct camss_resources sm8650_resources =3D {
>         .version =3D CAMSS_8650,
>         .pd_name =3D "top",
> +       .legacy_phy =3D true,
>         .csiphy_res =3D csiphy_res_sm8650,
>         .csid_res =3D csid_res_sm8650,
>         .csid_wrapper_res =3D &csid_wrapper_res_sm8550,
> @@ -5729,6 +5745,7 @@ static const struct camss_resources sm8650_resource=
s =3D {
>  static const struct camss_resources x1e80100_resources =3D {
>         .version =3D CAMSS_X1E80100,
>         .pd_name =3D "top",
> +       .legacy_phy =3D true,
>         .csiphy_res =3D csiphy_res_x1e80100,
>         .tpg_res =3D tpg_res_x1e80100,
>         .csid_res =3D csid_res_x1e80100,
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/pl=
atform/qcom/camss/camss.h
> index 93d691c8ac63b..698694d3064ea 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -107,6 +107,7 @@ enum icc_count {
>  struct camss_resources {
>         enum camss_version version;
>         const char *pd_name;
> +       const bool legacy_phy;
>         const struct camss_subdev_resources *csiphy_res;
>         const struct camss_subdev_resources *tpg_res;
>         const struct camss_subdev_resources *csid_res;
>
> --
> 2.54.0
>
