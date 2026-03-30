Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3696738756F;
	Mon, 30 Mar 2026 16:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774886523; cv=none; b=RfeyYjGVVWo1Qkmx3pHNlMiUPwkZ6yGEVXLfLs+V2Kcepc5lfJ71WssdvJLoQzppny+fh9cmVvtcyBOffpTI1FP7A71sTmM8Is/HjDduvcURTmh2TjwFepD0trwLmO9vdPaCJgOay/U5J0reZW5OmeYZOWbTyhhIhEDHwqzKci4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774886523; c=relaxed/simple;
	bh=97ff+8Ym7JIRUIhCcJ5SicQ6FlxjfLTdcAyUfRl7BzI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cynjg/zVlrnz7Xms2NfcXpv26CLMkF+9o/LfVjSUJUMayb1+JRKFCAxDDKAwQrvkXkfGhhMHlZKUwULELd7KTnyyUYZPUN5CIodRPQRrzJbSdV7QDCtJ3AS5rGa2JQgHBqWZEYDt9E9d07Ivil6pj/zR7CJAe0tzvd1zMcdcIwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NJaZw/kL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NJaZw/kL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 278BEC19423;
	Mon, 30 Mar 2026 16:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774886522;
	bh=97ff+8Ym7JIRUIhCcJ5SicQ6FlxjfLTdcAyUfRl7BzI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NJaZw/kLGbSC4OVPhDZyl9PLmDAVYDjC4328xJnyikPb1XUem+VkmabXo31afY66a
	 WD2kjd+F7lX+g1fETj8TJp7ZcpHYZMtJVP/+mhCqKQS1b9xefi4K2mTCNIBzO6fRvC
	 7mw19P1UoPN+8hsryXGSz1YbizOSpRIvM1i6FyLEBw57/iaQpVOOQjyyY58JgtoTmd
	 mnkg5udRxcp9IVwtjopTCfejT3H//2bg4b42Aci76dgBjP6Myy3VDyWqkN6cQZvBc4
	 TQJc/9vUghPFs7b1QCMnhUaPaOwUMvQJC6d/P/bhwGpftKccPkD9YseYq9LxdXvzqE
	 BLfBG78f6f4HQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Le Qi <le.qi@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@oss.qualcomm.com
Subject: Re: [PATCH v2] arm64: dts: qcom: hamoa-evk: Add DP0/DP1 audio playback support
Date: Mon, 30 Mar 2026 11:01:22 -0500
Message-ID: <177488647733.633011.17304659903833175028.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210024037.3719191-1-le.qi@oss.qualcomm.com>
References: <20260210024037.3719191-1-le.qi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 10 Feb 2026 10:40:37 +0800, Le Qi wrote:
> The hamoa-evk DTS currently lacks DAI links for DP0 and DP1, preventing
> the sound card from exposing these playback paths. Add the missing links
> to enable audio output on both DP interfaces.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: hamoa-evk: Add DP0/DP1 audio playback support
      commit: 20eb0aa76f7ceebbf897019e3eeeca0a1d24e3f5

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
