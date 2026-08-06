Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38EAC239E60;
	Thu,  6 Aug 2026 18:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786039870; cv=none; b=n0/RUO8mZFpYxo5Gk13FbQZQkrTi/tgd+nHhHGyJcMZMouYUvtP/kdIuSjvtg0GYYtPzaVpxUS3BVJwFQFkajxkUYtNRiBoT2l5IfWoIexkLj3UkKzMdxCrGLGGBjXITsvI2waglmx0uLJDrTbe4AzF4GUCus7YkheKDFSUGjl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786039870; c=relaxed/simple;
	bh=UOmBDMJL46bArk/W2IyGU3WLUYrCQRx0RhDHHQRRM+8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=G9DQZrkNEo6zYzFUdygfSqf4GzHPgKorkfaWSRE34zZ/vmfCk2hQ4341PezR+2eKUovjRnaV+fdBeMvMpmbfQ5G5ZaKzRSzprlIcVunTH9Uw0+8YkR+svTuI1GOV+nwHRq0QBjch9THXS9Q0UobbZHR4JzF0qX9bViFUi4PuJL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=enYE6clm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="enYE6clm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEFFE1F000E9;
	Thu,  6 Aug 2026 18:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786039868;
	bh=0T0nm59oEOzhQ7dZZBbQ7PwPF0an5VEFwwAuzNi0ip4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=enYE6clmiaUpvvaQM+VLpeXDgO8G0Nbintt3yoWk3/YYzIfBnbjwYjT0V0Nn85JS4
	 AnkZcc9Ws+sLYtZSQSSJr4NIWETT5//xBNIVjIERYPPfT65QWAP5L990tzsGNvlibo
	 oB23613SXvZPrw4+zLSwaMrsQ2OZDJI5UBS2D3hRn033D+oUfmO0I3jSF8vB4HGrcK
	 6R2e9iqPEs/JHZMb7Lp2ThXvBokvL3TP2s0/j9fNFK/L3PVL7wrYp3RSvHcPHur580
	 J8FyMtBI5DoR1WqMZnBHm5oQJZaXJd8Ll9nHQzyDRQLlU32lZxBGcJ8O+WpmWWtpHE
	 B/VpV14u4Bm1w==
Date: Thu, 6 Aug 2026 12:11:07 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Guodong Xu <guodong@riscstar.com>
cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, 
    Samuel Holland <samuel.holland@sifive.com>, 
    Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
    Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Evan Green <evan@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>, 
    Conor Dooley <conor.dooley@microchip.com>, 
    Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley <conor@kernel.org>, 
    devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] riscv: cpufeature: Clarify ISA spec version for
 canonical order
In-Reply-To: <20260125-supm-ext-id-v2-3-1e3b9714c860@riscstar.com>
Message-ID: <fa0c32d5-292a-d502-bdda-dd876192d1cc@kernel.org>
References: <20260125-supm-ext-id-v2-0-1e3b9714c860@riscstar.com> <20260125-supm-ext-id-v2-3-1e3b9714c860@riscstar.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 25 Jan 2026, Guodong Xu wrote:

> Specify that chapter 27 refers to version 20191213 of the RISC-V ISA
> Unprivileged Architecture. The chapter numbering differs across
> specification versions - for example, in version 20250508, the ISA
> Extension Naming Conventions is chapter 36, not chapter 27.
> 
> Historical versions of the RISC-V specification can be found via Link [1].
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Link: https://riscv.org/specifications/ratified/ [1]
> Fixes: 99e2266f2460 ("RISC-V: clarify ISA string ordering rules in cpu.c")
> Signed-off-by: Guodong Xu <guodong@riscstar.com>

Thanks, queued for v7.3.


- Paul
