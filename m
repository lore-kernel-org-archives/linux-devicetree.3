Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8AC3A4525;
	Sat,  4 Apr 2026 08:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775290214; cv=none; b=bNgTUgcWsZHoTk1PG1vN+Vs5k/jnmJzstNfx/wcAzOouDGHvRsvIfyQ9XnSPceEfhzig5qx0gkAdHnVKx0RS28dV5vO1lzA1rf5MZWWPKXqmqFRNmFldT349ch3m1egPYR59/NYcgwWLovQBAc2eIbPW2u3D1vy+Q0yZZ0ThQME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775290214; c=relaxed/simple;
	bh=0GCu5nkM0KBp8/WXOLonVDg5m0C5kdhGNfwrss8y85U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ly9dWnFv4/NOxVHVpK95cbPq/8ug7wG2lQX29iX6T16GCoyFUuh/myZTsGYTGhnyl9tMPbkyKTF638Q++qssh2dhGjKcRKUeFDOhRqvtoANqnhLx809zMfI6zxVoLbHEMMNRjJkureUoKDj12cZJ5Q3gWTcDOew+fq5cFu9VJD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tZ0FcM3f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tZ0FcM3f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB96AC19423;
	Sat,  4 Apr 2026 08:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775290214;
	bh=0GCu5nkM0KBp8/WXOLonVDg5m0C5kdhGNfwrss8y85U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tZ0FcM3fy6etdxKm2j9/6E0S+sOmVswILZRMTN0kE2Y6tv8SFCJnZ7HxLHQ7HwFnZ
	 GSYyGO8QDhkn+Xt4PTmqdeDi7Qhgib7KEoO/EKjm3biBCBWhlO8rhiuA2MZ2zdL7m0
	 7v7oZmnKzI0hoLCHKQ3P5W0YqKS5UKrR/CZi+X3pSOIqB5OTg8WfZoa0PK27Nw4TnS
	 jZymhR9dX1P7HX/B9RHNFo7DB9+hqva8ge1/9bTkiIm7VhOxiniA2vfz3bld+d4K6w
	 weg1O1sbRNiPztXCikFw5eIdEnJxpXqtbWIF1Fg7nhOeOxGnKbt8Q8QUGx7wSiKkLu
	 oxXGCKtgov5eQ==
Date: Sat, 4 Apr 2026 10:10:11 +0200
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
Subject: Re: [PATCH v5 3/5] dt-bindings: soc: sophgo: add sg2000 plic and
 clint documentation
Message-ID: <20260404-rustling-shapeless-ocelot-b2df71@quoll>
References: <20260403111516.379795-1-josh.milas@gmail.com>
 <20260403111516.379795-4-josh.milas@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260403111516.379795-4-josh.milas@gmail.com>

On Fri, Apr 03, 2026 at 07:15:14AM -0400, Joshua Milas wrote:
> Document the compatible strings for the sg2000 interrupt
> controller and timer.
> 
> Signed-off-by: Joshua Milas <josh.milas@gmail.com>
> ---
>  .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
>  Documentation/devicetree/bindings/timer/sifive,clint.yaml        | 1 +
>  2 files changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

