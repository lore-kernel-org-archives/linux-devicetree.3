Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7439C49EC71
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 13:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790343311; cv=none; b=L8LUNKoKSxXn/MtpvFpU7dL+3+86f9Ht9wgjqV13lb9bzDGAsjIFtKLQvoDeyPLD0ZZ8pbV8ll5atd0QEjR1lsGwWzVKenKcubm3Bm+l9pZnCxfJ96TOYwN1a1hbgvwXCRF31zIP0gfK4gSl4SANrmksRPIpbT8e348T7aCOP4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790343311; c=relaxed/simple;
	bh=IOkG2JYiGgUbv35FbpodpbDiMFbkHvb1Kn+5txFGbuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WpZ7ErKwiiWWMsYBH+7l2erRNJnXPsdDb92Z5lKVDOaK5YHmerB5Zy0078euDQAGGKV/a9+0pu/fnsGv6QUYOKd2uGlHHA/LZ5jj/z0N1WBUU4Io+1G4WfGIcBiQ9OGOJQCKnHX/02KhZsvhv91cLZpUV0O78nTJucjfAbUXmU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cjsDA7bF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PtkAl3RE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cjsDA7bF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PtkAl3RE"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P5JEQg3627530
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 13:35:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0+9Tf85hFayM5DW0EiV7Zj89
	MPJK1Rp1eAzmngjUXtQ=; b=cjsDA7bFqK3OHd+oGx6GAVOUEGYvD45zm2KvFsgG
	0YJgRhVUrvSXbjwEwPpPXtpuzwLniqci+ZmetujF4r4xs7MiwmYeLf1NUel4IesJ
	+FL7k+IUFqrO3t5IiHjVJPcD5pDGMWrEY1b9sY9q0GFbHTZh86GLxRc4KPZeAAxw
	AAgIc1K4kxHxmRHRJBuOjNSf4+knAVZ41g+5deen6K/0nGWo6IAfIpkBQsQyLRxo
	fUusKd20SxVunv1Yc772EBMAzBI9yYe7eybcvh3Tos4mm+f6cYYKrz3IEQUAdzRK
	32UpZdvvKCIpprt7MvF44BXuj4JqrZYzLXjHEVy214Zxug==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjq39hpj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 13:35:09 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939c30aa9a0so95030085a.0
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 06:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790343309; x=1790948109; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0+9Tf85hFayM5DW0EiV7Zj89MPJK1Rp1eAzmngjUXtQ=;
        b=PtkAl3RETXLrH0d0PvJRcCwTiyiLass9X9KDTIuotIEB7mWVQPGBOnQfLnaatT7pey
         ZOa0cwhuTCtzmndW6KUx0/1QQmSGQit6tD+cqkYVKkii9p3g5SGWq+a9nayVSaVq+wcC
         S0xCUjO0489n/Zmkoo87mAEgT6220oK2+wnkbCx59Y3gUH2SC1uDNrrmJC7RJcNnV5nY
         TQCUoUSNClpaRvLixXScB8aEmJFgbwoQlXB7ebSzcmgC9CA1BXRNTdVjvHLjZ66uqs0n
         pHqV1Ojbc+i26pbhywn8Zxb5PJuEMXyUAzwOBqAE96+mK1FrbrM8YO7ujER9iw+hO3ju
         qNjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790343309; x=1790948109;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0+9Tf85hFayM5DW0EiV7Zj89MPJK1Rp1eAzmngjUXtQ=;
        b=vfwlnBljN2SsE4heTtl/Jts9L9VeQ2o35dlxm68WdGh2uckhRLorY1D4cbxRjvYwqX
         OU/tdEqsO8aFh2j84LPaJO2uRLPVjxnXMnCT9IFlHZScHuo8bLHH1GkSUnut8JKOLTDF
         Wwq77VlXqqqk8XEmfzP1ZbcvYX6obZl8v3bPqIgJQEMtRbD0U03pD1LRbHgE39dzpNnY
         4UpP25n72eaqnWLEGoSWkR5h29a2tT/eq1Z+6M6KbBOMatOlWJ7kVvlKWZK1Q+u7DTov
         g3KqBLvctcjfwLXnW5IuNrC1kIKYEu8QTk9IGH30o8cWWbkNfEwY2Nk3Saz99vTo+ZKR
         FRnA==
X-Forwarded-Encrypted: i=1; AKwUvBx+XbdoeMSguiCsH54iuC954QsYPzejAlRmB3qVcNioXR0wkg9O44Ku3bBrpC4yra/uw9BMkFXlJEd1@vger.kernel.org
X-Gm-Message-State: AFuF++kYDTeFuDa7V8PNLLxZOMS75NECtqgr2hKRIKsKQI0Mr/H6ASOk
	/3oDRGShiaLz7VaCrJFuvwOUPy9gQtkPgWCETj/5IupQ1gkkfnVvUaOsnWPO++hkoxr8G3itRdh
	bsHwKaAjf/rhmrE2eqZAHjkmcl3rD+JvZhrmR9jKEO6nXWbp0IN+S3vUdcr2e19Mf
