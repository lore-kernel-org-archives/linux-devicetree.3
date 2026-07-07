Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF35306754;
	Tue,  7 Jul 2026 01:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783387660; cv=none; b=pbMr/VlPsE4li3+m2XjzmoPPwfVfiQ3Qi32eQhkb4+tFX0b7uRQZgpIdgM7HUbRVguph/PkjGGvkyR9y0LOW0wjeNFsMEC4Y4kXGXSrIUBKIssFeltDpXNf9s+Bi7Jv/LrrRATjjs6BSStxJgndHkvlioXlB86XaXvaE+uoIsoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783387660; c=relaxed/simple;
	bh=qQ//YgLqWkdgNTemrzuyrW8qhJcuPYPlkerL9S1lCqc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f4Vneb0FWNDAPeA0DGYH1pwachR8+VTJ9P65+FQMiFrW7v+ntWEzarVRfph6l7BJ7jys0s/MnWokRbTCj6qyxbh1H2cMn0BdjiZYbD7TyjGbc/r7VOgrvSAeqqvCIlefNiVPpljWJdjJiPIB6mipePHe+6XNPPCdpcTHNd6dazE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hR68eRHR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hR68eRHR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CEB71F00A3D;
	Tue,  7 Jul 2026 01:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783387659;
	bh=4Hf7KqZHVlyxFiYu37JviDfthq6mPbb6NWioe0kIXso=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hR68eRHRe33+4XnCRKJgJOeFu/8U1OElWi4/ckH+g/g7urHoDwfptDqm2APUe1PPB
	 DvnDItRSeigLzgTg9zhhje++A3rCkHfY5XOPcAOzo3MtJxZEcjtYeqWzOh5ZG8ctnS
	 5VMLhq0L0RDPpe8UbJMj4NlfpNdpcwsSuMcmVEHR2Z9DSbLD///QbqZXfskkOsmjZB
	 jEzFfY0caMvj/Kwzcn8hsi9hgBzhd7ILUMBfHzOxOD85y1GR3dvy1vBbEqUSmeDbzy
	 YpGHn2AARkTB8BvztjUjIyTBzP+lQ1H6pUtR5g4g8S7byTSzHEZjt53Piwawo68f4E
	 8cRoeiN5/C1Aw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: monaco: fix wrong connection for the replicator
Date: Mon,  6 Jul 2026 20:27:21 -0500
Message-ID: <178338764561.1558388.5255029073758911485.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260428-fix-monaco-coresight-dt-v2-1-2293259bbd10@oss.qualcomm.com>
References: <20260428-fix-monaco-coresight-dt-v2-1-2293259bbd10@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 28 Apr 2026 13:54:21 +0800, Jie Gan wrote:
> Fix the wrong connection for the qdss replicator device.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: monaco: fix wrong connection for the replicator
      commit: bf949e86fb5c3034b70b62c9ee31b3d88d5f7fb5

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
