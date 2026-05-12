Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00DE3CA497;
	Tue, 12 May 2026 20:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778617414; cv=none; b=OIxq09uw0RFUPDSiAQOF0bpxc6eJF5R9k+vipzFmNJbMgs67dpEdMBe32E0NfHtqPxuGQbwwiAO5WVPbs5ZXMmkg1qLWQedGt/unt+bnATd88vcL9SxfMFSWzDq1s0Qrc8C8tVlKlZ7fgSRCtkOhSMPPXcyKFkmy21T6dwrwOs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778617414; c=relaxed/simple;
	bh=xC+MIySvisbk77hAaKAEPPC5F82a5RSCXd/wKgjGcMo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qDsi87JWX5CK/M4Aivka/2qNgPZa3pQjwiJf4ocLcIDac5augdO/h+iaMVx0+Bg96wwFz28ZicTD5Y47LF9iSA20yKVYiPXlCjjgQ5hwZUqZwJK8xRTMPAzGihCX0hcX1oIFFvG3y+5o8to/PG7qE7QMNhKnmCm46/oXkg4lpno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WKusWVLm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WKusWVLm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0547EC2BCC7;
	Tue, 12 May 2026 20:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778617413;
	bh=xC+MIySvisbk77hAaKAEPPC5F82a5RSCXd/wKgjGcMo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WKusWVLm+RT/THPf0YiL0Ou0xn4TaHqzcNXY3x4AfJqG2pbiGFloJ5KfExHDgfxOC
	 nsq/bNFePTQEr6Xb6BadPsjto8PuuD43aOCwV9Shh2hDp/XFl61KlpTjXPA+zcoM3S
	 LygwApY/GKc7s49v3xUM5EIQsKRw+N5B8SlcBVnWlEqOCOOsrURIqlBwq8rkjGCG0q
	 7DIQX9EMeMSmtHJTjMKPEuQtvkvzpn4rmFKf3wFpTbt1qre0Ly7Wy3keTmdT9t2lEF
	 QPnDMPee50YrZ4C4ZAC7vZzRLnDtVbdzvtlrijnmmU0ebGs754P7I9Gb5XK5/z5Ctc
	 Z5reDYXutPc1Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haritha S K <haritha.k@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	manaf.pallikunhi@oss.qualcomm.com,
	gaurav.kohli@oss.qualcomm.com
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Enable cpufreq cooling devices
Date: Tue, 12 May 2026 15:22:45 -0500
Message-ID: <177861739380.1242344.12288912445885928325.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260507-glymur_cpu_freq-v1-1-d566cc1d32c3@oss.qualcomm.com>
References: <20260507-glymur_cpu_freq-v1-1-d566cc1d32c3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 07 May 2026 11:59:50 +0530, Haritha S K wrote:
> Add cooling-cells property to the CPU nodes to support cpufreq
> cooling devices.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: glymur: Enable cpufreq cooling devices
      commit: f5fb358c7d9161a6abfd2c619b2999c7e51cd2fe

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
