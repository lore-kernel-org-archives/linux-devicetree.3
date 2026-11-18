Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795023201;
	b=hzclTqpTmSMdXI5CnA5IIlNocec8N58O0MUApwooRC4+tw2dkGbnQ6OU5yX3mP/BBDYb
	 xb/BiV0LPo4cpAMZ8SfnXbHTLOE9VQPM1P3hXIoh5hSfrImFX+74Gpn1mBG0kj/EkeV0g
	 Qqaf2xoCAOg0IRiGIYkjA2DreNV2GVCeiBm0/TW6kwULW2jm/qHSU7Nm8CA1QrA/c6AWp
	 dlla/VGa3fO8S9wimBU9bA/ysxsF1jCeiAqbEoRY2H1SYeMMKTSAbRBE/3B8hF8wxEAp9
	 q8QzHObZtIAHU0M8JIsN/nqfBal2N69bh316f6OSwQPjbnQGNtNWcKAR1wsG22ySWQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795023201;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Sf7r3HyqKzaKnDMlRVDoO4cK/Hk4WcZqfT9RzLCWyiw=;
	b=bSgoLsctsvOFI2k1gzhG+hsRYJwvVT5SQsKwPwCNDGkDPmU6NDbwXlriZuCokPoOFhBN
	 hpH8jCP+SN1qdGhzTiy6L8/vi8JxWHWyBaJtW0HcvfTUng9WEjaGOMmb+bqIR2H4gPeT3
	 aiXkGWmyKmqbLuES1JRslyVbTPDyHnsyBsN//rVCpHxUDHeQ/WPc+OXncxDwuJpqOefby
	 D4NyFsdhlbpiABan5eLYasmtsmjyyxjjxUwvnLiV6JexHeX+5j0pZSrvBEFBwNrc16MIP
	 rRnSr6YC6PhLY3S4Yv0DUViY2XJw4sgnTi6dJJfT1+SQOj9FQo5sbeEXTHWzWzET+eQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MLVtovDJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25538606A32C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 17:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MLVtovDJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B31221F000C4;
	Wed, 18 Nov 2026 17:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795023200;
	bh=Sf7r3HyqKzaKnDMlRVDoO4cK/Hk4WcZqfT9RzLCWyiw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MLVtovDJd0Yk7zGj84bWMxTvyY/iTgA16Zk/CBB2o7yClMAU8+tfySk7JCKcY+VZg
	 DCybH/g7tdTWUFJWm/Nc+6zFZcXWgQ0l+SAtRkshl7dnAcTbt+obNXZxrIGGyx6gnN
	 IpbcokMozMGA7SIx4LKqeLi6FOnvEMqaPgRNIX/pmLcQyLHJU/JnnDNZhhtiz4sDuK
	 u2jjPJrAHX+WSZl7fvuPjy/TpS5wHxMSAG4J2dcW6vEQxUY+MPxmFqbc7xDDYOUBtR
	 rFIYQtJV5cwJhmRWE23j/xigX2sP1imI4ly+bDXbtjL60UGYeI+63uShe7EGS9Iw+2
	 e7X/Y7GibsB9w==
Message-ID: <sashiko-outbox-221657@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 04/12] dt-bindings: regulator:
 qcom,usb-vbus-regulator: Add pmi8998 and pm660
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg" <david@ixit.cz>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261118-pmi8998-vbus-v2-4-3c77a72b280a@ixit.cz>
References: <20261118-pmi8998-vbus-v2-0-3c77a72b280a@ixit.cz>
 <20261118-pmi8998-vbus-v2-4-3c77a72b280a@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 17:33:20 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] dt-bindings: regulator: typo in fallback compatible for
  qcom,pm660-vbus-reg
--

commit d53eae4793d2d86b3e41fd0d2b1c0495b964d938
Author: David Heidelberg <david@ixit.cz>

dt-bindings: regulator: qcom,usb-vbus-regulator: Add pmi8998 and pm660

This commit adds the qcom,pmi8998-vbus-reg and qcom,pm660-vbus-reg
compatible strings to the Qualcomm USB VBUS regulator DT binding schema.

> diff --git a/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-re=
gulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-re=
gulator.yaml
> index 024b34d0eb1a6..96f984060ce4d 100644
> --- a/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator=
.yaml
> +++ b/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator=
.yaml
> @@ -27,12 +27,17 @@ properties:
>        - enum:
>            - qcom,pm8150b-vbus-reg
>            - qcom,pm4125-vbus-reg
> +          - qcom,pmi8998-vbus-reg
>        - items:
>            - enum:
>                - qcom,pm6150-vbus-reg
>                - qcom,pm7250b-vbus-reg
>                - qcom,pmi632-vbus-reg
>            - const: qcom,pm8150b-vbus-reg
> +      - items:
> +          - enum:
> +              - qcom,pm660-vbus-reg
> +          - const: qcom,pm8998-vbus-reg

[Severity: Medium]
Should the fallback compatible for qcom,pm660-vbus-reg be
qcom,pmi8998-vbus-reg instead of qcom,pm8998-vbus-reg?

The standalone enum above and qcom_usb_vbus_regulator_match[] in
drivers/regulator/qcom_usb_vbus-regulator.c both use
qcom,pmi8998-vbus-reg, so a PM660 node using that fallback will fail
dtbs_check validation against this schema.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118-pmi8998-vb=
us-v2-0-3c77a72b280a@ixit.cz?part=3D4
