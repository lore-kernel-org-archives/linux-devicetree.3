Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.221.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793962279;
	b=C6RRfKh7wTFEn2gJn1FAxgk7V+mwitqW0jeN9zIRmky17LC2uC1RvWcOtz7OJ9dv55KS
	 tnRqvD5G58KvZVPi+eqmYaKqyJWJnBBip3Mbt9asKfpBOSvCroKXcgWtlW9Mes6RuZ0y6
	 v69G0dqd+3F67SyOYgV943ImrB/gwlajwE2rRxsuI6qIgsrownQRmQcNoq656238M4cZE
	 g4xpPS1T24akUnRtnwGp3Pa+/tzmUHogDskzI+ihFPX7BMjqMUIaeIaUAxzDupoxaFjPt
	 DVd+rdpFonHLVpOousKp/Io6adEU91LaOyWZ2SaDBR6/5WX/jUqyVo+1z08NHiHAhCQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962279;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=F7cZJhjMigMK3SyfW4mjHv4UpuzgfCewD2MzacTp3SA=;
	b=qeFQjVOiG3C0J63nihlzF22B7MQk3xn61C0CIaq4yKPoxS/snjKkeS79YtsdEPp7Lppw
	 rG+lJx3d/fZgyytds6k7jEijibtq5TVfd7WahfFRjEUIzjY+WgtBipDjhFNra0/iZGWVF
	 rI1PQcAh/EUVxYrR1slOYbNm2dJ3ai28vt42ngXWkl4HM+4I5pTMFlZf7Z8PdguzDABBR
	 CKfHitJdejX4krOlnG4jQ/5qsoaiDv0fD5Nmkg1MMM3SBKE0JD61zFv8/vPovrGn9y7/b
	 Ri4ffo3k5TbyeiizhkUATdlU7F8DlGHzbiCG4xxP+0y8IMqjMYXuCvRRhzu6WSEkZAQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qavf9uQh;
	arc=fail smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DDE606A32F
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 10:51:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19DDE606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qavf9uQh
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso228287f8f.2
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 02:51:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793962277; cv=none;
        d=google.com; s=arc-20260327;
        b=b+GfrfyHTQubcwx4pSUNT+y3XE568Pday8wo9SS1LIyatp6l4+pi6eiFM9hUR5aHvw
         NZna/NsDUsXHtSwhzQdwL4idAeS5HnBaxZgiEn9X7aihEiuRC2qYafmcGb+dqipcDhu9
         VhX2rpGdMde2hNzjM3oFj35wdg/y7Jv0G2hLAuRTuikUUc1SSdQZ6Q+scOQvppYiZGSh
         6Yi2RhJ/QvxYC02lqaTOMtAmte/TX9gsQD2zVhHuV3JJzAefdq/mJSlAP6N2fblkcGXj
         TlKtJxXjQyH+swh5o2atBqpZwLFDGJH9RoHfIawhF3SisGN6nnaumFQ78dokVVW2+c0s
         e+Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F7cZJhjMigMK3SyfW4mjHv4UpuzgfCewD2MzacTp3SA=;
        fh=wxLlhfVO+bWprUKXG06uLVz2tUDOt4+eBzUYGV1f1fU=;
        b=O2C4ttOQa5v/nvJi33hJYKCDn+W9rE0eC8kapeAjuscvyuiqq5RBjuW5fyNbzXeaOk
         q0gKzCDaUnwzyP3c3pVPELb+Ts2jubz7pdnN1rMZBOfWx7HlV2luSWDXQZtVEd3YbNbi
         4q/OkCOozQhZLFQ88YGCZtdRqv1c6yIKKiUCkjFqNhw4hA2dBzNVSrmaoy6oM3Af75zp
         DQZLJS23FCDuChBFsRGutvkddNs0Y1QUpeoKbCFHrtcSrThhs0b7a0zAmrvJ7B6yW0DU
         cYV1yOYFgfpsIwVRIq6kQLjuNoZFc/D+p7dCcxpjmtiLNueFDRAx4XXqCp4/LVT6uCYU
         l/hw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793962277; x=1794567077; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F7cZJhjMigMK3SyfW4mjHv4UpuzgfCewD2MzacTp3SA=;
        b=qavf9uQhhEstBSLlU5BG5brVMdHumR/aLgNXeFGpb5Jl771lB8oKGm/ZFzl/OJMN/T
         Pj9PB5hRDpNq8Gb6Piw2Nw1MB7y0lwEzM/dF8BZdXzUaONxb3aCxzyue/+c81NEcrcmZ
         jGMStvejbbmV7RBw8w6FDvMsB02ACYw2dM7zqBTZNMWR9tqm/lVkZl8ARqdT3GKrEA9A
         gLYn/qBUwBBGeJ0MH85YGu6UnEzAZRblQlpZxDDhaGboJV7jpboX+w0oc61TKSPl0511
         Ff+Lo2LyfE85TXniLxLMT5zDkPfTYzKnGjHLygB8R+9lLJJyx0MUQMfzBEG97vyD5QFP
         dzdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793962277; x=1794567077;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F7cZJhjMigMK3SyfW4mjHv4UpuzgfCewD2MzacTp3SA=;
        b=Z4APpLSXaGn2um8MqCXYKBE0udYOU2y9u7FNwVzjhIz3X3Fd0wkdYxTYS6JWeDH28O
         dhL2bWjDmqHCJVeQa7o9cct+vjU4VYpaqXTDjuNrVc3eJNVecIyIBK9Xh+L0E7Tjj1F1
         kuWziqmoW+imLdUQKGPfE6694TBuMs25N6CTATeq1pUYVJalxC8WqwsMCMUuqFNCAQrP
         xlmwsF+ifov9qZ09B3tjTdndEoyCamM1jtznYM6IIwqbD8Mz5IF4IFGL2p59vz+JNrpa
         4cCONtZ3vQbLgF3tmFWccrVJ7mWTQvME4sXFDP/NUQikNBal9ulWo10Udrx9tD+tPnZF
         dnEg==
