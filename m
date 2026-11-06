Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.82.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793976514;
	b=GwFqkxZy7GMFE2YyUdxCu4tQmmUtXMveRL/bZ28YDZ0JEH+Mt82qy1XuIkQ/QVc6bw7b
	 mIIOk7TpNPBZ+A2Flob2OfDUzADRLQpL5TzAqup/slMdkXxuj6U27Ve60NLEf4Q8NCaBV
	 LCPjsRRI9SbscvKyIVF6N+MMWlsgK+HPjJ+HlafgTu7BbGcrZvmp5zFIGiQd8PO9MKX6Y
	 65XqRzM5L+HiK3IU04NsSwUef+y/+2C6scY3zM6qh51x+p3vHCgbLTwHjsUUDwH4le0Ij
	 /0V8oqTe/juBN4Nem2u0XE2ytbFwkSHo9dsn1Opzs0tLA9SZix5Sm4hUQNtL3fYcQFA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793976514;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=EVsynTIkUKlA3sM+VFVmSipU+rZiRJg3NzlUB6F6w3c=;
	b=wh6ZrsjXlmao4/nIOdPJ346opVPoDt7kmj44a2QO/gWP+7RSvLZ7EjX1nKCVSdOa8Ynl
	 hbkSR6OdSX0pcFWs4PLbhR91btmrGivdJo6inBcIXzq1GfH0UfeXs0uYAmYOHfG0h6Ijp
	 7p5QZeQF0HJCcS9iXhoEFiU64JrIveRtB1YX5CWDSYEZf5H22yUtst7I5F2wY37SF9yR3
	 ITxWYDCWLCmuk2IdlJO/LMl7Bl4z/cNH18MpxWx5elxXWT5BCYeb12pY9SSQmOL6bK8Oo
	 wU6wFOw0397aKzpjIXXoB+NmA7qszjjHm4yzLnSakymtG5wP9f2YBwLoC3yuTkwEdfQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I6fFiPpe;
	arc=fail smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE5F606A32D
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 14:48:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DE5F606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I6fFiPpe
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36a315ed211so799939eec.0
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 06:48:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793976513; cv=none;
        d=google.com; s=arc-20260327;
        b=VCpl75sPci4i3riukoy62DHJEi0IyMBkjxUd8Pni6QuJUwCWBNY/snLOwSjt0TNPwZ
         Mo4Yti+B+ZpJvxGrVbL03H3DRO/A3a5XKWyqPz8jbNzELCu11gU7as/b2rGow32wqPDg
         kq/p3nqdmmUF7p+pRea+mp3fjVE/duqe1BGrDRm3Hye3+mLX9oo2SI3ZiBrpZcqIGE3T
         5U64rirZoZnJ+OVETpR8pxF6Oa1yURn/csWd/8XIn2zM8pcGaDV1/e9sfR6hP9Sw/rwg
         V4d52fAQLalbyvDqQ1oObH9mR8IA0L5HKipzg1GYC3WxiX0ss1wRq/NeePI2IBKKM8lR
         QBFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EVsynTIkUKlA3sM+VFVmSipU+rZiRJg3NzlUB6F6w3c=;
        fh=VjX+AVDIpAjQ76z4yV70t3rMZd54kx7bDf6PHYMQfrg=;
        b=TwaFnxA4f3WR2aN24t3RvWQaetssowmvxiCoNKJyyxCJH13UqNkJFl5sMlNMcOYVNd
         evatbfaqaza3xC+9dgoGDbBOyxqtIy4DTC4QZHroDODzBh+B52aUCJrgSdd9VDq008rs
         d3ofNFVoP+MHQ/7kl+iJRhb/N/ISxQYsWD6/MZTNzjdleWGNbMDe3GWfr3E/ot2URlbt
         tvIISVJ1kL9ExAvgA28sUnlA9KpeWauX4PBP0I2vGK53V1wJMBF1/7K3/yHksQ9JKqOE
         5VrJT7N4e9b386/oJM/Vxsb1aORKa3bQ8YRZzSCaZJh6li1+ZJEDVSHpMCrnvchDyiLZ
         sG4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793976513; x=1794581313; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EVsynTIkUKlA3sM+VFVmSipU+rZiRJg3NzlUB6F6w3c=;
        b=I6fFiPpet3LDIrtYZwCrjVU0804rG3FM7aU8xyPN2TiTV0A3w515GX/EMw7fDua5wy
         vLyJHiJxKbWFGRe6hhn5erMUxwHE4+rVEsR4cZE2Zj1YGrxM321N0JGFNAkJFxtZAWJn
         doo3BfZwVlv2lZlIB6rvt6MU+Iq9aMF+4GxvXEYs4f7lfLjm024VmqCjFN1NXESBvxlK
         PKkVkHVoX64uvhNwCa2hKyX74J0AoB95uY7PszXhiR6STicH3ZS0rS5vR8rwqeDH6Ca9
         qve7fdmCe0MUJ20BYi3xlkjOKZkSxV7NuhL5nba2Zs559O0wnWtjdvGNFZWSu7sndenB
         eLLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793976513; x=1794581313;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EVsynTIkUKlA3sM+VFVmSipU+rZiRJg3NzlUB6F6w3c=;
        b=KBdG4iwK0nk217ZLDHtm/EGbVA4Hr2yal+wTvgMGfddfjZkj+l3+lDJj97kcQdbr/I
         A25Gk4MTGajP/UdXWnFNSruBj3C4ubGJhZv5n6sXkhMWxMCKta2zmT/DhpX40T14tJsi
         CKic26saiAolwPcZQullhuYqWnLr9qiwQzmAOTlSKW8SXYhV3T1jEO4uBTAi3eFbdpE5
         xJ7mG6bY8dWVuXRUfNTKX9WiAlsuwqhaw28JFATJm64Qe8MJwyhXvytf5BY7Y6dl9UBn
         seD7zogTXcdHJcQQdd/KQ4t4nlSQV4krZ6M6yfa9MW+pIZTHqCQfIG02zUjBDtygMsI1
         eBPg==
