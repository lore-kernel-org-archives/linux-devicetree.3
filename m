Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11737442B0B
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 09:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789465476; cv=pass; b=WmLDlWp+qrRbNtvN5i6blasHkgx3XxMZzYmiYq940MEkxRPjmX3Fn+Jp26IzONM/vyzD6oeuGRAlv1QAlIcovxIUc4t29MVs6wsIO8dLdiwQSs/C8WZLtGuAqTVm7ks9gCzduqlVXra4IFypT9BcJ3/KDNId112MaCuhy5xrUOE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789465476; c=relaxed/simple;
	bh=bnMbNVVj2v7D9H53XLbDJbbR1wetYWN0pnhL4iZAsKw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qh8mWudMc8MezdHQ/GTkQ9Hc4ZSGi1PF+HJJfLP0He3/xJPLgDIvob9nA+Bni5H9+sph67PILDal8WpQgF5IMlVgdH3kV1jUhhw+E7oH/xSRvRH4k395X5kU5k/EKnMfE5p+1C1baFtMoZkk+vuZAZQr0itrncr5U3G6/gt07oM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CswX52JO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BqO6+CL0; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CswX52JO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BqO6+CL0"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9hHwY2833328
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 09:44:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+fxpNJamNTHEgMiR+YPy8hcOjc4iu052BMQz4IBDT98=; b=CswX52JO4Piek7S1
	Nh5bNU4VoO1KLQKJHZi2GoNsBO93uwTsHWczoWdD5kh+m9XZtxEd23AQrjfDPOqB
	tX5Cjr+nIN1hQekrHcniYNtSI7eA+CV1XEJVBv9UwvTrgzNsnyjK9evluCd9rGjz
	+DkpQKne67MJuncyzn9NhnAmvFCbziH8n3MzIJ9uckeogat1TJEpjZHYbk5E7GFE
	hnkRb8LlCj/uwSTXPsevc+/qgw6cPGOY0d0/N1akFR8jVQ/8lqNtqBc/KHR1wL0w
	7WxbNJx8Mp54CGlfZ+XZn3I5piX949TDmuYC234iyBEY7w0iWqTsMCg78sI/1IXC
	z37DOA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpxyd9640-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 09:44:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a1d44c437so328524885a.1
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 02:44:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789465473; cv=none;
        d=google.com; s=arc-20260327;
        b=YCvDIJjIsgtliGCsUrwejUuQtPfBhLR85mEutrszv5fZiCVPwRqtshcrL9j0HjCZsX
         YUREwxfWO1kpd4PPdwL4LxgS4cVCtOxt6WCtj0MDYqlTgfnGueiuKMVeNTp4qkboqyJe
         iM6jzhvvO6aDnBQyPal8qKKsAr8iNqcx0xbJiAAxThWrLxBqKjzRon4x6y5poAlHnuw8
         VHM2dJu+QHpcXlzLWAhfaFcfEXO/ixfgGSQE5juxJjvzM87+vPPIqGeeAq5rMH10Sjez
         6r9ip3+MOe64SMgnO+FnqqWyTaX+uqgXnGgDbhL1es5m9VJqfA9yR3tOj+x5CpVnAVv5
         aE9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+fxpNJamNTHEgMiR+YPy8hcOjc4iu052BMQz4IBDT98=;
        fh=TX5ScJWsS7Y32Zit7fLpZfGWNZ2pxrqmGJux+2XFv2I=;
        b=nMjbtbbvnB3ffSHcOhDC6kslxLWtiZe0gbXz5DaO4hujqf70LqmNo7twRVcuTT9egy
         4t2EYwlAlUDwldDseTiWymr798h294s6ZMMdrY1JmQ48F9jkG0/JyjEPai3m0F3eDAOQ
         TFaViq5wpbxeMLtid9R57SK2u6sCsVOKFR/wC+kBLTVX5lYXpv0X8XLkRS0lGrI2eP0f
         tjXRlfSL+JlHikL1d3OJmHKsBNwj4gGyfOIXoW+1W8fQAxQpZ7/69KiZxcAn+iBJjgcS
         /MEP/8dqGYIr9ast2xofWFpRG/iT5+b2ATkc4QQiBIOstiVhw3LuE5dyG1ZKXTUdBJ73
         Gb+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789465473; x=1790070273; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+fxpNJamNTHEgMiR+YPy8hcOjc4iu052BMQz4IBDT98=;
        b=BqO6+CL0bnBgpS1KoPFMfcK3hk9hoxkrNc2XYwBLMu14pNQTHeeR2OMQd98FD4vpJg
         vZ/lrPhoaEgsekh7SyNuP+wx/1toQyIeZLR9WJCeavjV2DfV66q1aHYLsT83oKAGvdT2
         ZP5Vd6eJA/k6EQ/CWpGYkJIX7TPJos0MHHBXon7x+E/Xx3MAxFwTnwmSDDi+Y+/mLsm3
         4AGYO3DW70kx68QyNv2dirIAomy5i0hl0UcWmTaMLboU9PcrRpag4PUXtqPlaUEKg5rd
         /iYf/vKf2G5b7AUoK/bhcExLygqWoa7ck92fChzWwtr6VrHgI0H6T/W8CB5ObCp5gZA2
         DTbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789465473; x=1790070273;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+fxpNJamNTHEgMiR+YPy8hcOjc4iu052BMQz4IBDT98=;
        b=Kd5mABG1B04uesCGxWOZo0qn7XKWipQ4GY/cegKdqX1i0Krydr9S0+lfN83uHIdixY
         47VOXKD2geeg9IjuoGnyX7HzF/8a2nUPEq40PWMvBHwifsp2momjjhTv3iR3bun8A+Rm
         pV64DZkEBBEeqMi2TXhBE2IpKl+6INMe3gzeRDiduKL8PoOV3Z986ThY1MR9t7lP20GR
         LrUDYKwWEAVSbi2ShUYabtTlHFqc1cHejz4nYjwygfPczeZThiabwVMUcJk20K0zQMQY
         Oe4Z91OU/gd94xaqVR46MaS4Fq9xF0uQb3v/KjZeLBqRh3L8r7F2gta5o0BxrWBi1NB4
         ymcQ==
