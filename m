Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2C93A9854;
	Sun,  5 Jul 2026 20:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783285102; cv=none; b=BP0BqcAswh+FVgXsIjDhoQiDJXbTMBZ42DfR4y/6D+Z2OaGWagmlV82lv6yhbU+410+Qo3MBD7T8kMom6BR3AnwIg1XFgQGUjuh3SReUc4IXT52CPDvgOpOg7kDHBRA/olmJWQwyzuKHkbxfjKhRWuuNOQw0LG4TN+W2apQpunE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783285102; c=relaxed/simple;
	bh=XC9lm0U2NuDSV5piV+/BIzeaTFSDE1CZg3dKXyS3+00=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GFM4RPBvNggPuY6ViP0OA8vrgVubpR14ClOvdWZVI62C0mOPwVlz09cMgdv8tLzXhBmGg47czoF+oCJ7LWvSwd7WMUOMkA7uIJq7bnMWbijKqdGM+YuWU5j3Joiji0scrvNqHJ3CpbiU3+XXSzkPJwOEnSB1e09s68+rE2CeS4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MOjimGGE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MOjimGGE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C62E81F00AC4;
	Sun,  5 Jul 2026 20:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783285101;
	bh=pq4Faq6yvcgMquNohFZPCZPDa8Typk1OjjiMj6EcRBI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MOjimGGEr/O2Z+6+3Hz0g7Nbb0sq9vnxM3e/UbtuoJ4OPK8szx2N4A5a4OA6Cmzkm
	 J4Oqfdl4Ri2kgPLE92P8OwtIXB5MbvFdrdfQ1Nxn6KLvl2sYEbs0Me7rrm2aYY/phg
	 Me2AYkQkMKkIOjQbfcp8phIV1roXZ7Me8Vln+KvVx1mRri00EhRWCb2019+ussRyQM
	 C8ZOI07vsAfZCtnFUVJpWkpn9JPgKN9m7pZShsHNukIGJhtYS0oPbPpLFLc21md036
	 5p9FtLHUsYFp/hRtmzM3tC4BrTSnM8Rz/tJA52SoBVdL3f+UmWBbXQ+0wVQbuI4zsX
	 z7LahW2EHrYKQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: hamoa: Add interconnects to primary USB3 controller
Date: Sun,  5 Jul 2026 15:58:00 -0500
Message-ID: <178328508264.1157743.11331399764906051229.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410-topic-hamoa_usb_icc-v1-1-461e64304067@oss.qualcomm.com>
References: <20260410-topic-hamoa_usb_icc-v1-1-461e64304067@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 10 Apr 2026 15:32:13 +0200, Konrad Dybcio wrote:
> Add the interconnect paths to enable drivers to vote on them, ensuring
> the necessary NoC bandwidth is available.
> 
> This hasn't been done before, as prior to commit 05566ebcc0cd
> ("clk: qcom: gcc-x1e80100: Keep GCC USB QTB clock always ON"), this
> would cause an inexplicable crash upon resume from system suspend.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: hamoa: Add interconnects to primary USB3 controller
      commit: 9594ee0e018dd8657e601b866ae3789ba9eb2e74

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
