Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795434958;
	b=Jh8NaF5sKH0rdXx/4bE+HyuW1d5Q6XA3O+vhZNtNjqkQy8J0WPgGrN+qTNmsu8wQFNqh
	 uLgmflMu4eOwt9oj937Y0E/MahkrUTx9Fuc4gWBB+nqYtC83fKZNtNIJH8qOS0d3R8pjn
	 RbzbqhDYKtNDBgjhdJ8MaxTHcLhiZN4TPVAztgifqD8rcuLhZ+GFEIn4GUG/doGrotu1p
	 CFfBtXZvI85I3qIWsanmMzbf+WNOsdydk/cr7Z3/s5E93KFAHSH4YXbFudC5D1kV378op
	 pTeo7xCUSVIYdK4rivu0NY1tgm0MGlqEcxxijmcPrv9oI/+n/VaHSCCZRg18q8/9dGA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795434958;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Hd2gZTqfmiccN7JCAY7xzbxOwBDTl0afP5b0LLoatco=;
	b=veUrjuklzmLa/uXH5s0xrA3sn70xHGrsySHVIvvBG+MzeOW0DKNBBEvmSYtr6O+E9QwG
	 VCJisAByiEZ74dzEyxBs11SJnRyZhxc6eL+7MztjTIVDmKYHHSwfMzxlNTgKS2qG4BRWv
	 3/WieC679IL/Jh+tHS6wqhVLMFRCdliwoGwV7lFMYPqegt+tt1TJCKyXOHOloHMz6Y996
	 ue6+DYIiSHZvqllY9Hxg/nixMNs/00sw3264a+VPrT0tTBkFmu4dZvUnEmi58mHMiOLkD
	 xGsl/gBmppsyA8vG1Z6sYgLRe13wKMWrP2vWx1yCwCL+ZtrFq5rMoty2Zo8elqjvalA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YgSwKQS3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JCR73BE0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44205606A31F
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 11:55:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44205606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YgSwKQS3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JCR73BE0
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9G1mP1899220
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 11:55:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hd2gZTqfmiccN7JCAY7xzbxOwBDTl0afP5b0LLoatco=; b=YgSwKQS3SPovgQxN
	GUmINrmPXDWGKW6q/ioYH0ObUPIVX51a/+TwH7Njh45HmrwWoo4cUva59RqEoz3i
	tHzHZ+PdKTh8sVbrg2BnL5olufnr+T4FKpWHWp4MQwDwENAeCulBVJHBMXv/PYVT
	opFWwysZ+KmyuiIC8nQHq5c9ocdzxnbTFwYGwGNzm0HzLttVBiX52PzeRH3g7yhX
	K/G9PiwiJxch99qx6zW4uPiX5bcvaxYzGWyaWtzazNp3cU5gieqIQ7jJ9oLDcRTI
	L3JuFXAtvn/KdW+dwvns2cIvmsT+WZhWRqgsDp5AP4OaTUZ3C3/XpsShQybdiZnZ
	yg8Fxg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1k18h4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 11:55:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-94960bd17b5so543550785a.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 03:55:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795434954; cv=none;
        d=google.com; s=arc-20260327;
        b=CVSxn3IwZSqTgXEd2PgWaTj8F7hPoVUoIXDyCXvXZu5iyYNn+cG9okmiONT8hzV/L1
         zWo7Cqtpmo7p2WckeYLX81zng2KFCyC//razjx9ruCccLpE3S11eNmnEkzhjE4ZZP1WW
         MHpeMI9lHTMg8mS8gqhf9cOm+ClZcGZNi8+J+5u56p8uaLkFfi/2Le5PsTLhALud3Ega
         YdA9Dahi4+3Efszo15gf5l4uxTbe9mslbqSSlGJPCO6BQjsjyQmNcIsSTuipVKn9es7u
         cwOZNc0Aww1CrWlEa4HFp0y9PopQ6lfNK8yYfuctf9xYu47Fnutozhg3uzxGKtC2EDb6
         5iPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Hd2gZTqfmiccN7JCAY7xzbxOwBDTl0afP5b0LLoatco=;
        fh=elFpG9i9olvVufsNa3OD6uRNuVnxd4BIPQvVNCLF4yQ=;
        b=DnfKGwtFPj/k0CZKz7mrl5gvWvCSzbsiWJvuFseZMUs4f3etLQ/l1pnd4dxpbixU7S
         40nb8Ugiufps5ul/BzcfIJ9f9qiiI3V0C4xVTMc+r71U3S8rmvDYJ8FhzosP7PVDfcWH
         eMPE85bqbowNCyUq2IM3fQnSamQJ+Iqrly2Bk6AY73O2R12AY+OXd6mPyfMV0AbdWYiQ
         x1vwDx+pQi8poVY/35YhXFCudSu2uKAzEhe/olRQEMtvFatjCHG35tw0zpwCUY0tJhBv
         2tAds04t5PYAYzQO05Re25AVJwR4oSL6oSgkia3yi/m38MNFnMi++wJfFKfBWxCMGDhb
         0DYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795434954; x=1796039754; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Hd2gZTqfmiccN7JCAY7xzbxOwBDTl0afP5b0LLoatco=;
        b=JCR73BE0OGo9DDilbWsp/GyyMFZupxVJaH5T7/HsEMTauoI8z1FqyUUyYvhpGOdMs/
         YQmUquYDr52Ivxj2z09Tp+0KPTZl5pUjVlrgv3Q2TsD252NNet8UBg7wAZwypEEKvFiv
         zOx/aV8qLOXkF+5vYNAHCO7xHXXv+g1HFjLGDGabnmWsT9k9pdsn5VxG4YvZ5ScGx8dz
         hRRvNgPAlw9HzL/7/xcDYRcLZ52AWmNJa5ikTNDUy5RJmQZS98PTSLXQwbmeXPz7vpUN
         MQtlMfAt66MC85OeGESHWLiXF4pbgRKN/bvkHlEgGdh4q54ekWL51EW17IWxQxmcUQOS
         4MsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795434954; x=1796039754;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hd2gZTqfmiccN7JCAY7xzbxOwBDTl0afP5b0LLoatco=;
        b=H7LHLvY/rNsCRXYVmR6Lki8DklWTLEjWW2TvXW0H8QvzwJD83p4KNtei8ssue3DCAX
         aiEFoKPOhkdDkgsj/1E3Oq6B7kn3Q4AuIsyc64LAZ7GzPEiiZmSD4+js999pgmi2/wV+
         OCL9NCrMOGZf0Vxu6VLo+3YCI1nlaBWLfiEb34kbrpUlg4a9ukzepbcu/VYfnZNzpTJR
         KpqSuvaHWOP8iS4LlcMO/xhhMFle4ycB6JmI4gdQx3abq8mjKopVJweGZsyX2lHf7ftX
         1iiE4hiidvjDYVK7/OnS+ymS9Xl12E7OYyif7y5F11YtWKLZwBUvBrNexBU58iofg/AG
         vwjA==
