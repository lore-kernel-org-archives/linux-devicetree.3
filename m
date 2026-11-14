Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794656593;
	b=vRtI4oCB6hq6NcZXri5lH2Gs2lSp5qpBHwAwO76YfVkDY9HrDxHZStqnP6QYFI/RLUBA
	 ENm4tAhwXHn5NPFZDhR1q0qn3/xMKwcIaJxhjmTE3wVqVxOUP2S6kCHXzt5ZNZaHSAvHd
	 rSclhpC3HAgglcpu3NvfTNN9u+XYQoRQhgGDUxK3Yg1W4t5vZNVPHB/o6bfjsCkjtmHOw
	 53Fsm/67ac8c0qAzrqrQ7cQ0lwIoDQO1lihyrkrIEY10VuB2DXyfmjt1Nkcu6z5PToJly
	 9K6XU3PTSePbtGIi/OLALGqIAMcrt3nWPY88otXjJMV0e9BEW9zmVbWA51sSYfIp8YA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794656593;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=KDVvlmbhZZ5Xe9yM/HY/pX+dlZaAbTCHdKWFCZxTDCg=;
	b=o6q7vRn7gAR0XPMQHDHOumwaOSW63D72TisNGsLMqLxiMcj6XEk95zitVzwvOgJkyE8s
	 uyrmSG//3w4n9VlNcSfvgia735wHl8A5op/FARHn834nkcg+E469LKuqLnxd+T78juqKf
	 xO82T6wIbWOmdsyRVWI/SfqP+o/vld41I7c5Hux72iYrXrTGnEcUMyQtpa86NYV/6tL+0
	 zYWyJESpCQ2JzzdMOBGebiK7EDjm8/H7/xDy1dKBnPvz1B6ZB43n40O5jg4dwtDYbO2kr
	 2JIpqEu25TR5FhgZorfXOe79tUgJ4YAqjlaxWqsetGPZBYdAJeulD7m3itmFh1imM/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oGe5G61S;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D718F606A323
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 11:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oGe5G61S
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E23B01F000C4;
	Sat, 14 Nov 2026 11:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794656593;
	bh=KDVvlmbhZZ5Xe9yM/HY/pX+dlZaAbTCHdKWFCZxTDCg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oGe5G61SsgmZ7VpCOTxR4LE6DXFG4hU1hmAuHzwQ5eSWhcDLFe5Uz7S0uRhtI7uGE
	 Ud4y46Rttdvr6MuinNMK6UVh+LCm6nVcUG0wBwzxsgZZdl8PJ/PirU3lZXTs8pPx0u
	 iuwRGm1jCIMRgs0Opj03cciD1zfVUhDGINXTwgDuO1/EDBRZp+jPDBj6Oy0RK5XLXT
	 GjRrGafv2Zl7mHqD5F7tg46iWn0+7NfGK8HQUKBsRkiJoHJSVGWibRn1HdcNjT3VNB
	 hZQBV5F9LSydYIr8+qKBEnmr+xiphONm6rKZww/dqfzJb/iEZoHOSfVoUS+h30IRZA
	 1830iPCNQ4Z7g==
Message-ID: <sashiko-outbox-214428@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 04/23] dt-bindings: media: qcom,eliza-camss: Add
 Eliza CAMSS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wenmeng Liu" <wenmeng.liu@oss.qualcomm.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261114-add-support-for-camss-on-sm8750-v7-4-8ff2a11835f6@oss.qualcomm.com>
References: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
 <20261114-add-support-for-camss-on-sm8750-v7-4-8ff2a11835f6@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 11:43:12 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] dt-bindings: media: qcom,eliza-camss: invalid 0-based data-lanes
  in example
--

commit bce0133de93b87d5e9e002d47e94f2395d97b15f
Author: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

dt-bindings: media: qcom,eliza-camss: Add Eliza CAMSS

This commit adds the Device Tree binding schema and example for the Camera
Subsystem (CAMSS) on the Qualcomm Eliza platform.

> diff --git a/Documentation/devicetree/bindings/media/qcom,eliza-camss.yam=
l b/Documentation/devicetree/bindings/media/qcom,eliza-camss.yaml
> new file mode 100644
> index 0000000000000..8775ec6a2f69b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,eliza-camss.yaml
> @@ -0,0 +1,282 @@
[ ... ]
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
[ ... ]
> +            ports {
> +                #address-cells =3D <1>;
> +                #size-cells =3D <0>;
> +
> +                port@0 {
> +                    reg =3D <0>;
> +
> +                    camss_csiphy0_ep: endpoint {
> +                        data-lanes =3D <0 1 2 3>;
> +                        remote-endpoint =3D <&csiphy0_out>;
> +                    };

[Severity: Low]
Should data-lanes in the example be 1-based (<1 2 3 4>) instead of 0-based
(<0 1 2 3>)?

Because Eliza uses standalone CSIPHY devices without legacy CSIPHY
resources, camss_detect_legacy_phy() sets camss->legacy_phy to false and
camss_parse_ports() sets lane_base to 1.  camss_parse_endpoint_node() then
rejects lane 0 with -EINVAL:

drivers/media/platform/qcom/camss/camss.c:camss_parse_endpoint_node() {
    ...
		if (lane < lane_base || lane - lane_base >=3D MSM_CSIPHY_MAX_DATA_LANE) {
			dev_err(dev, "invalid data-lane %u\n", lane);
			return -EINVAL;
		}
    ...
}

Any Device Tree modeled after this example will fail to probe.  The
endpoint data-lanes schema above also only constrains minItems and
maxItems, so adding items with minimum: 1 and maximum: 4 would allow
dtbs_check to catch 0-based lane indices.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114-add-suppor=
t-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com?part=3D4
