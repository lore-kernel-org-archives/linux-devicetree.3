Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793875285;
	b=tf7k6G8t7Ayn/JaSjNs+S8NsX36GCtfdiKxzfbXEQsptMuceG258XPWILhnHHGMY1P7L
	 1fLxeyYcNYKBjK/o0LsVo/udFSazvS3fmitOEMkB9XaX7FB/ElKTY/UB1387zgyHe/emN
	 5x9GJRrz2iA57wm3UNxzb5NgEdqdJ5NcMw+i6bkbZKylLK4vAGgAgd0WXXwX9QAK7Zo7y
	 4wbr11K625g6emUpO9cBMXT0KJ70ZB65LnhqvAl1OdL8YbQ4qPF+qUuzgoRlWpmBg863A
	 oasYGElLDPKZqyWAlxQ3HLSJFMtJCYSRs6QvY4jNwKRk6TAvaGG3KEl+yH91T8d9AUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793875285;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=w5+vY3QtLg9+12kLzTFqSPaOQLR8R3JaD7j2zs6Hcrg=;
	b=JgECattWqoQg67+hthz0QaEh+oQoAJfpwFMqHaDi4YikRfhdw76VUlEeXphGVRZVMDTE
	 AY0Uvmv2nkm7zlhYOKujJ0xfGMNpymVhaEWL7XvwU2ud9rNEug6aY87zIPoQ2uQQbLWbv
	 7GyehXCclXPttL99q8IQFS8/W1THQhzD+xEn6Ynvx0ytR3gO44bu4VHgageJ8Tfv2pH/t
	 zTDSQ3FJREPHTmXl9ScuK5Kuc6RnvFeQeGWNRCEbL5AZnJVZ3Go9Oi9th2hU3qw9TDoSL
	 ODjBJfIck547ra0qLW4AJS6nv1fI8ePUKD/8NqvHyRmLjOvJzZGYiFFhKGggks6OdNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c7nl7MHJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15BB4606A330
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 10:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c7nl7MHJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62A6E1F0093A;
	Thu,  5 Nov 2026 10:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793875284;
	bh=w5+vY3QtLg9+12kLzTFqSPaOQLR8R3JaD7j2zs6Hcrg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=c7nl7MHJkJ0e+LNsUF00go2S9vGvuOjAjjMVmxt/GA/+Ql55P/pEoMa98+Q2kk5n+
	 ZSi+1vmc8SyGjaghX5f06yNseJV/yc9HiXIHYjKHTbb/rc9nwDnWWopOTXtpiKugAB
	 2gwcF+iObRlF0SCp088gC0m3LAETm1hck/qf2XF90QbktzR6cbhxz3jt3J7WRNu8Va
	 ydBUHkz4MjS6jI7rbJ5xgdvWm7ptqkuREp2jZH1KwdPrSDmMdVRl9Gf6ZJSoWj0puT
	 tk19MfN6bGQREeIzusX6gAoGBO1UgyzJ/xGmMGfSOUll/UBcCky2QI79JZNOstQgqI
	 AY8bl9pbTubgQ==
Message-ID: <sashiko-outbox-198872@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: qcm6490-fairphone-fp5: Fix
 DW9800K support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Griffin Kroah-Hartman" <griffin.kroah@fairphone.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261105-b4-dw9800k_cleanup-v3-3-6850ee6a5a5a@fairphone.com>
References: <20261105-b4-dw9800k_cleanup-v3-0-6850ee6a5a5a@fairphone.com>
 <20261105-b4-dw9800k_cleanup-v3-3-6850ee6a5a5a@fairphone.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 10:41:24 +0000
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
- [Low] dt-bindings: media: dw9800k: invalid dongwoon,vcm-presc property in=
 example
- [Low] media: i2c: dw9719: declaration after case label in dw9719_power_up=
()
--

commit 3e8104f7ee643adcd7e1f98dbb0c3e1ed1a9c762
Author: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>

arm64: dts: qcom: qcm6490-fairphone-fp5: Fix DW9800K support

This series splits out the device tree binding documentation for the Dongwo=
on
DW9800K voice coil motor controller, updates the dw9719 driver with proper
register programming for the DW9800K, and updates the Fairphone 5 device tr=
ee
node to match.

> diff --git a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9800k=
.yaml b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9800k.yaml
> new file mode 100644
> index 0000000000000..f5bae7b287f1b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9800k.yaml

[ ... ]

> +  dongwoon,vcm-prescale:
> +    description:
> +      Indication of VCM internal clock dividing rate select, as one mult=
iple
> +      factor to calculate VCM ring periodic time Tvib.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum:
> +      - 0 #  Dividing Rate -  2
> +      - 1 #  Dividing Rate -  1
> +      - 2 #  Dividing Rate -  1/2
> +      - 3 #  Dividing Rate -  1/4
> +      - 4 #  Dividing Rate -  8
> +      - 5 #  Dividing Rate -  4
> +    default: 1

[ ... ]

> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        actuator@c {
> +            compatible =3D "dongwoon,dw9800k";
> +            reg =3D <0x0c>;
> +
> +            vdd-supply =3D <&pm8937_l17>;
> +
> +            dongwoon,sac-mode =3D <4>;
> +            dongwoon,vcm-presc =3D <0>;

[Severity: Low]
Should this property in the actuator@c example node be dongwoon,vcm-prescale
instead of dongwoon,vcm-presc? With additionalProperties set to false in
Documentation/devicetree/bindings/media/i2c/dongwoon,dw9800k.yaml,
dongwoon,vcm-presc causes make dt_binding_check to fail schema validation.

> diff --git a/drivers/media/i2c/dw9719.c b/drivers/media/i2c/dw9719.c
> index 3b7ba88fd67c0..3b99c5492522c 100644
> --- a/drivers/media/i2c/dw9719.c
> +++ b/drivers/media/i2c/dw9719.c

[ ... ]

> @@ -185,14 +196,50 @@ static int dw9719_power_up(struct dw9719_device *dw=
9719, bool detect)
>  		/* Optional indication of VCM prescale */
>  		device_property_read_u32(dw9719->dev, "dongwoon,vcm-prescale",
>  					 &dw9719->vcm_freq);
> +
> +		/* Optional indication of SAC timing */
> +		device_property_read_u32(dw9719->dev, "dongwoon,timing-control",
> +					 &dw9719->sac_time);
>  	}
> =20
>  	switch (dw9719->model) {
>  	case DW9800K:
> -		cci_write(dw9719->regmap, DW9719_CONTROL, DW9719_ENABLE_RINGING, &ret);
> +		int ring, sac;

[Severity: Low]
In dw9719_power_up(), can the declaration of ring and sac be moved to the t=
op
of the function or wrapped in a compound statement block for case DW9800K?

Under -std=3Dgnu11 prior to C23, placing a variable declaration directly af=
ter a
case label without braces causes a build failure on older supported GCC
versions (such as GCC 8 through 10) and sparse when building
drivers/media/i2c/dw9719.c.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105-b4-dw9800k=
_cleanup-v3-0-6850ee6a5a5a@fairphone.com?part=3D3
