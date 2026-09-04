Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A42A377A80
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 08:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788511757; cv=pass; b=MDPeRSBNJJpcESLBP7bJ9opPezM/LbbgwslcdKzZQCbV6cmxOQTrQ4jvhHrwDAxGWrB1dB+lJuutOzyfVz4yUT7EFApZ991z4W24YXvOx7HrK0kWeVmwP0Ba8kIBsGnbX6OfzbJoydhQeTF7qM7X/2te2ElZTfwgucvYTF2PjPg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788511757; c=relaxed/simple;
	bh=3ydj7XBZQ9qjFikBAdVfbnM6S28yhAGg+f/PA2X9pwI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ml1z+IlFX5VJASmTa34ppZWwhTjGvUfJp4pCoMRERpfS2OMYrbFotveNv1yoAqxtGP9GxRZXlV3s1WdXsmMqR3q4VZnk2vVD/IrvqC/Shh/a8RZl6slZ89AXN3R1oEsVUYgS35oFh/78Lo0BCC13Stw71R4fjAUGhGCHmB2GksY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LLLWgy7x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AyLJFVfn; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LLLWgy7x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AyLJFVfn"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6847mv7h2292568
	for <devicetree@vger.kernel.org>; Fri, 4 Sep 2026 08:49:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OrXIcuGfiLa9DF8zcyadO4YQ6mRqklnE1QeIxy+wnqc=; b=LLLWgy7x5kHSkJEf
	cKUpXSkYGkLubmh33Qp1ekl3zR4KPpk8MrHnMN0GSSstVS5gLOMsisTCzd/08KgB
	+w7EE0lYZBQID94Ka80EKQSn4C7KMZH6iivHtoVjKTxEXgTZNCHq6lKuQfvI5rSB
	Mkqip1Hfrq2rKNSkjV19duUZkHXbKiqub50XxgcfzoUdl4JuPBK5cZUx8mCpyjQp
	HG+SQAgl/fdh/g/H9Eo/baAdCSHZ8jekrCA31dMZb4RwFkLik1E793hGiuMwCZd3
	e/TR77OzaVLgdZhwzy6ouWFeVJanyqRop2MboGj2L9Fit1v6dapoEftLimQsn5Q1
	3HNWVA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfdyp2t2h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 08:49:14 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c856470fe9fso915815a12.2
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 01:49:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788511754; cv=none;
        d=google.com; s=arc-20260327;
        b=BmJOVj0iQ0Zsb/MB5FpvULtahzB8VOGlH/YyiueNseT4atEXnDb6Ss/nlxek/xeN32
         HVDtrDYmCtSrIDnXVg0hjWRCsYjRtGfAiqfI4CaKEsxZOdMSbeUfCUTni0lpTf8xBDND
         Ql0SkYmrwRk3brpBEqJxVxRTc60nSL4NapvHTH7AeviNnE/b3zmoYZmvJpjKJnEpK5FB
         hu51nF5EfuJ+kBVFQCiKi8SROrIUaRdosDmkSgG9qq88tyGuwTp6PqDpSSBktsUTtHLR
         gG/kZhDWfh+JxyjmMjlhI2QkVzS+oQIdA5QEz6RRnejlDkEPf0f3QJuJkWz+2xANExd/
         HRKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OrXIcuGfiLa9DF8zcyadO4YQ6mRqklnE1QeIxy+wnqc=;
        fh=f8aYWgX9ZaWmB/QMphqCJeHCRjYZ6ZuFmMcp63DjHHI=;
        b=M8HDrwcp0w9yPGpLbDb4nbypk5RfSsFeUUwyY3vVgkbfn0U4RuXDHU19mMTCrai8pl
         Z8+Wa7UqFH6C0WelCwkyvzSx1Kl52ePEpljSEcpyqMvBoHXCvKIH3+zPC0M39SO3DPC2
         lSJOIAqBWL6/6eFkDNZouJa1yfrDoYR58iZCKN2e5cCV8q17hPwH+a5kWiJHNqCE5gxL
         B+Znt0J2xGag/lWUthUMHdIvim8wjjTHX0jg58iLnJNGXehnT9gk9l1DSYvg9k5i/Jgo
         X5SWFG6KYvsztlup3TCcesfsTgXciZMqMHsaD7282MMPwOusgiAJACm3AzhJ0Yrxb2oP
         Bqiw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788511754; x=1789116554; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OrXIcuGfiLa9DF8zcyadO4YQ6mRqklnE1QeIxy+wnqc=;
        b=AyLJFVfnSOsJPnVa2eMP9v1XYmaKZaaO171Y28gEiS7/8RvG7aasmY9GKHTgFudz0L
         LhRDYYExx0/Px2Wu6unChdED87q3wrKB3AoeQMpE9RuU0I/EUqv5EMz4na3OXdCvMu9t
         mhbQYA54zhRuuZI+9dDOlnO0FJEedi5zsAIOhmlY9PYNRhfVg3d0A9BzOgeCsa+nEZYn
         ojOn8eBE4VAX6ADmXJt649dUeiBj1IE2vezoFVhw2wD9TR3I0t2yYAEjhuB2TByUJb3C
         WXj3NS/v8ErKBoBbDDP/fTgUil+5jTa9PfCXcEJqZoInkfs0wq640zTNn6r787FbJBAi
         V/Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788511754; x=1789116554;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OrXIcuGfiLa9DF8zcyadO4YQ6mRqklnE1QeIxy+wnqc=;
        b=jhxzmjRXEkGG4DbdnaWotpR/YEYQPcuPiJrov4TKxYcDj3EF85xOTFzYc0KpDCjkiW
         StfeY4PLvwFiaJW/0BgEmJlGSRDxp9KJifn9YRD3cAulmlQE5iYwZJaty93K2dkupEJ9
         WijP5fT56V+ZqV886MNRHVOjyk1X1xnK6NYEidvbUfeNlFJ+awj4wY022k8xCO3u7WAR
         FnZdMzZGwV0L9bFyXxHNvbQuUgLeo+j5woAe8RuX5Rd0SpjdDuchsKt8OT0lW9YPO0aU
         2jy3l2HxXtCGULPE9Cl1gHD9MeUHavyAjgyJrszELfiKLezPMWKprndvqmJVz22LkZ2z
         HaOg==
