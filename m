Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF734E534D
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 11:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792409200; cv=pass; b=KN8MfVSYDIWe2D+EEg3SzjnDhCvN0B9fxo88Z5XqwxGELkZloG9DoOHKBpt5eZ79975DK7FA0mSYVszrUHlfdRQ+oHV3MXGcbzkHl+h8/NIYyxQDp94IuPITOz67F59kOAKlbLYYmngd4qYn4bQQwNX83OIXg0aNHLVe/eWoxy0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792409200; c=relaxed/simple;
	bh=NjvtDbKF6HXkZCMqwsd9sCUJNo+Nw1euiIQvE/sseso=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=poGyN7P1ko8X42fED7U8f+d067GdKVdhi5ZZ/lTr2d1f3PVZTLNjkJPc3y9U69vi2n4r86Hml774/Irkl6qRzVJ4mYeHs+ZNrzL4+vZK0MCHkorbJ5qE4KkLb6epiUrukLTp88R8LNuvtZ9i/GmbP+QwMsZ5pKRSeQ7CqRsDLwk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lD1QQ9YH; arc=pass smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lD1QQ9YH"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-6768403e9bbso1376942d50.1
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 04:26:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792409192; cv=none;
        d=google.com; s=arc-20260327;
        b=KlYAZNRqrv/Oo29wGLSKTHJGAcXimpYm5LqBplRRO7lnSbjRcmjMjBZnAMXJ2dQXsE
         F/ukiF4rM8+HlIwLP4xOwVTahXlLipiE5heYoNnwTtYaPLsoMcXfcFmQYt7HgA1ccjE3
         QZ/IMq+Xn+sFXbMOVW52b2M4eqVQ7KmdHgWxbZn4F4E14WI7JWpJtMjrGk1Xsleu4YQr
         2Ir/zMqlZOJxY9luzZ8iX6G0rHL/JN8NByntzy7qcUHGJJXNFfdxEm9r7A7382iMHYKU
         lhrKyPm8FRdJjB9g2Ds23opnplvxMQKWKqqO/Tisq87hAbbKfCAuTjD1EBkN3UstlkoC
         jtCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GTD0jeXtR60aME/UdLAfLsdgVjEQHvE/dqZ2xHjZShQ=;
        fh=OMoxMGiVwiXViK5gZLv6JDOLMDBjyVgF4M9smNsEDNM=;
        b=lBx8Zc8CABboC38a4OPTpaw7Hx3SmKE99xG0qDItgEUOClts/jrqGQ307x7/2nAFAL
         yF2EWlkO/gwsRpa2x4CvNVPOxKUy0UHpcYZ2TTAUSDBN8pUh87JmUIQMtt1QTPL1qoxA
         GbdkEYIX0733Z8yAsmjxQqrdvcNl1aChrL9Thbe79W+RcH5q/8YcPlA/MPuKRa5lAf3a
         W7tfaf8AEWNtlUrJXmSu7rv4KsWLu80G9ySDdop9LmxeUPKf1Eci5KKCK1snWGhGNVnS
         5f0sqbBu4DoM8SXXlQVe8I9h9kPqCLYTcXlZ8lk9c+4qUAtAMzN6CI3OJiFx0z2GQe+3
         NrlA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792409192; x=1793013992; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GTD0jeXtR60aME/UdLAfLsdgVjEQHvE/dqZ2xHjZShQ=;
        b=lD1QQ9YHwcxcfb9TQhswu+Ci+TiBOawx7r4a0gt7brNLXnxv1n4k6CyoA7kpBBRiJZ
         Nxuoc8vFMAXptnwT5IHq+1/1YL1pn4AFxKwOdYAl9qYWvSaO43e18c6xnZgsbxfDVvcJ
         7lDPWKrVPfESajInGUBhgOoDZzqrCZ1fK8db5DJKyakEmX6b56pLAkn5f6rzwLUP4F0E
         V+iWeSrJI3lDp2o0pg1Nz8Qw5CwtsQX9EtAPtxDTU+Zyz815yiYCNP4tVZs3HXs/VWJs
         O0zvk5/j9JJRfs4rKiEGA90XXJwVmodlm4RBfBmdz8O6MVhbljztZ3U8BV2nmKA5Dr0K
         OxkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792409192; x=1793013992;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GTD0jeXtR60aME/UdLAfLsdgVjEQHvE/dqZ2xHjZShQ=;
        b=VHLLDca9fb0+w//9Y34SeiIlg6EU0U8hrZ8voInZQRsQ0I5RR8fNRlsNskREkaZFBX
         nQ9J54/d89ap2vHV8TaZynt87eqn2m+ABbOOzoIIhdMme4DpLP/VxJ5ALLmyqaos5y5O
         vra6GRxX8EQgOwft7V7rp/EddyEb7h2xicdRnaPF9avCNm0U6PewkQt245NEmUHZvfwa
         0jeXqXWSz8hl4CC4Vr+LHJYGLjaSTBG9D4TVGbyNv/LDsS87kr45iZDgr8tfcy2TvCy6
         Ii/S5pwdVQJiRvXm040ub/ZGvmAj/Wr5bSng5iPxqePIQU8yUJ0dSzzaChy5SoSsyEJb
         uENg==
