Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28CE73B71A2;
	Sun,  5 Jul 2026 20:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783285105; cv=none; b=AfHET2gocBrpldF/qyn595jVKGbs+IWML2A77oDc3cQ0E3Ikch3Cu0pbW8+L9pWtNkOZHF68zILC+5j7B900yv4NkQGL+gworERHzCYJtX7FCx6fiGGPIGRlnTiUvg3QIauaC8NXII8OxduT5k82DOARAKI2II+vlAIP08kPDys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783285105; c=relaxed/simple;
	bh=c6TzxFw05L1dTnesHKTj/fYvor3uy5ZrSlb/2lLuhMQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mdKao/4ooqKmoOJ/oFqYtgR/E9D9lqhvdC/0KH6cfmDRY8ztoodC5dcUssR1pJ43waInsDkcRs0r/zOf7WXMgQtkGTqGplndbTYn5X6t94qLSXIoZoye+y8b1SPwKhk7PIrxHFcYASMGaB7bk4bLqpCTQWkqq23iFUkuBO8+eKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cm5ikTc0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cm5ikTc0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E6271F00A3D;
	Sun,  5 Jul 2026 20:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783285103;
	bh=5wAgRnzimfEIO0Tbp1NN5VpxtK8PxhCwRpQkKDCuZx4=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=cm5ikTc0ivMX8xdKTDXPF9GyLhzZ1xe+VTs5T889Y6ImpMC7duo9hHcG1ofAw6NYd
	 jcYnLcCf+sSf+9jAZc2qnMYI3GK+mQKyqWx9+TirgfpHbSCFGlqE/O5ekzPBpKD16y
	 jUr9NeGbzTGpsbtEWJ1DsPvUkZgQECtxtRNZL0F5Y9BZCepFlbySdijJaYXyjzeOTL
	 jlHVFff6LRcEbGEgGlpwBFLR5SXreWOuMe2tOEIb92II6iaQ+cADBHE0xUAGg1Ku8r
	 oVybvigEeXesZRR9vaO5fgyQV40nRdCp2oRp9UNYeGzHkcQuFbPd3kRqssKPT2cyOP
	 fcCsygH/kjZ7Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Jie Zhang <quic_jiezh@quicinc.com>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: talos: Fix GMU unit address
Date: Sun,  5 Jul 2026 15:58:01 -0500
Message-ID: <178328508290.1157743.2833912632671195589.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260528120342.46343-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260528120342.46343-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 28 May 2026 14:03:43 +0200, Krzysztof Kozlowski wrote:
> Correct unit address of GMU node to match 'reg' property and fix dtc W=1
> warnings like:
> 
>   talos.dtsi:2020.20-2055.5: Warning (simple_bus_reg): /soc@0/gmu@506a000: simple-bus unit address format error, expected "506d000"
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: talos: Fix GMU unit address
      commit: 34a4ec6910e68ce06eb7201fa36778ca59a1e510

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
