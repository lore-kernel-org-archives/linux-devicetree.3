Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2FBF2E175F
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 16:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779035993; cv=none; b=j6GMe8QcDHTOQvsud8XwcxvwWOKZEu+7XjENVGKPG33mNJezy6/TdeOsjtJnoOMKbTaHO1tFpJQjRX+Y4c8KhHm/PD8TG/AfGEkD2MCQ64/iDMOOfgWuplQ/ZEQoqKK67V8y5aXcDJR7jhgZeRSEC7t0ONph3d+wKzlTKNvkeNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779035993; c=relaxed/simple;
	bh=9tRIixbkFSn1SCE015JnUoVGw9ogawPdXQSxiWWZs9c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XeNpjf18+LRuvVGaFfPVXiVszYOQvnzfsN+bUA+lS60SeNXTYhk0z0NnEgsX0UvM3fbjJJaRvaZmCUBPxi48QJDDHtuXfGfETEzgnTtO/nNYui8j9i1XXuZOkrtL65YZzWPyZpgFSOFW+xiW6Kn1Xyo4AEvJ5QgvFCvH/ySd9EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WuTIdOqZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WuTIdOqZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 335D6C2BCB0;
	Sun, 17 May 2026 16:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779035992;
	bh=9tRIixbkFSn1SCE015JnUoVGw9ogawPdXQSxiWWZs9c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=WuTIdOqZADVrd1yUznzX7HiiKEJweEGPiXiAOpsk2eTIvkO7i5KMzHvkic1hGBMo5
	 QbYR+Souof3YTWi+s31uwAxaFIpYucNr+RwrlHzxuj6ugtQxBZbmkWuHKX/NZxtl4n
	 Iv/I+77d+myz6s6Cn2FdcPQPvUJr7UEFNsmuvqP9B8tBHFZOhVvbqqycQTj7/1RbvP
	 ISTygC27W6Y3jKUaXlYQKAwVT8OIOxGXgppVeJBA1bAUZio1GEnmT/IVp/nXvBVV/T
	 m+OZol7XLqIV9FSJ6oB00ToFpWIr7zdc5D5x6muKz76NA2VLP+d9p0dqbmMyt2l9yp
	 +3XRX5cwtUboA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: r8a78000: Describe all reserved
 memory
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marek.vasut+renesas@mailbox.org>
Cc: wsa+renesas@sang-engineering.com, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260517163212.18016-1-marek.vasut+renesas@mailbox.org>
References: <20260517163212.18016-1-marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 17 May 2026 16:39:51 +0000
Message-Id: <20260517163952.335D6C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The closing brace of the `reserved-memory` node is incorrectly inde=
nted with spaces instead of a tab.
--

commit d018e096715e5182300385286aab8a1caa68c6f1
Author: Marek Vasut <marek.vasut+renesas@mailbox.org>

arm64: dts: renesas: r8a78000: Describe all reserved memory

This commit updates the device tree to fully describe all available DRAM on
the r8a78000 platform. It adds a reserved-memory node to block off regions
used by firmware, IPL parameters, TFA BL31, and OPTEE-OS.

> diff --git a/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts b/arch/arm=
64/boot/dts/renesas/r8a78000-ironhide.dts
> index a721734fbd5d0..99f4cfb53e0f8 100644
> --- a/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
[ ... ]
> @@ -65,6 +64,36 @@ memory@1e00000000 {
[ ... ]
> +		/* TEE TZ DRAM. */
> +		tee@8c400000 {
> +			reg =3D <0x0 0x8c400000 0x0 0x02000000>;
> +			no-map;
> +		};
> +        };

This isn't a bug, but does the closing brace of the reserved-memory node
use spaces instead of a tab for indentation?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260517163212.1801=
6-1-marek.vasut+renesas@mailbox.org?part=3D1
