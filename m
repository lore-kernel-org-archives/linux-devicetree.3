Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795281814;
	b=LPUYYbuCZw/uxczwaUDWnYEJPQJv7f4ZvjMfHVIjmVAcU1KlyqheeL2FyruHeoR5sy5e
	 ztVqZMJNhTlnEPFZlMgts34rIk+ZcY6YYKTI6USUDIrmA6DBipMetnL/EJs1K3c07Mgyd
	 ZW74dea2ie8lQBmSYVtxGdlqu/2zXGRlWgbqWaWqtQwwEWDD1VK+pYy4gbkTFkrS+wBYa
	 UhVqu0iBT3n70sh+6gAMJr5w5TIIIBddVQokGFKQxo66fVD2uvE7Aw/jfaoeOV3Twt9dQ
	 Dmj1UpFJGfk0ES/z0YMr752WvD7zjtv9ArbmXDxMEf8pOZxHu4W+BKY6vhM/UxvqWwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795281814;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qNh4Be9XbgejPuvlvikrrq9VO3koxch/dMJ6rmrGJx0=;
	b=UkDo0D0lh/lrP2Vqrritz4KbgnhgA7Sv6MX5usjH91g+q5gpXAecM2T9SWfgtOtIjvJ4
	 YNdTrf25r9kVA+d/Sk1XnWhusWfF+iHpyCb+70ctHISj+YfZ+tECRiEMaIn44aDYRccjK
	 d56ebh0dNA7DFyP0TGXB5aFEiVuUS5y0nS9pAhGTdhKzNpKdZyeYbES5dQ6PKGFBvcJjP
	 kTYYfnr/szGIAKgjeLKpfFEHGwoVZM4ULyLOZvc2Q/+h8yz4ula93rk6HqtHkdEFELzA9
	 zivwb2T3a3A1MDySknSucNROwcZXXGqj3RbICQkjEwvHYW3lQE53wGpMdgbzmM6DNjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R11vgZXD;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BFF606A330
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 17:23:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01BFF606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R11vgZXD
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36a315ed211so2355552eec.0
        for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 09:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795281813; x=1795886613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qNh4Be9XbgejPuvlvikrrq9VO3koxch/dMJ6rmrGJx0=;
        b=R11vgZXDtT0N1QS40z2jBWPHC2Kg9bm2pjRcg3i9B3OU76zGxhVGRQipuB0fwvJHly
         w4JVWdT+vNjXzrfyALBi7YH+eCmry2WyWitMBFUxOdxTSU3vCv0oWbrp1ALvIr3+u0oC
         Jm7eNHgERnJ4ppODCcwQlrA6xeCUO/5e9Sb78/HU5PFfdwwFOEbnPWR42LfEYRd0cZm8
         PDKLsp7J+Q1ODvaWNdvLo7K2k7bxl9ovhMlOhnSO0nzrcZQSOJV47AgVhZuNSKv7hPwP
         GUEfzGZwqwWL66JKNrXRvqNReWkvoPH9jQNJKbui6z7L2SmZzrTkYT2jQl7su5UxWjcy
         mn7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795281813; x=1795886613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qNh4Be9XbgejPuvlvikrrq9VO3koxch/dMJ6rmrGJx0=;
        b=hkOerOJcJkqlxHf76iH8kGcVzz1VMUYeVBkKmFfSX/SSydx/1JpMLMj1z9WEDY5qz8
         iycB1DYnRW6VD2HLen7ZKAJj8RcOJnBq86+JswX6f8Nr/jjczEXgs4rgsBbdfc6pYTNv
         qPwIOBGRtZlbxsmDddaLOI5TNADoBoYq8lofdt89N5ZJjLLZEgrua/5YXB0WWQyYcRBk
         TrKi+sR8FW1o57FrW8bQDSRayMRy/q8jl/UKeaJ0DLD48LUxz39R5dNz5xhk1fR98Dk0
         S58Z9i4VUF9LIh4QyCr4EcHwc88amOdMAyBBwYkhUqXMKn/aVQYGyZ4wCkeCehRVAVfA
         sYhA==
X-Forwarded-Encrypted: i=1; AL+hErFo96AEBrG3/fCNVB4OgdUsbL5f04nJBVnaXEvmMLUm7TCND/sfy2OfVh4mOzcj98bhhviea1wacLUp@vger.kernel.org
X-Gm-Message-State: APuU4Z/TE0EAKxrnzTquGA8/LGg2Z8gIHLBs8InPV83KC9s4tXWgA+Fp
	2R1Zv8Jub07K4eHuvm028YNGhnYv8TIFB1HXWjCIhdPqjZ1wlQG/s2f2
X-Gm-Gg: AZFdTZdvvtargjkCyipHcms7H5EtSHjB+Vkpd1UbyaB076BHtuUlVeba14zNciBDr4o
	MofpHIu43WYaHamO2a1xkBZoXutN7K4qzfCh7JPhGASWxYDLZnoD//ZzEhpHH2yv8uThSJYsgXM
	hGkisibhdXuehJXgGxP2dJs+KTLGvZm4WrSEhPaG2SG86BWK61eaWtQ79frfquc+4UykUWG/OMp
	oOFWcWFDGgmQa/02/MOsbVWM0TepoZbJ0UxIki2BKR1VJtgcpfkdEV49hC+L++vSero5iOk4xet
	TqW8iZheUTWc+oUAGlL679BUj7L1cM98s/qGUpBPM42lWmSluvRhavyf9Fu/7ocSS3TLHg5mWTz
	yKv8IVQwKmYMGTz1SPOD1GNt6PhcGYW+ukhkCO7AAYtXvlrB8FrmM/GdZftCA2npkyh7H9Wtq65
	Oi3G0fF/6uTe1u3VQq++wSFXTY2Jx/Qb4W1+NzvMTuj0dVvRaDaj3aoEnJfW0QaqxsAFYMpMA8k
	T9D9v+At+djpXfxluI6KDqyPVd5zL+N4Xf0P5IZ5nvvuQc2bffgw0cgpAU4c5bLNKlmpfVLflEi
	fmokEu3oFRvPEBqi+uzDNWGCjPUXaTJ3Zzc5
X-Received: by 2002:a05:693c:20ce:20b0:381:761b:f335 with SMTP id 5a478bee46e88-3856f94eda0mr6911423eec.6.1795281812915;
        Sat, 21 Nov 2026 09:23:32 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([2001:e60:8509:ba6c:4c23:efbc:89e:50d9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm16633136eec.13.2026.11.21.09.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 09:23:32 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 6/6] Input: aw86927 - stop playback over suspend and on shutdown
Date: Sun, 22 Nov 2026 02:23:31 +0900
Message-ID: <20261121172331.863-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261117052112.32527-7-xiaqinghuan@mail.ustc.edu.cn>
References: <20261117052112.32527-1-xiaqinghuan@mail.ustc.edu.cn> <20261117052112.32527-7-xiaqinghuan@mail.ustc.edu.cn>
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

On Tue, 17 Nov 2026 13:21:12 +0800, Qianhui Xu wrote:
> The chip keeps playing whatever was programmed into it when the system
> suspends or reboots, so the actuator can still be buzzing after the screen
> is off.

Tested on a Lenovo Y700 Gen 5 (TB323FU, Kaanapali) with two AW86937
(chip ID 0x9370), compatible "awinic,aw86937", "awinic,aw86927".
Rumble works before and after s2idle.

Tested-by: Joonhoe Kim <26rote@gmail.com> # Lenovo Y700 Gen 5 (TB323FU)
