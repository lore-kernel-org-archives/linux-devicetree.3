Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794348755;
	b=mwLbdretf8908eP1YeMpjR8v6/aZdk4tLq3zBkc7qgYq2vbMMZ56oeNa+khCODU2UL51
	 3LJno/0QSv+VnA63S5vb4L8TZY0ggTIoyvE4XJAMQyxhlgw0t2Es3Ls0b8nYbpC80xQoW
	 miqkgxcc047PbdSkxaK5xi1+qnOgStJ5jeMKaCbIo19K0EdhluHJ0h0WaBveKXo9C32t8
	 GsidYdoWWqpx9bxxzIIIFvbpQaBdnU7FEaKLvxlfGWQeR3yTYGSb6DBEPei5m2X+SShJk
	 DSrQLuw35XF57Q7MIJWD3iMoY2uyKbV5kx4mVHpN1b3hqqozWzhMnxlcuDTAqZtSPaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794348755;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QvuQY+dI7Cg/hO7294zVJsdHa2mxSYpqdORdJaVQ9KA=;
	b=HmSzLthjEkfVYy+zSnyElKovFMkVdQse9I3C0kj1A2dZHUBsuMxY2PCl+bGF65DoWwRk
	 tfgDbo6jUBhRUDUrRW99y1tLOT5RZgrwWFUJV8EogW1scV4KDSj5W3DbCTFQS1Ed4URVD
	 4yU52XI+zmoLaITfd7N6Oa3ZQVsdUjw3Nx1kLwmMHRQ4y6dxR6LrBtipDNEKiNcKjo/KK
	 hk/2e0T8oJDAQZVUmFj8iNacsTofqfCjn+TpKH7L7I8RdZG6W5vTVloA79zH5Opsh0t4y
	 U0CdLpY2AEhUnaPNBKTC+KmWvzl0z3c4BV/AUEhXfeX0F5dx3XFKIki8ymjt8mUJzQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X7aTYqVP;
	arc=none smtp.remote-ip=209.85.222.175
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BE2606D508
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 22:12:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75BE2606D508
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X7aTYqVP
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-943e8d35f74so222077785a.0
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 14:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794348754; x=1794953554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QvuQY+dI7Cg/hO7294zVJsdHa2mxSYpqdORdJaVQ9KA=;
        b=X7aTYqVPbG5cqr4kNYOlVXseMw8UYfuxiw/e4mO4JL6PiwzbyMKDAmXe2s4foYJNSO
         7wGvtSx0Bc6XbtZufCkUgha15tfTNZ6Q+9TXyr/WcRWwEEFdaxS5SZDnpFWRCO63nvHM
         cVYbbaBoC14Fig9LfOCqp/OT+KqgF+yUgzS+KFA3wPLGixmpidGjInk5cM8AW+lE3SAY
         XcneGJKlEUn+TxITC2PzRKuv9JUUTkske6YVJBgotxZgLcZnpUWlvlKxe36zzHsNx6u8
         fFuuivfjtUYX0yBBhbmMPWQLnIXjzxC92ASwejNyNerUOyd1xmhfg6kbc1erixnCtEED
         5bQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794348754; x=1794953554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QvuQY+dI7Cg/hO7294zVJsdHa2mxSYpqdORdJaVQ9KA=;
        b=L2x9J+LciO8Gzy2qP2awhNnjihNvmTZXByCu2GhB5VNEAtm6h5mKaqmBKXaRoheZi7
         wNkgymRYS492fuKQ5yF7fElyZSx7F70bG1HBBiqW14sPMcRHLpN2a9GaA8YhnxEWYHr8
         NZxdTf6u/vl1sEcR8BY6G6uNm9p3C5iJKcvaMgFP/hNcZtfU7TZWjusWNXSXk2hPkoMf
         TQNG+FxWOWIrEIOsCkt3nYNy7xZvBFR5eFACL5b6kzyxP8DwjNLr7kM0MiyxCN+muJs/
         ckVkZTrfz8pgIYBExtjdYXBo8bj+pGEtaAR9sZ0iBkVv4QGPYb0SeP7ed69mW55er1cb
         NWTg==
X-Forwarded-Encrypted: i=1; AL+hErEPDdg6w/4G69cVr2W/JNFNYRKw+HhIkEaFG3WQaWr/5kDhhgdbZ9fTfCi7FZ7+jMfskLJ4I8u1Xyzs@vger.kernel.org
X-Gm-Message-State: APuU4Z87ZrDj5VaVGNpfnYsrtXW3LmvCok+pcbinJVLNK1PuVxDJV5/U
	JdSa3GZfiWLuEjkJDPFoc1bTN3q9if/3e0OgV/5ThGGecKJ29iYOnu37YejFvpD08O5eMg==
