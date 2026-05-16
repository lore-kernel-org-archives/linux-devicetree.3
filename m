Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992FC8287E
	for <devicetree@vger.kernel.org>; Sat, 16 May 2026 18:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778956625; cv=none; b=jXK3rANIPPKnBpdgKsB0h1VPFf/qqSNKowSk7WbaBqqOodDzynhDgJ8KOlfaOwFnBtWw5Xt1XWa6tX7kaSTevab7/xu+eQSwcAgT90Q+8BfLMeY80zmqQQiS1ZTDSyD6Dd5MSncvPLHnRQG7KdvFtLN/bnSzN9DvXkxsIhtrb/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778956625; c=relaxed/simple;
	bh=2JNg4A0LfkskF8istyB/F0L1l+ZyerIIQ2JyqPUsNzE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bP7ILio8gsnY4Qqhxc1zrG/ejvKhbXXbePULf1IKTiyqBRM3p0z7XrrRcm06WYk57XXa86tt20n6bWbWC4t0eiiIim6m7MUTRY8OrcwQOHmOD2xE5nV9IaT3V/TmO5gyxVtkBKIdxCiuFnvhc84X0AB4YSQRlq0zQxsB7N6dmC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q7i9jHFh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q7i9jHFh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC2F2C19425;
	Sat, 16 May 2026 18:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778956625;
	bh=2JNg4A0LfkskF8istyB/F0L1l+ZyerIIQ2JyqPUsNzE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=q7i9jHFh5rl/fqFStqwepxH6YU7OVtmMAjDqP8aCDskEXpcS17upH1Y0DoX87ryEx
	 D3eNqFOSiGmqOIaosjDWGAyXOcDjsgBVWEkr7kKEBjpj74c94EovD50/y3G+PggQgh
	 hcoZGs4+KwQMkbatlD0Lo5UIAmQ7syjgKUPs2Eh7I5Nwz2y6KJinkw+I0uTUbx+LjY
	 7Vo7Y7CLzR/yNk1h8vVTBFwYH+auo1Gs2ki/EevSiaBlcWJftZnIRwldnbFtFJR7bH
	 +UozuIMlgLQ4lMaHQOf/q7Uaw7kaJ+EpIkRNlxdNO2KkjsEvApOXtQGMkPp8DtvpAW
	 b82GR0+Yhn6iQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: timer: econet: Update EN751627 for
 multi-IRQ
Reply-To: sashiko-reviews@lists.linux.dev
To: "Caleb James DeLisle" <cjd@cjdns.fr>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260516182648.3987792-2-cjd@cjdns.fr>
References: <20260516182648.3987792-2-cjd@cjdns.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 16 May 2026 18:37:04 +0000
Message-Id: <20260516183704.EC2F2C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] DT Binding Example Validation Failure
--

commit 2aadbe8d15e40c585e5998e7532f23b02294a2a3
Author: Caleb James DeLisle <cjd@cjdns.fr>

dt-bindings: timer: econet: Update EN751627 for multi-IRQ

This commit updates the EN751627 timer binding to describe its use of an
individual IRQ per timer (4 total) compared to the single percpu IRQ used
by the EN751221 family. The constraints and example are updated accordingly.

> diff --git a/Documentation/devicetree/bindings/timer/econet,en751221-time=
r.yaml b/Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml
> index c1e7c2b6afde1..16f32741473fe 100644
> --- a/Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml
> +++ b/Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml

[ ... ]

> @@ -52,21 +53,31 @@ allOf:

[ ... ]

>  examples:
>    - |
> +    #include <dt-bindings/interrupt-controller/mips-gic.h>
>      timer@1fbf0400 {
> -        compatible =3D "econet,en751627-timer", "econet,en751221-timer";
> +        compatible =3D "econet,en751627-timer";

Does this updated example fail dt_binding_check validation?

The example changes the compatible property to a single string, removing the
fallback to "econet,en751221-timer". This correctly reflects that the two
hardware variants have incompatible interrupt topologies.

However, it appears the properties definition for compatible in this schema
was not updated. If the schema still requires "econet,en751627-timer" to be
part of an array with the "econet,en751221-timer" fallback, this single
string example will not match the expected array schema.

Should the compatible schema definition be updated to allow
"econet,en751627-timer" as a standalone string?

>          reg =3D <0x1fbf0400 0x100>, <0x1fbe0000 0x100>;
>          interrupt-parent =3D <&intc>;
> -        interrupts =3D <30>;
> +        interrupts =3D <GIC_SHARED 30 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SHARED 29 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SHARED 37 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SHARED 36 IRQ_TYPE_LEVEL_HIGH>;
>          clocks =3D <&hpt_clock>;
>      };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260516182648.3987=
792-1-cjd@cjdns.fr?part=3D1
