Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387761922FD
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 05:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790315920; cv=none; b=Fd5VD/ndkwG/jeN9dn/f2Cj3M5JW5YEak6JY5Bp4znJKjiYmxdRgszbC65goRtBBWUnde7v7IoHdOgzIfolDCKr3/PtdJF5O+5f9XHeF79F1duDwFlloSLO/K37WdA44W2irp33SnVWscwLlxIwg8pn9scp+WbGXKflLLo44QtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790315920; c=relaxed/simple;
	bh=QkZthheQWFuyDksv3i/E5BcFnvZi/ALTIMvUYcEovUM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VE4nSjuX7RsSALVNkiqcBmBY9ESY4hrleNkShsn+rk1ytAjlzjfdtveqNjv6H0JUhPGZ4V1iPaGjNKoc6tf5U6aBr12VKZAnuemfirheuk9OhgihK3mBJDCdrXr2Jrurkq/N7AUfqAeKZvf6sksr9goFN2dRUqVHDhewi4HDyPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AcI6+tBS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AcI6+tBS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEBB61F000FF;
	Fri, 25 Sep 2026 05:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790315918;
	bh=LonwPXDbLWkLdOKb6x946d2eu5T8Ut26QLEtIaIBYSE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AcI6+tBSCYGU7UBEp/pTMvOkfGNspFIMlkwqbfojl+GMy1cwxgLFQpnGnMcVQXF/P
	 gSem5BJD3H/I+pfQj/+PfLW5YMNlnTgsF82A/1nnwFpz1pIb2meZ48wtxtK9R0zJIh
	 wBqjHPwMYT4Eoi20mHXxEdiNtXMJSTfKdSfdhL3qNnB/4gS4el0YNRoyyOEPQTV+1h
	 MrHKaV2DfF7ajASCQk7P/hw6wzbssLCYm7PS8ZuuvY+BnOzheLjGzY6RJBZ+N5opGW
	 Wgz+P0l38/xH6dGpf0D5z227SvdrTvRNSXuaiaaFmTVqlrwSTCwtB/S3eUW8u41rBR
	 FvxJ2GFXQoMlw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/3] dt-bindings: media: qcom,glymur-camss: Add
 Glymur CAMSS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nihal Kumar Gupta" <nihal.gupta@oss.qualcomm.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, devicetree@vger.kernel.org, linux-phy@lists.infradead.org, conor+dt@kernel.org, media-ci@linuxtv.org, robh@kernel.org
In-Reply-To: <20260925-glymur_camss-v4-2-d7c2983d6d7b@oss.qualcomm.com>
References: <20260925-glymur_camss-v4-0-d7c2983d6d7b@oss.qualcomm.com>
 <20260925-glymur_camss-v4-2-d7c2983d6d7b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Sep 2026 05:58:37 +0000
Message-Id: <20260925055837.EEBB61F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: validation failure due to missing phy@ child nodes =
and cell properties
--

commit 2c100de42ea1bb8c2267da0512e16ed0f56b5334
Author: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

dt-bindings: media: qcom,glymur-camss: Add Glymur CAMSS

This commit introduces the device tree binding for the Qualcomm Glymur Came=
ra
Subsystem (CAMSS). It specifies the required resources and ports. The commit
message indicates that Glymur uses the new PHY API via standalone phy@ child
nodes.

> diff --git a/Documentation/devicetree/bindings/media/qcom,glymur-camss.ya=
ml b/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml
> new file mode 100644
> index 0000000000000..a0b77edc21231
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml
[ ... ]
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - interrupt-names
> +  - interconnects
> +  - interconnect-names
> +  - iommus
> +  - power-domains
> +  - power-domain-names
> +  - ports
> +
> +additionalProperties: false

[Severity: Medium]
The commit message mentions that Glymur uses the new PHY API via standalone
phy@ child nodes. Since additionalProperties is set to false here, and there
are no definitions for phy@ child nodes or their associated properties like
#address-cells, #size-cells, or ranges, will this cause dt-validate to reje=
ct
device trees that implement these child nodes?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925-glymur_cam=
ss-v4-0-d7c2983d6d7b@oss.qualcomm.com?part=3D2
