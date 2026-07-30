Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F64F367B79;
	Thu, 30 Jul 2026 01:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785376550; cv=none; b=sSlX8EKVw2TwOwMM0T6MmV7T7UXcvZXvxqXekA9HWVh+7k5fJ3oOctBt6qfq/i7ixLb9Jl5XuM4oyx8MPWRESM1Na7BrjgNvQ62U8qYInPRlydX7GvYck9CdcYfVNJ7dwE10ljIbwzJZI2vyf7TmKAXSBq+mBP/V9gVLDZlQUkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785376550; c=relaxed/simple;
	bh=f6SqdBlQnbH+oHOo9OjfUS63JXdzmYH+2I6PPWishIk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m6VVwsKV4nQTGgK9rk+COkNKH1VVWn6L/Mlq9tStqBoTZDdIxnPMWO17bcSbMHR0APAR+VhtImsF19gA6CTRWyuVYAUtOu1JAkzMa/VlSe+dteZfi7xa4Q+syixUTBqay//YEB5DO18mQ5cshSVG0e5/V3bRbzRYCdemEOYy6F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tn4zkkr8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tn4zkkr8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB26E1F00A3D;
	Thu, 30 Jul 2026 01:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785376549;
	bh=fWV7GMCe5lzSc5wF/O77Fqd9HTAmstf/wVTVT2lMemw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Tn4zkkr8LS5tLLcEnpV85nJDKV4lfwtHJVI4seSqVrkGHYjTqfRI9SStgL8JiXWFB
	 yxD6otMSdPF1RJV5mBOJaDWMBP77UH0RBzLIW1WuLWCirTmFWwTF5gLh6xPoxkUgxl
	 bVNV9jYSiCqZMhNm6qI4UY3cSlrIe1Sf3xW9VrzauxSgU19tMn2NmhTFJ7m9A6nLGN
	 r+3bcJcXbfr1ifB1An+sSLWsQDLsx4CWX9hT24SPLK5NoMDC0mFBxtAiUDqlrLhUek
	 Sp5RNvbU6AgiaAAENAfASz3PkM3xwjM4c24kmRC1el0jSX9Uu/EBIxMjuI4EFwb/LR
	 0rhXz1jOWOxKQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] dt-bindings: arm: qcom-soc: Improve validation of expected SoC naming
Date: Wed, 29 Jul 2026 20:55:40 -0500
Message-ID: <178537653468.67965.7066106292961080059.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260721-dt-bindings-qcom-soc-naming-v3-0-8f275c9d3412@oss.qualcomm.com>
References: <20260721-dt-bindings-qcom-soc-naming-v3-0-8f275c9d3412@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 21 Jul 2026 17:51:02 +0200, Krzysztof Kozlowski wrote:
> Changes in v3:
> - Extend qcom,[ak]pss-wdt-xxx pattern to cover also qcom,apss-wdt-x1e80100
> - Extend qcom,scm-xxx pattern to cover also qcom,scm-x1e80100
> - Add patterns for qcom,rpm-codename, qcom,rpmcc-codename and
>   qcom,scm-codename (all used with Shikra)
> - Rework patch #3 incorporating Rob's suggestions, but not dropping
>   legacy-model-name compatible checks. Now use "contains" in compatible
>   property schema and drop all fallbacks from previous approach.
> - Tags.
> - Link to v2: https://patch.msgid.link/20260707-dt-bindings-qcom-soc-naming-v2-0-1b7d695be2e1@oss.qualcomm.com
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: arm: qcom-soc: Include Eliza, Kaanapali and others in SoC names
      commit: ec31c2fb9286ace04394e8ed98ef5f2b1b34cbdd
[2/4] dt-bindings: arm: qcom-soc: Document more of existing legacy style compatibles
      commit: d00d2656884fb8cabc81543457d3dd2685532521
[3/4] dt-bindings: arm: qcom-soc: Validate nodes with fallbacks
      commit: 8ed9b7baf47cc876fcf44944b79dc30b493c9374
[4/4] dt-bindings: arm: qcom-soc: Allow WSA88xx speaker compatible
      commit: ab7b4c7b351809538698dfb1634510b5730b1a74

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
