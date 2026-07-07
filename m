Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F20338B7CD;
	Tue,  7 Jul 2026 03:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783394532; cv=none; b=hy0VdzsZaaPNUt80sSuamonkj9GC/tjfRgeCUWxBIsitnyPmoYM4/eckKc8ZN94WHd6hbuuqB5S07xnXlav1ouUC1WPP3uvDe/JVny8AHxuU4wpn3hW3Mc6XlzKmJmGAwwPRwfs1vtSYKseddUwgX0DzkP2+ojORmkqKevoS2xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783394532; c=relaxed/simple;
	bh=Hra3RAanWkVOLdJ9Lq7JBRqQ2C0CWOjwd1sQ425QeGs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cLtEv6mjsnrPO406CeYLovc/vCUdy1nDDR36XXOlF5get9rndzey7nnzot+wWiTxYm//I6e1RLHXA7GEYZAo+rSaZF//sRIasC8+x+J/3aKFK/HaCkZ/49VqGy3QzwXcgcO4AE49xYhK6XqwhVL+m08IvH2Yqxt4noM7/RHUM0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LNCdqvHE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LNCdqvHE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BEB11F00ACA;
	Tue,  7 Jul 2026 03:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783394527;
	bh=SoyiIyJ+MXdRUIVIC/mCwrPONUYaOdlbk8J1sYpF5mU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LNCdqvHE/KESo+yUJi9XNeCI2PHj3BsW3GNudGfSsbtJ1Mmn5IxquRCD/Cs32Ac49
	 f2oPHWZOLkR/tiRCxUB2sjXViZ1bwV/sg5zRY6/oN8uzL8bGXklZnGz62gN0nPH/CU
	 TzilOWsq2IS7pLCjsZr4uVITyIEWCWWMchxH59B4jZCHremhqe9/bHCHbOtZWfGdF+
	 J/jZ5L5Dyv/FmJ/a8rKc0it/gTdHRoNc8ItnJK8+4OQTfgbWEibMIS46qaBENCV2sz
	 CWiMfzQILBb3fsrwTRaQN4E8ckYYAtNPke29UdTNyJYpsg0nutz+HU/cdL4PLjj5G3
	 2WZPilxS8V2/w==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Cc: Bharath Kumar <bkumar@qti.qualcomm.com>,
	Chenna Kesava Raju <chennak@qti.qualcomm.com>,
	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Add memory-region for audio PD
Date: Mon,  6 Jul 2026 22:21:40 -0500
Message-ID: <178339449916.1938770.1898562510699107674.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260701-glymur-audio-v1-1-2c3862d95a09@oss.qualcomm.com>
References: <20260701-glymur-audio-v1-1-2c3862d95a09@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 01 Jul 2026 15:35:31 +0530, Vinayak Katoch wrote:
> Reserve memory region for audio PD dynamic loading and remote heap
> requirements. Add the required VMID list for memory ownership
> transfers.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: glymur: Add memory-region for audio PD
      commit: 67641246eabd0629b11e767c233d92b855a64f45

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