X-Forwarded-Encrypted: i=1; AKwUvBxZ463XVVogKPwIuLpCdryklf/8SfF4vuvLOZH2EvKr86kN/yct7xu17qy9jz6CKoFLEH+X2Brn1AN0@vger.kernel.org
X-Gm-Message-State: AFuF++ku++ZFWSpIeNMGmrFmjsFy2sZB7Wt4JmnTwWQEi33uodl1aS6G
	I6/WJkhDzd6LVJ+3xuf3rtukKw+S0IHI2XhCqaR/w3rOx248cU2RjHUUTaz8ppB3d03eYfwsJQw
	mrXoFZF6Rwsr7p+epi52hq+s6TBtNk/k7Ce36AbjV1r86sMiM73U/IByRaZMM5cHVDfo5NDnFrM
	NGsh7c/JWBJQdQc5RD1VaNUhD+YoPkCyKLiRnXOO0=
X-Gm-Gg: AYBFou2ybTk0+VB5y39V0AuPsqmzPWheOGCluOxY1NmqngNJIfHMQ0vMJlpeOl8kNWE
	Lum9u8KtP1w4MZeCC1RQadLgkLjbqbn9781bUy1EH18ywSttYz4TD+ZXE7Xcr2glK3Gm3bp4vzF
	zJBmiOHjSnq6+f+XCfcBKzTEFplzf0b53Y7HYbEfgB38wNZs9VgVp/X0M94g==
X-Received: by 2002:a05:6a20:b418:b0:3d3:adbf:7777 with SMTP id adf61e73a8af0-3da3a066ef5mr7202839637.19.1788511753701;
        Fri, 04 Sep 2026 01:49:13 -0700 (PDT)
X-Received: by 2002:a05:6a20:b418:b0:3d3:adbf:7777 with SMTP id
 adf61e73a8af0-3da3a066ef5mr7202771637.19.1788511753245; Fri, 04 Sep 2026
 01:49:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806-block-as-nvmem-v10-0-be598b2a5606@oss.qualcomm.com> <20260806-block-as-nvmem-v10-1-be598b2a5606@oss.qualcomm.com>
In-Reply-To: <20260806-block-as-nvmem-v10-1-be598b2a5606@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 10:49:01 +0200
X-Gm-Features: AcwNN1Uv_B6HKhzdhsS9aNd75U_pKuJYfQt9a9aPW0x1SCz-kw1mAB0yNJHs0Mo
Message-ID: <CAPx+jO90ut8ZPh51BPyJLpTT5u1i9HTWKyNUWRsFdH+mD1uqgQ@mail.gmail.com>
Subject: Re: [PATCH v10 01/10] dt-bindings: mmc: Document fixed-layout NVMEM
 provider support
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-block@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org,
        daniel@makrotopia.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: vMnyiFLsKhn5hcBx9t1GP3T45o6nhS6A
