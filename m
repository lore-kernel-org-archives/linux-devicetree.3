Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C704C317170
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 19:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774382049; cv=none; b=kmX4daKhS6aF2Cw5Kb/W1LFbycpyZi+a+Fn0dn+FYycEJdo9gkSS4PYmPjAFE2gEx+3ZHjhpXvg7KohChxqnWg2OIN+Q2jZz6BtVMSiDgJSLxsnVaEmPF2V3JYplLk5ePufzAup38Q9lh49XH7d4Nibv39NJU4/q/4EVo3+EIrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774382049; c=relaxed/simple;
	bh=7Rjm9US1D8arF7JzrEoKQ0tdwoI8bmhhxTk/vdBxO7w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WhWYLe1uFpmd7Dh9cYohxr4JHGKHoI2uKlc+Kjh1Vy2kzUxdjOtqdvpccC1TfDWoKv/TLJiGVug/2eFvoNHbzVvPZCuKcokzaZNXUknjKNFKvn5ZS47O/S6CArNy65L/zHPWr0YrjV2YjjHSZlxUQGuSPwFMkWYEX6aB0/gAIBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=kl5kI6VW; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="kl5kI6VW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=XRQ75JEC4lEZf0LNuwH7roqEET7G0WjlKuKX+lmjVGA=; b=kl5kI6VW12dmU54GhINOFG6vV3
	+TCsoFdIKVxw/wGgp71wQdRgxvRcwyWWjM+DqRfTOujHEj/T2NmjN+KTAOppknmUdHcYFBlTzBLdN
	UQhXeGANNJxZfjjdBzbWfhnh8B6cgP/tvi6AHgrpjZ0hdUyESTQWxACVLJEn1KJfMAixAMKVjzuzw
	2IWU2sjVqMAu6ojQCXdEuCTLaR189Fts6+m5dkOYdgisiKhHullA//4P7IxK3CcA6zCbhsZZ3ll1i
	9eSAhiAteOICqIgNoDuAWzDeXIzKlx7BD/vy4pGg7Eh2SmhoXz4HachxUZcbYrMBz8Ab/MildeSuc
	tqoCoG3A==;
From: Heiko Stuebner <heiko@sntech.de>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2] arm64: dts: rockchip: Add mphy reset to ufshc node
Date: Tue, 24 Mar 2026 20:53:57 +0100
Message-ID: <177438200691.818857.16673715835676850239.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <1773277913-29580-1-git-send-email-shawn.lin@rock-chips.com>
References: <1773277913-29580-1-git-send-email-shawn.lin@rock-chips.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 12 Mar 2026 09:11:53 +0800, Shawn Lin wrote:
> The mphy reset signal is used to reset the physical adapter. Resetting
> other components while leaving the mphy unreset may occasionally prevent
> the UFS controller from successfully linking up with the device.
> 
> This addresses an intermittent hardware bug where the UFS link fails to
> establish under specific timing conditions with certain chips. While
> difficult to reproduce initially, this issue was consistently observed in
> downstream testing and requires explicit mphy reset control for full
> stability.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Add mphy reset to ufshc node
      commit: c7f415cbd53efbc30f9ec16e9c96030a23830a6b

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
