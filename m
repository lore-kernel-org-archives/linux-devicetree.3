Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD3B3D969B;
	Tue, 12 May 2026 20:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778617439; cv=none; b=LwJKvXZy8rePrZubf0I4AbO3AfrIQ0BtKTQRpAYxDm+ICIrXtoUH9Jozrd26g5VWJn0QhBKHeiNPBgV5lulrJGjYLh4603EqLillhUAUukqXSIekYtYeVUA10oEK8boOJuqti3Xo6D1Zrwi3C70RCXKngZem1xJT7/pEWmCW8L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778617439; c=relaxed/simple;
	bh=WViwYil5lHOMA+W3Ct7xpDWVEY7wPEjwdyoQmu9rE3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QPl7DylruEDfQk6RTBNXwevhfSvyNc6p30Bls9f5to6mwTtrRCtylP6w+whHwLQ8nDygdlgQYq2bkSPE5HNK/+R2xQUyMi5GEJvF99l3w/PfbqMsFG4wI6mt3megN1x5lQS7mNOiLngqFO3yoAt3ZztybSpXdQIQ32yyofVwMLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EFI2kTsB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EFI2kTsB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10328C2BCB0;
	Tue, 12 May 2026 20:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778617438;
	bh=WViwYil5lHOMA+W3Ct7xpDWVEY7wPEjwdyoQmu9rE3Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EFI2kTsB+dZmfjsERcHfMEMcpRdaN4ose1VOEcYdAeJI27pXhblRB26XGBDx/J9uu
	 C/XwXPBbmtQL6aR7kTS8Ltnbk2R2EF1WCcq+nBcgxiGyPv9R6g6ESWONTlmwinlyAy
	 GGzI0tn1z7ZBIRp2URGQqZttx64Kax9Jf+69n/+6zYv25mb+H4oATpJeJnv1r+QOd+
	 1l3AjbdITZJPBK4nHKhznNmBGnxtD8EpP1YiUsjgd2FtnJF5OOTr/9b3M5dB3Rh8Sl
	 IJjm8AufsQyPr4lZbWaDiUh5SPuml2h4tVIjIUVCEKMlcNrR1mpWgkQZ9mvg76hlo8
	 v0iFOgD4HByeg==
From: Bjorn Andersson <andersson@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 RESEND] dt-bindings: firmware: qcom,scm: Document SCM for Nord SoC
Date: Tue, 12 May 2026 15:23:11 -0500
Message-ID: <177861739377.1242344.8542871114084938182.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260427130800.271146-1-shengchao.guo@oss.qualcomm.com>
References: <20260427130800.271146-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 27 Apr 2026 21:08:00 +0800, Shawn Guo wrote:
> Document SCM on Qualcomm Nord SoC which is compatible with 'qcom,scm'.
> 
> 

Applied, thanks!

[1/1] dt-bindings: firmware: qcom,scm: Document SCM for Nord SoC
      commit: a1b94131042930114d0257c44362ee16bca18f4a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
