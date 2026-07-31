Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B87357CE6;
	Fri, 31 Jul 2026 03:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785468299; cv=none; b=Rq5OrClqsOeXq9ES61QGfFbOMcQMO7mWgk8ok32iDgELLFGTyvw/sjBt7s/eeOupEERJu0kl914AWmbNeUMROHsgWCAAT2tT1g0sqJD5k2+WBjBKF6NCzCe4mKav2T1Jl1VuFnFhIcJ5oeJ/4rMI8EKmIw5s1fFhsK2rWrJxaNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785468299; c=relaxed/simple;
	bh=IoE2vvGzOHZnx3pbzXb0vyFAVEMUBRlUwTyaFEAJ+CE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HtH2pkDJbcTT5I0avCydBnNSTSH1vO67yXZ6lggOY162d/nKdjuv2qsKQvXA9bCP0A5QuYGQBEi4PnT3bvCvTTfk3PnKQyO2n9damSsC6C09o6st7SfnRSJqii6I0R3p8jYZVHFi6jXAJwV8LZh8y/m3NRiUke0IQuFiQlZIppk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nI/gDYVo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nI/gDYVo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD1541F00A3D;
	Fri, 31 Jul 2026 03:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785468298;
	bh=h87uO8THMKg2DtLfc9O93QT49+LvDGiChhTtnIwNtZs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nI/gDYVo5jUJcAVp6GQnaO5TchFwwiweojrTEO8afojhanoahjLXr1e/CS3l9u8q7
	 G2cwnfjguKTIbp7taUrVuVtcCOYjB5PG7M5CUqQSfslhrdBoy75JPoSV5t40taQVoU
	 qCfFynyPNUjboSKIuuworwGgE2BE0UIssPXEnC13W4xmdtcrGygEX0EirFJttkxWVf
	 L7dCc7BxfGKLne7g9BqTINyG8OZVvzkFoh8MwKcRGJxRxKnSCjV+NpE2nXaOMO91qB
	 iJLmUI5qVfii2zrKaGFOqBn73qNzKpZYPvGZeCxqyYeppoeybcUotHC8StSd2EVdNB
	 Epl+RewBxIdPg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: Update spmi-pmic-arb interrupt trigger for shikra
Date: Thu, 30 Jul 2026 22:24:31 -0500
Message-ID: <178546826810.316815.15376473511404708903.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260722-fix_shikra_spmi_interrupt_trigger_type-v1-1-1f8a13528cd7@oss.qualcomm.com>
References: <20260722-fix_shikra_spmi_interrupt_trigger_type-v1-1-1f8a13528cd7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 22 Jul 2026 16:01:55 +0530, Rakesh Kota wrote:
> SPMI interrupts are not working after suspend/resume on Shikra.
> Update the spmi-pmic-arb top-level interrupt trigger type from
> IRQ_TYPE_EDGE_RISING to IRQ_TYPE_LEVEL_HIGH, as recommended by
> the hardware design team.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: Update spmi-pmic-arb interrupt trigger for shikra
      commit: 0cd1b39cf234321fb5c2450dc788ef296cb02cb2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
