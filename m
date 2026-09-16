Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339C7364044
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 21:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789594761; cv=none; b=eg8bfz4xu6RAD+CBTTZHoaODPUbCprsFqg4MXcjAQ642Wcz+GJ+xS/tVQBbVWpGmcahcz1sAXuN5clymLb51kdfgJ/uxcBT6hKe39JTFJNEv69lJ5M4Lwcr234VAE6JtlEe/vtNoIkPq7UQw28QUmDz/S4GrTzpu1CkfpU4TfHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789594761; c=relaxed/simple;
	bh=6IGrQAl6THQdMZ0OzSOP9R6hDqpLqYl8AW7uWawpLIk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YDjAdamum2q3cjvEgQu+6k4ZgandPk2d2x5mxiS8Sc94cxaQF6EcuWYOt0zGTVBiO5o659Aib3jMR4Op/u2WRiMBPNLWytnR6xd08mARU8w7lJQuKYbGmWYa9aE54B/2SFrpGZWoT5u1ny9AhAFdyTY4JB7DkrNoZFfH4K731Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=N/W0zq3q; arc=none smtp.client-ip=209.85.216.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="N/W0zq3q"
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-39682983a0fso65671a91.3
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 14:39:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789594743; x=1790199543;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Afgea1rMDN8cidCFHe242ND7VTgX5u5tR2sFDvaggoQ=;
        b=LVGwziTyblRr8vpbyfgy5P4Be4qx8CtIcD7HAwQXiCTOuqpHmPh6dv4+YJbjP4Qx6Y
         5AoE8REVeiSe7/5Q0nGKaaLTKEaWWd0RnZQCGnuOaVOL2ZYyvUvcj/fzjW+qmWZsEERC
         vUkge9xMzntUkglount0I+Gg27S9CIHYwcCkpKlgfgSM98W4MLoyq72ZIn+Ko5BnkoB7
         TSySlrMUOM2wLsyPmAaepk0EXuTPVSD3TbLEjlta6oFDd6B1lY3MHuxulFK8j5S91n4q
         HXW1qEcVjWhEvzsFmV41sHBmUHdaszuAKgIqiYGcRU8UXOkU4ZfPKuvbIYcNyWU6DJZD
         KPNg==
X-Forwarded-Encrypted: i=1; AKwUvBz0Na7XEcHDdf513MLLI5oDg0SEAs309DbUdwu3KY7TfcIFlCrdqfy8yyryUyj8Yaho/1JJNbWqnV1n@vger.kernel.org
X-Gm-Message-State: AFuF++mSnuIiUPxW/ELfGmXolqNskCybGLYEC4p1k7SR7AL2qjH/2ZRH
	GGx720IWmfq+XKW5FsEu+WyxkJxbUObrMi5p0T50aVZd33dtzyAIM5Jw3F+PtQ5O75WOz10sImv
	NJebHvm1c6P4yzhoJXiCkJHx1wBvt5Wy9wziweK0EAn1WEBOSn+vpIVzFBDYJABRkq/F0KM2CIw
	g7Yee++u1T1uRgUX3CjfFOoQbJS6nnYN7rU5/yvW/4D6vv863+LESWOVlbllIlZdiZeZOJ5NZvq
	jEP17uw0GJUv1HbgA==
X-Gm-Gg: AYBFou0es10sZc1Ca+LJoIHNrg27nnRituYoHqxScNreETgkwTAaPKWbr2rH1E9I5AS
	Q2kShlih2VzDUmDr4eySlYLlVZmb4c03YCYYRCZUeOhW4yc98bR5f2zRSqoXzj1GizLhb8njngx
	iJbDJ/aRCCU7M+F/xHflAGqjgf7JAqBvpIJEMxTgBcdsCH4l+ecr7j2XTzcHCzCjy4Kf9nMdwif
	OmrC6JI54zz0yhCjPqsk4H7Hx6A7a5IJZ3zwY0xuB8pKNyPe1Gl7RJCBWg2oCFk42E87QdUnGan
	CAwpeziJ3mMcjclKxcOL+Wiz2QaTUFcp523LKhqXYauUAnHxVVUAoqX2s1ZA0k4JneojbDGgGkK
	+G+qSwmnpET8SiFj/u2PaJiQ/jLrAwKfMC5wb8IJsjE0MVC3rARWhHM/wPuV/g20temostP7HfM
	g5DmSdHUG5hFzpv3zyJ/8fVr9QmYIEs5PLQT7Y
X-Received: by 2002:a17:90b:380f:b0:39e:1494:1863 with SMTP id 98e67ed59e1d1-39e1e56b3f6mr9052082a91.25.1789594742891;
        Wed, 16 Sep 2026 14:39:02 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-98.dlp.protect.broadcom.com. [144.49.247.98])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-39e35d7bc01sm387816a91.1.2026.09.16.14.39.01
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Sep 2026 14:39:02 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c2939e341f7so25158166b.2
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 14:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789594740; x=1790199540; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Afgea1rMDN8cidCFHe242ND7VTgX5u5tR2sFDvaggoQ=;
        b=N/W0zq3qrbGT885lte208zxIP9lQjreA1HgzQKrKSEimtgPZtTzNyBzW7Q72W+wVAB
         uuo9wksULcCLrVLLFdXKgyeUZyzy5gfMR4AGMjl90avxE3r91NIw+xqzqnzRsM6XyEs6
         B3bd+sRFlX6lKqfHYbZ53hWFV4j1xNlYNgLZk=
