Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49981349CE6;
	Sat, 23 May 2026 02:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779502826; cv=none; b=lGKit+9Ft8G1wS5JW/Lfndde5t3nEiid/KV+uHbzZAEqpRFv+NhNnk3+H8FxrdFcgRr6E+HL1HWd2a6dMu+rHO9vTuOrxlUQV6OVI3Bu0jBUyJbV6eDLEeuHTxCw5Sxp9AOPuJycnhsewVViyZqEqfJZ6XKKCQAqZrKIl2v3Xd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779502826; c=relaxed/simple;
	bh=cXHZ81GhIf4QSQ1ub/teOQwXwSg/soEU+2f+mC70L2o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sgzcTcrpgRzLu1J9vsy0W4JxJRT8o0xvh1/C9zXvfYQQgDa6jMeFbUoJs3fbClEvVp7xDmhmx5M2DZ2UFDjmc3T9BQ44OtylxeqI6gMhWXWLJueSiaXQO4KZfDw3o9l1zqTjrXUgaOYrBzNjg8T3Fum3pKJanIKodGKugENbn88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BabU1lsr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BabU1lsr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F030E1F000E9;
	Sat, 23 May 2026 02:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779502821;
	bh=YM83iPqTg43oGPTRhVxwHhFt9cK5SnVdpexQC3jwomI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BabU1lsrdn3i6ek9tPJZd2jIglmUaniq/K7gDCBGUxVj6zHmYnLy54kxHMpFWvb87
	 AwDouQnlva0YlQkviyXyOWYfNo3Z1Tbx6WDSOEkBirUHfifybH9/EhWmOwb41bgdNq
	 WDIW7ucGlRXMGftaeayTyPRQxQbgqOVEFnOcoAz74yws8LdL0nTCfSqjlUf6jwMkDB
	 JfV9wzMYbj1nPmo37BZBo1i/4rZOSd4BzrlCL/zkg1xK4Tx8OAoRnK9eOHtPHsEpxT
	 IkqTU2neQBKTRL54SZ7s2lNgChY3OK+7CUVX+77uR1yQmAAFUXlk75SyKHVeGeprD/
	 /81yIqVmrCj9g==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Qiang Yu <qiang.yu@oss.qualcomm.com>,
	Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
	Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
	Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Fix wrong interrupt number for i2c19
Date: Fri, 22 May 2026 21:19:50 -0500
Message-ID: <177950280348.1097700.10621304272880373412.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260518-glymur-fix-i2c19-irq-v1-1-7d5968bd9b2b@oss.qualcomm.com>
References: <20260518-glymur-fix-i2c19-irq-v1-1-7d5968bd9b2b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 18 May 2026 02:52:53 -0700, Gopikrishna Garmidi wrote:
> The i2c19 node at 0x88c000 uses GIC SPI 584, but that interrupt
> belongs to the neighboring i2c18/spi18 node at 0x888000. The correct
> interrupt for i2c19 is GIC SPI 585, as used by its sibling nodes
> spi19 and uart19 which share the same register base and clock.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: glymur: Fix wrong interrupt number for i2c19
      commit: ecabfe832b817bd1c1fdb8841d7bc706bf621ef1

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
