Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD09B445AF1
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 12:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784032201; cv=none; b=LSF9Z4DM71Vt8oFpiN33JH0ijthImL9nK/hpITjWxxG7fpL++CPgCOqzS3TTWzt4atGGZ4JoW0W+u0nfRaq/PXAJGdHvXE24kXeoyJHtISmxBiCKtNXZ6VDswbVGmEkPn2yMRFrUpJkplO0CxJ0g8p3N3bdYFFCxHDBkiQ+w3fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784032201; c=relaxed/simple;
	bh=L4LJDb+8o5k2Z8rhyqIA4PCMjAUgV1A0DUnaDJTUELc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EjKofeVlRVoDgUDGDegTjZyqRkTB/T+60s6QhMUJ7F5tU9EhpQnUiE9gk9qhjhs+WKu4XyMGkIL7a6oNz/ak71pFQa7iZjaAXvEJUHW5iZhE6ttB3NygqqBHBFUJqcephWIH/txsbfWe4/O/5LbkaO6hiYb7XKHzGs55Rq5U8AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j4iOAThl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j4iOAThl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6CED1F000E9;
	Tue, 14 Jul 2026 12:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784032199;
	bh=t9qzOa3RTf3LtN1cOfPQaHV4TI2P4BIODGyCYqU2BPw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=j4iOAThlHnsNImMXPzqPiJ7GVADqpSRLSj1U9P6l8kDm6wXsfUTxMhnDEbgfzcIHr
	 2G7aqzSrP1j3JOWfxnYM/3D6mmaL/9ukmRHW08Zv/wYhbOTcH4BhP7H9IdCNjAqn7s
	 1RTb+lFsuw2T+W3RaOu9dDGFHJS5yWNcVDszQEAeCBpQkcp9a4izm7ODS8aQvC0aKt
	 M5hlEahSxHe92103O5T5RU93c06LL2M3rYxmwtBbzt1v92xDzM5gumB9FNR54LQFmM
	 QLs4suXOjyhD96WXEOwj2nf7JIiO0lHcKwwWr4auh0DoTllfG3+DXKlJAY34UR+gUU
	 WcFP/OFBjqtPw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: qcom,milos-pas: Add Eliza
 CDSP compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260714-remoteproc-eliza-cdsp-v1-1-32eb7a1f2c59@oss.qualcomm.com>
References: <20260714-remoteproc-eliza-cdsp-v1-0-32eb7a1f2c59@oss.qualcomm.com>
 <20260714-remoteproc-eliza-cdsp-v1-1-32eb7a1f2c59@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 12:29:57 +0000
Message-Id: <20260714122958.D6CED1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Legacy compatible strings silently allow 3 `memory-region` items=
 because they lack an explicit `maxItems: 2` constraint.
--

--- Patch [1]: [PATCH 1/2] dt-bindings: remoteproc: qcom,milos-pas: Add Eli=
za CDSP compatible ---
commit 035d1273c9ae4354ae4a87c41fd4d9ad57c5bddc
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

dt-bindings: remoteproc: qcom,milos-pas: Add Eliza CDSP compatible

This commit documents the compatible string for the CDSP Peripheral
Authentication Service on the Eliza SoC. It reworks the schema to accommoda=
te
a third memory region (DSM) and the NSP power domain.

> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.=
yaml b/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml
> index 99d7337e58ec5..3ee7be3304c6f 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml

[ ... ]

> @@ -97,7 +99,26 @@ allOf:
>            minItems: 2
>          firmware-name:
>            minItems: 2
> -    else:
> +

[Severity: Medium]
Since adding the third item to the memory-region properties implicitly
raises the maximum limit to 3 globally, should maxItems: 2 be explicitly
specified here for qcom,eliza-adsp-pas and the other legacy devices?

Without an explicit constraint, won't dt_binding_check silently allow
misconfigured device trees for these older devices to incorrectly specify
3 memory regions?

> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - qcom,eliza-cdsp-pas

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714-remoteproc=
-eliza-cdsp-v1-0-32eb7a1f2c59@oss.qualcomm.com?part=3D1
