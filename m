Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21454734F9
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 09:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932441; cv=none; b=p6wzI4dvQw6pGKXd+xGMJrGUUEoDCMSQ5p8G2X1b7yDBto+cFiq5SYp+a2ZR/ur/DGuquV73bW3iYoX4fLf/Hdgi1q/Ezi0E8nxi2uLgq1O29hHSTGoaMV7epjFE9TzEDqKPylUC9PyvDEauRxF6/0ukdZpCoF/56eq2cjR8OBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932441; c=relaxed/simple;
	bh=tfBiXpOIjqHYm3m808Nvbm4mCGFkGDtYAR6q3XkYLec=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YGHZT9XRuxCJYEzvi/C13MFJIh+zFjW3BFSBDBwYBiSXOS25wGNtFtq0ju4XtdgCihRo6mLOVdlF0wgrv292jetAWVso9Y0HhKmYt646RabLVMERZBfEqVaI8kI6KpDzos53Cqyu+Le57GszKQHexQ+qxyIaIdzbOEek34KFpOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U7r15OS5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U7r15OS5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40B021F000FF;
	Fri,  2 Oct 2026 09:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790932440;
	bh=tfBiXpOIjqHYm3m808Nvbm4mCGFkGDtYAR6q3XkYLec=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U7r15OS5tfHMx/X7qzkRMvNBWFbb3eXf5db8eH5f7tl0w9580QYjjs5y94BU7XeM9
	 iQrl1V+MjCRxlNJCUHslTJSb1frpQglhQDUU0CUQX55lI7n5PqgZ1vtLP7wwCBYvIX
	 oqKHZUdDoVjCnrZ+f49fQbJpq3Wg+ITNmjiEqEEsWaByzfkP0Q0Igen9CoI2tOttTx
	 9NpUILOEYt9rJVPfKxGHi7x8DZFtbZIwu6rafyxXxaVe2o59fH+O53GfTk3kVlzQh8
	 Ws4TcUuMJKPpUCviPyArE3ywt56dPYsCpDHxj3CQm9y+Qr+7fwKsbJXxhzkGTDI/4t
	 eeJfKnGxKX3ng==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 25/38] arm: dts: qcom: ipq8064: Break long property
 array data
Reply-To: sashiko-reviews@lists.linux.dev
To: "Waqar Hameed" <waqar.hameed@axis.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <d8c979c34a5b49a7b83bda8101c5f74711a953a6.1790892852.git.waqar.hameed@axis.com>
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <d8c979c34a5b49a7b83bda8101c5f74711a953a6.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Oct 2026 09:13:58 +0000
Message-Id: <20261002091359.40B021F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] arm/dts: commit message mismatch for msm8226
--

commit 48c3f8677b03cbab24e050029b004bb3e0cca06a
Author: Waqar Hameed <waqar.hameed@axis.com>

arm: dts: qcom: ipq8064: Break long property array data

This commit resolves an awkward line break in a devicetree property array by
placing all elements on a new line.

> arm: dts: qcom: ipq8064: Break long property array data

[Severity: Medium]
Does this commit message prefix accurately reflect the changes?

The prefix explicitly states 'ipq8064' (and shares the identical subject wi=
th
an earlier patch in the series, commit 0462db0355be), while the only modifi=
ed
file is arch/arm/boot/dts/qcom/qcom-msm8226.dtsi which corresponds to the
MSM8226 SoC.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790892852.gi=
t.waqar.hameed@axis.com?part=3D25
