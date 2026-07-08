Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C174C957E;
	Wed,  8 Jul 2026 14:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522640; cv=none; b=UgBOUa5ru+QbU8ECuwc37mc/t9ZHNKxarbdXzTUCyYfxXa1zCM2JZjufM6Zc7zJ3xgHb9CWq/YYssYdL+tjgqC3Wo1pcUpr20rynBzS5Bah2Il8jmP9TXhB6Vphx3A5GKjbUkCugXwbmMT6mbADgNVA8R0mFbCXnAgvJrUIRE7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522640; c=relaxed/simple;
	bh=/yhqUWVrWo6o42m8OKjkHk9oxXxqB6oLWj+aLPNLqOI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=byGnBG2ru9Hsi9SmOcHKOxAWRXjcVtS35nEVvo8vzAzZuoAGDwqZ92xfjhznZBmvQQcVxNv6EvkGGjHdBgXuRh+b2WptyJoLcMvOUvEmP3+a8WVz7iqoEquVCTS/MIp42uY/ZaLUqVnvNP5qUeGYh4jyiYAmOZBwI5Vjzd+iKz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cl+BmRHC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cl+BmRHC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B21401F00A3A;
	Wed,  8 Jul 2026 14:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522639;
	bh=F3Mu3/C5sMzl9AzcLpJV6sCgtG4I4Try0Vq3cQJlKHg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Cl+BmRHCLYBKRvTpkTJ2ts1aCXai+iKulAvgUBKyfMNjanDTbunqudcCY9U4T2low
	 FBhvBDYNNVAFX/OAkSI+Iy8GpbWTUA8/Q4LZhHEDhHYal7BLA2H1C0ZnpnxCdyDdB3
	 ZxsDwj2xc5Gmrubeh+XITLEwqwxPSi6sapgbhfngRw2HVNEHdJWiceGWaNmNpdqJm8
	 Z+FhjkPOaRxQtHfuyzcpHqcQos6llTZfVWVbmGGO5GykhU1JONlkMIhU1gaStpAX8M
	 5s7YcidMGfCysXq6l1eW5wL7GrCUj1Q2sKc57jFxyvclNSkGBp2ZXzyw3fQl0B0rMr
	 TMP+c7eL+x+pQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Add CCI and CAMSS support for Kaanapali
Date: Wed,  8 Jul 2026 09:56:20 -0500
Message-ID: <178352261637.2235436.16367939885864866010.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260508-knp-camera-v1-0-a18e289163fd@oss.qualcomm.com>
References: <20260508-knp-camera-v1-0-a18e289163fd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 08 May 2026 01:36:44 -0700, Hangxiang Ma wrote:
> This series adds CCI and CAMSS support for Qualcomm Kaanapali SoC.
> 
> This series has been tested using the following commands with a downstream
> driver for S5KJN5 sensor.
> - media-ctl --reset
> - media-ctl -V '"msm_csiphy2":0[fmt:SGBRG10/4096x3072]'
> - media-ctl -V '"msm_csid0":0[fmt:SGBRG10/4096x3072]'
> - media-ctl -V '"msm_vfe0_rdi0":0[fmt:SGBRG10/4096x3072]'
> - media-ctl -l '"msm_csiphy2":1->"msm_csid0":0[1]'
> - media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
> - yavta  --capture=20 -I -n 5 -f SGBRG10P -s 4096x3072 -F  /dev/video0
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: qcom: kaanapali: Add camss node
      commit: 7cc8ca0387f572a4d69941fe380e7a262342491d
[2/3] arm64: dts: qcom: kaanapali: Add CCI definitions
      commit: c25b80614c31a30b1b0f44fc5ae260aff90fa4aa
[3/3] arm64: dts: qcom: kaanapali: Add camera MCLK pinctrl
      commit: b6f8ecb80c1f894bcd0c612bf0ed4c5fee52d287

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
