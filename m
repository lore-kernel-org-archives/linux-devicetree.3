Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69FB32ED5C
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 16:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778775577; cv=none; b=lLqChDUiUVUqI/6ZHBRGYjmjZNt5UuN2iuqNuzRKiFEvy6pKvuijvsauQZy1Vm1OhWSWEoLSONgqagJxZqDHNfRWIFQRVrn58Z8yc/fViOQX3A2NWzgF2sAWhwrr+KFGFqKGuCIKD+jwnl+nq5QvN+WXIsEiOSE0V6ctJ9SPNG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778775577; c=relaxed/simple;
	bh=F3fZ4RtYu05zH4762U4rLbPeX1isJWjb4hv1k/qBf+o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DRvSc9MRu2yNTL8cv/89eFI0eL1DF63yv4r79rqxxmDxVqYY2lNuSGAu3Jjtamlr4S0u0uZIeMhRqwI06Asyq+eo64IKbZy54vFbEv/ptP4pJrCCBlVfTryQunfthIniN2FrmqQp/kcNZZ64zQ1xCxMeRXJQzAnIdDXyBnx6TRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EVkRzzKh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EVkRzzKh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C9B5C2BCB3;
	Thu, 14 May 2026 16:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778775577;
	bh=F3fZ4RtYu05zH4762U4rLbPeX1isJWjb4hv1k/qBf+o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=EVkRzzKhBAuR90NEVEUd/xyWROTDmI9dPatVJPrDkA2MHcMee8HoccSk1iThjPODN
	 AaXHRi8aLP35M8ytRcCeeUwrFfHIy2Wdpydur6kMjwDzGFHIjENMU1WvmUavyIpoVf
	 ilrcQhzG6t8wr7WAPlcpNCmTjD9LbMMdY9Q7r8lEI74XK1BZPrTnfhewmYRU6Gw2td
	 EHZBnGj61EX8r6TL8RSZW61uabT0jg9HPWxoe3AFi6+ct0jkzr8suNQyWaVsNe2qos
	 AQslSEdbdT3Rv3djervSTUm8s5TQEO6FYtouWOJ7XFAXZ1x7df/ZIbQFv0Ka2coKy4
	 iwfxzqEhjxUAA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: soc: qcom: saw2: Rename MSM8960 SAW2
 compatible to v1.1
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rudraksha Gupta via B4 Relay" <devnull+guptarud.gmail.com@kernel.org>
Cc: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260514-expressatt_cpufreq-v1-1-487fd2d78859@gmail.com>
References: <20260514-expressatt_cpufreq-v1-1-487fd2d78859@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 16:19:36 +0000
Message-Id: <20260514161937.2C9B5C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] ABI breakage and broken bisectability: The patch removes the exi=
sting 'qcom,msm8960-saw2-cpu' compatible string from the YAML binding witho=
ut retaining it.
--

commit 5f6f37c2425f00a08baf814227401f4026243b11
Author: Rudraksha Gupta <guptarud@gmail.com>

dt-bindings: soc: qcom: saw2: Rename MSM8960 SAW2 compatible to v1.1

This commit renames the qcom,msm8960-saw2-cpu compatible string to
qcom,msm8960-saw2-v1.1-cpu in the SAW2 bindings. The change aligns the
MSM8960 naming convention with other SAW2 compatibles that explicitly
include their hardware version.

> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,saw2.yaml b/=
Documentation/devicetree/bindings/soc/qcom/qcom,saw2.yaml
> index c2f1f5946cfaa..ff0e2697a7c60 100644
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,saw2.yaml
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,saw2.yaml
> @@ -37,7 +37,7 @@ properties:
>            - qcom,msm8939-saw2-v3.0-cpu
>            - qcom,msm8226-saw2-v2.1-cpu
>            - qcom,msm8226-saw2-v2.1-l2
> -          - qcom,msm8960-saw2-cpu
> +          - qcom,msm8960-saw2-v1.1-cpu

Will removing the older compatible string break backward compatibility for
existing device tree blobs that rely on it? Standard practice is usually
to retain the old string, sometimes marked as deprecated, to preserve the
binding ABI.

Also, since the in-tree device tree files still use the old string until
they are updated in a later commit in the series, does this removal cause
make dtbs_check to fail at this exact commit, breaking bisectability?

>            - qcom,msm8974-saw2-v2.1-cpu
>            - qcom,msm8974-saw2-v2.1-l2
>            - qcom,msm8976-gold-saw2-v2.3-l2

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514-expressatt=
_cpufreq-v1-0-487fd2d78859@gmail.com?part=3D1
