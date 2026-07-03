Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04011343886
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 05:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783055722; cv=none; b=VXIp74V5TzO+f8k9bOnsR39cDAjI1/NfjhfFIHnxG7x7E/IpVX6qmChErRqlclLKdApmYgFjF3SfqV26QHyObx7waYWMcm6Qg+2W+yQmlxUl/aqe8MzQhrK3CgV8/GrDR0xtHD/4eMlExNnGNggpzz/D+Zleaa6Yfme8W6+aSTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783055722; c=relaxed/simple;
	bh=vys3Ey5NYaKs3Yu9IGedfQEs0G5PzsxGqfyWQsHGpQc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bGDuVuEd+Ca8HM6psvibCkiRlipzPcImjoEvWfkXqOE3MiCyBy5zhkU4WQZeqUrfeexgykz3l5F7CqWG781pXlaHZIv3CTl2i9r1oFpdjPPR0IPo2hDgnYEDFcl9C9EBbCVl1fo5GKHqp75ThcVW/fPopav9YGP7+/6jPX/BW0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J/2VVo76; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J/2VVo76"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B3AE1F000E9;
	Fri,  3 Jul 2026 05:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783055713;
	bh=lsVyinJDYG0ClkTQYcy5HGFR9pLxoE+sOi0e94RE/IQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J/2VVo76tYHVupU1fFhYGt35X8w99P1xL4ABWrEQujgyF4eF58qbC3RlFgwTArIui
	 /0mdm67wu6Ne7jejzfPqaMBd/Pq2jZuOXbzhfLAT6XHUs0gh3D+Zi8iCUEHUFipH4K
	 7Djj8U/YHeXSInUtesT5hzHoF8bpH652F90WkiMOb1erdtWp4pBz3iAK8HHjn945N6
	 w4nsc1khnmLvfFGIUGghKnssGXH0Gyb4tutz40zI/cy+FXiWJCG17b+Pe9gBRHzsCm
	 T58MvTIrhHGgPERXXYfDkTH4eF1RWmf+9amWnP0nN/OMa/UBVtXXXD/31p+U93H4v1
	 qb7EFj1iIG4FA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 02/10] dt-bindings: remoteproc: qcom,pas: add
 #cooling-cells property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gaurav Kohli" <gaurav.kohli@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260703-qmi-tmd-v4-2-3882189c1f83@oss.qualcomm.com>
References: <20260703-qmi-tmd-v4-0-3882189c1f83@oss.qualcomm.com>
 <20260703-qmi-tmd-v4-2-3882189c1f83@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 05:15:12 +0000
Message-Id: <20260703051513.6B3AE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The newly added example fails `dt_binding_check` due to missing req=
uired properties.
--

commit d6d7b5d5f32286193dde6ee3686dfbc725c49024
Author: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

dt-bindings: remoteproc: qcom,pas: add #cooling-cells property

This commit documents the optional #cooling-cells property for Qualcomm PAS
remoteproc nodes. It allows them to be used as thermal cooling devices via
the QMI Thermal Mitigation Device interface, and adds an example configurat=
ion.

> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common=
.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
> index 4607b459131b4..ef11371058c4f 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
[ ... ]
> @@ -95,3 +103,34 @@ required:
>    - qcom,smem-state-names
> =20
>  additionalProperties: true
> +
> +examples:
> +  - |
> +    #include <dt-bindings/thermal/thermal.h>
> +    #include <dt-bindings/firmware/qcom,qmi-tmd.h>
> +
> +    remoteproc: remoteproc {
> +      #cooling-cells =3D <3>;
> +    };

[Severity: Low]
Will this new example fail dt_binding_check?

Looking at the required list for this schema document, properties like cloc=
ks,
clock-names, interrupts, interrupt-names, qcom,smem-states, and
qcom,smem-state-names are mandatory. Because they are omitted from this
remoteproc example node, schema validation will likely fail when the build
system validates the examples.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260703-qmi-tmd-v4=
-0-3882189c1f83@oss.qualcomm.com?part=3D2
