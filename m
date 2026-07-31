Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834552749DA;
	Fri, 31 Jul 2026 03:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785468234; cv=none; b=d1dd9LMgT+qzbd9w53eZn+og2/A0AOw0zXzAlyXojSGmvByrGy94l9p7JuZml4Qwt7GmHwPpQqdZ7aVUnj2cGb3jYIE0EhJ6H01TsufLas7eEDMGd6gjruePu1rxfOrKy9pNUeMtaajdvSLTYWPJXMfhb73B7z/q7qg07JFDtzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785468234; c=relaxed/simple;
	bh=cv8XLC6FqX8w2a/UWmb85ZTXRn7SWs92ROxeu6Rr75A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HyKPtE66FFfkr+qgkphkf145AdQ71ymjsv3Sd4LNO7kc/2bIAJa47xP+X4bb0revLxN8x+xmZAb0kGYnZDAZzyVLtVyoEdqC1/20tnxRhZ4vImLfVT+/8++MKTz+zWnFfLBwSIOeTWKLC0DSPBFuRcEDHZ+20xsVWCNJbEP2A8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KeGUSnbx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KeGUSnbx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A2B11F000E9;
	Fri, 31 Jul 2026 03:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785468233;
	bh=HwGWi5ftjpl16diBE9v4Qe+J+b89APq3/vJ6C4GEk38=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KeGUSnbxDfLwpbMiUWFP8BucRNn6TXBU5zkfN4AeA6+wym0c9bQ01/l7wXTt2R2qt
	 20DXxGVA71URz2U3kORTzBH0A6W5dBjFo4eaVL2o/vtcKkGyaVvQlbGkR/E8i4h4N0
	 MNfNQxGx9k9ncf0I08+SnMfxrUTATVn7oRFnc5YVvsJbBTvGJ9HNqJH9kYS+QP+YU1
	 F2w4H8D/tHdf8v4al79E5ahyRjCW/CUTfNYYoc61TnNgfyDD2orJTwtpZuRf/lKdCg
	 V1BcZLxCQFw61XqQooTFstCm2upbQm0/yWo8tVDSqBX+jHAyGYSS/CD8oYoGI+1Ome
	 pfabXKd+XuT8w==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH 0/3] X2EE ASUS Zenbook A16 (UX3607OA) support
Date: Thu, 30 Jul 2026 22:23:41 -0500
Message-ID: <178546821242.316167.11652252739177314939.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260721-topic-a16_submission-v1-0-8ea213130d05@oss.qualcomm.com>
References: <20260721-topic-a16_submission-v1-0-8ea213130d05@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 21 Jul 2026 19:11:25 +0200, Konrad Dybcio wrote:
> UX3607OA is a variant of the Asus Zenbook A16 built on the Qualcomm
> Glymur platform. It comes with an 18-core X2 Elite Extreme SoC, 48GiB
> of RAM, NVMe storage, a 2880 x 1800 OLED screen, and the other typical
> Glymur platform capabilities.
> 
> The hardware wiring is very different versus the 14" SKU - the larger
> one is based on the System-In-Package reference design, unlike the
> smaller one, which derives from a more common Chip-On-Board base.
> 
> [...]

Applied, thanks!

[3/3] firmware: qcom: scm: Allow QSEECOM on Asus Zenbook A16 (UX3607OA)
      commit: ca8c96d3187a11229b3bd44992a9bc3d22caf13a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
