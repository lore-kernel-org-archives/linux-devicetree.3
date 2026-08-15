Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DBA38DC69
	for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 23:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786837125; cv=none; b=IIH30FVxYn/fw1MHDu1MC8ZMyfi0eQ5VZk9W6NzzqQnRwbwUSDORaVn2xqAipPPpWVgT35FKuZHPGe8dKqpmtahdECNGvqYapR6RXk3xjlXm0dgUCJXk9pLkyZ3NCZQ+tTK6Uzn6r/vlB/oV1/zcVHZxH6FrvvWscdZeC3+AkOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786837125; c=relaxed/simple;
	bh=z16tC9rOERp+osYC9XMmHKOcnU/jQBdpPOQ3SM7PgRU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=f3fjmgOuqhZJ5inkOjVw5DiS/Z2a4RblIqjAbG1SY8OmBv0haMeOaSAOKjQeLjuvNq5VSgBXYEzLjbEMQlIfeF4f9gptCliRHggB+dqiHlCSWkCvDMwfkes1vSbVEEQXoixTOvt5ZmF31vC8lcNkMwsnSVW3gd2t1PPLn4obAM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MdaNCLHS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MdaNCLHS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56C0C1F000E9;
	Sat, 15 Aug 2026 23:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786837123;
	bh=hw2tBiUOMdVUk0vGNh9PlFD5/9T7wnZegs7LN26yYJg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MdaNCLHSirXpv4dy0mDGWiGRSV6U1Hk278sbML2YvTkJRrgvHEk/nDrbBjv5aso7p
	 xqPwumXz9VV2DwUxjvFeEko+q1cF6f0muM8PmTnlC3vrowmQo1GeNgg+wHQN3YG7n3
	 i9wKxIwOwxiHLnCMxmii+OPDGt44GmGhhISZqaxvlUZmHyYBz3/aaNBW8zceZAGAGw
	 ZZVIZ1QFqSmjIVvbRLlHGNU6IwvF5C8bm9aeMme9ewlM1kxP/a8amTTRn4fgPdiL/G
	 6QhNEVZvkyBB4x02UGuiSUs1Z6l6U/PdwmiRreejtsChYet6RD9PYrHmTXunTNI+XE
	 A30u8k7xztlZA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 04/24] dt-bindings: firmware: arm,scmi: Add support
 for telemetry protocol
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cristian Marussi" <cristian.marussi@arm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260815232604.3730754-5-cristian.marussi@arm.com>
References: <20260815232604.3730754-1-cristian.marussi@arm.com>
 <20260815232604.3730754-5-cristian.marussi@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 15 Aug 2026 23:38:42 +0000
Message-Id: <20260815233843.56C0C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Dropping info->protocols_mtx in scmi_protocol_release creates a ra=
ce condition that can permanently remove protocol notifiers while the proto=
col remains active for concurrent users.
--

--- Patch [4]: [PATCH v10 04/24] dt-bindings: firmware: arm,scmi: Add suppo=
rt for telemetry protocol ---
commit 5a2c3d7356ea4d8a9abff06c827c1b5e1af546f8
Author: Cristian Marussi <cristian.marussi@arm.com>
Subject: dt-bindings: firmware: arm,scmi: Add support for telemetry protocol

This commit adds new DeviceTree binding definitions for the SCMI v4.0
Telemetry protocol. It introduces the protocol@1b node referencing the
protocol-node schema.

> diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/D=
ocumentation/devicetree/bindings/firmware/arm,scmi.yaml
> index d06cca9273c48..be733f8d60a02 100644
> --- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> +++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
[ ... ]
> @@ -324,6 +324,14 @@ properties:
>      required:
>        - reg
> =20
> +  protocol@1b:
> +    $ref: '#/$defs/protocol-node'
> +    unevaluatedProperties: false
> +
> +    properties:
> +      reg:
> +        const: 0x1b
> +
>  unevaluatedProperties: false
> =20
>  $defs:

[Severity: High]
Could this regression create a race condition that permanently removes
protocol notifiers while the protocol remains active for concurrent users?

Looking at scmi_protocol_release() in drivers/firmware/arm_scmi/driver.c,
a thread could enter when the refcount is 2 (1 active user and 1 notifier).
It determines it must unregister the notifier, sets proto_notifier_nb, and
exits the scoped_guard, which drops the info->protocols_mtx lock.

Concurrently, another thread calling scmi_get_protocol_instance()
could acquire the mutex, find the protocol in the idr, and increment its
refcount to 3:

drivers/firmware/arm_scmi/driver.c:scmi_get_protocol_instance() {
...
		pi =3D idr_find(&info->protocols, protocol_id);
		if (pi) {
			refcount_inc(&pi->users);
		} else {
...
}

This returns the protocol to the new user without re-registering the
notifier, since proto_notifier_nb remains null for existing instances.

The first thread then proceeds to completely remove the notifier outside
the lock:

drivers/firmware/arm_scmi/driver.c:scmi_protocol_release() {
...
	if (proto_notifier_nb) {
		if (scmi_protocol_notifier_unregister(pi->handle, &pi->pno))
			dev_err(handle->dev,
				"Failed to release protocol notifier\n");
	}
...
}

Could this result in the new user actively using the protocol while
telemetry or events meant for this protocol are silently dropped?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260815232604.3730=
754-1-cristian.marussi@arm.com?part=3D4