X-Gm-Gg: AYBFou2RR4QcQbacLqlSPFsbr23thXF1SeooMaU4ixF3qJorvEniQX6OxBcsilYFSM6
	q4MqMdjmIGFD5Um5x/OQD01fh/vvDjLA5Sr57giLB9ySXK5LnuEdW0Fxxigccs0POwqXoPA1cWK
	ZcdUwzrmomfRETldKx7Wc1zfGdUITtYFFxkyijI51irNdEfc6XxDEucJS2a/w0a/FbcsFsGaKnJ
	BuBLsbT7q1L8eGWj85J2vmk70i46r0SGdSZjPuAMAEDhww8GCKMepgtcV0TnoA2b3PAi7zD0si8
	ihXQAIVjO3lsWP6JdRjv5Ahy/mnb2b3jmAvYLWEssEd6lWPWYbaI6fitukk5KsVi2JXXtZiecMy
	1zCV0m1+ifEMVTA==
X-Received: by 2002:a05:620a:371b:b0:937:7e90:ecc with SMTP id af79cd13be357-93c43bf241cmr483149585a.25.1790343308405;
        Fri, 25 Sep 2026 06:35:08 -0700 (PDT)
X-Received: by 2002:a05:620a:371b:b0:937:7e90:ecc with SMTP id af79cd13be357-93c43bf241cmr483141485a.25.1790343307700;
        Fri, 25 Sep 2026 06:35:07 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a6450a3sm6569501f8f.25.2026.09.25.06.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 06:35:06 -0700 (PDT)
Date: Fri, 25 Sep 2026 15:35:06 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Subject: Re: [PATCH 1/3] dt-bindings: phy: qcom,sa8775p-dwmac-sgmii-phy: add
 Nord compatible
Message-ID: <arZ4ikxuE3p9CfRz@lore-desk>
References: <20260923-nord_ethernet_serdes-v1-0-f8ac1c487882@oss.qualcomm.com>
 <20260923-nord_ethernet_serdes-v1-1-f8ac1c487882@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Wbcqu4ESfEJos+9j"
Content-Disposition: inline
In-Reply-To: <20260923-nord_ethernet_serdes-v1-1-f8ac1c487882@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA1NCBTYWx0ZWRfX1nR1juO0Qhpj
 JaAtwmC6wZQ/vDv0CECOFJKUmCoq0VDkGp3pveGdI2ez7oCOs6ObG4MBX/bg3Mv9O595O6cVSKK
 uvNo137JERd/95nyWU2yOYpxTMRBiK0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA1NCBTYWx0ZWRfXx/kbzdAJKPC3
 SydQJ4HYjipHiD9mBFV0FNc5Cbc/Se/IjdaK3CJ+/xXEWvtkFO6Fo88+s6SiNsZqgqItVjAnueq
 1q7k1zA1WkmYKpPwXeR25NpnzCURaUHrXmkZgyp/FZB4zRriyqXggCcXUxztZu5MNhcMzLl5e+5
 9Aqt1JKBCoofOv7CDHAUqvsDN0PgJaQ+bUoBsZvh1018iDsEluNmxlglR9HZgdJWBfmQY2Vjwsu
 La9mmk47flrXtwBqnl8fNKxmNPG0PxsLs0dKX2q/KS3lW/gUcnvT0DZu7z2BYbdlzIWUqMiRL74
 jR9+dgZW36KEArLcD7A+T50+yOAlmwRfZCz3goyyWutz+fbcDm9AV1ZEqOPx1RpxI59n6EoObBm
 lXZDxIOnEP/EKnNLMKZg1QUF9E33+4jW9lr5m9GIKmvmmoWUYbAMeg19zRXLX79QUtiL9xtqL0l
 X6hnBKG2yniAkAOEIAQ==
X-Authority-Analysis: v=2.4 cv=VuO2kO2n c=1 sm=1 tr=0 ts=6ab6788d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=XuoYqDaM_I_laROpC8QA:9 a=CjuIK1q_8ugA:10 a=BlIz-W2qHe9yj-0B_l8A:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: guq2W5p5qDvUqgHR2YUV9LKOXTr13Ug_
X-Proofpoint-ORIG-GUID: guq2W5p5qDvUqgHR2YUV9LKOXTr13Ug_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250054

--Wbcqu4ESfEJos+9j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Add the qcom,nord-dwmac-sgmii-phy compatible to the Qualcomm DWMAC
> SGMII PHY binding.
>=20
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

Acked-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

> ---
>  Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml =
| 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgm=
ii-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmi=
i-phy.yaml
> index e573abcb937df914ced25ec87add7955bbba7b87..f2df9983d9536654e838bae4e=
1e23b832cdaea3c 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.=
yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.=
yaml
> @@ -21,6 +21,7 @@ properties:
>                - qcom,qcs8300-dwmac-sgmii-phy
>            - const: qcom,sa8775p-dwmac-sgmii-phy
>        - const: qcom,sa8775p-dwmac-sgmii-phy
> +      - const: qcom,nord-dwmac-sgmii-phy
> =20
>    reg:
>      items:
>=20
> --=20
> 2.34.1
>=20

--Wbcqu4ESfEJos+9j
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCarZ4igAKCRA6cBh0uS2t
rEj8AQCvog+D/EGZ1bBhQzHnuSy106/aNlu3Mkje9Z9B6bRv4gD8CYovhF1C/+kv
cQcO0DZ9od/rY0vDBhjipvCfqcC+TAs=
=pLpz
-----END PGP SIGNATURE-----

--Wbcqu4ESfEJos+9j--
