Received: from out203-205-221-231.mail.qq.com (out203-205-221-231.mail.qq.com [203.205.221.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB98D2F8E8F
	for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 07:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784963207; cv=none; b=FXuamgAM/Yzl4YY5v3Y7M6lLwKFN/WniH0SDBGtaT4sE9KABqnuChYk+v7GR0+cg/2MRCgrBLfTQSudFPMk3LQQjKYQd90m5jG2nmjICLrxMshNrk3xWYrVDpMpQi75TS2IMhTieCGl+Po+1Ma1TCQzuPe7g9YiBFf/mQ3e1t2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784963207; c=relaxed/simple;
	bh=DX+szNrz7DTLcMXoXNU6DNJcfUI4KfQcHuk1pG+QKxw=;
	h=Message-ID:From:Date:Subject:MIME-Version:Content-Type:References:
	 In-Reply-To:To:Cc; b=uB22Ilo87JQQLHJ7jVV6Brlz0rkYcPyt/DBBt5nMqYGKD7443rcgJ6cn4xH+FIXQHyL9qycaCRb0tZebFcauBbVTxIvZ2ielSE8p61rJBfQ49SbDirKChejijN7j+1kSIA4XHtcyqC9l9rk1VqTjORjWUt6cacNNYzSAvq1EHzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=jmZHkJ08; arc=none smtp.client-ip=203.205.221.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="jmZHkJ08"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1784963198; bh=L3LDk1ob8lSeDF4p3l0ihZVgutygUEgJnbVoCOXhudc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=jmZHkJ084J/fLc3xVV9c3YR5XtXKQzLfdMMZ3BocCMqQE4QShVn2iKlcvVh1w7IYr
	 uDMhjYQktfKq7up21+QcgpQEHq72sDqqlZ7HWcVGJJnwQKJCIjM9PpZ6Ka856WPell
	 mAVG+7dA7edonfNC2tAvLekg35cMrPeMRkq8eZw4=
Received: from ubuntu2204.localdomain ([2409:8d20:22b:54c:9e54:40ff:fe02:3f0f])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id 19989659; Sat, 25 Jul 2026 15:06:25 +0800
X-QQ-mid: xmsmtpt1784963194t29xv9a84
Message-ID: <tencent_8E35228F9F4F133FCDBCCC4902F6887D0006@qq.com>
X-QQ-XMAILINFO: N2ZoPGp9lKFW6O+7p5ZF8g+DCHmxkQcPFO9v1rbFeYY0V7uOwLUPdFrXOHVysY
	 piP0nwKdWprL4pEiZgFSN9bI0pG9g1C1nkheUdlHLBxmvve8zKbtzGCuvvopyXnQP+6soTSEhh6D
	 Kk9OLi1vKr0lK+OjJ6PU66i55uSLgIXsLZsA9GueukkLYEdM5MkFjR7RJv551QUWoi1ZqkvcWJU4
	 t/TTw9riTDgt2E8QFLIxQOiTQZ2OoEUIUW7hvk8fBOBErUUZNLM+eZoEbJdb2O7o/UsAv+XOdc4b
	 9QOfCKE36W5ub9smZwb2VUGld4c8NchI5JqEwYkpwlYkGux7XASFxGoH1Y54drfstuWxj3JKNSst
	 XgIIf7CKk14Pui6+dearVzb+77RazXLx+uf/KEvOL8lBkp0CfCooXjk3wLEFyQwmM8vHhXRuv+O5
	 oCzOuOpWZ4cMlocWw4mg5aIt2sZxjMIglU6HSmqBU62PoSuNt1TBXjGGW2RRsxXwRxwHn+IEBV4H
	 ewOIMb4epPaRDxD9c8Ye0506mKxlBRRjKojQ/EJTpJPUtGzDmEy5T2xRfDuYLwRjpQPhygOxrJ6G
	 f/QDXRPc1YBHYUhD8Xf8UKxCVhCBOpM69wr2wnAhuYnUIPhMz+EnZCwyWYVUN72iaR5Ebqo8dyJK
	 5QA/p4aES+TgJyTSUbDEKrtwU11zE4FBRoKK+7ORqjpD6Z294xCmusITWozh78s2GLQVAwa0ifFZ
	 2rVYD8Bnuw/31XoQ7pssED7UxKBw4OPhTkhMC43Q075u1SDlAWu/vqhqJggrfzUDEU9H6QLvkN6k
	 KW7btVpLcJ4DmAmhete/Tyg0AagMqf+ydoSdLU2O6EJLJ8JXkfkMWFYuBVisbxD9ppW247IVdVMC
	 lAiJ1eUQqbF7GzFz86UGy4195Y6d9f7zDP+6UetApcYOlv78jabYoLcREt20buAYXa8J8Ydx7txV
	 2bd3XgxnL2eIHtrZBvCUTFchUMt1TSEIc7Y2SOMLcyCsnz4pLXa0EVma8HXpZEi1z48TDJF87N0d
	 nONVjvlY+F+H43JoXG2wnBH8UxNPo4x31GVUikMVMAr+oNdbZaC/HxXVQBmdGaVUu2EaVoHxGFYO
	 atnmVshJZUg+YTvNoAY2hecZaLhCfCsb79UdnnBOdrCBN3l9O6zUQmnuApXlNgYh9hai3u+f4umT
	 tr/i0m8HcaT+9Um0L6rsD+YOlgUtkTcXn50tA=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
From: Cunhao Lu <1579567540@qq.com>
Date: Sat, 25 Jul 2026 15:03:34 +0800
Subject: [PATCH v5 4/4] arm64: dts: rockchip: Enable CAN controller on
 RK3588-Tiger-Haikou
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-OQ-MSGID: <20260725-master-v5-4-75da459d2b93@qq.com>
References: <20260725-master-v5-0-75da459d2b93@qq.com>
In-Reply-To: <20260725-master-v5-0-75da459d2b93@qq.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>, kernel@pengutronix.de, 
 Vincent Mailhol <mailhol@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-can@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Cunhao Lu <1579567540@qq.com>, 
 Heiko Stuebner <heiko.stuebner@cherry.de>
X-Mailer: b4 0.15.2

From: Heiko Stuebner <heiko.stuebner@cherry.de>

CAN0 is piped through the Q7-connector to the CAN-Header on the Haikou
base-board, so enable support for it there.

At least on RK3588-Tiger, the CAN clocks default to 99MHz, limiting
usable CAN bitrates without skew. Errata documentation mentions
300MHz as the default frequency on RK3568, so replicate this here
to allow more bitrates.

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
Signed-off-by: Cunhao Lu <1579567540@qq.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dts b/arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dts
index 873fbeb8daa1..6273e695b039 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dts
@@ -155,6 +155,12 @@ vddd_audio_1v6: regulator-vddd-audio-1v6 {
 	};
 };
 
+&can0 {
+	assigned-clocks = <&cru CLK_CAN0>;
+	assigned-clock-rates = <300000000>;
+	status = "okay";
+};
+
 &combphy2_psu {
 	status = "okay";
 };

-- 
2.34.1

