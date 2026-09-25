Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0691EBFE0
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 12:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790339299; cv=none; b=bxVKo4UU/LkpyFmS+mHL/j3l3a4hOSUaUXifYLwSwfcz0dAWYrWj1AIkjK1h6iar5dvq/Vy5xldsAbrHvORh/ELcz9noQDfi+cdMbz0t8L8g/2WY0Al7a5yhxhVLz5RuHv7JpZkmx54HiA0ENUsxYmYYrVUF49SLmre6bzowqhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790339299; c=relaxed/simple;
	bh=Buqyin2BRLK9uHcTURSSN8vZvbm9YK/rlRX6JjPtwBw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h7zyEUgh8KwuMCqi0ASeucI0bYOLi2oYzVN4jkHQjFJu50m10Sbo1IkzJESAY98MR1CIfuY5+4n00bHYNz9ZrliUE2i2CB9hSMosz5GNCdfIhV77rF5yfg9RJ3TgNlhUuweqEHVKFER+1uHeW9yzP8pdxdAexacnssywV6b5n+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=cZ+CLF6H; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="cZ+CLF6H"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48882c1f261so98846f8f.0
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 05:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790339296; x=1790944096; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=deuk7VvN7Dp02rRBKFxmXcYurefRWx2cWJSZzNnIkL8=;
        b=cZ+CLF6HWqxZws42n4qHEzDUtqdBN8Y+EjKr9/Udc5W816cKXaaRNnTFFpbkB4TaVu
         GBpGw/wt4A6ILK0yJNP/AmiE1bdTB4j5c7WHk4ymtJsRH0Eewyzs8zsrNccuHWqzcsFD
         ypQymBzvQaZgjCbS4xmdGFVvBlcvfMGhJEV07L0yvH5jyyEewWTL/xu0k5Iso9qAZqIa
         yWA0KnejHG9LAyRFvNp2jihQUxuzzn3qoCYJItBb+iHI96DD7+diK8I8ga3dg+v9BtMM
         W8ME/T0WZDaVygaDP+wiROLwdl7wtLkqKkGAj0zRHoQ8qV618l8AAVVa2QqoxL/E0HBD
         Q9dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790339296; x=1790944096;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=deuk7VvN7Dp02rRBKFxmXcYurefRWx2cWJSZzNnIkL8=;
        b=UwxBJwIdMz2Nk979s7Z2eWXzthCEhqPz/7e6fRgtujIkiK9EW7q0N6o5vJqsUE3C98
         xHCSzgg2Z8H1LTqQeNPYwegPckGo9CJ7J9LtfAiYlpNhEhdu/CKH6V64KfdcR1dHmfD6
         W0B3J6XnikMWmYGFHteIvIAaTLAhUOYSC05sPZKi0x37ba53nR9l7ctLahKulNMpfpqZ
         6XFj+HXfcMOCA3ND25NHvxnLDQDZPJlkf7aCpxCURbVMirEhMAbMGS4LHjQ8O1DtuiXL
         13N8y80tXyjUOoi/v+MfNYVtpDzjolTLfjNbc/Y+dLRuGiNcgxFF1uFLCbTM4FR8PLAy
         BhiA==
X-Forwarded-Encrypted: i=1; AKwUvBxRxCT6XnnCs1Ig5cRs15+Q4b5/BFzidEKqtDkUe7AfBZIcn7s+Q8KL4F5RoCzcb95cCflpx6Vqziio@vger.kernel.org
X-Gm-Message-State: AFuF++ksWlPBt3gVuFsJviM9OHiKIWuLoIUgpE119rUUYB5qlxpFcOif
	/a4X4rQhGOHvX7VQbilq2Gxlgpsf85kF22XBCGzG7g0KDoQha4DaC42FpFy/8TBQryE=
X-Gm-Gg: AYBFou3Zqj4jCRiYFfuahhiFTx+6DNPtPngHp4VdREwsSlEFw4nDHuJ5vksjy2gqDUZ
	CfZtOPQhvleS+PyR2KYOypgkVtHojsiqDnbTIFASBXbRkDXynOHL88IwrqNTCvALUg84bzFLqc+
	tExBWQCJnFqlV/oM/oqC8cFIyydL3m1pbNXPUqTZv2HWHjFHGSqNW1byCarbTfVQlelIga1I4IB
	EPipFNvxBLUbhOGbt3mgIMIxzgPRu3vTEJKwl9+k1X/wdr8rPTQ9IigRckTu8g+QiQ6bKjs+DdZ
	gSFSxtRE9iZgYPxhXR99VJaDwpnQcc2oshGdlrwBzE3Q5+fodjcteIPzfkdR2RARJzSS0SVauBd
	w5LkDp5Psi55wQZw/bvZY3O5I4XP6He5zvZNtkQsJ/nENmi9GraTsChM9xPxxGFns8doM2+cmXt
	51Hg7eNpirmqh68tZHlVUbR3u1v0xu1kWolToPxINkwnnxp8uBCFVKD/yEKiqrEOfjXSz5mAEuU
	c6OO7jsek4Nrl1bfA==
X-Received: by 2002:a05:600c:4e53:b0:49c:e37e:4389 with SMTP id 5b1f17b1804b1-49fe66c8288mr97213455e9.4.1790339295735;
        Fri, 25 Sep 2026 05:28:15 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff2884552sm39306745e9.10.2026.09.25.05.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 05:28:13 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jian Hu <jian.hu@amlogic.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3] dt-bindings: clock: Add Amlogic A9 SCMI clock controller
Date: Fri, 25 Sep 2026 14:28:08 +0200
Message-ID: <179033924420.2256964.9574069512756367245.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260917-a9_scmi-v3-1-5ad843766774@amlogic.com>
References: <20260917-a9_scmi-v3-1-5ad843766774@amlogic.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Applied to git@github.com:BayLibre/clk-meson.git (clk-meson-next), thanks!

[1/1] dt-bindings: clock: Add Amlogic A9 SCMI clock controller
      commit: f25652a1c0d0b0d2cf6615f1aa693f7f941aff6a

Best regards,
--
Jerome
