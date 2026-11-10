Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794284965;
	b=FIJv+oM9Tv0hoy1L+tyzTqLh/K63PlwpRDFHDIUVmwfy0ozz95jiQRW5JoYT/VdXIEul
	 eUpY5xO87NnvTHasSUCamRm698gikjzTibPzYTR24gfJgXQ3s4MZVxzhZ4SSdgUgdCV/0
	 CTEtFhlazZyhyvKFrMQjg+9DZrTV+dO6QaHohm95B24bLHSmDwp+ZzWIj1T843PnGe3wd
	 TtTEcoVzR8HYlUp1p51au8AF1J/VE4ZykJAsrYxm6PLSW+Wtxh7ADajMYVEOWqPNapKwE
	 xGj2E5jFFJ+XlRVBLE3yZBW8XxK5Fo+b6Qr+V+n91KvQp7a9HIPMhxB0xfwU+gKFVqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794284965;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=oU84e4rENdC2Ajr5wnQYgmXRLgcMxlcGM1poO3t4D6A=;
	b=3/4JS0NHGl2BUp+55kYl56DjaaXCu1mOOFitmeec1ek0I/aPjlJMvLMGIaxTz/gWa5Bz
	 lZgwHe11v8uCD6qPWbLfldrPTfMz9pWtpwSOv/BjqhiXthwbVNkgiclrSny87Rm69KgIE
	 IZMgD1jlh3VY2VcjHVEUcTU6sjdSNhdOj2AxJTEz6uvV0GWFvUJnQUFxMaC5Vzx8fsjmq
	 vZnCxW9Oo/xDJHGZ+d/zn9Us0tQaHyHSb7Ir4sdZuNfwu+RaBSB88LYFrcm6MBwss3TN+
	 Oqd/wYu2UUO00WvLs+UFfamYjOHGpNA55fiWQBRPv2p0KPyQ/SwBb30O9KyW1R/D/EQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sifive.com;
	spf=pass smtp.mailfrom=sifive.com;
	dkim=pass header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=BNSdpTLC;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC63C606A33C
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 04:29:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC63C606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=BNSdpTLC
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1b244fb7fffso2030650c88.1
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 20:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1794284964; x=1794889764; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oU84e4rENdC2Ajr5wnQYgmXRLgcMxlcGM1poO3t4D6A=;
        b=BNSdpTLCxzeni26nLXimNwG3tsiucVXQvdSMs/iNf8HV6IN0yWNddKipGiTFS3jHU4
         TI4cBxxHxxGJYJrViUIZjBj+Pd5p3V7VFLTOzHO8sHOMeixUvTD2n2tWys5s4qLwYrX0
         I8IJ58etpTH3IkpJst1FRPg7vC2qJfxn3HOn4MUHhZLEvwWH29DPlteUISOoBqBfKNqv
         tkzWpD3UGhzOaf3vOF1AiqzoBqxUAZtIpbwvJO9qjMC7xbDGa/a+s2ZLNCUvcFDBl/yD
         esHGGgmJA5JEc+VYTPwliHIErINFxhsB0xh+yDpNkrLd04SWlybKODvFumGaeM7pnao+
         DvUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794284964; x=1794889764;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oU84e4rENdC2Ajr5wnQYgmXRLgcMxlcGM1poO3t4D6A=;
        b=GNgY7rQYpKSGyTTCcdJFRGvyt/k5z+Pw2kSirHBbJ15/Ju4TqzaORK0Ud3GgZCwTmy
         pX9Ew0e1Ty9RF9sd4k30CLQDZxTtW9OmWErsNX3XueNHE8c4k1xZTRR2JBfjNl1vtfpT
         r5TTprn1VrT2aM/SvshPQ9dvhhyMO0ix9ko0231vDovE1e0Ohf/p26Okla6+CF/cuqXH
         x8lbxPs+7bvF8YnR6slfAPrptuYQkx7tDmHg9WZMhbK1c06qvtSIFmIz6uG1VbBnfX4N
         f769WAnyhzxPT4/2DE8wvkVCNTMIagPU2u3ElAcGs64Xxe6i0yafv3PSTm5N2dRVPeJP
         SuhA==
