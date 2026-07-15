Received: from mail-ej2-f3.google.com (mail-ej2-f3.google.com [74.125.228.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78656395AF5
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 20:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784146175; cv=pass; b=TAqLqcWfsH8IcWcSdkghatQYd02PcbkcR9ao2QHlhp9kqAbpJP/NSgshFFk2RMcPnF3vkpUt3v003ITTKdhEzaAMK0suwFBmCkZrLnW3kZ0aHatPFBV3RRXUFZUinUG3qMQupFVafHdpGbuG7+U/pBxFcaVMBJg6tsb/9OJsrxk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784146175; c=relaxed/simple;
	bh=6bKMUFoOov3nHfzSXonIoSh+sTcY9ShaYsuR754444E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q4eysZUvI4sao5KNhmVipn4LUvM27QXrdwXL6Jg4graT7Ost6K0RHHp3Yn2sYZA6VluYWf2pNcuwrH71zFyOHr0kVu8QAa52RbFUcho+YX5RDDuPGVLiMiuTmLilSlwSAnIJWLv2pnVtEiIJh3mGiqxq7ZBfry6puIe3LISJf8s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fZbDjAfX; arc=pass smtp.client-ip=74.125.228.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fZbDjAfX"
Received: by mail-ej2-f3.google.com with SMTP id a640c23a62f3a-c15ec8d6663so182430666b.1
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 13:09:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784146173; cv=none;
        d=google.com; s=arc-20260327;
        b=rWgTIBoLva2SND7Bl5TW9r3Lo+kIcTGov7+e6EJWI+GAamfh4cES1GEubMIyDfI/I2
         pO4Uj92IwDf5QSp+zwen+ENKvSRJQYCptwrvV+JfFrmGQv4o4OApEWspIaGpKjLFbioI
         cDu/CRaqWXVs+eonvwqIwcTLAsLBmdN6XvCw6RcdscK/ONLtRla3eDZI/o6By6jFZwLj
         WhA4EDcDZdMFsbu6+QHkyntGHcWTfBD4VVoVdWkpLoViarD4fbJHjXGpi1xV7DVLdvkr
         MgGziOGZXJB24GItUasUbsR0M19oBXcOdb0mfvQCLF2huWpf4efjUQfsBsG32eDF9gF3
         EoHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zukIYuuCALMdyDk2rEuWfswlsQCB9YpIGZVHtbRJrWk=;
        fh=kjTFonLaV3olwtx6uWdTW2yeaLyaZAzXO+htldVeooI=;
        b=MGIPtTtvoUUbkpp7ZA5mZLfjTztZJfiIl7MTgSjSehquUMPzuKsBfyqMlaRdU6IF/+
         YitpoA/2sxtSvXNQTMgsrs6PulH2Y3UaRL6NawzS2m5zirzoXuCdxpL8k0x1GVSQNh9J
         XRrhO55DRg8KOvg0fB/Z73XB8XL1sv0BbwEJT89pR0/5rvxpRZqnap1pQRTsikQur8+v
         02jmbwoW0LVq8VOP+rNARP5LVO6lr8Jn8HFtmewCsmKLnOkmKRDc0VXWXWcIhJzTCwD1
         /AXwjZTdCREizbnxq4W3LsUIychqcEPnkEl63vK1lCKeQ3R7FbCfZhUSLEFAgk2/ZR/K
         CMPw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784146173; x=1784750973; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zukIYuuCALMdyDk2rEuWfswlsQCB9YpIGZVHtbRJrWk=;
        b=fZbDjAfXKDkQR3NSW3yiQjZsAFqR9o4Vzt45+Y2dn8nHo+jUE0wvjmmo+QKftrkQ3A
         if03KbPAN7uPkALrMVpewF4yfHtO7odIheVA6WOtcf3RRp44YOzGT8Js+qt0ityat8IG
         W30EfsQs9dnIDdgW60GP6nuJcBxlaQYbfRGUHlFWD+JlRgBiGEx2iwGRXmir/ZlPPoZV
         9yA9NC9ak1iXECqYNxxdPZOLysQGA+Zytv96mElKj+oy80xWPHyAaCEXgEyHarEbD1n/
         POuAraHy5UixR1SP2MhMvBlWWRJPaV0LSGBSW8yRpEct02rFTEpYHqtoEjzGjQX/KzAJ
         mEfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784146173; x=1784750973;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zukIYuuCALMdyDk2rEuWfswlsQCB9YpIGZVHtbRJrWk=;
        b=Oz3fYn2wzx/4dNvUSlPnFERmEGBOPh9S5ak/+v21UJT11gxdfkhv46dp09f/xwGVpm
         8hyxAdylZleRV+jfcSRnhI8ApZgk4YTpWMvLQPRy/BewZLFVR8UPibVR7yxx2yPX449g
         TDWMt74VicylWH4mYebt1jBa607R8mtc+ADcarcMt8I8/XYeyIfFJ+95nAAinZVzIDiU
         7NnhEnp+r5xTaZGmuDUB7runmuRBKz75TQuis3JhdK0Eb5Z1c+tUCvvmXpIqomvNfGVm
         T/FLjjChLsCb1P+IUjrq9esgIXKxNozTrGWRpdtqwJuTrJ9ZlTuhKYutfYgOvIOi8LN2
         /fbw==
X-Forwarded-Encrypted: i=1; AHgh+Rq5QWjJPYUtDnRZBq4FaV214Z3gzg2vLilw4d3qHd6LnEcjk2s4qlz+hD7ICXAbenJ9eBgB2Kphm7qV@vger.kernel.org
X-Gm-Message-State: AOJu0Yym/Q+ldiakeMrBSrQE9Tz6mDHzB/9smggozbcUZLImH1fgILtv
	O0l8PdEwlW0S6tUzirw2JlRepor4JZAqUsEM2YtQroacJm81LrRX9EsbTnEXT3WXT10cC0lx5vm
	6F1yurw/qsI68CruQHVwd8r7XVoFigV4/tksmMzD7S306qWM=
X-Gm-Gg: AfdE7cmabzAcQWDYOayM5SlJi4JWwSmohlP3o7s3huThzUaKUyaKc531fMNUEwOOh4U
	s2cXo9dPPnEOyCUgpTCeiavMT+GE+2iB6fRiWt10wZHcLjLsfS3XJCStH1HxXaTlLdoIXAhDNxV
	p5QwOGeq3ruhqvQ16KYixXdQe5E7x8s8kWWJY1YU2/rT2P89DVVmwjC4BSnIrjW/OjThf9fNVL7
	N9ddO6DJFrZDP4t+bidesbV5X7etrJKOKh6zXcXs3WymjrhukZ8fTod+HOQ5LXXsMQrAbzLrkQ=
X-Received: by 2002:a17:907:a785:b0:c12:9285:8f0f with SMTP id
 a640c23a62f3a-c161e93cebamr1058312866b.15.1784146172643; Wed, 15 Jul 2026
 13:09:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714191341.690906-1-coiaprant@gmail.com> <20260714191341.690906-6-coiaprant@gmail.com>
 <20260715191452.4A4821F00A3F@smtp.kernel.org>
In-Reply-To: <20260715191452.4A4821F00A3F@smtp.kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Thu, 16 Jul 2026 04:09:21 +0800
X-Gm-Features: AUfX_mwA1bFOnihfrZJfgB4Or9T0LdiVICJLS_d3L7PnHRbxyoxVmIpr7vZMqGg
Message-ID: <CALj3r0gZcEWONH_TkLGagyG7JqR9CkqMT5ucxsEYD3kw4xErBQ@mail.gmail.com>
Subject: Re: [RFC PATCH 05/10] arm64: dts: rockchip: rk3568: add XPCS and
 fixed-clock nodes
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, 
	linux-phy@lists.infradead.org, vkoul@kernel.org, olteanv@gmail.com, 
	conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the review.

> [Severity: Low]
> The commit message states these clocks are used as assigned-clock-parents
> for the respective GMAC nodes, but the patch doesn't appear to add the
> assigned-clock-parents properties to the gmac0 or gmac1 nodes. Are these
> assignments missing?

The `assigned-clock-parents` assignments are not added in the SoC-level
`rk3568.dtsi` because doing so would break existing boards that use
RGMII mode. The clock parent for GMAC0/1 is currently hardcoded to the
RGMII clock path in the mainline device tree.

Instead, the `assigned-clock-parents` are applied at the board level.
This is already done in Patch 9 of this series for the Photonicat board:

    &gmac0 {
        assigned-clocks =3D <&cru SCLK_GMAC0_RX_TX>;
        assigned-clock-parents =3D <&xpcs_gmac0_clk>;
        ...
    };

So the assignments exist, but in the board DTS rather than the SoC DTSI.

> [Severity: Low]
> Should this internal SoC clock be modeled as a clock provider from the
> generating XPCS IP node using #clock-cells, rather than using a dummy
> fixed-clock?

The XPCS block does not have a clock controller interface. It simply
outputs a fixed 125MHz clock for the GMAC when operating in SGMII mode.
There is no register interface to control or configure this clock =E2=80=94=
 it
is a fixed-rate output from the PCS hardware.

Using `fixed-clock` is therefore the correct and accurate representation
of the hardware. The XPCS is not a clock controller, so it should not
be modeled as one.

> Additionally, the commit message states "All nodes are left disabled by
> default", but this node is missing the status =3D "disabled" property. Wi=
ll
> this leave the clock unconditionally enabled?
> [Severity: Low]
>
> Similarly, does this node also need a status =3D "disabled" property to a=
lign
> with the behavior described in the commit message?

The fixed-clock nodes are always present and do not have a `status`
property. This is intentional: they are part of the SoC's fixed clock
infrastructure, similar to other fixed-clock nodes in the SoC DTSI.
They are not "devices" that need to be enabled/disabled, but rather
static clock providers.

The "all nodes are left disabled by default" statement in the commit
message refers to the XPCS node and its pcs-mii sub-nodes, not the
fixed-clock nodes. I will revise the commit message to clarify this.

Thanks,
Coia
