Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C12053161C
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 23:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790120575; cv=none; b=HqK85QY8w0hADldZMLzsoKHE8iAdO7vzaByfQjs892k+o1GUNDdggEq2PzDcO26htwTcR0RCGvCPnXDcpbYZXgR0aTLkCTzSoGRpabyWPBhciEGmPi9JnH5Uec3S4JErsrnssTffqP9pVjsju2MQsehX31HZjZGBQAJuBMDcOTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790120575; c=relaxed/simple;
	bh=gnuHqwNNRZTj/F5sNx+WEHPxIzhx8AgoV2sb79aEbxw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=pYyjajMIz1J7os9uxl8GZxpz5VJtKLBSdRf5kc7UlXJw4OgbhsEvQPrVHXWoFA0gTUqZXClvi86N4f9TCcADEL2fMfa3UH2abado+nvCI70S65VT5K+wEwMdF3qtasUnw/mbhCEugEvo2x0WHBWe2FK/MFUm8qSokbeRqlg19kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HSDzEFGM; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HSDzEFGM"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso3990835e9.2
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 16:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790120569; x=1790725369; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gnuHqwNNRZTj/F5sNx+WEHPxIzhx8AgoV2sb79aEbxw=;
        b=HSDzEFGM2YohWr/MDjTgACY1QPYz4/ayDnN4+JXyMvv3WG6ODt+ElIit3lU0SGXh8N
         pKm49219WuLqDKO6zkx3z7n6cYy6389e9ySXqVw5Yc8HH3ib5PNZNhm1C9aI8Sy3aHZU
         qsfWmTS5Bum58vXm4KRtJ/ysfWfHqiKFcEqsx/VKMcrrI4lHoRFdnN2K1hZ1Cri5mCNN
         UrlbDr+qP7Ot53QCDhuoaI/hRg3GKOEeQ81Fw7xocHbLXr7EHCGZqDa6vsA1Wc9qDGt/
         SjwxS1EK7pu+Yv8yS7+GtgxZBKQrdKrNEv77d4u8OCtHDgcMRlu8Pb+hBacyxx2u9Icu
         TqAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790120569; x=1790725369;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gnuHqwNNRZTj/F5sNx+WEHPxIzhx8AgoV2sb79aEbxw=;
        b=2ElZtqvLKPB3O1IjH/EFpSUeUO9CEl4URhvlA78GkFVX3AUXwEM17bI4EWAbzIZLBO
         qoVgGSNTwdN1mTh1prr4si3FR1xa5G2Hv9PtgAkf4gOoAP1kk+ZxKxZgyl1y5Qp95RIz
         ld20SJ4l4moDElzW2VcBkvkmJBhM5U701OwS6NHLkHwKXkhI0K7fw7EEk7zWE9BJkb1D
         4OBx4iwxbfzq93sUjLJ2VQxnYdqA7eJZ+2BtKXhLE6TAHcbBLMZO/bu1dfeAuGlizZXx
         J1MTuFX7kY0pPrmMbPR6sRBG4qt2GxIDR6gPXUaFXdfMb+VUqqDdvgvMp8mzfZeO+yg5
         zXnA==
X-Forwarded-Encrypted: i=1; AKwUvBxChC9ySYrE6TMT6V1yb7Mu3xocPXjIEXC3xuFSvAyYG18lZizKG+n0LCokR7sFcU53O9CfCfDGME+d@vger.kernel.org
X-Gm-Message-State: AFuF++kYzVwmqeDFLILCPthuT6hk2Ofo/1OAoEKotRntW0tpYEj/89Vc
	PrLwG7asLCwYmiUTWAEjURJl2N2oBIaEb+w19sCu53WddmJHzNPuGNPGzYJnwjNHhic=
X-Gm-Gg: AYBFou1Vg8/lHBS40cWf0J/oT6i+ZHoi5Spq7dYMZRhE76grmO34FDqalE0vnYnqDjR
	Zd9fUQMYK0f82MCwCQhlqZ9BmVxcEsrOEQsoHq7wKQvkrQB6s5GhSAXBlDZarnX/AHuRb+3j8qj
	b1GpI50Ls0xH/E606MGTivlD02i7c/I0ij27NyefwzfHxXGVwSzMHcU+AkCm0leGbznBO712BNB
	jvsCDbFytorFcfOQheStEZVMjb2vFXZPqYnrHnFI6/jgMweKzwpI8+NdJRfPZHMOlAEIpS78Dye
	mSIvB2+wv2xOYnZ8O3D7Hh3mZg9MYdMl0WgKmYhmljkTM8Tq2iyM4dtBjc+Ouf2JYKJbZiIDUa7
	V9XUt96BSoLMkIdpIzIJKsH2ZJKbbu/x0LtnEszrHjDiYX90mso0LVofRq493kUtpr4N3WPB0s6
	eQeUHi1h9+mPeXLkXBuH7HTJ5b3MklHiUnArdO8GqZG3WBDGRU38kfmVmAMX2WMgIEDJMRwKJCJ
	Dw+HyJxLTGE2LR4bnnueAHrk5paUvnDSGVIN2NYcE4Azj9njsFFGY0T4ts=
X-Received: by 2002:a05:600c:1d2a:b0:499:a277:e8b5 with SMTP id 5b1f17b1804b1-49fdeffce6bmr10454205e9.3.1790120569165;
        Tue, 22 Sep 2026 16:42:49 -0700 (PDT)
Received: from localhost ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1c0f6csm34892415e9.3.2026.09.22.16.42.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 16:42:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Sep 2026 00:42:48 +0100
Message-Id: <DLM8S42Y6BG5.JH78CU9NJPIY@linaro.org>
Cc: <dmitry.baryshkov@oss.qualcomm.com>, <alexey.klimov@linaro.org>,
 <r.mereu@arduino.cc>, <srini@kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Konrad
 Dybcio" <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/5] clk: qcom: fix SM6115 lpasscc register offset
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>,
 <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <andersson@kernel.org>, <konradybcio@kernel.org>,
 <sboyd@kernel.org>
X-Mailer: aerc 0.21.0
References: <cover.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
 <3a4e8d1115a46c45cb34193b6ceeb02891fdf716.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <3a4e8d1115a46c45cb34193b6ceeb02891fdf716.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>

On Tue Sep 22, 2026 at 11:11 PM BST, Srinivas Kandagatla wrote:
> For some reason we ended with incorrect register offset for soundwire tx
> controller reset and the regmap register max was also incorrect it was
> 0x1000 instead of 0x12000 which is full register range for this IP.
>
> This was somehow compenseated in DT reg property which got it working so
> far.
>
> Fix this by correcting the actual offset and max registers as per SoC
> documentation.
>
> Fixes: b076b995e225 ("clk: qcom: Add SM6115 LPASSCC")
> Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Reviewed-by: Alexey Klimov <alexey.klimov@linaro.org>

