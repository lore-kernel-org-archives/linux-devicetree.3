Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795079566;
	b=go89FwtpRkfgKBGhopCUSMvwYvBRBqGR78FA9pJBjyN5YkKTXdXxKDgP9jPh+9aLjpJv
	 7cagosXON1ii6VgLRlAqCDjaw2JBpGhJ6cfvIwpD5FBCutGjQzuuybBMNgLK4WE5rn7ON
	 EGXensGAvX9wfH8bHHhxisrlUrhCdrcaOP8ZaCWPr2iIvnj5z1mSQFtf6xbc+Y5Myv3LH
	 V6e+UDYy76OXxiPoz6ahUgEZBxAnSL2yuw/Qp4rJseJMNdlbjXi9RebsOY75BYVnf8YlQ
	 evq3mf+hPYe57STolfs2gDPeg/ih09n35uIY5LGUUt8U/r4ix887qvxD98LW+Xb8TaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795079566;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=tsNMPBJ3jqtXriikl+BnK/o4snrV43IOftGcxUU7xHU=;
	b=sBLMZ1OmQ7f1E/98va9CnEVEOqDDqoqTaln/vq+ACrhYJUSQfymmeF+GKDf6UPMeeiZn
	 X1tlnBbacMPZVDq8kSJw6AAbVAbLV8xx5zYorqt4fWkMktwzAFKmi2bDWBy6YhFt3v7So
	 ED3Rs0293n4D2MAxpp8kXo5xtipNRiatUGq4ODzclwxXJEjm/0F0Wk/rh/arNZKz6zhMZ
	 tXtVe3FSncl5vLe0pTxHlX1WP6AAVIxstk0oknDUZ+lUhZ5jmv1qq3onbFqJkXbV160np
	 YnXXnytuCu7m7RHVV+Eba6PIXyzxoWus8wn0ObweK2RKYv5MaMxIlD/Favp5Dh/izHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gbhrV3Xt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88FD606A33A
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 09:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gbhrV3Xt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 904EB1F000C8;
	Thu, 19 Nov 2026 09:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795079565;
	bh=tsNMPBJ3jqtXriikl+BnK/o4snrV43IOftGcxUU7xHU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gbhrV3XtNlLPYQNvpZKvm+P45zFxKX+vxB7M9xbsrZZ4Yvj+bfLRJkD5K9EmBmMTX
	 pX12L1yvo/NmN9lm0mRZt/TgAOuXzzIldy5GsbDWyk12ir/SByrgTjKL6fNDCWMZNV
	 7PKKBxX37zIkB0iYY+PHVn4EyV222B1Wly117slxlOAKLf5dYcdhqgdITU9EK1kigG
	 AFXzdfDavrCm6s6x2TwR0wDlVw8nj6kIsglasuDZuD9y3GbeComGgYhTJPOUrC2TVv
	 D+l9laiViSjvYJKjgJmcEUIhydOGkOGq5VPnH2XK5wKlkBujP8VJablzTzolIs2iAQ
	 fMAL+LoHEQT3A==
Message-ID: <sashiko-outbox-222794@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 1/6] dt-bindings: soc: qcom: add QDCP provider
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jie Gan" <jie.gan@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261119-introduce-qcom-qecp-feature-v1-1-b1a730d2c57a@oss.qualcomm.com>
References: <20261119-introduce-qcom-qecp-feature-v1-0-b1a730d2c57a@oss.qualcomm.com>
 <20261119-introduce-qcom-qecp-feature-v1-1-b1a730d2c57a@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 09:12:45 +0000
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
- [Medium] dt-bindings: soc: qcom: qcom,qdcp models virtual QMI driver
  and lookup IDs
- [Low] dt-bindings: soc: qcom: unused labels in qcom,qdcp example fail
  style check
--

commit 975ed970c6f545b1a481d1850cc2e7de01d28cd7
Author: Jie Gan <jie.gan@oss.qualcomm.com>

dt-bindings: soc: qcom: add QDCP provider

This commit adds a Devicetree binding schema for the Qualcomm Debug Control
Protocol (QDCP) firmware provider node and its QMI connection child nodes.

> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,qdcp.yaml b/=
Documentation/devicetree/bindings/soc/qcom/qcom,qdcp.yaml
> new file mode 100644
> index 0000000000000..ee0a66b12dde7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,qdcp.yaml
> @@ -0,0 +1,81 @@

[ ... ]

> +  This node does not represent a CoreSight graph device. It is a platform
> +  driver that establishes the QMI connections used by consumer drivers s=
uch
> +  as the Qualcomm QDCP STM source and QDCP-backed TMC/ETR sink.
> +
> +  QECP exposes more than one independent QMI service (for example, a
> +  separate service used by remote ETM/diag sources). Each QMI connection=
 is
> +  described as a child node of the "qcom,qdcp" node rather than as a
> +  property of the node itself, so a single provider device can establish
> +  more than one connection. A node without any "connection-N" child is v=
alid
> +  but provides nothing for consumers to reference.
> +
> +properties:
> +  compatible:
> +    const: qcom,qdcp
> +
> +patternProperties:
> +  "^connection-[0-9]+$":
> +    type: object
> +    description:
> +      A single QMI connection established by the QDCP provider. Consumers
> +      reference this child node directly via their "qcom,qdcp" phandle, =
not
> +      the top-level provider node.
> +
> +    properties:
> +      qcom,service-id:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          QMI service identifier for this connection.
> +
> +      qcom,version:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        default: 1
> +        description:
> +          QMI service version for this connection.
> +
> +      qcom,instance-id:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          QMI instance identifier for this connection.

[Severity: Medium]
Does this binding model a virtual Linux platform driver and its QMI lookup
parameters rather than hardware?

The top-level qcom,qdcp node has no hardware resources or SoC-specific
compatible string, and its resource-less connection-N child nodes exist only
to pass qcom,service-id, qcom,version and qcom,instance-id into the driver's
qmi_add_lookup() call, encoding driver implementation details in the
Devicetree ABI instead of keeping QMI service constants in driver match data
or passing provider arguments via phandle cells.

[ ... ]

> +examples:
> +  - |
> +    qdcp: qdcp {
> +        compatible =3D "qcom,qdcp";
> +
> +        qdcp_coresight: connection-0 {
> +            qcom,service-id =3D <0x453>;
> +            qcom,instance-id =3D <32>;
> +        };
> +    };

[Severity: Low]
Should the unreferenced qdcp and qdcp_coresight labels be dropped from the
example?  Neither label is referenced in the example, which causes
scripts/dtc/dt-check-style --mode=3Dstrict to report unused-labels warnings.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119-introduce-=
qcom-qecp-feature-v1-0-b1a730d2c57a@oss.qualcomm.com?part=3D1
