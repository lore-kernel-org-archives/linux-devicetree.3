Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3909C3A984F
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 14:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789915397; cv=none; b=uVUgtn3brFFIsibqbSLy5XGfQadRWfFag3H7+owZbXqGwjBP/JFZFD5PJV92v+Pryv8rGmeWTxpRL+SqTvE/hsMR7WrzJHtjZAj2V2US9ncA5KKD9ihhqVpKfoQx6hNeafi5Chki8AOkPNPI2gCD7GqAduXJlJp9l2YPqe2iKGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789915397; c=relaxed/simple;
	bh=d5lEEfq9YYQmuROK5A5sLC6toruqstUPGzVM08jU5GA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SFwhnz3caZ5nEGtg3bhDQWqVOqp6BKB/hIN0JBz7LQ/w/6mboz4Cqyv0jVsI+mddEXT1iB7TNjUK3UvQo98D+5YXG9wEO8PxzzGWHHpjQUAEO5EsJLlioLq9MQxq/eOC3OJPTmNXydsOcAM7HzUW1A8fWBNX1XwDnc+6cBXL8tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XWd+agh+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XWd+agh+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C75E11F000FF;
	Sun, 20 Sep 2026 14:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789915396;
	bh=25E20s/L6FvkE6LWzmkx6sT33i0oyIvWp3StbSBOpOc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XWd+agh+RvCrZSbI9/gRNuxU9d8h/zwl4e6JI3GnygbpetYvjLFGAQYaH4DS76WCX
	 CCmZjIA+p+mrriIsdFzF/t/GQsuWs1qCktbBVdkE6MtbqRgeetB28h+XXPVqihr+zp
	 jTk7LM3zj8/hqgkLMUgV4L6SIks5vfQSP7T5jRU8fpQPwjL/Ax0YuvkFmLNCbm5vcZ
	 mylWhIocu0xenytGGXLjXQ3haFYjrqPzOW3X8GwcYkQSjw3L29698wCfMo2ttWKmOp
	 9CCwkyJOyUjWmeRiVnd5hWDOh4hHLzJ7XbFxUiGXJd1A8KLFJ9MrZA5cA0/GEsgkTu
	 6/qQoZZgohDKw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: usb: qcom,pmic-types: make example use
 generic VBUS property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260920-fix-tcpm-vbus-bis-v1-2-cc9347bbe81a@oss.qualcomm.com>
References: <20260920-fix-tcpm-vbus-bis-v1-0-cc9347bbe81a@oss.qualcomm.com>
 <20260920-fix-tcpm-vbus-bis-v1-2-cc9347bbe81a@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Sep 2026 14:43:15 +0000
Message-Id: <20260920144315.C75E11F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: incomplete oneOf constraint allows omitting VBUS su=
pply
--

commit 3178bc24ea3cc08021dfdd40f7987789b23a49de
Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

dt-bindings: usb: qcom,pmic-types: make example use generic VBUS property

The commit fe2195b019f6 ("dt-bindings: usb: qcom,pmic-typec: deprecate
device-specific VBUS") switched the schema to use generic vbus-supply
property, however the example continued to use the old, deprecated one.
Update example to use the expected style of specifying the VBUS.

> diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml b=
/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> index db487562cec49..dd56dc8afe032 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> +++ b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> @@ -176,7 +176,6 @@ examples:
[ ... ]
> -            vdd-vbus-supply =3D <&pm8150b_vbus>;
>              vdd-pdphy-supply =3D <&vreg_l2a_3p1>;
> =20
>              connector {
> @@ -186,6 +185,8 @@ examples:
>                  data-role =3D "dual";
>                  self-powered;
> =20
> +                vbus-supply =3D <&pm8150b_vbus>;

[Severity: Medium]
Does the schema properly enforce that one of the VBUS sources is provided?

Looking at the oneOf constraint defined in this file:

Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml:oneOf
  - required:
      - vdd-vbus-supply
  - properties:
      connector:
        required:
          - vbus-supply

If a device tree node misses both vdd-vbus-supply and the connector node, it
fails the first branch but trivially passes the second branch. This happens
because the properties keyword only applies constraints to properties actua=
lly
present in the instance.

Since exactly one branch passes, the overall oneOf constraint evaluates to =
true,
silently accepting incomplete configurations and defeating the purpose of
requiring one of the VBUS sources.

Should the second branch also require the connector node to be present to
ensure the constraint works as intended?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260920-fix-tcpm-v=
bus-bis-v1-0-cc9347bbe81a@oss.qualcomm.com?part=3D2
