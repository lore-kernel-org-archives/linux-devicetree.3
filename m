Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1B9356765
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 23:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778541078; cv=none; b=seRuOQei9YJYUTD7pMg8YiEoqET5o7296M8GrwhtlJZyVzyRomcLTHKQAw0ckzSURuZ08Cmb2KlNITQEP8RqzbGWubUHjvu7oyfS7JKab/U5XqLvM4gDGELdSExZH53VEjMaAG/JaziQYdhhE6fKRVCuBTuyHpXMhPQEuAEMBao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778541078; c=relaxed/simple;
	bh=Waz171SpZ05TQWAFgEL6EfIzWPyI60frbTqNfMJuB+U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aAiU3dM12aSOzXxh5Zap+8saziS4du69gux3rN3a4Gj2Xtg75slHVEBc20FUSAnKACiZLhtKH4Je24nGWloCA2YNZzMCid+8/s1gxjRNfsug8zIggaMVSd85wMT1RBHDkTr4sEr1umkVgjtNZq+iWaAHufuy8YcFWRDxTRz95Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rufmf3me; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rufmf3me"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3084BC2BCB0;
	Mon, 11 May 2026 23:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778541078;
	bh=Waz171SpZ05TQWAFgEL6EfIzWPyI60frbTqNfMJuB+U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Rufmf3mey9I9Y853L9zOEqBtxlRyhe0ZK40ureaUGVBZDmh0dcUHlPPgdGz57DEEf
	 cueZqPsDZhNl5U7yCf0JJItlbJOogSGKAfTGdVW6WQzXaMXhGs4Vyw+M3JJ8DLB7vy
	 gMnLa/EwJ/3v5FmyRGdtfOqnzbZBSz3toN79BolPQ5fqJ0HLIET9olPhPW0S0M1mLC
	 fYP6q7g0cJGcZ+1PDhacpc0s4+BJTtF+6dpZr91X1y4YTcC36hXGiq0tufWt8a7Gfp
	 EKV4YYjens1ixIW1A5PKrOTIOhomRFlf7y+uiUgYzOgE6EyorlFHLDR00+l0Cd64nC
	 sjiBVP425o53A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] dt-bindings: add self-test fixtures for style
 checker
Reply-To: sashiko@lists.linux.dev
To: "Daniel Golle" <daniel@makrotopia.org>
Cc: conor+dt@kernel.org, robh@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <963a1a0a46cccf924f44243534852db13083692b.1778454442.git.daniel@makrotopia.org>
References: <963a1a0a46cccf924f44243534852db13083692b.1778454442.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 11 May 2026 23:11:17 +0000
Message-Id: <20260511231118.3084BC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The test runner script `run.sh` uses bash-specific process subst=
itution (`<()`) but specifies `#!/bin/sh` as the interpreter.
- [Medium] The test runner script `run.sh` ignores the exit status of the `=
dt-check-style` tool, contradicting its own documented requirements.
--

commit 395b561606d87e6d15dae9a82c1d4e309bfe406d
Author: Daniel Golle <daniel@makrotopia.org>

dt-bindings: add self-test fixtures for style checker

This commit provides good and bad DTS and YAML fixtures along with a test
runner to verify the behavior of dt-check-style. It also wires this up to a
new top-level make target, dt_style_selftest.

> diff --git a/scripts/dtc/dt-style-selftest/run.sh b/scripts/dtc/dt-style-=
selftest/run.sh
> new file mode 100755
> index 0000000000000..821d635ddc151
> --- /dev/null
> +++ b/scripts/dtc/dt-style-selftest/run.sh
> @@ -0,0 +1,67 @@
> +#!/bin/sh

Since this script specifies /bin/sh, which on systems like Debian and Ubuntu
points to dash, will this cause a syntax error when evaluating the
bash-specific process substitution used later in the script?

> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# Run dt-check-style against fixtures under good/ and bad/.
> +# good/ files must produce no output and exit 0 in both modes.
> +# bad/ files must produce the expected output (in expected/<name>.txt)
> +# and exit 1.

[ ... ]

> +for f in "$here"/good/*; do
> +    [ -e "$f" ] || continue
> +    for mode in relaxed strict; do
> +        out=3D$(run "$f" "$mode") || true

Does ignoring the exit status here and below conflict with the requirements
documented at the top of the script?

By appending || true, the script seems to rely only on the output string
matching. This would allow tests to silently pass even if dt-check-style
exits with an incorrect code or crashes entirely.

[ ... ]

> +for f in "$here"/bad/*; do

[ ... ]

> +    out=3D$(run "$f" "$mode") || true
> +    # Strip the directory prefix so expected files are portable.
> +    out=3D$(printf '%s\n' "$out" | sed "s|$here/bad/|bad/|g")
> +    if [ "$out" !=3D "$body" ]; then
> +        echo "FAIL bad/$mode: $name:"
> +        diff -u <(printf '%s\n' "$body") <(printf '%s\n' "$out") | \

Can this process substitution syntax <() cause a fatal syntax error on
systems where /bin/sh is a strict POSIX shell?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1778454442.gi=
t.daniel@makrotopia.org?part=3D3
