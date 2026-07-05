Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230FB3A83A8;
	Sun,  5 Jul 2026 20:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783285096; cv=none; b=tRamPEGJHjGp0kU+w2QBpWoSuR150bqMlb8BmLDKYZmm+LueI0H3roDXAb2IkMaZxrn7hzp2pncysG1zaWeObDVVRfRYGClfZXmgWuqktObiqkbcNvhMgs1Ifc9HovjFfC92tOwnlC83SO67JJG4tTtXCFU1o84N2K6HbHzSA7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783285096; c=relaxed/simple;
	bh=VwwHoIss0frRDJxQmQ2BVmx7EueTEibiuY89lnGIm8I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=vErRo8dJCq70rNxqWjmtJtTAehqq9ByLgdMZXKJrahJHAbPDAL2f8tDS4HGCrYonLcc9JESB4m3GGV9PnpVQDdWYLySaSFYUR2SwcZQmzpMtyonPboKPg9U7drGwwsmlrxVIAvd4C8eXtlVmhlPo8pk4oU+0irFKGtxxyXmQnKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YF1tD/Fc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YF1tD/Fc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D4F61F00A3F;
	Sun,  5 Jul 2026 20:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783285095;
	bh=g1awgb9U5Ce1AtxDCIAvPJsraFnJzO3wDcFsgF/B2+c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YF1tD/Fc1L9CrjOdJHc+DxfkGqEy79ayOR61qDLlHO4pwzcbtCKNHrW53/4WVBlfF
	 FfT1zfSGCRFkoKMFhrYk3EFpmV+xB6+C5cHcaZMWJRZhyQd8D0+9tfQuRCdIJzdhvW
	 l/uOv8zNiimlvDGhPsiRUdZYn6bIIaajg3/bxlx5wPxd2NeTB2vMLekSJevC+NA6A3
	 OlWSdEUkvLI8Yq0bnudMvds+DI7ovTr/cve5h5JYVOHUjUUusFNfucPrG9bPGhpADT
	 RC/gObrH6UqoeM9E3A59xtmMT90Wj0aC4pVUluQtQSgBgw/eCbydgLwjO7WIDOAYZ8
	 6Tnvcj8mlXKDw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dipa Mantre <dipa.mantre@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: kaanapali: Enable cpufreq cooling devices
Date: Sun,  5 Jul 2026 15:57:53 -0500
Message-ID: <178328508288.1157743.9115805131090198438.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260415-cpufreq_kaanapali-v1-1-1fa94105d5c2@oss.qualcomm.com>
References: <20260415-cpufreq_kaanapali-v1-1-1fa94105d5c2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 15 Apr 2026 16:27:08 +0530, Dipa Mantre wrote:
> Add cooling-cells property to the CPU nodes to support cpufreq
> cooling devices.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: kaanapali: Enable cpufreq cooling devices
      commit: d9b05c984304740699d7e47625d5e093b014c76b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
