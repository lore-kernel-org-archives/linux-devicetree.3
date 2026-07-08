Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DBC4C8FEA;
	Wed,  8 Jul 2026 14:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522639; cv=none; b=aB8z5C2mez48MAQrLP0G4JIhnRHHiqkLy7fpKFCWJrYd9QOsfcLmgy4ZvQ9NDl42MnpYSdlGcvxFbTDzwfxffxAJhPzlmO9bTT6klHVoeVZR7JWB8hflM1eirr6mdMP/JPBNxgPQ2Mzo3obN/v1Nu6egDETIID98YzKoKmTa6EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522639; c=relaxed/simple;
	bh=5kQi5NTnSGX/j5auue0b/PIKjVbuV9kP9Mi68KtrQOA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VYlh+88HjZP98QCL1t3mSvF0VMMyV/c6Z7wSyFgl3wPKtxOuiXvliMm5xoEAQt9mrf8O79Qcu7a63++MJ8LljkFoMZgkIcMNCmqU0eU8uBwL+SIDjJ8gImeLiptAJNvCIUwyfZ6l0C3Uc43WE0j62EhLaQmqexpDjOmOCnkbr1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fPjkldQS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fPjkldQS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB3EB1F00A3D;
	Wed,  8 Jul 2026 14:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522638;
	bh=GFised6SOyOQAidEm8yAUitbjqRQiuOOtYkwkhPGTDA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fPjkldQSwvN/mSSKl6lS40/mRLhi4VrWgESr1/ZMZEuLJH9omg5xUahd75mFWfNZt
	 pYXFnKcvN0QseyjTP5DPrFpvkYv/RPpmftT6NvKmrN0Mg3XccjSnAdAYD/j4dVMGid
	 QyVNgHMMyIQS4nPMJU2Y6dmfaYkXiTH+t2pO/8q2eFCg1e7/dFD4dft/ZCEX+ihuhn
	 CYEo4cNiZqCxTEDahKKhtuo9sdiKO2REQ4E3UC1qVOeP2MvhW1kaP0F9RLKRMY1970
	 Rxq1Ef06z61He1IlXMI4enQ4pdR8vjtPoPfn3gsgr1xj9JzQQO3L4GycYULOONkmzo
	 HUEgT3YIH78ZA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rudraksha Gupta <guptarud@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2] ARM: dts: qcom: msm8960: expressatt: Add coreriver,tc360-touchkey
Date: Wed,  8 Jul 2026 09:56:19 -0500
Message-ID: <178352261589.2235436.9498498267915599094.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260527-expressatt-touchkey-v2-1-049dca41fc3a@gmail.com>
References: <20260527-expressatt-touchkey-v2-1-049dca41fc3a@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 27 May 2026 19:13:41 -0700, Rudraksha Gupta wrote:
> Add the tc360 touchkey. It's unknown if this is the actual model of the
> touchkey, as downstream doesn't mention a variant, but this works.
> 
> Link:
> https://github.com/LineageOS/android_kernel_samsung_d2/blob/stable/cm-12.0-YNG4N/drivers/input/keyboard/cypress_touchkey_236/Makefile#L5
> 
> 
> [...]

Applied, thanks!

[1/1] ARM: dts: qcom: msm8960: expressatt: Add coreriver,tc360-touchkey
      commit: 346e9112f3dab91a5cf3100a99ec256ff0b7f0fe

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
