Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795510633;
	b=JnocvwGi7i0NYNYeV8GE+cftm52ZVabXw+D2sVQhkgUcZo8uRAQTbVtV4Qp+R85tH8ZD
	 f1GlDdXU0QWY6f+dmcQsL2UEr+bCCBqkGCDJRTA/VkdgIlgUOVlkFcyKFngbSO4tHGPGe
	 Lq007QEYbW75QzrkdMTUdw53o81N0EusZDXLo77/aVknnY1ahYD9sbrVzXI/yRatSWxap
	 e4rVHUxPUNdpgH7AIR2ECyjSQ06pD7aboj2yuiDGXmjVK7lLxduS7wWKFIOj5dP4GLX7U
	 CioTvFm5OKX+yV3RnyQaB8dIiS6xBmsAC+w9SGiisM20mcL2Mh+MA8xvo5LJsrT2n6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795510633;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=wqX/y9HcCQcWrFSOJUccgsTfFslIK2ZQONhmygB3fNY=;
	b=RG3aCBFpS5g9Vx5pFc92f4HAPLyuoE5Cq2/r5u0aR1bQVPszGskCsvCtVJnNMVHFNFp/
	 2XHArFWg2yqKrp+b8LAlFj12tFxAwGuELn2CrFyEaZ+OTmC7beSr6WG6nLm0oMH95Y1zu
	 9J7wmQ772AC9Q5Qr0Ty0m5kPNfVAzP3P2ce04BwBGnXAsV8tv4eEBAwBjfWNrwE90Pltf
	 V0GwW36UkOYEScX7pk+Jtvw9Bxap9SvfijD1P3cNUc7WcQnrjXoeBF7K267OnWAjSjZgp
	 cg0vZKnGkiQTKCfatwpOiCQRwNvc4wUplvLgSh75+7pwEg/na9u4Vy0/EBrqzlr5/wA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FGoHOjy0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47087606A31E
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 08:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FGoHOjy0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E0F11F000C0;
	Tue, 24 Nov 2026 08:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795510632;
	bh=wqX/y9HcCQcWrFSOJUccgsTfFslIK2ZQONhmygB3fNY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FGoHOjy03X9hA1va9WUleiUQaldL2ocUlkjfTKmFRwOlLMX4zGo/12lPN8O+5tk8t
	 nj6x84IWDJGz++lSLP5QoXFinVUEjT3KPZKPVkwX/8kCT8Ym9zxp1gPIiEKDDfK002
	 bpP8GFtqUzBYO5fxPuze0x3G2pmseRfRu+hZFsWNEJissQ0zqqscl5ELAIcnaWkM8v
	 lRBXPfsVxo9n8tD1VS9UuvG6sHigSRRw/r1oxYBz4Ut5M3THuvTLojkbgumyt+Vs3O
	 i8XaWXvuaV3OblxQF+xpXC2MlwXSdBCN8OOM8AIonUzcoLadzQVs+wr+W/vpeBWic+
	 NUS1EU+HrOrIQ==
Message-ID: <sashiko-outbox-230757@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: interrupt-controller:
 econet,en751221-intc: Allow up to 6 parent interrupts
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akshat Singh" <automobilehacks@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261124-en751221-intc-all-lines-v2-1-a33a520aac81@gmail.com>
References: <20261124-en751221-intc-all-lines-v2-0-a33a520aac81@gmail.com>
 <20261124-en751221-intc-all-lines-v2-1-a33a520aac81@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 08:57:12 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Low] dt-bindings: interrupt-controller: restatement of maxItems in
  description
- [Low] dt-bindings: interrupt-controller: missing Fixes trailer for
  9773c540441c
--

commit fe714489b5b820762692dff8085c8ac371021629
Author: Akshat Singh <automobilehacks@gmail.com>

> dt-bindings: interrupt-controller: econet,en751221-intc: Allow up to 6 pa=
rent interrupts
>
> The controller is not connected to its parent through a single
> interrupt line: it presents the number of the pending interrupt plus
> one, in binary, on the CPU interrupt lines IP2-IP7. A CPU in VEIC mode
> takes that number as the vector, but without VEIC each line is a
> separate interrupt, and the controller has to be chained to all the
> lines that can carry it.
>
> Allow listing up to six parent interrupts, one per line.
>
> Signed-off-by: Akshat Singh <automobilehacks@gmail.com>

[Severity: Low]
This corrects the overly restrictive maxItems: 1 limit on the parent
interrupts property.  Should it include:

  Fixes: 9773c540441c ("dt-bindings: interrupt-controller: Add EcoNet EN751=
221 INTC")

> diff --git a/Documentation/devicetree/bindings/interrupt-controller/econe=
t,en751221-intc.yaml b/Documentation/devicetree/bindings/interrupt-controll=
er/econet,en751221-intc.yaml
> index 44c09785e6bb6..098fdeaa38f7e 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/econet,en751=
221-intc.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/econet,en751=
221-intc.yaml
> @@ -34,8 +34,13 @@ properties:
>    interrupt-controller: true
> =20
>    interrupts:
> -    maxItems: 1
> -    description: Interrupt line connecting this controller to its parent.
> +    minItems: 1
> +    maxItems: 6
> +    description:
> +      CPU interrupt lines connecting this controller to its parent. The
> +      controller presents the number of the pending interrupt plus one, =
in
> +      binary, on the CPU interrupt lines IP2-IP7, so it can be connected=
 to
> +      up to six of them.

[Severity: Low]
This isn't a bug, but the trailing clause ("so it can be connected to up to
six of them") restates the maxItems: 6 constraint already expressed in the
schema and can be dropped.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-en751221-i=
ntc-all-lines-v2-0-a33a520aac81@gmail.com?part=3D1
