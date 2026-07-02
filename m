Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A308B3E44E4;
	Thu,  2 Jul 2026 23:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783035660; cv=none; b=OXuFduj1xdmhHm33MFVmw1xQyY9yniP2GxSe0EYPtTrRuWGdoyx6726QfzbFIm5DgxyxLVJtG41gGI/WFG2sIU2WQw4OkvbiQ8uiaXMdCM436sjOIDtUJCjCb5Wgtm9vJ9zbQHTXAXbzNpRC+5BKlB4O6PDUk/mazw+4VG1W+KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783035660; c=relaxed/simple;
	bh=Rbtf/p9GsIs2CyjwjlqXRFAmn25ZPBFGScJsDQZuTls=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KCXNZ0c69/mYSr//psR7lz1khhmOEwHxqZufWYZgUBDRSdPVe6pl4OLPGBG9keGWVoK2+foGr6pIHAmg8lkJirHJS3kf19JwZvWC4h7VHIm2Vd65ndNEe30gEOHQLDYsVsOGCY+Ml4GjgC7qvI8k0ZL7sxwEZJFGIdhjVUyeGtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nQ8x4Pal; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nQ8x4Pal"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4C371F00A3A;
	Thu,  2 Jul 2026 23:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783035659;
	bh=GVXWmnylHj2Xt6BYhd7lL1R6ixMIJ9Zmj1e7A0L7qtI=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=nQ8x4PalJBWGcpTj6CPFAodMQWZ3ngbCVEYBXNrlAmqsXQP9l4Ed4vCbPOgxaDI/v
	 Yn2Zoy8x+d4c0YqnKU8Zb30r+LP5B5z9uCntCBVllEc3s95y8Hh3SORVYVo9ofzg3Y
	 4wKgaOqwVT69Boq6PCdskvEQvPXXSaGBa9q7ieAFT4RTA05ksOYXXQkr4UEUbTXRrr
	 I7K/zjuqkK53QwiNEUHSsn+pmrkwqcmXOu6a7GaQGVVlU13o3nb98BkhEFyMm1+Vmy
	 /T6rAWzPOr1lUCqwn05wa+vZZ1W/pvtafnCj4oKfrZI5R/VcJ+88MC/fnFJrVzqKId
	 SRPxZj7JuarPA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: monaco: Add default GIC address cells
Date: Thu,  2 Jul 2026 18:40:33 -0500
Message-ID: <178303563651.359079.438500467612615228.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260407201518.24949-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260407201518.24949-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 07 Apr 2026 22:15:19 +0200, Krzysztof Kozlowski wrote:
> Add missing address-cells 0 to GIC interrupt node to silence W=1
> warning:
> 
>   monaco.dtsi:2326.4-2329.30: Warning (interrupt_map): /soc@0/pci@1c00000:interrupt-map:
>     Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
> 
> Value '0' is correct because:
> 1. GIC interrupt controller does not have children,
> 2. interrupt-map property (in PCI node) consists of five components and
>    the fourth component 'parent unit address', which size is defined by
>    '#address-cells' of the node pointed to by the interrupt-parent
>    component, is not used (=0).
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: monaco: Add default GIC address cells
      commit: d291245e2fb1eba55d751f88613a41e292958a96

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
