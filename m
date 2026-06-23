Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F525374E79
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 10:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782209730; cv=none; b=fzSbA7mW2h2eibtUF8CrjRDAdLxKYqSpVEbq3qf5iYffDOtbxZKtnrq+hKk6BeR4UL7Nt6mZ9PvsnH/oSUoYfwrCDHLm8zviI/eOP4ruLTYqB/P2NdV+kLtbtUOwybCd+W1q/bw8fsl0b5ONVaXulyI9R9K6Y+5KkzhoOhbQpZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782209730; c=relaxed/simple;
	bh=qBI3mUcBDlU2d0WSr0NBaVnOdgigWc7Nv95HFNmKt9s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oettw80eOE16BnRkaLtFzIcQUP2921S+eFbUTsvCAKJXyjlS2gO5SGSjBRWy3k2rgT8Zn+fYttCwEb7g16+8wcT4hlP6GDyPZnJcXgsfxETDFfXF+1yU/bBXb3wjpOTDZryyj8dGAAaVEahTL5OvuYmPwqi2Uakk0yOXt3f7g8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z89ra5Dm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z89ra5Dm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BBD61F000E9;
	Tue, 23 Jun 2026 10:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782209728;
	bh=RIKPuUcNVcwzKyJbcjOP3Bt82yErqpQfuc+O9yrYTew=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z89ra5Dmq0RK3NVDfBMwJwFhYcUetBNGbSye8ssm1x4x0G3U9Z/asvE1qzU1qXRqE
	 c07bGlVbStCin5ZHraWETO5WHtEzxY26eTI/qG1VtX2Ro2Ziiih6Ggus+h0g9wfmva
	 UE4hi3HWhRbG91i4h8lNkE32v8T8jjJs8kFKb0zUjEQW/EOO5GcbP7nbSbuVlvrn9d
	 z8Ou5CxTrFfdikJhBW3YwrW3wJN0QWQkgcekBEihBsXc2CsiP+SsA1oqsNms/61mIO
	 LXvQrsxU3HJ3QlobWLm3GFNRviF3T8HAZtE+zetyq53ixb/OorvSqijj3ntAzCqwOA
	 5QlToLqAdPrNw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 3/6] dt-bindings: remoteproc: qcom: Document pas for
 SoCCP on Kaanapali and Glymur platforms
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jingyi Wang" <jingyi.wang@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260623-knp-soccp-v7-3-1ec7bb5c9fec@oss.qualcomm.com>
References: <20260623-knp-soccp-v7-0-1ec7bb5c9fec@oss.qualcomm.com>
 <20260623-knp-soccp-v7-3-1ec7bb5c9fec@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Jun 2026 10:15:28 +0000
Message-Id: <20260623101528.7BBD61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The example defines `IPCC_MPROC_SOCCP` without a replacement value,=
 which will expand to an empty token sequence and result in missing cells i=
n the `interrupts-extended` and `mboxes` properties.
--

commit 44f72d5685181ad53fef6c5965b26d8ddd07569e
Author: Jingyi Wang <jingyi.wang@oss.qualcomm.com>

dt-bindings: remoteproc: qcom: Document pas for SoCCP on Kaanapali and Glym=
ur platforms

This commit documents the peripheral authentication service component used =
to
boot SoCCP on the Kaanapali and Glymur platforms. It extends smem-states in
pas-common and adds maxItems constraints for SMEM properties across various
referencing documents.

> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-=
soccp-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,kaanapal=
i-soccp-pas.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-p=
as.yaml
[ ... ]
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,rpmh.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/mailbox/qcom-ipcc.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>
> +    #define IPCC_MPROC_SOCCP

[Severity: Low]
Does this empty macro definition cause missing cells later in the example?
Since it is defined without a replacement value, it will expand to an empty
sequence.

> +
> +    remoteproc@d00000 {
[ ... ]
> +        glink-edge {
> +            interrupts-extended =3D <&ipcc IPCC_MPROC_SOCCP
> +                                         IPCC_MPROC_SIGNAL_GLINK_QMP
> +                                         IRQ_TYPE_EDGE_RISING>;
> +            mboxes =3D <&ipcc IPCC_MPROC_SOCCP
> +                            IPCC_MPROC_SIGNAL_GLINK_QMP>;

[Severity: Low]
With the macro expanding to nothing, will this result in only 2 cells being
provided for the IPCC phandle instead of the 3 required by the controller?
This typically causes a schema validation failure when running make
dt_binding_check.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260623-knp-soccp-=
v7-0-1ec7bb5c9fec@oss.qualcomm.com?part=3D3
