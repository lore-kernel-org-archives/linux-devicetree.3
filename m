Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864319;
	b=o1ukv8DWeYSDsekCGD3UK1dPo/703drDCjXYlH0/JUS/r6G2yv4yM11fe33l7fq9ualr
	 qLqf9gBUAywRsVdL1GCVfmbO0b8NDLo7e9t321qCrrasoUgV9wsFQ+U0n+2CVuVTScehh
	 q2M77f6GgY/fQA5jFTgkeMPvrdfwPjbGM1Trle3lAWDJxooOvBi/zz6vJN/yPFGcqm+5H
	 O9qAeDcJ1G/gFpjEOJm+cJSQtuF8hHfSIMICZFHPZAgE5yls3Pf7Z0lUe3t3u+K1zzsef
	 ohKE4Na84dBdD5PMNwalvc6s9HC0o3CjP96KLpIhQknlYcvHwfiPWc5twQ0Xk3L7zfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864319;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=2SOARYtnJo18igv291sc1eP7B92CvpPV7r5k9Q4RbGA=;
	b=Etubs5Mp9eCaZmOJkqefBQTogrIGLDgsjgSmxkYhZcK3D6FpVMlGy5tCQPo1Ynzt3rkH
	 AcLyWwAJmfE1fEvr7jHrswSp5Jr9+oApAPUsAYtXZ+OMy92zZDUQW1ydpa+beg0iDd9Dt
	 RSOZeTLiESHbmzyZNFft+0MmvwsqfGxwGNL22vDtY2Om6ItVfwCyIc7xFhOgSbfONXzbl
	 4s12Q9tnD+JkPGg1jWTDizs++GZRMCx2x5Bv5Bz0ftAl/JMvHSTFK6X6icTR3tXQ1wl73
	 RlNl0CvdRJbvx+HaVjmwhlFw1PvOvyBunjz97zzIVf9xVCOu4KNqoF1uBLnkWkmHaVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UOLL8Whu;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83D2606A884
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 21:25:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C83D2606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UOLL8Whu
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a210470b49so32728665e9.2
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 13:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864317; x=1795469117; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2SOARYtnJo18igv291sc1eP7B92CvpPV7r5k9Q4RbGA=;
        b=UOLL8Whu4LA8bNveYjnlOSE38Ii77baYdefAzKBwlYfl11uUi1Qrf9fMBGpquz3o2e
         vKn3CvN+EumW6pOW5Qn6+es+DJl3mdDy4k2yt3ueX3bbTGxSwZXA3h/2RRnVEUrB4Vvq
         pg7T/CRQIR6huYmF3hi7pPvvAazaohD0VbPSmnldcEEbXZ28dnJFa1HsvVM3Rheb4bOB
         uKvYq8v2IJyU99lrrsvgoB+lmkiGHwqEu/A5wTRI8NLDYOCbsRjCpmlLePXBIpd714go
         U9ADvoXRexU3wQChWFi39Z64trquY2qUbnIlSIIcnmix+ZWryn3+v1c+1a7M9VCBpCHx
         Ozvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864317; x=1795469117;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2SOARYtnJo18igv291sc1eP7B92CvpPV7r5k9Q4RbGA=;
        b=ybq7sBjZjwc5kfa4hMI/Ix0+9Nf8tsdRmjDhPefVp2nJE+eSGgWvcWgc1JfbxEyyH9
         fswFfslOhxdBFAR18RNipkncY1+lLf8n2KpkEn8jdDZVnirUM05ZjsY8c7wPyXWm4ln7
         OnYm5dBoPTe1222Dxdquxr3m0/j1BAbPg+Z7v+lsYy9gfxKR56N67IcYY3ILZLLYwwWQ
         GAZiZ8mhhgQje7xXRX4CzEgjTvRvEE57Qac7ZGlp0PXQbvFkTnFGjYgZWTMi5+uS2eiY
         C8+oGEMcN86L5MA5YVqJJ2BngvdZoHDcZSxODrZvYN8YdpD6VQgjcuqgEeO+1xm980HT
         4SJA==