X-Forwarded-Encrypted: i=1; AKwUvBwTyg1DQMNan1CGRmxUc13AXvq7zSabBPa/Bid7t0r7y6vKjE7HQt5uT2Oa4A/5z7dMDLUlYzWCXUgs@vger.kernel.org
X-Gm-Message-State: AFq9FYKqZgHyR12KUaB9V1PFyKRdkEkOg2w6LN5Xd87eGxeLVIZklUGL
	4Vnw2GbPLKRflfsi7v+sCHrmc+wLusNMquYJIbc4KciIrloUfcusbJLSz0m4b/921KPxaR7QfHe
	bZGpZHWTEKB03P6ZgfXnrAEIl5Y4FGsc=
X-Gm-Gg: AYBFou0GwOZLEevgcffaQuVpp9R+kbmcD6RAhscqNaRR6z8wCnfzp/d2SPx5wmURulJ
	r3ImBlMVA67sICvAsr7tWpxzaXyPUj4UwTxNd50Iy3E2aAK+k7rsUNbzc9796oXRRww10xgLR2C
	bBzn7PBBWYbXvAaDwQ1fFwTBzTJ6ab5+IvlOzGMBUgFtm1jIcDyLFlM2Xp5T14gVdfOUcDVh3B7
	b1P5bZ7M91JEubrzuO9jeEsO1FL6z4Q+ifc7d7d86Pten2OJZhppWJbSLvEV1MlfyqUT8CimVD0
	sYoNI4dzu/uszNM1YPyBN3URziqUpMLfbnSKiDGdmWOPtL8FLDlB5l/ZaVlIw20a8IPCeO0BFyx
	J5j9OF43ST8yHCdSSjs5HmBYmIMJf2G+AnrhIOirm29uAJhjehcmGDUO+H4SDgaap1T2IqQPYDd
	UgIHkzTg==
X-Received: by 2002:a05:690e:1347:b0:675:66f1:5ed9 with SMTP id
 956f58d0204a3-679ca90ed21mr2347287d50.101.1792409192148; Mon, 19 Oct 2026
 04:26:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261016162912.64581-1-lukapanio@gmail.com>
In-Reply-To: <20261016162912.64581-1-lukapanio@gmail.com>
From: Luka Panio <lukapanio@gmail.com>
Date: Mon, 19 Oct 2026 13:26:21 +0200
X-Gm-Features: AclHuK8NAOp_nRQSq-Iz-AG3DYdUQ7KXnVtQSaGV8OFLCu20HF33SdrAf0b1-9c
Message-ID: <CACi=Ov6Jg5eUxskBbmtWOS03jta90RK0nByhWf4EQs1PNhvuKQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] backlight: Add Awinic AW99703 driver
To: lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com, pavel@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, deller@gmx.de, 
	daniel@riscstar.com, krzk@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, junjie.cao@linux.dev, mitltlatltl@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Daniel, Krzysztof,

Thanks for the reviews. Before reworking this for v2 I'd like to agree
on the approach.

Following Daniel's suggestion I'll add AW99703 support to the aw99706
driver using per-chip data instead of adding a new driver. The register
maps differ almost entirely, so most of the DT properties stay
per-chip (dim-mode/UVLO/ramp-ctl on AW99706, OVP/OCP/inductor on
AW99703).

Following Krzysztof's review, the AW99703 binding will drop the
ramp/transition timing and mapping properties and use the standard
led-sources and led-max-microamp properties.

That leaves the one common property, the maximum LED current,
spelled differently in a single driver: awinic,iled-max-microamp for
AW99706 and led-max-microamp for AW99703. To avoid that I'd like to:

  - add led-max-microamp to awinic,aw99706.yaml and mark
    awinic,iled-max-microamp as deprecated
  - have the driver read led-max-microamp for both chips, falling back
    to awinic,iled-max-microamp on AW99706 so existing DTs keep working

Does that sound acceptable?

Thanks,
Luka

On Fri, Oct 16, 2026 at 6:29=E2=80=AFPM Luka Panio <lukapanio@gmail.com> wr=
ote:
>
> The Awinic AW99703 is a high-efficiency 3-channel WLED driver with an
> integrated boost converter and 11-bit brightness control over I2C,
> optionally combined with a PWM input. It is used as an LCD backlight
> driver in some mobile devices.
>
> This series adds the devicetree binding and a driver for it.
>
> Tested on the Nexphone by Nex Computers.
>
> A board DTS using it will follow separately.
>
> Luka Panio (2):
>   dt-bindings: leds: backlight: Add Awinic AW99703 backlight
>   backlight: Add Awinic AW99703 backlight driver
>
>  .../leds/backlight/awinic,aw99703.yaml        | 131 ++++
>  MAINTAINERS                                   |   6 +
>  drivers/video/backlight/Kconfig               |  11 +
>  drivers/video/backlight/Makefile              |   1 +
>  drivers/video/backlight/aw99703.c             | 583 ++++++++++++++++++
>  5 files changed, 732 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/awin=
ic,aw99703.yaml
>  create mode 100644 drivers/video/backlight/aw99703.c
>
>
> base-commit: d419d682257d813f6cb7a28e42b35d0edf4ad038
> --
> 2.55.0
>
