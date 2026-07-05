Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4B13B27D6;
	Sun,  5 Jul 2026 20:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783285101; cv=none; b=N4OEkFQPsNe/aLdzbtoBZ+tH4y2PiqqzqsC1R0mn9WCVRSwvj5O/VRCHxIuHy1BRafZX2RieSKIOcQMSYsIYKR8NKtlEhUCZt7keoj16aA2bo2HpOCDOxfWQxPQIOXzbbnzVvUl1KOzoagidapYPF0ooXk7f4HuuaToIU26qgJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783285101; c=relaxed/simple;
	bh=kBWSGyjigF0oaca5snB49givCKMem4xkeuFmrTlBOU4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EFyV69IeAatPKNg/7KsxlmOzt/2k1/8tpThm7tFv4nm9la0l1FsWOkscUmIaQNJCvONEp+lyyeYMapFfvA9g92m1+cIZ+Y6w8vSnzWvO7IlydD1uLTMVlTuZ4Q7UJ1ptFt5AdChpgIN1+DWDKVP5lBJrLWvsh3a5MY3oElwGJlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S0p9Q7yF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S0p9Q7yF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92E311F00A3E;
	Sun,  5 Jul 2026 20:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783285100;
	bh=2DOaO2rB8pIsLyulSkce1JIFhSoJTz0rHCi+f88SNhU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=S0p9Q7yFFUJFVjqVFGPDyaG8l+B2Y5GGp6VCbo/5yY5be3ptjK8epT9mBR3xTqH3B
	 B7VUfQL/62m3+HYL2KToTRDJ2IoktDxXsdSpgQDEIv4BOS4jbb07WgVe9k5ggxr4cL
	 uaI5ktSoJfZlpaqryA+Dtqoy1it1LLCvc/Dvky1A2dqCD8fIRdE8jEC8KVBczWVRm0
	 9uHJ0v5UTc7XcVkFIdUFOTeI/FLKkda7WFhLdstRz0OJElxaQ23FWqRbGtzK+U5ksH
	 zT3Pu7KXHlTLEWmIFkKTleAyD0lzO/5kGD8sI7QNUDFhB/BzwIFKV4PdfMtdrlvlx6
	 Nlm22zikE1RHQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: dts: qcom: hamoa: reserved-memory changes
Date: Sun,  5 Jul 2026 15:57:58 -0500
Message-ID: <178328508271.1157743.2928712624151218974.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260525114749.5939-1-johannes.goede@oss.qualcomm.com>
References: <20260525114749.5939-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 25 May 2026 13:47:47 +0200, Hans de Goede wrote:
> Here are 2 patches to hamoa.dtsi's reserved-memory node:
> 
> 1. A bug fix fixing the length of xbl_tmp_buffer_mem
> 2. A patch removing a bunch of memory reservations which are already
>    reserved by the EFI memtable and which are otherwise unused.
> 
> 2. Is marked as RFC because I'm not sure if this is a good idea, but if
> the reservations are already handled by the EFI memtable it seems best
> to me to just let the EFI firmware handle these.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: hamoa: Fix xbl_tmp_buffer_mem size
      commit: dd923fcc2151d2d077542870304bec94f094bae7
[2/2] arm64: dts: qcom: hamoa: Remove mem-reservations which are already covered by EFI
      commit: 7d240c5dd34ae8560f8d0557fbbd7b0165eab486

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
