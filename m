Received: from mail-vs1-f97.google.com (mail-vs1-f97.google.com [209.85.217.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F904B512A
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 18:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788459301; cv=none; b=ciMH/H711pz4llhHcE+cfmpq0VTDnbseGUSSGh9oKO62ghYIysjp296uuMz6t69+b+dyBL30k1AkQZET3+gEVmSvbB/7KVLN5GzUjCvC0V7oXwGi/gSwo/18ixBXx3xSTMrAyBfFWlajp2yr370Bnwai/sFJkTR2BqpSwxgxmRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788459301; c=relaxed/simple;
	bh=C3cKQxXvpQ15bxExP6piS2cnrYWWiltY5zvKvDBkoV4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S8OFQ7A2hd595Csd4Pm5M4rlgmC8xhQbZ1Xk2TzRjvC4zaYSt+bY7HyGnTojr/NXs7NA1hpb1d74hR96M9aqaK8X2JUwF58re5zOTb+pV3KDv6Sv0aBskpDrmHCrDpK2FyH9cP2rY4hPMZpbSkgfSJ2Y8w9CrdFJdf4j+vwGmsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=MT4GRsQZ; arc=none smtp.client-ip=209.85.217.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="MT4GRsQZ"
Received: by mail-vs1-f97.google.com with SMTP id ada2fe7eead31-777c2d69446so84284137.2
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 11:14:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788459298; x=1789064098;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i7CMYHBiX4RSPPqAczGqoBgWF3Ai/Ggb4Fkh8Jc/Oa8=;
        b=FleKVoaM3PXJ75/dk4oOnM1GhZVR6FF3uJeJkPejOJt6zriXeQz/rzB+h/nurtEIx4
         +whZeHUqkHv5BfNwkR1sHsUV2q4YGq5Es4Uq8OxQmsUNo6RVzxQaofHJCqkCNbOIEPI4
         TsALzDOO/e8HH7EpH29W9cVeu+e5PpykgSagD/kOTvWQtvEpP2w9sTukx1fXvPpi3s1/
         F04rGqunUbwOB4UW6FzwuLZHfXzu8VGxUS/y9VGkncgj+yTzreuc0BouMeJ2lwx01YNE
         ysq1du7UNeY532TXAuJUcTAemho+YZyVdWhdhNtcvGGo084NrGg1zip2FP4YXoJud2lb
         A50Q==
X-Forwarded-Encrypted: i=1; AKwUvByqdXnFkJpuTnWNeuSltgmAp38XwRydp+Z+RfXzDZedEA0aFDooC7gTdyX7aTvQDrTrVjtRP2MyEZbc@vger.kernel.org
X-Gm-Message-State: AFuF++kiOuNcJFb5M3BNvuhaD+ITHivo+P1CJ3NEiptbXLik36wZhfqe
	P/vqeO3opv/v40RGSUYVZJsOJ4M5WB0sF5HNzwHbwuUgOAyySJRjcrI0S3PrD4SgmjoHAW47PHw
	kH8BvFdqTAW99ijZZJ3HNqoT0/yRY5y+xe8eympzX43yZ/je84xAvGKTviwel6iC2wiUxvHVAqm
	mUGHRZ7cAjaiPyZEvEhx2LpG08IUdTCroX7UKUY8BmDlQtQ+ql415pj4A+drI4kK8+LUJi6KycY
	hS8U7pUI3jKjfLISw==
X-Gm-Gg: AYBFou2kAd3ltpku03uFK73fwmjkGyGquWD5jd0ZuIQI3S6UCCIPgPZW/YsiIQqx48O
	3lrDcUsNsN232QK6M2zmE63asWXmP6L+44XZkbGcY21B7TFIiD8n5X3p5657ixCXpjqmLbEiKr2
	W0Ig8NGDwB5w1oWxBy5+IKIVve/0s1XOdI4yK9AqrhIE2si/Uxk+bWcfpIU/OOFfk7rB+HOoc17
	G72Arsw1htmUNLj4Re2niy8F0TDbIJc2MjZUSRXRQ1WjH8fsJVNgYtrUgKMQYSTST+pJW3Y8rDD
	CLTqevEr0AQnG2IJ9w/OULREa58R2I3C4yxIpFNuBly7Gu/O6vPbCV6TrZzAxLnaQ8a51asTK+C
	VW8s9VH4wZbohjLjlN27OfXdpPLabTrm5V+1M18WDd/4xinWMm01mKaTmfpLG6lUCd3cbFkMbwB
	aw9D9SVkzM0hVJkzJWkLXrcC+DS+Me8UHw8K5OpNM=
X-Received: by 2002:a05:6102:c10:b0:786:c86c:8fe4 with SMTP id ada2fe7eead31-78a1f3ee081mr5610978137.13.1788459297552;
        Thu, 03 Sep 2026 11:14:57 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-980673c00a2sm1459045241.5.2026.09.03.11.14.57
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Sep 2026 11:14:57 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c15e82278cbso5236266b.2
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 11:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1788459296; x=1789064096; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i7CMYHBiX4RSPPqAczGqoBgWF3Ai/Ggb4Fkh8Jc/Oa8=;
        b=MT4GRsQZPt6gFvdO9gtfMAoFCvQQ7uwKnog7i6DhsRUPDNd4ITnLoCN5Hf9E1zOoEs
         XvbFkAz5euLCoRXbtIuDqwgwm4sykfKFn866/ePezw8huSMRH8YBvWqXYU04hjgmWvv3
         EX2b64uR2i6SYhvUIprr8gX1mjdTN9wcKCUog=
X-Forwarded-Encrypted: i=1; AKwUvByNv9PjAXlqZZddZxCza49GiIsAv9vch4qYWWcY2q+NZWh2uDJAalRj1eaZhh8u3y5YJ2+iNLgWokzC@vger.kernel.org
X-Received: by 2002:a17:907:c81a:b0:c25:c67d:53cc with SMTP id a640c23a62f3a-c260c8d5829mr34460366b.8.1788459295922;
        Thu, 03 Sep 2026 11:14:55 -0700 (PDT)
X-Received: by 2002:a17:907:c81a:b0:c25:c67d:53cc with SMTP id
 a640c23a62f3a-c260c8d5829mr34457966b.8.1788459295438; Thu, 03 Sep 2026
 11:14:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902-bcm2712-iommu-submit-v4-0-9dbb657578c1@reactivated.net>
In-Reply-To: <20260902-bcm2712-iommu-submit-v4-0-9dbb657578c1@reactivated.net>
From: Jim Quinlan <james.quinlan@broadcom.com>
Date: Thu, 3 Sep 2026 14:14:42 -0400
X-Gm-Features: AcwNN1ULUOXEr8j3rxdA9JMOJJpv8H0ca1wIDO47rruOB4ZJ6GobYTJeFCa-i3s
Message-ID: <CA+-6iNxpKmqCo+brvnchoEsrmE7nJPqJs_7S0m_HzjooEa+KNg@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] Add support for Broadcom BCM2712 IOMMU driver
 (Raspberry Pi 5)
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
	boundary="0000000000000cc480065a98213e"

--0000000000000cc480065a98213e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

s

On Wed, Sep 2, 2026 at 1:58=E2=80=AFPM Daniel Drake <dan@reactivated.net> w=
rote:
>
> Hi,
>
> This series adds a driver for the Broadcom BCM2712 IOMMU found on
> Raspberry Pi 5, and hooks up the display controller IOMMU for efficient
> management of graphics memory. This is adapted from the downstream driver
> from Raspberry Pi (original author Nick Hollinghurst), with main changes:
>  - In page mapping mode, operate the translation aperture from address 0,
>    with no bypass window. More like a IOMMU and less like a GART.
>  - Implement the page table management using generic_pt
>  - Support 4MB hugepage mapping in top level page table
>  - Implement brcm,iommu-cache as standards-compliant DT property
>  - Drop the dma-iova-offset hack, used to work around some issue seen wit=
h
>    dma-ranges. This will need to be investigated separately and solved
>    properly. (It's not needed for display controller iommu support includ=
ed
>    here.)

Hi Daniel,
I wish you had kept the dma-iova offset hack but I understand why you
did not.  I've built and successfully tested your driver on the
Broadcom sister chip of the RpI 5.  I am mostly interested in the
iommu attached to the PCIe controller.  I tested this by running
multiple tests where 10MiB is sent by a Wifi chip.  Data integrity was
validated of course.

I did not use the driver code as is.  I tried merely decrementing the
MMMU_PT_PA_BASE value for the 4GB iova-offset required for our
configuration, but that did not work for some reason.  So I just
hacked in some iova conversions and got it working.

At any rate, LGTM and thanks for submitting this.

Regards,
Jim Quinlan
Broadcom


>  - Misc simplifications/standardisations/cleanups
>
> The IOMMU works strictly with 4KB pages. This means that unfortunately
> when the kernel is compiled with PAGE_SIZE=3D16KB (the Raspberry Pi 5
> kernel default), 12KB is wasted in each page that is allocated for page
> tables. I plan to address this in followup work.
>
> It has been tested on Raspberry Pi 5 using a 3D-accelerated graphical
> environment which causes plenty of IOMMU maps & unmaps.
>
> Thanks for the review comments and discussion. Further feedback and
> testing welcome!
>
> Changes in v4:
> - Add Jim Quinlan and Florian Fainelli as bindings maintainers
> - Replace MMU register access macros with static inline functions
> - Clear illegal address register and flush caches on blocking domain atta=
ch
> - Add __must_hold annotations in TLB helpers
> - Use BIT() macro for MMUC_CONTROL definitions
> - Link to v3: https://lore.kernel.org/r/20260825-bcm2712-iommu-submit-v3-=
0-7f143e7289b6@reactivated.net
>
> Changes in v3:
> - Switch from a aperture and bypass window GART-like approach
>   to IOMMU-like 0-based translation
> - Add 3 SW bits which seem unused (per the chipset docs); drop patch
>   for NO_SW_BIT handling. This reduces the claimed address space, so I ha=
d
>   to tweak a iommu_pt test accordingly.
> - Disallow domain sharing across multiple hardware IOMMU instances
> - Clear and flush local MMU TLB during domain attach
> - Handle unattached domains safely during TLB sync
> - Set cache platform driver data late during probe to prevent race condit=
ion
> - Improved handling of cache flush timeouts
> - Use format string for device name in iommu_device_sysfs_add()
> - Use cleanup.h helpers for scope management
> - Expand DT binding descriptions for IOMMU and IOMMUC
> - Add iommus property to HVS display node in DT
> - Drop iommuc back-compat with current RPi DT
> - Link to v2: https://lore.kernel.org/r/20260727-bcm2712-iommu-submit-v2-=
0-0247b5c03de8@reactivated.net
>
> Changes in v2:
> - Use iommu_fwspec in xlate & probe_device
> - Add blocked_domain support
> - Simplify page size configuration between iommu driver and format
> - Introduce PT_FEAT_NO_SW_BIT flag to allow formats to explicitly opt-in =
to
>   a defensive flushing algorithm when no sw bit is available
> - Implement 4MB pages at Level 1; this is more efficient and means the
>   "allow full-table contiguous leaves in unit tests" commit has been
>   dropped because it is no longer needed.
> - Hardcode the aperture in an unused part of the address space, removing
>   it from DT (it's a software-specific decision, not an attribute of the
>   hardware), adding more explanatory comments
> - Use pt_full_va_prefix to have the PT format operate within the aperture
>   space, enabling use of IOMMU_PT_DOMAIN_OPS
> - Add more dt-bindings explanation to brcm,iommu-cache and drop docs
>   around the cache property used in RPi firmware (the driver still suppor=
ts
>   this however, for fw compat reasons)
> - Correct iommu device address in bcm2712.dtsi
> - Link to v1: https://lore.kernel.org/r/20260712-bcm2712-iommu-submit-v1-=
0-80e10cdde2ea@reactivated.net
>
> ---
> Daniel Drake (5):
>       iommu_pt: Fix test_pgsize_boundary() failure on narrow-OA formats
>       dt-bindings: iommu: Add Broadcom BCM2712 IOMMU
>       iommu/generic_pt: Add Broadcom BCM2712 page table format
>       iommu: Add Broadcom BCM2712 IOMMU driver
>       arm64: dts: broadcom: bcm2712: Add GPU IOMMU and IOMMU cache nodes
>
>  .../bindings/iommu/brcm,bcm2712-iommu.yaml         |  54 ++
>  .../bindings/iommu/brcm,bcm2712-iommuc.yaml        |  40 ++
>  arch/arm64/boot/dts/broadcom/bcm2712.dtsi          |  15 +
>  drivers/iommu/Kconfig                              |  15 +
>  drivers/iommu/Makefile                             |   1 +
>  drivers/iommu/bcm2712-iommu-cache.c                |  84 +++
>  drivers/iommu/bcm2712-iommu-cache.h                |   9 +
>  drivers/iommu/bcm2712-iommu.c                      | 577 +++++++++++++++=
++++++
>  drivers/iommu/generic_pt/.kunitconfig              |   1 +
>  drivers/iommu/generic_pt/Kconfig                   |  10 +
>  drivers/iommu/generic_pt/fmt/Makefile              |   2 +
>  drivers/iommu/generic_pt/fmt/bcm2712.h             | 288 ++++++++++
>  drivers/iommu/generic_pt/fmt/defs_bcm2712.h        |  18 +
>  drivers/iommu/generic_pt/fmt/iommu_bcm2712.c       |   6 +
>  drivers/iommu/generic_pt/kunit_iommu_pt.h          |   2 +-
>  include/linux/generic_pt/common.h                  |   6 +
>  include/linux/generic_pt/iommu.h                   |  12 +
>  17 files changed, 1139 insertions(+), 1 deletion(-)
> ---
> base-commit: 786262be6048deab760f68c8acc2c85607165894
> change-id: 20260712-bcm2712-iommu-submit-2e09899e65c4
>
> Best regards,
> --
> Daniel Drake <dan@reactivated.net>
>

--0000000000000cc480065a98213e
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
QSAyMDIzAgwHM7pH5w7o7Qb7yXUwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEIBT3
dMWL6K9wK/y9/9XMqG1KdExgACfhrEj+hJrqGzqnMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEw
HAYJKoZIhvcNAQkFMQ8XDTI2MDkwMzE4MTQ1NlowXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQME
ASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJ
YIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAKJOWr0bm1+CFIPo3RpKd8Ra8PiXEyEsfU8UJ3K/
9t15yC9K8+976zEzsHrv9GJBd/DnERKpFRPcBTDfMSlsSDXBKvq65SV6ALpcWVo2QEZSFZGrMz4u
HaEwsGfdusDbL3FGwofQxqXn44hfxPALFM7HVEFoULbHTYUGhlICe6HMe9MeEQ2LLaujgfvauElD
Vo3wSrx3KQMHchPLAmVEyKVvUgZ+q7Wyc31SJMXQwpjnpw115prJgsk7nLzAfEMm/fJ4H5DcdKEA
vmIYItG9pn02XxUatd9K00cX2NXXBAzyz2U8nbw7LWrhZ+Qtyfxchr+2XpfGSSj+bwa0LezPCQ0=
--0000000000000cc480065a98213e--
