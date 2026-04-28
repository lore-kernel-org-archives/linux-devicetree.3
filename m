Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79BE1341660;
	Tue, 28 Apr 2026 06:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777357121; cv=none; b=MwqOsV8HKoXvUan8UuCe5TwBws4yUSlbK5PLONLRreT7WISkPcIvPnGUOVDr8CAiyu2H4UJDFR4sqZPgE9tTWQ3ZuWoY3llh1ZQSQDuZMI1mId8/L1bmwv+tjD4CxK1OkCFF7NnRDEvhUwKBnf8dCF4hAidnUExou0hV9xOdPRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777357121; c=relaxed/simple;
	bh=SVoCFFfvY7V8mgMRcokYQ6vI1Wcfq1IsuVgHE+DeFd0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WwNOMpGjN9q3xWrrBwJMBPwxMom3CJ+DiE3JMCNIrV7CVzewlrWvtQEaXnclDMgEYuW+AANtf0Oi+V8T0rJfGZtazUaiAVdOKvZCEyqjx42yUPD1TsWFWyB/IIJgZT76C+3IDi6ndq3hwvvtBD0QGBhJ8k34pIf4W54MDfrSjSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tsB1E33p; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tsB1E33p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7761BC2BCB5;
	Tue, 28 Apr 2026 06:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777357121;
	bh=SVoCFFfvY7V8mgMRcokYQ6vI1Wcfq1IsuVgHE+DeFd0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tsB1E33pID2TUZMBE4fsSjLev6Aw47EF59gbwwE1T9/czZwU//QiyBfFl5S44x7dJ
	 kLPr6QOw6TttFLv5zZWhZVBgckytHwYpw2uolEN8nVxY1LXrlj2kMc14b3kykjqM07
	 YDcKDsJMoi8p+1RGkn/ctL9D7OhPVhd1ajkeP4OdmhZ41koNR+dcshVqA18zNDDYAg
	 dlEz9IRVGUIkb06UH4EF4GfLyoXyJ1kIh2XysR4/YXekKlV4J2raSBCh0hBtaglcEF
	 riOqNtmNC6GvRPQihGKpLyq8mm0qmKcdtcw42jLCqjKKbNyDZ9mepfuC0L/DFXGAJ3
	 mgDg3KZRqn9kg==
Date: Tue, 28 Apr 2026 08:18:37 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Dmitry Baryshkov <lumag@kernel.org>, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: mfd: qcom,tcsr: Add compatible for Nord
Message-ID: <20260428-qualified-pronghorn-of-success-ceb0ec@quoll>
References: <20260427012116.231226-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260427012116.231226-1-shengchao.guo@oss.qualcomm.com>

On Mon, Apr 27, 2026 at 09:21:16AM +0800, Shawn Guo wrote:
> From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> 
> Document Top Control and Status Register controller on Qualcomm Nord SoC
> which is compatible with 'syscon'.

TCSR is not compatible with syscon, because there is no such device as
syscon. That's Linuxism. One device cannot be compatible with non-device
Linuxism.

Few other commits also are not helping - you keep repeating the binding,
that device is compatible with some other "compatible". But we
never asked for it. We asked to describe this hardware or say something
not visible in the diff - why you are using one or other fallback.

Best regards,
Krzysztof

