Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7628C4D1794
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 06:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790058586; cv=pass; b=ao4KfFSm7zaMuvJShjlbZP5x6YsmGzbBiXTs3W858XyYKKXDgV1SJgUDunZ8rZmKvHIS0+NNmXV4DI/gmgla7sMpwf2pgOHQsSXL3zxf00DB5D0KG9BqKZMAdGC2rl/JwnbQC1uASd3iocFGtFQvmnnymS7HRjW1dvfyATRVqvE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790058586; c=relaxed/simple;
	bh=WMopLKvR/pUfd2YF3exYBV6b9DrcmKXGK/JBv+4BYaY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ld7EHPxIJ6UCfsXjRiUQVLCtccGP1FIXIN+1DsnY9ADGDpehDcs5l+OF/KNmeodXU9pDI9GY6JnyrWulmgpHmUGs0o9lRdnTuW6+p3IfuFfRAGC6yKW6fshW+5rejNvJBoHuRkS2yDDn11h/CNCwUjMCk/Exp5Fg0r0fnP1r7Vw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ads0/kQN; arc=pass smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ads0/kQN"
Received: by mail-pz2-f40.google.com with SMTP id 41be03b00d2f7-cc5121bcf1aso3055415a12.1
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 23:29:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790058584; cv=none;
        d=google.com; s=arc-20260327;
        b=rFZxjvnYJeLUmQ80ig+5VJ9M6IGXEtGsM9qlx9jSo5g+8h6pHzDY0Kw4xI8cyIjxlG
         8Ob1uhwyu0fiwsafFE85boXgsexnm+XDPP10qnhMRLfElPdDIk7OxDkOEYmbNGy17fO1
         hcGwE4pcrxAeLHuysgNLKWXUhd5BaVVbxVLfBTCTkru6pm/ghkJUzc6rQ1iEgAE9fIVP
         6+qlvwm4yBElGG7OEe86JdHVSX2zFUPk0jtYsajq2wItKgDia9RgETBF9PxkZKkSUIZp
         Ubx2IoleMpxpUeHb4QpDpx2m7CgAAx2hAb4AuUt8ySlYxyu+9SeFEM9ZWJ1F0DRNiJkM
         IxDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ing5JC6tleS+Y5q+zrefvE9RUeGgTougjus6FkCTzfE=;
        fh=wKcUYLkMrcoueqYprbOKYPVqWTEwWCvx6FB6rS0UnVY=;
        b=Pl6RoA1+/a/x88sCdwfeYi3I8vi4AeNzCx0+59QxYdoYPKMoBDp9Yt8cfoxcogf5vf
         /xqdt8EWFDcBQ1Qwzi+WAVMenSd9NWaynSU5Fqi/JMtiezBMgNu0KPMY70Tky8bq8EYY
         kqL3yxBU1j/VHYtDj+ZH9m0BHZZ31Hm4Kr/BjQZJYK4H5ZbrydW97sRMZtkwPVksHcIc
         9sD0USiEbjGQuBtfBFDNvvZBGuC/C1Sy8EQkP4Wn1m0EHh2qTAVDSK5QAeeEI7jfT/yj
         EGPa2tguhdXV1/GByPVg6PXZinVgeQfbRFqiRXy2VxzJt4ZpAlArtUyK2YndwZKg+wmV
         oznA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790058584; x=1790663384; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ing5JC6tleS+Y5q+zrefvE9RUeGgTougjus6FkCTzfE=;
        b=Ads0/kQN2vtUwcoG8QLHfoFhrM+QXCLgy/bTVR2HYnnIY/tlRnZDMrR1g/ejfPLW0f
         XEqhj/WqZ802LJZ7RuAMIHTLdCiEJNP+LXRYmkbWZOMaxFtTgoULmZBaTBYU43qIMuRg
         eIb+208ZJcLaJM6BQWjPm4rByHAB2LYTJExPetdZDiuJJorlmnCl6CTfjmyXPUlr0JEI
         g6pnNgmi9NzUJcjyt9kcE9or1OD7eKBNnA/6qaOeMD5tkteCx4YYXwsTW0d+lKmvXFHu
         EMmjBDyFg2J6FBPAtik4LbD/e9XeMCrY/JgA2HCUq3fA+0ISgOx6eWz+1BkZYDjY1B6Z
         9icw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790058584; x=1790663384;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ing5JC6tleS+Y5q+zrefvE9RUeGgTougjus6FkCTzfE=;
        b=Jh8lHACxkwyy9A3+/4pr3ckwH2s13pPutC+1TzrGOmznrqR/Nq2GS7DWbWB8uuy0NP
         qB1w/GRk7SL5rNsct+XBwzMAuWUe9VICtj2dsgWMbC3jsdeGu5zkI85UdzhFlbBNNm8b
         y7I0kSsK2FosVe55PLZKjEhjOZKR0kFwy4GP0OeQ6PnZp78OJmPgilWUzaXD5YJ2zgi/
         UNiA+QfBXwOST0F4mz284T/gu+mZgEIs+FBUZK/PFmI8XNZ34t76RcbO3YJa+yl0iWfJ
         IqVghaFPMNad5UKkx+Pk7onNOcYO4SAGl2oerji/vahexgkwUVj+A1pE29F3ylYyL1lU
         m5Bg==