X-Forwarded-Encrypted: i=1; AL+hErEG0QPe22v5AWsUea2gEu7Kjmo6PgkrWfdsKhJILLSyqLpJEApWbyoJrYwEF1L1k5I4BSHP4mBtEI4M@vger.kernel.org
X-Gm-Message-State: APuU4Z/R3tbP+NQs9fZkDULng8IjJ4UOu1b/R6E5PhiqzR3ts2FpQnQl
	RSwHMXEm5FjFDNctkILRMvSvCHplCUyYmDCTCAWaNhtHLgIETXM3y41fC7d64cK+BFhL/gvYCdM
	zfaLaftAfgJP4HRgMKtQgce23sXFCDkw=
X-Gm-Gg: AYBFou2gxWdISSeLPwvO/yJRPcqZeX2y60ZgW5nH5GIEeEwx5Qrz884Su7zIAGNbm11
	XphRR4WHzEXrZMmdnP9vFdq9mKVQlaCyHwXSitAbnU4wbU0gEjuGvgQ7zT1Y2FLinGA+R0Cl8dD
	WUArspaxsy+uMzGYBjmtsydzoN4JOJLDrk4Xg0GfX0VFnS6Jf9jB5sbmhz5fuzvZC6yXJDXQZO8
	TJEDKr/54OC5O6VPvpuvpGnVXwtroenvnlnYvLGb0Adu5/0xurU503KC8K53hZNM2fr2u3u4hXJ
	x29rOaBAQfkeID0cfPv7taN7UDD6p6ksuPRQAKRgk0hsgoo5+yGkiv3EmjZlH4rpgnQw+tN/mwl
	mo8oHlBBmtYd7hPGrp/PxnhjWvBZZ6RbfUuw6s+9dpegYs/psrrMzFy7HmSaTBmjczXAGy5SxhL
	5UqPXyoWw0Vc6N32K6ztUdYrXtUCCU0Q==
X-Received: by 2002:a05:693c:3881:b0:36e:ca05:8c3c with SMTP id
 5a478bee46e88-36eca058eeamr5256866eec.2.1793976512062; Fri, 06 Nov 2026
 06:48:32 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105140510.165165-1-clamor95@gmail.com> <20261105140510.165165-10-clamor95@gmail.com>
 <au3etybQlb5CtjBL@orome> <CAPVz0n3o5pc62eF6gv+PYmJh1KN1a5s=qmjxpNGJfxbCC4tqzQ@mail.gmail.com>
 <au3mloMMzQFPUept@orome>
In-Reply-To: <au3mloMMzQFPUept@orome>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 6 Nov 2026 16:48:17 +0200
X-Gm-Features: AclHuK8DwPrQnJ-dtjZgKOk6mQHPlCNwM8DshspgESp7qhKKTAtefGWbono97xk
Message-ID: <CAPVz0n1j0M1Zjj90pEGCYiNqUQv00N89oPcAxZbA7upuxhoF9w@mail.gmail.com>
Subject: Re: [PATCH v6 09/10] dt-bindings: display: tegra: Document 8-bit CPU
 parallel interface
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 6 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 16:40=
 Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Fri, Nov 06, 2026 at 04:11:12PM +0200, Svyatoslav Ryhel wrote:
> > =D0=BF=D1=82, 6 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 1=
6:08 Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Thu, Nov 05, 2026 at 04:05:09PM +0200, Svyatoslav Ryhel wrote:
> > > > Document 8-bit CPU parallel MIPI DBI Type B interface provided by
> > > > Tegra20/30 SoCs display controller.
> > > >
> > > > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > >  .../display/tegra/nvidia,tegra20-dbi.yaml     | 113 ++++++++++++++=
++++
> > > >  .../display/tegra/nvidia,tegra20-dc.yaml      |  22 ++++
> > > >  2 files changed, 135 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/display/tegra=
/nvidia,tegra20-dbi.yaml
> > > >
> > > [...]
> > > > diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia=
,tegra20-dc.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,t=
egra20-dc.yaml
> > > > index 69be95afd5627..ffeb124905dbf 100644
> > > > --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra2=
0-dc.yaml
> > > > +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra2=
0-dc.yaml
> > > > @@ -79,6 +79,16 @@ properties:
> > > >    rgb:
> > > >      type: object
> > > >
> > > > +  "#address-cells":
> > > > +    const: 1
> > > > +
> > > > +  "#size-cells":
> > > > +    const: 0
> > > > +
> > > > +patternProperties:
> > > > +  "^dbi@[0-1]$":
> > > > +    $ref: /schemas/display/tegra/nvidia,tegra20-dbi.yaml#
> > >
> > > I think it might be better to group these under a separate dbi node a=
t
> > > the top-level, making it a sibling to the "rgb" node. If you add
> > > #address-cells and #size-cells here, I think that means technically t=
he
> > > "rgb" is now in the same address space as those new dbi nodes and wou=
ld
> > > need its own "reg" property and such.
> > >
> >
> > Only 1 DBI node per DC is available. Adding address/size cells means
> > nothing for rgb.
>
> If only one node is available, then "reg" isn't the right property.
> "reg" indicates we're somehow addressing the child, which applies to all
> children, so I don't think that would work here. A separate property
> would make more sense in that case.
>

Check v5 and talk to Mikko

> Thierry
