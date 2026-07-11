Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E2D3002CF;
	Sat, 11 Jul 2026 19:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783799402; cv=none; b=PspZTjC0nJ5SuoASGludM49UwsfLgvl8LABvDWDQLmcPDs9lk6cjG2BGzZeGHUilTeP3O3IpSpWAvSsMpHtVNxQM78WEdAaSQdPzcbUzZWHcnp1Mrl4nphSgHCpX7LS4ZrmC4wKrCbodEFZsubb8Ew66ef12xGl1ZVi8aJ8NDuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783799402; c=relaxed/simple;
	bh=aj6WpKDiqYe6AOpIIs+XWOPqzXlA2omwxRUN/OiSdaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kAbNK7OXQ04pKdv9kBWQc/KIQIucsajtWiH7quNZ311VzjEsiJwB1l9oTG63kMMo/+nOvaUOiMacrksLKZ2UlQgxaIFoCUJoieM/0Ks4oCbOzqrEw0NJ3N7bUkdY1tX+P+TAGE1QSthET7bKXIVuWeQKtqOL0hx8EtSFlCphOdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B4i7MedE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B4i7MedE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE3811F00A3A;
	Sat, 11 Jul 2026 19:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783799401;
	bh=8HEWC7qkHjrmakrW22MxokkR0BvbZWbOugnam42iIyA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=B4i7MedEavDIDCl2xmlJBJA+TDXWKerxlklHZoygfpN7eKSju66+RnvjeuNnuifQx
	 vhuAYUEQm4/jtT8uBNrD8iLlWbIMway500kiozZ12rGAie6kz62CZXaWims+67rO6k
	 hP1rd+sedhmBYNKsyTpX0xgCFS0JqsI1CrEsuTDLR+vztbQQLOXaKt6kKm3RnyrmPx
	 eV0UI1nMsArioZtcY3b1hEyN0TwZSLyUdnW6NAJISXK/mb4MTKy+8J5JxwJBRrdWw+
	 9tjjKzD3uMC5l2Srv476P1wnr0c+BFYy7TUHyiAWhqnSZFhlTs6Db9DN/ypC+VvsY4
	 5O19vVJetv9jg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	George Moussalem <george.moussalem@outlook.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Luo Jie <jie.luo@oss.qualcomm.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: ipq5018: Correct CMN PLL reference clock rate
Date: Sat, 11 Jul 2026 14:49:41 -0500
Message-ID: <178379938605.163099.6530368854759990280.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260521-ipq5018-cmn-pll-rate-fix-v2-1-04b28a92e0f2@outlook.com>
References: <20260521-ipq5018-cmn-pll-rate-fix-v2-1-04b28a92e0f2@outlook.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 21 May 2026 11:55:58 +0400, George Moussalem wrote:
> The correct CMN PLL reference clock rate for IPQ5018 is 4.8 GHz.
> 
> The CMN PLL driver did not account for the ref clock divider which is 2
> for IPQ5018. Therefore, the computed rate was twice the actual output.
> 
> With the driver now accounting for the CMN PLL reference clock
> divider (commit: 88c543fff756), set the correct reference clock rate.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: ipq5018: Correct CMN PLL reference clock rate
      commit: 02320d694fa1124b8b77fcb52191141004ef7fbb

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
