Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D83D435EC7;
	Wed,  8 Jul 2026 14:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522675; cv=none; b=nGemE/+xgwaUQYpztAHlByXetvA3q1sAZhAsQIX/8PbsizTcOuUB+sh0z4n9ALfIcTVfSpaSB/0Z7UQZPj2mjEtgzNQ+SP9rZDcymwzxtEavuKWOZtLMGn5LpwkhYSNkR4WM706CWz6ACsyerT+B3iyxFQRj5oC74Jp/bAjvYM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522675; c=relaxed/simple;
	bh=uuMSw6Dk4iYoG20x2JY3IpRhdtK5oRn6nHPTzzAdjRM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d43vKOg6oTie8C+kxQ8Ho+lBVn8wZhfCbt+DXgVLR29XXOIjXUhjlSBqna6PFdupVaE6T6fq5NmsJ7MCTvX3DgWdUSLxwYNY/srm5CqgUTU/PNskktUWI0ZRr18Z4LYVroNgTZeQgNIH1boAFgQiSTy18xYqDDEk7YDo09amYzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XMriGhP8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XMriGhP8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69FD91F00A3D;
	Wed,  8 Jul 2026 14:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522674;
	bh=vyfyghuXYCD3LhgDfkXl0FNzl+5sEqekPde3hzUTV1w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XMriGhP8oDWf5DLwqlbyhz7vY2SzRaxFJa9zhXsVxYWySGErP7O+Zwpv/4QJP0nbC
	 dTI+nPylrtwI6VyzLrC+PxxVMnJP/59TUlmbc0QTXnr9+91blHN2bLBF9IBOIPrJ2B
	 vN3JAMuqhf4OHwqTbu7XALdYxPpXzn8pWAy1+WMRBMNzgKMn14NiHcsoW1Tje5M7AV
	 adT7e1G7bpCRZ0E152jpl1J7wRBv7iZdg6gO16PhsffVXm2sgA1OhkIbhKF+2kUBaU
	 0lTj8wLrYNOYmXWRxmq/1rrTohzMbmcCivINxS+w8MqQpBkiYbEf9szb7WHf69uCkd
	 AO4MznzyWstcw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Cc: Bharath Kumar <bkumar@qti.qualcomm.com>,
	Chenna Kesava Raju <chennak@qti.qualcomm.com>,
	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8250: Add memory-region for audio PD
Date: Wed,  8 Jul 2026 09:56:55 -0500
Message-ID: <178352261636.2235436.10420459601272958947.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260619-sm8250-audio-v1-1-8a76e033e209@oss.qualcomm.com>
References: <20260619-sm8250-audio-v1-1-8a76e033e209@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 19 Jun 2026 15:20:08 +0530, Vinayak Katoch wrote:
> Reserve memory region for audio PD dynamic loading and remote heap
> requirements. Add the required VMID list for memory ownership
> transfers.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sm8250: Add memory-region for audio PD
      commit: 531ce288b6dd43c1ce90e0b501c209783f0e0ab2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
