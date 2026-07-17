Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7036EE54B
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 20:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784319657; cv=none; b=jszs/uQlALeNiGq21L3/eq+lNUQtA0Kqj2qJurKP65zj8gCZoDLJi9eIvfTGGcqw/DApXMy342sM7kPCkNS3zsR4dxlLRsbYV2XuRUsSEU84KVZfgzSMD8t4SPpuDbIYBJ1e4ZsfAzh2o8pS7XH9vOI7OgXfQWCGqKSk23hocPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784319657; c=relaxed/simple;
	bh=4d2jKnnpuSsGeC7c+qWBZ90f6Wggfhcr3mDOinpQttI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UfUdGPWcJ+Mf/duC97aPMGD91/BPSjdsGISPYM5gkV2ZKHheY2PLTmiPDJtcsQPjnbTaAHaBZEjQ2d3+e7+BS27k3cCLIKrjffHHb8SGCicY3y1Ee7/0LVpyncMVnB3RaC0y5ayDKzcaXcOHniO/Ikf9wkV4VQyquXGNSMF5vJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Updy25S8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Updy25S8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D204B1F00A3A;
	Fri, 17 Jul 2026 20:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784319656;
	bh=+gLxicK8ku0aMFWUFX2ipcD1Th9VqYD6kwQmRjrDVYs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Updy25S8frBzCvdPFv613eF+qOCJh5ESHma45HCH3EHzcGY6+DYDdLjxjlcr66eq7
	 +SQFklapHhAiUD73Pqm2Jl5uF67PV5hpBSMWt3k1iY1YAdWagVUPk5ZLPqwPJ8kjAd
	 UiFZzsLuV25tIp9aUu/f3xCaeoqJFBYR8sX764JuIWe2sGWlEJt6r/0LfVbdB4k/ty
	 AniKFX8Tkvg8BBTO0wrscoqvSc1euBuHpuzNI08r1vfPW0IVnQ6GXEwOQh6d09U1gv
	 lD8fouPHt+bRO7hlEQkxLW+IUy6Y7bhyHpKQohwrJz/E4+C0UJk0w/IuuMWtz8zWe6
	 9NltrTWtWErtw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 1/2] dt-bindings: iio: health: add adi,max86150
Reply-To: sashiko-reviews@lists.linux.dev
To: "Md Shofiqul Islam" <shofiqtest@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260717201138.1078019-2-shofiqtest@gmail.com>
References: <20260717201138.1078019-1-shofiqtest@gmail.com>
 <20260717201138.1078019-2-shofiqtest@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 20:20:54 +0000
Message-Id: <20260717202055.D204B1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `interrupts` property is missing from the `required` list.
--

--- Patch [1]: [PATCH v10 1/2] dt-bindings: iio: health: add adi,max86150 -=
--
commit 6596564838aa000e36be829746bacd2e720d88d8
Author: Md Shofiqul Islam <shofiqtest@gmail.com>

dt-bindings: iio: health: add adi,max86150

This commit adds the Device Tree binding schema for the Analog Devices
MAX86150 integrated biosensor. It outlines the configuration for the
I2C device, including supply rails and a configurable interrupt for
the hardware FIFO.

> diff --git a/Documentation/devicetree/bindings/iio/health/adi,max86150.ya=
ml b/Documentation/devicetree/bindings/iio/health/adi,max86150.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/health/adi,max86150.yaml
[ ... ]
> +required:
> +  - compatible
> +  - reg
> +  - vdd-supply
> +  - avdd-supply
> +  - vref-supply
> +  - leds-supply

[Severity: Medium]
Should the interrupts property be included in this required list?

The commit message notes that the device raises an interrupt when the
hardware FIFO reaches its almost-full threshold. If the interrupts
property is omitted from the required list, device trees without it
will incorrectly pass schema validation, potentially leading to
runtime failures where the driver cannot receive interrupts to drain
the buffer.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717201138.1078=
019-1-shofiqtest@gmail.com?part=3D1