X-Forwarded-Encrypted: i=1; AL+hErH29WeObo6M2Tmdf1qeWum5MxT9DO4ozidO/AnZrAVTOY0XuZLZqNwZNVTLQBExcphaYtX4Atosqerc@vger.kernel.org
X-Gm-Message-State: APuU4Z/iEYAxzxdyu/NreJ2+BZ7iT90/ezNEQUpiEm8GFJZS8UIm0nbM
	LTmC4XhdtCAPBpDleNIXoYDTk3VC56PH+1k4uOKvToG/Eve2evSk8yCQXW8q9Xiv9dD7fwIxyzE
	n775U0wjyzGBN+IEVqbyUt3GSvxvRfOE=
X-Gm-Gg: AYBFou2gZ6M0BI88gDMTVYMwz0oWKVqzwCUOfXmRFwyN5QeGyqmMr6y3vbGcbqrRJoE
	hMXCCGS5E/YbPScf3LLYm1le4xdXCo+4w1hgiw0tfV6ul4oN2pL4lfsrXXvgeqNJmEzpfvB5Zbo
	xj7txXfNmacZ3w9cMcoMe4ffyoyMn8dJIHCfzDgrBye+97k0hxXB3+An1TrGfGBAxMfGpEEepMN
	g+SrcNNKu6tF2vmIS9mjKOi8xs6Yxl+50/eS8dZZI9S8DqokzBSplYjMdK2iPFN723gZlO55qCD
	9xH4vSuHIv5MWNlExLmzhjZyQpsAbgxHol4yyQyaDvEzqpPKClPwBdSbHM8kPLiHKDDefWqTHrq
	f8TOX91DsDesCAXhYjyy9hqVq0fG8nvOJLLV4HnUduEz/fD7qOhFHuqwuy9l4mAOFM0fycgOE56
	jrYwX508LUHUlJOyLuWFtUGg==
X-Received: by 2002:adf:e84c:0:b0:48d:e5c9:39a4 with SMTP id
 ffacd0b85a97d-492775eef16mr3368306f8f.33.1793962277232; Fri, 06 Nov 2026
 02:51:17 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-mali-c55-renesas-dts-v6-0-7dff41bf7107@kernel.org> <20261105-mali-c55-renesas-dts-v6-4-7dff41bf7107@kernel.org>
