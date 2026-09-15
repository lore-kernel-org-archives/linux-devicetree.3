Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A5B39C637
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 12:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789477185; cv=pass; b=L2LXMzaJeP/Hqvyxo7MKkd+keVICtbBj7RPNV1QzFLTQU3X72p5pSOqaWzrp02WKbNR6os5CP+AxS7ECgG0qJX+likIck5GGnT6t1RzvKxfBJ2t2Ym/efkyVFcJ4mKH3xyjRS1PLRgShS1I1PO1coAeXyc1sx768Cf7h0BImT68=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789477185; c=relaxed/simple;
	bh=gsjyJrh07JlDH9AvGcFVcXgZkOakK3WLU3t0Bnw/WuQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZB4i8EloOPrqqy57eA8E7uHVnXXUuWgiOyhOyWBInZMuHoeDsBR1w+7XVUY6s+/TmhBx5Miq9qsXeMFlR7Xam3179edQC74OFtsYh4faTKQ98VwD2EyYXoLmu7Z2vvOLvC5RjoNosaMqdiLXwQWqAy4bYvBw9I7XNOaQxDNv3J4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jj0o3g7V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Aj5aJDGj; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jj0o3g7V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Aj5aJDGj"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9hJNR2675002
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 12:59:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T8M8fHv7jJKzUDotCI9JtXtNdmLtib1ArSAhx+AXE1Q=; b=Jj0o3g7VHs529msO
	s4GUSHT7/qFtDNIpVy23u7/aBez6cIjA5NnWpG4ItziwxuLr5TPEEqO5dx8czYP1
	aUt3hJX8dechE2d7fj0C9k5p/pORyPy+NoR76Yl65bHkhnZVZcPEnEu/W6OLkbGV
	1fmf2PQLZFlBgXyDpnaegKzS7vTK834D6HgG2fwwZWsPWjygqMkMVstg8MSCCqEh
	Utpa743q2pTi3u+MKRFbJOn8lUtt1VSEb4oAE0pTqle3ukLiS/krPe6dYe6GUcOL
	OuQzx6z2sXTAzVJggHt+R4c8u7mFRfnscLahNDaZiSWXscLgBeUxEIB7QTWq3AlY
	braKFQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpye71xh8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 12:59:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9390a2c895bso1047907585a.0
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 05:59:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789477182; cv=none;
        d=google.com; s=arc-20260327;
        b=MJw1Mu3kaErDdyhN9GOjQLHmNdn2jsBiPCUlxACIxpfGeTPbot43N3vo2HXqZXTLXB
         dcFwItGVgotKiWoL1eZi0QxvFBvUgmgutnENLPbA1drlJ2qfsdsfZlFLlcaWiMqnmnpR
         wbsSlddQW6SWIpuVZjaGOwOtXP2/5n7h6u2qP2pLIH5NiXVodoRaMp3OPZ0juQpePTxl
         gy2+EtjHFU78UA6gHzF/uxW8mbX1ipthR2l+zvPRjh1dV5Jq3JQSvHEmpDSgZ0q94vLf
         sWsDmjVJ6pzkitQgfnrpifrPkw8IpdQquzOQzO95qJ69BZaGlOwBK8fJ4R8Xd/+uim0X
         95iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T8M8fHv7jJKzUDotCI9JtXtNdmLtib1ArSAhx+AXE1Q=;
        fh=piqWfoXtRnMfGvo27oKaCXaL31lg1LuK4MCY9kZDCL4=;
        b=eTPIngtG2brPR4yke0CJ4gecH9AHK+B84VdjSGI7GoDjPMtoT3AZd2WgLfDdNuyoow
         MpGEtpI6TW2CjazxuBv1Qv9CGZZw4eFEBSQh1HVoifl27vOzdRrMp43b6VLgJ/nf0OX2
         w35be668s5g6a7CdL2X+9Dwox6OOuo2IG1bRPhXn64JbH6v0qn/bm2Ki6mHSuUzHf519
         WoZTqGh5+OyfHdyh1XXpG4tbnOdnksFsivBWgJFigiRf0iS5ZnhLNJPzK/zCNDLPRazp
         7E7ghsaljmg+1xKgP5rC81Xd7sPDgeWIjQvLxKyPEpGK8MCqEQBtYqux0tzD+YA8/YUp
         xTbQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789477182; x=1790081982; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T8M8fHv7jJKzUDotCI9JtXtNdmLtib1ArSAhx+AXE1Q=;
        b=Aj5aJDGjQVk5DHANNpJAmnr1KoWh7aL06u/iubGDdBy4xoWOXOMO+u69SJhzJfC0A8
         dst4wmsRsh7N7Ibq6NILnZmk/+qVVaYOt/vMuSevAo28HqmdMdfxcLLLBmnhjr1uzwMi
         yJqAY7t9ipFpZJ8d29bpyb2bAX0QlkK8UhXrEFb7fOIcSrLjq1Ixtbn/UzgXeohbDYJW
         4i9EBqCpABrBXdrNFJ2FIK8cm3pBdfqDKkQiHkFlJvg/+Qwi3Q2esLj9cNhMYuuPMoLY
         Qgy/2BWd1Av29pnFoOCKvyaCLFoR1E+eaeVUt9e1YfsdRqhTC4JMmgaDZXIpsOOQRdtu
         yobg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789477182; x=1790081982;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T8M8fHv7jJKzUDotCI9JtXtNdmLtib1ArSAhx+AXE1Q=;
        b=mQYPwPg5+rBESlJJuZSwLtxZhidKajzkSXm3jW3mdNUBTg5qRtGMvldHu0Zv3Nr7iS
         wGDdYBr+IU2WGwdWUrWnjbaIISmhiPoJHx/bZF6D2HvtKGcVS/3n11zEV7ZwfcpacbCP
         Clg+Ic1qHmUo3qd9FfeiO2FQXZZBP+UBCsqwCsuAm3Ba5jwPKETVmKW1EqE+Q48WYS7d
         qEmLmPv+ZDu9q8euwT2bbJGHTPFwPw5zmpyROuFR2zsb6BOMqq4nPilr/2WIsLKiDbQl
         dCRIXPsha3yxmjAYrzLANGTF+Ffvk3hTxlqRaRUYEdqtiNHyBJ1Yq5SQHqMQBFGeMpck
         KMjQ==
