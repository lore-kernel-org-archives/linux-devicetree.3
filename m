Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735C74F796D;
	Wed,  8 Jul 2026 14:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522658; cv=none; b=siVN96c81hC9sux9D+0adqtlX/R6aAsmvzrPlXdzvn0u9pl0MqDxeETDyHNYv2F84FMJx4DgYGw1lsbXg5Z3HC2upgBWbzw4VFqLroOIZr2anu+d+leFC7NKCvtDJzzjIrevkIQYrgc5+7DBn5GArqWabhJvKpMOslixa6ZmYps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522658; c=relaxed/simple;
	bh=uUoru8ansihQFevEzTZMpY7pORUaP+M9k6JG5ZKAWj8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Bge6IlAIJdbIlBhwQAs6dmqi9FP+1zefmyBMhrm5xDBZwibr66SENupjL6+St2v/2oIzf7Y80NmzSxdAKVRZQp1O0TZ1AJnQktBTa9Gr7NLUhQ/q+WO7+3FMqLEsE7AxiTWlY9ajZUSrycSCR2cgMw3/6uQcqp+Ulo9t2luen0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ORoaFd0M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ORoaFd0M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E0731F00ACA;
	Wed,  8 Jul 2026 14:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522657;
	bh=9nYpSJBoA8KezwKbzSep/6DEQqiKgZeRGDTU5H0c7pU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ORoaFd0MHUPUTKEXoeUUgMuHYPKa7JhRgw6h9tgv3u5sxPXXRZCaGKZaQjDRrzoKN
	 2nHDAzi+uq6U+0lOXn9X9EfpuaArHZzplGn+y2mZhy6zVn4rXUdVRBLJJBX9PZdxgu
	 cjkSb59eFNMEVKqITJ7Zd27nQy0XE/BpYFUPbgCD7YB9zo5ds4zKw4WOwkRDVNBr0/
	 YWQoRluT+pw58oJNNTxkx7okq1ew0YvJSBGPb1XEY1X5hIfiqeXzIWyEXBOqn+HRz4
	 qShnm70R7D2Dl8n2d4qdAYHXYsCIY/iHNI6hSv0qrGPmx5KyfabLSA8NG0whdEjo01
	 oWfv1lW7x/1gQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Raffaele Tranquillini <raffaele.tranquillini@gmail.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: msm8996-xiaomi-gemini: Fix up ti,drv2604 enable GPIO
Date: Wed,  8 Jul 2026 09:56:37 -0500
Message-ID: <178352261642.2235436.13011814603920096763.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260625-topic-ti_drv2604_dtwarn-v1-1-76e91fcafbe8@oss.qualcomm.com>
References: <20260625-topic-ti_drv2604_dtwarn-v1-1-76e91fcafbe8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 25 Jun 2026 10:42:43 +0200, Konrad Dybcio wrote:
> Update the 'enable-gpio' property name to 'enable-gpios' to conform to
> the bindings for the TI DRV2604 haptics module. While at it, use the
> GPIO_ACTIVE_HIGH define instead of the raw literal.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: msm8996-xiaomi-gemini: Fix up ti,drv2604 enable GPIO
      commit: 5156bbcad976b95502a7fe334002a957beee55d7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
