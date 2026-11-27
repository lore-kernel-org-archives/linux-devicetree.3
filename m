Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795780349;
	b=f4M3gxhHt+M8O0DyzsyII9A6oCHPDFlDFQwG9B7IJG9P2QzhBm9TTqeABdvJum9nPMbr
	 Ie6GIJyYfOlGeVZ80jCDiXtohyPzpUjiPNpq9IzPHmL/eGY2K2NLfs5wdCgEHVLDAunIv
	 KKyy/2RNcprSTwfqDeqm5ZDm2tgFlOBjJIs94TG+LwVzvEPN6s3Ln12G7Rl1+LrDJ8K2z
	 fFBpy0W/aMLN1TTht+cLgkJ8ADhviB5s8KeC4fVNonvJ60OjeeA45Q5G+/34EhNB9INoC
	 ys/CBC8Hs+vetWcur0yGO74AUQ7z/hWl7o26W94rLrY5dfj1N9Mc98vBSKI6qWNxlVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795780349;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=FAJG0Cm8iK7ooiHtZy1IKI1M+UemYFB/E63Yt/cOp88=;
	b=swgjB8SChuv4JRZ8iavZPYhxyef++Rdh01I7dKusphgdNyQLZrIM5A7GoEQcjBARHY8S
	 tWEEjBR91jLc4Lm+3t8WPpR8HMPDgotn529XMkF/noky2/lryqBAS18F1hHfJR9AHJP9r
	 VHvPAZ6iN7bLqZJQAVDSJA1mUfcb4AzVWXZsfzdW9K/f6yCveh6/yLiyzGjU0oxg5FWLW
	 u2WRC7GtUeUdR3PhmhPMLdfQJWE9HLv/RViiS5BRiHNISHzFMBhLnx+dus1AyunHoJQuM
	 THyX6Cxe7361E7PMF6usghgC9POByxIsakvfFpSIC+iJ/Js5Zj/4olAxFi26Kk9xTQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lhK+8mP+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id E33C6606A31C;
	Fri, 27 Nov 2026 11:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lhK+8mP+
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 05D8A1F000C1;
	Fri, 27 Nov 2026 11:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795780348;
	bh=FAJG0Cm8iK7ooiHtZy1IKI1M+UemYFB/E63Yt/cOp88=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lhK+8mP+6mXwhQPEr3aW0IQry0YdliPqbrYMMXs4z7O8JNBW54cZuBO9gtRqWa8Op
	 M2/pAUi3NNoiCkPunWPkQBSUBZ45+bvw31532sY/K6tKBwBL6Av2iBLYtkx4X5mTdw
	 uBonH31kIq9IUisrXyE2d9zuS/Pgw+C8gRL3TuYwZVU8K3ZBFduBYFFsKAKkB7CBkm
	 9yout9MPhHqVPy8BvLM3TbbROiafJJ6DdLRAguDActtkeqMiT49SE+3QbRWyG1t3G3
	 CzqKelArcZb1BZ4RGi5gwupKQZd5IKavEr0khb3Zi/pNM3HuCGCOKk3YhdL2A7wbLt
	 HihN+/Cs5Zmpg==
Date: Fri, 27 Nov 2026 12:52:25 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Cc: shengchao.guo@oss.qualcomm.com, andersson@kernel.org, 
	konradybcio@kernel.org, bartosz.golaszewski@oss.qualcomm.com, abelvesa@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	Jie Zhang <jie.zhang@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: nord: widen SoC bus to 40 bits
Message-ID: <y27gbrfz3gz5a5pmbu2ezs4evxgah3mhnzs5ndiowrhcx5iyjo@3w7k2hu2jh7o>
References: <20261127113326.2889944-1-zhangfei.gao@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261127113326.2889944-1-zhangfei.gao@oss.qualcomm.com>

On Fri, Nov 27, 2026 at 07:33:26PM +0800, Zhangfei Gao wrote:
> Nord exposes System RAM in the upper DDR window starting at
> 0x8800000000, beyond the current 36-bit bus range. DMA mappings for
> pages in this window are therefore treated as unreachable and may fall
> back to SWIOTLB.
> 
> Widen ranges and dma-ranges to 40 bits so capable devices can address
> the complete DDR map. Devices with narrower address limits must
> constrain their DMA masks individually.
> 
> Fixes: 5e97460df08d ("arm64: dts: qcom: Add device tree for Nord SoC series")
> Signed-off-by: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
> Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