X-Forwarded-Encrypted: i=1; AKwUvBziRthX9ysE9ceN3egbl5xPlZuv70MPNiasbfS26NW5BdO444rHXkapbNWTFkkd5/etH0MjKDsDkreN@vger.kernel.org
X-Gm-Message-State: AFuF++m75I3NdzdLRBQc/PbJaci93/e22qLKUBHLRXROLDNyOZx+lt/t
	Un/WbayxBll1EYOY17MdMXHCRI8U35V4tUM6P3IlKQzd27ZKvZEfwf0SwZEx59dYimFcqoQPh5O
	o9Z9Q8CF/UixLuTzf2Meuacp3UEvYL7JA3Rmgcw/FDhV2m3FQuD6MWZhyrgnzJ4ecSzO0PzYMRT
	3S2IHVmdHMGoGnX6rbkCfDnkZyndT2474GxU/cYdI=
X-Gm-Gg: AYBFou33ry38NWTiA5Kvo3wT5Wp/hx5b+1LbLfSafYaN3DNdnSdznm4dSKvdTAKUxdk
	Jf5acCAWMhsrG24mJl5Hr7BZKrDIlqhauGQAv1TzA1INFaBxvtTgQbqT0PNtHsWIV0SpTfa2MIB
	HwxOv8Vdl0AN3BSxNXj9f/pPJYKZnGGU0KAF0Cmp2jOZOrVSJO0ymJN8hGgVdnhNf6uPT1LsHy0
	oFMc75ZUfWitynMlNmACwVhzFGZXx/zXJPbQSxEaD6sBtzTs7i1Cq9m7m35Pl+hDzuTYNCTmeiI
