Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793364691;
	b=3IVrGvXD+wtCtFFwSSAbcwsNWjGjjzcqVjDzjBboqL3JsRAMgxy18tzVRATj+AhnUvL0
	 fwV6Jb60NoqQsEbKc678GVkUNj85TEH2dUBdXTe7EBqSSSP3tgt9Bt40HozoanSZW2Whd
	 nkgOHytcfT1aSZ0p9hxNi9Zryd45wYN2Jx2vbrSU+2E+MBtN79I1QSUvzatqM/KfgA+iG
	 cuTueooowbCjE+AuGt/G9x4Wcgf2YrKfVBkOujhqyRsChuYTrhilVyW6xjUf3Pj2g96ZC
	 bvyt4DvU87IrEsUkCARH+BOWkE3XphLPeF+cu8ZRHEkb+mWI4B+aLaJiaHGWg91QGGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364691;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=CgKHWGYGrsJ4xgtoPHl7wimW2jYscKSmdb3CJZRwbNg=;
	b=OVxYSn3JiqIClkr2bNu9qirXWkYi+C8ts+XJ7J69b6zni61dDhUJtR6NMBARZ1Abz34a
	 GJWcQXbmVp081HKZoweyNI3CHpRXCNSCHfmNtj/OWGuYgdpArxVo8uLs7UZ7pNOAhmc5L
	 eThZRyS0OAlv2R/iXczH9Ef9ZodoMrDtpkkmR/e90Pz6ELoSYRYlVjqNnWFEUxjZ6X0Mq
	 OVwqx88HOzAIcP6oqiHW6gZI0+px+OrAi0Cy6y29uD2mdNI2TvokRKjG68nxe2ZxcTbBy
	 jTcL3lykKBDhBNoXsUnM9d5R4wc0vEf5PaKx8bxMEFIMTD9MTbsu+mKCx8jvyIU3fjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="EQvsu/cm";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BB4606A31D
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 12:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EQvsu/cm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11CA41F0093A;
	Fri, 30 Oct 2026 12:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793364690;
	bh=CgKHWGYGrsJ4xgtoPHl7wimW2jYscKSmdb3CJZRwbNg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EQvsu/cmNROe5lA5hNwJ5etZ89B8GeAv/AvsMWVNlrCpCxcgAIbWBwVOuOEG6lc70
	 DKHirMde2NHWdBtR20FxUDgrmf+wV2U2Tz+03wjJxkWBM20+wAVLrQTXmjhHfJr8ZI
	 RSfaE09q6eb1cEbXVME16ECS8X6jxt7jrpip+KEtlCxrkwpRWKPo28DVfgCjGdag82
	 1nHaG+m0yJKmL+qjynKpXwYDcj4NDOa9uZjpEXDw8oUFkTpcQnq7uYzlryOv7eEC1h
	 X3Yk3w7oM7ugItlRd1XX9NMyupSe6yKnIZ/zgwk3Vf0mWx5STc14KlSZ5I2/uOQWmK
	 Euv+oeNRyOa5Q==
Message-ID: <sashiko-outbox-191032@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/5] dt-bindings: i2c: qcom,i2c-cci: Add Hawi
 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nihal Kumar Gupta" <nihal.gupta@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-phy@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261030-hawi-maili-camss-v3-1-9742bca8cef2@oss.qualcomm.com>
References: <20261030-hawi-maili-camss-v3-0-9742bca8cef2@oss.qualcomm.com>
 <20261030-hawi-maili-camss-v3-1-9742bca8cef2@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 12:51:29 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: i2c: qcom,hawi-cci falls back to qcom,msm8996-cci
--

commit d9dc73bf069c6c548fe2a696e7ecbd69ab96e3f3
Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

dt-bindings: i2c: qcom,i2c-cci: Add Hawi compatible

This commit documents the Camera Control Interface (CCI) compatible string
qcom,hawi-cci for the Qualcomm Hawi platform and adds it to the two-clock
constraint list in Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml.

> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Do=
cumentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> index 1e8def25ec0ec..b2b4d4bcf7807 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> @@ -27,6 +27,7 @@ properties:
>        - items:
>            - enum:
>                - qcom,glymur-cci
> +              - qcom,hawi-cci
>                - qcom,kaanapali-cci
>                - qcom,milos-cci
>                - qcom,qcm2290-cci

[Severity: Medium]
As reported by Loic Poulain on v1 [1], adding qcom,hawi-cci to this enum li=
st
under properties:compatible in
Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml requires device tree
nodes to specify qcom,msm8996-cci as a fallback compatible:

      - items:
          - enum:
              - qcom,glymur-cci
              - qcom,hawi-cci
              ...
          - const: qcom,msm8996-cci # CCI v2

When a Hawi CCI controller node is probed via cci_probe() in
drivers/i2c/busses/i2c-qcom-cci.c, device_get_match_data() matches the
fallback entry in cci_dt_match[] and binds the controller to the legacy
cci_v2_data configuration:

static const struct cci_data cci_v2_data =3D {
	.num_masters =3D 2,
	.queue_size =3D { 64, 16 },
	.quirks =3D {
		.max_write_len =3D 11,
		.max_read_len =3D 12,
	},
	.max_mode =3D I2C_MODE_FAST_PLUS,
};

static const struct of_device_id cci_dt_match[] =3D {
	...
	{ .compatible =3D "qcom,msm8996-cci", .data =3D &cci_v2_data},

Since newer CCI IP revisions have different hardware resources such as FIFO
and queue sizes, should qcom,hawi-cci stop falling back to qcom,msm8996-cci
and instead use a dedicated variant entry rather than reusing the msm8996
definition?

[1] https://lore.kernel.org/r/CAFEp6-1Zvt0hhBd7LNx2hsyi9J+bxCT8EWN3jZ4B30SO=
58SCow@mail.gmail.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030-hawi-maili=
-camss-v3-0-9742bca8cef2@oss.qualcomm.com?part=3D1
