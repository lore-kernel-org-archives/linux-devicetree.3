Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71C9201278;
	Tue, 14 Apr 2026 19:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776194814; cv=none; b=nJnrkTf+qofhGKGsEqYDCMI+UTZEgm/hUHdlr8iwwR9deIOuHbSYclrW3/PHV9vIZ0BQStx2eSiljaYitKfqk2XxmG0pYy30tndnr0tjMvifB9Bvfq5XvZCT3H6o6uMvQ8gQ4cNMydEcs5jAUJvCHcOsxS0ppbLd2aAKdx7iLTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776194814; c=relaxed/simple;
	bh=xDMl6zz9KmZWieoCxAWoy41U48y6ZdafVRM7bPapbgM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UWLjF9ey6q9xzksidqHpW6cz4t5QUhFTv+ZrOxcH20lkuoFdu8UWOHicSczmgCuTK8Y4ICx5IU4h4ZFdQYWv+2YAjsbq+ujhsDE5ptiSj2OZy6QkvRWnXstukLutRFJFzH/BN57dDD9xR0IMBRQch1gdzzhyHMOM2ifhwj1x2qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BtihFz/g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BtihFz/g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C459C19425;
	Tue, 14 Apr 2026 19:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776194814;
	bh=xDMl6zz9KmZWieoCxAWoy41U48y6ZdafVRM7bPapbgM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BtihFz/gTv/tqpMJtHPEew9hHyB0y3ULsOwB9FT8CtkeOfT6FJtk6JC30gDgNf6TG
	 Lo77dI214fXu5wt4ub2s7eNXU9J3XtmW4QCiUjqUICv/I0huK/cs4kRx2AAmZF+9/+
	 LPqyPwa2PVFQYLdIdWaSwnpzVA0XTykAa1qPk+Hd62AJ+VtfqXYgu37AEE9101DM0S
	 awZtYQS3wmauLSgusCaNi69ZBlpu0Ag6yoLLMp6UgHvDxOvrdp9B8x4Tl49B2fUrM3
	 x0mb50JyV6DJTBfhXcKdq7RRo6GKoYgS2xDykO/mMWW9G1GNp2RQNbgIUTo0x0bcLu
	 xG0Fqxjg2pYvQ==
Date: Tue, 14 Apr 2026 12:26:52 -0700
From: Drew Fustini <fustini@kernel.org>
To: Joerg Roedel <joro@8bytes.org>
Cc: Joel Stanley <joel@jms.id.au>, Nicholas Piggin <npiggin@gmail.com>,
	devicetree@vger.kernel.org, Tomasz Jeznach <tjeznach@rivosinc.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Michael Ellerman <mpe@oss.tenstorrent.com>
Subject: Re: [RFC PATCH 1/1] dt-bindings: iommu: riscv: Add bindings for
 Tenstorrent RISC-V IOMMU
Message-ID: <ad6U/PmOawRXCClF@x1>
References: <20260310003850.3837030-1-npiggin@gmail.com>
 <CACPK8Xc=imZXXPp-CYY39=Ww4oVDdXPS5My_R1qODzGhOD2qnw@mail.gmail.com>
 <ac7TByN3oQGSUpyq@x1>
 <5tr5kacx27a4g4udx43vemqvwhr4iaflacdrkz3d5tnd6vcldo@s6l34e2xyg5k>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5tr5kacx27a4g4udx43vemqvwhr4iaflacdrkz3d5tnd6vcldo@s6l34e2xyg5k>

On Mon, Apr 13, 2026 at 01:37:32PM +0200, Joerg Roedel wrote:
> On Thu, Apr 02, 2026 at 01:35:19PM -0700, Drew Fustini wrote:
> > I think it would go through Joerg's iommu tree, but I could if Joerg can
> > an Ack.
> 
> I do not have the original patch in my inbox, but looking at it via lore it
> lgtm.
> 
> Acked-by: Joerg Roedel <joerg.roedel@amd.com>

Is it okay for me to take it through tenstorrent-dt-for-next or would
you like to take it through iommu tree?

Thanks,
Drew
