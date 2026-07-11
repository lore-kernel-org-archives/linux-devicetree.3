Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9D0341650;
	Sat, 11 Jul 2026 19:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783799414; cv=none; b=Smya8FHTUBwCm/Jb6/XOewjmhrgIby60K5o3KKcfCHX1JA3rwYVz2zBcd9z1ZgRuyjwBCwgy0aovA3vCETN0YBCzmoiaA09+GWQfL8JqxiFK3BP3mWjU9UA+EIKvsWDJCVZKis83OJGPrqIdVlokBHWx/eRFLV0yVQKy0AZDShI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783799414; c=relaxed/simple;
	bh=LnmGk3K0XGyZVi6F13cwZR++4w9/+KgUOhCfgX3MN+4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XtsPWQA4h6YYtOpF5dN8k+j7CZLUFSgFiKMpSg0DCexDaD/wPZt2yQvK1/rfMduE8ZPdu4ZqFUlkxsGaaqX/+FHZbANNtCFgtBVwtC69x0Q4uUoYkSdEjKfag+r/HdWLUGw9CWt4kEyvipCEpNX2HxzHyWgr6HaZO26Th+ny1i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VPtBEH6f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VPtBEH6f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62D711F000E9;
	Sat, 11 Jul 2026 19:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783799413;
	bh=zEDUAS4ZIf7hFydb0YvfRpL6FyJCsFw9LtFfoBfuEu4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VPtBEH6fmObO23HE/AO6TkG1Bj5fsErhOlRCvyH9CEBmoy2sIjOxygMGJQN+rEVkc
	 TzDUyxn/lOFfvuR8U35sB2r92hvjApdy91HedsaR0amAdajGHTkyY7wcHUCAeiWunL
	 wVaFRFC8H+SYZj+97U2RfzDskWgpxHSnJQ7bFufGuv39Ois9Eg+sr0wA8zom1bXAjZ
	 j87TAWwUR1HV84Y76G+Uf48Ih3NgZluyPR9yO82zhBfU9Pd6n/HdjXDImqCZ0/IcNL
	 eHW1Z4iaFKMB4TWWaoN4HtOGqsLQmFt62YDDdjbk7UO15aXzGz1Ubey9u+Bk+ch9PS
	 ElSFc+NWm3B3w==
From: Bjorn Andersson <andersson@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	jishnu.prakash@oss.qualcomm.com,
	kamal.wadhwa@oss.qualcomm.com,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: (subset) [PATCH v3 4/4] arm64: dts: qcom: Fix pm4125 vbus regulator compatible and constraints
Date: Sat, 11 Jul 2026 14:49:51 -0500
Message-ID: <178379938599.163099.14937825832505451907.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260706-add_pm4125-vbus-reg-v3-4-999d78a87b81@oss.qualcomm.com>
References: <20260706-add_pm4125-vbus-reg-v3-0-999d78a87b81@oss.qualcomm.com> <20260706-add_pm4125-vbus-reg-v3-4-999d78a87b81@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 06 Jul 2026 18:01:08 +0530, Rakesh Kota wrote:
> Remove pm8150b fallback compatible from pm4125_vbus and fix regulator
> constraints in qrb2210 DTS files to use microvolt instead of
> microamp.
> 
> 

Applied, thanks!

[4/4] arm64: dts: qcom: Fix pm4125 vbus regulator compatible and constraints
      commit: 07801dd72ed290dc3f2030df90c8b4190e711020

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