X-Forwarded-Encrypted: i=1; AL+hErGE+PuWRnahdjAOx81zvrhxJ5+XiYVMz9iV8TB/hZ8kE7mJ2p9Qw8yw7/1LDgKnmtMtQtPH4LWxEPOE@vger.kernel.org
X-Gm-Message-State: APuU4Z/e5itknuk+saBmp/hQiiEVgsW1F30HZekl2YxtlZ178vQsbK4e
	ZHW1d3qGQDY8lxyORa+QS3FqLCDqiry2FcLXf/AqJTUZbXaNQbhgHCMSlYn/VKRDAVsc6Q==
X-Gm-Gg: AYBFou3ZFcWteQ+yX3vWIzxcHoRQLdGulWi+5uWH9zImNYqi9UfaO2HgC3RZou8SGvH
	1wwR8Q/x1q6QheqcAP+FCAxjewYqJ6Z5MSpHy9H9PNrsFVRCWabzOt6ZIggc4CwjCg11jp7XmAh
	d9h2Fuw2qd4Le66E6j23afti7Us5KKbeGvah+t+dqKpiqjDUGfsjNun6+s/0leaD+V0g2dmkXUj
	0ZZdBHpLXHlYljeoPP+Jd864JgsmAiMb2HPslpvx7Jyljs+bgIVjyZQf3vaGG1h/M3ION38Fh59
	+95KUgCn1uvaoJ2aqDIxWG3uYMX1Co00ol6RkLzjLjLOpR9QcJtFxrr43K7kg9iPfuyZe7lTsfk
	N39RpulQ/GN7Kmal/4PWx5q+llb7hrcT/mX3LgkjVOiAWkVkSb+MugFApZVFtdk17oP1UAHgBXc
	X5dLwv2/OT9vzi+0VGQ1AivevLH3Yt+PjKx0qIRjg7v8ChA+TwUoBhBBrQ/B/Hf8HMJOL93UljN
	gLb/brc5ZYUiyacNg3PomugycHcakfGj5hhvnJjemJ8FEF+vr9hGHBhYqaaFjrGqCAIC6zaMbZh
	vrC9U4fBa19DgcBRxu+/9EJ9kZ9vjZbHHecQPN0J
X-Received: by 2002:a05:600c:a302:b0:4bb:7347:d5c0 with SMTP id 5b1f17b1804b1-4bb7347d930mr63274065e9.9.1794864317319;
        Mon, 16 Nov 2026 13:25:17 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783854cesm26340475e9.1.2026.11.16.13.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:25:16 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:25:07 +0000
Subject: [PATCH v2 2/2] cpufreq: dt-platdev: Add Halliday to blocklist
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-halliday-cpufreq-v2-2-e518cc055457@gmail.com>
References: <20261116-halliday-cpufreq-v2-0-e518cc055457@gmail.com>
In-Reply-To: <20261116-halliday-cpufreq-v2-0-e518cc055457@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>, linux-pm@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864310; l=881;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=2GcqGR0zihHNnFXHb5IImaTefMurA0fW5o4gSm0JefA=;
 b=4lc+g+lfF1maKT/cQEhVa2dHnEqxr9Y+m7dCjl3rPKrIxUad1nOfy9KT8AZ+/l5jbkMGdKmvS
 Ef8hYu3BiTDCLxJ4PgoQacYXz8x4Ckmxj84jXTaB+zf63OVWiNTiiSN
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

The Qualcomm Halliday platform uses the qcom-cpufreq-hw driver, so add
it to the cpufreq-dt-platdev driver's blocklist.

Reviewed-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
index bce4c87573a1..3d5709eaa08f 100644
--- a/drivers/cpufreq/cpufreq-dt-platdev.c
+++ b/drivers/cpufreq/cpufreq-dt-platdev.c
@@ -155,6 +155,7 @@ static const struct of_device_id blocklist[] __initconst = {
 	{ .compatible = "nvidia,tegra234", },
 
 	{ .compatible = "qcom,apq8096", },
+	{ .compatible = "qcom,halliday", },
 	{ .compatible = "qcom,milos", },
 	{ .compatible = "qcom,msm8909", },
 	{ .compatible = "qcom,msm8996", },

-- 
2.55.0

