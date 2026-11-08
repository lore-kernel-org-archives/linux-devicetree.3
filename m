Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794138461;
	b=rY+3PT7OkPyk0DPmTNU+baHpe3MjnPwSlNkd3Y0HWX1M68aba5GgCh3WRYOc69jy85he
	 d8tmAx/LIuQtIrCGjVNN7QNSLcS4W5VfYUrJ0FX67Ks7CXW7sRQo4Ze6T2OxinARjfWsU
	 +9E5BIKm6GgUe8PBhbndmhKjahhI6345OO3fqrEgCuL6p7p6UcWF74NFSJqzMhUq3vu+5
	 tRhSTG/QB1SuaCAwO1N2eP2yqBSsaTq7aEZ9dS7ERT6nPgMDWv1qpcyZo+X1mFIEeU/S2
	 c2OJeISi9U6sEyusOS0u+5s2RXOa+JlbSL4p2WJESWa2AQ7hnd8aicIfpexevba1IJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794138461;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=N8zDFvi1hwLlYUjQ4trPMNS9MFLc9+fuiBPttzeF26M=;
	b=NVlNDl6PVNZOP05yY1cPCviscbtEZqMSX/sFn/hSOR4NXvsE55Arl1vjOTVxeXdj0AWd
	 bVaxnfqCUP9Q8DHPVkEeFU3S+3LYjBOc/JbgkMLn8XDtT7yvHjhOzx1wqbdjnctVxCNA4
	 zPiZq6McGoslX+gKenBdhd4kkQjvOr2qj9SFuX11iswoFa2dGu5NCgxhJRodLBv981rAS
	 ruBmodKUaENch+mrX1Fp0myLxXkyp++Y4Lr+WSRp935b/h269bKfIdQ6BwDcXlH6oFsO1
	 WlLlhUWJeLdmEJpeEy3CnnuYt3q/Z4Whf/1vzHz4s16Np1ky7E4hWpxwvkPxIwyoCQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=kYDIvc8H;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527BA606A323
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 11:47:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 527BA606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=kYDIvc8H
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c3f8d72d7ceso7027966b.3
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 03:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794138460; x=1794743260; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N8zDFvi1hwLlYUjQ4trPMNS9MFLc9+fuiBPttzeF26M=;
        b=kYDIvc8HNmoGxfswBqPc/bn3mblGxFo6X+NJ3L6oqsxEZkkr+m4t0mn2WCfFkisaZO
         +KFV1GKZrUODGH1jwVzp2dNnj5AQFg8tobqawkkepyMCV76jlsH26F4xcbj5rx8O3AwI
         9y9XDB7H4Mj24QgP7ASo8k+gnbTy8bB844IB0ftN+jI98Z6wP7IalktLXytAnly4TLSb
         tnegld6MS9agPwfzU16YT5rqdpiykyv6RmW0AXz+25fiT4fvHfhrKl7YCilvolQ7pby7
         KCM2rNosTVSg6+YYd+rjunPAhjVoIVGBUQnx6yoLGsIubCuL3LXN2LPTQd2tbfdK180W
         7Oew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794138460; x=1794743260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N8zDFvi1hwLlYUjQ4trPMNS9MFLc9+fuiBPttzeF26M=;
        b=wFLBWmOpnWwFbNERaLQbcA5wMPj8vMDhZq1hHLO3a++FEQWySnqS8z6NEZ7O4RgNRl
         1ZayIR/epXPSnLx+h2gTt4aH+idc5QRcl158eBWTqCuLBN+1GdsW3TLEvwEw+CVtZbR/
         uVq0Z6G7049nkGQlPkezijlW8q3z3tJXz7O7PczAbEOSEwlwTVMSi39Ozh1+2RsE27oH
         iTTcykB64OE0Kw+Qh0x/MdRZK/yKL42qiA+8jYHUplhidYjKRm6qCAx0aqk7bscJLFLP
         HbiBSUN3asuW74UiK17DyJov0GiQMBuaXKukl3N9se1JVDIbsQopkTU/Lph/4lpbX3xz
         ulkQ==
