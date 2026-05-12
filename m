Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF2F4D8CE
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 00:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778545133; cv=none; b=PV7XDNlT9Ps7eBLbX0omcqNFnNbwTYPmIw4tVd+6fA5JpdXA9HYoCfLwnfajPo33zYKEyg8AYZDZVR88hh3Xd++S8o18s7ITJ14V0wKpx+wqqjafeVRd3prynyEXjN/6wVRXMrV499d0+mQh1GCkGzAtr65tsCHHE5dqI34OsY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778545133; c=relaxed/simple;
	bh=FoMcEzx/Cizldt1PCiDjvVqWAZukYjqqK6aqhDI8n6Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EkWTsSvRtcbY89t3kITDRAZCs3CX6D6MVCzDEfC+vZLJT/7Y7YXnEjTmRbCJsAdldN+h/cQle6206dMkBpEW28V/W3xmnWVthY54NGdx56W2Li7upbmoO5EOQY7eO6EBxO2cXLJbZwP60sgz6MqBXQ67qpOm1JaU+UmTVoeC9BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pu3kdOjB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pu3kdOjB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10D95C2BCB0;
	Tue, 12 May 2026 00:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778545133;
	bh=FoMcEzx/Cizldt1PCiDjvVqWAZukYjqqK6aqhDI8n6Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Pu3kdOjB3a65tI1Q7x8BwNqP1s5of7jSXyP5xYyuYZ98cwIQFBZUDoxNop0l9Xcjr
	 9UQjlCDnNWUd9ZtrIdT0RSz3AC99cunVqhb6unFQ8FAfqWsLcQ5Tt9KOi/gX+wmWX2
	 TD0ufYiE3tWa3WH9cCkntiJl/AYAY2qKQ+pSGJvpXxlmfv3Zk9B4/pPtn9s6HQ3753
	 TARguTiDXTWNMkDNKN7KjCjiSQPiwe4cheb0hoTdJGmTbxgFYZM+WSgiTNvY82W55O
	 WJ00eaYes3AB0xMi14bKcSnOeEzotrJaZNyYr7zB7sPA4JJUeoHmdSYkf6iZMw3jd/
	 WI24zgq4Af5WQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 03/15] x86/kexec: Fix potential buffer overflow in
 prepare_elf_headers()
Reply-To: sashiko@lists.linux.dev
To: "Jinjie Ruan" <ruanjinjie@huawei.com>
Cc: conor+dt@kernel.org, robh@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260511030454.1730881-4-ruanjinjie@huawei.com>
References: <20260511030454.1730881-4-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 00:18:52 +0000
Message-Id: <20260512001853.10D95C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Spurious -ENOMEM failure to userspace and false architectural assu=
mption regarding hotplug correction (fixed later in series).
--

commit a014be7b4b0eecc06de944b08ad83662babd2b5d
Author: Jinjie Ruan <ruanjinjie@huawei.com>

x86/kexec: Fix potential buffer overflow in prepare_elf_headers()

This commit adds a boundary check in prepare_elf64_ram_headers_callback()
to prevent a buffer overflow if memory hotplug increases the number of
memory regions between the counting and population passes.

> Since x86 supports crash hotplug, any data inconsistency caused by
> a race during the initial load will be corrected by the subsequent
> hotplug update. However, we must prevent a buffer overflow if the
> number of memory regions increases between the two passes.

Is this description of the hotplug update accurate?

The initial load syscall actively holds the atomic kexec_trylock() for its
entire duration. If a hotplug event occurs concurrently, wouldn't the
hotplug notifier (crash_handle_hotplug_event()) fail to acquire the lock,
log a lock failure, and permanently drop the update?

> diff --git a/arch/x86/kernel/crash.c b/arch/x86/kernel/crash.c
> --- a/arch/x86/kernel/crash.c
> +++ b/arch/x86/kernel/crash.c
> @@ -225,6 +225,9 @@ static int prepare_elf64_ram_headers_callback(struct =
resource *res, void *arg)
>  {
>  	struct crash_mem *cmem =3D arg;
> =20
> +	if (cmem->nr_ranges >=3D cmem->max_nr_ranges)
> +		return -ENOMEM;
> +

Does returning -ENOMEM here abort the sys_kexec_file_load() syscall,
propagating a spurious error to userspace and leaving the system without a
loaded crash kernel?

Commit a0b7fe2dc98fe ("crash: Add crash_prepare_headers() to exclude crash
kernel memory") later in the series resolves this spurious error by adding
get_online_mems() to serialize the memory passes.

However, if the hotplug update is dropped due to the kexec_trylock()
contention mentioned above, and the race occurs in a way that does not
trigger this bounds check (such as memory regions decreasing), does the
kdump image still remain permanently out of sync with the actual memory
layout?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511030454.1730=
881-1-ruanjinjie@huawei.com?part=3D3
