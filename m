Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B88463B99
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 13:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785850993; cv=pass; b=uAhj/uCdWbpbDLzZKKlBuES9rP4J8mU80vkkbt42CBWqd4lzHJ5PayXRNRY+m3NPtbHGZKrgXtXlmeeoRaxw1PPWEqcWC4iFXgiP3+kQLWMjqFgjd1vVLi3NdDSAvMapelmIz4Wo6I0XDodVdxv6tAW7BnEuBDGinj96XhO5naY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785850993; c=relaxed/simple;
	bh=Av355PoOiQqfN+lI28kxuagN2wHx9snA+0ylF3eg6GI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HaF84cL+wIhlS8x4l0LuEwBKwxePkvqghxcs34ovFd0c9JdBKFVvUVP/PkMENOiegQYZVDXq6OPq+K8GkfQ5q0wJuBV0gwPzmIQMP8+vTjge2xsZ1109IrHoiHv2NeC+Ih+wGAS15LXFCZHWulHOMFJWz6zXihXUjJEvcfTbr50=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gWSqX4An; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bDr/Xi/9; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gWSqX4An";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bDr/Xi/9"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674CWvsI3211633
	for <devicetree@vger.kernel.org>; Tue, 4 Aug 2026 13:43:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QWQr/x5bEL6Unr8s/2mTIOitfI4p3mr1jrf6Pl+pGJk=; b=gWSqX4AnlEtpxj6Q
	Kolx19zNihtI79jb/u5x93/3RIRF/ynzmhH52E2pAWDlIG40klO9F3WYrDnNecrA
	Mvfb6nxJuTNXh4JIR0ajkI+lba7CtsfsM09qOuD/mdptyX0Fkf+w5a8+m+IWObVr
	aoTJeUXIt42+xRXjKmsCzTEjliHe6lqAV/6HQxo0H/0HTZTXYesd8+gx2QHlfItC
	Uew28HCg6lftgQb+cr7Mj5MnfKzClGCf0NxQGhPFOyFFZNWAElTdp0VHyA92Nsf9
	Dys7phUWfnLavtU7rZNonD8m8pk88xbX8sSZjkD/5YryOFt+sg1FIwW31MLvK0VZ
	D6JX7g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fud23h2p5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 13:43:11 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8ec3314f65fso45653536d6.3
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 06:43:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785850990; cv=none;
        d=google.com; s=arc-20260327;
        b=pzra7kjH6/H9NfwTACOK0CN7RCAhEelAAsCOuys7EgGPIuVFj+rw2M2u2RAOV/MJpN
         fg6V+gSNU9UzDP+n8X0PYIEMNt6PBGRMo/bPHZhNFqtAzgqlROlx9OgWTOnh+BxXl3sW
         jcBq6ECH83Hbj/QepzRm+E5/ic9nHaM6dd91O7JFKhvkBuPdV6AhpP2gTop4BfgffNdy
         qsJJzcHd4R43/1+fjkWyC5ebDbJHlAt2OV4EmD9ExkJxYUyz96Q+jQ2W6FKbJx7oPDnn
         /XN64i/7T0HCXS52WPhFDtFlNtaojc1ZA5MPU4Or+qRL5WSKYz3MWCdEjQVkhi53Eq+j
         8OZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QWQr/x5bEL6Unr8s/2mTIOitfI4p3mr1jrf6Pl+pGJk=;
        fh=5iNW7ohaNC/OB/mkZShDC1UuydZJXNHVT+RDU9gfY8c=;
        b=o213iw1qlBKg7P792WGcXcTyNrJkKVEVn+FCwFv7N60vVw9wQsXFKzLAMVy2HRw7P0
         hOlwGWK85BFEhjJ/+gSHf9lFZ0st+52WQM4qNJY8YZHGZNYmoOCOZSjaYvVEz7N+B929
         Ry81Hp03qZthP0vKNAv/9xu88sgUUSOhdh8Pext/VQ9pcYXCGG5lvHDRnWmiNLkJO++I
         hBtJSq7pCOiWR8FszWid3CWEX6WZ1+J/EoTdyFOa9772q2f717hQoi9qMzhVFdV7U0z6
         EvMnNZLvU+G8e081v5PBUPtPMWY/GHMjrtVWbzjdf8RvQmB4A3+4BiqG1C2qEef0SYzx
         PjJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785850990; x=1786455790; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QWQr/x5bEL6Unr8s/2mTIOitfI4p3mr1jrf6Pl+pGJk=;
        b=bDr/Xi/9dMLJ6nTEd7f8WqFIfnwotYVttFcpEictxgth06ojP2UQkfg8eH8K9oOCdl
         uleDltT64u8jV8ggoZKORHG310PRp5M1KL66qCcheB6KaCE1q2Qch9RhMk0C1wJIH6ZP
         OPv7lHKDetulTCOAlSsQtdlG0uT7ynxod5m+7YIbNqVKnEAMAVnrqHMwXA4fHXKzBaXt
         TRtcPCgO/Cl/Ai25FIhbu0+9Km4+8deGollP9kAcJuBNpMcfqUBoLF7SHPqfAivPRlXj
         rS7jvv9AyVHAmsuHfW75PX+7RQTOzYmkDKxokokI6PV1kkHy7d8unIfo1x/dL2TVyujX
         GRNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785850990; x=1786455790;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QWQr/x5bEL6Unr8s/2mTIOitfI4p3mr1jrf6Pl+pGJk=;
        b=fx01tP4vKdjhYkCL2w2huGIVQ1ekIxwazQzYVoaAz1bC8P6q9gSpi3+we7WgB+q0oO
         Y8S8HPgakAmPybNmbIRFsD9jNodT3KqhYJxuXkSw4vlhBnVdVxvqWHzSjeaX7LzfJiit
         aGLCqtPq2W0UqN8zubrkVLLasg/hZqrLHLb9X9OLLSlYHwA7pBZMip8OjWz4wk8O44YG
         /UKLDHVMhcXcawPvGN4AYigGxGBqmmQaGsAk9N3+GJjlb2ZJowULp6kFq1pbdDpTzwxn
         oLgx2p/KMZOLLiY7ApjNSR0UZiYW3EVk8Rc6CA6w5z4OYs3MscIta4eKzD96s3nZbVXZ
         IOuQ==