X-Forwarded-Encrypted: i=1; AL+hErFygehQniLZJ+kxm1YNPHP7pbseVHYJNnI8KnEGCe1jSVsOf+4hZk86Z7Y3k+j0u/FtKQwyHVBxQ9Nl@vger.kernel.org
X-Gm-Message-State: APuU4Z9WKQb7+A1jy/3FWiQp3suZFQs4+rgV11HK0mDH+ym1C4p10r3A
	z/5eKo6iBEzns2x/Bh8cPl2ImhVIlzxM4A8rComPhfbirEixTNTbPz/fa2JIX62Cs499tLx/0Gt
	9QopfVFiKVDVl1bfezgGhTcvpLHvAUVzQOQfF+/kd1J46+jfwJ/cjpFNKd+yDtXHm+SFY+aItds
	+SNteg9sgzm6e6LiYYt+YwxSnL8KRYvHyWZL6EpoQ=
X-Gm-Gg: AZFdTZdYE+g0StjEWmMMXxY45wq3MBVLSQBgiXLDDrAgfLRVDtRrfny+KL27Jd1NRY+
	IwgP/BBEQNDWwMxB8Ma+ihdX9N8Q0Ndi8+Bh25SLR1DHn9dLMTDlYcOYACnBl2lcnAtKXk1hDG6
	P8DlM+GARXJrrsN9HKP5cm3e90NtRQ91eZZl5f90rWdtE+xayNKWT5Vj5poG0yluz90mgQrIHU7
	3ENAAPhN5iJzQJ5fqmBpHlU58S3NWc51cFlXnncCC4iwKG58sOgM5G1cU+bKhLyfcUcAVMidxnt