X-Forwarded-Encrypted: i=1; AKwUvBzbj3zy/n9c9l5FInSDtILe2YopkQFXFmRUCFZxNiljck03qCbOz/p/s+Hh31QJrQTwT+DU1fNAXi+R@vger.kernel.org
X-Gm-Message-State: AFuF++mVnvmFeXrFOYZAMR1EMcbksDEvJCwrr/w6+nUX9U7OUIPcag5j
	1rD3H5eoJKCILii+td0KFrX8F/kSmrdABYpfURIi8qlc1V/B9MKM8lX6jH9mWP1IAghRR55XcMh
	Lvhifuvd+hhLB4OKUWh1PtdHh3MMdpD012dqs2DxK19PDssIzLxlI0MUdCORpFLVUr8cl0akVfg
	lEok4JQMGnGFHq7iwM4R13XofeCcctUdM40dHHq5A=
X-Gm-Gg: AYBFou2ZBHkrsmW3M71lImP9rZyeisRpZTmpAbThzzWry2AxXYB2ESOuHgpwCS4ZJUG
	5qrxU+DQY8GN30zOqnU8sgsAPV1rLCsFksbEG3GOewrG1oiripCDTzBQE8DI6MR1AH4flUow1yV
	6DuhBBgPA4Z9ygBfrpvjNBpaUdoMCJ1zcXwglr+0T8+w9c9VAzDU5zO9rpMQvVGCcmmlUkIUO7R
	BRz1XAYDAKD9el43VrS5jxEaenaYyPWZYJ0AeeaQ5/rXnhvAWRWXvd1dJ0N6j3jS7S9KSq7dy+H
	12nOcORBa2OSsUJGNLS+qx9zWneS
X-Received: by 2002:a05:620a:2707:b0:939:d675:f166 with SMTP id af79cd13be357-93a29bb3b5cmr992162185a.48.1789477181818;
        Tue, 15 Sep 2026 05:59:41 -0700 (PDT)
X-Received: by 2002:a05:620a:2707:b0:939:d675:f166 with SMTP id
 af79cd13be357-93a29bb3b5cmr992156585a.48.1789477181359; Tue, 15 Sep 2026
 05:59:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915-kaanapali-camss-v16-0-c9f3f6f4180c@oss.qualcomm.com> <20260915-kaanapali-camss-v16-3-c9f3f6f4180c@oss.qualcomm.com>
