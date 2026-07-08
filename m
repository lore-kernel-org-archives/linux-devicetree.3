Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F923F12C9;
	Wed,  8 Jul 2026 14:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522660; cv=none; b=gnki1cdfdIWjQuG6houfmNgwhOcMB11Qb+0M6rXhVVLrYhHX/6IZOanWeVNHzmOpj5JJQG62HBBUDMbsoc3CoDWf6Zm+KZbP2Xh+c1geLPMIW2hEY+wXIAw5P29cC9JbUWlTCKn8FlrEUim2oVmYotRx7qYJEdlZROtxXViyDg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522660; c=relaxed/simple;
	bh=KDLziHR9v87L7YzFKWMsbIG18tfQeWYCnKagyHiAmQE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sVpdbF0fAZtRHR4G89gg1nK+esbc7HuFVC0bPW4g9Eqme0QLgEaoeclDv58Q3kA/mppiMZMbUTYrtux4A058nvkSiTTjGUUDi8Dfwlkeide3Xc5jUm7EL24uBjWqQGeCw0bJJl1fQbx2BrcuBQ0kWs41f7O+uhBi8KBO0EiDKWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=flCuY05K; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="flCuY05K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 618561F00A3F;
	Wed,  8 Jul 2026 14:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522659;
	bh=n4fEfBHro1YDeWOLVtSNhZ+zrDj8UJz3c/tuj2d+RnY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=flCuY05Kv5WAvtI9dGCi4PRTR2+56Hu/5m9RHmrK3tI+tIJB5t/nXZN62KjyWsm8Z
	 fAIOweB5yrTtcG0iwD/Y0t+vCN+h5aSCgzuFrDkslUdPP9N+K0DQhReN4euhwJTaDx
	 d3EqF1x19auFy5PN0bwZMs/UZgpofgVr8YfYd71GEeC1bxiuOU4kjO86CqNzm6h+I8
	 yq3R/zRjvFlVrKqyZlN/vWPMFnzzZEwohu0LhJEzlF+mwqGzbpyzt7bSYRrTH3JU2a
	 E34X20zVGDgmG1T6tOJGosVTUb0dnAO5PTwOqvLR6CgUj4DOpgAXvufgm1O2xITqqI
	 MmeGbLvKw9H1A==
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/4] Describe display voltage regulators on SC8180X devices
Date: Wed,  8 Jul 2026 09:56:39 -0500
Message-ID: <178352261623.2235436.16285314192262978808.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260616-topic-8180_disp_power-v2-0-167785993231@oss.qualcomm.com>
References: <20260616-topic-8180_disp_power-v2-0-167785993231@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 16 Jun 2026 11:08:48 +0200, Konrad Dybcio wrote:
> Let Linux control these supplies to both ensure a known state and allow
> for some power savings.
> 
> This series is compile-tested only, but verified against schematics.
> 
> Resolves the following kind of DT checker warnings:
> 
> [...]

Applied, thanks!

[1/4] arm64: dts: qcom: sc8180x-primus: Rename regulator nodes
      commit: ae51d9396f9318189e91578878409d8ada152edb
[2/4] arm64: dts: qcom: sc8180x-primus: Describe the display power net
      commit: 80bf2eb87bfbf1b7bc7b12228cbcc710b0a26275
[3/4] arm64: dts: qcom: sc8180x-lenovo-flex-5g: Rename regulator nodes
      commit: 0b1c6d2a65fc41aa0d5f6617dd04043384678d61
[4/4] arm64: dts: qcom: sc8180x-lenovo-flex-5g: Describe the display power net
      commit: d5f5c089858f7accd1e4574c0c09d811e90eb51f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
