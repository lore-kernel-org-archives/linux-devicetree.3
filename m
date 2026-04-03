Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADFA32D94BA;
	Fri,  3 Apr 2026 06:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775197880; cv=none; b=UJwhLkVVVAGHrwyNyNM8LzaQAR4Kr71+NcVF3H7RGR7MGT4+15U+qtp4oKQChAG/M5nGDdZIczzK5IPcX+ZjNIlsTurDFN4ICFP6Pep+Fje2+hLalTVUtAZ2NOxwzCjS+qPCr7DgtW2aCgj1tsZNfI8ObRXr35QUMAqw2DWUdkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775197880; c=relaxed/simple;
	bh=z5smXNJSDIZs7k9QwbEBHb9yac6jAucmud+T/8hzBOA=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=lInQAt584bQSe/nhYGNStHYydEqFvOO2MF4FQlOi+kPxoCqAbbbPfhgv5OnIR+Gj5oa2c32CidlKaYL1yoew/L+YZcERroD0jU/oe7WV4knx3uQUDw5NXLyLiXWZwtcUIGed/K6wZ+YgfmvD3pqNyF/Wl+gC8LuPqmfsRw8ZM1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=wNbZTh+h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="wNbZTh+h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55355C4CEF7;
	Fri,  3 Apr 2026 06:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1775197880;
	bh=z5smXNJSDIZs7k9QwbEBHb9yac6jAucmud+T/8hzBOA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=wNbZTh+hRi8x6NmTtJ9Tt4BdER0gAGV8bnI1wlICJAzLhthK02O3Ak1qqpppmO6w9
	 ItAmoOlKwr1JFtSe+6AIaOuNsgXneiQAudP0xVDh/lwc/285dhdd9UmXc38A2RPQOU
	 8DQuoRvBiRsIHfOUw0fy82VH7uKPithrZYXkG7pc=
Date: Thu, 2 Apr 2026 23:31:18 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: Coiby Xu <coxu@redhat.com>, kexec@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 devicetree@vger.kernel.org, Arnaud Lefebvre
 <arnaud.lefebvre@clever-cloud.com>, Baoquan he <bhe@redhat.com>, Dave Young
 <dyoung@redhat.com>, Kairui Song <ryncsn@gmail.com>, Pingfan Liu
 <kernelfans@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring
 <robh@kernel.org>, Thomas Staudt <tstaudt@de.ibm.com>, Will Deacon
 <will@kernel.org>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas
 Piggin <npiggin@gmail.com>, Saravana Kannan <saravanak@kernel.org>, open
 list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 3/3] arm64,ppc64le/kdump: pass dm-crypt keys to kdump
 kernel
Message-Id: <20260402233118.08ea88a6836bd10f01031cce@linux-foundation.org>
In-Reply-To: <51761fcf-955f-45e2-97a5-2b49d8e79d04@linux.ibm.com>
References: <20260225060347.718905-1-coxu@redhat.com>
	<20260225060347.718905-4-coxu@redhat.com>
	<51761fcf-955f-45e2-97a5-2b49d8e79d04@linux.ibm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, 2 Apr 2026 16:24:14 +0530 Sourabh Jain <sourabhjain@linux.ibm.com> =
wrote:

> But while reading crash_load_dm_crypt_keys() I noticed a possibility of a
> double free at the address pointed by `keys_header`:
>=20
> In crash_load_dm_crypt_keys()/crash_dump_dm_crypt.c
>  =A0 =A0 snip...
>=20
>  =A0 =A0 kbuf.buffer =3D keys_header;
>=20
>  =A0 =A0 snip....
>=20
>  =A0 =A0 r =3D kexec_add_buffer(&kbuf);
>  =A0 =A0 if (r) {
>  =A0 =A0 =A0 =A0 pr_err("Failed to call kexec_add_buffer, ret=3D%d\n", r);
>  =A0 =A0 =A0 =A0 kvfree((void *)kbuf.buffer); =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 <---=20
> First Free
>  =A0 =A0 =A0 =A0 return r;
>  =A0 =A0 }
>=20
> Since `keys_header` is not reset, the next call to=A0build_keys_header()
> will cause a double free at `keys_header`.
>=20
> static int build_keys_header(void)
> {
>=20
>  =A0 =A0 snip...
>=20
>  =A0 =A0 if (keys_header !=3D NULL)
>  =A0 =A0 =A0 =A0 kvfree(keys_header);
>=20
>  =A0 =A0 snip...
> }
>=20
> What do you think?

It looks that way to me.
