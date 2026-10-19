Received: from out-zbxj-a75.jellyfish.systems (out-zbxj-a75.jellyfish.systems [198.54.127.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68AF541835B
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 07:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.54.127.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792395913; cv=none; b=GTErx6hOLMLjd6AMiE5EWXb9K7V0mIlMzt3xUITJmjxtLmWtxNiNaEaY3SYZ67NjGQEGviqypgvG4Ola/0pkRlWlSMp6YNCiyN0g1M/khBQ2r1K5QuMq/FNYXIsOlmWwsT4GBwkKTkEYEN04rLVQpXZyyDgId4A/yc/T/npU9tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792395913; c=relaxed/simple;
	bh=KlHbsi8rfV/ZUs6Ey4PAjEI6Qn0xW+x9Q1m2fJoI4ko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ODDDcKJaQH2A5WrGkvhaa3C5IRhOBNGJKFtvrQaG4DnkaRWmunJqZ0KX/FdM2T7ZK5xp06uGnuYWOPYh3bziIjPgOqrlFFebCqQa7F8VxRHDjK7S1xQj/t7fE6ef/7MAQsrs+lSRvzCm0VxKSAFKVF4ByjXX5X+o1N5awM3HH/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gurudas.dev; spf=pass smtp.mailfrom=gurudas.dev; dkim=pass (2048-bit key) header.d=gurudas.dev header.i=@gurudas.dev header.b=J0iYxKFw; arc=none smtp.client-ip=198.54.127.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gurudas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gurudas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gurudas.dev header.i=@gurudas.dev header.b="J0iYxKFw"
Received: from gurudas.dev (107-194-158-19.lightspeed.sntcca.sbcglobal.net [107.194.158.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4j7SHq5LJQz2x99;
	Mon, 19 Oct 2026 07:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gurudas.dev;
	s=spacemail; t=1792395896;
	bh=s7+W4QjOAzTVAAior9D1wT1r4nVH7bqs544B3rstODg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J0iYxKFwzV9FXgcGy6CeO5NSaTAUaIEgaSl3oWIeuz6tnqhUPTM+OKk01pMZx05Am
	 cXZ9UOwiKGP9wCDboomulaAR2hiA9fbmPB8XWjOcuzOvV+zoYNZLMLyCa0pqytKGMn
	 YmNNRKXsN0ZG/8pshzCc3aKccvOELCB6ZaDQtDV9R0VDKac/krHi1Gi22J17GNV+ku
	 Ws8RUCSihFAntVmvIgHg52odx4EDdBzhi8XzYEsPrUZwJ0T8SGU+ndTIWEguB3dLZW
	 vW/jii9U4QoS5TfN41ok9unL6OnD7tRlDAyqMJ2WdKfDvD93FPXnISNLqfXthN2B/Q
	 3J/3mVaz/M+Mw==
Date: Mon, 19 Oct 2026 00:44:54 -0700
From: Guru Das Srinagesh <linux@gurudas.dev>
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
	mfd@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
	Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	Oleg Keri <okerixx@gmail.com>
Subject: Re: [PATCH v2 1/7] dt-bindings: mfd: pm8008: Add qcom,pm8010-i2c
 compatible
Message-ID: <atXKds_Ch2bYZ0w7@gurudas.dev>
References: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
 <20261014-pm8010_i2c_support-v2-1-b395d2b3f668@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-pm8010_i2c_support-v2-1-b395d2b3f668@oss.qualcomm.com>
X-Envelope-From: linux@gurudas.dev

On Wed, Oct 14, 2026 at 04:01:58PM +0530, Jishnu Prakash wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The PM8010 can communicate over both SPMI and I2C, based on whether
> GPIO1 is pulled high or low respectively. Since the qcom,pm8010
> compatible is already taken in the SPMI PMIC bindings and that set of
> properties is heavily tailored towards SPMI, introduce a secondary
> compatible to handle the I2C case.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

Reviewed-by: Guru Das Srinagesh <linux@gurudas.dev>

>  Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
> index 0c6e1870db1d..2701aa755f31 100644
> --- a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
> +++ b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
> @@ -16,7 +16,9 @@ description: |
>  
>  properties:
>    compatible:
> -    const: qcom,pm8008
> +    enum:
> +      - qcom,pm8008
> +      - qcom,pm8010-i2c
>  
>    reg:
>      maxItems: 1
> 
> -- 
> 2.43.0
> 
