Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419353B52FF;
	Wed, 13 May 2026 19:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778699334; cv=none; b=u2BGP+OOXyRXgEPCI6YVujYBKJ0zsmo+ZiJ5OWyjEbZFAmZ23ByRo1jQr3Livnk3KK9Fw2Na/1U9TPSs/xm82fnWo6/+mOkNPUYSvWTumQCJVlrq/DbE/cEiAGILrI5+oBm6iW1yGUN9MmxRtGvOai4WLIhyjnBJ8QvEmljsBgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778699334; c=relaxed/simple;
	bh=uHESQOfJoet4dSsPHRBifoa76OaIbvlpnlfqdaA34Mw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g150bq7ABGqLMoc9nSmWa+uozE/OFiSqlEm5EAWWgg5g3+cVlkspBkTSAajcopANpSG4ffHfCTKBzczFj11uekliq7l5kP/S4u4wmh3QIaLesKV/wfnKYHrwNpVOfkeRahR4PkjtVwKw2OY1vgboEPIgvAWXVpp/FfCiJOvQmP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i3MyFZ6/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i3MyFZ6/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10413C2BCC9;
	Wed, 13 May 2026 19:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778699333;
	bh=uHESQOfJoet4dSsPHRBifoa76OaIbvlpnlfqdaA34Mw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i3MyFZ6//5s84mlZnlrRZ5XSMXz9QrbTHvYsQgvGlBgJbK34kslA5PyR2g9n6TeGK
	 Z/sIMRml2jMdNEJd2lFClE81pJqGFqSoMpY9Ydu8HrRDKgJ8siQcP1YcQzuQ1vGVhj
	 L7MCkJc6Fn0r+xSGUXLj8ovq37mCL82JjD39uAWYFGbR4xg/q35ni3sPXej+4tZH16
	 foRpfj3qCnrljlOu8I13PqjlVByoXo4xMqIduJOKggAcG3OU97S31+MHV/sBJ3qIoh
	 pN/3m3kWlvn7xPV7xvuWGAEStBN5r//eAcP3qS21ZDyilEdA67DEyFAWuImnQQMy8y
	 gOjiNuXjMEI9g==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: soc: qcom,aoss-qmp: Document the Hawi AOSS side channel
Date: Wed, 13 May 2026 14:08:42 -0500
Message-ID: <177869930358.1496076.12219675278161857673.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260427181609.3648384-1-mukesh.ojha@oss.qualcomm.com>
References: <20260427181609.3648384-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 27 Apr 2026 23:46:09 +0530, Mukesh Ojha wrote:
> Document the Always-on Subsystem side channel on Qualcomm Hawi SoC.
> 
> 

Applied, thanks!

[1/1] dt-bindings: soc: qcom,aoss-qmp: Document the Hawi AOSS side channel
      commit: c5f5156ed4cb11ddaa35c49e2ca8ead5a6dff1e7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
