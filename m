Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919193;
	b=XZSSqoRa4e3UgH51nFtYBHzGHCv4ZU2uCFriR/hNWhSpQTjTw8UWNzMc6/PqotP40WvN
	 2vns/lZVF3g0hUPCWHt838dNu8sYH5dy1RAIqhO84yzqo6KmhHiAKGQ+MvRtHoMLD+stE
	 pHPSgAiplM/q9mWtrg0qQle4AHAWs+jOchE+GoZnoER9y0RrkGl94euv8N7TVEwdic1Aw
	 KsDE25oeWPYjGvoNV7746dUEQRRnStCLqmr6nbsi36985zjt/S/RIm8ds3bN6ODEExYIP
	 MzHpnv1QuqcAgNpOHkNbxBjXp/+Pj1fjWloKaFNNwl6NrdK+lr1oL0gQ1gct5J6HTCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919193;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nJ5hpYg4Cc8VUEITkJRPygPQ3lscK1+CbDfUcnWlRxY=;
	b=wEm6BBmFWJe/ljFty/E6Sp/9f9BGZB9Hqv17TQ3VKkIIKcxVojBFf8kwe5LMIcsuTh3t
	 dISaQWrx81Jg0hFGd5XHroiUJyN9KxXOqPdiyOGlql1aooG9Pvm35/P5mJphmNkAm7rNH
	 nJMC46vh7tZNbpj4Q+jN1YFIXvMDlEBnXKx9Z1iXr0HKLIujo4H1S0TCEcsHqfiEqlXA8
	 AA9MfzDV3w2qbbT6M7STn2rPryaMKIDC5m32y361VMdDUFV3Vju2gpuCJfB7aq9pOV7mF
	 Ucr4oeyYwbhgHmWfTrter1DCaSM4irckv8kXQcnBwqSMa8yHrUEHZtrl+5QGYYL2O2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZAPvjrZd;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845E8606A8B8
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 12:39:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 845E8606A8B8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZAPvjrZd
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso30523475e9.2
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 04:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919192; x=1795523992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nJ5hpYg4Cc8VUEITkJRPygPQ3lscK1+CbDfUcnWlRxY=;
        b=ZAPvjrZdH1ynZ+1SyLLA7fkPQLbJu+W5/CYb3xFMiRsX+eCwe9ddKdOWDabHt+iY4G
         +HtXRZ3spDtEKFbhce0su6DIkz+zJr9mH34jwRBqKZQifrzqKUpzUZzK4Qsjrlpew9hY
         S8ScAM0TZ8pxv7mh5O6GQ3z/zgbVXbsvheONAFloIyexMycUscFo7jH/7Id7mwhDjU7W
         Zr0w8TuBRtt9GzmZv+OJGIsWNnnxbwXeUlzZ/NeGcA4n2o5BOehtlgNnTwJZrprPz0Tc
         sufr04gVrm/JQxjMKdq4B4ovdOQGZak/ePM9smlMh7Z9/FVSI3UQPxJVTVdcZQMMlCCf
         Ja3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919192; x=1795523992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nJ5hpYg4Cc8VUEITkJRPygPQ3lscK1+CbDfUcnWlRxY=;
        b=vnvEaV79dG7ie+dlgLl9ds+yqJLNYSRvWfp0LBFw93wuJ2y11Xli7xwUpO7oRIp7YP
         QLbjZrLxfV29qbDgo0xEzHezDvWmhTKJOYNmBVI020r1JSy/AEdQ+/xW5EEsKZykaKrm
         PfEnOt+dEmIIgiJD1ntsIgvD7fHZEcZR7A1WaMJWbGqGiTSoWf9s5pPrtDh0ZAv2fplI
         XK5hP0zfZx+3OzJzWbnEUOx9Hvf4X56X14kEqjij686XmMXq+oVeWTxEt3mXy0UfQrSo
         JqSAV9C94DbtWtjfRoLD2qXbcIXv4d3m+AVi9cWAPZ4Lov5RbKLFkcTEfv+WAKYZmeJB
         9ylQ==
