Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D78F3890F1
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 14:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785162995; cv=none; b=m/n7MbZG5yxE4VZGNKjTHbLBq67Subcc73TKTvVsKbEj01C0qc8kv3WzA9xQ0IQwBS5ham1lFZqP9lrXffIXWmm5Ijag5iDa2GG9wE2dxFlk8lsHAYliANtIqR4L9vS9RkpEn32RXMMjqbOdzd4RGi2siTNH86SwFSFjBjkl1eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785162995; c=relaxed/simple;
	bh=ziKEYeBPRqDZW6HI+6AfVA6PbMhcN5gMaGJDWyQpzqM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JEPfGJ9mhSpIQgpqhB2qKyADB7WFatmu9GGtZDxRyCFJi07C5ul2baSfcZmJ6Gt25Of5fJjqKpc7dg+8l4MD9MuLjAowfh1ymqQsjHPAmLHcJGGptBaEBSieh0RpEU5lKXp6sFjrTNyJPYeEEX3n554bxNSAuSUq6VI5LEeO+Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bmfCCdfy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bmfCCdfy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 879FC1F00A3A;
	Mon, 27 Jul 2026 14:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785162993;
	bh=ziKEYeBPRqDZW6HI+6AfVA6PbMhcN5gMaGJDWyQpzqM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bmfCCdfyIDo57L4W67tGYWOl49RTL2B2e5hyqpPfxnzNnnvTsoq1ozxM2e2qbZm/x
	 /0WtWxgr6HAku7JY9qSdNb7t7MjUSg7XcTRj3JVb+ittu+EW0j7Eo+peHouZUObstO
	 LEmyaBoVZkndEf5fbCi5urYykeQNowWOWd85kXlsnwU0vXRjscGzMftOV72e80HSzw
	 0bFyGCaDw/+ufFFY0rJgsumYXaRTAZon9J7aRY3wT23UM1hujZtM04Z+ZW9F6SEKoJ
	 VS0GDEbdWKQQaJK44C3tYx4cOejWmdCvXTPfGpK2t1mCt7PoFkyqGvcMaxVnk5UBgi
	 fK4WAR+gutN3A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 9/9] arm64: dts: qcom: hamoa: Enable CDSP cooling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gaurav Kohli" <gaurav.kohli@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260727-b4-qmi-tmd-v6-9-973cd3a226af@oss.qualcomm.com>
References: <20260727-b4-qmi-tmd-v6-0-973cd3a226af@oss.qualcomm.com>
 <20260727-b4-qmi-tmd-v6-9-973cd3a226af@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 14:36:33 +0000
Message-Id: <20260727143633.879FC1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit message claims to set up CDSP cooling for 'both insta=
nces', but the patch actually configures 4 NSP thermal zones mapping to a s=
ingle CDSP instance.
--

--- Patch [9]: [PATCH v6 9/9] arm64: dts: qcom: hamoa: Enable CDSP cooling =
---
commit 11f46654cec2615152b5d3c181397f2d61caf2f7
Author: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>

arm64: dts: qcom: hamoa: Enable CDSP cooling

This commit enables CDSP cooling for the hamoa platform. It configures
a polling delay for passive cooling and maps thermal zones to the CDSP
cooling device to throttle it when high temperatures are reached.

> Set up CDSP cooling for both instances by throttling the cdsp, when
> it reaches 95=C2=B0C.

[Severity: Medium]
This isn't a bug, but there appears to be a mismatch between the commit
message and the actual code changes. The description mentions setting up
cooling for "both instances", which implies two instances.=20

However, the patch actually configures four NSP thermal zones (nsp0 through
nsp3) that all map to a single remoteproc_cdsp node in
arch/arm64/boot/dts/qcom/hamoa.dtsi.

Could the commit message be updated to accurately reflect the correct
number of instances and thermal zones being configured?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-b4-qmi-tmd=
-v6-0-973cd3a226af@oss.qualcomm.com?part=3D9
