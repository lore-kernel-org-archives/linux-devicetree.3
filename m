Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794284743;
	b=QVYkRg7rmm/xK/fmQQsV4pRkToXRzmQcj87vseBB+wNAfXa5zEYDnLQZLJElGfWyxvdP
	 wpZTqAogoEZFK5nkIacGrWfWyINnHaI7R4EYxhnueWrygZLWz+dO6APTucpseHjSCkQOC
	 SRuNw3+6dJMyYfxrHfjovxIKq7IXTIkdqzNzZB8m5WPBPqFGkrmXoIc9r5MtmWCO3KZjb
	 L2toTEpjgdPfGGQxI3mvXDM3Y8QvgMsJYocUWS4TyZOgemE5RoNRuL5Djd2UB1xzplBsE
	 M4D1+8htqxshkuSlUpGWM5srO6dsbupcXNNHlbgk52JZp7YZZ90Cz4bkZe6SEPzyRCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794284743;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=1BVULNa/1Rp9ZXapIYSxxjj8wKCBqwmoVvQwQgDNj6o=;
	b=A2riXz3Q3ZYocqZlsMsnSdPAYMn1NuSTkE+TVItKtvCwh304L4s8dctF3VyNfDl5vmKb
	 1KTQdUnDmd+pmYOfUUUq1gnAjxZa/XfQy1+e+XA8Z1zYoG5ZgRXlGmb2eihQJ2x4BCctw
	 W/LGKVqslaS19vdo/MqfXcIFmI+UC6gPIbvNCj69xYMkPWYUuKCUqVK+cEQIIjc3pVVS0
	 fIFn+mKqViad4dKTV9K/VDP5ENnRIr1+yJV+DHsbVTtSOlRJ6SJUWJ04ODI7rKhsgXHiR
	 8XcLXnqBULMIMuYgShC3QuGypKAuH7iN1wYgjwJEcI98WmkEr0UAWiQPKnKZdpnBm1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sifive.com;
	spf=pass smtp.mailfrom=sifive.com;
	dkim=pass header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=Wseanp9e;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E986606A711
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 04:25:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E986606A711
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=Wseanp9e
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1931ff67a29so397422c88.1
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 20:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1794284743; x=1794889543; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1BVULNa/1Rp9ZXapIYSxxjj8wKCBqwmoVvQwQgDNj6o=;
        b=Wseanp9exIs8Ef4kDq7IH5kK+CnWM7ac8MXfzlrCAd/RVTIIAve+Evzw/vf/8Szlq/
         cBWNrDRLSEfKnJSDyD6mNAZsgR7AYC/25FQkAmzncE8UI7Enr6lULBk3F01C8C6o9+uF
         /Hj2aKCHrIuB24Mexx3+wrdWFshW44/eJVDUC0Yw53YRjUZ+4mZ3oZMu7BjaGldqYTxb
         rFreiiCA0M+WQv2ZfkN/lKrm2MDalQf8DKYLxoSzVovbIYuaAhwWqAn1oPbC7Y1JnDVn
         b2xNaUH88U8xvgx9RPXFaGqarVpFqkGMyagwsGQLMrJEB13GRmqkzaqOYvg+uK6tPmXT
         7PXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794284743; x=1794889543;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1BVULNa/1Rp9ZXapIYSxxjj8wKCBqwmoVvQwQgDNj6o=;
        b=e3cFaGEbooOd1w5kvvl6xsO591dv2l4JS5n5mdsWeCfJ15YJRlu3uNa3mLOCbwu24y
         FtohjwWJAu0n2j02DXPk8Gttj2j7hKz1SYdOdfeNpwiIkvX/BixXA1v8i+Y3hMSHFgVR
         RXlAda63wanmG9+Ud70F/oqbPdbkXLJ23aAbQfxsZlJCQRMk98Pr74YA8f896zV+24e8
         t6F1wSMEjlPUjFve1msacDojKtB3SdnO/2ixoXmwc3jvzpGFWKcbxq0uiXYHagaPAl4/
         HGxD/2+xkuMyNkG6oiyisimXgkOSNj+5+l6DyTgZhege2XEjocD9CdHsfHpj8DzuXdXs
         167A==