X-Forwarded-Encrypted: i=1; AHgh+RrUEvnb/4Okg+M+xEfVEH/kSLwGj8/ci9KoSeGT5qq5TLd68U1DkAH2fqR9e+dY2UJGyCjusZ7BoJ3Z@vger.kernel.org
X-Gm-Message-State: AOJu0Yy93cp1wp/HZTsXrQGEEQXWcsoaIPwGouc2hFYvzDhQsuhdUp5H
	Q9Tde3RPgQl/Yfn+E4w8Ljx+ugvvKviDbmFh2JRNE1OQOY3QpGjKsk6Yvt5YU0DZTIZX/ZNEh8A
	G30zAThx8+3+v0HMP/N9MlpLS7ogm2I04xZGDxsiLvac/wrQb9oZjZgypsM0VoU179JW7Iz/7uA
	OU2NBr/3DaTNnk+9W7wznAYD5cLQVfyOxvxGWHNbk=
X-Gm-Gg: AR+sD11/kwhzUgwqP0wGzv6HYN+TqP5D94iAdytouR66CDsJOEgjJ8RmfJlOGIq6Wu4
	xUzYX+UCRsL4jXGDtFYabGZCqEBYXMcUsN5RrEarERPmFEEm/z6P7fzRtOXpBddCEitoxceluXd
	UGodWHyv2pr+988seV1ry8AimBwuHuJJlW3y8I0lOl1Icn2XaGwlMjuaitaw==
X-Received: by 2002:a05:6214:20e5:b0:8f3:ba0f:e7b9 with SMTP id 6a1803df08f44-90849603117mr235603296d6.18.1785850990519;
        Tue, 04 Aug 2026 06:43:10 -0700 (PDT)
X-Received: by 2002:a05:6214:20e5:b0:8f3:ba0f:e7b9 with SMTP id
 6a1803df08f44-90849603117mr235602546d6.18.1785850990119; Tue, 04 Aug 2026
 06:43:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260730-block-as-nvmem-v9-0-f72935817dbf@oss.qualcomm.com> <20260730-block-as-nvmem-v9-1-f72935817dbf@oss.qualcomm.com>
In-Reply-To: <20260730-block-as-nvmem-v9-1-f72935817dbf@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 4 Aug 2026 15:42:57 +0200
X-Gm-Features: AUfX_mzk0wJt2Gak_njsh0rcAEI1svN-3axItB8B6ASWCCxtH7hxRBo8wnhVM-8
Message-ID: <CAPx+jO8rMUaw7MAYpfp4cLASZ75mfFD4n3NOi2wdHNVvnb4rbw@mail.gmail.com>
Subject: Re: [PATCH v9 01/10] dt-bindings: mmc: Document fixed-layout NVMEM
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
        daniel@makrotopia.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: kDlD9UYUmGTwMlwqxnUD2eAYkyb_YNgp
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDExMCBTYWx0ZWRfX2DsVy4htxHZt
 AqMMTBaNfk2cudcjaowILHVJQTJw3GMf7iYsfm6/A4HfvuCDDnubzHBKMERrw8dOdrkWBR0BV2x
 K/1OryWDLkZnrJ6wrVz6mYw7NvTiRNk=
X-Authority-Analysis: v=2.4 cv=XIkAjwhE c=1 sm=1 tr=0 ts=6a71ec6f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=F73tXhIjRpzWiH7OJSEA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: kDlD9UYUmGTwMlwqxnUD2eAYkyb_YNgp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDExMCBTYWx0ZWRfX8WLcwH1aqLa2
 k/59UTEdyQqhJ3HKp6bmn80w5zV1nif90iF4hM7NXaS/KD2tyvr1HGPE/Cwf3+hXK9zg4u5kLiP
 RzEOvEzU4HngciV3Dc9ZzKEfc3a1lipmooklzpZfNAJx/NFw0xmLAzdmVEM1i50PHKymqxAqZnj
 CfSYNIdSfwS3Ep1vsYQ2OfR184w424txJ5rAPKRw6kfkOLgc3LeqTaowJmYsDvfLNAIviaaaEEs
 pA/7CqIPsYcZjFRa5PD/g8cQpU4K/HXQmZ2WtCatBnmzHRl3CvwJa2Jo3w/fBDYTFYw45Eosn0m
 Yicq/5gvxIB3/hoy1c66Lg1nW+cXKFip50fqMvfE4aoA5iSlxVPWvqg+pSW5HCUvQjkcDOwoZmA
 3g/+bo2s0yNdxD/lHdExhRtzz9kQWIfV83DDROa4bYpmVlVslMFRKlEnnsSmmgVXlfXp4HI/7VU
 ljG4OrlZ23H47KIQzYg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040110

On Thu, Jul 30, 2026 at 6:00=E2=80=AFPM Loic Poulain
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
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

I don't think there is any reason to push this any further, the
updated mmc binding is ready to go. So, applied for next, thanks!

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
