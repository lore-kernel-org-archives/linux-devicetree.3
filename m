Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793091126;
	b=Vlb/6AGhghW/oZBWOkdLRdNSxzMH0m9OBcgK91biR5myqouyb8boLRA6W3LaBWuIy/Ts
	 zNxN0+6h6LfuG3kvMi4hPTSkG0L29z8Qmmm8e1ERSXRB4nyrzLYCXhxYSH4AdnismU/cW
	 0IxGfK0ApbyCqUgFDmkX3exbDjVOcEn1PptKO2sP/X+fDJBQscrde/gke4oonG5JE+hCa
	 2VjUX1wgkqyJPT5uhSD9Aeu7tT6JPhpT4hsapvxV7f/D/Hmzq9eRcZsbFt5cZIgHny+2I
	 nSbvph9yFqq4vP5A7mVP+To7AvyGQHVQ0WJ4iZY55hYPks+vbzRnYRof1Zg78AT8aUA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793091126;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=544Vs5W0iQqaMJeYnY15/Vfb543TMzE2RWHWwProMBw=;
	b=Xz4ha8gSJsckfxBKIZlsekGHvh2cSr1QO3KPVGBt2fknNe/BVW1wqzo6S9TMRJXJ9n4c
	 FMbs8vfKQlxpq2yJx+v54WYIeq6V6E8Qy9K4i/XXUL7VO7puAYuRQY81xD7KQD/Z8PHKQ
	 AeRB0tDrPHpeLCGHrA9w5E0QwOuXjKK92i12bdNlGND3rSci355Vt0xea+OBkdtKNkX2b
	 WAPHK3IJt0PxxYTs7e/ZgpyJxgkAyxtxcAHR93AWyCurUzNsfWFMj74gW04yk1bX4j45w
	 jBYTryagwDmmtwu9TBHGp7bKWnFvvCUuWVPRne6K3LfmZ8FLsiUqBfA7sPZvEktA2Vg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pUf0+7wZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31E1606A324
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 08:52:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D31E1606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pUf0+7wZ
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36a1947498bso208777eec.1
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 01:52:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793091125; cv=none;
        d=google.com; s=arc-20260327;
        b=VPDRv6ca+wi70sldtT93Wq1wbcUXbxR8ABIm05Wp7Er/rUdd4AoQIAr7NhaJCsPBsH
         bEAGCROdUyKDHWf47DPkXGgGt8vCUi30sOMBzzqR+6N9N8Zah3pAmlt0WxmOuvUwLUpO
         13qlazbcSlpx7FfJwmrWInQUGFHyhOvXdZ7AI6fzSDVKrnUdw3CXJcL1EaWGMhFNr/z/
         S56hDRS6esRGCQq0DJlIoMIPzj89gsK2Y2ORsJ+i+EUFa4AMUBfPHZtq4JVgEJF4c/Dv
         86lXscs/z5Yurm5Gwvw6hjViVwUiQ4ovS4mE42otv44ZpkxRyL73J+TT2Xfkcn+xxC7K
         e7aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=544Vs5W0iQqaMJeYnY15/Vfb543TMzE2RWHWwProMBw=;
        fh=ZRe6QE16B7nY0pYF9c2A0SYee3Jtt1TX8yI98nSpt9M=;
        b=LH/ALTsAcQsdBaUXjBFZzc/jSaKrY+cZkKyRX02xP4KJgea4d7m7Oe5vNstnKhkzMu
         i+U5xkCuhQgPmtIQ/sJ1m8rwf7d0W3+B4ew8hsuFwxkHSx8Bleml4RWfWGbBzZIt5UtZ
         bP4Z+W26Qyp+HKVAcQSS5pbSEkNbR/QlkkCSk3ZfvBFiiseQrqO8qemFSGlqZZ/Rz2YL
         OaWp9iHToYBvwJWi4laFEPRckNgpFllcgGH5ltPpOoewp13X6/Eo73tIyFKi+uE06Zrn
         H4BHKtNm7PisQPJIpPbJzcL8bwQjnen9Mx6KpRUbXaR58vtuZoxnliT9tFwncwE+uDG8
         1ePA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793091125; x=1793695925; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=544Vs5W0iQqaMJeYnY15/Vfb543TMzE2RWHWwProMBw=;
        b=pUf0+7wZWPc6vb08pmDR5P6yk7mSd0eNZggr2tJrJzBo7w39uEiKa1QXLZjKmWm7M2
         lND4nL5vqeLmDtdnhvuFcc0vihOhPvYKaLsfE9Bm0ztBkLkB82jqwgxcK0mUGN5F4HT0
         Yqab/3TcmGLFulnpxU5OwJi2wlujE4b54oEC7pPMBoxOyUitR1v8ONiQjoWzoRTs91Gz
         ar2IIukgQB0zJMUt4nOtS62GihnblGXHDNbM7czAPOIgkpWaxrl2p4PVrut6ORDx+vpd
         EhZZyqKNwyJxUGDJ/rfbjW5Bx0ZaZRG2zdnaTiXAaiQxEDeGAtFAkJxEEF4fgs774y7Q
         jLpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793091125; x=1793695925;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=544Vs5W0iQqaMJeYnY15/Vfb543TMzE2RWHWwProMBw=;
        b=gwJy9kCiPObKYoiW7xxnAep3Ke0j2Esmt+dzOuUDVK8r9hFKHy9tzB2kMVIkaC8f4j
         4SILHx93TQ9MMfTjKoSlaMZ568p3ieEH4Nl72VD4XA9909h6u/sL3tdYq7/4V0ugrOwf
         830hZRpZaAdopXffGkE7FrOmNtU3cUdLOx1GxIhb9ONwXKnj2QQBe0wud4zuYLGrljGx
         KGs2EPHF/+Vu6L8u3+x/n/10ZdI9A+BGWVkMDlahvQqH2efS9GmRT1OP4/8G6dDXGqLi
         Q5wzERVRj3dphbCVpVJEYsPosP/V/79XYPA76Fd09dDaSJGkzz0lkWtIBbGuhx3Xlsxs
         b2TA==
