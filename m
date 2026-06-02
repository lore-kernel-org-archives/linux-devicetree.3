Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4193264EB
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 16:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780417204; cv=pass; b=ocnOYFJiACPjp0P4RmzVSlsCym5905WmJtjb06IDCa8Bo+avHRtK2yNG1nvtIi9AA6/z8mfZMssZXydJ5QTva9Giy3Gg5WKsCwShWhD1FDhhQ3QXC51W5ZT81tbjK0uDKdBqeNDRVtqg6YiZtsnLdxzsATpr3ruYRMfBTIzblHY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780417204; c=relaxed/simple;
	bh=ydH4/QV/1+IbTAhdeYNLwa8ygu64uWvWhoVur27Jo/0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PfchiQnvfiJlKdJASw4wVIr7r8WTWZHviX5XOsI1poROm37ogsKo7N1aX1vWSLjFmvKFdzOowDLL4w9h3ffvy+ASJWmGvBRIQ2iBxtuLFEYLnUwLBOtO2RB757b3yutC7ROA3x4hKylC/pBF6aXLtxJFGhoOkShximH36TREgfY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b=c/VE6Dfq; arc=pass smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b="c/VE6Dfq"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-660390a8999so6360155d50.3
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 09:20:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780417202; cv=none;
        d=google.com; s=arc-20240605;
        b=Sr73GQvh75E/Bk1aXtwNVlWh09qzpbHW0NVDBBQVDaU9LTT6gUVgF6eyLkYGm/BxJ0
         b2XnFV6Z92N+/lW6CCghlamjIa/XmLtA3dKWlrPXndOkEjpWBIZD79ww3XbycM/3PL+i
         RGhQCCXNkSpcwCdnlUbT1rh9lRXAkyywNhftCujaqsYZcPMGVdVIzijlpDDjn1RMGN3E
         klqWBlgW2veqqfcsTfgOmKaw7a/8XThfcmtBOZapz6Xpi/6HTGHKNrpAUXVafJKZ0Mih
         YRyb6fNCxew07TfWyJFP0nrQ3/ITasPZ4R2oBOLZ55euQSzroUu0ZR8KwYBaJKVqEWGe
         XU3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qYFMKnZkfNnmRXGo0xQ4eN2VdP8xCoBWS52ZR4ARnJo=;
        fh=85rE/QfNca1Hsb1XODvXRZHgHhtTxKtS9E2j5u24eDM=;
        b=HredHnHQDaZ5EPQMF0E0fByQetX0OmtRlV3zRUuvTStv22K8SdeZk9zU7dykWSDymn
         PV92/QLP3/hCkcmGDP++l5byNS43jI5nZy5U5UQoQ7CzRaIudMmHcbcpysEe1i+zSgMm
         GSL0d2yGY/JD1Usj/5kR6jwzKYuEIGnnRuVFaGHVxTctNJlRB6dVj4z2zMiUBlyKN4lj
         JBk17Xum+bgWJCadeC4UWt+lobJyjywKX/NTaSl26DshojeUiBUItLtVPQsKSKJ9Hy5n
         0k7mvhHroo5S3ZVhQIci5TYi6Ksc9tht8i4m33HoqQm7g3HdGjaEs0wWmBqe2UJmfFvY
         o7NQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1780417202; x=1781022002; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qYFMKnZkfNnmRXGo0xQ4eN2VdP8xCoBWS52ZR4ARnJo=;
        b=c/VE6DfqYn4w+HWhelXW5cH3cKDMBvmmPkVsAt1mRpbe/kx0fpJhdpax/nVFBksa/q
         kWQOQ3TaZTqarShkrrTJKHivLOSIJRlP5ChFQxVgYC5hqdi3Kwy6ThI+1cQiLvakbV5r
         EN2CKw4yqeAbNirJuDwnGr7HREmnRWw1TVqQR6cWIWIwpsKjofo4YQYGqkv4kX6L0rF1
         3FeGiu6Xyw+dqrRgyICL5NayCKUBiSvyHv3Mf2Vtla8HNIKYLEAD6fI0S3XIcPnRNC6e
         U9PgeKeKvgpuY8awo8S5+XjMCS2FR7ESbtR2gvFFaxrelzBcqVhqbvmX5lzxFG3CThxE
         SolQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780417202; x=1781022002;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qYFMKnZkfNnmRXGo0xQ4eN2VdP8xCoBWS52ZR4ARnJo=;
        b=Zzbw1cYuJthZjnM7ZBQ0gKHNiUgPJzya2BT+hpRiWJ0YlyWh0APQOMQOS5QvRHVUwP
         jhMJfSquZQFR8m5/Yr8zkvhvxYGbxGANIS+juYo5GgHft8pFKvAMWVC0juI422lgT7MS
         FTkm/iPGMNAhiHXzau2fKS3jPv6gJRPLlCSfVNK1RxGWDHXRrt8TuTKNO4yMfAvnTUEL
         uLXTaTCNmo7QAbZyRBsvQzPbg8DYCB3ygEr2DFHp1wqsj0BOp4vQVpX4pjtedptvJDTx
         cG1DEv5n0XFpKQkAErEXyxo2itu1X8FzkkFZOUVQjPPKImlF+qTlseTPVh0XMrlzPNcm
         u4pw==
X-Forwarded-Encrypted: i=1; AFNElJ/HeWamw1f+DE8Iaq9MEu3TGLMJYIFgM5tsvLBNM6rDAUTnUBNg7mMd7Lv72cfvyLP5nRbhgw/ZEqVj@vger.kernel.org
X-Gm-Message-State: AOJu0YztgoGjvB0YGe+WzTE3AA8D+menpZ9vIPqdgf1yOaIgCXtLMOXQ
	5h6rjvwT90q4ugs2oTOhwlBLQyxU7hKP4JE2P0/YkjAAXREoemMMPyKHIPS5g+STlnm+SpBem5X
	mj3gsnZcMaJd/SdbOwjyrzATPX2VPCc9Hd3mJFEsziA==
