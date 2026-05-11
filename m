Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89BF1A9F90
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 23:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778540818; cv=none; b=K4B4D84114QWa2n96A90wB9cCESACR9Z9pWBD8c6MkBJbYz5TrEpIuh0WRBv5+HbnStj7bxofwW2T2y2xbqaNoEDWY9w8anAHFE7ssv3M3+Nzd7/Q8dCGsgDxRJ+1/CgBQqcLZJdXZZE+b3YvDQ+exgbbb2DQ2sUvCp4q/AndJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778540818; c=relaxed/simple;
	bh=6Nmc5HVch4Ff/uHTSqqH2tzd9mntGgoGUmlDyehHO+E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=d5WSNWsr9gLes7k92TVFzk0hWPBnbJxBQlqGOFw0zm0dfBTjDt3W34B6OY8gfM6VApK/F4W7cEn0Vt+kJi7vZ6/k7vxw73kOZPuNYauuQxnNkPpRk58aydLvAml82eV0hkkqgFofngZ163JlR/e+xr2sPYJK1NkbaK1dZkDqO5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z+JBySvP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z+JBySvP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 985C8C2BCB0;
	Mon, 11 May 2026 23:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778540817;
	bh=6Nmc5HVch4Ff/uHTSqqH2tzd9mntGgoGUmlDyehHO+E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Z+JBySvPz2Hq5zfpkqtRJAsxOCQJOsPoPn2Ywt/M6Fvjy/8A4IV9SsbzJb/rE3e15
	 mgt9p9PJ6or8nO/3CucO8dJILRtyMA1YuUZkKFNR1mIZuiDsZQYkHdgw3RLNO/1qM0
	 u2jU8LyT//QkIN1HwCiGZonUG4qyEIycmWhnujwxTBBXAqeCwzP5t+0LkFJNsxoTOu
	 Z2yapCEYNiVcs1f+MV50c/MdYisVmEWcDEc7fUwLzVPqIghYB7u1VklhszhDuuYQlH
	 vB5lVHCunEj8HoHTwfcIncv/76zPk75/txwvM57RG9+zm7SSm6HYq8rzXqPpcPINpa
	 JCnhRVLRXzVJw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] dt-bindings: wire style checker into
 dt_binding_check
Reply-To: sashiko@lists.linux.dev
To: "Daniel Golle" <daniel@makrotopia.org>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <15c7795ac1c2a6aa71fc6967223869b0b285f4c9.1778454442.git.daniel@makrotopia.org>
References: <15c7795ac1c2a6aa71fc6967223869b0b285f4c9.1778454442.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 11 May 2026 23:06:56 +0000
Message-Id: <20260511230657.985C8C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The wrapper script `scripts/jobserver-exec` drops the exit status =
of the underlying `dt-check-style` command, causing `make dt_binding_check`=
 to falsely succeed and mark the style check as complete even when violatio=
ns or fatal errors occur.
- [High] The `chk_style` recipe fails to integrate with the GNU Make jobser=
ver due to a missing `+` prefix, causing the checker to spawn `os.cpu_count=
()` workers regardless of the `make -j` limit.
- [Low] The command `cmd_chk_style` creates a temporary file via `$(tmp-tar=
get)` but never removes it, leaving a stale `.tmp_.dt-style.checked` file i=
n the build tree.
--

commit b2a3666e05aa3ee60565bab78c721d9f2be7e0af
Author: Daniel Golle <daniel@makrotopia.org>

dt-bindings: wire style checker into dt_binding_check

This commit integrates the new dt-check-style tool into the dt_binding_check
Makefile target. It uses scripts/jobserver-exec to attempt to respect GNU
Make's jobserver limits and passes the file list via an argfile.

> diff --git a/Documentation/devicetree/bindings/Makefile b/Documentation/d=
evicetree/bindings/Makefile
> index 7b668f7fd4007..df4c4e0da1dca 100644
> --- a/Documentation/devicetree/bindings/Makefile
> +++ b/Documentation/devicetree/bindings/Makefile
[ ... ]
> +DT_CHK_STYLE =3D $(srctree)/scripts/dtc/dt-check-style
> +
> +# Feed the file list to the checker via @argfile in a single Python
> +# process so the ruamel.yaml import is paid once. scripts/jobserver-exec
> +# claims slots from the GNU make jobserver and exposes the count via
> +# $PARALLELISM, which dt-check-style picks up to size its worker pool.
> +quiet_cmd_chk_style =3D STYLE   $(src)
> +      cmd_chk_style =3D $(find_cmd) > $(tmp-target) && \
> +		      $(PYTHON3) $(srctree)/scripts/jobserver-exec \
> +		      $(PYTHON3) $(DT_CHK_STYLE) @$(tmp-target) \
> +		      && touch $@ || true

Does scripts/jobserver-exec properly propagate the exit status from the
underlying command?

If the main() function in scripts/jobserver-exec calls jobserver.run() but
ignores its return value, it would unconditionally exit with code 0. This
would cause make dt_binding_check to falsely succeed and mark the style
check as complete even when violations or fatal errors occur.

Also, is it possible to clean up $(tmp-target) after execution?

Unlike cmd_mk_schema which uses rm -f $$f, this command leaves a stale
.tmp_.dt-style.checked file in the build tree since Kbuild does not
automatically delete $(tmp-target) after an if_changed rule completes.

[ ... ]
> +$(obj)/.dt-style.checked: $(DT_DOCS) FORCE
> +	$(call if_changed,chk_style)

Does this recipe successfully integrate with the GNU Make jobserver?

GNU Make only passes jobserver file descriptors and the --jobserver-auth fl=
ag
to recipes it recognizes as recursive makes, which typically require the
string $(MAKE) or a + prefix on the unexpanded command line.

Since Kbuild's if_changed macro does not include $(MAKE) and this recipe
lacks a + prefix, GNU Make strips the jobserver arguments from MAKEFLAGS
and closes the file descriptors before executing the command.

Could this cause scripts/jobserver-exec to silently fail to connect to the
jobserver, meaning the PARALLELISM environment variable is not set? This
would force dt-check-style to fall back to spawning os.cpu_count() workers
regardless of the make -j limit, contradicting the commit message claim
that it constrains the checker to N workers.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1778454442.gi=
t.daniel@makrotopia.org?part=3D2
