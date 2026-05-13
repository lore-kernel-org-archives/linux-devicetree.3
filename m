Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F7E39937C
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 21:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778708361; cv=none; b=t0TH5SWNzRsvozHA+lr/RXeuH8Cy4uPpmEnRFFf8f7sgvk108L8ZPIMlE/QmLxr/UaSVyqNldFj5JdlmWTyYv0+2XEN27AF3pgduQhzX43KpwIDCs418PdVdOp9Mn+Cyb3vHotxXPVfKUvxMQL3mCsphLQ2qsIoQ9fQyovYHt/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778708361; c=relaxed/simple;
	bh=+hmYqHeIa2yxJ6s73wQmh6Enar3qbKyezocqtDuspRk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kF5h4f98aGz6K/uo46TDJvVBtwHFZIN/L5azs5b+qlBI1F5WWJ+xq04hpXhr1DS5yC5QHAJLS1+DAoPxTw7DZ99eVg85eQP2BmRagUa4mKamn9uHIHpkBMc+a4Uu1T/fPaxNw03irv4uof/8z/woxFgfms141tX4lL6x3WCDwZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dhxsfixV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dhxsfixV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66F83C19425;
	Wed, 13 May 2026 21:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778708360;
	bh=+hmYqHeIa2yxJ6s73wQmh6Enar3qbKyezocqtDuspRk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=dhxsfixV5T+lnFyh2uILzs/J6KIsQ/dYf5pMkZfVdnVlo4YSV9m7MUfhZqdOEvT6P
	 eVyZTBTjdfEdHKIQmkkyf09xMy5m4zK0y3J0v/WRg/qSnbHxhw7RKR+VXrJQVQQGFS
	 veKgFbuEQFrwGIqne2shn3rRN+5zun5oX0sa8P80viY8bYzx0iXB1GsB3XxHXQv7tj
	 rICevwxGZ5NIty2vGTrnbi90DZrp+2UgXhikYK3r5af+eyDeIbBD06PUKtTfaTJjKU
	 SmET+1gAsphvXo2027pRYyO4j9+vq9RqqhBHy9zXwdgBpyMC+lBTopWQ9HsGGzpHip
	 4kkw5yaWQxBYQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: eliza-mtp: Enable USB and ADSP
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260512-eliza-adsp-usb-v3-3-6420282841c2@oss.qualcomm.com>
References: <20260512-eliza-adsp-usb-v3-3-6420282841c2@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 21:39:19 +0000
Message-Id: <20260513213920.66F83C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The commit message contains a typo, referencing the PMIC as 'PM7750=
BA' instead of 'PM7550BA'.
--

commit dc49b5fa41df22268334cfe92de38c6b4f58dc80
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

arm64: dts: qcom: eliza-mtp: Enable USB and ADSP support

This commit enables USB and ADSP support on the Eliza MTP. It describes the
USB Type-C port and the eUSB2 repeater, and enables the corresponding USB
controller and PHYs.

> The Eliza MTP features a single USB Type-C port. Its USB 2.0 lines are
> routed through an eUSB2 repeater provided by the PM7750BA PMIC.

This isn't a bug, but is there a typo in the commit message? It references
the PM7750BA PMIC, but the code changes include pm7550ba-eliza.dtsi and
configure the pm7550ba_eusb2_repeater node.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512-eliza-adsp=
-usb-v3-0-6420282841c2@oss.qualcomm.com?part=3D3
