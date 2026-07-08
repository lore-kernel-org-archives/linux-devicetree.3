Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDA94C77CC;
	Wed,  8 Jul 2026 14:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522637; cv=none; b=aUoXI45toE2+uU1rdvHfYs1N2Mq73zzMgjoOKrZvOTPbYNKGU6ZFy8brSlrEh4Vgsuf5z8IqFnfMGctROAEqK1ZX9sQ51sfQc7RfXsUGTjzoWZHAEhp3Q3gvmsRlmqLAsEba00ue1HXVKWrrmoKIae8T5J1TMldZ/61T2Rp0jlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522637; c=relaxed/simple;
	bh=j1yLDWQNlff5fSstvDVYvAPaBmeCPbanN1T8YkQonZw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j7PtE6fEodPzJdomfAPU5bFRuD+Exxhsv1qxNJECDEoGREen26HpD1xDz3ljv/u0uKIKkn2Cbhufxp+3EsEJXPaqsxQBoK350dfBUxCLnOedHjLVY5iMfbO1BRAC1twCyyNNDW7/xQ1/+u7j8Cz9PYcTLu1Wecuidycy6sfxUOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n8ejtLH8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n8ejtLH8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A55A1F000E9;
	Wed,  8 Jul 2026 14:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522635;
	bh=5n5hDHmxpiElAG8DeF7rPBhhPM1w6lG0LEa5L82OtKI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=n8ejtLH8pANfUjCDPnGYgkFoMCgoAdPoTOxONdtmcMb1w03n0k3wbLde4vPcjmvBU
	 BiSBlmavq9MnovzjfZbazN2PbMKVSKQRm83pzGEbEEnFXo8uNVCPCWOhCmjxKnPs3B
	 GJwu5xPN/YTn+wZP8gbiRVJ8MYIiVWya6XmCd/kfpOza+EWpXFKvSt57VFnl+DEbhV
	 JjUB3mDPmobXNpWdgs/5bvJD8pSnH2J61/u0oNZb0xu7GObNa+yD8sUGYKvTvyI+IL
	 q4Uw5WAVJeW0UxTerN5PO26ocC05riQ4vlQ5CLLFn/Z6JS2fvulnSC6Uz7GHAzhe2Q
	 a0OCq+EsfZwzA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
	Chenna Kesava Raju <quic_chennak@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RESEND v3] arm64: dts: qcom: talos: Add memory-region for audio PD
Date: Wed,  8 Jul 2026 09:56:16 -0500
Message-ID: <178352261645.2235436.5591797000080061652.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260629-talos-remoteheap-v3-1-4e23366c9196@oss.qualcomm.com>
References: <20260629-talos-remoteheap-v3-1-4e23366c9196@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 29 Jun 2026 12:04:38 +0530, Ekansh Gupta wrote:
> Reserve memory region for audio PD dynamic loading and remote heap
> requirements. Add the required VMID list for memory ownership
> transfers.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: talos: Add memory-region for audio PD
      commit: 229f04d1f09f8832006753a266dadc0bf6e8b3cb

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