X-Received: by 2002:a05:620a:3710:b0:949:a6ac:cc1c with SMTP id af79cd13be357-949ba9d4cfemr1741029085a.50.1795434954529;
        Mon, 23 Nov 2026 03:55:54 -0800 (PST)
X-Received: by 2002:a05:620a:3710:b0:949:a6ac:cc1c with SMTP id
 af79cd13be357-949ba9d4cfemr1741026985a.50.1795434954035; Mon, 23 Nov 2026
 03:55:54 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123-glymur_camss-v4-0-d7db74f59e22@oss.qualcomm.com> <20261123-glymur_camss-v4-2-d7db74f59e22@oss.qualcomm.com>
In-Reply-To: <20261123-glymur_camss-v4-2-d7db74f59e22@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 12:55:42 +0100
X-Gm-Features: Aa3M54pzaN1MMD5e1zJKHe9DPNQOJ_Dbh-NSm_ScNAiRKuU9oPpZJY6F7RsVn6s
Message-ID: <CAFEp6-2EFh=gEFN7-ot+dYKjigm-2tdKPmKjS3_irCq9BPSATg@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] media: qcom: camss: Add Glymur-specific resources
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0NyBTYWx0ZWRfX3q69nBTQTu2+
 rnKw6RnGLgbCfhvWXDm4xAYKQPUIgymBCE4s/hRu70xavGolEaGNukdJgn2PstRa85XLKvMVWuT
 v9U5Xyg9aZVCD44UpeR50YoJxsY9A8Y=
X-Proofpoint-GUID: 58e3xEPmObxCDvRCCQlvrPw8LsiFsl8Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0NyBTYWx0ZWRfX+pEhxplAzHsd
 Nd6Q0wTQEJrJz4/HLF0+/y0+Xtj8FupIaMf4zCvbnJg9beRSMHduUwT1hisWZiSloSyFDL5kFXF
 xMDWMjcGdDvlBBoSGjyVen7li6CmmRYAt4LlsGPGB8HeUQDpCSAfCvf2u92lUt8dtJrAZU7au7y
 TrEe/ZBg9ukeSCWQb+2ywJjwuFiEtGexLCkErv0ODCDLZRbAFNtWyNxT2fNkhjUcGJRtjlGMIdU
 628O5vs66nWwnDZcHflC3byv9W40Gmr5vbELjS/Zdi1pAxovnQwvVZp3LqKFWnPYMyrPWZ7pxFi
 993BIDlGKGjLU1K+3aD3cVajaB3Ms25cLmiXiFT8uiOirbCvx6DRqs8BzI+EYNmB73CZoHiHcZF
 zny9ejLOi5sQqywsaEoTDxqik2xN8evxjj3133yjrTf+779kVwdJPLm8De/OFWYUfPPRAxrUaRR
 M0Y6Rq4vJQNG/jgybiQ==
X-Proofpoint-ORIG-GUID: 58e3xEPmObxCDvRCCQlvrPw8LsiFsl8Z
X-Authority-Analysis: v=2.4 cv=cpIOAF4i c=1 sm=1 tr=0 ts=6b0429cc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=FShq8-UYHVsJhsOZGvwA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230047

On Mon, Nov 23, 2026 at 12:36=E2=80=AFPM Nihal Kumar Gupta
<nihal.gupta@oss.qualcomm.com> wrote:
>
> Glymur has three CSIPHY instances while X1E80100 has four. Reusing the
> X1E80100 CSIPHY resources also exposes CSIPHY2, which is not present on
> Glymur.
>
> Add Glymur-specific CSIPHY resources for the three available PHYs while
> continuing to reuse the common X1E80100 CAMSS resources.
>
> Fixes: 09d6c30d3fae ("media: qcom: camss: Add Glymur compatible")
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>


