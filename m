Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63DC13AA2F
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 09:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783674040; cv=none; b=TBQJLPNIfNz51uInHN9+HhcwzfuSGJvgyOKpmuoqWnthrySckEhqQr+wiKDt2Ro+pz99Gwa9/bn6iVtjyXPqWTTep5b5+P2+u5DW+cxmofJ8qF8QhoGJhEpkOt60IXt+i7tNhcQe/Lcr2VlZ6hBGWAZMkmMRZcGEFuDuZbZ6qQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783674040; c=relaxed/simple;
	bh=JJoYzEAJYawKJD8q0Yf5B3WcnwQSGXS4GGA7GSAl964=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=f/4H+ECfAGft7rrQdAlrM1pgLrYaA5dpnPbwzRzSss3N7XbvfHjMWRbQJPPOgESSvXvhKQn96OYiUB3fyEsQg3kq5ebGdCsZ8jigiBTHQqu1zQyrr4NzxX5XfW0l1/NDlMo63GpbUIjhbH7FpuiHVSbtQhS/PghWut3r67g0E30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bsafh/NP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bsafh/NP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EE011F000E9;
	Fri, 10 Jul 2026 09:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783674039;
	bh=JJoYzEAJYawKJD8q0Yf5B3WcnwQSGXS4GGA7GSAl964=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Bsafh/NP/MM98cqRXwiUfoOrbF15cM26UP65nyF1j7y/9KS1gmX2P551T9lMga/4l
	 ssDCED/1zInm6njE/h+Vib3pWmvU6m/y7vadKy6StUF30XH592ybkITqoajuKqPnBA
	 A0wt460NTSjBHPdeY76GAi1QZX5GYYTJLAtgmGwkm7bgX7BDUfM5X9xNUAv/tsTmdl
	 ZnUCTpGbp1mU6YbzAn3yfC2dwJoaPocbILhCVbYYwVetCEn7P79HxtxvKXyLBpf9+a
	 lIjeDwLFPyLZKUnemaD7qugT09yeJsdq/NSD18hL/VQn52z8hrtcedEK0fliVAOaiN
	 9ppzkPACWAOzA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: arm: qcom,coresight-tpdm: fix bracket
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manuel Ebner" <manuelebner@mailbox.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com, robh@kernel.org
In-Reply-To: <20260710085744.430340-2-manuelebner@mailbox.org>
References: <20260710085744.430340-2-manuelebner@mailbox.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 09:00:39 +0000
Message-Id: <20260710090039.7EE011F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit message subject incorrectly identifies the modified s=
ubsystem and hardware as `arm: qcom,coresight-tpdm` instead of `clock: rene=
sas,rcar-usb2-clock-sel`.
--

--- Patch [1]: [PATCH] dt-bindings: arm: qcom,coresight-tpdm: fix bracket -=
--
commit 4518c7688f32a888db4924e5e78556acf8a513d9
Author: Manuel Ebner <manuelebner@mailbox.org>

dt-bindings: arm: qcom,coresight-tpdm: fix bracket

This commit fixes a missing bracket and adjusts the sentence structure in a
device tree binding description.

> dt-bindings: arm: qcom,coresight-tpdm: fix bracket

[Severity: Medium]
Is the commit subject line correct for this change? The patch actually modi=
fies
Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.yaml,
but the subject references arm: qcom,coresight-tpdm. Should the subject
be updated to match the modified renesas clock bindings?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710085744.4303=
40-2-manuelebner@mailbox.org?part=3D1
