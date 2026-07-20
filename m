Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC4A445AE5;
	Mon, 20 Jul 2026 17:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784568080; cv=none; b=uwnzSv6noIkiN5RBRhsW8klz8wmkp3ey9RVrPWc+jISyvhuN4rs7PxOSKOnxhJJdpGzuWJ2P+Pk7YwVxI1ww/XiS/M8O8EVTglB97rj7pnD99vDePZkIKYN73P9tr3x+RFKajHy+i/hu3bnE0PGUPoJ0J86+chE9kDTe8uT314w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784568080; c=relaxed/simple;
	bh=wfLU2RDh5YL8OTg0DLFgZA8JS2pQcNV6tv4bVNHLDgM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NkEcL5bf5F1hrS8NHZfrdJtzZyK48H0ghuS/7Yw8uRv2Z8in6xx5q659evySSTBF9NmB33nx5fcQnDn9DaUBXzWVIYPLtHowp5xiZR9jcQwJHawPwEUOZQIbsiMpPtqJBi9ojhTr3F1KIkIeJMk61mkiJkCEU2/1zMMkArJ4TS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VeWKGtfq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VeWKGtfq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD1181F00AC4;
	Mon, 20 Jul 2026 17:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784568075;
	bh=YKHAfmqJWZELO+EfOC6bQ/Zv4km080a1AM+MB8VEwgA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VeWKGtfqjtZg4ENPd6ClNkBPZwIO4Bo+7i3AWgE0dFJtq9RHYKdR2iV1V0ncow+Rr
	 1g9g9iTM83OKf6qWHuNXGPwoN+7B7Mui1XyIowCQPnoWkN/G3PTEkryMtuyY/XKLQI
	 7nnOWUeTDX3asUpjrPA8X2sz6GUNcZNw5B17lKFGmnmJgkDWTGQDAd0N1nW7YJgRn9
	 Ecx1CpYFRjovMq3/knQnyARF9qmyvFJuyGPrijtQugmlg7nDjU6e/jqg161X9JEGYq
	 EuGlkfrOuyNkn6koEsL9zUeuaZVSFvO2DU3X4YTJssX2UkzbCbkD7/BbqppozmRKWx
	 GdQKnI4JfQsnw==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 0/2] Glymur DT QoL
Date: Mon, 20 Jul 2026 12:21:04 -0500
Message-ID: <178456806274.1732507.3813707168757572071.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260716-topic-smb2370_port2-v1-0-83d02b2ba4b0@oss.qualcomm.com>
References: <20260716-topic-smb2370_port2-v1-0-83d02b2ba4b0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 16 Jul 2026 19:33:41 +0200, Konrad Dybcio wrote:
> Two tiny no-dependencies changes that have no business waiting for
> other patches to settle.
> 
> 

Applied, thanks!

[1/2] arm64: dts: qcom: smb2370: Disable SMB2370_2 by default
      commit: f922f586c67d2b2c5d476679a4afaebbc4126817
[2/2] arm64: dts: qcom: glymur: Add PCIe port compatibles and ports
      commit: e9d928da6f25e2c0d926c15b66fab52602e86f8f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
