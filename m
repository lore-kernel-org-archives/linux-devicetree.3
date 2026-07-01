Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B01C394464
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 06:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782888748; cv=none; b=m3uAOdBKh/i485s0a2Rq7BpImcn6qsj8A6wKW288QeGxhiuqewMSNv7Sp+s1mSjLUPSLKpLIuzLPMgx2KvlXyJ+AUFBPRlhOknfzdzENzEW1jdzJ9fg6jMpvtUI8VqO0Ou9SxntKixCcWm9dXRssc4kp9cVdcTeN1oB5BMEWz38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782888748; c=relaxed/simple;
	bh=X1CjqdGyh3qN4GmaY9uFJ273JrzfZ38owoQ6ADu1ti0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Q+baR/sYfk7N3a4cfd6NhUNm/c9ylnQ5Y0qaGtjsWs0qVp/N0ji+oRcnO0Z8TQfL2Q+xInKTZDXQ0yY/Kbw0qTx52LNlWUo7BU/m68rnIIJN/mjdLu/oLT2wOSjpwBUbR4Doy9dbkk8691DEKb7aGxldxHKJkzsuIKm301IVyW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z99ZYzOP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z99ZYzOP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7735D1F00A3D;
	Wed,  1 Jul 2026 06:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782888746;
	bh=Yrd7RfbVXmiusiCIws3v5chow8YghllGfKiaK2hyMII=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z99ZYzOPoDMc2TqrkaGyRX4g5DHASBRPQCQITy5cY3KQ9JG+PwFc7P1dTloAlU3Qf
	 MI4Ff54k+SP7rX/Wr/poDSQYTnLPJ7zge+6KseSlClqP9MQJskaZj4Ii52Ien1HC/l
	 z+K0m8NugpfeHcRiAjcf4SgL4jXsjGYaStMlxqCiVWdx8VfNN7opq9Z7sWKks0BFqE
	 zHgGk/gQ5kU0D5/LG3lFEXjEeSbKQPPONmzWfPmZXJ6nAOI4qhJSgDQSGzKogXRkfC
	 8YCQGvfZROwZx+P9z5SaQBUEDxh3kf8UTCKCi7CrwD2P71up6qrregZHKbTSkvJu5K
	 LftOwIHiDzsVg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/3] dt-bindings: iio: dac: Add AD5529R
Reply-To: sashiko-reviews@lists.linux.dev
To: "Janani Sunil" <janani.sunil@analog.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260701-ad5529r-driver-v5-2-ed087900e642@analog.com>
References: <20260701-ad5529r-driver-v5-0-ed087900e642@analog.com>
 <20260701-ad5529r-driver-v5-2-ed087900e642@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 06:52:26 +0000
Message-Id: <20260701065226.7735D1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The Device Tree binding incorrectly aggregates up to four separate=
 physical AD5529R chips into a single logical DT node, misplacing the `spi,=
device-addr` property into individual IIO channel subnodes and extending th=
e channel `reg` limit to 63.
--

commit 8170de6b140882817db48df2f479428c10fc9dbc
Author: Janani Sunil <janani.sunil@analog.com>

dt-bindings: iio: dac: Add AD5529R

This commit adds Devicetree bindings for the Analog Devices AD5529R, a
16-channel 12/16-bit high voltage DAC. It includes properties for
power supplies, PWM, GPIOs, and channel configurations.

> diff --git a/Documentation/devicetree/bindings/iio/dac/adi,ad5529r.yaml b=
/Documentation/devicetree/bindings/iio/dac/adi,ad5529r.yaml
> new file mode 100644
> index 0000000000000..97075b1c919d1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/dac/adi,ad5529r.yaml
[ ... ]
> +patternProperties:
> +  "^channel@([0-9a-f]{1,2})$":
> +    type: object
> +    description: Child nodes for individual channel configuration
> +
> +    properties:
> +      reg:
> +        description: Channel number.
> +        minimum: 0
> +        maximum: 63

[Severity: High]
Does this topology correctly model the hardware? The AD5529R is a 16-channel
DAC, but setting the maximum to 63 implies flattening up to four separate
physical chips into a single logical Device Tree node.

By aggregating multiple chips into a single node, they are forced to share a
single reset-gpios, clear-gpios, and interrupts definition. If a board wires
these physical pins to different SoC GPIOs or interrupts for each chip, it
would be structurally impossible to describe that hardware using this bindi=
ng.

> +
> +      spi,device-addr:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [0, 1, 2, 3]
> +        description:
> +          Device address selected by the ID0 and ID1 pins. Up to four AD=
5529R
> +          devices can share a single SPI chip select; each device respon=
ds only
> +          to transfers whose address bits [13:12] match its configured a=
ddress.

[Severity: High]
Should spi,device-addr be defined inside the channel subnode scope?

Since this property represents the physical ID0 and ID1 pins on the chip it=
self,
placing it in every single channel subnode seems semantically incorrect and
redundant. Should the child nodes represent the physical chips (allowing
per-chip physical properties like spi,device-addr and reset-gpios) rather t=
han
flattening all channels across chips into one level?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701-ad5529r-dr=
iver-v5-0-ed087900e642@analog.com?part=3D2
