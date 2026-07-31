Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894A1353A7E;
	Fri, 31 Jul 2026 03:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785468240; cv=none; b=gaevg1oXBdbBmrk80PWFXSaktvDLA7Lw47IfHWCCD22jzfCgxcS5m6AyWpRxbyjLj6wByq5DDLcT63xCxE8dM3tqHhvFkNlaq4BMpLqT1je//R16izMfKFLFEw/hL//usKik3JPQ/tpOg5waJ1UQk8D+a31xuCPDEdVtRcEA4cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785468240; c=relaxed/simple;
	bh=1UWE9ioJCWGP+i2XsZfSXLizGHck6Ck5D651kBihC70=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KV4YzzF/LvZrrprhYX/Mj5v4cNd8hj9cQ3UpgFxURoFA5T6yb+DSbAuAVlna+ceew0iJjVNNGk9CO+nkulsxAfvO7wG/gUX7ODjQX6g4ugxoUJgtGgH0TvI4FxuZGJwCMDeQ8z3KRunoSv6RbFH3mEEoTJZCW6L43Bbm5HqNiTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eK7m+x5s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eK7m+x5s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A8261F00A3E;
	Fri, 31 Jul 2026 03:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785468239;
	bh=ZWNkMrli2LzyarLKyk+vpxDKWzTUTEwAce2K0maUavk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=eK7m+x5s6z16RrZhne4mQzgF7hFqVx+oXJ8jXahZYDnxjcJGbd1iD1iwAe3p3cMoD
	 TlkMufoDnsmcbHsWI/Z69h31JV3AAk7h2CSfcvq7+46gRWBzZqHvDEDt1m6niVVUXy
	 8bRt2pSUAKCW1ZpHMD8I8xqgyHbIoXXqNUImZ9r2t17JUPTaJEQhTLetg1OLhVabCv
	 Q7oDZykVoL8l/ljisWWAQ5xUWYIf2cyHwcvOw+Gy2AiRLJpiZuTCdXg2Em8439SROC
	 rQ/ehEFLr1YZ26/62n6kW2UQRhD01dVY27UQXFq4HIGMHoxAAhLfoZ3l5d+OX8w1vd
	 b8uvh1TgYkSyw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Marko <robimarko@gmail.com>,
	Guru Das Srinagesh <linux@gurudas.dev>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: cros-qcom-dts-watchers@chromium.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v4 00/19] firmware: qcom: scm: Add minidump SRAM destination support
Date: Thu, 30 Jul 2026 22:23:46 -0500
Message-ID: <178546821260.316167.9201924841087925172.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
References: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 25 Jun 2026 00:38:11 +0530, Mukesh Ojha wrote:
> On most Qualcomm SoCs where minidump is supported, a word in
> always-on SRAM is shared between the operating system (OS) and
> boot firmware.  Before DDR is initialised on the warm reset
> following a crash, firmware reads this word to decide if minidump
> is enabled and collect a minidump and where to deliver it:
> destination (USB upload to a host, or save to local storage) and
> OS is expected to select one destination.
> 
> [...]

Applied, thanks!

[02/19] dt-bindings: sram: qcom,imem: Add minidump-sram pattern property
        commit: a20f7b1fe71167b34b77b748eed6a2476d6206c0

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
