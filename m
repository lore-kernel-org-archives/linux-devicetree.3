Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD9A474262
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 09:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932442; cv=none; b=XOwIkST7yzQyqvE/DZeOULn1ISPcRH8zOltoahYgbkQOttEqrMfC3kI71aSNAmUsB3+9ExoXE+8VPOsVV/7fQsL/fpfDfuFzUoWQkdwgWj38shPATwEJnuiD4ypJ4J7JG98OLFJohl7KSaIWANKGPG76w+0VD2dPt4AD/hsFxx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932442; c=relaxed/simple;
	bh=xxtBJZqAxjxpaaUCXk4sQYAHYU5QJlRv7Xg6V+Fs2GM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=m7Lf8pVevSLD6KKcW6RMg2q+BK2rWdp7KOpvp0gXs68W3EGWM4vBpylmZ5UHqAbqhvpQ+l0G7vEi46JAYrLZGIpS6IkSSKQmfVUl+WiGOOi3N5Uaf9yxrWo4H5eaMNdmbIfteau0IaiXQpwsVOyzHDxW8oFtLVidWFBS8KVcnRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UUkP61m4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UUkP61m4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E19541F00893;
	Fri,  2 Oct 2026 09:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790932441;
	bh=xxtBJZqAxjxpaaUCXk4sQYAHYU5QJlRv7Xg6V+Fs2GM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UUkP61m4+vLl7fweyrCkJCsZDxe/Tou980fA+4N/zIXcDFARLF0TtRGZbWIvxN18f
	 /X6Yygcaxk3MTlCGRE627YmtMGohLkN3remldfqRNn2SRkLU4QGmzGRzjVwqnzMHBi
	 at9RyFgLv7BJV2zO3z9izQCd8g3eymLkEAjst799RnoPtMmWlKOgqanLODZ8gbEsZx
	 av13JXr3XgS52TSR8PcSb9Z0bjPUEkyLC7ITRLovqkRK/A7Ul6mv+oHz2DUxqfj0Sq
	 kSCZFuAK8Nznm+55i+rVj6jWxjSGfdy9QwCkhyeH7DNj5thIZzbeSvMlO1fmP2ugBP
	 5ju3MP+n5KjWQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 32/38] arm: dts: qcom: msm8660: Align closing array
 bracket
Reply-To: sashiko-reviews@lists.linux.dev
To: "Waqar Hameed" <waqar.hameed@axis.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <8604486885d7462b7a5113fa89573726a0fcfb7c.1790892852.git.waqar.hameed@axis.com>
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <8604486885d7462b7a5113fa89573726a0fcfb7c.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Oct 2026 09:14:00 +0000
Message-Id: <20261002091400.E19541F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dts: qcom: commit subject incorrectly references msm8660 instead of=
 msm8960
--

commit b17e9982dfac5102cf428f6631b5708c042ae4d2
Author: Waqar Hameed <waqar.hameed@axis.com>

arm: dts: qcom: msm8660: Align closing array bracket

This commit fixes the indentation of the closing angle bracket for the matr=
ix
keymap array in the device tree source.

> arm: dts: qcom: msm8660: Align closing array bracket

[Severity: Low]
This isn't a bug, but the commit subject incorrectly references the msm8660
platform, while the patch actually modifies qcom-msm8960-cdp.dts. Should the
subject prefix be msm8960 instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790892852.gi=
t.waqar.hameed@axis.com?part=3D32
