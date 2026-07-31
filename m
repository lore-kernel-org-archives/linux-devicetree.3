Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B21352C4F;
	Fri, 31 Jul 2026 03:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785468290; cv=none; b=ZnmJTbtFcto1lDNxKhQwd1gDvUybXDQxkC/4fw8tzZQKd/9ogFExRJApL8dm/Z5LeO/+MZKxZTc5VURepcDk/h5G3o05l/C1z+ShnKeLwuga/j6kEZExT4qFAsEelVttcyDBv8xs+OLA/g8ivdBprsm1kpQ9Ybj5bGvHRHaqG+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785468290; c=relaxed/simple;
	bh=4LzdiFYtrDPCAeU57rggtUpgqtzSHBpodtPa7+4HEks=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gSNgYbE5N/82fSsHrnZzFAc2kZRpai1Y2kbUPXojo8ixySNTjq9+gTcqoO7NCngP5Gnvos7aXOBkBjpr3SbZVuwefMxlFaJSxxx1zv0NIWO7gIOmFpu1k0im/x1id21tmfU29aAGnKSA+AtN1ZVGHU77sH5HKl/8SpLJRICHSS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N61tyU4q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N61tyU4q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A151A1F000E9;
	Fri, 31 Jul 2026 03:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785468289;
	bh=86OqS7VWMGhcMwdEHN2SnT0k82mK8Sv806d1zmy2W/c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=N61tyU4qfLtZotVNwARZfewfirrpBOt9C4hk1duCKdVPGZgiUHhg8+rToD4pa23fP
	 6lQLvozwioTyo1BSPsRQF2PxSjjUPRlxF6aVwRN3G+Lo8zRXjH3yld+t/GX2gWCKpo
	 6LPPU/xFXnAmrhYa9ysXlVoZwTbZCUmGi2OuJeGfBVURnyH8ZaSj6y8MR5yoLvebqw
	 kxn5fRCPu71mACgC66sU4mA0tGDA/uhNDXK7IV/4y0zZYyrj9UC/aXcJv5jA+dnOw4
	 MXmuDoXsDSvOh0+Ucq+ZgQRgq9AinBzjEhn3Y/PiPEifzVjMRlUegsJvxHUfCE561f
	 RK1gW/rOA1v5w==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Fix usb controller properties on glymur
Date: Thu, 30 Jul 2026 22:24:22 -0500
Message-ID: <178546826829.316815.13860393827240838899.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260723-glymur-usb-fixes-v1-0-816357d5319c@oss.qualcomm.com>
References: <20260723-glymur-usb-fixes-v1-0-816357d5319c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 23 Jul 2026 23:02:24 +0530, Krishna Kurapati wrote:
> The Glymur usb-hs only controller is role-switch capable. Also all
> controllers are wakeup capable. This series add these missing properties.
> 
> This series has only been compile tested.
> 
> 

Applied, thanks!

[1/2] arm64: dts: qcom: glymur: Fix properties of usb_hs node
      commit: e78c5e9d79e3c024e9b80ec067e62477c29aa29f
[2/2] arm64: dts: qcom: glymur: Configure USB controllers are wakeup-capable
      commit: 5ac32106d3c2ea94abd236fe3ad3897925640289

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
