Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3923E3C7D;
	Wed, 27 May 2026 09:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779874911; cv=none; b=Pa5yj0kzjmq0jn/veLcQAuACvvklsWsv6polyArAZ5RRIjrzrASscauiN218SPQme5fEciyZ/qLFBro1ZviyvWnPRucCnjeQTmPhxJeP5BLc86cDHGz2nKgFp8oX6aagkmXswo5Ptq7649UwHDc5/O8Pv1n3N6D9r9SNfEN5i58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779874911; c=relaxed/simple;
	bh=h7vUkUSk2TyF0R51nzZg4Vxpy7kiX5GGn5ZcufPTX3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kBo2fnmW2JnTiBm2dTDSkEE2rnMl8YEIE/BRxXd7Z+0bbyQT5sOwP8bUXt7wR9hQwvN3K0ZU0LPw3y5AMBS0t9QPdLtbQtQDMtUcd+YJ7yD1B7KQi24V8nUFT8nDjunugDcmNaIu2+pAGDkbRsyuiUDS/+neIrLulzUedHK4q8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G39ZeJBb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G39ZeJBb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D4F11F000E9;
	Wed, 27 May 2026 09:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779874910;
	bh=h7vUkUSk2TyF0R51nzZg4Vxpy7kiX5GGn5ZcufPTX3s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=G39ZeJBbbhXACBgiEPDcf8zA3LhtSahoPb+x2ruQBjNyQrv0bWSlZfjqF5y8oA0rF
	 oRYwpDWQdXP+ptS+jARBXE8SXRB5EePnBUfhUt42gkuNcq70731qEWqQIg6YiIe9LN
	 87EdL7beU1L98DyC3bgL7YR+Xtns7QqoUjEZ+C+UbXBea+IOk3IxoKRRmV/8MjPvH2
	 GDhAiTmD0YFyJ5wjI8LiUXhQVkMh1B83wkzMouamrZNrAb2LKM61WIjDkbVHSKv8Uk
	 QDSTCLUZCQ0lruhLX6bSGuVsMKJtrGAGeaZ8DgkWeN/qwEPVMEoCvXl5AUKrr/2CZP
	 t1gi1FK7nT4Yw==
Date: Wed, 27 May 2026 11:41:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Daniel J Blueman <daniel@quora.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Randy Dunlap <rdunlap@infradead.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	linux-kernel@vger.kernel.org, Anvesh Jain P <anvesh.p@oss.qualcomm.com>, 
	Maya Matuszczyk <maccraft123mc@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
	Abel Vesa <abel.vesa@oss.qualcomm.com>, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: embedded-controller:
 qcom,hamoa-crd-ec: add Lenovo Yoga Slim 7x
Message-ID: <20260527-rousing-wren-from-valhalla-ff5a68@quoll>
References: <20260526112409.66325-1-daniel@quora.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260526112409.66325-1-daniel@quora.org>

On Tue, May 26, 2026 at 07:24:04PM +0800, Daniel J Blueman wrote:
> The Lenovo Yoga Slim 7x uses the same Embedded Controller as the Qualcomm

Are you sure it is the same?

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