X-Forwarded-Encrypted: i=1; AL+hErFHuYwK0yKTPhBthzm1JGChqADyY3m4eMba+RA9TQiv2c/dwm3e4Hf4o8sVkmemslbdHN7YVIYFirW0@vger.kernel.org
X-Gm-Message-State: APuU4Z+vVdVXZS2EgdWtzarRFiGgYhEAUBPKVXzlVcQ5cEn19hzr0GEV
	1q1zDkeSVK14dW1RLSyUg/mbZrPuN7MpH+rwlLII501lnGL5LG53yzmQ0fdBP1YJTYM=
X-Gm-Gg: AYBFou3tCD17Vhw4751wNNDmZxFMiZDxORtTbxO+/kzWGunWbxO83rwAQr3eHbt1O5t
	0GyEJzj8s6OHJCiOcO+TFpQPN145RmhFTyEk/h2iJjw/VPp38H/F2X56TyDjGCP72M2+Puym8oi
	BE96C1x4ecP1bY9vPrWWme3/AmMFy1bcUscfUYZjlsYBOJE/x095v1xyB3YUA64MBQYm6957pSS
	w2yPYmz3vxjc1pBPr8bNf1oauAna61G1b9v0X3Idqs9nUek58Rfmkw08qGVc80LHr/oSxbVP2g8
	kCoUxXQWOlkUluzldt3Da48uScrSlLCyQ9jDmiulxr92uZKNXSJF+zxtV8qNvBCMbmUt+GD2Zdq
	3Lq4R49e5GI+17RB0wXSguRYB7UfK1bVHRcIxK+efh3QVYW5rYlR++eNnZD+a7OWB3FlpDGfwvk
	2sWQYDfWFcPD4awOCP5odYfapeeqLJKXcsEpyI3VVnBytaOeha085ptygdoN8mqcBHp6nG9uq45
	9Dmzx1gyANpkfj0DwotMBQcpBJ82jOKbiSp62yFLw4ZxfXgglqAoYDKxY9LRwN7kyXzS+rLj7ER
	lKS3f4YEOcv6+ttExVCI2dJH5GxjGq74K0lAntcP3G35gowQW2JseclnoqNuUFUQmA==
X-Received: by 2002:a05:7022:4189:b0:1b3:b53e:b4cd with SMTP id a92af1059eb24-1b3b5fee29fmr2657556c88.21.1794284963812;
        Mon, 09 Nov 2026 20:29:23 -0800 (PST)
Received: from sw08.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc14sm3403963c88.12.2026.11.09.20.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:29:23 -0800 (PST)
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
	Anup Patel <anup.patel@oss.qualcomm.com>,
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
	Zane Leung <liangzhen@linux.spacemit.com>
Subject: Re: [PATCH v6 07/14] gtrace: Add function to copy into perf AUX buffer
Date: Mon,  9 Nov 2026 20:29:19 -0800
Message-ID: <20261110042920.2108205-1-leo.liang@sifive.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261001052243.3042627-8-mayuresh.chitale@oss.qualcomm.com>
References: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com> <20261001052243.3042627-8-mayuresh.chitale@oss.qualcomm.com>
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
> +	list_for_each_entry(node, &path->comp_list, head) {
> +		comp = node->comp;
> +		gtdrv = to_gtrace_driver(comp->dev.driver);
> +		if (!gtdrv || !gtdrv->copyto_auxbuf)
> +			continue;
> +
> +		*bytes_copied = gtdrv->copyto_auxbuf(comp, buf, format);
> +		ret = 0;
> +		break;
> +	}

This calls copyto_auxbuf() of the first component in the path that
implements it, which assumes only sinks implement it. On Eswin/EIC7700
pre-ratified trace hardware the encoder and funnel each have an embedded
system memory sink. Whether a component is the sink depends on the
topology: an encoder connected to a funnel is not the sink, but an
encoder with no output connection is. In the first case the data would
be copied from the encoder rather than from the funnel, and under the
funnel's lock (the same lock mismatch sashiko pointed out).

Only the sink holds the path's trace data, so could this just call the
sink's callback?

	struct gtrace_component *comp = gtrace_path_sink(path);
	...
	gtdrv = to_gtrace_driver(comp->dev.driver);
	if (gtdrv && gtdrv->copyto_auxbuf) {
		*bytes_copied = gtdrv->copyto_auxbuf(comp, buf, format);
		ret = 0;
	}

Thanks,
Leo