In-Reply-To: <20261105-mali-c55-renesas-dts-v6-4-7dff41bf7107@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 6 Nov 2026 10:50:51 +0000
X-Gm-Features: AclHuK8e9Ukwsf61t80TfL34Hr9SEzBPVRwsLBuotfmtVU3xNlxjqp0s36ik-9E
Message-ID: <CA+V-a8u8WS4Ut0f1ELWPciY1wvtWtBS7UwOSaDg-q5wVFt8bpg@mail.gmail.com>
Subject: Re: [PATCH v6 4/6] arm64: dts: renesas: r9a09g057: Add IVC and ISP nodes
To: Linus Walleij <linusw@kernel.org>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 1:17=E2=80=AFPM Linus Walleij <linusw@kernel.org> wr=
ote:
>
> From: Daniel Scally <dan.scally@ideasonboard.com>
>
> Add the Input Video Control Block and Arm Mali-C55 ISP to the device
> tree file for the RZ/V2H(P) SoC.
>
> [Rebase onto v7.4-rc1, place the nodes in address order, add the missing
>  interrupts in binding order and name them. - Linus Walleij]
>
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 47 ++++++++++++++++++++++++=
++++++
>  1 file changed, 47 insertions(+)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot=
/dts/renesas/r9a09g057.dtsi
> index bbaab75681c2..10e3434d0997 100644
> --- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> @@ -1849,6 +1849,53 @@ queue3 {
>                         };
>                 };
>
> +               ivc: isp-input@16040000 {
> +                       compatible =3D "renesas,r9a09g057-ivc";
> +                       reg =3D <0 0x16040000 0 0x10000>;
> +                       clocks =3D <&cpg CPG_MOD 0xe3>, <&cpg CPG_MOD 0xe=
4>,
> +                                <&cpg CPG_MOD 0xe5>;
> +                       clock-names =3D "reg", "axi", "isp";
> +                       interrupts =3D <GIC_SPI 861 IRQ_TYPE_EDGE_RISING>=
,
> +                                    <GIC_SPI 860 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 864 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names =3D "isp_vvalid_ifp", "isp_vvalid=
_irp",
> +                                         "isp_int_fstop";
> +                       power-domains =3D <&cpg>;
> +                       resets =3D <&cpg 0xd4>, <&cpg 0xd1>, <&cpg 0xd3>;
> +                       reset-names =3D "reg", "axi", "isp";
> +                       status =3D "disabled";
> +
> +                       port {
> +                               ivc_out: endpoint {
> +                                       remote-endpoint =3D <&isp_in>;
> +                               };
> +                       };
> +               };
> +
> +               isp: isp@16080000 {
> +                       compatible =3D "arm,mali-c55";
> +                       reg =3D <0 0x16080000 0 0x80000>;
> +                       clocks =3D <&cpg CPG_MOD 0xe5>, <&cpg CPG_MOD 0xe=
4>,
> +                                <&cpg CPG_MOD 0xe2>;
> +                       clock-names =3D "vclk", "aclk", "hclk";
> +                       interrupts =3D <GIC_SPI 859 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 865 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 866 IRQ_TYPE_EDGE_RISING>;
> +                       interrupt-names =3D "combined_interrupt",
> +                                         "fr_dma_writer_linetick_out",
> +                                         "fr_uv_dma_writer_linetick_out"=
;
> +                       power-domains =3D <&cpg>;
> +                       resets =3D <&cpg 0xd3>, <&cpg 0xd1>, <&cpg 0xd2>;
> +                       reset-names =3D "vresetn", "aresetn", "hresetn";
> +                       status =3D "disabled";
> +
> +                       port {
> +                               isp_in: endpoint {
> +                                       remote-endpoint =3D <&ivc_out>;
> +                               };
> +                       };
> +               };
> +
>                 dsi: dsi@16430000 {
>                         compatible =3D "renesas,r9a09g057-mipi-dsi";
>                         reg =3D <0 0x16430000 0 0x20000>;
>
> --
> 2.56.0
>
>
