Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794954839;
	b=yLZ15oOYgypGHHfulIUBj/PfH4gvPJp75ePWtNXcQecM6oeknNARPMvveRLNludztFcB
	 NkSVki+XFHLw7+3VzXoGWjMe+Rya9XKUx373FRs0mjwQz3Q++Gp+NlKeqXgR+p93i7pr4
	 sd29r9Jzn8Fv7McnIZTKDqgn+EwCgrYfqHTPeF2sSnAnnW6gjhpDKp8AxPH+EGQYV1PUz
	 Y43RL2Eew3jlp7IhuvmIrtyc23q8hdyTwc1yQK1hyTmVfWqzXxYh0YMdeJiKvN2TgK8uP
	 4IYtf7vGM+ccROEWsCWh6hPMDOULQ7tNGmysBV6gutblTuJJMTt8Fz/YqTfQ63xo9sA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794954839;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=qECufdw7+ZcKDLHclF2t11gZ4b7c2ev7Uc+irbqAkto=;
	b=N4qouw9uY5g1qyFqolP/xXfaJAXq6v1HzEcpK03LwR90/Gy+tnkXWAo+VL03e8ZF4E4s
	 S4hdJC90rDGqPQLTyPEaU0A3OWZGCIm3HhObMKuIxOewiJNSpgFpr0QaLdMHTlV90pxFs
	 kupq/1pebv3+eS3mUDCYJbd8sm4th2No1scLNMCGaRELLQDjn1VuQCD5I4ZrjBjZfqChd
	 Y32kEfbq3gcPyg1sW4ejpoFGpooZQZj2LNazEOvPnnlwrqoj3May+LuczSTL4/7MbLygp
	 CZeqRtcMI4D7ircKDnEakRmF3GuMk9sjSvzOt1RgrleX14FLf4Y4icuMN7BhttLSk4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ShcwxbuI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F26F606A332
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 22:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ShcwxbuI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA9621F000C5;
	Tue, 17 Nov 2026 22:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794954839;
	bh=qECufdw7+ZcKDLHclF2t11gZ4b7c2ev7Uc+irbqAkto=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ShcwxbuI/6vCM54Os5tN7IQgR67fy4CarC7Vk2cKB3bh+53eq+W2D0xeJ0C5VMosA
	 J0QjiXoCHT4EkeQtqSGaOJ2HMaBvfOfhVYSXPr6YHzYkeIU/Zoaz7p/Ix4T/jNjqVC
	 sEEain0ZTlvLcyiN1VG48oAXdS4CL/k2wHQQQ3KGoDQu5AtDtNaKE8jKplP08fP68d
	 64Qy5/pLpknbs5dfdKeukQ1mHAgGCHGaXBWNDwcs76/AAKPA9ov6qHgHIGgXulPX6U
	 7mzVGpij28URBo447HOFtdTz4Ette5JeHv87E2PfR+2SpG0aIjK/9RpAPoO1OlnSGg
	 D98wt31vb74mg==
Message-ID: <sashiko-outbox-219751@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 3/9] netfilter: flowtable: retain offload
 ownership until deletion completes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Florian Fainelli" <florian.fainelli@broadcom.com>
Cc: =?utf-8?b?b3BlbiBsaXN0Ok9QRU4gRklSTVdBUkUgQU5EIEZMQVRURU5FRCBERVZJ?=
 =?utf-8?b?Q0UgVFJFRSBCSU5ESU5HUw==?= <devicetree@vger.kernel.org>, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261116222519.1416501-4-florian.fainelli@broadcom.com>
References: <20261116222519.1416501-1-florian.fainelli@broadcom.com>
 <20261116222519.1416501-4-florian.fainelli@broadcom.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 22:33:58 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] netfilter: flowtable: race in
  nf_flow_table_extend_ct_timeout() on teardown
It also noticed 2 related pre-existing issues this patch does not
introduce:
- [Critical] netfilter: flowtable: use-after-free in
  flow_offload_work_handler() [1]
- [Medium] netfilter: flowtable: missing GRE timeout fixup in
  flow_offload_fixup_ct() [2]
--

commit b8d898f427299669723392171cb227b67d8f7493
Author: Florian Fainelli <florian.fainelli@broadcom.com>

netfilter: flowtable: retain offload ownership until deletion completes

This commit delays clearing IPS_OFFLOAD_BIT from flow_offload_teardown()
to flow_offload_del() so a replacement flow cannot claim the conntrack
entry before hash removal and asynchronous hardware deletion finish, and
adds KUnit tests covering flow teardown ownership.

