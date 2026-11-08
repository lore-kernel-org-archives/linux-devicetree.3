Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794138469;
	b=CdzfB713M/y+gqiVR6cDE9HQo0RH1llWnS63eczMZ772elu97hzR4XKd8VoRVf2OZTOL
	 YgGfRfikKQYtOx84WCXqC0dmhojLW45cuPhqOKD65vNUB4oHjhGlWAqBG+hoZVb0Wv3Px
	 BON04s7qvuyRWc03yxip8408Q1yc2Il2hKoW8DWoMrdvewi/O6oYBD0/y17JZbvG7ZmYq
	 inUJ4ZLGUNQS7LIdqTTyY47b6yM45+YEGphehRQxiHJ6x4rd/kcaKDRiIoCKY/B+Ezq5k
	 /WswMq28w8mKUi4CG5ald1VkWGZZBKG8VQZwefgOZ0DGwnqekAn5JoJjvlzIEcmL66g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794138469;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dH6h1kBUvb/ripshwEjaT3O4DrKwOfPQAnnj8h0Dg4w=;
	b=lulpROaTU0YxLeoeDJrylfByyzIwEF4wOScj9RktCGJVW2Hh7b1Itwg2w/sBMVaYgJy0
	 SrTnx7YrT5KgscjUpTxJ9ALOhTBLMVkhdAv2vs04IgxTP45wgRH9s1cuid5mq7Sc67OkJ
	 C6meKFynE+5NdGEfnEklKzIwLhRpwn0E4zTkvFv4JXtD9oZpu8ayBj0EhsNsd5jAcuTkb
	 G/fiLN6PgHMtSKpf3pyNwfP0NSZjflRxnezyRKlbRbtjcWqSYHqkHFCxnD0eAhLlfyJF/
	 87OS1/ZmyFFhgUwVwGigbMENyxzZKLYSU110nnUjnfbDvMbhxv1cO7H2xvJQXj2nAEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=TNZIiP2m;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3B6606D805
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 11:47:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C3B6606D805
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=TNZIiP2m
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c4d5b2db4bbso3418966b.0
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 03:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794138462; x=1794743262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dH6h1kBUvb/ripshwEjaT3O4DrKwOfPQAnnj8h0Dg4w=;
        b=TNZIiP2mx/Dm+kFpt/r1t/gzDe0z+B+AK7jZUUJVHZpQaqckKljPzg+WE/0kBtU+LU
         odAmcgVPrwsYZ1LD074BZUd5uktTD309486lqhSxLZDOwmdkAVejFdzQQvmgxxr8rsIy
         S4zkq41lg4u/Gr9jLBMqaDftfK8631vgHka5rqjiQDQNZjkgJEX748C4OTUa3OkFTMXt
         lF12ALvJkxrWLdyNixF73d8KRL7gYbfOL6cl3/b1b3acDicR5gsAyDE6R1vm/aTx8KVs
         rysc7GMPhbWTd+ihXr7DxMSjDjYPD0U+MwEqdrq1OlvCwWFHqceYaKulD93/xsJNMEOx
         Fs2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794138462; x=1794743262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dH6h1kBUvb/ripshwEjaT3O4DrKwOfPQAnnj8h0Dg4w=;
        b=UUTZJ0Zcw0G5DEmyI99HqdnjMkJ5HGX3oITCYm14zHLX3FYxX5+AgDox7c/N3Oukw5
         B2OVpG2hV6M+0SK3rkTc/XtXHn9L49QS2ntXtx5+ltqySyCBYZtTZTr9PxR5rWidkP1A
         ig5RdqeM9hfaSwUZNz6KvLoTGETAGUFdL5v7TplAX59ZmohTRHMmB7dt072G8+KwGoDy
         JZdb3tPU+VvhhqCYZBEtlPGGYqrl6O6whwfFzISViszhuwISCV/a46WSKYkLS5cA6nBs
         Nxe1eKqChlq3vHwpH8ZW+uHM8pS3ES7c+DOFskHhks1/HSSWM2mKW4ythBiEf2cegNiJ
         P0Og==
X-Forwarded-Encrypted: i=1; AL+hErG7jxZaSe3RqFIbleUoZuE5dXp3I0ytNY8aCB6Io82gWc16b02oQJk/zG3RCyBR6GEWI3kvZFKGNma1@vger.kernel.org
X-Gm-Message-State: APuU4Z+aNngBBnsU0H6jmcdaoBChhAwolv9h01C+bT6n1WDIW1qouffq
	d8+ILYwQcQfRbuvcruqo3TocMSWBVjlpY6fpArklkdp6v6L3xMnp2LbgTeO1Nf23iQ==