X-Gm-Gg: AYBFou0uC+AoVhsgFS5ygWK64j3mmFPpHyn4/kDeyqd/TRzGhunx+KZrRvuoXVIpVmD
	c+oakzWzaj89mOFKdD5QFYiUbsXbBQ1WkK8x/m98d32mknkWwWNhvfwEDQIhsejn2ywWWIqvy5I
	AV7xEHX4mbmUIMKfMVkf8g8DqLHXruWrV5TUrtkb++fmJOtNLQQFDkrjGp0RRxrDsrVxiOOuuZE
	++8ee9dYJSjIGAQAjKnM/xtwMQsozkaYVMC4tvyboAm6Ls6ZFP4ZR39Sz0IKLCuZdrXduenGx0T
	jnCBLenSJew0F5k3GPW32Z4GuJkNf8TF+tAZA0PUUNvsGfYL5/WjvoKjQrzSRrQ6skJQesKvbv+
	a5M5J+VYdvNrg7SOfx6UKhVmeylEmVpjO8r1PRXjAlGCf+W4fi+c000tNQ1Hg1K9dyelTdBkYLd
	t7kiO8i+7C+15Ctdj4JHc9QcgtocYGjwod2P62qH8TrfsglM8CKymQSTYgNSvgsQSFE3jYtmhzu
	XeUICuKiLjF/YxbOy4ixxwUaPlEK0oZJr3d7/J0Fn+3uAsVLRe4upnxEnHj/TG0yVTPkHRT3boM
	Yq7tpescvfyMMevGAhyNxjA5Xb+35bLLWTsc6ZvS7TdKGceqI04iAOsMNq3SJiKdplzaaw3YT3s
	vikNnH9uUiEUt8Od1TaQL2EbEJhgM7Bgz9GLygOvhZiONZVhtgmNwvC1VWqTueghhGmMMGwb+pX
	6Jo4TPjt1wTvE43yKJG4fF9G5OyrJv4dWGMux123bD4WMulXz10DOwOBN2Xg3tTSWYWZ6tPfIzQ
	TQhLVOQTbexBtEDFzkxCCfOZocNGN/QHDP9OPy7KqGtkg==
X-Received: by 2002:a05:620a:6ccd:b0:93f:6e05:22eb with SMTP id af79cd13be357-947b004790fmr62140885a.48.1794348754197;
        Tue, 10 Nov 2026 14:12:34 -0800 (PST)
Received: from LRMS.tailf8556c.ts.net ([2600:4041:5024:4b00:940a:c6ea:f292:3644])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e73a8fasm328270285a.7.2026.11.10.14.12.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 14:12:33 -0800 (PST)
From: Jesse Casco <jesse.casco@gmail.com>
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Suresh Vankadara <svankada@qti.qualcomm.com>,
	Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/6] arm64: dts: qcom: glymur: Add camera MCLK pinctrl
Date: Tue, 10 Nov 2026 17:12:32 -0500
Message-ID: <20261110221232.3883-1-jesse.casco@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261015-glymur_camss_dts-v2-3-e7b1f403146f@oss.qualcomm.com>
References: <20261015-glymur_camss_dts-v2-3-e7b1f403146f@oss.qualcomm.com>
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

On Thu, Oct 15, 2026 at 04:22:28PM +0530, Nihal Kumar Gupta wrote:
> +			cam_mclk4_default: cam-mclk4-default-state {
> +				pins = "gpio100";
> +				function = "cam_asc_mclk4";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};

I've been running this series on an ASUS Zenbook A16 (UX3607OA), which
has an OV02C10 on MCLK4 at 19.2 MHz. With 2 mA here the sensor shows
horizontal banding, and its frame period stretches by about 9%, whenever
the internal DMIC clock (LPASS LPI GPIO6, 2.4 MHz) is running. The bands
are already in the RAW10 frames, and the sensor test pattern is clean,
so it looks like the MCLK pad itself rather than CSI or the ISP.

Changing only this pin to 6 mA fixes it. A/B/A across three boots, same
kernel, fixed exposure/gain, row high-pass RMS / frame period:

  MCLK4   mic off          mic on            after
  2 mA    0.96 / 33.28 ms  20.44 / 36.17 ms  1.04 / 33.27 ms
  6 mA    0.89 / 33.27 ms   0.90 / 33.27 ms  0.90 / 33.27 ms
  2 mA    0.95 / 33.27 ms  15.33 / 34.37 ms  0.93 / 33.28 ms

At 6 mA the frame timing holds steady at 33.27 ms and the image stays
clean in every phase, including while the microphone is recording,
which is exactly the case that couples interference into the 2 mA
clock. Normal camera use with the mic on is also clean at 6 mA, so the
fix holds up on real hardware, not just in the capture script.

Could cam_mclk4_default use 6 mA? If you'd rather keep 2 mA in the SoC
dtsi, I'll override it in the A16 board DT instead.

Thanks,
Jesse
