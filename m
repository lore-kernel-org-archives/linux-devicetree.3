Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795281798;
	b=e5N3fQUTuq2kGSPcca/qn3g+0v/YzZgSU533x6ALsMyky9gQU9vOXmq3FUnrUn5qITwL
	 r4JTZG1o+yg8TU1bEhHwOUx2KjNckG05+IreNZnG9FhDkaLL6sJL0dLInEUE9EMIqsFH4
	 iyWoJwuAaCNJz1CXjxR7yuiSeWw4aLzZfR22egb7sSfVvj+KEswIDJa9Jgnqgqcfx4Vbx
	 jWGVqRk65MzpIBDCg6R3K0d+Ac7TEotgpu7a3XGP0jydD5NVvJ8Q9kcN1w51IB6Qcqlws
	 mDO15og3GmzElOy+ZKt24wohHTc2xlSHC0VE3X7441dhc6HT8XvyVBPDYEHY1UWHqPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795281798;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CrE8YZPGbKenKXl5BgmqDcyGKii69/sK0NCMMLNz2nY=;
	b=a+XcYPhBqDuG2Ol9Yu9gyHsrjEpmJwOSY7Xm79e3v61z0aEuL34qXeCHc8ve6FvooanC
	 YvMhixkvhLG59oK6yeov/xBS6U0pqHpefrm+KjXoimu9W1E5UQzzZjnAg8vB1DQIvjTaN
	 AtjZB1sPuhLtM5nx/Skfc2znPH3yyOMz0MFAjBMYnEPHdAGJYtAbVNhpzvbnFTZR2Yksv
	 bHbdJD8bIQM9i2rs1Up1naGLe4OiD026F/AVdoAphf2S36o5a6DyZm43RTom5XhK2A95l
	 H7bA8R4B+7s4WQDOdeAhIh0sDEYazxWk0oSMVw4ou5oGchz4mbMAU0a6MVwGiuTA4xA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lRO3qt6j;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02EEF606A330
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 17:23:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02EEF606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lRO3qt6j
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso4211897eec.0
        for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 09:23:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795281797; x=1795886597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CrE8YZPGbKenKXl5BgmqDcyGKii69/sK0NCMMLNz2nY=;
        b=lRO3qt6jwuQ3jetshv02wRrSxpRYrXbQXzoajLn1J3Yq4k7u8wVbh9XMq1yJERTZ1l
         qiCgHYN+rxXKDOy1LND+/FqW4GmTY38yOVM5JL8YETrPyQQMX5wG3Ul/MSRJ+eDEdOhw
         mH800/ng44G2LwJlv36HaBwMHsHe6lC0axjitMuLP9OHU3NHlOMkrg4lsG8vq1RfCaud
         ZtMI1aJf0mWvPmS6D+S1FX4VZI3tHzWY4JB8U87wGleiLvZkrbb5ukzrEvj9WUKaA5Ba
         +BIb3OfAn99n65WsQbbn4CcVIIhF8IWQzGPrUUykZwRfFn1oKNBzyd1rt16hBSfHAa4/
         uSmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795281797; x=1795886597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CrE8YZPGbKenKXl5BgmqDcyGKii69/sK0NCMMLNz2nY=;
        b=bDAy2bg+WDMWIL3XOLndSJDvMqIL6oXYk1HVWOj/6puKzeIKRDZJZVuV/7ZFR92OSx
         BWRrQecxhI9l/BHNp0sC6PLtPTc6qtVmnSEVSLQZP6D1MvgwaM0RkAi2/hyzuev0O+Fd
         innz/aFmuzIoLbfah/nTm7K3bTfw+MuAcy+HbAWwDtIPW2BnnXGeYerVWrQi2no4U8WZ
         9SP49XqsRxb6EbvTbagc/GDlgL4dHZ/BJ6LIT3kfQaQrOTBkM5vjqa3hJwLbZRLkSxcI
         yK+77eNk2HpqMEjiLGPVblI8do1EHrT3nh4aCuhTHKX0ENWrkVOud330uwLCAd2dteHA
         snIw==
