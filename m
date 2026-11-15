Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794704062;
	b=KiHVQh0ODTWG7kxxJQECFKDwO//fzdqBtLcG4dmhen3ehRwDAhRgjQ25CxpDxJ7i/GAn
	 Iy0Rl1mwnj/aeKqPDmgUY423HGkA9F+IYGZZALjxfstjM7h1wosNm0e1iSSwgpSk7dkPn
	 xfr52Q8WPYZy2ZSkTj7eBomJ6v/au/uXt7D2QyQLfoQPHltdJjl9FgMt+oCVN4d2KwEtP
	 8/KP3OJwDL+vMBPoZ2tF7R6rQcT/7eQWRMjkvBGnZnZX2jwb94Vq19Wc7MVMA+ov8assK
	 +vjdUy+ev0fZMhBCbk2O/LeDbCNI7/pbUgM330SFnmhNzcNTAcQLdUokduKQUgRjpjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794704062;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Reply-To:Subject:
	 Content-Language:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=wom25+2wqiUds1POyI+eHp228E/IXzic3h0qgPh6IYw=;
	b=f8RjUuSFpjHK5i/ZVjeWDCihcXWez53dfoTrLTNViXKqmi8f7idbh8/819gvKsuU88/8
	 EC6vVK1/QYwqTDR1qSrLMClJOxXYitS0VWZoA7jQGsaaOFREQahbzR3iIYlePk2TF8sMu
	 wzB0IFwzuyL85tjMnfTobPwURkSxZMB/q1OJtts1E6G7VUOWCvoIKB52AN0Ji2m69sAbw
	 8xIB1rLWgebWn7wWCOnF929Ujd3lakWajKm9YlpQ2dN+V2wbIfr07VWk2eCkpQ3DG9im0
	 8hI4Hyu9CrIBnf5+dRSObkEIjt7i7zTujXfs8M+hEB8MOKBpOFVZwx0PFRLpCyrm07Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JecE9e1b;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CDF606A32E
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 00:54:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6CDF606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JecE9e1b
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1a3c08d6928so3035039c88.0
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 16:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794704061; x=1795308861; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wom25+2wqiUds1POyI+eHp228E/IXzic3h0qgPh6IYw=;
        b=JecE9e1be6XXuDyJ7bsgq/w6HNy3eTpyXi1AnZBs/ei9qYWQUmrKztlbQdKX0HcKqb
         4pgIkEA8JoEfTgZWYZgcyyZQwbzGqa1gKXYfeU2pAlHETUAUohb3vCfaYlgmuSgitCgA
         RULyMt+x/Bt2iWu2zJdswd3YMeqTdKOZni+eTnFEgD42p9ze+wPrzfs8wqG6lIhd/9xC
         oBZX0inwvbqy1FyaQFAqtaAkPfp/WjqDbKQD4eZ/zlYAwLJs4UOdXYv1Wb/dtLGUdlQy
         Dz4UFFvuQ7VGcgqkpyQ24FzjW+k4VXyWNs9/Xvn9UcaUg/F9U3TUFT51OEwBoOKqAJrP
         sMsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794704061; x=1795308861;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wom25+2wqiUds1POyI+eHp228E/IXzic3h0qgPh6IYw=;
        b=UJeykr1k8MePSwGTiS1JGApHk1xwVbYw1GR7hl+SVm5Q0kHXlRpY/uMjbd0hosS3U4
         aOmNXen+TXzmrUKcgv1INsSjcGJ1D6GbBeTPDsP6hes9LOq5Cr6TFIi71aFrF0qsVzrH
         bICC9gFsPOiMRNTjXVqLyLuj5Y67jCIlWGITphPuVNOe93H39y4RZ51XsUcs6+Jb8N4W
         oc/eqIIC2raw49Afot9oqDDLhvaqmg04lYRew2JsEeQAP/kcv13NB5AWxX0FJWcZhDrh
         4Wq06JFvCT8J/5GI5Uraovz+aYp15/8jfNnadmBSN9MxoqR4CbmlAm9zSTgvB7HAFKKv
         HPvw==
X-Forwarded-Encrypted: i=1; AL+hErHTmWamOpXbgnxLOAxcXq1aPtxMEowbNa89fy3UyW8GeB0C9XHY3F68+BTt5ZvgRENYIRBINzZu4x1b@vger.kernel.org
X-Gm-Message-State: APuU4Z8kVvWbVsUvy4EMTwN4VF8GRyyh9R0jcSOSfR2mA9ndbO0p+8Rk
	U8tnmglsAqcAt94RGYgM/ZxoEgnzwv9ZNvShLFeylmtXTlr8Y2kJObJZ
