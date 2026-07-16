Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA22413D69
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 13:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784207774; cv=pass; b=ewV+UW5d0wdZYYL4ndNrthAvEr8/ef7vQViS0G5S034Osp156DZ10f9WnhruMoRfIQbIxnkhOybUl2xYvanDMDAU7ilLTwe8eu9oWeRMYUvuB3mPbT0Elk6Nokm17BM8jAzooTQCoXGeZ3o5ncBfl/z17JfdwAPxbHmrXFlLgZQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784207774; c=relaxed/simple;
	bh=Ol5TzOFQVeS65ykjtuQHG5ZR3pJBc9DnPr8fJIb2oGo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kZgRde7i2c28i5YIYvOTahQNK5Firb8hAxtZ3VYx0EVKC5ltZArzcE2KDRR+Ol1KbMQMLLnD7bvDtRcv6HW7NNLXP/JQ9p4O5/On/7a1xmma2LJgNz6JwjX/c3p2coO3GpkN/C5NAVeUud5YnRL/T/BMziXnYCWmlqa2G/E3W0g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=etdCUJoj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ry8Lgxua; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="etdCUJoj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ry8Lgxua"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GBiLD92637068
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 13:16:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/B4iYT8JXNSKCTW8VLG62a5RUprb/Blp5ndsRHUBUUo=; b=etdCUJojuqEHNN+N
	LC7zqWl1IfOQeu1pdmw/8L86dAXoYxa1rzToiwkijk1PXVedZCyGrOhQVL8X7vHN
	S2Tsty08wIYj4iMy6VuCOJXXmnYl1Sgkad2yUVZQirDjCJifzDo8njSkhiwodGJQ
	F0dcRXt2KZ1aBwJqQ6eziLn/4l3mmM50QMUJGa2fJz69dM/cyZeupODdoYeuvcHV
	TQJjMgmgOfbfrmaFd6fLlkjLaWL4CylziwDxgOriJs80Qg17lzZ9Jx1AjC1nD2OL
	lsTLszOnj+UQj0EHu7IuJBRqksvcLr8dKtogLY8DPgDiAVtFt1+nE95Mqhy44OK3
	hseCrQ==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feuex18ew-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 13:16:12 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-81ebbbd60cbso64125047b3.1
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 06:16:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784207771; cv=none;
        d=google.com; s=arc-20260327;
        b=i3xhqX5efu5flsVwj70CHiiaawxLrVQqQNUnD+ymKJo4HxplM8c8I0TkUNUOIHm2iV
         NHITaPtIkBd3zjeF//YALrlzCJQM2GlhWWCFG5mVjYE0Jm6ZGUzLE9myCUYg9Bo695Em
         eINUW9H4lPnQjNgw2llnVOh+z/O2hBOMMwC6gCBSuz2hG6bHu3BT132CmWOsBsuYak2z
         ZQ3UtAWNlbGLb7sKtzDEnp1p033rMHe4AHB/A8/+mchipHRX+MoviSrZqAwDcyucSJ9Y
         M9lD/1dcEoKX9Qx1jaGM31JSP5UeO8MgVER7NMWajSZHush1srxE6x5FhPxk6E/CHv+K
         mHSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/B4iYT8JXNSKCTW8VLG62a5RUprb/Blp5ndsRHUBUUo=;
        fh=jTh3c48SGM9xzfqAC6gqN2pdmEZh8tE3tfus54/+OVw=;
        b=qhYlPF09Kyf7JC9TqgjnTkoBrgai3yl3aH4jHqkqBt9yoGvNMc5S4i3NIp5KOVoDIa
         VURpFyl3ESCDqOD8ylUHvuzKX8aPB5WYIu3taADsdJ8nrpI1C/ffwd0sQzfUFFAR/ULv
         uurTxEyGu6OJ6+dBsrELw9PXFk8CnwCm2x91J5gdsOjMKYWO5x3mn1qH9T4opxsDU5f4
         sETXhgXsQvBdiAhXJZBJJ2qzLMb+WjwrnIYtL+d8E0CD7frRaNW3p7ToNmcCN+fgjeO3
         hcYFcGXI8EcaBcKgpL9uNNsPLt52K72UO2Bm40hHOY9Z0JKiEahSDKGsXn+A+1m6XsR9
         4HCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784207771; x=1784812571; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/B4iYT8JXNSKCTW8VLG62a5RUprb/Blp5ndsRHUBUUo=;
        b=Ry8LgxuabQRErqJgcaUGUkgdudWIryO8BCxy1a72iqGAjoYvZcjaQEmH3FZbRipjQU
         4Qdug5Rq8GIfDnkY3A3bFWUnXUdu44XXCKuEKTBYYZQeNFDnQ5IRu8Tfe3j0zXlCZh96
         QhY6qa3PDOPyjmUYflgKruGgM4IjaXc7reA6nHgBUYwv6xNy1tgLFvZyvkGrjMKPSHsL
         +eQ9lAqNqcnODE2k2hoeJ+U+pamfd2w4hPOStOOP6t4rTQWZwc83ezXxQkmTloCiz8e5
         tutP3ZB/u4cuptdcLxYRMbExS3dW3hCdQrBfcHNAk7Aay9nExANj6nkWNDwJGE+hz2gW
         Wb/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784207771; x=1784812571;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/B4iYT8JXNSKCTW8VLG62a5RUprb/Blp5ndsRHUBUUo=;
        b=d3OBI9bdtaG7Y8wOa5wVUAaIVly7QbebPv2QKWD/c7vbnyH0p69lKtsVEnv1q4DuNT
         hkftcpfJeV1YnhKcM+GRJGund43OlV3WcRMKE0GsWyTiGrUoMi5n0pvmeYKTAF7NFUck
         BrHHlmVQVmaw4wPJ/Icj8xEHu+C933EZPMeykdDh0RoxlgaQl0it5jQj8v9E2ESoFOdf
         I4hUsqqYUlz2kGaFJL0t027x+4em1UvXqMX0ZrDNnLAH7hLZzBk7xKDoJJA0JAPrFM+o
         QJXaDsccQx/54sdxrZR03nIxwz07MDkdpBb7IiBusMDOlVZP7rwbnryJqscnvYLkZf82
         Sfqg==
