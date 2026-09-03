Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C01F4772A1
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 18:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788458446; cv=none; b=M52Wo2OQdlDFMEUOie0GRsNuP/rzcvYEfOrF7LLxXIWdLrfInBLZEAXJHHpCJUiP7qHu9WtwqZ5dozYKkkhYeEl61Gw+cohesNVlF+YBns31qOgU7BpgKUg5Tpf3rMbtdMaN8hJ0gg1Jb/hl79FonGlPboZ9/Kr0vBhEZHkbaSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788458446; c=relaxed/simple;
	bh=5GpUap6MhLA3YeCHhLavXRonGLYOx1iQ2/sCAxVJLX4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C9ByIK92O5DBklj+B33qOBIVDw75KQcT1/u7ZaV4+dPl5oS4abbudFZULyH9Diq4H6jAp+JaJAaomGB3/fK0pBGGdQxgBjKzhozzrhMdk6H458xytwgpLSKy4cbIQ23J6BTrFK0ZybKO6Dqb5g9/uobL22gsoUSqkxQG54fujuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=YxFNcefE; arc=none smtp.client-ip=209.85.216.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="YxFNcefE"
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3964dfb5a69so120715a91.1
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 11:00:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788458444; x=1789063244;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M+a3n91o7/A3QnpYbspa6oZt3jk8eyX+VIXi+8Suga4=;
        b=HuCtd8tM7QfZKmwYt8fg9s5B+Rc/7pSDHEBUNtWhqQxPAC5ppobYxlhebNQGQs24SD
         LyFR3XVf9hfnYyquSrZaIEngLtIDg+U8dL9N5wLJggoI9fQPw0IWqjGpJCsmdHdiZhgc
         BlCXnUhCLH0Leny2P9LrthFz7XSk3ZYQSpCdJfYCR58Y2N/zu8ZlLzZ7MWsGUTtoZ5TW
         HfXheWvPrQmsP7UFWl/5Nn5jCG9IkJ6CgZNTdWLmvJzg5o/k9pPYvQCTiwFD4Bz/S0NT
         MwaIcJUWWndkIxQyneaT2BVXYxfak7tuhZZysu+jlbBKqkiiGabJ3HKQQA5DbOICIt1T
         ucLA==
X-Forwarded-Encrypted: i=1; AKwUvBwwVnvEw6RRQhZxCmig1feLhH9Rn75+gclaetI9snyv7rP43ycinaQKdvkVC0eCTR4awFLWGlDd2kTb@vger.kernel.org
X-Gm-Message-State: AFuF++mtLmYVVGn+kU16F0dsI0nEIK9Lhz/VrDNb518pK7evWgzq4G/z
	fv+AUbDuTcjtb6WKpY8jNd/bBPUO1ehfB1JDZqfDDtGyFxSUEHHVDMZmBLrEfLI+rtUNKOcJozL
	E/wZSJ5Iw+BYh9rUGOq/XReFJCF2wZm86ooVkNy4lg/HYYiJqg+ssWFlAkryg8Y+yF5U2IC3e9T
	jAbU6t6VbGFR5F52jk+TriDzKen0yM+SXaRFH0d+bfP83Q4XFnxP0RbQaQGibUfM0nolX/td7pa
	WxjnsVxSVRVSZ7t3A==
X-Gm-Gg: AYBFou0NdjEQtQWNLdqJVW+9DAM7GGgbvvHzbKexgMRJf2t/m0UCTenxWwhEyjrHX9A
	9PR0WDKixDG8bqiQy9QIrqjeTqHTmisFXn7J/hCDboMBVHRDq2qU7aXcNkmTr/9qKOXnCic7KVy
	D6zW40uPkCoDzBokWjQ+TwxTTUyyPEQihbHoPwaS3cDdoWaBpGwBu0mmTGSaGARxi5c8WjfWhN0
	dpbcenvwHBcmAgIU6e6IEG5tIwaeUXnyYe78MIvpjRkGD6p8kMpoa2mq4HLZNXh7uZA0NuhfDQX
	RRzQIdi3CGbQq82QOIM/IOMMZo+KS50ht4eLe4ohWV/YDEKqeJ+Jma0ZzG6VgZtbbZnXqVxcrqS
	5cX93RhEJwfDTGBAEZyRy7ELqXHiUyJECgx6d3uTj5ugRG6pys7CDgHq6aQg32ARFYMzKk0TyCo
	Q1u7sSMev28A+MTupEtjF0fR++VnWuOsT61Ja9
X-Received: by 2002:a17:90b:55cf:b0:396:b918:c2a with SMTP id 98e67ed59e1d1-39b261b1a52mr307700a91.12.1788458443814;
        Thu, 03 Sep 2026 11:00:43 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-27.dlp.protect.broadcom.com. [144.49.247.27])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-39ae8f22f0csm632231a91.3.2026.09.03.11.00.43
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Sep 2026 11:00:43 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c213d5fb55aso7054466b.1
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 11:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1788458442; x=1789063242; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M+a3n91o7/A3QnpYbspa6oZt3jk8eyX+VIXi+8Suga4=;
        b=YxFNcefEJ9+dwJPBr1Qi8YzqHSSgKJn4rTh1bR/rPaO2zPPBaTrSiCIxU7zD1KOdro
         Ja9xYRAA1ZRQSmMnalwwBFyESv3l/dNv/CVti9siUWraoszBJRazPMBmfTJHXQjKkgV9
         9+xyhMU5aFn1WSAZ9IRPxaKPpVAH5uEKU6nS4=