X-Forwarded-Encrypted: i=1; AL+hErHLBdBU8B5Ai7pWbnzn6ojfDo0qq6GHQETWXopkRLe39QXbXcAmplLyawpXqSn6Fc1j+q/viRycRqOS@vger.kernel.org
X-Gm-Message-State: APuU4Z9q4NhmMBocHF5TUmceDRapYoeMpWeHFc9gTxQ7HPfRpavUKS16
	e6BcJjAr1tc6n2vfUWZl+vghNiWgnZN+pWg7TEu/lHBctJr2DhShC70PzAcrMlI+PK0=
X-Gm-Gg: AYBFou1+ud0r5FieHNim6xiCTsHRiUIwR1hcoPjA/CQDVT4CO9YV94jC1LyfogACXIn
	Hu71/ijY/kcZ0bt5DpQ1RlnKDPEVsGrRMYGgSDPfjklE1rTQqlZ+Dj/j7Diz7/c1bGETSeKVswI
	tzkA+upM8gJLsn8RTfMzCa3X7dJmkAuoLw68m0McYSeCJZyjbVDSi/RvKlD36dK5a2M5js7MJZH
	cUFD89/U46waYZSOnvfrYwepURoq2e01YnZO/qpdw8KvM6B/LRPhKKqO6dKwRpwkOuSBYsjfO40
	zibcGWQxjza0JRqWMaLu0pVKDwK4NXGUnOcPwRUByW7X+O4/eInubLdF5+2s+FclnIwRImBMheA
	rZ/LdCAN5c17+8v6iWjDnIUS2V+GwuBKcX4Bl6SFZqARJ200ljarMv+xk4qbPtcfEyn4X6XjS1M
	ibFnxVkjD5QqXJbyxadMDaR1UI50OuJOifNmtvPuGqNiGkETPQv+Jw5WKrt5x7XAAzQZwQ8WX5T
	xguIDO7Mcr6V8aFeVgfE0J2Hue6UxYlIiaH2bt51c3/BJO0hhTb5xJ3rwzEj2hp6RgurpVvynP5
	Z6Fxksv3U/4hjjs3XfXgECKHZVbdyxx4pq4178o8yGht
X-Received: by 2002:a05:7023:a4c:b0:190:f24b:9491 with SMTP id a92af1059eb24-1b3b6057539mr1957259c88.12.1794284742599;
        Mon, 09 Nov 2026 20:25:42 -0800 (PST)
Received: from sw08.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b72ce0sm3968811c88.18.2026.11.09.20.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:25:41 -0800 (PST)
From: Leo Yu-Chi Liang <leo.liang@sifive.com>
To: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Cc: Leo Yu-Chi Liang <leo.liang@sifive.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Ian Rogers <irogers@google.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Mayuresh Chitale <mchitale@gmail.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Sunil V L <sunilvl@oss.qualcomm.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <anup.patel@oss.qualcomm.com>,
	Zane Leung <liangzhen@linux.spacemit.com>
Subject: Re: [PATCH v6 06/14] gtrace: Add RISC-V Trace encoder driver
Date: Mon,  9 Nov 2026 20:25:36 -0800
Message-ID: <20261110042537.2080084-1-leo.liang@sifive.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261001052243.3042627-7-mayuresh.chitale@oss.qualcomm.com>
References: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com> <20261001052243.3042627-7-mayuresh.chitale@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Mayuresh,

On 10/1/2026 1:22 PM, Mayuresh Chitale wrote:
> +	if (!priv->srcbits) {
> +		dev_warn(&comp->dev, "cpu %d trace will not carry source id\n",
> +			 pdata->bound_cpu);
> +		val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
> +		val |= BIT(RVTRACE_COMPONENT_CTRL_INHIBITSRC_SHIFT);
> +		gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
> +	}
> +	dev_set_drvdata(&comp->dev, priv);
> +	return 0;
> +}

On a system with many harts it is hard to tell which encoders probed
successfully. Today the only messages come from failures, and the
gtrace_component device names (encoder-N) do not show the CPU or the DT
node. How about a single dev_dbg() (or dev_info()) here giving the bound
CPU and the source ID width, e.g.:

	dev_dbg(&comp->dev, "%pfwP: cpu %d, srcbits %u\n",
		dev_fwnode(pdata->dev), pdata->bound_cpu, priv->srcbits);

Thanks,
Leo