X-Gm-Gg: AYBFou3uCEaRcAW1X7uncecgHE+dIWU1vzDLhV177OeocPn1w3uyc1EsrNhi7AaDZ+J
	qQV2qnhc2bLsgz4C7fsLLFkunBkhG7n+ANGmPtNywkdBuCH2lwlzuoW6mZhygMyWS5WG3IOjmsf
	uYVtltHao5i8FTk3qXLaIxR8mtokXXv/cCjjptjfwd83t5cLr755KhSV4tfLbR2QncXa1eJjSG/
	AmpAgcQdlULWcewVgVJ499HC9EVOR0SJYfS0FZoddrWTjtYGb8busRqfBxh2HA/0PevwVpp764a
	hWIDD7csIpEezKWEZMVwk3LbqnLY5hNFOGn0KJhpFJn8HkIG0yUDa75kylV69DGQKpfWCrrFGMC
	SGQ6Gcf+2+l5MurD+krY2g6bhZ58Aq4z6agJHr6fRL44e4q5B1UeRe0x6KVUcjBb/mJs60/DA87
	DG/Kysn+pBMlobC/YB732xtpVy6svUygZ3Xu2Dv55JtMYrsOfCeDAlZZiGjzIujCafkoVfR2ihS
	VlxuLffxaPuARyutyXtxLWdF6+bq8Nq7oOSy2BBpgTVrAy6bNnmQWkIYjRi6PwLasb4I/Ji3ikE
	qfEuOmLXBa9lV/v0Crmymbfoic3o1HLsslG24ef7v19gBD0L2y7uKsLl8Zao9QS+H3rAb95S78P
	Ev68m3B7Z6Vf+s70V9cgGfHdvqK/CD4xBoIf4jxK1Z8e5a1wJQQYMVM4KhuUMaChNvE2/KvMMsq
	1pydh7gBhTZFHW7jyeamCT3Yoaf/v9joe3Fuq1ZPzCc/zU3FlXSnmSZXRR4u/o4RGhZR4YGsUdi
	8OUSSmTDN2Wle0hx4oYJpv/9bhaqmSvppi4UE/j7PFbi+wSjr8/S4Mhk9ZhQDJdYUYogJ3N9wsv
	mNNVxB/ECvnKOBzfw9s=
X-Received: by 2002:a17:907:6ea4:b0:c46:8b87:c212 with SMTP id a640c23a62f3a-c4d6db7c9b2mr101123266b.20.1794138462143;
        Sun, 08 Nov 2026 03:47:42 -0800 (PST)
Received: from Desktop (p54afff19.dip0.t-ipconnect.de. [84.175.255.25])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a999b01sm56346666b.77.2026.11.08.03.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 03:47:41 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: robimarko@gmail.com
Cc: andersson@kernel.org,
	abelvesa@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	taniya.das@oss.qualcomm.com,
	ansuelsmth@gmail.com,
	john@phrozen.org,
	konrad.dybcio@oss.qualcomm.com,
	abel.vesa@oss.qualcomm.com,
	krzk@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] clk: qcom: gcc-ipq8074: Align CMN PLL inputs with binding
Date: Sun,  8 Nov 2026 12:47:41 +0100
Message-ID: <20261108114741.125238-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026120920.1667982-3-robimarko@gmail.com>
References: <20261026120920.1667982-1-robimarko@gmail.com> <20261026120920.1667982-3-robimarko@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

(Resent with the lists on Cc; the first copy went to the To:
address only.)

On Mon, Oct 26, 2026 at 13:08:14 +0100, Robert Marko wrote:
> Keep the existing .name values as fallbacks for older device trees
> without these optional inputs.
>
> Signed-off-by: Robert Marko <robimarko@gmail.com>

Tested-by: Julius Bairaktaris <julius@bairaktaris.de> # Xiaomi AX3600 (IPQ8074)

On OpenWrt with Linux 6.18: the NSS NoC clocks run at 461.5 MHz from
bias_pll_nss_noc_clk and the PPE and EDMA clocks at 300 MHz from
bias_pll_cc_clk, with no orphan clocks or probe deferrals, and the
EDMA has been forwarding WAN and LAN traffic for 20 hours.