X-Received: by 2002:a05:620a:1994:b0:92e:4927:2002 with SMTP id af79cd13be357-93a299edea9mr1021968185a.39.1789465473199;
        Tue, 15 Sep 2026 02:44:33 -0700 (PDT)
X-Received: by 2002:a05:620a:1994:b0:92e:4927:2002 with SMTP id
 af79cd13be357-93a299edea9mr1021965685a.39.1789465472779; Tue, 15 Sep 2026
 02:44:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v17-0-e2197a3e2551@linaro.org>
 <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v17-5-e2197a3e2551@linaro.org>
In-Reply-To: <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v17-5-e2197a3e2551@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 11:44:21 +0200
X-Gm-Features: AcwNN1UBt5xNb7VDMYWD4BT9h_axCpKQfZrvwQ0bvr4VpK98SvAM9POncAzr6Lc
Message-ID: <CAFEp6-1meC7+XV3nVUiqivnpPQwDnDBRNCtmDZ-OMG=sLkxAvQ@mail.gmail.com>
Subject: Re: [PATCH v17 5/5] media: qcom: camss: Use data-lanes starting at 1
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
        Felipe Balbi <balbi@ti.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-phy@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEzOSBTYWx0ZWRfX/H/3ZlQ/NUxz
 LKP+wLpquoUTpRp4CjbNBL0GZU+8BZzui8ZW+S8HZ+HNXKC3F5j1IVGVi8iHDKdu2r1IGURvarh
 LTOAsiLxSgC5yWnOBZLATZ1AGMFGrtM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEzOSBTYWx0ZWRfX5gM74R0DXIPZ
 tpRzVgcjPdFNGvha/mH1O+uzKfGRWaneMH19aELX+cP5yZKZlNOHw18pBcLQ/+CgBfDHaFAZhdA
 RAYIIoMDsHjyA6fHKGG85imQW9C7bcoL+7d0X7J0g5LAy9m6Sc6n8kB9DiKrc/DcILXTEg/X9Gf
 8uISr4drF9J7pP98Uppb3JsLUetSjJtl/q8VlKjBpxEZFuxWXzVYsQ+5Y8lEWORVRDs2NQoHnYI
 o+QV1H81h2JaOGDFAFP6UbuUUQh9HuQeMOx3oNvHWd/qNnXgWilnBf50diYKx+SCIcLK5gVXqXc
 dpQdDg+rFcxzSAeU9KZaOXGhJhKsA/aJMvM4gazX57O2xV93SglVd7gfII4lWzzJx5Sz15M+Bas
 lD3sTu08faJBpIVTDBquXemlthCCzPzBUzMrxDCrP9lOPRdsW+5KQTb+PFHeBL2c8ji0qqvD5SQ
 FQ62inaMu4DWr3HsDZw==
X-Proofpoint-ORIG-GUID: BQTAAHraIBPCVeKq_QJDveII-k7RtLTv
X-Authority-Analysis: v=2.4 cv=LYepeTfi c=1 sm=1 tr=0 ts=6aa91382 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=KKAkSRfTAAAA:8 a=aw8XXKZHl-0D_llVJ40A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: BQTAAHraIBPCVeKq_QJDveII-k7RtLTv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150139

Hi Bryan,

On Sun, Sep 6, 2026 at 4:17=E2=80=AFPM Bryan O'Donoghue
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
> ---
>  drivers/media/platform/qcom/camss/camss.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 84097d82d99c9..07b3cddca5840 100644
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
> +               if (lane < lane_base || lane - lane_base >=3D lncfg->num_=
data) {

I agree with Sashiko that a used lane index can be greater than the
number of active lanes.
So perhaps we should remove this test, or compare it against a fixed value =
(4).



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