X-Forwarded-Encrypted: i=1; AKwUvBytPtTXxtUCG8m3Pvua5KHzJpXYDm7zmqHQD5Hy6fudRSl3fMTasJ0XkI4mPkjygzSt4F+bKEWJ9X7j@vger.kernel.org
X-Gm-Message-State: AFq9FYIA1KkFRzgtwgMX/3dhs6IYdIAPzPt484zIODqcWT6EpoDqCUYb
	raY884Rd9LV7IEeuuk+6TKuTvv3eKo3zdeEr3+83gtE371fadI0T3a9J5HmDsaV+bw6ZHg1Tb2j
	OcuKWGnwayq/GfMtGUViUjGGCSCvzMuU=
X-Gm-Gg: AYBFou31p0eKZHuRhJ3SKe2GI1x7l3sQo0AGadxaSi5gL8Vdl3i4E1GBDgPMUZWenH3
	0s9a9ABV2xqk17vI3J4Mf70T69tQNz8FvQ1l3bles/dnpv9WUPb2fjuhW6KLLXeLZQQQaZuaquC
	DhgIlX0Yd6jp4iAhSKIV/Vg9me9qKTxmOb/o30+/u/nOYmBQJNQxP5wBXyxJI0tX0YWul/MTITo
	ZY8xc+8NTtAzvxOh6qryBB84xmNhP+VnViqO9EIRMZ1jXjG05gvm1q+d4WQ4sLXcXvdC43shOyj
	UtZJQvW1FSkq5LJNFEbvu//qRx6ajEveL6RIo0sxhTpg+svaFI8kPGBiLe51JMtVeJ8hoh296hP
	ofJmK4X9h2bGZ8WfJqDcqUQ0hbTAOVS634UAqASVLNPB3N2iF56DEpO3TA1gVChLRRvcoBmdVHD
	d1c3lk6kTzney3vX4=
X-Received: by 2002:a05:693c:8110:b0:359:2edc:e1d8 with SMTP id
 5a478bee46e88-369e836b39bmr13749085eec.5.1793091124761; Tue, 27 Oct 2026
 01:52:04 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261004165204.205660-1-clamor95@gmail.com> <20261004165204.205660-2-clamor95@gmail.com>
 <20261026222928.GA15139-robh@kernel.org>
In-Reply-To: <20261026222928.GA15139-robh@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 27 Oct 2026 10:51:52 +0200
X-Gm-Features: AclHuK8LjCWDpNP4DuV4ZuevBx5z2yzl2RQeYjmP-HIeitxouPX3pu1AzADU8K4
Message-ID: <CAPVz0n2rkWikz1CZhkKiZnX5P+NdDH0RfJi69AyVTEV7qw_VXg@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: usb: Move Tegra-specific Chipidea USB
 properties into a dedicated schema
To: Rob Herring <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Jordan Viknar <jordanviknar@gmail.com>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 27 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 00:2=
9 Rob Herring <robh@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sun, Oct 04, 2026 at 07:52:03PM +0300, Svyatoslav Ryhel wrote:
> > Move all Tegra-specific Chipidea devices and their properties into a
> > dedicated schema file, by analogy with i.MX.
>
> I don't really see the point given it is only 2 deprecated properties.
> Maybe those can be removed? Depends if they are deprecated and still
> used or deprecated and removed from .dts files years ago.
>

The ci-hdrc-usb2.yaml schema contains properties that are not
applicable to Tegra, and conversely, Tegra-specific properties are not
applicable to qcom, nxp, nuvoton, etc.

The 'nvidia,needs-double-reset' property is required for Tegra20 and
Tegra30, and it is still actively in use, as you can see here [1]. Its
marked deprecated state appears to be incorrect, as it should simply
be restricted to Tegra20 and Tegra30.

The 'nvidia,phy' property is still used across all ARMv7 Tegra
generations + Tegra210, as the Chipidea driver has not yet been
converted to use the generic property. Therefore, while it is marked
as deprecated, it remains in active use.

The example I added is from Tegra30, which in the real devicetree uses
both properties, so I've included them here as well. With your
permission, I can remove the Tegra-specific parts from
ci-hdrc-usb2.yaml and tailor the proposed schema to better fit the
current state.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tre=
e/arch/arm/boot/dts/nvidia/tegra30.dtsi?h=3Dnext-20261026#n1146

> Rob