X-Forwarded-Encrypted: i=1; AL+hErEGLoU8TKE8DmA5V3rzyyaQ5j7jqQdW7wim6h3gEmUTy05XpUkKFQxRgtSaoSA77GTKXaFlcpZXD+mM@vger.kernel.org
X-Gm-Message-State: APuU4Z/CzBpX0iwg8/aBItPzR1IYmKrhi07gJTnJXdojj3kYygZyG2fS
	5Obg/vsPXpeCSZxJSMZuR9NhDoyolHeLVtYGm19BaPsKx3vDMx/PQ+m3q/YgPSBMDg==
X-Gm-Gg: AYBFou2XwMV+o4DGr620HsGsSUQThX4AO2S8BGnsEA0XbskW4fFYY0A6+f+1n27vtw7
	DAr/4yw+UL+cWIRVcKLywP6wWbrxWxmLRWvd8b96Ou6HRiwez/0A2kPIw6Q4sZOa4LT4ciJ1WDO
	fa+Hxq4YWwrLdlPTw9BYvG+ck8vDMwOWCO2kGcyIfJsQF43NkKDlVRQ0pYk5xBHifSYMfVQML1O
	GmG1fBh4ubZVCM/tajx4E3H5nzTMFAWKIKVgL52IaPqCSYI2hTf7wcF2qKxDT5VamW8WqDPL+G9
	RcsQXgewzTfx6sWk3jdqPwNiiHHBmyYCE2GoMfXkhm6e8aAfrFlXeG7z/Hj5mvmlg2WNxISYFln
	9yLJsNTuhUGIDq56H32gKN39Idc/P9Iky4pYpFiQqT5c9X5Qs/hnI1Uf7Ln6xh/ryyPiw/KAq4o
	7/0W4QtczTq3movU/8CNVEubYMWVzWrfSC/GZyT0IfPleHcaUseqYeQAqOCLp1fYgzY1bCsIMZk
	gyb5cGPDWkbhsqyoRq9oYd4uIrA+yJBvzzKbarK3radKs6X2xSpFoowamM4FHXuggJpQHrTlMTB
	evqRCGy7zSi+sRl50g6QL/mE5p1wrG28cWyiArLOML63J9Pc2NZAwZenF56SNINi3RE2Vg0mhMe
	CVFPm+IAaStkDDJI0QiBzfREo+S+KQROlUmBbHqnHRa0rkDZDZcnopN70Mn5VyHu7u+d3vHlbVe
	fCgMj2PRLeZmHde9aSV/a97wYdbG1iIqyGlywshKHSoJIjCKtkVyEURAGIPvpRvCh19sOLgSTGy
	y3eKT8G/fQPcvNchi17d9Uwk3UCOIxxMlBsjViTOb+fj+MYLgeN9RrbLYILMSETrEYKIGXbUsQK
	oaEDR+mQix99ZOEeYNTnnqCw+v/E/7R0hMVeZFA=
X-Received: by 2002:a17:906:c104:b0:c4d:28c7:eb21 with SMTP id a640c23a62f3a-c4d6d4f9deemr95174066b.29.1794138459778;
        Sun, 08 Nov 2026 03:47:39 -0800 (PST)
Received: from Desktop (p54afff19.dip0.t-ipconnect.de. [84.175.255.25])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d69f948c8sm56005766b.17.2026.11.08.03.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 03:47:39 -0800 (PST)
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
Subject: Re: [PATCH v2 1/4] clk: qcom: ipq-cmn-pll: Correct IPQ8074 NSS NoC rate
Date: Sun,  8 Nov 2026 12:47:39 +0100
Message-ID: <20261108114739.124995-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026120920.1667982-1-robimarko@gmail.com>
References: <20261026120920.1667982-1-robimarko@gmail.com>
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

On Mon, Oct 26, 2026 at 13:08:12 +0100, Robert Marko wrote:
> Report the 461.5 MHz output rate so consumers see the correct rate.
>
> Fixes: 4e36f8ab45c4 ("clk: qcom: ipq-cmn-pll: Add IPQ8074 SoC support")
> Signed-off-by: Robert Marko <robimarko@gmail.com>

Tested-by: Julius Bairaktaris <julius@bairaktaris.de> # Xiaomi AX3600 (IPQ8074)

On OpenWrt with Linux 6.18: the NSS NoC clocks run at 461.5 MHz from
bias_pll_nss_noc_clk and the PPE and EDMA clocks at 300 MHz from
bias_pll_cc_clk, with no orphan clocks or probe deferrals, and the
EDMA has been forwarding WAN and LAN traffic for 20 hours.
