Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDC7260580
	for <devicetree@vger.kernel.org>; Sat,  6 Jun 2026 12:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780750020; cv=none; b=BpLwajRz/jAGbMO3Ly+5tfAwZl7KBJqgX7QTB5q9ux13cj+E3WIUxk/0cEmmxY9xggBmRqDIjzZBYBPKd8oWeOxxXEtHDjU0SIdC9NG82WpKfe3ipo/KSzuxK0+mugMyp86G3spqVddoktU9KlvGoIB06JFbANKN/M1r9UgP0JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780750020; c=relaxed/simple;
	bh=c6ea4iERoaiCtxou/HoVjEbobBLvETv6+rhRg6doNwA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=l1AJqqjzyR0bPDLRUj15UDrbIw8hKU4lBo4qj3Ra3j6K+PI9Ifw5FqTKZ4ISbnDU7XoEPUfaX2aOVfK3WWVDbV4FCk0obBO8RcvujE9eUjRUiCz32b3y+VxBs5e+pjR7z8x+bLaLnKQ82N0FCa7N+tKrh/sMHalKpJO6JeNMlOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jyUYm4MQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jyUYm4MQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA9CB1F00893;
	Sat,  6 Jun 2026 12:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780750019;
	bh=/aS8c3Ix2pWiECvvB01NYbfm3dVXxsJ9OqmBjrwKO/g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jyUYm4MQl3oLIEQ7tAzOFBXcxn81AW6i0Jx/Ic8C6Mj0tB7dLzuO+9d/Q//CYq5xy
	 fyTyTr8HAVf+qgyksHyvtGJ9rqMSUk70hPSZ7VvL8wPxf5hoLH8HlsOPlueJtcDZ9b
	 ycpkhz8hoTzL26xBP6+zDpmHVvDuxefO0Js7lrfBYoy8cg+5dvBJNB4JvBCFzHfguR
	 VI349TGYis+dbfKIrzc6vDb2ItSvBjzFbRj2NcVv2m7zLNnTPYLdzDD5IwQ6yFlZC1
	 8xUygQvqay/W8IdsQjXPBn0W01Dmok+8I9lQw+xbjp8sl98tT8JbWE0/NGHPyJVD81
	 Yav2mh4+OxQAA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: interconnect: qcom: add msm8660 NoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Herman van Hazendonk" <github.com@herrie.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260606-submit-interconnect-msm8660-v3-1-f9da0158cdf8@herrie.org>
References: <20260606-submit-interconnect-msm8660-v3-1-f9da0158cdf8@herrie.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 06 Jun 2026 12:46:58 +0000
Message-Id: <20260606124658.CA9CB1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The schema inherits a deprecation warning by referencing `qcom,rpm-=
common.yaml#` while explicitly using the deprecated `#interconnect-cells =
=3D <1>`.
--

commit 5ce31b27e0895bb0c743c163991a0db815e92b7e
Author: Herman van Hazendonk <github.com@herrie.org>

dt-bindings: interconnect: qcom: add msm8660 NoC
   =20
This commit adds a dt-binding schema and interconnect master/slave ID header
for the Qualcomm MSM8x60 family (MSM8260/MSM8660/APQ8060) Network-on-Chip.
The chip exposes four NoC fabrics modelled as interconnect providers which
program arbitration through RPM firmware.

> diff --git a/Documentation/devicetree/bindings/interconnect/qcom,msm8660.=
yaml b/Documentation/devicetree/bindings/interconnect/qcom,msm8660.yaml
> new file mode 100644
> index 0000000000000..ff28c7d46c323
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interconnect/qcom,msm8660.yaml
[ ... ]
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,msm8660-apps-fabric
> +      - qcom,msm8660-system-fabric
> +      - qcom,msm8660-mmss-fabric
> +      - qcom,msm8660-daytona-fabric
> +
> +  '#interconnect-cells':
> +    const: 1
> +    description:
> +      Each consumer phandle takes the form <provider node-id> where node=
-id
> +      indexes the per-fabric ID array in
> +      <dt-bindings/interconnect/qcom,msm8660.h>.  qcom,rpm-common.yaml
> +      permissively allows 2 cells (and 1 marked deprecated); pin this
> +      provider to 1, which is what of_icc_xlate_onecell strictly expects.
[ ... ]
> +allOf:
> +  - $ref: qcom,rpm-common.yaml#

[Severity: Low]
Does referencing qcom,rpm-common.yaml# here cause a deprecation warning to
be emitted during dt_binding_check?

Because this binding explicitly forces '#interconnect-cells: const: 1', and
qcom,rpm-common.yaml marks 1-cell as deprecated, wouldn't evaluating
any valid DT node for this provider trigger a warning?

Since qcom,rpm-common.yaml defines no other meaningful constraints (it
specifies additionalProperties: true), does referencing it here provide any
functional value, or would it be better to remove the reference to avoid
build warning pollution?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260606-submit-int=
erconnect-msm8660-v3-0-f9da0158cdf8@herrie.org?part=3D1