X-Forwarded-Encrypted: i=1; AKwUvBxRMgmCtj4xFhf4JUphkfDk5PvwmzBr1ydybZcDhNAliAzfeur4T0YDSFO6f1uY23IiaQXQXZi6/Z3v@vger.kernel.org
X-Received: by 2002:a17:907:3ccc:b0:c20:f4ee:7c97 with SMTP id a640c23a62f3a-c260c7b0d7dmr26732466b.5.1788458441662;
        Thu, 03 Sep 2026 11:00:41 -0700 (PDT)
X-Received: by 2002:a17:907:3ccc:b0:c20:f4ee:7c97 with SMTP id
 a640c23a62f3a-c260c7b0d7dmr26727066b.5.1788458441097; Thu, 03 Sep 2026
 11:00:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902-bcm2712-iommu-submit-v4-0-9dbb657578c1@reactivated.net>
 <20260902-bcm2712-iommu-submit-v4-4-9dbb657578c1@reactivated.net> <9bb0ee66-d313-4a07-af4c-ffd002b55dee@reactivated.net>
In-Reply-To: <9bb0ee66-d313-4a07-af4c-ffd002b55dee@reactivated.net>
From: Jim Quinlan <james.quinlan@broadcom.com>
Date: Thu, 3 Sep 2026 14:00:26 -0400
X-Gm-Features: AcwNN1VMo-0BYjVu68L0XfVw7bX-kJ59Q0HCAFBRY1zIeWvOzLTYqbeos_EFI-4
Message-ID: <CA+-6iNxksLtrYPMSMYxeFGfDPh+ZVKANQSUtWNC9CZO-0OMpig@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] iommu: Add Broadcom BCM2712 IOMMU driver
To: Daniel Drake <dan@reactivated.net>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	nick.hollinghurst@raspberrypi.com, Jason Gunthorpe <jgg@ziepe.ca>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="00000000000021e520065a97eeb3"

--00000000000021e520065a97eeb3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 6:15=E2=80=AFPM Daniel Drake <dan@reactivated.net> w=
rote:
>
> On 02/09/2026 18:57, Daniel Drake wrote:
> > +static int bcm2712_iommu_blocking_attach(struct iommu_domain *blocking=
_domain,
> > +                                      struct device *dev,
> > +                                      struct iommu_domain *old)
> > +{
> > +     struct bcm2712_iommu *mmu =3D dev_iommu_priv_get(dev);
> > +     int ret =3D 0;
> > +
> > +     scoped_guard(spinlock_irqsave, &mmu->hw_lock) {
> > +             /*
> > +              * Completely block DMA by disabling both the bypass wind=
ow
> > +              * and the translation aperture.
> > +              */
> > +             bcm2712_iommu_writel(mmu, MMMU_BYPASS_START_OFFSET, 0);
> > +             bcm2712_iommu_writel(mmu, MMMU_BYPASS_END_OFFSET, 0);
> > +             bcm2712_iommu_writel(mmu, MMMU_ADDR_CAP_OFFSET,
> > +                                  MMMU_ADDR_CAP_ENABLE);
> > +             bcm2712_iommu_writel(mmu, MMMU_ILLEGAL_ADR_OFFSET, 0);
> > +             ret =3D bcm2712_iommu_clear_and_enable(mmu);
> > +             mmu->domain =3D NULL;
> > +     }
>
> My understanding is that when the IOMMU is enabled, the address cap
> represents the highest permittable memory address; requests for anything
> higher would abort. So I had hoped to achieve blocking mode by setting
> ENABLE | 0 in ADDR_CAP, thinking that would set a cap of 0, and hence
> memory accesses would fail.
>
> But a Sashiko review pointed out that actually this value would produce
> a translation aperture of 256MB, because of the way the register works.
> And I confirmed this experimentally, Sashiko is right.
>
> I also confirmed experimentally that setting value 0 to ADDR_CAP (i.e.
> dropping the enable bit too), with the IOMMU enabled, results in a full
> unrestricted bypass/identity mode.
>
> So unless someone from RPi/Broadcom can inform otherwise, I'm going to
> conclude that the hardware doesn't support blocking mode and remove the
> blocking domain implementation.

Hi Daniel,
IIRC, the value in this register field -- let's call it X -- is in
256M-sized pages.  An access is blocked/capped if  iova[39:28] > X.
So it still passes some accesses even if X=3D=3D0.
Regards,

Jim Quinlan
Broadcom
>
> This will cause the iommu layer to fall back to creating an empty paging
> domain when blocking mode is requested, which seems appropriate if the
> hardware doesn't offer a more direct way of blocking all memory access.
>
> Daniel
>

--00000000000021e520065a97eeb3
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
QSAyMDIzAgwHM7pH5w7o7Qb7yXUwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEINnR
r7YiwGU2VYIXJLqv4AwmE2KugyjQ6M/RVaH+rb9wMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEw
HAYJKoZIhvcNAQkFMQ8XDTI2MDkwMzE4MDA0MlowXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQME
ASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJ
YIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAI5nJWcQpf24EgwefaYf/p+TaNJ4TEBzw82038/3
6Yj2qoZU5Mj40+Q1u+lEaneVqo5vP86hILSF9BFFWH3zxuQUCKH4TBTod0kqqhVRrZnD3bIuLZij
for1YRrhPd1XjxF72hDWz3hNVxv1zAb1ZJLR8dYZIv4yto/6p4sWu4ndw1xbqKYC2OwO3/+CJxun
rfpum/OxQ+pAwnk7NzzwNhaAsB7ItZG0qRhIyteJWUmBXJP2rXpin6VfiYlZ7jcm9+WzSlZM/cNj
k9ALOf7DWDl954q5CsvJ0aGoO2Ft8Stsy0SVhUKsWB+0NjnVVObMmAxMHKf7zOWXjuG9h29oMjs=
--00000000000021e520065a97eeb3--