X-Forwarded-Encrypted: i=1; AHgh+RoTMIUPaTmUb7s7fEwI7E0/3w9/8tMtGPFvD/5ja0mTP1QrifOwDwGBC1YdedxSbvnQFTqwvPy3gc8c@vger.kernel.org
X-Gm-Message-State: AOJu0YyM4o35sCEPS1TNJkP7f5dKO2k7QM2pdfiILEGwJqXwVSatsaK3
	4u7sO34vQAmHGGLo9+g9LeMU0RcNXxEs4t6YbLQ+78eXLuLSiFhnbFOM+CZqEc5dXImvrDW/y07
	CG+APioTC2LOIHxeXRh5gVRTEXtdWPL8T5FTopB5vS503PPBtWh5kydC4Da1RFtrLTesNERTECY
	c4nEw/kai7HgMvigjofbgCiAANT9soChaSNwZrglo=
X-Gm-Gg: AfdE7cngqdhMoG8EFT/sU1Qz34HtBOWeSluI8XUIIyZXoLm74osv6oOMO6BOVuwyLKJ
	HtLyEH+eNgE43+FqV7hHqo022568tD0UuliW6tOJOMQK5P/m8evNNC/w6MXgF0xpauR5a/6cSQQ
	KSDMKAQcRkEAweEm1BcLxcFdsdvb5Dxo3XycsFwIUUaDgnopK8HvjHjNgIPg==
X-Received: by 2002:a05:690c:6288:b0:80b:e6ac:53dc with SMTP id 00721157ae682-81e900612bdmr164983157b3.23.1784207771394;
        Thu, 16 Jul 2026 06:16:11 -0700 (PDT)
X-Received: by 2002:a05:690c:6288:b0:80b:e6ac:53dc with SMTP id
 00721157ae682-81e900612bdmr164982837b3.23.1784207770812; Thu, 16 Jul 2026
 06:16:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260703-block-as-nvmem-v8-0-98ae32bfc49a@oss.qualcomm.com> <20260703-block-as-nvmem-v8-1-98ae32bfc49a@oss.qualcomm.com>
In-Reply-To: <20260703-block-as-nvmem-v8-1-98ae32bfc49a@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 15:16:00 +0200
X-Gm-Features: AUfX_myXBBNTUmTNQa31CjGyXdLn9Tj5Tha2CpRf0CSZBFmIzb05oixLNDBVxEo
Message-ID: <CAPx+jO_6KcZyp=4HuJqnYY40VKt1ee+si0BEpxUE+1pkMFtvCA@mail.gmail.com>
Subject: Re: [PATCH v8 1/9] dt-bindings: mmc: Document fixed-layout NVMEM
 provider support
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=JeeMa0KV c=1 sm=1 tr=0 ts=6a58d99c cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=j8101uY4z0N8CqeLiEEA:9
 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-ORIG-GUID: WCuuUUFEZNowuGaR5bMI2ubhKNEjFZ6A
X-Proofpoint-GUID: WCuuUUFEZNowuGaR5bMI2ubhKNEjFZ6A
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDEzNiBTYWx0ZWRfX6WEMDjQ1B7Ip
 ak1qO3iRK1hHb7OE1z/ONC1ezlu0aGEPwAgUzaFsw06sJnVxLe0pilHsbjFw5tFDAW0Lk0jvHqv
 13ksYyABsiTspJ0sOF59zbIJvDWaffA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDEzNiBTYWx0ZWRfX5u6weBpBny0m
 4/8LKUYVnSIdyfgzz734ZhQJZT+cG2SP9bF+Eo9E/TpmWWEUiwFe6b9uYRQvz1mlzdSyvBOL5HK
 WXNrLgpZGSRSMM0Bb8tfS75h+EwPeRBfiT4qfu8CwmLy66vni7/zqKI8R4CUXEt/CLnJjXAGhAH
 SjZArWkwDx/95C+MnC8OVnNKZGFeC6IUp1y3yz0EVnYfprhTUiexu605pYZmDSb5ugazlMaiN2W
 tNsLJV2zMLb29UaNBLo2x6z+kx7x8O6YK252U75qb8h3sSMA1FXmpL2TBvPfSMAqR9l6LOCYOM7
 1o58hwxatZDOErTbNZzk4rSoWM21Zvc30zN/6xDHhEXR3iy3c/xUJAPEqalgADlMJDauYL3tuap
 VJ5hB0NppnFwfC/cHOJsp2gNJ92v3M5Wpq9ZDNbt2jnPazOU/2nf3EsQDzH6XHIgNQ9x0gcEVG3
 6hLHk8O+hl6TFuy5/KA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160136

- trimmed the cc-list

On Fri, Jul 3, 2026 at 3:45=E2=80=AFPM Loic Poulain
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
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

I think it would be nice to have some version history here as well,
for next time. I noticed that v6 was reviewed and ready to go, but
then something changed in v7 as those tags were dropped.

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
