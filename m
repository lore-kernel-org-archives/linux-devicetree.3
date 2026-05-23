Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6342A340A7D;
	Sat, 23 May 2026 02:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779502839; cv=none; b=HpfbJRZp+EmcxWaQudixWXhP+HHj3Afsq2dcc+B4ZE9axUlsirrqssLOmzAEXFHiPWQjiqwOlO/7DqTKq6rJ7orYvIjt9U3x8b5H9bTF+RH2NLg41tgGi99g8hHwij2ffIYP5oRValAv0COM48gNoCMPhl9cvlf3RD5Rv3p+SKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779502839; c=relaxed/simple;
	bh=6d6GiA+VGxcQSUwf9nyugQ3wIWutxzWE9RNGYhVUjok=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KGtQDdLkbZb7RV5uAimpJWqmNOljQKah0nb0GQXDKxgYiEMnSQiJkHD7YRyGw2j2FcnHZM7RrHjXVJaQJ6AgflanC8SsHSDtkNAkxYcQcZEBmWfUokbE0sXLGDIYWpoOzZO6Regoo6it08JmzwDfdwl0a0p1U5UT7Ld0yK95y2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WiRLceqn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WiRLceqn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0541F1F000E9;
	Sat, 23 May 2026 02:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779502838;
	bh=aqL6LXLjuZLB0KgR5UVw0TJsQhnrfEpU5qNi9r+3Bdg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WiRLceqnAsxJNI/HAziq4sBwKhhbcQVqcbeN18xvJfAeBNry+o9E1kqO1YDcEGmRr
	 2A+dLjr8/cmqm5BGBXoPO0/ZWRGxUP+KmxvPnc0HDLMwlo51NTURgcghNXSFjAl3G4
	 xAWB+PCGH2K2gbRf9MHbffqM7yUQkvH9Z67VNpAjjCbz1emLwuLJe1pFcwcYJkU2t9
	 UXJnLpgrVhCewq+GXQF9HBsREd0zw98bMi+zi+jlPO88Lu8u6TfABoJ8wfNYrTB+1s
	 +cx0/2vElR0fgCAnQ4VQseAl4iGcZ4uyO+f1QNoQlAQ40espCmS8unH7tzO7NytiyO
	 TUI7ndHTChj/g==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	mchehab+huawei@kernel.org,
	masahiroy@kernel.org,
	nathan@kernel.org,
	nsc@kernel.org,
	Saurabh.Anand.saurabh.anand@oss.qualcomm.com
Cc: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	quic_riteshk@quicinc.com,
	quic_vproddut@quicinc.com,
	quic_mkuntuma@quicinc.com
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: allow mode-switch events to reach the QMP Combo PHY
Date: Fri, 22 May 2026 21:20:03 -0500
Message-ID: <177950280366.1097700.1217163170875987304.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260515071448.1845500-1-saurabh.anand@oss.qualcomm.com>
References: <20260515071448.1845500-1-saurabh.anand@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 15 May 2026 12:44:48 +0530, Saurabh.Anand.saurabh.anand@oss.qualcomm.com wrote:
> Allow mode-switch events to reach the QMP Combo PHY to support
> setting the QMP Combo PHY in DP 4Lanes Altmode.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sm8750: allow mode-switch events to reach the QMP Combo PHY
      commit: 1daf54d8100e0e92c826ac8a2b888008b2571cc0

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
