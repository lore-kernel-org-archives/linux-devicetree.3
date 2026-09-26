Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F431DDF0
	for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 15:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790437601; cv=none; b=k3/lLHQYKP8esmaryyuBUK1SiCJLJkYCSqX5DW4QH0jjOiGnTQQ64yxaKnRUR0RYDNwT3oqC7EKKoF9ahIGYdOSlXPJLr+q56dhcsYIlY09ij2ze/5l/bCUju0d3l3ymE2JgGxP4pPJ65WsDDDp+DgFDjKPswviw8HYplcuC1WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790437601; c=relaxed/simple;
	bh=Vyzsd7meUDlHrZ59Vl9VwBxQldmbrKkkXVBOCG/bX0I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XdwUGk+NQwheNtPp0hqtQzZkTbM7kxlvMKfRxU3FzfEnIw6xAn/MW8aenn2P0qfpt9G7XviE3+N2GMFNkfy3wkOn+YjME3PMLWOvz7RRc0W47pcW1+J14tP2y4amJQ/7G1yv+ewqfqvpQy4/kFW/otpoT82b8+FS0eZPiWOqWS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kpK3Xlg7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kpK3Xlg7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4C2B1F000FF;
	Sat, 26 Sep 2026 15:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790437600;
	bh=So78PPHLozhwssjY6EX4ZR+mYVi9/pzHfMpXP7tJtFI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kpK3Xlg7QGqo22I/xyD0j00gMn9ELJe5+SKqfP0YpTAo6pLxXWdojo/3WpiwHKBsN
	 QUrmU6subcyP+lkN125hnpV5+zqmXvcXA86G72U52xFoXK4OhP+aQtQpdk/oNIZWea
	 6Z3xVocsoPul+dWskTGBU0pweonfFeGeAxxNx7V0FtF8hmjGeb3bZx88fNL9Rt4yOy
	 8UWatJbeo41S/4sO8WjpJgPF6O5sYfKUl/UKKsHv3J5NzVwJNHQcYw/K+fOV3vRYlU
	 tBWNKkuxXP3xyPk963yXRbfywVGELkY75b88zTSwdtoO729PtZwWF0JTrqeb25i5Nu
	 mBykD6X9mj+/g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: iio: pressure: add Sensirion SDP31
Reply-To: sashiko-reviews@lists.linux.dev
To: "Muhammad Abu Bakar" <m.abubakar365@yahoo.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260926154118.5471-2-m.abubakar365@yahoo.com>
References: <20260926154118.5471-1-m.abubakar365@yahoo.com>
 <20260926154118.5471-2-m.abubakar365@yahoo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 26 Sep 2026 15:46:39 +0000
Message-Id: <20260926154639.A4C2B1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: missing interrupts property for IRQ pin
--

commit 4db91d50e49cd1f9c9265de070c68dad6d777537
Author: Muhammad Abu Bakar <m.abubakar365@yahoo.com>

dt-bindings: iio: pressure: add Sensirion SDP31

This commit adds device tree bindings for the Sensirion SDP31 differential
pressure sensor. The sensor is an I2C device that reports both pressure and
temperature.

> diff --git a/Documentation/devicetree/bindings/iio/pressure/sensirion,sdp=
31.yaml b/Documentation/devicetree/bindings/iio/pressure/sensirion,sdp31.ya=
ml
> new file mode 100644
> index 0000000000000..a98e7c97ef160
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/pressure/sensirion,sdp31.yaml
[ ... ]
> +required:
> +  - compatible
> +  - reg
> +  - vdd-supply
> +
> +additionalProperties: false

[Severity: Medium]
Does this schema fully describe the hardware capabilities?

The Sensirion SDP31 has an IRQ/ADDR pin (Pin 4) that a board designer might
wire to an interrupt controller. Because additionalProperties is set to fal=
se
here, if a device tree includes the interrupts property to describe this
hardware connection, the schema validation will fail.

Device tree bindings typically describe the full capabilities of the hardwa=
re,
rather than just what the current OS driver supports. Should the interrupts
property be explicitly defined in this schema to prevent validation errors =
for
complete hardware descriptions?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260926154118.5471=
-1-m.abubakar365@yahoo.com?part=3D1
