Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6F437C912;
	Tue,  7 Jul 2026 03:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783394510; cv=none; b=D5KFUs/XW+RZD89rsfreJgRF10ybAtKhiWYhZOX0Y0fRzwP5atqoxDbQVuyTb6orvNv0Sif5PUuimuvPCqEya1cXBGWJ2PC1HvQit9WbO46cyMgmUyVFZNWxEmkb+n9Tk+Qk3J4LBawgYS3p6vF880B07R1LB6MZABahEi56Lp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783394510; c=relaxed/simple;
	bh=JwK+h7RZ8B5SwQBusL+NUmmmqFar7YzhHhM3CniUMQA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LpyhUHVQ8ACOywmoRLoaqu+e2Z/uqe2zSBi0wRJ+AOwY2feBDf/krXYPGd3JafYYmGyDHe74BVnG4zvP/aFkT9h4QIAFCd9mlyPX5SKWFCbnNiLwDS7TZw97OPPw07D5ifdvw0N3/zz2ZU4JJrjuwA79ViQdALZkq7bgjMsCffw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YKtp0CLS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YKtp0CLS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC2A41F000E9;
	Tue,  7 Jul 2026 03:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783394509;
	bh=bgA1gKP6ZYIPuLheJvK9+zwKoC7LWez1LN3bdTKdjfM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YKtp0CLSf7pFS33AnLbRJC21dvvwvCBCbuKYLfJxz9bFkmXqVA1VJ2Ec7bqPvG6gN
	 lcKOMjU8BZlNEnxMhIrOsoYtJnrS20lP6fMb3GzzcL7tAbeYJZ88eXUQVLPdlU6x7q
	 c/+4Ca+QKo1yx2+Z6KpGT5sNukeNpbQOepw+5MLjCkLaIODdVeasXOuzXvjCw2T/LD
	 n36WpSF3541IENfMDMW8AdbUm5el8NRvbVptdKEt+LhKdyvzUhe9RudXiMRtAC4CvU
	 +HZ1H7VgMZI/qLvUnLb/h6veuB3Qp6k2rvpfDR1Bzg2ACbtJHrCo6zCWTuGe6mrC0B
	 fCzD+optF4Azw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
	Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
	Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Fix unit-address mismatch for spmi_bus2
Date: Mon,  6 Jul 2026 22:21:24 -0500
Message-ID: <178339449922.1938770.5251861233824750421.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260518-glymur-fix-spmi-bus2-unit-addr-v1-1-27d6edca51e8@oss.qualcomm.com>
References: <20260518-glymur-fix-spmi-bus2-unit-addr-v1-1-27d6edca51e8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 18 May 2026 04:16:17 -0700, Gopikrishna Garmidi wrote:
> The spmi_bus2 node was named spmi@c48000, but its reg property
> specifies the base address as 0x0c448000. Fix the node name to
> spmi@c448000 to match the actual register base address.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: glymur: Fix unit-address mismatch for spmi_bus2
      commit: 82a766b68cd4d323b302a28082fbb7924f1146e6

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