X-Forwarded-Encrypted: i=1; AL+hErFhDnrl2nea7fkPXk7WYAJeMGuGOcc052d7tGeiX3NZ+Fgnab65Nvdnf9ro5aq4cUaNkhmbXCktNxGm@vger.kernel.org
X-Gm-Message-State: APuU4Z/NxEMcjsqhqWdTuwGuI21o7om/xadhOv28/1DnzRbnDYxuiBbo
	y3xqfBSKtWFERIjFYF7iudNSTFDQvj+juIxUnBRwd/hQHrYtfKpwGrCF2GpNrQvweDs=
X-Gm-Gg: AZFdTZcm4Dv3+hrrMfOObe7MoziKbtICxyKBlUFDBjfX5Pu85X+8XTQaZHAHt2nlzGD
	MLqYFDk9YjM6LTGeGjJNBB89ju5sBlf/3+dJ3pWUGxnN3q5ngN89QmdKlFP2v3TFQTqAZw68ygU
	gmNxK/ZS6FYKpwGCwjE24U2RpuOTlTFxUHRjfPJr24RSK4EFF9vT+q21nnCvVAXux6Q717MiMYe
	Deq1t/RFZpqKYKEhqCZJOKAcowcbiUC2XaH4w7sfmajAU6RnpLLgEjD7TBiqDszorocGFdMuj/e
	msv8JsN+vFgTI3Ktt9vFzRyTRYpdboWMh86Pe9bsLDWF2t7duw6p5nERtuW98EpJpJISikeBzWQ
	neke/c7xNGAPTIT7wrlbk6D8/s1s6csYxJ8JuJYZl1zuLMk4uwhXPvG8frhaNB3z+Rf5lHry7G0
	OFSn8nOBV5S9ZuJeqtkk26MzJSkGqysVUIcPgqJhL5y0n0d61Zfcc2gewiio+QLSN5cw5LSATlu
	/G45Qff498uv8DKpusQ/IFZbnqs63E5pntkyVu/jezKXhd+atJjFQzWeQFg/gzMVBNMeeoUQHIc
	S3mvPq+gDcZ5e9fGA9qK3JjZCvtrOpw5TzZv
X-Received: by 2002:a05:7301:e0cd:b0:375:dbeb:b363 with SMTP id 5a478bee46e88-38570f221dcmr6879077eec.28.1795281796821;
        Sat, 21 Nov 2026 09:23:16 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([2001:e60:8509:ba6c:4c23:efbc:89e:50d9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm22413703eec.26.2026.11.21.09.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 09:23:16 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 08/11] arm64: dts: qcom: kaanapali: Add the second DSI controller and PHY
Date: Sun, 22 Nov 2026 02:23:13 +0900
Message-ID: <20261121172313.812-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261120-molokai-soc-v3-8-403d763685d9@yahoo.com>
References: <20261120-molokai-soc-v3-0-403d763685d9@yahoo.com> <20261120-molokai-soc-v3-8-403d763685d9@yahoo.com>
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

On Fri, Nov 20, 2026 at 09:23:10PM +0530, Venkat Yadlapati wrote:
> Kaanapali has two DSI controllers. Describe DSI1 and its PHY next to
> DSI0, connect it to the INTF2 output of the display processor and feed
> the PHY's byte and pixel clocks to the display clock controller.

Tested on a Lenovo Y700 Gen 5 (TB323FU, Kaanapali), whose dual-DSI
panel uses both links, with a board DT that is not upstream yet. Both
DSI hosts bind, and the panel works after boot, after a display
blank/unblank and after s2idle.

Tested-by: Joonhoe Kim <26rote@gmail.com> # Lenovo Y700 Gen 5 (TB323FU)
