Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994CB3E556C
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 09:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787218915; cv=none; b=TaGCX+n9Lk7da91Utn7id9t6HsJY382FENK+9jv2ObH2MOX+Y+z5RtbnGySkiFmW5ZD1M8V09Agw+GK6+o+a7DYunkSqIUHtF4RUzKtddTCZj9vEqh5OK3wESGO3OBOGV86G1SgQtm6Q7S0wnrrI5IQuYmyceLSxtdkyXUMgjAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787218915; c=relaxed/simple;
	bh=cd0yJZrl2LQdfyZSczu1/fk95nQwUD3hiT3xn1dCUHc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dRL6hd5QXt8uJqAws09TnWk4gGCe5pwc88nUYBEEl5pZUc001vpfrf+upVp/MEqY3EtVqcG519A+h1IxVNL/TC3U85SMCP+ICH16NWjbr3+u9F68CGICZLRJmPZC7SlAGWGb7S3OMPe2nUS2JBXzoH7rb/W72KxTVIdqD2ykuDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OllQcizO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OllQcizO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBCEF1F000E9;
	Thu, 20 Aug 2026 09:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787218903;
	bh=rnoPwsiO0CutqKpdDzuDwlk6fuswNzDbKbQe6rC9ZIQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OllQcizOmNIgGe4SYoqWcKfmQ+8SBN5tGPAqF8damy4RCCfm9brWoG93fpND1e1qy
	 KUj6TVuScy8CpIMG4UiyEbBxaos6Gc4DcWpzVpSX2mdD4oXoAkYt+ANScy385BTcrJ
	 fpfisiNoA0S4Cg2MD3Ffqmf77Sc8sRgVpkDgJbkK8U4E9LTtfHU+hOegC2CIEr7WBl
	 123gEK7HG5GrifX60R4fhdEbdBuHWg72SVvUqkqtY9+wBkrer1hVEUq3yrUSCZ15Sv
	 XPEXD+zNlBB5vgRcww9sL39xz6cJcTpXi5NF9i5G/P61HmIwfsRGdGzxhnaoyLhO9e
	 17wgqMHncMbHA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/7] greybus: connection: Export gb_connection_get() and
 gb_connection_put()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ayush Singh" <ayush@beagleboard.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, ojeda@kernel.org
In-Reply-To: <20260820-gb-uart-transport-v1-1-282da14ab7b7@beagleboard.org>
References: <20260820-gb-uart-transport-v1-0-282da14ab7b7@beagleboard.org>
 <20260820-gb-uart-transport-v1-1-282da14ab7b7@beagleboard.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 09:41:42 +0000
Message-Id: <20260820094142.BBCEF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Exporting `gb_connection_get/put` allows connections to outlive th=
eir parent objects, causing a Use-After-Free in tracepoints.
--

--- Patch [1]: [PATCH 1/7] greybus: connection: Export gb_connection_get() =
and gb_connection_put() ---
commit d7d6f3dcc2daeb414806a0f2b9dbabd440f8ec1e
Author: Ayush Singh <ayush@beagleboard.org>

greybus: connection: Export gb_connection_get() and gb_connection_put()

This commit exports gb_connection_get() and gb_connection_put() to allow
modular drivers to manage connection references. It changes them to non-sta=
tic
and adds EXPORT_SYMBOL_GPL declarations.

> diff --git a/drivers/greybus/connection.c b/drivers/greybus/connection.c
> index bd04485decb3d..f8fda22bc4667 100644
> --- a/drivers/greybus/connection.c
> +++ b/drivers/greybus/connection.c

[ ... ]

> -static void gb_connection_get(struct gb_connection *connection)
> +void gb_connection_get(struct gb_connection *connection)
>  {
>  	kref_get(&connection->kref);
> =20
>  	trace_gb_connection_get(connection);
>  }
> +EXPORT_SYMBOL_GPL(gb_connection_get);
> =20
> -static void gb_connection_put(struct gb_connection *connection)
> +void gb_connection_put(struct gb_connection *connection)
>  {
>  	trace_gb_connection_put(connection);
> =20
>  	kref_put(&connection->kref, gb_connection_kref_release);
>  }
> +EXPORT_SYMBOL_GPL(gb_connection_put);

[Severity: High]
Does exporting this function introduce a regression where a connection can
outlive its parent host device or bundle, potentially causing a use-after-f=
ree
in the tracepoints?

If an external module caches a connection reference and drops it asynchrono=
usly
after the Greybus core has torn down and freed the gb_bundle and
gb_host_device, calling gb_connection_put() will trigger
trace_gb_connection_put() and potentially trace_gb_connection_release().

These trace events rely on a shared TP_fast_assign block in
drivers/greybus/greybus_trace.h that unconditionally dereferences the parent
objects:

drivers/greybus/greybus_trace.h:gb_connection() {
    TP_fast_assign(
        __entry->hd_bus_id =3D connection->hd->bus_id;
        __entry->bundle_id =3D connection->bundle ?
                connection->bundle->id : BUNDLE_ID_NONE;
    ...
}

If the parent hd or bundle has already been freed, will these tracepoints
dereference freed memory?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820-gb-uart-tr=
ansport-v1-0-282da14ab7b7@beagleboard.org?part=3D1
