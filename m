Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A095539F19F;
	Thu,  2 Jul 2026 23:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783035655; cv=none; b=qXhFzQeFbHXCCwlDPxgQ1feftr1VihbGSYN/OC1Cx/CVDKnll6X5jtGuHAD+mP3olAJLCl0S2JMijwfS3JK9P1WLB19XYuzoV549+0oGO3s45XPAXub4HnBn2zBPZklYi8bxDYZyvraCmTW8WOlkcGaG1/SPPVbxUcxNTouikos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783035655; c=relaxed/simple;
	bh=+fcAw4/CtqDerOCmfEtT3LXRjWOd+Z0FhqRS3UHfXps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WqBQkbjz5a8u0g1OGSfFWNoFM/RFSIARB8cO1VPP5Bq/B2prLCVmlKAhUQM9NSvpIk8Q/y2IvqLBAYaORqyCErg+PkvbDdgsafqDO3aIR/oImoTxjpyNsof/0nHbCmfXt7cbxDBic1yYDbiYhMBJRv+1UdvAVYJsOXFcbFsc+3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j1ANy1Eg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j1ANy1Eg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D8101F00A3A;
	Thu,  2 Jul 2026 23:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783035654;
	bh=83htNf5z4kFqh2NAevA0nwIACvQ+W72D4tNe1Z6BnSw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=j1ANy1Ega/MBCPWqrh8B+pia3qwkVVfe2J/ZdvTjFkKpmTjWO6i7EAUfdp/sQaZ93
	 sLc+Qcr2Czz0FD8u3cyjv6a/Ta497Drslnwfj+uIF3MSImxenfPssZ53y/Pg6/cmwa
	 1vjK/OEyMlnDLUr+jHVikeBjEvdTAmpcjR1EUKdnlUBh8r6m2prrAnmXRprbCaZMKQ
	 oRgrJAUZ47uRbo3dut2oJRqeI8FKu3BSO9KFH1O8kplO1ATYa+XBnch1oVZvDeqz40
	 5pXDM9RHKL4NVSB5zBxY5cfi4fMB0qabqjap8FQlIGKOwi0Kh7jyD/DbcC+PUy8k4P
	 h3DyaryiQeoPw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
	Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: glymur: fix QUP serial engine IRQs
Date: Thu,  2 Jul 2026 18:40:28 -0500
Message-ID: <178303563640.359079.9176166516482452879.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260611-glymur-geni-irqs-v1-1-269428faeb6d@oss.qualcomm.com>
References: <20260611-glymur-geni-irqs-v1-1-269428faeb6d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 11 Jun 2026 17:22:37 +0000, Bjorn Andersson wrote:
> The Geni serial-engine interrupts from QUP wrapper 0 all fall in ESPI
> INTIDs space. While some of the i2c instances has gotten their
> interrupt specifiers corrected, even the other functions on the same
> serial-engines are wrong.
> 
> Ensure that all the serial engine interrupts for QUP wrapper 0 matches
> the datasheet.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: glymur: fix QUP serial engine IRQs
      commit: a74a98f956ef8e075f28d58507bc5dad7f937fb4

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
