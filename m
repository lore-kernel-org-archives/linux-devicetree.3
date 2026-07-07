Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6362535A381;
	Tue,  7 Jul 2026 03:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783394515; cv=none; b=dQST8EzUqgpRoOpPjt3ttGakrhiv6ET2RLvbKWwOOb7Wi6Uti8vIZMR+Hv6xYvPk72kMEk1e/JNvmAMP/ad5I7ceF+qvG+WWr1sFizdfv0LzCrPYxx4E2SbXhmpUE441xdNfAS7uZ2c9u5EKTWBhLGOH/9kPINnDj3FVQ/t6CqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783394515; c=relaxed/simple;
	bh=iiS/2f2/UhwVpt/ELxkZaoXdgri6I0uPNMU0M6IuSh8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YvYuRUA2F8MgPINdNoa18ZQiVjcP89rEGCv0umUssP8ToIHE6Xg9OoBFsTTvboIja4YbkZl1rEc+n7VL44ACEM1rModAaGeRSWCitM9FWRw3U4SHEG+g21bQWsbUuWcK8nHK2/oHe6jBz3+w7U5KY13QOx7z9EPSAdIPgJLwJCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ecpIew3l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ecpIew3l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3260C1F00ACA;
	Tue,  7 Jul 2026 03:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783394510;
	bh=1dIVPtImX7jLIE24GWrUX4aZFUn/4c4mr+A3Hzlpmfs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ecpIew3lZggl1SSmL93IvWvDOeqKImC30c+Qeamw1AaauxvTVs2Kp6YWOVJmQZwvp
	 A3B5eLAbWgRlakZsqRtYqDIydIyke8/zMZm5yFCPE8z27FBZ59mPFAlji7GNjXePtB
	 sH4L/+D34GAPoyFeZWpxcmawx1lh1VMlSTSKYmo82hRVwYVOrbSWlfMHknZ/j4aamz
	 e6VSzAjMzPcwBrAvTJc3j7Js7B83w7wh+mQHMU5vZrfVZv5JEV036sSln3xOqHvGML
	 URR5sfdAvyVKnUsCmzeb6X25JTbG9GljU/WkVYdkc2dHaXGt7Kl698k8pOO7EDQTYb
	 NxgAAmjC3blIQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sibi.sankar@oss.qualcomm.com,
	rajendra.nayak@oss.qualcomm.com,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Subject: Re: [PATCH v3] arm64: dts: qcom: glymur-crd: Move common board nodes to shared DTSI
Date: Mon,  6 Jul 2026 22:21:25 -0500
Message-ID: <178339449913.1938770.2225743388496970441.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260629-glymur-mahua-common-nodes-v3-1-98cc00943359@oss.qualcomm.com>
References: <20260629-glymur-mahua-common-nodes-v3-1-98cc00943359@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 29 Jun 2026 03:22:57 -0700, Gopikrishna Garmidi wrote:
> Mahua CRD is pin-to-pin compatible with Glymur CRD, as verified
> against schematics; only the external peripherals connected differ.
> Move the common board nodes from glymur-crd.dts to glymur-crd.dtsi
> to enable reuse by Mahua CRD.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: glymur-crd: Move common board nodes to shared DTSI
      commit: 711e6f11640f800f649d416b260c7f8555b0c955

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
