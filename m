Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB132E7F25;
	Wed, 27 May 2026 13:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779887706; cv=none; b=n7sDEnExxtC6pGEEqWxr4peVLE3Z0ynasPO26c3KtjQFFeLBZylKBvIBwXHowo5AC2ARtfgW2C6kvuJu0PcyF/ae1ppiUYX0ZPrg6F5E++FEBLk359YYnT4C/b81FIrNp6iCcpGzzO1zGqiXYf3P11lnPejsc36Zen1mtxXkN+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779887706; c=relaxed/simple;
	bh=5HPx5yGA1gT1Kn4vlbwYbFu6UPGZaMnnq34d/YyNpuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cFZ6iMJBVh3J+K0Ci9wffM0RfP5FJnzyGy6nKJHC6Qla3v3Uu9G+gRICtLLxW/sAZ6Z/dqOK0bJyW4PLctleZYw7FV2JnMxCbqQZFUdg29oBP3Vj6IWkuCfaADJxMzeJMktbUrtFPwFhNEtDxZAuUJIDX5B9+HFdS/JN/DReRaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=goD/32DD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="goD/32DD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 875181F000E9;
	Wed, 27 May 2026 13:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779887705;
	bh=ilW4NWLTwkUELBbTK2kfF09GCPp5/Brn3weim2DuPZ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=goD/32DDMLghM/2baYE6XajjH5LAb18XTJ6xMemcOXPknUvrB5Y+4tDAQ7gsK7X/e
	 rnujQ2byma5BXpKqqCOLjcFNFwbl0ZCWwY8LcErl4j+81XxuGgRg+JfcNrf/H72oMN
	 sX6ggpY2+tBzDqc3Sk21Ll1YinKhIAnA70ntc1Y/73Ng7ggScB9SzLPdIPDJHkdUPU
	 7kam0f6GqdWcG2ljv4TGMzkkj+ScYnjgjcmnXuHBL8PynjZI1NI1eAuUgox68U+4MU
	 FJvQdvKGsfI3vs9Fv2vGZgD08YcKagzASMVkvxSStMQrRsHczU9hLkXDSqIgrql3qr
	 DncfdHKk0VCJA==
Date: Wed, 27 May 2026 15:14:58 +0200
From: Drew Fustini <fustini@kernel.org>
To: MoeLeak <i@leak.moe>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] riscv: dts: thead: Add TH1520 I2C1 controller
Message-ID: <ahbuUnil35K9uSEa@gen8>
References: <20260508-lichee-pi-4a-wifi-v2-0-7acf63559e62@leak.moe>
 <20260508-lichee-pi-4a-wifi-v2-1-7acf63559e62@leak.moe>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508-lichee-pi-4a-wifi-v2-1-7acf63559e62@leak.moe>

On Fri, May 08, 2026 at 07:44:13PM +0800, MoeLeak wrote:
> Describe the TH1520 I2C1 controller so boards can enable devices attached
> to that bus.
> 
> The controller is disabled by default because pinmuxing and connected
> peripherals are board-specific.
> 
> Signed-off-by: MoeLeak <i@leak.moe>
> ---
>  arch/riscv/boot/dts/thead/th1520.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Reviewed-by: Drew Fustini <fustini@kernel.org>
