Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D0635A938;
	Tue,  5 May 2026 18:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778007325; cv=none; b=DJ7+wr/KBLKhgm3vnzAkv964dcY4LjGmDGzOopktuWPbmpYKgYNcC8Ih+l+NZ5+jme+djcA+AjgYnKBO66xwbIhBDpgFos4CDYm5jNFPawUYHV/ojg+yqctpsZLuriFp+OUICLBWmAT7az+p0sQIKa1HqrFrxJfiF+zGbp2bwgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778007325; c=relaxed/simple;
	bh=QSV+bOWR3z16NmIExNAfRRvM52VpzZRl7BoJ9Gweq20=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RbOHRiGRzP4dSswN8TiSouknvhEZ8Zhu/b2vbN1MflqJaRmMWqOVK45pQSYAJLSHyEHmfQTT16jueKwrTDkv7Oh53ELXnIuXdSQb5MpAiLO58+xjdnoLELuh/F/mwZaCmrPg09gjruu9dfQp7/RmQmPlhTKdq4KFt8qJCG4puf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=MuV2gijY; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="MuV2gijY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=85aBEzzLdnSG7SQA9aPsSPLwJXCmq5FIRWA2XNm4m+U=; b=MuV2gijYWxbvj+WXbMgFttTfh8
	6XX/os3ssMSm5QsEpH97f/FqBouV+Dk3phRjVSZt+eK0C8eU4GJUJGqJY55/RjMwKfE+5KPrjG6Ov
	JSe8i58My0rr9oX2n6gDqwIWKGjl0G8SV4601mISeSL9Wc1BRKVCJJl8QmI45LLG2n2hWsjxXWsPj
	aIwffOICUkFHIiG0QMjZvkXVbBq/glhoaJ+EwKrXlWJtq1sslIZN9xwldI8bIx/jaFyfaORaFDau3
	t0kjtD/7mLDCPcmZZmx4S4bkXtqyJswPmevtD9mCaDe3s4XQHcSEPtBjliVCKL4VpDmhSxnvWqomg
	qx5lyYOQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Weixin Guo <2298701336@qq.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	f.kardame@manjaro.org,
	pgwipeout@gmail.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: rockchip: fix rk809 interrupt pin on rk3566-roc-pc
Date: Tue,  5 May 2026 20:55:01 +0200
Message-ID: <177800729424.3301010.8355730425326488875.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <tencent_5035EEE630C845B1B51DEA4284DE23DCCE06@qq.com>
References: <tencent_5035EEE630C845B1B51DEA4284DE23DCCE06@qq.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 27 Apr 2026 21:58:04 +0800, Weixin Guo wrote:
> The RK809 PMIC interrupt pin on the Firefly ROC-RK3566-PC (Station M2)
> is physically connected to GPIO0_A3 (RK_PA3) according to the board's
> schematic.
> 
> Currently, the PMIC node incorrectly specifies RK_PA7 for the interrupt,
> which prevents the PMIC from correctly signaling interrupts. (Note that
> the pinctrl node 'pmic_int' correctly configures RK_PA3).
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: fix rk809 interrupt pin on rk3566-roc-pc
      commit: 460bac478c5fe69054ffc60d607bba03bcaf909b

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
