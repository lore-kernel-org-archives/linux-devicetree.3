Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79EBB3C09F0;
	Tue, 12 May 2026 20:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778617406; cv=none; b=PopBpparI/8+giP+m6VMBnDJ5jd28NwiQwpL3GgdL/A7sY0AJ3GS35gXQ4EvJfEVvEBIemqpcM+51pym5ccEEIX38ZlzXblL1uwRg3SBoNKZZNACDjgd+PDq1Jg8Y7I7yjAS6jAkp0ygamX3SI5UblZU6uPWzGM+yH3Yz5kN7s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778617406; c=relaxed/simple;
	bh=ZBtEMnqNBoykiD2eaYFVxmt3J0XRMYWcgStGHf3TS70=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Nnhfi2Jnwa/Vi8G8vpAj8hm99Jh0wCV5HJYEmfguRnl4Pu2/+oQs5gdgXscpVuKTKd37r6G60TezloSwiRmTCvvWuISJ6emG2mUfSH74kEykbGXI6glHhqsv1s5Nrejv0oOk1Ea3T/khT+T4kLyEx+R3zpTCDlceFWRqKgxEdn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p/62TrYJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p/62TrYJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF191C2BCFA;
	Tue, 12 May 2026 20:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778617406;
	bh=ZBtEMnqNBoykiD2eaYFVxmt3J0XRMYWcgStGHf3TS70=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=p/62TrYJ6avwrIWUhoaiwgRWJM3F8AlFKZXucYfUloGU9JBUeOVwfT4aZKRKGeiMf
	 FPio3OBpq4c21mTlANBDOzucW9tqBbGNx9dQhlFZk5uoqESWtPAegHSNaBEEs9wwyR
	 wqUK0ASLui3zv0ga/16u+thYopihRjLEFXW5rl2P48sw1GuRwyOShsJdV178nxjaow
	 eCGciEmnLxlSqBaAyPriRzsUOuFyGuD5kBSFEemlisySlZhqHdAAh8sBrCnO93vnid
	 220GWJGuRRMz4KftcisNeKjvB0IuqPbOsqUHUHhB4/jC8yyE0VJI6HAssP7K+OwQF/
	 Xirf32ZQQgZhw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: glymur-crd: Enable LID sensor
Date: Tue, 12 May 2026 15:22:38 -0500
Message-ID: <177861739377.1242344.9086919201978407844.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260428-glymur-dts-add-lid-sensor-v1-1-470cc168e70a@oss.qualcomm.com>
References: <20260428-glymur-dts-add-lid-sensor-v1-1-470cc168e70a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 28 Apr 2026 15:32:29 +0300, Abel Vesa wrote:
> The Glymur CRD has a Hall-effect sensor used for detecting when the
> lid is opened or closed. Describe it as an SW_LID gpio-key switch.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: glymur-crd: Enable LID sensor
      commit: 627aab9bfe03613c9f0142d5a70faa7ff9634569

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
