Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7142D8773
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 04:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774411605; cv=none; b=ZPht8Rpxs3uKaR3qdX2QPUS0Zc9KpdqNfT7MAkaw7dXFcLAzq08QLotLwoNigs4VIJ25ojPJFaP/+w0nwRR2P6vbChFXc9Mqw4YKd2376lBm4kMDxmaRbCpk8TSsvHTTVg2oBMH+rfaqo8OwKfrO2LeJama/q8Xny8H21hlQkNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774411605; c=relaxed/simple;
	bh=WsAQHOogDYWxLt316VoEo1PFk4jzaM4l6YS9sGhWqrs=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=ccoLda0OfLV6ByoGywQnSgcDPJ70RYvm8RxqKl9wpGDEWjhC5kTYx2Ns3oLBHHZw5Z+O9YdSD/U4XYSSVFVHKxdzAb6M2Q3sliMO1jEqnDeFgYit/HWfhkSq2vS7QvA1Lp6xTEVZHmbbeLQoqmHiooq6N4LopuRUMcl5zPoaUAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=PfDGsqsk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="PfDGsqsk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A34CCC2BCB2;
	Wed, 25 Mar 2026 04:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1774411604;
	bh=WsAQHOogDYWxLt316VoEo1PFk4jzaM4l6YS9sGhWqrs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=PfDGsqskD39pLcCQXbYS2QFRFghCe4BEZzYtdfA21xdxwIIR4FoeGIkM064eBeWyY
	 D40CifymkJxTpCyEpPpnuoQ9OggtlKZBCPGL6v20TO0xKp5+AhL5+CF3V7RgF7HOF0
	 NjgD1tu5pmsYOFLipjeAqvBHsr0IFVKdBckI3XFk=
Date: Tue, 24 Mar 2026 21:06:44 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Coiby Xu <coxu@redhat.com>
Cc: kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 0/3] kdump: Enable LUKS-encrypted dump target support
 in ARM64 and PowerPC
Message-Id: <20260324210644.28f6cf77a26dfadcc4b642e7@linux-foundation.org>
In-Reply-To: <20260225060347.718905-1-coxu@redhat.com>
References: <20260225060347.718905-1-coxu@redhat.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 25 Feb 2026 14:03:43 +0800 Coiby Xu <coxu@redhat.com> wrote:

> CONFIG_CRASH_DM_CRYPT has been introduced to support LUKS-encrypted
> device dump target by addressing two challenges [1],
>  - Kdump kernel may not be able to decrypt the LUKS partition. For some
>    machines, a system administrator may not have a chance to enter the
>    password to decrypt the device in kdump initramfs after the 1st kernel
>    crashes
> 
>  - LUKS2 by default use the memory-hard Argon2 key derivation function
>    which is quite memory-consuming compared to the limited memory reserved
>    for kdump.
> 
> To also enable this feature for ARM64 and PowerPC, we need to add a
> device tree property dmcryptkeys [2] as similar to elfcorehdr to pass
> the memory address of the stored info of dm-crypt keys to the kdump
> kernel.

We don't have any ack/review tags for this series.  Could someone
please help out?