X-Forwarded-Encrypted: i=1; AKwUvBwvI5XxlN7pwdAtqHNYHH111CGq/HRMByjjJY9Lw00BJOu7Pk0yEXBZaoCOabgtTVYZ7vOCrSgDYDRC@vger.kernel.org
X-Gm-Message-State: AFuF++kum2Ap4lIRDeTtaK2p6HrH6Nd42ZO7i7g9sSnXx6aMaccSj8Tz
	UAOExl9J+xTgU9rysM2Fc1lL3Q97hcCPTxFG4kxs/cEJM9gUo+bpliqWVr8HKX/Tt4d3ibqDTfK
	IfyBm9nbJnq+8w+cJf6cne+/8eHiBG9o=
X-Gm-Gg: AYBFou1MTA/Txu9k86O4y7lriW/UYgFiecK7QUSPTTjESVU6oQGgUYhe3+ML9ipgUDy
	2qT1TjKLrD+AZ7QY1LvFLOFnEVfuxJFVAaS31xHRynfWlWDQ6fRI7qXXhw4FWBnm9Kd9BHCk/iU
	g/8lBvjfiYOPk5VIjvOa5lZagaSxc8BHHOZlg6zp94ukdOlXBp9FycH+CI9anJIJUz+u4ot2yT3
	zHZJIv1TQ67qoIPL9nuVEvlEfE339uuaR+5S2CIiAGQibfkbN5rqgeqqmUqh72hXKCi/WkDvM0/
	ZXvGToi4U5FqGfEgw22UdabzgA2vNGjvtGOd+yU8ztuiJmPXyVp0ExMXkTajXfHz8rNZALxjmQg
	DHNu/bwT1qmzi
X-Received: by 2002:a17:90b:48ce:b0:3a0:4066:d3b0 with SMTP id
 98e67ed59e1d1-3a07327d177mr173825a91.59.1790058584580; Mon, 21 Sep 2026
 23:29:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921180250.3223545-dts-florian.krischer@fkr.dev>
In-Reply-To: <20260921180250.3223545-dts-florian.krischer@fkr.dev>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 22 Sep 2026 09:29:32 +0300
X-Gm-Features: AcwNN1VHLuPJpyDqBJ6Nhj2r3qY1EQ09O50v17uUs5s9CMRX1Up_T9siUpW14aM
Message-ID: <CAPVz0n1OrUwmwfhLEdMtfnQELMFyf-Br4itWTXin3b8pSSE1rQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: tegra: Add embedded controller to ASUS SL101
To: Florian Krischer <florian.krischer@fkr.dev>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 21 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 21:03 Flor=
ian Krischer <florian.krischer@fkr.dev> =D0=BF=D0=B8=D1=88=D0=B5:
>
> The ASUS Eee Pad Slider SL101 has an embedded controller for its
> built-in sliding keyboard.
>
> Describe the EC on the PTA/GEN2 I2C mux leg. The EC responds at 0x19,
> with DockRAM at 0x1b. AP_WAKE is GPIO S2 and EC_REQUEST is GPIO S3.
>
> The node has been tested on a physical SL101 with EC model
> ASUS-EP102-DOCK and firmware SL101-0202. With the ASUS Transformer EC
> MFD/serio driver and the SL101 event-protocol fixups, the built-in
> keyboard works through serio/atkbd.
>
> This patch depends on the ASUS Transformer EC binding that provides the
> "asus,sl101-ec-dock" compatible.
>
> Signed-off-by: Florian Krischer <florian.krischer@fkr.dev>
> ---
>  arch/arm/boot/dts/nvidia/tegra20-asus-sl101.dts | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> --- a/arch/arm/boot/dts/nvidia/tegra20-asus-sl101.dts
> +++ b/arch/arm/boot/dts/nvidia/tegra20-asus-sl101.dts
> @@ -59,3 +59,16 @@
>                 };
>         };
>  };
> +
> +&lvds_ddc {
> +       embedded-controller@19 {
> +               compatible =3D "asus,sl101-ec-dock";
> +               reg =3D <0x19>, <0x1b>;
> +               reg-names =3D "ec", "dockram";
> +
> +               interrupt-parent =3D <&gpio>;
> +               interrupts =3D <TEGRA_GPIO(S, 2) IRQ_TYPE_LEVEL_LOW>;
> +
> +               request-gpios =3D <&gpio TEGRA_GPIO(S, 3) GPIO_ACTIVE_LOW=
>;
> +       };
> +};
> --

Hello Florian!

This patch is fragmentary and should not be applied. I have prepared a
patch[1] that adds EC nodes to all supported generations of Tegra
based ASUS transformers, but I did not submit it yet, because until EC
is picked there is no sense in this. Patch will just hang and
eventually be lost.

[1] https://codeberg.org/clamor-s/linux/commit/5d7b9ca285781e0eac35e346a951=
d949a61a2f0c#diff-8ffbb7ecec9cab371ba8535ba3c046f01371afd3