X-Proofpoint-GUID: vMnyiFLsKhn5hcBx9t1GP3T45o6nhS6A
X-Authority-Analysis: v=2.4 cv=Q5XiJY2a c=1 sm=1 tr=0 ts=6a9a860a cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=_Mn6x9y97Zr2TNExHCMA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA4MCBTYWx0ZWRfX6Eg6jtkubq6h
 Jh2gNfELYk3HbEI9NB7DjHoWTC6zeQl9pkGqEgVNhnGxItL8mosOMSUA1Rh7nb2zHG1+R0wsUEe
 laPog2Q+Z+sG/J1iwvwoLjOOAZ4bvGrHArTejrsuuQh8b8vUCZBCXwjMnpPZuNSvkVIcT2XxENe
 Nftzp0fSZ6DCZ7b2bBVGq49oMk07wbF9EEWG1BRUOXdeAkqzcwfMSSG+JFpl3SGrtGGmg492jTG
 pFzOqz7rMbT1w0ghdRWWbAHxVCNP98i6XKCL8nkkwqnTADILZywwFY0K0mZQ7/8rUarmBjp1A93
 /NApertWWTznG9d0dc+71HaXZvk605FqIWd2CvSgZ3LWKzZIS/hOagnfzI/BMJ69c9TynORuhdf
 BCNnvbxpvdk0jteYENvYY2i9jR7ZTyLCHcbTPGU0wSHrPaA59ECvXRSQ4maHskeUycJrz1lBSzj
 Peb2Oru+qNMLSCagaow==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA4MCBTYWx0ZWRfX+40/Y9G0eMCe
 P0XO2SDdD9IqfNyYsfzunOjPvYeugsju97EbUxQVZneTFdAk5H+6pPE5qSJMMjByoEGu4J77VmJ
 wNzpekSO0tAsWGyAsbFfMmOXW5Fjcto=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040080

On Thu, Aug 6, 2026 at 4:38=E2=80=AFPM Loic Poulain
<loic.poulain@oss.qualcomm.com> wrote:
>
> Allow an eMMC hardware partition node to describe an NVMEM layout so the
> partition can be exposed as an NVMEM provider. This lets a partition
> (e.g. an eMMC boot partition) store device-specific information such as a
> WiFi MAC address or a Bluetooth BD address and reference it through NVMEM
> cells.
>
> Accept "fixed-layout" as the partition node compatible, in addition to
> "fixed-partitions", so the layout can be described directly on the
> partition node.
>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

FYI, this one is already in v7.3-rc1.

Kind regards
Uffe

> ---
>  .../devicetree/bindings/mmc/mmc-card.yaml          | 23 ++++++++++++++++=
+++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/mmc/mmc-card.yaml b/Docume=
ntation/devicetree/bindings/mmc/mmc-card.yaml
> index a61d6c96df759102f9c1fbfd548b026a77921cae..0422894508478c8d0ca68292b=
58a5fdbee218358 100644
> --- a/Documentation/devicetree/bindings/mmc/mmc-card.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mmc-card.yaml
> @@ -38,7 +38,9 @@ patternProperties:
>      properties:
>        compatible:
>          contains:
> -          const: fixed-partitions
> +          enum:
> +            - fixed-partitions
> +            - fixed-layout
>
>  required:
>    - compatible
> @@ -86,6 +88,25 @@ examples:
>                      read-only;
>                  };
>              };
> +
> +            partitions-boot2 {
> +                compatible =3D "fixed-layout";
> +
> +                #address-cells =3D <1>;
> +                #size-cells =3D <1>;
> +
> +                mac-addr@4400 {
> +                    compatible =3D "mac-base";
> +                    reg =3D <0x4400 0x6>;
> +                    #nvmem-cell-cells =3D <1>;
> +                };
> +
> +                bd-addr@5400 {
> +                    compatible =3D "mac-base";
> +                    reg =3D <0x5400 0x6>;
> +                    #nvmem-cell-cells =3D <1>;
> +                };
> +            };
>          };
>      };
>
>
> --
> 2.34.1
>
