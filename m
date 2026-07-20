Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C955231195C;
	Mon, 20 Jul 2026 18:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784571976; cv=none; b=J5Y5pGgtcokLExqBegP0JaCO5dHMAyHM26KtgNrwqFgBQnsVFku+hAI4lEmRcnj/Q/Ajat4HcZRhxd4qiEr/8WFQvWIZGm2I6wl6V8smxfQw1VQMz7xn/GD8d2D7QkbuLuCNlnXqZT9rXhPL8T5E7thjR8/RBlL4z3LHxlX/m0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784571976; c=relaxed/simple;
	bh=ywBFB6mN6j4QbWbByYFZ6PTjTGGkykjW58f99rnuzwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ecpKzbXdLqcSVfCY6dxdkusKr0sN44m8DeK4LhOOztyfVRiYraN7CvyCA+zgR5xH2in7RkxQEwCIhUFOwSHVqVikYNX3uzqX4gxlbpA8zrQ9y51pYsFNjtQraklrtj/2VxIE+oaSFUd/e/3NRM0iWqEt/QcybPLIdLKiCHPpcw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gyYenkxs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gyYenkxs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24BF81F000E9;
	Mon, 20 Jul 2026 18:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784571975;
	bh=wnqo/4rTXG2SoMC8bAmoJtVc4sH9QZg8Z163J5T51G8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gyYenkxs0YMaX1o6awP6T4n/gjgxYY0zczRem7hSppBYXnSuQmhw66i/e0WVf0Jf8
	 y67WEWN+a/yGirl36uWVUxu11nRSs3ob6iMtdbnrA9VgQPbAWbM2bbGDi26y9Biwjb
	 YcaXJUuXro+uU1dwzjZ6XD6TLVAoo1PLdnhAgfvuZqbmF74o4oxSQgGg4eWhQS3Lb3
	 YR69Sj1wui4NQfavVuf7iws7yl63dXsOLLXUYF+eTFbqaLJiejfQYfDtpbtYufdCth
	 ywlbAZPbRdem9fr4AnLut/dPIMPrf8dFfFNhcUn1/glNUufdOnM2ISsSltdMTIKp6r
	 ogiBrtt333D+g==
Date: Mon, 20 Jul 2026 11:26:13 -0700
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, MoeLeak <i@leak.moe>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Drew Fustini <dfustini@tenstorrent.com>
Subject: Re: [PATCH v2 2/5] riscv: dts: thead: Add TH1520 I2C nodes
Message-ID: <al5oRSbVEzj3M0gm@thelio>
References: <20260714074515.1959352-1-zhengxingda@iscas.ac.cn>
 <20260714074515.1959352-3-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714074515.1959352-3-zhengxingda@iscas.ac.cn>

On Tue, Jul 14, 2026 at 03:45:12PM +0800, Icenowy Zheng wrote:
> From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> 
> Add nodes for the remaining five I2C controllers on the T-Head TH1520
> RISCV SoC.
> 
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> Reviewed-by: Drew Fustini <dfustini@tenstorrent.com>
> [Icenowy: rebase and reword commit message to exclude I2C1]
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> ---
>  arch/riscv/boot/dts/thead/th1520.dtsi | 50 +++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)

Reviewed-by: Drew Fustini <fustini@kernel.org>

Thanks,
Drew
