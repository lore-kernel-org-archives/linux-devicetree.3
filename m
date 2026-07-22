Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B270E233954
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 09:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784713910; cv=none; b=IQB0TVY07XltXHtHQbXctdz+bPAri18VKe0aZ+MUscCpq7TYh+7dDduGTFXGexJ+eEzXBBwWwLwaGBfnZ4ohbI0v9+uewHrCimwPDEp8jKdBHwQR4n2Zu9SYhE4nuTWrVVrYiPCcxwLUkrl/UlMRHaLbtsbkPdOpjuTaJJ2tl6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784713910; c=relaxed/simple;
	bh=LeWSlCRI8FEwX5j+3I+d4jy1vquTbsqY7ya8VKf0gxs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NmRk9LpC7Am88VT4k1+wmdQ9rLF5WUr3nUuoqZj6W0vQMCcdTAg0l31MCquhyI2iqCERsf0OA7fEfAXmjCciBe41HJfUV8Ns4jWWlDHbDLVRApwqVxjxI+vXmNSkkVizXT/sLdFSWCFSaL0OcRapof1WxMFVXea9jm/LEBB+B4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q2421t5/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q2421t5/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C9DD1F000E9;
	Wed, 22 Jul 2026 09:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784713909;
	bh=cd8EpVT19Rwlu4PQIgD9QEHF1XwcLfjN3ljZQWutEDk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Q2421t5/dj5aZjsA8iLptONqHL4Ef0p2F9ikQviYtGbnk2He94ZJ21j/ryX5IHHSb
	 Tdv4LMxjnc+nNb+A2ttF68SFpqDrM4mj+8vcccZEeiHM6AOYPRyK1yQYe55G69Jzt4
	 USeJvPoPz4f0lpQ6KZoxtdEgZ9LvY8pDVdFN8bQKRHRVDhv7Q3OYZ2bDCHviZ+2r80
	 3C4LWYHinr9Q+R2ASW1aw9yyk4s5+ciB026rhKwciElWY8wukQSpWz36u+/M4pDBsg
	 +WgaUnU6ZPzkyHhZWwwotyuPw6r/up8nYObeZB0crdjYERsTc9OcjSbmOhyRttfTTE
	 hszD0kyjNZVVA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: qcom,milos-pas: Move
 Eliza ADSP to SM8550 schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260722-dts-qcom-eliza-fix-adsp-binding-v2-1-e1e98ae15533@oss.qualcomm.com>
References: <20260722-dts-qcom-eliza-fix-adsp-binding-v2-0-e1e98ae15533@oss.qualcomm.com>
 <20260722-dts-qcom-eliza-fix-adsp-binding-v2-1-e1e98ae15533@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 09:51:48 +0000
Message-Id: <20260722095149.0C9DD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Moving `qcom,eliza-adsp-pas` to an items list requiring a fallba=
ck breaks backward compatibility and schema validation for the existing in-=
tree device tree.
--

--- Patch [1]: [PATCH v2 1/2] dt-bindings: remoteproc: qcom,milos-pas: Move=
 Eliza ADSP to SM8550 schema ---
commit de0588624107f153559b1ce48e9d1f56b81467d0
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

dt-bindings: remoteproc: qcom,milos-pas: Move Eliza ADSP to SM8550 schema

The ADSP PAS found on Eliza SoC looks fully compatible with SM8750, which
can fallback to SM8550 except for the extra interrupt ("shutdown-ack").
So document its bindings in the SM8550 schema instead.

[ ... ]

> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas=
.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> index 2a4c527552e69..e6d81a38fd1c0 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> @@ -29,6 +29,7 @@ properties:
>            - qcom,x1e80100-cdsp-pas
>        - items:
>            - enum:
> +              - qcom,eliza-adsp-pas

[Severity: Medium]
Will this break dtbs_check for existing device trees?

Looking at arch/arm64/boot/dts/qcom/eliza.dtsi, the compatible string is
currently defined without the newly required fallback:

arch/arm64/boot/dts/qcom/eliza.dtsi:
		remoteproc_adsp: remoteproc@3000000 {
			compatible =3D "qcom,eliza-adsp-pas";

Since this schema change now strictly requires the items array to include
the qcom,sm8550-adsp-pas fallback string, does this break backward
compatibility and cause schema validation to fail for the existing in-tree
device tree?

>                - qcom,glymur-adsp-pas
>                - qcom,hawi-adsp-pas
>                - qcom,kaanapali-adsp-pas

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722-dts-qcom-e=
liza-fix-adsp-binding-v2-0-e1e98ae15533@oss.qualcomm.com?part=3D1
