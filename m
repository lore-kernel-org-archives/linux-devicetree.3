Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2EF3AB26B;
	Mon, 20 Jul 2026 18:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784572009; cv=none; b=m6uzlmBd+2SbvSRbU7pgDPIQN5ZpAoyVsY8DgRLmLX+VJ8fuOG1TwzfgL/zNgEBl5U4TfZkRUCRdJznpbLHpLnlNrG16Tpn+vhl1f/976Wglu75J7/oOrtv4dX5++DfOGkgXix1b2b6Xh07UJz8Rr8lHVD8amK6R0g0wFXXDgqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784572009; c=relaxed/simple;
	bh=A/hSa1gXs37Wg1U2mCfgnwHVcFzaQlVpAkviGv7ToNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r7MmmkSgBGXvWaLo9+W/Ph4NdIorVbVIfzkghZIHhkhg5/UdkNTL5GBwiXfqfYK9zcbCRuDyC5+UZepvAGCoKI+Ll2OP45NNntAusAM8eEvP87p4L40nX53HuL4wtGKdHlneSlnuybJdHNGXTxl8b4f/EZuSZa/3q/ezmyO8sgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P8cxsSFS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P8cxsSFS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5A6F1F000E9;
	Mon, 20 Jul 2026 18:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784572008;
	bh=JvAqs91DJEvwXagvgEPqW9rmpcc1PnkHB87HW8o7xcc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P8cxsSFSB+YQ65O6MJocPWxlZSyJYm7wZ9mfrkj2FX4Mi4fDMhpDpDSyqBj25q7X7
	 RVmmonCyroL4fnhJd0B4rJtQlre+xew4qEYlQzQInm5k5bpQQFH2kY11iaIOmwrAPe
	 dhJnfsqMDbldB6x8LyTXVg6YW+hKXew1dVOV+liAhbzor53I/OQUT6CDZG7ZZNnv4O
	 /qX5v6hchGKUHk4ChZ69NYUY/3vvuAMhcZiAgLR/V/9GEgyMJ4feJCP+56YDXf8cgJ
	 xgSUWi7fWLTxwyk7x0w6Ydt90NLKF4YeZc+BnGZi/dtWPk4A2Y3w4hwZ/Swc/OOEyL
	 lGP+AeKq4Oq3g==
Date: Mon, 20 Jul 2026 11:26:46 -0700
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, MoeLeak <i@leak.moe>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: Re: [PATCH v2 3/5] riscv: dts: thead: lpi4a: sort nodes
Message-ID: <al5oZsY2X3MdG6vY@thelio>
References: <20260714074515.1959352-1-zhengxingda@iscas.ac.cn>
 <20260714074515.1959352-4-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714074515.1959352-4-zhengxingda@iscas.ac.cn>

On Tue, Jul 14, 2026 at 03:45:13PM +0800, Icenowy Zheng wrote:
> Although "D", "H" and "I" are earlier in the alphabet than "P", the DPU,
> HDMI and I2C1 nodes were added after PADCTRL nodes in the Lichee Pi 4A
> device tree; in addition the PADCTRL1 node is placed before the
> PADCTRL0 one.
> 
> Sort the nodes in this device tree.
> 
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> ---
>  .../boot/dts/thead/th1520-lichee-pi-4a.dts    | 72 +++++++++----------
>  1 file changed, 36 insertions(+), 36 deletions(-)

Reviewed-by: Drew Fustini <fustini@kernel.org>    

Thanks,
Drew
