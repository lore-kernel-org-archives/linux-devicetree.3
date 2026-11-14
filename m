Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794656557;
	b=4iLaOLbuXyjbL97VPqDnaaW6hbJ5T9HcvB6LGn7G3mRhK3Vkw0t0ZuIWuGXrPX3rp2N5
	 XVDZosY0+0ryFFbo6G65/gJSG1tI+3360RMNPc2DMYVLmOJOdSrA2gIPEcpsa78u1HL3T
	 +JM5kYk6qKh2pG1Q2OoTUCrRCNcNqRAn4ThROFTPSVUVM/co6rvT37rqCUs4GB0MaxA7C
	 qmIcn7ip44q5OHJ/gahDnzGnK+GvjhaFD9T8iM2ICK5DS8DnAxb70DCxpv7eBympDx+jw
	 MyLZE/06v5DDGX6wKM2kdhfj0OYwM9RYYxTOuqpcFFR3KoBHGlETW920Gf/hLNgSMkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794656557;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=U85HEkJgEJsEzUWPNHrS2k+nsZGuewbUB9XDqYJSYu4=;
	b=smDREuNRBexup+QnzSWmzpzNOLh0vyxnLHbl0ekiT2kFNAd3FxEaWXyew0M0hy11H9Dk
	 Y/VnQg6K2dw9oMcOAmWOmjnoUncQKTERdJ5iXKBfbr7oXL/9xS2dro+YoLQ4JdLcWl66S
	 A1n8L82vdDacEILT9INm9qonwDuRa1rpFf/wzu1nOORdUkcrex2EDPszfW3W5KjDrZG+D
	 JFEipRh7gbLvMvbJDmweHH0WHUYYJ3hqUT3EA/QarIjVVMaQfPDVb5BqmvRkNKPGhBJGj
	 rWDeGcYv4WHqOtm4r3rEOfVBWhrJo9aFjxhd2/qMR49PhCjJ7gFVcTvFOszx3Z9RlvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LOH055Qf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6889606A323
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 11:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LOH055Qf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF30C1F000C4;
	Sat, 14 Nov 2026 11:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794656556;
	bh=U85HEkJgEJsEzUWPNHrS2k+nsZGuewbUB9XDqYJSYu4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LOH055QfxOIduOUl2BLVHSslYiSI0xj1cfCHwRGP393Nnd57FawtISbyvVbH704ZP
	 S3qnkEGNykSDdAMIdO+07j1aI1NEXG+vaApkVS5VLabGHIXLOY53WsFk8Bsp3FtW2m
	 ewQnG7SjQ20OfewuBYoBaFNfI/6nQbbY8JYOkU6HQqGmyuraxWqoa7vE+qaXygK13U
	 eNMYsj/FqPdR9ba08iK1TjZVojhayX3yjTw85zjZZ97CJHZPvozs8W8UDgq/GOpIU+
	 mjwygmKB1Lt48WYsqvW2HVSNat8QSoyZPfClKWhAJ/LDsZGG4cwb9kztY2p9NarLly
	 lyqlqPjfBxzVw==
Message-ID: <sashiko-outbox-214423@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 03/23] dt-bindings: media: qcom,sm8750-camss: Add
 SM8750 CAMSS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wenmeng Liu" <wenmeng.liu@oss.qualcomm.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261114-add-support-for-camss-on-sm8750-v7-3-8ff2a11835f6@oss.qualcomm.com>
References: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
 <20261114-add-support-for-camss-on-sm8750-v7-3-8ff2a11835f6@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 11:42:35 +0000
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
- [Low] dt-bindings: media: qcom,sm8750-camss: invalid 0-based
  data-lanes in example
--

commit cfe5f0b3c8e80533b908dd73b55a048664a6ed2e
Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

dt-bindings: media: qcom,sm8750-camss: Add SM8750 CAMSS

This commit adds the Device Tree binding schema for the Qualcomm SM8750
Camera Subsystem (CAMSS).

> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8750-camss.ya=
ml b/Documentation/devicetree/bindings/media/qcom,sm8750-camss.yaml
> new file mode 100644
> index 0000000000000..e7ab61d71ffbd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8750-camss.yaml
> @@ -0,0 +1,297 @@

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
> +                };
> +            };
> +        };
> +    };

[Severity: Low]
Should data-lanes in the example endpoint be <1 2 3 4> instead of
<0 1 2 3>?

On SM8750, CSIPHY blocks are standalone PHY devices rather than legacy
sub-resources inside the CAMSS node, so camss_detect_legacy_phy() sets
camss->legacy_phy =3D false and camss_parse_ports() sets lane_base =3D 1.
camss_parse_endpoint_node() then rejects lane 0 with -EINVAL and fails
probe:

drivers/media/platform/qcom/camss/camss.c:camss_parse_endpoint_node() {
    ...
		if (lane < lane_base || lane - lane_base >=3D MSM_CSIPHY_MAX_DATA_LANE) {
			dev_err(dev, "invalid data-lane %u\n", lane);
			return -EINVAL;
		}
    ...
}

The endpoint schema for data-lanes could also constrain items to minimum: 1
and maximum: 4 so 0-based lane indices are caught by schema validation.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114-add-suppor=
t-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com?part=3D3