X-Forwarded-Encrypted: i=1; AKwUvByRm8LPwc7C6HAOM1gELeIOqsocdvLY9TnCTe1EIObKPxOUn5jem9N5jvhnRqTRcU+B+g+DtPiOjtla@vger.kernel.org
X-Received: by 2002:a17:906:7944:b0:c29:4d53:787f with SMTP id a640c23a62f3a-c29e532ccedmr314974166b.41.1789594739985;
        Wed, 16 Sep 2026 14:38:59 -0700 (PDT)
X-Received: by 2002:a17:906:7944:b0:c29:4d53:787f with SMTP id
 a640c23a62f3a-c29e532ccedmr314970966b.41.1789594739417; Wed, 16 Sep 2026
 14:38:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902-bcm2712-iommu-submit-v4-0-9dbb657578c1@reactivated.net>
 <CA+-6iNxpKmqCo+brvnchoEsrmE7nJPqJs_7S0m_HzjooEa+KNg@mail.gmail.com> <3b5830a2-31f8-48bc-a56e-ed70377bbb1b@reactivated.net>
In-Reply-To: <3b5830a2-31f8-48bc-a56e-ed70377bbb1b@reactivated.net>
From: Jim Quinlan <james.quinlan@broadcom.com>
Date: Wed, 16 Sep 2026 17:38:46 -0400
X-Gm-Features: AcwNN1V6BbzKaHys-1cnOmgsVo924quGZssPhyVNEPoMAKYQVQTp493X9sG9nn0
Message-ID: <CA+-6iNwejv=uDsTp6cE5oJ7VURHRCUDdQ1tFO8ijUvCxoGMXSA@mail.gmail.com>
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
	boundary="000000000000c89a91065ba07ecd"

--000000000000c89a91065ba07ecd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 5, 2026 at 3:25=E2=80=AFPM Daniel Drake <dan@reactivated.net> w=
rote:
>
> On 03/09/2026 19:14, Jim Quinlan wrote:
> > I wish you had kept the dma-iova offset hack but I understand why you
> > did not.
>
>
> Well, having an initial iommu driver upstream will provide a good base
> on top of which we can work on that specific problem. It'll need some
> consideration/discussion to be done in a way that is not regarded as a
> hack. I might come back to this later, time permitting.

Yes, I plan on submitting an RFC on how to do this, assuming you don't
solve it first :-).
FWIW, I had to do the following to get your driver working on our 7712
PCIe IOMMU:

o force the aperture to start at SZ_4G
o change pt_full_va_prefix() to return SZ_4G (but it should really
return an offset derived from the dma-ranges prop of the PCIe node)
o modify bcm2712_iommu_shootdown_range() and
bcm2712_iommu_sync_range() to subtract SZ_4G from the iova.

Regards,
Jim Quinlan
Broadcom CM/STB
>
>  > I've built and successfully tested your driver on the> Broadcom
> sister chip of the RpI 5.  I am mostly interested in the
> > iommu attached to the PCIe controller.  I tested this by running
> > multiple tests where 10MiB is sent by a Wifi chip.  Data integrity was
> > validated of course.
> >
> > I did not use the driver code as is.  I tried merely decrementing the
> > MMMU_PT_PA_BASE value for the 4GB iova-offset required for our
> > configuration, but that did not work for some reason.  So I just
> > hacked in some iova conversions and got it working.
>
> Thanks for the review and testing! I'll send an updated version that
> removes the blocking domain, hopefully that will be ready for inclusion.
>
> Daniel
>

--000000000000c89a91065ba07ecd
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
QSAyMDIzAgwHM7pH5w7o7Qb7yXUwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEINtR
H0fXzjuJv1/9WkfAlJz2Sx6uxhLFaKEvdv980e9YMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEw
HAYJKoZIhvcNAQkFMQ8XDTI2MDkxNjIxMzkwMFowXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQME
ASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJ
YIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBALAEQGzgjnnXqlC/qs8s5XkuCDFevFO5N4GCN2d/
LUxIbqq1KKugz8m8fbfXp5W7CmGeYJwb6Dq6legV+LpkaYpni7PWnENDV7qGpMjjun6cMcOGtBkC
c2l96kwNed6Vz1gnKpNMOSAeTi/gEgl7/o+3xFyFD5nJ4ZKtO9EY974mQwR530rSTvpm0fWt685e
ssySxjvKvDqzdVFu7mKlHxOtTBBH7yRP2azUUyuv3jaNnmVuaAweBPbe/cnfv4r13H01H0/egKb5
mT20HbPyj1qVARJxGwVXINca8Cxx3BbdRNz/vCv9bgLmzo1H1090nXwXcQQ64uvvs6JnN0IhWro=
--000000000000c89a91065ba07ecd--
