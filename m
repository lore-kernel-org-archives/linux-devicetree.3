Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A863AB28F
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 06:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779775308; cv=none; b=cQKojwSXVxomFFGSYUv2i91atNANY43p9pcJidsGeTumb1yqb8ZyPD8lv4wMBrBbZ+Fp0qPHcvj97Tzi8HiEWyFgT/1cBTtdulgSNfQ1CSy2dWm6P6kBt5V9DmxHgpHadkohZ2D5IiJJH/lA9Gx+fiTYDJz39qikItoM+Q+YVCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779775308; c=relaxed/simple;
	bh=IIR9O6DEwBPyqRtYNOSg4+42A23lup7z5gTcbpI/aUg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TaZK/gDmBnPknrvlTclMBYVGjSnyIQZr2lyQRSdg52nVipEEYUZsm152xfLz/7pZLLm4Fbzox/J6ktOk6fNP71MfORjgMmkUX6Yby/Gj3gdhluZ/VYOMCKfrLWG3kw7mKucejSRQuOMdT+tKCfdbissLui1O2kEKY9tbFmDwf5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JhrEcUh5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JhrEcUh5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D1931F000E9;
	Tue, 26 May 2026 06:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779775307;
	bh=fePw6vzr0O07ZAu0kc9viLcIw/Kr21BH0s7Tm1EIUtQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JhrEcUh5olgTvebQdoiS4h5WeblsuK+keK2dAdW+LF2bnnpVndi66ou7nBM68Vq0N
	 up4RINvmCDIF5YNMFhWIwlvES2w6oss5guOsQWTisOTPiFnE6hjNv+pQ84kbOG8GqF
	 bzw+Z/9W9+e5P4LpmZvGlmPbjg/wQ5Xob87jWpoHn3N//Mzcnc1bgGsZkbwMeemQWz
	 BkclXWROMVGckbgHsZKTZaPRkzxwFllXWA1YOwd5PIK/7rzJ8xJD0VPtVjsJwjgUEz
	 IUucDD6gND3alev30FhdtFeKngBVOIZXulnBDW2XzAtWxwxJkFhKe747zwLnilys6W
	 WR3VfH2ORtvoA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 RESEND 3/5] arm64: dts: qcom: Add device tree for
 Nord SA8797P SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260526051300.1669201-4-shengchao.guo@oss.qualcomm.com>
References: <20260526051300.1669201-4-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 26 May 2026 06:01:46 +0000
Message-Id: <20260526060147.1D1931F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit message claims to configure SCMI power domains only f=
or UART controllers, completely omitting the massive changes to dozens of I=
2C and SPI controllers.
--

commit 8aedf4e02d9c2b72f74522328779082b0ccb3f99
Author: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

arm64: dts: qcom: Add device tree for Nord SA8797P SoC

This patch adds the SoC-level device tree include for the SA8797P, an
automotive variant of the Nord SoC family. It includes reserved shared
memory regions for SCMI, QUPV3 GENI SE blocks, and a UFS host controller.
It also introduces a common SCMI include file for shared firmware channels.

>  - Three QUPV3 GENI SE QUP blocks (qupv3_0/1/2) with UART controllers
>    using SCMI power and performance domains via scmi11

[Severity: Medium]
Is this description complete?

The commit message explicitly mentions UART controllers using SCMI power
and performance domains, but the patch also configures 21 I2C controllers
and 21 SPI controllers to use the scmi11 domains.

Could the commit message be updated to accurately reflect the additions of
the I2C and SPI controllers?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260526051300.1669=
201-1-shengchao.guo@oss.qualcomm.com?part=3D3
