Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F233AB26B;
	Mon, 20 Jul 2026 18:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784572088; cv=none; b=BcLxsQip9NLBdGM7AiSrZD2qPtqM6LB6HcsTowQndutSmtWAM8rlfUaO0aa4lYmuZdQMhKmIOLVYG0wiEYRb5IdDVbOf4jUUpBlluUkjDR0H/IiyjgvFPeObkd2CjYT8ifA7tfsW9QyLPj2lybH5dnmueKiTSbtC4QIj6pidiw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784572088; c=relaxed/simple;
	bh=OESs1DrdzMPxVFp4quPW0j0uLennT7tBppQLocxcJyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dYfDsd5AMSJX2drih/mfMlg8E/Eg9/zNHHnG7TxHY2Ls/u/qX28DGduTLQpAv8vb2B06I4gRtoEgOLOw1I5Ygq7rZeaEadZ0RJejVHHTeY45fkjZtRm85/1z8XHP+/0mK/Sxr5mhj03beGLe58TCcAbw2g4tjpuPMy1ghVfTSHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K2PUpeg+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K2PUpeg+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59B461F000E9;
	Mon, 20 Jul 2026 18:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784572087;
	bh=E1Bw+f7P8Wqe2Bs7RjLjX0TAj6q3KMw+2P3PCqWNcGM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K2PUpeg+NHxzQGX57N1OKRqJ4aRNPrmN0R0qHmApv9KmNXNL9Z422klZfMmwoHcjc
	 GlpBvomk3C9WFI4ywZun/exCl6NYqpZzuqKjnjgyuUkwQBg0NKitt0LN6K3H/Ib+QY
	 QKuFUuRrEV6rer1nsduCVT96u5tckI+kyAKN8PpbW4FUskhiR9hOc1z46A4gKdxgOx
	 e6uk4WmeSPJOXlqZ6AQaTyKOId+ThB+uNXSbQTReHaSJeemhN/HZ2GOco6zHYaAcOc
	 iBsXHT0Fn3THpK6Nd8pl+gG97jfDDM8vAJNrHYgKhXogH8DIH2rMY60d+hXngLdEBo
	 dNXd7HyNr1QVQ==
Date: Mon, 20 Jul 2026 11:28:05 -0700
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
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: Re: [PATCH v2 5/5] riscv: dts: thead: Add remaining Lichee Pi 4A IO
 expansions
Message-ID: <al5otZoK9h1OQt--@thelio>
References: <20260714074515.1959352-1-zhengxingda@iscas.ac.cn>
 <20260714074515.1959352-6-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714074515.1959352-6-zhengxingda@iscas.ac.cn>

On Tue, Jul 14, 2026 at 03:45:15PM +0800, Icenowy Zheng wrote:
> From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> 
> Lichee Pi 4A has 3 I2C IO expansion chips onboard, connected to the
> I2C0/1/3 busses. The I2C1 one is already added to the device tree, but
> the I2C0/3 ones are not yet added.
> 
> Add device tree nodes for them.
> 
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> [Icenowy: added commit description, enable SoC pull-up, remove I2C1 and
>  aliases]
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> ---
>  .../boot/dts/thead/th1520-lichee-pi-4a.dts    | 63 +++++++++++++++++++
>  1 file changed, 63 insertions(+)

Reviewed-by: Drew Fustini <fustini@kernel.org>    

Thanks,
Drew
