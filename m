Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626373C37AF
	for <devicetree@vger.kernel.org>; Sun,  4 Oct 2026 03:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791083133; cv=none; b=eTUxrtqD2USOaR6Yx/1C17pyOAmPwB06r/nmZNOLMzMW+nlg/Xqzys4CfrQjzi9m3PmzWb/xEGFbO+rZ1p++p5rHWhCXSU63CTToQf2sMdgWyOznrxCwiVWFxd/CGjAyRvDPm8oYbx8OtjiquEHInui3G71H3m6Oqp2Sj40e0Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791083133; c=relaxed/simple;
	bh=8w0VK0+gro4LD62ACNKt8QGymMQar54IIbQ/Fh/gCUM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mPTkfHAkN/uzYM0AfAY9oE4CA2z2wQpp2i4JRrX7a8lCtMiAdhn51QYCkfPd5nyxRq2j+dpWToJ7hebUXLUi+Io7UxxbWQzfvjWYR27uRClxTQpRw+zB74hhaWzPLwnsZPGFGX8JW3GKbP/uJ/aVcPeU8+MDJRPPbfQlmUgmlak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YzSkqyFG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YzSkqyFG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D32A1F0089B;
	Sun,  4 Oct 2026 03:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791083131;
	bh=DuAiSrupMXLT8tAQMjv+DVPZbmNzfOZSJg6GSG9EZgE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YzSkqyFGr9JpkmKkQL7nhjaxvGYxlWXN19AtoflVkkgi7T0bSnbGRDcb8Ozm/3Ip7
	 lNS4wjg5Ntbxkme4CNhvEiolZ6ectv8CMc/c9kh073dnUbb0kD5T5tvEwD+o0Bl5p/
	 0CRqZNiVN0xqp9UnJA3OFSveP0j36UqMaog8260a3ceXtnMWeBCsc884zcKv3C6mZC
	 cDf1fyvHlR4AQlTXG/BeN3J9xLtQC2x43F+w2Aqkqtldf4n28Tthq3CuzlFBfCCIug
	 2n6heo/2RWuXxFqoArxTTgb05W0SDvz00ULWbOEx60WTWevIGlCxsMVyfBHAMITVof
	 nGn+mccpH4zeA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: connector: Add time property for
 tSenderResponse
Reply-To: sashiko-reviews@lists.linux.dev
To: "Amit Sunil Dhamne" <amitsd@google.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20261004-tcpm-sender-response-time-v1-1-3f8b43084acc@google.com>
References: <20261004-tcpm-sender-response-time-v1-0-3f8b43084acc@google.com>
 <20261004-tcpm-sender-response-time-v1-1-3f8b43084acc@google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 04 Oct 2026 03:05:30 +0000
Message-Id: <20261004030531.9D32A1F0089B@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: missing schema constraints for sender-response-time-ms
--

commit eb9d81bbfb13df2dbe09db76aefbc40c815abe01
Author: Amit Sunil Dhamne <amitsd@google.com>

dt-bindings: connector: Add time property for tSenderResponse

Add the sender-response-time-ms property to allow platforms to specify
the tSenderResponse timer value, i.e. the max time a port waits for the
port partner to respond to a message that requires a response.

> diff --git a/Documentation/devicetree/bindings/connector/usb-connector.ya=
ml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> index 8ca0292490a2c..52dbdd738db64 100644
> --- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
> +++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> @@ -283,6 +283,15 @@ properties:
>      maximum: 200
>      default: 200
> =20
> +  sender-response-time-ms:
> +    description: Represents the max time in ms that a Type-C port waits =
for

[Severity: Low]
Is this new property missing minimum, maximum, or default constraints?

Unlike other timers in this schema (such as sink-wait-cap-time-ms), the lack
of boundaries means offline schema validation (dt_binding_check) will silen=
tly
accept arbitrary values. Should this have explicit numerical limits to prev=
ent
accidentally violating USB PD timing requirements?

> +      the port partner to respond to a message that requires a response.=
 This
> +      timer starts when the port's PHY layer receives the last bit of the
> +      GoodCRC EOP corresponding to the message requiring a response. Thi=
s timer
> +      stops when the last bit of the EOP of the expected response messag=
e is
> +      received by the PHY layer. A timeout leads to a soft or hard reset=
 by the
> +      port.
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261004-tcpm-sende=
r-response-time-v1-0-3f8b43084acc@google.com?part=3D1
