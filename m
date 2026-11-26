Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795706831;
	b=yYw9Mnmt1wMpUj7df+S60z8ALt0QByGA36EJXs9UWoMC5gOKmXLjZa4YJuC7deZZ15RU
	 CAf2a2EnK5c93kPz0sHanRyo/roeRyK0erWWN5smg/Bpk3w7LKEZ7wgsU1XIyROC6r9+x
	 YUmQjJJh17NTMHAUKr0doCdWtwkHHewsOmr3kQgRRoDtwtyYOUdzXh2QoX2R7k0nWD7l6
	 SIqzAlc1CUlsN5cBf1wzTHHQUw0B6HRM0uLp/BEpsqLmkm/kIL5kwLXs4ZkE1vXgsxNl3
	 QOxiTn2xzPh4H3ZDXtwt7PL6U7UpeXkMS64Lvv6BoMi8KcnVZNx1j/E27rF2wCTy4Ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706831;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=D3r9Q658gfr02qv4CfLMyI+BO9QiyLcf5UpWpj5dPrE=;
	b=NOuizGxky2uT340juLAcPDSOBXOZ14v2YAf8GvcpWK2cR05jN976tvbD8M1UKuAh50oM
	 37QGxxGpgOgVSl7na2dKVZXyC+fL1FeH4n6qEpO9zs0zXWEeQ8S0lw8KhPPNtHWuUxlz0
	 Ph61SnuJDwRhI2gAt8sV5aduLbtjgW7tap4pwcAoNxns0ejOY4+bXMT6E+a1zyTVPDFf1
	 S4obgxKlyfRhXubfX1OcFgFMxfIdHilcxWJUNBgVcMcSxOVCFG0qSx/WqWv6M2kiYTwS9
	 KhlL08EzL1ecJAiljGjT0gPOxqnG20ps3i9TFerrV64ovbZpw6yvcOrVKetyhnlGhKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0u3APBei;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D186606A33A
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 15:27:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D186606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0u3APBei
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so4800263f8f.3
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 07:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795706830; x=1796311630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D3r9Q658gfr02qv4CfLMyI+BO9QiyLcf5UpWpj5dPrE=;
        b=0u3APBeidcNd11Z2j3eXaAjA285OdvSXjJLehh5NHWt6xAxNEA+yxFk808nOV+lKxR
         wTz606h7VsjqgUh2yQ2oWJcCsrw9JMQQ7crRF5Beymr4N8ogKAjE2jfXFSCoHbC2+huc
         0TRrGnBl31IEIZ0O+V5vXWR8MHHJqERUOTHM5JOIPw16TYDG0KjM0O8Ci2Jxtx2eYFg9
         tssnkzzAwh/U09Y2BX56vJHGAsq/K0O6o6w4zvtx6rphXDNkjMpaFNA3An7vClLbUpqK
         L4T+dpMPxI92wNYPPn9Rv6FP50M5UE/uFl9AP5Udx72kK+1lTdJXmYOKUDB8DTOconFR
         R2JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795706830; x=1796311630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D3r9Q658gfr02qv4CfLMyI+BO9QiyLcf5UpWpj5dPrE=;
        b=r+8rvw6YZjaBNXWn+1ty4tat+ungU09lH3LlquzwksWuHo9Mw2zzWCYZcEBg2eykfx
         +9fldw/q+zLx9An0AUzhDJ5sswOPUWJXjT/j7ctTWtY85UdNAiheukGoBvXTiIL7CYbA
         M+OTxZ1Ku09kHU0HTqS8s93Ho4ue5oM9fmfiO0EBSOFchOx/Ff5v20QjlE6zPN/5EV6Z
         1zKFOr4Dt+EFYcX1jwS8BlC7bSjtUcQJOkntRaaW9foxbO73VzOV9lUWW9c9pe9Kp/IF
         Lo1xVDdaACxL+tWQVUsESHkE/1W7HCNLCkdFsWuqcMlnnStWsNevDALxea2QDwd2k8/X
         YrQQ==
X-Forwarded-Encrypted: i=1; AL+hErEzKASlq1u/4hNl8vD3jojx7lj43uT832zAjafEdnv/CAPCg3SfOEV2woZaNILACoGl6jAZqogjfdpp@vger.kernel.org
X-Gm-Message-State: APuU4Z97qIfiFOQBQkZKhv3vsnZ9QCf6pY96clZBAFjv0Kis0DypfTn7
	hdT3BHht0ZWHT7hYG0UgcmSsyrLFeWpwzxNNuGLmmuLaDAgT84cuoClz
X-Gm-Gg: AZFdTZd1Y9UWB/xoNe+aslJV+R0Kj0pJMNHXV/uM/vJ+Vta0p3RFzDIvkO29YCuYvpm
	bgguDLdOu02+4x25xYmcQ6Wnzm3Csp6CwhedTJNMeupHrdWrm2Y1vjkvuCl8MMcAkEEwBL/h6VB
	W3CNEvh9TQrzUxqZ8HM1I8ji5nnBtu26BG8m6/NZgllM+AuGWSrF1FL7/QR5CJt04o3WlErqUFY
	4x4jpfOf6GzxntOmvOhOS+/Bt0Yl8SMQ+CJgP0mbdnOYAzD0RlK2RU8A9SU4LooM8aq8XNv77Uf
	sRlBRoZc3croMqRRs0h5DldtzpMkQ1hZ3XNoVoqP/KzMEmg+0pUcUnWgyhiBpOxnu6UN/HcytAe
	VfaHLOHsGlPfve1lQHVQoTQ7k7jwIYVLupC6M1M84Aw0iN8yAwK4NLTjcxnl5d0tms8J/WiamC6
	tzsb2qo0B/9YWXA6T4OMwyjZnbe1yQwY/ZSV762Od76gOefSHO8sYhjVee0J1FoaG1YRJA27Q8o
	C8JXGUjXpwABvUVFAQAMDbwvfxmZUQzcob/mbWi4WkfM3kmubkfP4InwFrhrLfdzgd4mEp+BsxO
	PuCKQZRdo3aov5RKwf3pKbgoa8ih
X-Received: by 2002:a05:600c:154e:b0:4a3:59ee:86b with SMTP id 5b1f17b1804b1-4bb887c3b63mr460217725e9.4.1795706829787;
        Thu, 26 Nov 2026 07:27:09 -0800 (PST)
Received: from flare5 ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865b1sm619118905e9.5.2026.11.26.07.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 07:27:09 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/2] Add pinctrl driver for Qualcomm Halliday (SXR2250P)
Date: Thu, 26 Nov 2026 15:26:56 +0000
Message-ID: <20261126152656.3207931-1-lightofmysoul@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <wezjaspgdq2rm4frq5r4wynlsvhwmogxftzb2nyzmvsc5aavwu@hdvb6a2i6cpp>
References: <20261124-halliday-tlmm-v4-0-3e3a1d0fb4eb@gmail.com> <84fbc195-8e93-4d25-ab0e-14c3510edf40@oss.qualcomm.com> <wezjaspgdq2rm4frq5r4wynlsvhwmogxftzb2nyzmvsc5aavwu@hdvb6a2i6cpp>
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

On Thu, Nov 26, 2026 at 04:10:22PM +0100, Bartosz Golaszewski wrote:
> Eek, -ETOOEARLY. I have more patches on top of this already so Stanislav: can
> you please send a follow-up with fixes?

Sure, here it is:
https://lore.kernel.org/r/20261126-halliday-tlmm-gp-functions-v1-0-b8543d6a83eb@gmail.com

Stanislav
