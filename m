Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DEE5367294;
	Thu, 30 Jul 2026 01:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785376548; cv=none; b=dsF8iqvOjK3T+HLyeHzOpg/7zCzlIik6fFjMhB/2vmqhMFpT3TKKpHjLpC/WdwXo6JteFv7nkDXCwTNQcBSH5Vd13oskVKAJPcnuAr1VvQmbAuzC9WmG1/ZqV+siL0qBgSCR4C3DaRunsmnDUJTnn+yzQiJgm2kxAVvc/aGGgik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785376548; c=relaxed/simple;
	bh=FvixKuUNbeQE17IENt7eIjjv56mys5W6UNfC40fmG7A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=USG4eBNq4py7Nkk3xXIXI9LM7TEqay8iKGX0aAlwasSVlaOTzptZzOCjOL/sT/JqCQaluDMXmnUlyaRzEgRcWRgbgnv6syMIHI4deG9uY6L64cnrw6XcSuDL5zomd6ra+w6OnnSP8s+jAUkZeITtoL1dOlif209mO+VauFpeffY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J9ZMKNl4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J9ZMKNl4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BF491F00A3D;
	Thu, 30 Jul 2026 01:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785376547;
	bh=uyRdEV7Meerz5tZhALBsPwj7QC/wSKMM4DKv5eg0ztg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=J9ZMKNl4JBxnT5PATCpVZz5ApHGwh0gQ2FlLwpXjlTKK+s27KLiskBPFPLZUT4Sem
	 80PzIawG/S7Qatfad1S/D7BX2vRSy9yvDYKQusi6G3T0iTBi6aIvn2RxWqCZo5R04P
	 otRnHrS4wDGzcC1scoc87/G8wOZEzs5GVIJWNycwqHaBDY2+C9ZwXuf1w4jMgG/MX5
	 bK93O1sRT5KTSmWhp2j8vXMwOEy4WMFBbepyAcXWX8dRnUZ0x0QVkb68r8jxy30NZg
	 WlTL7dRA7Mw/D1VClx4WyBytqt7fDSEAJIFg0tXudZKVKpu3vmAFczweFziNvO3V11
	 aOFK+WWmZAUKw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haritha S K <haritha.k@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	gaurav.kohli@oss.qualcomm.com
Subject: Re: [PATCH] arm64: dts: qcom: eliza: Enable cpufreq cooling devices
Date: Wed, 29 Jul 2026 20:55:38 -0500
Message-ID: <178537653466.67965.1555863474926555449.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260724-eliza-cpufreq-v1-1-38f01e47f0f1@oss.qualcomm.com>
References: <20260724-eliza-cpufreq-v1-1-38f01e47f0f1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 24 Jul 2026 10:46:27 +0530, Haritha S K wrote:
> Add cooling-cells property to the CPU nodes to support
> cpufreq cooling devices.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: eliza: Enable cpufreq cooling devices
      commit: 4baf28ab6256259bbee8bfcd9611d590992186bc

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
