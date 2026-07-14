Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE606423E8F
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 22:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784068355; cv=none; b=I50RyybnK4VFM6R/FAo3GWhB4iVYUWJv4TQH0re6utuwVt1eMJqy+HH+/Xxf7b0xJxEDxcfILFXidFZjBY7jGLOdtgZtvTQmaQjx9GRlH1ejtl3JsJhPMFC/wzRaLbxqIVgcIuzSw0OX+79wwgcoBtdtX+xYAUg19amhrT2uJSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784068355; c=relaxed/simple;
	bh=mqLqW+WQzNLDh4jTLZChTxq8dQTw8D1N0kbTtDbKGKE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OU/8UK9yq9u5qUClinKbG3xbhSn/t2H1TjvzSh5GU4IZ+H3QIvR60oJbl4/NQqxqc1L58HFHzLvmafJsW7QiUztVyTPnLPPILum64+ZMr+UpJzcqzAq1tjxw6gRkMQs3qZJWjE/Pa80DSuyVAJUHl7hknivH+RSP8CNzw3sMCJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cuOkNoM0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cuOkNoM0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF4141F000E9;
	Tue, 14 Jul 2026 22:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784068350;
	bh=mqLqW+WQzNLDh4jTLZChTxq8dQTw8D1N0kbTtDbKGKE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cuOkNoM0aLMs4c3hfbwKR2qXmkL7WR/6xoORfRTtqISzv7QsUod0nVvYllCCJfyoq
	 j7NgoMZeoKNWyq/P1Ae1B9maotxwzlL79eIm5LfjcLMq7MPVHhw0gLHvSocHrfV3rw
	 0B32wbMIiiIxGGC5hXk6TIpSD7hLInMlIK11nNRGB/vkde/cUuM4zJovyNbmybi56a
	 1itCrFmXN4h0rhR1wi3cA7V3y9UOTjI/rLqRVR7EadwQmr3H9s4cCHzk66Mc0CRPYq
	 NDuUGd0DFN1VuSef4326ni94tbUVflKU0xcFsenH/MtYt7YSxhrhiECS8rMjtpkmIQ
	 OZ2OXolxWG5ww==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/7] dt-bindings: mailbox: Don't require #mbox-cells to
 be 1
Reply-To: sashiko-reviews@lists.linux.dev
To: "Douglas Anderson" <dianders@chromium.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260714152138.1.I814d768336e8de933580d467140ce340f3d4f55d@changeid>
References: <20260714222338.2965707-1-dianders@chromium.org>
 <20260714152138.1.I814d768336e8de933580d467140ce340f3d4f55d@changeid>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 22:32:29 +0000
Message-Id: <20260714223229.EF4141F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The commit message contains a typo and is missing the value '0' aft=
er '#mbox-cells', making the sentence incomplete and confusing.
--

--- Patch [1]: [PATCH 1/7] dt-bindings: mailbox: Don't require #mbox-cells =
to be 1 ---
commit 6ada1cfb4e312b11f6e334039168356fbbe9bd88
Author: Douglas Anderson <dianders@chromium.org>

dt-bindings: mailbox: Don't require #mbox-cells to be 1

This commit updates the mailbox bindings to clarify that #mbox-cells does
not need to be strictly 1, allowing 0 when a mailbox only provides one
channel.

Link: https://lore.kernel.org/all/20260322-mailbox-v1-1-c6251f18187c@gmail.=
com/

> Existing mailboxes have #mbox-cells and this makes sense if a mailbox
> only exposes one channel. Update the bindings to match.

[Severity: Low]
This isn't a bug, but is this sentence missing the value 0 after #mbox-cell=
s?
It currently reads as though the intended value was omitted, which makes the
description slightly confusing.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714222338.2965=
707-1-dianders@chromium.org?part=3D1
