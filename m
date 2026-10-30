Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793364915;
	b=scR+L/Dr4Szm733SuMYWz+3ZipAD9+EjVDoUTKzNRD54fg9b+NgORPqsTVdA0Pc0IRl5
	 apw5PAyaiAOFIPuq69XjSeT1TLcRGyTg/Kbemy3WuFLLJicorRYWiRszdE0onUqvt9Hzz
	 wJSxWMTUjOIV/ufYLT7wciUUygrYrcNDtqhrzu+o7Dfj5g+efTWJYRnzHNrrOdhNn1ane
	 9/h7e3GJ/v2giV0FetybFMgviEhmWoZtz89EWzbwBVuAUFhu1zT4Qbmup17lOEesprl+6
	 rqzB5BhoWyi1Mt7Oa+x6Nsemdi0Tj29VLmZc6XfqQvxtOMVuwLYI4MWVkCawHMQWoMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364915;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ADkHYmkMwBZ80j2ywUEBsGaQ5dDf4ITxrpJIMVdHo2Y=;
	b=5ADgvpSSTKR1M4mnX7xjs4G5RZ0xkzzLER8yZSuSSSou6QKMhoZlujuY3k/H6K9D3Iiv
	 Bx7sFfSEVpn9ua8jmZ84N49u8nYyHHGGu6OkFbO4Oqk1RF41/bIRDD3GX8dyk3zA7uAyU
	 ZxOQa9fR60YTmh/bc2hAqvDc5ZPtKZXyrGweO8+ZGZTzMq6iaSpeilx3qffoUZTe7KS1A
	 IwujAmgOQLrIBOUWo0chSGYGwOC9D3jz6p2J2fCa22QkBSFK5VyCaLMpflN0v37Dr1l1A
	 4geHeHiIfN2a1RD3Y2vdWoXHivKV+WL7oB3oHX5141LOW3XP33vb5rVyVJ4sI2R/gSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XVmfsqe+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05E7606A31D
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 12:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XVmfsqe+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 078191F000C1;
	Fri, 30 Oct 2026 12:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793364914;
	bh=ADkHYmkMwBZ80j2ywUEBsGaQ5dDf4ITxrpJIMVdHo2Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XVmfsqe+4mxfHjfpmjekFl8iAbqc4o9ccB3E5WNVS2BeT6kBJisaV8I7hWwp1rzen
	 NTmtHF8vIur1Pe5bXa2yR0ENwU8LFtsGt+3L6zQQgBH4zvY76ku3xsz1Iifqowr0k0
	 C2r57D5SZcl+0LIfoy7GozInPPyimxhA+e7v2u/exUC73+D+nCJpL2mR/8/3pnHzyI
	 fcZz4HoYjNr5kIhoWBNpmsj4OexLQFGthzV12IgLTPlzWzYmCF+YUAS79gmkT7O9wc
	 n79p2gFxHNZQEGgI4XWn3vprU9k7h8194V4dcpqUMmwfPX9v+hUJxXqzM4FYNDEfla
	 D6dDwpPpf4PPQ==
Message-ID: <sashiko-outbox-191037@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/5] dt-bindings: media: Add CAMSS device for Hawi
 and Maili
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nihal Kumar Gupta" <nihal.gupta@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-phy@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261030-hawi-maili-camss-v3-3-9742bca8cef2@oss.qualcomm.com>
References: <20261030-hawi-maili-camss-v3-0-9742bca8cef2@oss.qualcomm.com>
 <20261030-hawi-maili-camss-v3-3-9742bca8cef2@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 12:55:13 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] dt-bindings: media: hawi-camss missing required data-lanes in en=
dpoint
- [Low] dt-bindings: media: hawi-camss example unit-address mismatches firs=
t reg
--

commit 97b880fd3cf2adf2e5bdc34dc34d8524f1dd635b
Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

dt-bindings: media: Add CAMSS device for Hawi and Maili

This commit adds the Device Tree binding schema for the Camera Subsystem
(CAMSS) on the Qualcomm Hawi and Maili platforms.

> diff --git a/Documentation/devicetree/bindings/media/qcom,hawi-camss.yaml=
 b/Documentation/devicetree/bindings/media/qcom,hawi-camss.yaml
> new file mode 100644
> index 0000000000000..32c1cc59e8767
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,hawi-camss.yaml
> @@ -0,0 +1,314 @@

[ ... ]

> +    patternProperties:
> +      "^port@[0-5]$":
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          Input ports for receiving CSI data on CSIPHY 0-5.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +              bus-type:
> +                enum:
> +                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
> +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY

[Severity: Medium]
As reported by Sashiko on v2 [1], should the endpoint schema under
patternProperties ^port@[0-5]$ include a required list specifying data-lane=
s,
matching sibling bindings such as qcom,kaanapali-camss.yaml and
qcom,x1e80100-camss.yaml?

During driver probe, camss_parse_endpoint_node() in
drivers/media/platform/qcom/camss/camss.c calls v4l2_fwnode_endpoint_parse()
on each port@[0-5] endpoint. When bus-type is omitted and data-lanes is
absent, v4l2_fwnode_endpoint_parse() does not detect a CSI-2 D-PHY bus and
camss_parse_endpoint_node() fails with -EINVAL. Even when bus-type is
explicitly set to D-PHY (4), omitting data-lanes leaves lncfg->num_data as =
0,
causing csiphy_stream_on() in drivers/media/platform/qcom/camss/camss-csiph=
y.c
to fail phy_mipi_dphy_get_default_config_for_hsclk() with -EINVAL.

[ ... ]

> +    soc {
> +        #address-cells =3D <2>;
> +        #size-cells =3D <2>;
> +
> +        isp@9253000 {
> +            compatible =3D "qcom,hawi-camss";
> +
> +            reg =3D <0x0 0x0900b000 0x0 0x1000>,
> +                  <0x0 0x09253000 0x0 0x5e80>,

[Severity: Low]
Should the node unit-address in the example be isp@900b000 instead of
isp@9253000?

The first reg entry (top) is at 0x0900b000, while 0x09253000 is the second
reg entry (csid0). Running make dt_binding_check triggers a dtc
simple_bus_reg warning when the node unit-address does not match the first
reg address.

[1] https://lore.kernel.org/r/20261013-hawi-maili-camss-v2-3-fc93222da89c@o=
ss.qualcomm.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030-hawi-maili=
-camss-v3-0-9742bca8cef2@oss.qualcomm.com?part=3D3