> ---
>  drivers/media/platform/qcom/camss/camss.c | 42 +++++++++++++++++++++++++=
+++++-
>  1 file changed, 41 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index f8e5cf9f3ff09e96d3b48cd5628489715385cc5c..f3cab9ecef04273e09b81ee0c=
d4e31ca45d1c915 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4103,6 +4103,30 @@ static const struct resources_icc icc_res_sa8775p[=
] =3D {
>         },
>  };
>
> +static const struct camss_subdev_resources csiphy_res_glymur[] =3D {
> +       /* CSIPHY0 */
> +       {
> +               .csiphy =3D {
> +                       .id =3D 0,
> +                       .formats =3D &csiphy_formats_sdm845
> +               },
> +       },
> +       /* CSIPHY1 */
> +       {
> +               .csiphy =3D {
> +                       .id =3D 1,
> +                       .formats =3D &csiphy_formats_sdm845
> +               },
> +       },
> +       /* CSIPHY4 */
> +       {
> +               .csiphy =3D {
> +                       .id =3D 4,
> +                       .formats =3D &csiphy_formats_sdm845
> +               },
> +       },
> +};
> +
>  static const struct camss_subdev_resources csiphy_res_x1e80100[] =3D {
>         /* CSIPHY0 */
>         {
> @@ -5572,6 +5596,22 @@ static void camss_remove(struct platform_device *p=
dev)
>         camss_genpd_cleanup(camss);
>  }
>
> +static const struct camss_resources glymur_resources =3D {
> +       .version =3D CAMSS_X1E80100,
> +       .pd_name =3D "top",
> +       .csiphy_res =3D csiphy_res_glymur,
> +       .tpg_res =3D tpg_res_x1e80100,
> +       .csid_res =3D csid_res_x1e80100,
> +       .vfe_res =3D vfe_res_x1e80100,
> +       .csid_wrapper_res =3D &csid_wrapper_res_x1e80100,
> +       .icc_res =3D icc_res_x1e80100,
> +       .icc_path_num =3D ARRAY_SIZE(icc_res_x1e80100),
> +       .csiphy_num =3D ARRAY_SIZE(csiphy_res_glymur),
> +       .tpg_num =3D ARRAY_SIZE(tpg_res_x1e80100),
> +       .csid_num =3D ARRAY_SIZE(csid_res_x1e80100),
> +       .vfe_num =3D ARRAY_SIZE(vfe_res_x1e80100),
> +};
> +
>  static const struct camss_resources msm8916_resources =3D {
>         .version =3D CAMSS_8x16,
>         .csiphy_res =3D csiphy_res_8x16,
> @@ -5806,6 +5846,7 @@ static const struct camss_resources x1e80100_resour=
ces =3D {
>  };
>
>  static const struct of_device_id camss_dt_match[] =3D {
> +       { .compatible =3D "qcom,glymur-camss", .data =3D &glymur_resource=
s },
>         { .compatible =3D "qcom,msm8916-camss", .data =3D &msm8916_resour=
ces },
>         { .compatible =3D "qcom,msm8939-camss", .data =3D &msm8939_resour=
ces },
>         { .compatible =3D "qcom,msm8953-camss", .data =3D &msm8953_resour=
ces },
> @@ -5824,7 +5865,6 @@ static const struct of_device_id camss_dt_match[] =
=3D {
>         { .compatible =3D "qcom,sm8550-camss", .data =3D &sm8550_resource=
s },
>         { .compatible =3D "qcom,sm8650-camss", .data =3D &sm8650_resource=
s },
>         { .compatible =3D "qcom,x1e80100-camss", .data =3D &x1e80100_reso=
urces },
> -       { .compatible =3D "qcom,glymur-camss", .data =3D &x1e80100_resour=
ces },
>         { }
>  };
>
>
> --
> 2.34.1
>