X-Gm-Gg: AYBFou0JfbRQkJdecfNu4MLhn0tnWB980NIJsYUCD9WEulFtE82DOrIq3BK81QVKoph
	2kuONDpQBn7dMv2ppKBv72Quh4CMAYWWKKOCX6komSa51C222Ov+eEJ8RSlgOqldOOO7CAI3cVM
	QbgfnCKrGHn6Mya3K+9c0ZEn6RGHY2bG1ZLfy+s+0fZFpeMyJ1dSyPwEV5LAMeoOhm0Gf+kmdWQ
	woN7Sb1CEOipFOVSQSa8ZvenRMp/ZtsAeOqdgL3qq4j0TeGnBHnRuv1dxqF/n1JkCILS5SoIil8
	8FmmQ4Y4OTb0W9K3kCvtAMrF6t1csCSKOtKYdE28a2rRg+C/cK7pTWtxDgXK4FP9QUTBB+ya7fB
	wwWaAwXUcw49fbE1XobAQBxl/QUPD/v6FXFNsvRJ3m2K46jh/aMCAu5QRyfRfOVptr7O0zvd9f1
	MmrG7X1fErVPblIT+qVa+Zfk5fhA265NJhjI7+17vhNlLBTnY6pyoBqpifaiT4k1ih3JI7dLL+8
	FbSMtNyStB9gJX+GkuOMhvcowWQR494AZ9z/LXHSuaLrLW21TA224Cd2oTwYWlKOMf10IlMvEC0
	+N0GOOczsV40zCtyTSbkll4VAN1T49//GRODoOnV7sYv3iH7IiFpbbOZHJz5jqbW/1s=
X-Received: by 2002:a05:701b:2706:b0:16d:dd5c:4261 with SMTP id a92af1059eb24-1b503120981mr6267107c88.46.1794704060898;
        Sat, 14 Nov 2026 16:54:20 -0800 (PST)
Received: from [192.168.35.43] ([218.50.238.131])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50313d8f5sm29598546c88.3.2026.11.14.16.54.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 16:54:20 -0800 (PST)
Message-ID: <9c1a915b-dbf5-44d9-88eb-680449348dcd@gmail.com>
Date: Sun, 15 Nov 2026 09:54:15 +0900
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: chanwoo@kernel.org
Subject: Re: [PATCH v2 4/8] PM / devfreq: rockchip-dfi: add NO_INTERRUPT perf
 capability
Content-Language: ko
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham
 <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, kernel@collabora.com
References: <20260921-rockchip-dfi-cleanup-v2-0-43ff34ac8599@collabora.com>
 <20260921-rockchip-dfi-cleanup-v2-4-43ff34ac8599@collabora.com>
From: Choi Chanwoo <cwchoi00@gmail.com>
In-Reply-To: <20260921-rockchip-dfi-cleanup-v2-4-43ff34ac8599@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/22/2026 5:32 AM, Sebastian Reichel wrote:
> From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> 
> The perf subsystem's PERF_PMU_CAP_NO_INTERRUPT is a bit of a
> misnomer.[1] Instead of meaning that the PMU has no interrupt, it
> actually means that the PMU does support sampling. On CPU PMUs, this is
> equivalent to not having an interrupt, but for uncore PMUs like the
> rockchip-dfi PMU is, no meaningful sample data could ever be generated
> regardless of whether or not there is an interrupt, as it is not a CPU.
> 
> Since rockchip-dfi doesn't seem to make use of the interrupt the DT
> provides it with anyway, this was probably never a confusion that
> existed in this case; the capability flag was likely just forgotten.
> 
> Add PERF_PMU_CAP_NO_INTERRUPT to the set flags for the pmu struct's
> capabilities member, so that the perf core knows about this limitation.
> 
> Fixes: 4d586b5724d3 ("PM / devfreq: rockchip-dfi: Add perf support")
> Link: https://lore.kernel.org/all/20250619140442.GH1613376@noisy.programming.kicks-ass.net/ [1]
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  drivers/devfreq/event/rockchip-dfi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/devfreq/event/rockchip-dfi.c b/drivers/devfreq/event/rockchip-dfi.c
> index 5339616f7ca6..dd9edfd6a674 100644
> --- a/drivers/devfreq/event/rockchip-dfi.c
> +++ b/drivers/devfreq/event/rockchip-dfi.c
> @@ -646,7 +646,7 @@ static int rockchip_ddr_perf_init(struct rockchip_dfi *dfi)
>  	seqlock_init(&dfi->count_seqlock);
>  
>  	pmu->module = THIS_MODULE;
> -	pmu->capabilities = PERF_PMU_CAP_NO_EXCLUDE;
> +	pmu->capabilities = PERF_PMU_CAP_NO_EXCLUDE | PERF_PMU_CAP_NO_INTERRUPT;
>  	pmu->task_ctx_nr = perf_invalid_context;
>  	pmu->attr_groups = attr_groups;
>  	pmu->event_init  = rockchip_ddr_perf_event_init;
> 

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Principal Engineer, Samsung Electronics
