Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975063B2FFD
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 20:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779913710; cv=none; b=VZY6X2bZ0sU9VywHrA/h/fdFV+rWnAncCv1smi3SsTZ8Gxu90EXYq8DGpp7TRQe80VsIB7RRNhDleDTemsqyPPwM9QH8yX7YleMUG8zleaKGN5ZKztf91w7uDmNjp5+0fGEamY6C2YakEL8rsvulLV9JA+cc5uoh5XLNkV3IUaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779913710; c=relaxed/simple;
	bh=CqYZ2fZwPTI6wzH/PaYLtBpCyKfMkiLThvQzZ0xYips=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KTdHRwSGpvkwMZnulsgeKGtGp1PHmmz1m5NKQyOz87gQdaUxxiB1YPbfwaLRG3ehfjh6kh0qW0Q15+FZe7Mj9KQlk2JVtFnoqFJemK7X98pYyIWqlA7LGZMtQBSnXPDeh0zWd8EtcuBpkbjCkkMDv80AMNAqq3MI0C3IZ62OD9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dKsPIyzz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dKsPIyzz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BC431F000E9;
	Wed, 27 May 2026 20:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779913708;
	bh=bCztmz/+pyfUo5Zi3ImyMfzM/n1Z+N/D8tHNz/gXoe8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dKsPIyzzRjpjXQDFw1JDZ4H9MIaTtmpjUiTMdwnysvjeZAiVz5+W5n/pgaBsF+Y+h
	 gaKvWELvUwMJk4TERejabDVky6JXcpKQg14d2Wc9FE9yHfH30UJP06J1FjApCb8lBB
	 MTKkRA0eQ8I0I7zbySkWqgpaOJwwTSHEyXqG9eiyecT15nwlx2iND24v8ciVxi/MY0
	 1E9TjZOKr31cNie1Nno60UqXbOO/y4nET+t2AqHPDgEYe6agCrzotIN5BseGdIrY2G
	 5t2lvmZsggXTaf++zZnMVaek3x7OP2vH2Dfey+O6tAjk1UBibRw701L3Vr6dQhUphi
	 wMooc0pGnJx2w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/4] dt-bindings: wire style checker into
 dt_binding_check
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Golle" <daniel@makrotopia.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <a14fdbded0acdc4fef1c1278100f2f4c6a93a488.1779908995.git.daniel@makrotopia.org>
References: <a14fdbded0acdc4fef1c1278100f2f4c6a93a488.1779908995.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 May 2026 20:28:27 +0000
Message-Id: <20260527202828.0BC431F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `cmd_chk_style` recipe contains implementation flaws: failur=
e to connect to the GNU Make jobserver and unhandled build failure on empty=
 file lists.
--

commit a0bf52b4283b270bea18b1e64b7f4c19cfa75a3e
Author: Daniel Golle <daniel@makrotopia.org>

dt-bindings: wire style checker into dt_binding_check

This commit wires the new dt-check-style tool into the dt_binding_check
target. It uses scripts/jobserver-exec to constrain the number of workers
based on the GNU make jobserver slots, defaulting to relaxed mode.

> diff --git a/Documentation/devicetree/bindings/Makefile b/Documentation/d=
evicetree/bindings/Makefile
> --- a/Documentation/devicetree/bindings/Makefile
> +++ b/Documentation/devicetree/bindings/Makefile
> @@ -46,6 +46,18 @@ quiet_cmd_chk_bindings =3D CHKDT   $(src)
>  			  xargs -n200 -P$$(nproc) $(DT_DOC_CHECKER) -u $(src)) \
>  			  && touch $@ || true
> =20
> +DT_CHK_STYLE =3D $(srctree)/scripts/dtc/dt-check-style
> +
> +# Feed the file list to the checker via @argfile in a single Python
> +# process so the ruamel.yaml import is paid once. scripts/jobserver-exec
> +# claims slots from the GNU make jobserver and exposes the count via
> +# $PARALLELISM, which dt-check-style picks up to size its worker pool.
> +quiet_cmd_chk_style =3D STYLE   $(src)
> +      cmd_chk_style =3D f=3D$$(mktemp) && $(find_cmd) > $$f && \
> +		      $(PYTHON3) $(srctree)/scripts/jobserver-exec \
> +		      $(PYTHON3) $(DT_CHK_STYLE) @$$f \

[Severity: Medium]
What happens if the file list is empty (e.g., when filtering with
DT_SCHEMA_FILES)?

If $(find_cmd) matches no files, the temporary file $$f will be empty.
Passing @$$f to dt-check-style when it is empty could result in zero
arguments, triggering an argparse error that abruptly fails the build
instead of gracefully skipping the check.

> +		      && touch $@ || true; rm -f $$f
> +

[ ... ]

> @@ -62,13 +74,16 @@ override DTC_FLAGS :=3D \
>  $(obj)/processed-schema.json: $(DT_DOCS) check_dtschema_version FORCE
>  	$(call if_changed,mk_schema)
> =20
> -targets +=3D .dt-binding.checked .yamllint.checked
> +targets +=3D .dt-binding.checked .yamllint.checked .dt-style.checked
>  $(obj)/.yamllint.checked: $(DT_DOCS) $(src)/.yamllint FORCE
>  	$(if $(DT_SCHEMA_LINT),$(call if_changed,yamllint),)
> =20
>  $(obj)/.dt-binding.checked: $(DT_DOCS) FORCE
>  	$(call if_changed,chk_bindings)
> =20
> +$(obj)/.dt-style.checked: $(DT_DOCS) FORCE
> +	$(call if_changed,chk_style)

[Severity: Medium]
Does this recipe successfully connect to the GNU make jobserver?

The recipe uses $(call if_changed,chk_style) without the '+' prefix required
for recursive make.=20

Without this prefix, GNU make (prior to v4.4) closes the jobserver file
descriptors before executing the shell. This causes jobserver-exec to fail
to reopen them and silently default to os.cpu_count(), ignoring the user's
-j constraint and potentially overloading the system.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1779908995.gi=
t.daniel@makrotopia.org?part=3D3
