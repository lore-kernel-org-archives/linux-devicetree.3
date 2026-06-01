Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E4E306752
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 16:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780330951; cv=pass; b=pJjI595beNVcIlQ9Qy2GjnRyK1M8j+6eKf1YxHOfIoKAig4uaKpSxltrFdXwNgWsUEF7t1AGsnhexJA5r8bLyF014xdb9EVGPWUtdEmZQJIgTArobeh9WutgXv+Z8+vJlERJGzPSg8PGWsZpLAFmfpQ/S7EGScvwq3B8h15q30g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780330951; c=relaxed/simple;
	bh=1CJ/NuXAzZ5JX1S4E7zNfocykkD792/QQHjbajG/YH0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cZiZjBSwbwRAad84abvutI/5DJIfY48zPmP8tneKcrlAmX8nO1V2uOVEbjuiFoFhj7ulLVsC6Lw2QegOSKQsEkS/3JYTWql8ZeLTlZZSmzIegLD/UnvV+0cJAuDkygBjyfeXfTXZb5vM6hm2o5ccrNo0/PR+32DVV1KEC/qT1Xg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b=ZZc4dK9u; arc=pass smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b="ZZc4dK9u"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-66050c021f0so3056783d50.1
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 09:22:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780330950; cv=none;
        d=google.com; s=arc-20240605;
        b=NQFLIi6TSNdIHekBlKJX8wvw2LHdmScduKMj4eBs4feNzUbhXkJtlE0e/s23f2DFPg
         M1DX8A7f2MLN695HVVieaokhgT6DM0SyA4IJkpWOSy/qx6HcPfs/Zdtc5bTEmgYnDoiH
         XlBJCR5RYAr3MFfVIoJHhm6CBr70c0ZgPEzF94xhZgYytu8J59JmcDv7KxAZ4EeLlhjj
         BHMp0Aw4TGOAIS8WIsgl8nVaVJvbHnSWAaLyVInzYrXK2l6dOKXwnlYj7ixk9jOMGwh1
         3Wh7xbKWsKuDlgI4uwLTm2vBnYAZDtU818Bi6w2DGPq99w0m8Wwdi903bhiaUqM5hMUq
         kG+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A1Wsv67Vk9GRUFlRdxu2VA3iBYDzYBLeu5jipj2Jvzw=;
        fh=2AnXwq0ByCFpvhZST8nXWzvVcLQiyRWaEYKI/ZvVJ14=;
        b=G/90sUqoNkaeR6uSX7UBbT06osQDTaGZgYA6AqlDYHbnWsxzKKq7xTnxbRptMqxBmR
         W76fieLd/c0SCdJxagXFN0zPOFDta3zmatNpDnGnCynCzwx/woDdH9UkmQm7omuSeCf1
         lo8AEsfklbrRUr3/4bIDC0Yk5Jhix4ofGrxSYFP188wQHOcpoGHQ20WNwuoQ8KmvTPvd
         CA7YzCg92hy1NXxShvHA7Yz8QnB0t8zgKSgas6KoPWrKnPkekQNMyQNrWhnRdEbOfn9a
         81S8XZK96Hfgh9U0QbUYE90sGCK3Aq4kYKOiY8jqVrH32XGxZopoY+jhAvvrkRkgc/5v
         8dvw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1780330950; x=1780935750; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A1Wsv67Vk9GRUFlRdxu2VA3iBYDzYBLeu5jipj2Jvzw=;
        b=ZZc4dK9u05zgurvFAOaOLR3nhhDSbBr+S0195BgZYoqbIqIlom8Nx2pPajSShMRWJy
         QdzjY6nQLIXKwZhJCSe2tmhnJVCpn+3Bb8vRAIJg8hyLQmfNUg4PJ2b8qs0YkgOLtVXv
         eZPL5bYGUUFcAPc5espEdg9PPKDaHdiA3e4gjDOvfEhEPLClW9TfGMYlFawOpYL2YzFm
         30xDKK9jFOBAOdSGq/49sOl4GLJKaKqlcBIeFqYIuI4ha0ZfZ8fKfbxzOsV36f8seF/y
         jdyArgOGWI0KueUMJu1rnZunngQBfCNjtYM31rfBwdEHd8GppRPbWi+ugrf8E2MGt9rv
         fA0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780330950; x=1780935750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A1Wsv67Vk9GRUFlRdxu2VA3iBYDzYBLeu5jipj2Jvzw=;
        b=gE2DrVhECGqj05Jwt3ZIkt0JtTXfJ4hQ4wVwAgtvE25WPzFk7hcIIdrvJgyO/eGVy9
         oTzXf2r0itORgC/SzOb10QTZoRPkg0Vs+cExzdd8gM2PYKuWX90BD9TgTd9dWFMJuMDt
         uZPiqXFhd7abvJqNyp/OJSOyzRWe3EWsGjEB5g5ul+cXwR3wkSv5rpj4CMUmciQeRrTg
         65wqVmGY1QGZKiDH+cP/jVFb5HSEFrPeqzCZqu6fCNFCli0rFv1AOv59JZyf5H8aLABO
         VN78kc8TC/Z1XhshWQntb2zaH3JcA3dmh/0+crJN1z0ijz/sl2m0z9+KzVy16jKDWL+5
         TTQg==
