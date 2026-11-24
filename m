Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795518425;
	b=VALyDzg6qn6oKNgpfkbIsmlYoSjHxy4U2+YhTytPQdmnvJG9vVUzG4jJYm87Jg4io5u7
	 grYZdwpyfprfQ9IAYMe15ED0mGKjm2rGIEr6vJ1xcLG0jUpqzZTOKAbfrH7hDDtEGL9Kg
	 OVaxkCccCr6GYUo9Sf2pUt3dTtuIFdp1ON4CZ7JwiGlZvqnoWl85iYlomC6oB7FCaH6F0
	 6J/PPJOtACD3jrMurob4g0e5FqVklF+GxH+PQgovXqEW2hhOJEuK95TutkPHr4YxFlXid
	 lq1kWHnZzz5pmCeb5Zkt7xxI+G0m08POcw6Kz4C16HXUbD7jc2iEP3qTIV7wVbfNqAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795518425;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=gw8VGlOwiVtw7UL46Xubfv4KciguQskqJtzxpKm6JNw=;
	b=VVt/GyIBAba4U62i1TfwrVZLYlbykGcDPUY6mHGJLP5ic4oVxA2yO6+s8vcYuJjlKuqs
	 sAigugRAWMOz9RTNQ6ABRh3ebjIiNPo1dLOIumGCvtOkDE0AxHsO0z8jCN5I45PBT0Twt
	 97ysh+du2v3yvrVpiBkyfzQC9xjW1FoQk5wSCjFxmw7KOJ5Ty3tv18kY6bMAY15qoy8Qq
	 Oh7aI1+2u+v6GQ28GL7MAjhLcsRLG7bc9PStMugsvht6yR7pWHjfrYXmzCPhIh6lzqVYp
	 iGfQHPqK3RUugNtwmITFz97Juv9KMqjLFkF+IyVp0NMJ5rHA3evHztP6pcBe5egIJjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MbOf6av+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14BD8606A31E
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 11:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MbOf6av+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 215A01F000E6;
	Tue, 24 Nov 2026 11:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795518424;
	bh=gw8VGlOwiVtw7UL46Xubfv4KciguQskqJtzxpKm6JNw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MbOf6av+FVqJFRkfkiy9oDLXFXVKh0OfzGLkXhdtECPY7BzCIbMfTOxfPSKolP5VS
	 mKMDbOpJfgiHeX6yTPMncfoyv3DSTjVOS1KU9EzyIIdxl7047MO25yDYCHgINKwab1
	 aP5RZDZAyjfyMOhB/FOBVR1Thst1/JX4O42bCgATfqjiHlo0y4ik+nt++rTRSvlWpj
	 Dox9zP1Plj5y7B4798kZTzVGEjtAoznQpyWbbDRjy0Adj23Pi/QTb6Zzq2K4HHiXNn
	 t/dR2F0+dYZdXm/Uuqvhtx+IIK6ES0wgFxFWb/LVDyaNl0eVPmSg+xb/EgPUZ2mpPx
	 cleVsu3/UdoTg==
Message-ID: <sashiko-outbox-231020@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: Add compatible for Seca SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yadu M G" <yadu.mg@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <0439e03884c02c9edbec89132b526aaf8f54ae23.1795517696.git.yadu.mg@oss.qualcomm.com>
References: <0439e03884c02c9edbec89132b526aaf8f54ae23.1795517696.git.yadu.mg@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 11:07:03 +0000
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
- [Low] dt-bindings: i2c: duplicate items block for
  qcom,sa8255p-geni-i2c fallback
- [Low] dt-bindings: i2c: qcom,secaau-geni-i2c prefix mismatch with Seca
  SoC name
--

commit 06cf018f67093650540070382d01b9c8f9a7f05c
Author: Yadu M G <yadu.mg@oss.qualcomm.com>

dt-bindings: i2c: Add compatible for Seca SoC

This commit adds the qcom,secaau-geni-i2c compatible with a fallback to
qcom,sa8255p-geni-i2c for the QUP GENI I2C controller on the Qualcomm
Seca SoC.

> diff --git a/Documentation/devicetree/bindings/i2c/qcom,sa8255p-geni-i2c.=
yaml b/Documentation/devicetree/bindings/i2c/qcom,sa8255p-geni-i2c.yaml
> index 04caf622b3ba1..63895fdb51e2e 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,sa8255p-geni-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,sa8255p-geni-i2c.yaml
> @@ -16,6 +16,9 @@ properties:
>        - items:
>            - const: qcom,sa8797p-geni-i2c
>            - const: qcom,sa8255p-geni-i2c
> +      - items:
> +          - const: qcom,secaau-geni-i2c

[Severity: Low]
Should this compatible use "qcom,seca-geni-i2c" to match the Seca SoC
name in the commit message?

Upstream Qualcomm codename-based compatibles in
Documentation/devicetree/bindings/arm/qcom-soc.yaml (such as Nord
Automotive using "qcom,nord-*") use the base SoC codename without an
internal "au" suffix, and neither "seca" nor "secaau" is documented in
qcom-soc.yaml yet.

> +          - const: qcom,sa8255p-geni-i2c

[Severity: Low]
Should this new compatible be grouped into an alphabetically sorted enum
with qcom,sa8797p-geni-i2c inside the existing items block instead of
duplicating the items block for the same qcom,sa8255p-geni-i2c fallback?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/0439e03884c02c9edbe=
c89132b526aaf8f54ae23.1795517696.git.yadu.mg@oss.qualcomm.com?part=3D1
