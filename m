Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604BD448BB4
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 20:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785876291; cv=none; b=ZVlGR4zMCNFlz3P4MnqQsLHellFOZC1EzMSD0IzGn/1FSA9gi1/yxZ3V2FasxcMle3mZhij/6/k3NUwUaDaxlzPXK3w2j4+ATRfeFe1GsjbzYlNaQOtab3PMuYLF9wK6JuE9ma8RWrwrOXbXnpHfeczAdlJ2+ypOvUpgsiqTPe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785876291; c=relaxed/simple;
	bh=W+iVCW5dZ22YuQLkPtC99InD+p/fgEhFfPar8t+EtGc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mbu3QvdD2Vz6ipqWSSi+bKahKURN43x8QnQGexoDw76o12z4R3CIGnzWkIOq45Q/fOIJrZ0mklV8BRZaDmT2OeDpxFT3wLRhZggSFmAirYYdPC7FytVfQCQMyP7ccOU4EKV28evFGQggaM0sfN+Uxmk+4GCDOH0P1pAi3ez5Y2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gw9YCwXU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gw9YCwXU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03CC61F000E9;
	Tue,  4 Aug 2026 20:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785876290;
	bh=W+iVCW5dZ22YuQLkPtC99InD+p/fgEhFfPar8t+EtGc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gw9YCwXUt5VyyRDloXWsLfkaoW6VvwDL4Sd+zMb/c+wABFnT8bKRiOcrpd5mogdXa
	 XSJGBvbk/k5UL9W0D2zav9o9lW+CIoMMeFJ7yGWe8OwRFO3ofGUZNU3cQuWWAUMHr3
	 aMC/n519MoI10MpsMxN1S3rttsu7hhO7UngM2fHH+WoJcxLWjkKlLYGMWRksWdiZ5o
	 ibbczKerfoV4lRDbFezS6r/fpnW4Dyjqosv2afZ0EJsirm6KXgwV7+OT6zucNwwd2L
	 3oQnuGbOyc8nORSSdyEtfFWWPelW1oXqgnS6yyK9FI+HH1F3yG1Y89p4lUkeEr6n0j
	 X9lbKrV593NCw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: mailbox: Delete old 'mailbox.txt' bindings
 file
Reply-To: sashiko-reviews@lists.linux.dev
To: "Douglas Anderson" <dianders@chromium.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260804133801.1.I8b3ff71c528133e7d6f81fe926fa39e6451d63fd@changeid>
References: <20260804133801.1.I8b3ff71c528133e7d6f81fe926fa39e6451d63fd@changeid>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 20:44:48 +0000
Message-Id: <20260804204450.03CC61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Deleting `mailbox.txt` without updating references to it in other b=
inding files leaves dangling, broken documentation references.
--

--- Patch [1]: [PATCH] dt-bindings: mailbox: Delete old 'mailbox.txt' bindi=
ngs file ---
commit 1b70b3f250d6bcf306aca223e0e91c9fb8a20cc2
Author: Douglas Anderson <dianders@chromium.org>

dt-bindings: mailbox: Delete old 'mailbox.txt' bindings file

This commit deletes the old mailbox.txt device-tree bindings file. The
documentation contained in the file has been moved to the dt-schema
repository.

Link: https://lore.kernel.org/r/20260722140214.GA548057-robh@kernel.org [1]
Link: https://lore.kernel.org/r/dc7a2041-50a4-482e-9930-566bb3fd1e72@kernel=
.org [2]
Link: https://lore.kernel.org/r/CAL_JsqKVjQ2m-dzMUENQry-f_YE9QrYSOKoH9CPj1g=
jj8XkPRA@mail.gmail.com [3]
Link: https://github.com/devicetree-org/dt-schema/pull/202 [4]

> diff --git a/Documentation/devicetree/bindings/mailbox/mailbox.txt b/Docu=
mentation/devicetree/bindings/mailbox/mailbox.txt
> deleted file mode 100644
> index af8ecee2ac687..0000000000000
> --- a/Documentation/devicetree/bindings/mailbox/mailbox.txt
> +++ /dev/null
> @@ -1,60 +0,0 @@
> -* Generic Mailbox Controller and client driver bindings

[Severity: Low]
Does deleting this file leave dangling documentation links in other bindings
that still reference it?

For example, there are explicit references to mailbox.txt in:
- Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml
- Documentation/devicetree/bindings/power/reset/xlnx,zynqmp-power.yaml
- Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
- Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml
- Documentation/devicetree/bindings/mailbox/allwinner,sun6i-a31-msgbox.yaml

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804133801.1.I8=
b3ff71c528133e7d6f81fe926fa39e6451d63fd@changeid?part=3D1
