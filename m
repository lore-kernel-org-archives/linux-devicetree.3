Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7200C3AFAE0;
	Sun,  5 Jul 2026 20:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783285097; cv=none; b=hzFHcI5sOJMaUflejEOWPGfIcVDvM19TEjZ2rRvbNjgxhgWwcupPMD2gMoccfi04xtebhybpRhwNU96bhcK0/UdVCEemIgtqMcaY51+uR6QytWPHizv1Gh7IdXk0+/ljtUfBS7m57ZH891vWfuQZ0C0R4IK/hjB32GFLxu6SxZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783285097; c=relaxed/simple;
	bh=SnzMY4GeOULQDWGh9MY4DqNlK6BtUy+8ep7qqtAi1ck=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rhAUNwars3Y77uH8zkLYkV83jnPDsOCkoagC5KLGRYwHr3pqLRWgMDRMq1WSDLkZ9JAyQeoLktFB4zEbQ3MPoGyLcBQT74upfx0n94CRpwoyznEY+gyE6SL7nLUyzyjoS2gVr4pMc2bk2V19rwTkLnDbxQan4t2TB7BllUIbdbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XY7rzHzT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XY7rzHzT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 344EE1F00A3D;
	Sun,  5 Jul 2026 20:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783285096;
	bh=zCq6X1dlbF+t+eqnnLurf/o0DayEF3TCPF87L8CKbW4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XY7rzHzT/9XkZVvLosxNYcGKOHDM1RZiCn5FcyRZbh4nibpnmWpVurTI+sYZ+qqlW
	 uF9DITfi7ihZTXRyMfZKbGlecBp0e2pZSOGFqn/+q/LbX1oXaCBEUspT+lHOQPw2Nh
	 Nn1x1BZPlKt/MoAb2aQ9MvAggjZ9NSL+hBZFFHCcprKBnLL7fjFgTexSLFTclCFrLy
	 D51os1xMt9SgIzp4WLsS7BW4OTxKmd+3+LzBcfrb0hqNE50/IV0XJQl2NDBoelvoSK
	 0eYsYZySGB1arPI8kiXoNZm/mM+k7xM2OkRCPgAMlSfp9hNBBVopj2HQLAqyTEz8qz
	 eeKV1Yz7mDovw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alex Elder <elder@riscstar.com>,
	cros-qcom-dts-watchers@chromium.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stanislav Zaikin <zstaseg@gmail.com>
Subject: Re: (subset) [PATCH 0/7] arm64: dts: qcom: consolidate IPA properties
Date: Sun,  5 Jul 2026 15:57:54 -0500
Message-ID: <178328508284.1157743.15860736623678958445.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260517-ipa-loader-v1-0-3c3764c1b4a3@oss.qualcomm.com>
References: <20260517-ipa-loader-v1-0-3c3764c1b4a3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 17 May 2026 17:56:06 +0300, Dmitry Baryshkov wrote:
> For most of the platforms the IPA uses qcom,gsi-loader set to "self" and
> requires a corresponding memory region. Move those properties to the
> SoC DTSI files, handling the outcasts (mostly from the Kodiak world) on
> a per-device bases.
> 
> 

Applied, thanks!

[7/7] ARM: dts: qcom: sdx55: consolidate IPA properties
      commit: 273cec70d297885181977ad37a2192f73bfe373d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
