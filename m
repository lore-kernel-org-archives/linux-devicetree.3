Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23CA355049;
	Fri, 31 Jul 2026 03:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785468288; cv=none; b=DSrm7E3ZLVK4NyfZYqmti86FTFnR2pFbVHArmpwgYcDJngRMXOYD5lnbw0OweM9NK73P7K21ZYZis7WETpQT4A18CxPSLjoYefjFiFa9z8mlHxRlx9YhiXj+bEcljlPc+1SvhLaJq1Mgsgc13kcw3S+O5BvNJ3k1d2D67EcIb4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785468288; c=relaxed/simple;
	bh=yk6WxIYd7j5LpE3rhNyt2/qa8x+8eNGFHvPojhHAoNo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XBa8TbiwUy7y3YbZy13jIeAvW1P663bx+hVb4YH6pDseq+tY4vJKsNJTR83ATYm/WUzr19wc1fATYeI9iU+IFrW1qMAWUJ1WRoO6YW/F1foAPBOdVWG14+rzkpNIrZyuTFqwlKBh01PDJpZjMidXISFQO5sEAtbIhUhOWDvcQj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VcqkWZ7B; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VcqkWZ7B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 947511F00AC4;
	Fri, 31 Jul 2026 03:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785468286;
	bh=hL4bbSVuWpOVRJbvQ9wKhLJYnk7XkSc9qs0wqCWrx3g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VcqkWZ7BJTxaVhLw/QyNYeOykWSlK+5mmnzj/9Gl4voUKTMWF5zh6cD1EqkTuK5lP
	 GK1c11thFiWetchfhySvHC8A2TKkWQ2mHYoVcrPPGlN8Jh0ZzjQsheZVngTVngdu9P
	 Oi3QBNWo3M6Z+DW2FYmC3iYZwAOeXJEw66bY8R9sLp88ckQQaXkCJd+6vDbW7hK3PI
	 woGrjmhBCN9SScmfoHTf7u7o8i/1SmtFCOKunJxP0ypRrW4yqFw/v6XOxy6jHwcjFd
	 wmwSyId25oDWpBODROg+PxXcJ4MFebaLppCfKg5lwgfcwcbTZs5Dsiq00Jq8+6tW3Y
	 jDKILHbzrn2Gg==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Fix PDC IRQ mapping
Date: Thu, 30 Jul 2026 22:24:19 -0500
Message-ID: <178546826834.316815.11447489352959292983.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260729-topic-glymur_pdc-v1-1-8747789e35aa@oss.qualcomm.com>
References: <20260729-topic-glymur_pdc-v1-1-8747789e35aa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 29 Jul 2026 16:08:32 +0200, Konrad Dybcio wrote:
> Some of the sub-ranges are inconsistent with HW docs. Fix them.
> They are valid for both Glymur and Mahua.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: glymur: Fix PDC IRQ mapping
      commit: 1b0b6ddd0299efa29d18f68a2d7152ad67cb9576

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
