Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B745837BE71;
	Sun, 31 May 2026 12:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780230581; cv=none; b=O0RKuurU5ixVxc+5BQL0FBbf1CG2FfiQ8v6R2wKxfxnunuwfR2z5SGPxYy5ZFKpSk6C4C2rzvmZlahSU8lYvUzadIDVWDM/BlWjemqVoPTHUC1nE4B19Fm6dMKeuSumjDRp99vXASrXB4KebJzyT/PRD+hRH8PI26uHkktnDnEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780230581; c=relaxed/simple;
	bh=a/EZy/EAIjz8MQ77wYKTfcyqJqe3TgKSPTz8v+yi9Mc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gzUTZNcITzIWc/jhHzwCe4VtCiuUQUrHAI90HeJGu6k9Wm6SCvyIye1EEiAKdg+VwsTG+pikNPXKm+yvQujbCzBqLERffcViaEAZNZVmILJFsAyKIc5dmtxbIT8dP1+iopAJzrj8pJpwpAuFc7l82ldGZzbmaG+C2P6bcU80bbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fU6kBq5b; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fU6kBq5b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 047481F00893;
	Sun, 31 May 2026 12:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780230580;
	bh=WXRV6sAi8yFeVuYsq2n7V6bVtDWoC4H6LM4N5Tr7BVs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fU6kBq5bqqZvg6CC6U2Kl1RsEoRniC2eGyFBDFjA2NP/hcRt60kHh2aPspavgAC/1
	 wrzgEd0ey5lj9aG1p56HaVNimRn4EXrOS1M7x4oPB4mCkOaJNw0jMFlr/CjLcrgqfC
	 2G9DVQ1g3wWUW1SKK/ImX/X9jHyEaHEDcYSa2zsh5Q8ElL0fNeuA0cfJ+drnFzHeZ1
	 xyIcsHjn5YvVKGdCjPto49rxhEaUPWRAafVi7BYkQlnFsitkcmY2JvsXIW7cEZrS51
	 aBgC+m3d5SUJha8qqQWb+QbzQ5bcogTVWA6e6nrq6fZyYQ5z3Ya7mLHlzfLBq+2asi
	 vbdgIHY+hkHvA==
Date: Sun, 31 May 2026 14:29:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Joshua Milas <josh.milas@gmail.com>
Cc: tglx@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, pjw@kernel.org, samuel.holland@sifive.com, 
	unicorn_wang@outlook.com, inochiama@gmail.com, daniel.lezcano@linaro.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	liujingqi@lanxincomputing.com, alexander.sverdlin@gmail.com, rabenda.cn@gmail.com, 
	dlan@kernel.org, chao.wei@sophgo.com, anup@brainfault.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	sophgo@lists.linux.dev, hanguidong02@gmail.com, michael.opdenacker@rootcommit.com
Subject: Re: [PATCH v5 RESEND 1/5] dt-bindings: soc: sophgo: add Milk-V Duo S
 board compatibles
Message-ID: <20260531-beautiful-furious-raptor-e9ef21@quoll>
References: <20260530173347.33533-1-josh.milas@gmail.com>
 <20260530173347.33533-2-josh.milas@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260530173347.33533-2-josh.milas@gmail.com>

On Sat, May 30, 2026 at 01:33:43PM -0400, Joshua Milas wrote:
> Document the compatible strings for the Milk-V Duo S board [1]
> which uses the SOPHGO SG2000 SoC.
> 
> Link: https://milkv.io/duo-s [1]
> 
> Signed-off-by: Joshua Milas <josh.milas@gmail.com>
> ---
>  Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml | 4 ++++
>  1 file changed, 4 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

