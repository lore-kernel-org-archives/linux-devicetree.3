Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1373374726;
	Thu,  4 Jun 2026 19:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780602062; cv=none; b=iPCfHPy2tbjB3eXqe4Tww6UlYQHxXEwtss284FnCxbdpWXw4+8To3Hr2MMrz3Z5S3Wv0ZXFv6I7WrVNLrfKpgmG8ryt1h4btIwW40KtIY6UwM/WpgS256qmBKxzvBCTgv6tnqEoWE+vd8ECBVNgPcM0mSpYRP9uZKlrqhvovQfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780602062; c=relaxed/simple;
	bh=avF4zvV6bShcA/jrum1X9wooFD1tJq5s8UZJr7nIET0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kb6i5qQvk+/67TkHudUU00cHWu/S2+51LupXyyUbAKTEmsBPkeQpo49n2pComsWRHoCDsL8Zk75GBNlxDiU7dIandhuOuObtIJlb062damMRjMT92YBR88V5iPhjxAxfdkM/p+PDQ+odACgyESPHk2HDoxZERoEdopB4TLI1qkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lyhL/8sE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lyhL/8sE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 300431F00893;
	Thu,  4 Jun 2026 19:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780602061;
	bh=qs5k5qHJ1kjvv4+UJ0vLk5/id/HIGqin3qOQAuoTQv4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lyhL/8sEzpLNb3rrXHpXoE0lUrMq9J7Olckoo35pVN/PGV5yV0EMthatHnKRwyhm+
	 /L4JQDv8KocMILqR6JWgr5oF1c51x9ulUI+LuHhtUOYf2PNxnjOWXZ1XV8ru6RuEIg
	 dPMbTpOCRGz4kyhGK9O2PhsbDJK8D46e5n8phIg4fIGRIo77Kdz+UGZnSHd+QNwuOA
	 ALyNp21bpnBgeRu6iEUzxO+CTBuK7SX5wumbFEcRkNiGt0AI354TURrJbh8QCpm6IY
	 +qzMUCmhr4XucR9rPKaKN3ztUIKtHtYWVXPieea8qlxbK+hW/tGam8UbnENQfHZz90
	 ja3zn3DC+29wQ==
Date: Thu, 4 Jun 2026 14:41:00 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Wandun Chen <chenwandun1@gmail.com>
Cc: linux-kernel@vger.kernel.org, saravanak@kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4] of: reserved_mem: avoid post-init UAF when
 alloc_reserved_mem_array() fails
Message-ID: <178060205928.1082614.14477209562811042441.robh@kernel.org>
References: <20260604015332.3669384-1-chenwandun1@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604015332.3669384-1-chenwandun1@gmail.com>


On Thu, 04 Jun 2026 09:53:32 +0800, Wandun Chen wrote:
> From: Wandun Chen <chenwandun@lixiang.com>
> 
> The global pointer 'reserved_mem' continues to reference the
> reserved_mem_array which lives in __initdata if
> alloc_reserved_mem_array() fails. of_reserved_mem_lookup() is
> exported for post-init use, that would dereference freed memory
> and trigger a use-after-free.
> 
> So reset reserved_mem_count to 0 when alloc_reserved_mem_array()
> fails.
> 
> Fixes: 00c9a452a235 ("of: reserved_mem: Add code to dynamically allocate reserved_mem array")
> Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
> 
> ---
> v3 -> v4:
> 1. Move prints to 'fail' label.
> 2. Change return value from bool to int.
> ---
>  drivers/of/of_reserved_mem.c | 28 +++++++++++++++++++---------
>  1 file changed, 19 insertions(+), 9 deletions(-)
> 

Applied, thanks!