X-Forwarded-Encrypted: i=1; AFNElJ+FEMq4NxJhVixTs+to0rGwYoylIGfZ34m8055Xahd0tUhD9yonWPndES7wMRPqIv44AQwdKe78d6+J@vger.kernel.org
X-Gm-Message-State: AOJu0YxKPoHC5gOP6Q9Vs4xIircBNVdIGzrtlz1mpql+0dkwfOgf2J9y
	WDVZ/Rh9fB5TP6JFqocCBeRbGa7ui7Vvlifxyr7+N3y4UFGOn7pTtm65LQMCRaz+0uiuVbkVGjQ
	gli/mzHav0idKjCpSkSBkqM1GKGvy5hvUsmywtTX1vA==
X-Gm-Gg: Acq92OHUPiKVoYzmOBafzaWto8UHCMjHU3LYcaF+X9M81uOL+gL1B70i5G5UJlRisgS
	L5SM5K4gNtEm06roFat7ZHewYS0qU+Q6s9qOqbpEvkbTJD3AWIGiE6oRG/+hBHL6W0FQFslHEUQ
	N5dOtvRy9ivE5iMxYQeBKwMT1D2p/jN5qzbWu1hinhwW+fzcn+Ls+AJHR3cwD7lEwRL8rLcCycv
	2Lt4QwT5l53EAVb68AV6DXDZ2KTgV/88/hb7iw3n5zhQjihKCrUoKFv8kgyw9FhRbsnoM/M5cvF
	QgeT7fjtvqyvcEINaIVdVrlRdQtd+I/LsidfS+uUp/GhHGooWiY=
X-Received: by 2002:a05:690e:138b:b0:660:7b47:24cc with SMTP id
 956f58d0204a3-6607b474ddamr5466859d50.1.1780330949770; Mon, 01 Jun 2026
 09:22:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-v5_user_cfi_series-v23-0-b55691eacf4f@rivosinc.com>
 <20251112-v5_user_cfi_series-v23-6-b55691eacf4f@rivosinc.com>
 <87jyslndo4.fsf@igel.home> <CAKC1njS=AHu6uHrH4ae8VxcdEbhgiPXYCAoN3F_mnppBd3SwOA@mail.gmail.com>
 <875x44o9hj.fsf@igel.home>
In-Reply-To: <875x44o9hj.fsf@igel.home>
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 1 Jun 2026 09:22:17 -0700
X-Gm-Features: AVHnY4J6Ejb9kcuTR-Xh2mJuobUXOxxIDSAgxNY81YZ-jI0UDO1cEHEz8fOc8KU
Message-ID: <CAKC1njSn_rtCj8ii876PNQTk0nsCTfWsb4DzdymufHVthh1Rkg@mail.gmail.com>
Subject: Re: [PATCH v23 06/28] riscv/mm : ensure PROT_WRITE leads to VM_READ | VM_WRITE
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Deepak Gupta via B4 Relay <devnull+debug.rivosinc.com@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Christian Brauner <brauner@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Oleg Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, Jann Horn <jannh@google.com>, 
	Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
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

On Sat, May 30, 2026 at 2:47=E2=80=AFPM Andreas Schwab <schwab@linux-m68k.o=
rg> wrote:
>
> On Mai 30 2026, Deepak Gupta wrote:
>
> > I see two ways forward:
> >
> > - It can be done in generic way where incoming PROT_WRITE means
> >   PROT_READ | PROT_WRITE irrespective of RISC-V. Although others
> >   (x86, arm, etc) would have to weigh in.
> >
> > OR
> >
> > - mmap04 LTP test can be updated to expect either of "rw-p" or "-w-p"
> >   whenever only PROT_WRITE was specified.
>
> OR
>
> - Add a new PROT_ flag.

This was settled when x86 introduced shadow stack. Instead of having
new `PROT_`, it was agreed to create a new syscall for mapping shadow
stack memory (syscall: `map_shadow_stack`). Scenarios like `clone3` or
co-routines required manufacturing a shadow stack, thus necessitating a
new mechanism to create shadow stack style memory in demand. Instead
of having a new PROT_ flag,  a new syscall was created.

>
> --
> Andreas Schwab, schwab@linux-m68k.org
> GPG Key fingerprint =3D 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC=
1
> "And now for something completely different."
