Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE28F3DA7DF;
	Thu,  2 Jul 2026 23:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783035656; cv=none; b=nqkbq5AXnGa1lamp30qTIuIs//t5gNoCRF6GsivdqZzV+RcrXDrhLvPAxa4NdbS6Q8R7Nz2rPmhC0o9Naf1byEXprFCaxaqKd/IQFsu5iCOi/kVTT/n9fYKYVc31N+2S/3NSF0KQ3C4nSwIKIBLa7S1hLcHv9pxsIL/YKXE+Mgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783035656; c=relaxed/simple;
	bh=pztJ19jlPAtgWGVSEFTUUCgRsq8sTNZBrS1quCHAwes=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VBj8uDhxcmQAHu+M00RgpEIJfs++KJ/WFq1mYS173zV1MG2REMCeQiX9bzQtEQEs2irKyXMGxFGBOv/Luklcvb7hGLXyYR85qz/kidVnoJx9qkzKpNgReoqtduW9RDPXIK+2GBbf7uscvFymruq33LgGigEo7RiX3Abb1jikrQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aQrFmYBl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aQrFmYBl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7F2B1F000E9;
	Thu,  2 Jul 2026 23:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783035655;
	bh=RUQ0Y731V6yPs3oo3sgrZrZpdbfQpaEpVQMyLp14hbU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aQrFmYBl6p1YJQHL25Pxpkye+hSUkfBP9j+LOCNwScWcf8BHUxN/vtleO9po069Kv
	 xtxMuFg5uULPfHzE3cNRT9Y8yPyUQu+/EZRtE388FIYUjhiJLCKmitEquvMCnhOTj1
	 8+B1JuofItv3ScQFEz7qAwDKJSZ+d+f0JHAb8ISTFfiQ93f1TYuY330IQJyzIXMWKo
	 RLywdcET5JySuRBvExIiSKfU8BXrMBq6fADhsYQAaJbzEH4KpcQm2CBcpxIN+zlVmQ
	 RMd18tRIOPsf9Xgg5KoMPqVGHbz3yqwhc8lDn5LWEwugUxrv5SU0Xc0w8FzKh+BZ1r
	 9iADfMiy7eacw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
	Chenna Kesava Raju <quic_chennak@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: hamoa: add audio PD remote heap region
Date: Thu,  2 Jul 2026 18:40:29 -0500
Message-ID: <178303563659.359079.2513826567660107542.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260418-hamoaaudio-v1-1-a92866f744a6@oss.qualcomm.com>
References: <20260418-hamoaaudio-v1-1-a92866f744a6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 18 Apr 2026 11:38:15 +0530, Ekansh Gupta wrote:
> Reference the reserved memory region for audio PD dynamic loading
> and remote heap requirements. Add the required VMID list for memory
> ownership transfers.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: hamoa: add audio PD remote heap region
      commit: 30ae66afcacf1a240ed4b9ec0b71d3316f3d3842

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
