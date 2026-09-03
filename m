Received: from mail-vk1-f225.google.com (mail-vk1-f225.google.com [209.85.221.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED163D0936
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 17:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788457015; cv=none; b=MxinIPQimOsU1cvuf9KfwPmbMeQLpJH4mjzb3pPPDpg2KG7wYOGMneL2xHIZagC4DVENPwyiALSpAikWTJAMQsPUXGl87A8of5NfjswePgE64tr80MHTKPJwa8auHAYv/2fmoH4ZdjSpBHY79jV4g461Lv6jQkl92faAwSOK2k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788457015; c=relaxed/simple;
	bh=HULostLLqS+HZcyYd3nWMfCxoRhlH9VKEQxAdxiZvnM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NJYWQehbK5b6NYSMxHWE6mu4RO23WvlcsY14x7QjxjL9Vh9dDjV/LkB13g0riVRtT7kM1qHavDpP7Kk6cgs7FMmy8u1nhDOwkbEHkPN29/CdWJyYgK2VilJgjNq51fRVdm2LG6AuYSK63lMIRJmMTCLIMIUSAE4VdH43vFIr9ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=VhzykRQ/; arc=none smtp.client-ip=209.85.221.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="VhzykRQ/"
Received: by mail-vk1-f225.google.com with SMTP id 71dfb90a1353d-5bf959b820cso114810e0c.3
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 10:36:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788457013; x=1789061813;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tStkrsg9j3F5eJGWVTr5T5LAuClZYHHDldsUb/ICuU0=;
        b=VKiwtOwT8oHxIpeLh9NjKqbIjePZFPRM3ScboNc4ftyq/ev9f1UAfmJDLnuVoQsSZh
         Sm3ob3IgHeHd2nhbm3GpusD1UYkNgn4/HrIL9EXyDo2Ykoosujcu2xLKOWCZdnSCgXLz
         fVWpjjP4JWrNJCVHwHvGTGsDvhSRIiZ6Yctg1hMk572lrn44KUhR/RIK/tC/u6qcqfx9
         VnaTWiZgpbl8lPfeo0j7S0yDY8nUqkZwiUX1/FLwMRadnkaqCc0lOfRO2dbZaXQLdFrC
         yiUcFv9XRTizh2Ahg3rGwasGaHztJxbRT16s5Apd93chbdPUXcg2L333PjkDg4u8RIQa
         vREQ==
X-Forwarded-Encrypted: i=1; AKwUvBzMLtq8h2r8P7rKVwPmvYZMX9GdwIpbJvNavr87JHau5RKX0+TbTF6TTD5tZTMhSHto0H+Ojp3HbgjQ@vger.kernel.org
X-Gm-Message-State: AFuF++lEB9y62CXIWjyo1O9IEFwEZ3sjWIt827p3DhP5bFCWBW2fLWMA
	/M8ZlUnSJ94Vfe/MIV18i3kf7zrmrL5ki3ZFvCXrNCDxAGIulAZwVdmCFCV94QexEJc4DoYltgY
	ES2scJ5Em1kbyFjKzVZ9rDASzQRq+phHkThuKR8LPLrgmYSgkg8OaSYtc0VjC5FUGqAyb6MDwaI
	h/m2oih7gPwEGtXrJ7vQeYATKWrTBaydwK++4SR3SvdTJpirFEOyxIsGwvAZ+7IEKMvRUl3R8mN
	O13961FU7/b2sJG7A==
X-Gm-Gg: AYBFou3HPfThQHWMokReRWRm1+nhoxr8PVjgJ2Zrc6XV++vFIcdWRcxvwSkhSy/KUea
	zdW6tVurGdgKAWK13s744MnHe0C6bCdmdC4kruZbfBqbzyumBj3U7EW80jzLoNzlcJLvSQaR9uP
	wy49SsVyb73MMyQuYyg9iSQopSCjAUZ9Not1+2cCudqYgi5PCLXd9qmb673OaTXZy3yaA7etfMH
	PLmuYDhIilz9C7G1gy9wJH/07xiv+6LeMkV+BWidQHJt04DKWHzxH3ExtmpEiox+gSnzvq0Amzn
	33qs/zpt42VYIxkTEP8wAirfIYi5i1K8X5eOIo/9bJUFRH6oLPBdhAjYkRuAzbo35xaOa0+ydq4
	T/+F1G5CnNayhF40Itl02GW74Hek6YLmHG0Oja+BJ8k8AaM7mAozaGk+wRKavCZE+IbyhLGW7bo
	jDvzYjBbL7XJNFaJrSZoD6q2ShvOFiCk8q8GHE
X-Received: by 2002:a05:6122:1d88:b0:5c5:db2b:5baa with SMTP id 71dfb90a1353d-5c7eb20c33emr683867e0c.6.1788457012723;
        Thu, 03 Sep 2026 10:36:52 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id 71dfb90a1353d-5c7ecb9e4c9sm63264e0c.4.2026.09.03.10.36.52
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Sep 2026 10:36:52 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c11f2b9f62fso2966666b.2
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 10:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1788457011; x=1789061811; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tStkrsg9j3F5eJGWVTr5T5LAuClZYHHDldsUb/ICuU0=;
        b=VhzykRQ/ywFPqoVxZkwa/krcp2Y9KSPle0cMjClZqGXag4I6DY01xcI0GsugUjPqQf
         TF+YZEcsMmMRJbSINcQRi7vIXhxbouXMwNaA6PQPBUGdiSns8pgFlE1SP9WVfrjJTrkT
         ZA12MO0q5k4mDweiK/1mcCazIcAGzDZ4TzNxA=
X-Forwarded-Encrypted: i=1; AKwUvBxPwTPKA9sG0UgiKwIgOlqA0ICN2XiWYYkHKuu3QjJ7XAkCjs7dunLPMDcVAefuwmP4A3cl77+cv8dv@vger.kernel.org
X-Received: by 2002:a17:906:4fd0:b0:c25:1a5:62a4 with SMTP id a640c23a62f3a-c260ca1ed90mr19712966b.17.1788457011015;
        Thu, 03 Sep 2026 10:36:51 -0700 (PDT)
X-Received: by 2002:a17:906:4fd0:b0:c25:1a5:62a4 with SMTP id
 a640c23a62f3a-c260ca1ed90mr19708766b.17.1788457010559; Thu, 03 Sep 2026
 10:36:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902-bcm2712-iommu-submit-v4-0-9dbb657578c1@reactivated.net> <20260902-bcm2712-iommu-submit-v4-2-9dbb657578c1@reactivated.net>
In-Reply-To: <20260902-bcm2712-iommu-submit-v4-2-9dbb657578c1@reactivated.net>
From: Jim Quinlan <james.quinlan@broadcom.com>
Date: Thu, 3 Sep 2026 13:36:37 -0400
X-Gm-Features: AcwNN1WO37iCo5lJmw0oA9Ue67-E06_V_rh5wuozhzpJ0Sb09NLYr5P6ip9-VKo
Message-ID: <CA+-6iNyAU9uw1QyA8TaBWOvhWuxe=DdbeEzoHgM9Gk3TSsSccA@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] dt-bindings: iommu: Add Broadcom BCM2712 IOMMU
To: Daniel Drake <dan@reactivated.net>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	nick.hollinghurst@raspberrypi.com, Jason Gunthorpe <jgg@ziepe.ca>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000dda3ad065a979862"

--000000000000dda3ad065a979862
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 1:58=E2=80=AFPM Daniel Drake <dan@reactivated.net> w=
rote:
>
> Add bindings for the Broadcom BCM2712 IOMMUs and their shared TLB cache.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Daniel Drake <dan@reactivated.net>
> ---
>  .../bindings/iommu/brcm,bcm2712-iommu.yaml         | 54 ++++++++++++++++=
++++++
>  .../bindings/iommu/brcm,bcm2712-iommuc.yaml        | 40 ++++++++++++++++
>  2 files changed, 94 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/iommu/brcm,bcm2712-iommu.y=
aml b/Documentation/devicetree/bindings/iommu/brcm,bcm2712-iommu.yaml
> new file mode 100644
> index 000000000000..5ca8ce469ec3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iommu/brcm,bcm2712-iommu.yaml
> @@ -0,0 +1,54 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iommu/brcm,bcm2712-iommu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Broadcom BCM2712 IOMMU
> +
> +maintainers:
> +  - Daniel Drake <dan@reactivated.net>
> +  - Florian Fainelli <florian.fainelli@broadcom.com>
> +  - Jim Quinlan <james.quinlan@broadcom.com>
> +
> +description:
> +  The BCM2712 SoC features multiple independent IOMMU instances providin=
g
> +  address translation for multimedia hardware blocks, such as the VC6 di=
splay
> +  pipeline, camera receivers, and ISP. Each IOMMU has its own page table=
s,
> +  control registers, and local TLB, and is additionally linked to a cent=
ralized
> +  L2 TLB (IOMMUC).
> +
> +properties:
> +  compatible:
> +    const: brcm,bcm2712-iommu
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#iommu-cells':
> +    const: 0
> +
> +  brcm,iommu-cache:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the shared IOMMU cache (IOMMUC). Each IOMMU instance ca=
ches
> +      translated descriptors in this centralized L2 TLB cache block and =
must
> +      trigger cache invalidation commands on it when updating or unmappi=
ng page
> +      table entries.
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#iommu-cells'
> +  - brcm,iommu-cache

Hello Daniel,
What are your thoughts on allowing the iommu work without the cache
property, ie having its presence be optional?  I work on the Broadcom
version of the Rpi4/5 SoCs,  and  (a) on certain workloads the cache
slightly degrades performance or (b) on some chips there is no cache
associated with a specific iommu.  This is probably on me to implement
these possibilities, but I just wanted to give you a heads-up.

LGTM

Regards,
Jim Quinlan
Broadcom WCC/CM/STB


> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    iommu@5200 {
> +        compatible =3D "brcm,bcm2712-iommu";
> +        reg =3D <0x5200 0x80>;
> +        brcm,iommu-cache =3D <&iommuc>;
> +        #iommu-cells =3D <0>;
> +    };
> diff --git a/Documentation/devicetree/bindings/iommu/brcm,bcm2712-iommuc.=
yaml b/Documentation/devicetree/bindings/iommu/brcm,bcm2712-iommuc.yaml
> new file mode 100644
> index 000000000000..47c584ad667a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iommu/brcm,bcm2712-iommuc.yaml
> @@ -0,0 +1,40 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iommu/brcm,bcm2712-iommuc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Broadcom BCM2712 Shared IOMMU Cache (IOMMUC)
> +
> +maintainers:
> +  - Daniel Drake <dan@reactivated.net>
> +  - Florian Fainelli <florian.fainelli@broadcom.com>
> +  - Jim Quinlan <james.quinlan@broadcom.com>
> +
> +description:
> +  The BCM2712 IOMMUC is a centralized Translation Lookaside Buffer (TLB)=
 cache
> +  which accelerates address translation across the SoC's IOMMU devices. =
If an
> +  address mapping is not found in the IOMMU's local TLB cache, then this
> +  IOMMUC is consulted as a L2 TLB. The SoC includes a single IOMMUC whic=
h is
> +  shared between all IOMMUs, and it must be explicitly invalidated when
> +  modifying or unmapping IOMMU page tables.
> +
> +properties:
> +  compatible:
> +    const: brcm,bcm2712-iommuc
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    iommuc@5b00 {
> +        compatible =3D "brcm,bcm2712-iommuc";
> +        reg =3D <0x5b00 0x80>;
> +    };
>
> --
> 2.55.0
>

--000000000000dda3ad065a979862
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
P6nIShznyqOL2EoCa0IXujxvXUo0pANFYsDhrCVF5JOVPeEL3Y2m+4flRtOI+YlRQoepb+TEVdkY
/g1rlWG7GIYrtHxrFFRvn2/Iqqpv/x5kzJgoTYFOyTTGlXIqGkKTqCWFrN09kJWzhhmxhxtJprJs
KveDLF8yhHSbqmXfKTkT+CIrynXXDro+80qXEXC8CM9W9d+2lDDM+hWTlC6Pt/ikMYf/ZB4K2Nr8
VFruDYGZfAHhh9/lqK3SpS2Z/8cB88K62U+Eb1yNAgMBAAGjggHeMIIB2jAOBgNVHQ8BAf8EBAMC
BaAwDAYDVR0TAQH/BAIwADCBkwYIKwYBBQUHAQEEgYYwgYMwRgYIKwYBBQUHMAKGOmh0dHA6Ly9z
ZWN1cmUuZ2xvYmFsc2lnbi5jb20vY2FjZXJ0L2dzZ2NjcjZzbWltZWNhMjAyMy5jcnQwOQYIKwYB
BQUHMAGGLWh0dHA6Ly9vY3NwLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAyMzBlBgNV
HSAEXjBcMAkGB2eBDAEFAwMwCwYJKwYBBAGgMgEoMEIGCisGAQQBoDIKAwIwNDAyBggrBgEFBQcC
ARYmaHR0cHM6Ly93d3cuZ2xvYmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wQQYDVR0fBDowODA2oDSg
MoYwaHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9nc2djY3I2c21pbWVjYTIwMjMuY3JsMCUGA1Ud
EQQeMByBGmphbWVzLnF1aW5sYW5AYnJvYWRjb20uY29tMBMGA1UdJQQMMAoGCCsGAQUFBwMEMB8G
A1UdIwQYMBaAFAApNp5ceroPry1QLdugI4UYsKCSMB0GA1UdDgQWBBQiuRLoBkhIaas+1j3yf23P
ffVFcjANBgkqhkiG9w0BAQsFAAOCAgEAp1y0fznw9Uo7UzExANVpYjj+OG1c3C7MhWOvAd7LvfPX
BSFisMaabop5Pyfc/sWzb/jCNfVkkDW5Ij2mzpUsUca2qpILoFhOUT9b0d+nc48MCZ4/Wj6vX5QJ
i9VdYeuv3DYASZsQdH8iYnV5X5YCYo1AO/pyW+M4gG022Nsji9+3A9zkx8JRPDIXkPaDLrzcGD9L
rEVIYnnSK9b/4VHzITVgEmSsUTAIzOD6M6TzgrSoJZFmKNMXlAqo+m1nlNyJkM4OyOvaDx5y+2hA
mp4tzD9gJNU9TzQpQRZFz53+c8BkCpzvcHqT8lMluRlCrIYWqaSOUDHX9HPYvzbtO4iYV+irMdGN
2PBz6Wtfaoi1xTfFSKK9ON1mvxACK+E4B5gycSoZcOBADTbGXLDMqiygl7Wz0oooAPqZpUnaD1nc
x/pX7N8Ff6YK+iN3vVah34vLkE1CMFyDQMtyTCzQPW+7XCTxCL9ML3LBAF+eNAtKpPOsrGIdRHy5
6oQr+2ZquSMvWj447q4v3sk1LHs7ata+sP8/kmcPKn3WPXQ/4xMevqFVyv2VIFrBK9ZnOZ//fz8R
7SjJ7t2kOITvbWcMkizMc33S9hfmYiXaVTjIi89NiO3EXCJouYShpptgGNG6mpYHcddnfdKiILOS
06KlKNuHO4IpRmaGrzcDjsUQQSn8amMxggJXMIICUwIBATBiMFIxCzAJBgNVBAYTAkJFMRkwFwYD
VQQKExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBD
QSAyMDIzAgwHM7pH5w7o7Qb7yXUwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEIFMV
o5hS0DDcFFymAnqwogOvaV9pgIoyUXi5QGwpHtP3MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEw
HAYJKoZIhvcNAQkFMQ8XDTI2MDkwMzE3MzY1MVowXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQME
ASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJ
YIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAIzWmrBxBmtqvJ5fvCTDX/aWzJ6BL5gam9b2hTUZ
9nJipfJH7zY0ySmtLtTH68YaRM6qBrQrK26GOie4J25KBfJdB0TNg76LvAqJTuVmmxmJYrHYR9NG
JXykSfh2rK1tzyAiUgMqUoucRvGIcqj8MnIszqG9zSfv+dA0sqflE0PxNpUltusbCI0YtqfW5kW3
XrKMCVHj3XYikNzEaBQY5EpTkXmmH7T6T83xNLf78cSosCvv0wNdn/PAuG1l1ylqrXVZZgqGcauD
rlxsl+KQrXq/YDZWi0bW9lFXg1ax2y1KM4LN7ac4E54UFP8pZuV+pLlpgbFvI/6RRHnpT5Uu+N8=
--000000000000dda3ad065a979862--