X-Gm-Gg: Acq92OFqIF9Ca9QoWeUw9cwv0zQpYeaJujyhaP0ZgbTXZ+19E6GkO2seAiSoS2OvOkQ
	e8+ATpudhe4Ml5a1h6pXvJGzAUgTUa5MweFozjD//Er/4wZWoyHSTPUDrwXifcZ/leyqe3DT8Hh
	u0HxXIff8e83NItUfeOJEGHmYG5O56/3ALrL7UVakX2ApNrUZQgq5nAWEqlXeV76L5GoLJuo6Fa
	NWAg5PcIivCJozHIBsIN59SG3Y9B+3Wab2KQX16OwUjJwt7JsRz6k1/JfesjMdFOCHVHk6aM0TQ
	XTmVBLFlttgTaYydqyMQ1vmdOFJyFnfeAA==
X-Received: by 2002:a05:690e:23c7:b0:660:367d:539c with SMTP id
 956f58d0204a3-660d61a5f90mr366583d50.65.1780417201973; Tue, 02 Jun 2026
 09:20:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-v5_user_cfi_series-v23-0-b55691eacf4f@rivosinc.com>
 <20251112-v5_user_cfi_series-v23-6-b55691eacf4f@rivosinc.com>
 <87jyslndo4.fsf@igel.home> <CAKC1njS=AHu6uHrH4ae8VxcdEbhgiPXYCAoN3F_mnppBd3SwOA@mail.gmail.com>
 <875x44o9hj.fsf@igel.home> <CAKC1njSn_rtCj8ii876PNQTk0nsCTfWsb4DzdymufHVthh1Rkg@mail.gmail.com>
 <871peqgp9v.fsf@igel.home> <CAKC1njR+dTdvp+BmLGPtgd8dufiUwBtkQ9a-qinELT_Fmi13sQ@mail.gmail.com>
 <87wlwif04z.fsf@igel.home> <87tsrli6lt.fsf@email.froward.int.ebiederm.org>
In-Reply-To: <87tsrli6lt.fsf@email.froward.int.ebiederm.org>
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 2 Jun 2026 09:19:50 -0700
X-Gm-Features: AVHnY4LGzvAggFLA4mHNoi-t9ivcZhZK65HitG7Axu1HWjT50Q9msXqH7dSmtzU
Message-ID: <CAKC1njRapOxS6ibQdCuES1E3aAjsA+yGz4yZ1xJAZHU2vkAm_A@mail.gmail.com>
Subject: Re: [PATCH v23 06/28] riscv/mm : ensure PROT_WRITE leads to VM_READ | VM_WRITE
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Andreas Schwab <schwab@linux-m68k.org>, 
	Deepak Gupta via B4 Relay <devnull+debug.rivosinc.com@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Christian Brauner <brauner@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Oleg Nesterov <oleg@redhat.com>, Kees Cook <kees@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <shuah@kernel.org>, Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Benno Lossin <lossin@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, alistair.francis@wdc.com, 
	richard.henderson@linaro.org, jim.shu@sifive.com, andybnac@gmail.com, 
	kito.cheng@sifive.com, charlie@rivosinc.com, atishp@rivosinc.com, 
	evan@rivosinc.com, cleger@rivosinc.com, alexghiti@rivosinc.com, 
	samitolvanen@google.com, broonie@kernel.org, rick.p.edgecombe@intel.com, 
	rust-for-linux@vger.kernel.org, Zong Li <zong.li@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 2, 2026 at 3:23=E2=80=AFAM Eric W. Biederman <ebiederm@xmission=
.com> wrote:
>
> Andreas Schwab <schwab@linux-m68k.org> writes:
>
> > On Jun 01 2026, Deepak Gupta wrote:
> >
> >> riscv uses `VM_SHADOW_STACK`. It's just very simple to use `protection=
_map`
> >> with just `VM_WRITE`. On RISC-V, `-W-` is a shadow stack mapping. It's=
 not same
> >> on x86 or arm64. So `protection_map[VM_WRITE]` simply picks shadow sta=
ck
> >> encoding. We just ensure that PROT_WRITE is converted to
> >> "VM_READ | VM_WRITE" at vma level.
> >
> > That does not explain _why_ you need to make that user visible change,
> > when others can get away without it.
>
> Especially since as I recall the decision was made was that the user
> visible protection bits would match the mmap call.  If there is some
> combination an architecture does not support that would simply not be
> reflected in hardware until some future version of the hardware gets
> around to supporting it.
>
> This is what happened with executable page permissions on x86 for
> example.  It used to be that it was not possible to deny execute
> permission on a readable page.  Later that proved sufficiently valuable
> that support for denying execute permission was added to the hardware.
>
> That all happened quite transparently to userspace, that wasn't trying
> to assuming PROT_READ implied PROT_EXEC.
>
> So I am at a complete loss why someone would choose to break userspace
> by confusing hardware limitations with what userspace asks for in mmap.

Initially my plan was to re-use (only) VM_WRITE as (alias to) VM_SHADOW_STA=
CK
on risc-v to match hardware Write-only PTE encoding and I didn't see
any opposition
to that initially. Until later when it was suggested to  use distinct
VM_SHADOW_STACK
encoding.
Although there wasn't any oppostion to this patch, seems like it made it in=
.

Now that I take a look at it, I think it can be made to work. Sorry about t=
hat.

Now that I have switched my affiliation to meta, I'll have to spend
some time to set
up risc-v dev environment.

I'll send a patch. Thanks.

>
> Eric
>
