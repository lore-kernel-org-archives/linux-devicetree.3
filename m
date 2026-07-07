Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDE531A057
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 09:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783416136; cv=none; b=HsDVay7Gm7CVlpVvJT0ywyVWMRoBlTr991k7982qViYLoGdhfZFSk4JSEU7vA8mR0Ws6MoW4prvDbV447X7JFp3IUkaYohY7P9oNrrmAxlWzPW8Ep+l2CuzY3o9p9B8s+YYUvN37GmVh9trpOLfE3hlPYrwjZ9fANxbjsiNL3a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783416136; c=relaxed/simple;
	bh=YEJuP+BmgA+aMXMggeOZ1KyTb4JMQATACAOHYjIeq/0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KthKXia/DeNJqpTXyF0oQGvRXJne1rmgOfkQMOkbY3WdwrviBLUFh5jtfgVGlGJFI5VOrYBZcIG8IMyldQgxC+9uJD+I1aG+04x6DNeWXP3tzw1gVsbGid85kuGM5N/uTpuM2LRFatT/HZ46IhIXklYf5XE5qzmlfkNz9igtXx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MsaBfo/d; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MsaBfo/d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 476641F00ACF;
	Tue,  7 Jul 2026 09:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783416134;
	bh=XlPq/brXrBrk/yHvgdJ25Ro457uxqvQIsoXzUJd/s+w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MsaBfo/duHlFB4PWVY5ISU+aV05RoylgQbd6BEoI4IajCMYi2s7OgZNQ3PpsgSnnY
	 gSl907XA51eunGrfpNXVcXRf2WWOyBdPZV68jrfKCucNsWUTbIxzDa3ZgwmZIFPpZR
	 mTqm3HpMEJBcF9mxUx5NJou9nVXqKDdBQKxRV5YK6pN54ggGrx8lkg+8dExTnfffBz
	 AobVurW2v3JZaQo4nMACfRoWRXOxpxzS1DO8P63NS/rhX/f9cws6y0wj++HCbphKEC
	 KdY20RpddexMap72aeo6VEEdsRs5OB/EigIpS5xOr3AkvzvyXq1A0lscoQeesee2ZQ
	 o3w0AbFn36+nQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/5] dt-bindings: arm: coresight-tnoc: Drop
 arm,primecell to bind on platform bus
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jie Gan" <jie.gan@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260707-fix-tracenoc-probe-issue-v5-1-bf733ed9ebd0@oss.qualcomm.com>
References: <20260707-fix-tracenoc-probe-issue-v5-0-bf733ed9ebd0@oss.qualcomm.com>
 <20260707-fix-tracenoc-probe-issue-v5-1-bf733ed9ebd0@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 09:22:13 +0000
Message-Id: <20260707092214.476641F00ACF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Changing the compatible schema to strictly require only 'qcom,core=
sight-tnoc' breaks validation for existing device trees, and removing the c=
ustom select block prevents safe restoration of backward compatibility.
- [High] The platform driver is not configured to match the 'qcom,coresight=
-tnoc' compatible string, causing devices to fail probing if they conform t=
o the new binding.
--

--- Patch [1]: [PATCH v5 1/5] dt-bindings: arm: coresight-tnoc: Drop arm,pr=
imecell to bind on platform bus ---
commit 04928b8d12a8ec737b7aeaf2dab2136838ce0ddd
Author: Jie Gan <jie.gan@oss.qualcomm.com>

dt-bindings: arm: coresight-tnoc: Drop arm,primecell to bind on platform bus

The TNOC compatible previously required the two-string AMBA form
"qcom,coresight-tnoc", "arm,primecell", which forces the device onto the
AMBA bus. Change the compatible to a single "qcom,coresight-tnoc" string
with no "arm,primecell" entry.

> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.ya=
ml b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
> index ef648a15b8065..72fb1210e22e0 100644
> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
> @@ -22,24 +22,12 @@ description: >
> =20
>    Note this binding is specifically intended for Aggregator TNOC instanc=
es.
> =20
> -# Need a custom select here or 'arm,primecell' will match on lots of nod=
es
> -select:
> -  properties:
> -    compatible:
> -      contains:
> -        enum:
> -          - qcom,coresight-tnoc
> -  required:
> -    - compatible
> -
>  properties:
>    $nodename:
>      pattern: "^tn(@[0-9a-f]+)$"
> =20
>    compatible:
> -    items:
> -      - const: qcom,coresight-tnoc
> -      - const: arm,primecell
> +    const: qcom,coresight-tnoc

[Severity: High]
Does this change break schema validation for existing device trees?

There are existing in-tree nodes, such as in=20
arch/arm64/boot/dts/qcom/sm8750.dtsi, that still use the older fallback:

	compatible =3D "qcom,coresight-tnoc", "arm,primecell";

If this schema is updated to strictly require only qcom,coresight-tnoc,
validation for those existing device trees will fail.

Additionally, by removing the custom select block, if the arm,primecell
fallback is restored to maintain backward compatibility, won't dtschema
auto-generate a select that matches any node with arm,primecell and
erroneously apply this schema to unrelated AMBA devices across the system?

[Severity: High]
Will devices conforming to this new binding fail to probe?

Looking at the platform driver in=20
drivers/hwtracing/coresight/coresight-tnoc.c, the OF match table lacks the=
=20
required string:

static const struct of_device_id itnoc_of_match[] =3D {
	{ .compatible =3D "qcom,coresight-itnoc" },
	{}
};

Since the schema drops arm,primecell, the device will be instantiated
on the platform bus. Without qcom,coresight-tnoc in the platform driver's
match table, won't this result in a complete probe failure?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707-fix-tracen=
oc-probe-issue-v5-0-bf733ed9ebd0@oss.qualcomm.com?part=3D1