> diff --git a/net/netfilter/nf_flow_table_core.c b/net/netfilter/nf_flow_t=
able_core.c
> index 2aa2647ed9df0..4c82097cd50bc 100644
> --- a/net/netfilter/nf_flow_table_core.c
> +++ b/net/netfilter/nf_flow_table_core.c
> @@ -393,12 +393,15 @@ static void flow_offload_del(struct nf_flowtable *f=
low_table,
>  	rhashtable_remove_fast(&flow_table->rhashtable,
>  			       &flow->tuplehash[FLOW_OFFLOAD_DIR_REPLY].node,
>  			       nf_flow_offload_rhash_params);
> +	/* Release admission only after both hashes and async hardware state
> +	 * have gone. An older owner must not clear its replacement's status.
> +	 */
> +	clear_bit_unlock(IPS_OFFLOAD_BIT, &flow->ct->status);
>  	flow_offload_free(flow);
>  }
> =20
>  void flow_offload_teardown(struct flow_offload *flow)
>  {
> -	clear_bit(IPS_OFFLOAD_BIT, &flow->ct->status);

[Severity: Medium]
Can nf_flow_table_extend_ct_timeout() now race with flow_offload_teardown()
and overwrite the repaired ct->timeout back to NF_CT_DAY?

Previously, flow_offload_teardown() cleared IPS_OFFLOAD_BIT before calling
flow_offload_fixup_ct(), and nf_flow_table_extend_ct_timeout() relied on
testing IPS_OFFLOAD_BIT after sampling ct->timeout to abort if teardown had
already lowered the timeout.  With IPS_OFFLOAD_BIT kept set until
flow_offload_del(), a teardown that runs after nf_flow_offload_gc_step()
samples NF_FLOW_TEARDOWN as false is no longer detected:

CPU0 (datapath)                   CPU1 (GC workqueue)
                                  nf_flow_offload_gc_step()
                                    teardown =3D test_bit(NF_FLOW_TEARDOWN,=
 ...)
                                    // false
flow_offload_teardown(flow)
  test_and_set_bit(NF_FLOW_TEARDOWN, ...)
  flow_offload_fixup_ct(flow)
    nf_ct_refresh(ct, timeout)
                                    nf_flow_table_extend_ct_timeout(flow->c=
t)
                                      ct_timeout =3D READ_ONCE(ct->timeout)
                                      test_bit(IPS_OFFLOAD_BIT, &ct->status)
                                      // still true
                                      cmpxchg(&ct->timeout, ct_timeout,
                                              new_timeout)  <-- sets NF_CT_=
DAY

Because NF_FLOW_TEARDOWN is already set, flow_offload_fixup_ct() will not
run again when the flow is deleted, leaving the torn-down conntrack entry
with a 24-hour timeout if no further slow-path packets arrive.  Checking
NF_FLOW_TEARDOWN on flow->flags inside nf_flow_table_extend_ct_timeout()
after reading ct->timeout would close this window.

>  	if (!test_and_set_bit(NF_FLOW_TEARDOWN, &flow->flags))

[Severity: Critical]
This problem wasn't introduced by this patch, but can flow_offload_refresh()
queue hardware offload work after teardown has started [1], causing a
use-after-free in flow_offload_work_handler()?

flow_offload_refresh() checks NF_FLOW_CLOSING before calling
nf_flow_offload_refresh(), but does not check NF_FLOW_TEARDOWN or
NF_FLOW_HW_DYING:

net/netfilter/nf_flow_table_core.c:flow_offload_refresh() {
    ...
	if (likely(!nf_flowtable_hw_offload(flow_table)) ||
	    test_bit(NF_FLOW_CLOSING, &flow->flags))
		return;

	if (test_bit(NF_FLOW_HW, &flow->flags))
		nf_flow_offload_refresh(flow_table, flow);
}

If the datapath refreshes a flow while the garbage collector tears it down
and deletes it, the queued FLOW_CLS_REPLACE work item can outlive the flow:

CPU0 (datapath)                   CPU1 (GC & workqueue)
flow_offload_refresh()
  nf_flow_offload_work_alloc()
    test_and_set_bit(NF_FLOW_HW_PENDING,
                     &flow->flags)
                                  nf_flow_offload_gc_step()
                                    nf_flow_offload_del(flow_table, flow)
                                    ...
                                    flow_offload_del(flow_table, flow)
                                      flow_offload_free(flow)
                                  flow_offload_work_handler()
                                    clear_bit(..., &offload->flow->flags)
                                      <-- use-after-free

>  		flow_offload_fixup_ct(flow);
>  }

[Severity: Medium]
This problem wasn't introduced by this patch, but does
flow_offload_fixup_ct() leave offloaded IPPROTO_GRE connections with an
NF_CT_DAY timeout on teardown [2]?

flow_offload_add() sets ct->timeout to NF_CT_DAY for all offloaded flows,
including GRE v0 flows admitted by nft_flow_offload_eval(), but
flow_offload_fixup_ct() only restores timeouts for IPPROTO_TCP and
IPPROTO_UDP and returns early for other protocols.  If no further packets
go through the slow path, a torn-down GRE conntrack entry stays in the
table for up to 24 hours instead of expiring after the GRE conntrack
timeout.

[1] https://sashiko.dev/#/bug/linux-f53f0af6-15c0-4a1b-b9e3-375ce214f143
[2] https://sashiko.dev/#/bug/linux-e64b7493-5a95-4afe-8a7a-6a28c113967a

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116222519.1416=
501-1-florian.fainelli@broadcom.com?part=3D3