X-Gm-Message-State: APuU4Z8qzIa9yHkTGMth8NL3Z3igCynbN3H5D0whK6DUhQgRTPRlBBVo
	pQ8olxkO2eqT9XBJoH+oYaZpDvchZ+PUJ/cNuest18syc+cVbJxY8wcB
X-Gm-Gg: AYBFou3zyzun4SZfPcdzsx97+G3OJiUTrHiY9sKlzRuE2s9p8GzIjAJqh2uK2pgBW+I
	LfPUT46N4YXJwgAKAPapE0Xb7hhvlonhZhB31mPpqgz1jHIznN9DUZ5A1vq/ATIHu7ZDlrxW6Lz
	6Q+is0tsl6fa6/uHh0Tx4vw9ZZrzAwVchmzkVL2GGqpGrxpXAAgduREQGVzq95Vu5mtKlxg7esg
	QXQhOdR+5m6FuRJpSxdR5eV7U+Ch9mvZwZP0h7canbUqon7BSFju6bU4/wpJZ2W1/j5yPEH7OGN
	NllJfSCrIwMz7qCdqmhJO/WNlFZFEMqq8vtPkHGXY4iHx8sANr18CRSPzBI3sDhivR4knmWLsaZ
	WicuBjdYxkLcvSJG0O6TBofmqbw3sm2yvXtLFRUckAVOoSVm5um+3AyZiEs4wUndvnXLkoSyy6E
	FtUerzvkAqPgJtfx3OXBvSIisxGV8WCJmpS8KsLc1FQJ3JhivDVgwMKenk+/FwwDS3ietMRIpTX
	yf2QRaKFMFsoB8aQ6nE8tBYVwSL81wn0JPz0qgpZBT6s5jshFOUoDFIbljKXvgBuwopapuqmVu5
	eBxP21lxPW6/hpafwLi5tNAtWP4M9Y1fYhZg4kCBU61t1AY+veXm86BpEE/kjejbskdJ6A==
X-Received: by 2002:a05:600c:6096:b0:4bb:5de1:e923 with SMTP id 5b1f17b1804b1-4bb5de1f26dmr222829735e9.4.1794919191912;
        Tue, 17 Nov 2026 04:39:51 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (94-21-223-203.pool.digikabel.hu. [94.21.223.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783f8154sm71474905e9.4.2026.11.17.04.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:39:51 -0800 (PST)
From: rofikkerneldev <rofikcoga@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	rofikkerneldev <rofikcoga@gmail.com>
Subject: [PATCH v1 03/11] arm64: dts: qcom: sm8250-lge-timelm: add reserved memory regions
Date: Tue, 17 Nov 2026 13:39:38 +0100
Message-Id: <20261117123946.668557-4-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261117123946.668557-1-rofikcoga@gmail.com>
References: <20261117123946.668557-1-rofikcoga@gmail.com>
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

Reserve the XBL/UEFI log and DFPS data regions used by the firmware.
Keep these regions protected from kernel reuse.

Signed-off-by: rofikkerneldev <rofikcoga@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm8250-lge-timelm.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-lge-timelm.dts b/arch/arm64/boot/dts/qcom/sm8250-lge-timelm.dts
index 74b673ebbeb9d..ecbff27976fc2 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-lge-timelm.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-lge-timelm.dts
@@ -103,6 +103,12 @@ ramoops: ramoops@b0000000 {
 			console-size = <0x40000>;
 			ftrace-size = <0x40000>;
 			pmsg-size = <0x200000>;
+			no-map;
+		};
+
+		res_xbl_uefi_log_region: memory@80880000 {
+			reg = <0x0 0x80880000 0x0 0x14000>;
+			no-map;
 		};
 
 		adsp_mem: memory@8a100000 {
@@ -119,6 +125,16 @@ cdsp_secure_heap: memory@8c700000 {
 			reg = <0x0 0x8c700000 0x0 0x4600000>;
 			no-map;
 		};
+
+		cont_splash_mem: memory@9c000000 {
+			reg = <0x0 0x9c000000 0x0 0x1200000>;
+			no-map;
+		};
+
+		dfps_data_mem: memory@9e300000 {
+			reg = <0x0 0x9e300000 0x0 0x100000>;
+			no-map;
+		};
 	};
 
 	vph_pwr: vph-pwr-regulator {
-- 
2.39.5

