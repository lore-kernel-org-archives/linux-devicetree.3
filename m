Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794869767;
	b=q0PiIj8bqtQa0DdzfbB52RA2xJFa25Fzd1u7YT93AwSqr8Mhc4Msdz8yeiYe/3BYcYgy
	 K6l3+8n4HkIUIZveVzrgt2IDPXtSsSxdd8GSTPYClaVCcYtAFJMSJV3tJxGmk+mKjPEf4
	 2dRFcYTL8WHi+K015CBWkZ2s++QWZnJRdJgQ1tYJ6baqBCdG/qPqlHzCuSf57fZqqAf/J
	 dzETLAlPOJyVSt0rsVnq9dMWL15l7lvCaPn/VPsVl+PY1lDTOBWdqEE8PZH2KZd1E39HF
	 UjplWZn5wDbMUplkPNb23NXTuf6NsJ80C34n8tXqCTy3ccBi0PG4AJ2glFL0FQWSCgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794869767;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=CdLf9z4Qx4cZyXQgg7UtU+1+YKPETkvFINGdM4Quv/c=;
	b=LzfZQJ5b0Jv7XuwAgJe/scXMDGyZA1UJPMZrSXYnjyfF5uxdEJ3qsTfTJJKWY+nMlx/p
	 +TsW6XsulFLVFybtMHiUs0Ne9ALwhRJjOMH0z9BrTwoG3AmlYZRbjMz8rK3qxtzeDVVTE
	 GjmIpjdnQKCKf4hoyy6dwtkw1MKZKdLYYdam88LRkAEjQaz57gn9BwWlqzKw1tltB+ZBv
	 G7Try75goBJQFbkdAQnE0sZROcyohzSRgwBdCrXtU33ppshTTJcEnhdDneVXdxujdpcuz
	 sEl5ewW+pEft9QEdBc5zych87IMq4YDZsr7oYQoLRobfed2iyYPQNXOyHmqJAk/Y2WA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U0kAgZ1E;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E19606A32F
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 22:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U0kAgZ1E
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C075E1F000C5;
	Mon, 16 Nov 2026 22:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794869767;
	bh=CdLf9z4Qx4cZyXQgg7UtU+1+YKPETkvFINGdM4Quv/c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U0kAgZ1EkWlQgyT3KHgylCM3Q/5ivaEkI7C1XYNDjTwbPxo/tY8N2S0Xi8CrHZ0mt
	 dmNqk0yULzObsXdqjdS7ZT79nZK+JstFsZltyf+w9YAxD22sKGmnJvfkVIullldsor
	 L8GoO4tbWWJ6FgOOCRd4gPlWk+NT2q+8CqhDjtawpDLr1nd5AZbvOuGtrWStCJQocR
	 ix1LtzFE2KgSz42LX7Pht2zGDqLoRi4wpw1j4nPuXFFK+rk/1VdmdUsDZVxxAosGVC
	 c6pwkQ1pENi0DPUFRaaJMYeEpnJfmhd1FQltI5XVJ6koHs3cwXscdnoAcX3btp6ues
	 jvrPcGptgVm8w==
Message-ID: <sashiko-outbox-217825@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 06/12] arm64: dts: qcom: sm6350-lena: Enable wifi
Reply-To: sashiko-reviews@lists.linux.dev
To: erebion <erebion@erebion.eu>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261116-pdx213-upstream-3-v5-6-7318a19806eb@erebion.eu>
References: <20261116-pdx213-upstream-3-v5-0-7318a19806eb@erebion.eu>
 <20261116-pdx213-upstream-3-v5-6-7318a19806eb@erebion.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 22:56:06 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] arm64: dts: qcom: Signed-off-by and Author use handle instead
  of real name
--

commit 69b3f383982805a38e5e9161e90e92403fe51a58
Author: erebion <erebion@erebion.eu>

> arm64: dts: qcom: sm6350-lena: Enable wifi
>
> Configure regulators and enable it for the Xperia 10 III
>
> Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: erebion <erebion@erebion.eu>

[Severity: High]
Could the Author header and Signed-off-by trailer be updated to use a
real human name instead of the handle "erebion"?

Documentation/process/submitting-patches.rst requires a real name for the
Developer's Certificate of Origin and does not allow pseudonyms or
handles.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-pdx213-ups=
tream-3-v5-0-7318a19806eb@erebion.eu?part=3D6