In-Reply-To: <20260915-kaanapali-camss-v16-3-c9f3f6f4180c@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 14:59:28 +0200
X-Gm-Features: AcwNN1U5ctkEm4DwFkBSfEfQg9_gGH1ZHa_iPM8quhRMcHD1Qgxe4V5aAf56VIY
Message-ID: <CAFEp6-3wmGA77cKaOgDUxsFSFaa_q4StNkVPrz23jN8r2HaF1w@mail.gmail.com>
Subject: Re: [PATCH v16 03/11] media: qcom: camss: Add Kaanapali compatible
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE4NyBTYWx0ZWRfX0xeAc4GMfLf8
 EzawVmGFbkzkbkpCPM+6zc8OqVWqjLIV5K7S6d+EoyWLncvZeLubBUGxpyW3LpuF9qdgVQktY1d
 APHmLstcpznrwfyybBPeiaH2fJhjvXCtKP+t6XKadWw9hUCOQhbHVGqyewCwDX+7SO4VcObIKx5
 EwQ3Vf/CgTvXmE9nz+8ZB0mv2Lhytzml66hyL5zcvd3tKpTRxm3XDH9FDMFsa/RyYq1Ux2VrZG0
 nIYFZpmMEm6ohbL9szFRaqIJ5L3Pe0jOCVgsA0XEsOk56NCSIh6CM35i2dvtsYk3wfkc52tavt4
 aieO74sjyOt/496c1/FH7xiPMJMF0/jd5bTl5bim7g6vDDUT5bHXpkjuPUppX/YppcjwoQhqojx
 03Yg0aGG43MiZTHhpI7jBldsqrky6BYK4k6IdiYJuTuo6ZxrFABlcsuezAwSsdGwv/Gt20hqVII
 f1yEFc0jlRx2HE40FJA==
X-Proofpoint-GUID: 8NLxriD66x0n1ncy6Y2pWerZ1zdoYqg3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE4NyBTYWx0ZWRfX6VJaHLVTdDed
 0u9zncgNpVrn/eaC/4GzW/0tKisTuEfjQjavjZA50j4Zw2rgpvBqbGblSM0OG29TVIwzSQP6A+q
 +QRCQpQVRc+t1QqqmnTkBuI6eS8zYec=
X-Authority-Analysis: v=2.4 cv=fck4WEQF c=1 sm=1 tr=0 ts=6aa9413e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=DkjGjKK6HQ8r0z3qK2QA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 8NLxriD66x0n1ncy6Y2pWerZ1zdoYqg3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150187

On Tue, Sep 15, 2026 at 12:10=E2=80=AFPM Hangxiang Ma
<hangxiang.ma@oss.qualcomm.com> wrote:
>
> Add CAMSS_KAANAPALI enum, Kaanapali compatible and Kaanapali CAMSS driver
> private data, the private data just include some basic information
> now, later changes will enumerate with CSIPHY, TPG, CSID and VFE
> resources.
>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>


> ---
>  drivers/media/platform/qcom/camss/camss.c | 22 ++++++++++++++++++++++
>  drivers/media/platform/qcom/camss/camss.h |  1 +
>  2 files changed, 23 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 07b3cddca584..2c9f02bca809 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -34,6 +34,20 @@
>
>  static const struct parent_dev_ops vfe_parent_dev_ops;
>
> +static const struct resources_icc icc_res_kaanapali[] =3D {
> +       {
> +               .name =3D "ahb",
> +               .icc_bw_tbl.avg =3D 150000,
> +               .icc_bw_tbl.peak =3D 300000,
> +       },
> +       /* Based on 4096 x 3072 30 FPS 2496 Mbps mode */
> +       {
> +               .name =3D "hf_mnoc",
> +               .icc_bw_tbl.avg =3D 471860,
> +               .icc_bw_tbl.peak =3D 925857,
> +       }
> +};
> +
>  static const struct camss_subdev_resources csiphy_res_8x16[] =3D {
>         /* CSIPHY0 */
>         {
> @@ -5596,6 +5610,13 @@ static void camss_remove(struct platform_device *p=
dev)
>         camss_genpd_cleanup(camss);
>  }
>
> +static const struct camss_resources kaanapali_resources =3D {
> +       .version =3D CAMSS_KAANAPALI,
> +       .pd_name =3D "top",
> +       .icc_res =3D icc_res_kaanapali,
> +       .icc_path_num =3D ARRAY_SIZE(icc_res_kaanapali),
> +};
> +
>  static const struct camss_resources msm8916_resources =3D {
>         .version =3D CAMSS_8x16,
>         .csiphy_res =3D csiphy_res_8x16,
> @@ -5829,6 +5850,7 @@ static const struct camss_resources x1e80100_resour=
ces =3D {
>  };
>
>  static const struct of_device_id camss_dt_match[] =3D {
> +       { .compatible =3D "qcom,kaanapali-camss", .data =3D &kaanapali_re=
sources },
>         { .compatible =3D "qcom,msm8916-camss", .data =3D &msm8916_resour=
ces },
>         { .compatible =3D "qcom,msm8939-camss", .data =3D &msm8939_resour=
ces },
>         { .compatible =3D "qcom,msm8953-camss", .data =3D &msm8953_resour=
ces },
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/pl=
atform/qcom/camss/camss.h
> index ba3d51d9c0bf..fadba57c5efa 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -96,6 +96,7 @@ enum camss_version {
>         CAMSS_8550,
>         CAMSS_8650,
>         CAMSS_8775P,
> +       CAMSS_KAANAPALI,
>         CAMSS_X1E80100,
>  };
>
>
> --
> 2.34.1
>
