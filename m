Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DCB44EA378;
	Wed,  8 Jul 2026 14:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522657; cv=none; b=ZcypSSipp4Mn4MrO2fcRQ3wNFp7LgOq4xDfmfnB53SZjAlpQRxELOrayheXj/blejWMM3RF7eRJVvdV5H4yGHCfoYisFD7VBbXkkFniMNd+asgaB3CldAUKLf6EH831RxYBfMhSf5TApdL5s4SqXoAhOoj1JZCN9FMBMfFk/xk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522657; c=relaxed/simple;
	bh=7DuLmoZ3JOq+FSpqkW+ho36gDdlB8c5x/Hf/Og5X7Sg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uj/jk3zHMEM46CKJQDtDEugsD3ywz34Kx8PNreoRkJvjgQqXzJ6dgC/F8/8CU9GVSX0BH3xyYGUFkzR0u+cF0v3tDEu5dzTHgh3Zy+8diSl3I0rsNS19B0CHusdA9wDRTHcBFWMGoUyuJNvdE71NE9uA2pMT3mLULl1HegklgPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GP2zpB4G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GP2zpB4G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A729C1F000E9;
	Wed,  8 Jul 2026 14:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522656;
	bh=mbCH5BJDh1R/y0cuJTznKmYCGZG5S6O0DygDJhtgiew=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GP2zpB4GHrSMq7VCDgMt0qDFu8OF/eu5yfwtOpbRsjJPc2eDFMn2gvE8AdycTM7De
	 fvG++9FNAvjX9Y/U4P6C6sG123xfHwvq5rWzQqB3BXLWbo0/lxGQgp/JUEjOhnIHn5
	 ANU7A5K/ITHkJSFMYISVMHoLE6c2E06cOQ/9Zzwr4FP8Vu6D0wkgvuTHl/1ZOaRP/Q
	 mH9p7JdnGMOTpLqHhp+nlG6VbRkHqfGnfHlsqwCPtZklBnh7i/aEDU1mdhDs7gFCZ/
	 OVoPBW6nFJmXt0684quXawEGnfSY2svSP3LDim3MTu2yai5diXrr+/DgaXhnaT0p4u
	 rqnnqjoitiMXg==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: monaco-arduino-monza: Remove duplicate includes
Date: Wed,  8 Jul 2026 09:56:36 -0500
Message-ID: <178352261632.2235436.7307330554640301445.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260617-topic-monza_includes-v1-1-fcef9ce489fb@oss.qualcomm.com>
References: <20260617-topic-monza_includes-v1-1-fcef9ce489fb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 17 Jun 2026 12:20:26 +0200, Konrad Dybcio wrote:
> monaco-arduino-monza.dts includes monaco-monza-som.dtsi, which aleady
> includes monaco.dtsi and monaco-pmics.dtsi. Remove the duplicates.
> The resulting DTB file is identical.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: monaco-arduino-monza: Remove duplicate includes
      commit: 81a1e944d3b8322468e95549a9c5aed4fc3465d2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
