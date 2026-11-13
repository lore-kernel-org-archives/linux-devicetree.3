Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794585904;
	b=l0JIEhXefR5XSuTLGbrNCvbK8CGPCzbMFTtlmVW3WMpml9w/vGytEVlAU6Abzl6DXfBG
	 ja22gexGL5HCZMedoHI9mVwblrz5pc+oH1m9xKqmO6XWzi+kJjEddWEWbmWBEw6hlqJ+h
	 DAvU4YPb2dq5JfcYy2zro3DBONrZ4v42ZvApQ/EJI785qaCq8Wat3N1PByUlzvhqjYNXQ
	 SckeHvLsgX7iKHHwymvdNENAGCP3rRdogQ7qcQKd7K4gnfNUnzSImbQtVCOuDhOVPt7Qc
	 Bez0d+vsq8CUmS/3pHnRVg6gzkbDwCbSxG3UAe4QwGvkwdisvdmAE3+MvK0avl6BTKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794585904;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=qnzy4BU7CFfQoiDwnU+oR7x0cJx2X4FyBHG/I6YKRMg=;
	b=46cqSwQ3mIjfZ5SQGXOpRHyobeERTj639HIua5iIL2Zlv9RGRk4z1t1tQ9a0vOZOhMt0
	 1qIcTghYL7SdSLBSjBdp+z7A50VWlL5D/sy2QGn17dvOaUPc0ZwcqR64lPBWgM13VIhKE
	 FyehTLUngBmIOVK0sj6cqNu9GXIJrSEqhWO9NdiqxWF/s17jDipUcHtVTlTamVjhMHSr5
	 JxQcVcY3GDnCn+Lzg4YzNO3/GdrRvu/+wPsbLWT9+dtle+0sKepUN5Q91cXSo1Kc86IUA
	 +scx0OtAPwTtT/TXQHaQQ+7qj7CNbHTrtTDhqMM0jOgfPaQPpmC57Qthhw1sNoMBbSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=NXWuRo4o;
	arc=none smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FEE96070947
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 16:05:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FEE96070947
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=NXWuRo4o
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so2201261a12.2
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 08:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794585902; x=1795190702; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qnzy4BU7CFfQoiDwnU+oR7x0cJx2X4FyBHG/I6YKRMg=;
        b=NXWuRo4onYFiw2I9QVxX5OPcgg0tUYOXHsV+WLZ1UsLq8W44JTs5HZvfoNvfPYwfqZ
         aVOf4cZpXSmdau56AKXJsV6WLFeanx3/L6Gy6RdjXG+kl/zXHoy4cJaHlVW/zPs9kBuO
         oemMwQSPJYV6h+bJqG1F2EHGrXxt0dOlLnWgwF5Ulcpq9oM3p2swIXKrikcx1BuL3LKA
         qkXPq+g8+NN0qbt24tDmj702nIBntuPk1JB/r2+AInsFcJ5NXND1Shy8zA+xJm/itwf7
         6pWUpFjQRQUasOfYu6ayS094qOl1VpxnYcWG7zeE1bwzTUM3WF9GOAAo4Y/Fbxs7+9Rr
         ydCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794585902; x=1795190702;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qnzy4BU7CFfQoiDwnU+oR7x0cJx2X4FyBHG/I6YKRMg=;
        b=Z1BHHCop30mHhgrdRXOkB0HPanRIZ0zvrIltl6MbafE0cfqNEwtClMLFCb20PhnUf+
         gm0irGs9PBmH9TtESD0bLRNN/M9aBT+YlhudVHni5gk55/TmrbH9P91QL8L8Pq2uLCIp
         ixNP7gure8rodvKCgD0JhDeGRig/uEtJH1uQN3N0Dx1TGpOcgSilaRgorX5q/L8jWdEa
         zptg1H0fQbRXnvJ3TR/itSfM9vLgy5TWUo/IYgX9obbysOCA6p5aDnF8f59s+ZWY1sLd
         /B3eVFWugBRaBs5xpuie2LJAfGsioE2+t5nN4XY78mpfb2XA7HUgbBMXNU8oyyMPCzJ7
         S0GA==
X-Forwarded-Encrypted: i=1; AL+hErF4qtYqg0Xbwg1mZLqF287vPkigN2nN+pPOHdPOLst/gGohtNvajtingQLo+20LqGf7NmEBdAf19pF1@vger.kernel.org
X-Gm-Message-State: APuU4Z9oPkEwFIXq7lfVpCJFasg1BHQDcBsizgLUy/tqWp3Nq3ekuFLX
	xwGLvf989z4E5wvqrBsEnTH0Z+Ym1UoXcXhwv+ZK1QuLIiwnkF9KBLb2VK4jEb+ddT0=
X-Gm-Gg: AYBFou0A3zrI3f6/lh+ay6GSIWN/y3fbUBcXSzKau3whG6zxrFUUQXrOP5kz7+WWijb
	tWcTnbka7ltSSFBWCLjBOVJBZ8gvn0Y4lX3td4UFOGxnkyWg32i/5iMPeJ9PzxwWeEVxPvw1btt
	GZjeTkfqyrPF97QyxMnE/+gy6RvMhXqiNs2DBseby4Q0/vO9zosU1boQqazlIBkvf7AIHJ8YJxY
	a6C6xsE1NXpJBuZlsw96AkgSkUHVOLjlisQbl5AIvTlafNPkrxP/FyZ5xKKR3PD/QLcLe4M/e/b
	5+uNooXLMZuZVDPSjpPC0aIdgXZ0EjKh/CrFFpk43r9HGMUNtd8TIfWwbpfJB4NqcHfO9BWrdXY
	MSQ9jvIkRVh6YAmq5GG0slajVdf1fYTYZDXWmipZ2YjmMvKQv8Lfc8LlbyHDkYueK0eeu5Kswnw
	hbCeTDhl476C2w3XlTPcEWYDiFeSKz0fGHG+TtLApjN3UNsnVMR/8XZR1jpoAgqm41n6N4PAgwz
	M0ELdZwm8q4aD9YKBqHdUc7XKTtUWOBO82TYt+g+XpymWrA+7otKDieEaI/YoJDmYwbuCmsSER6
	93OOiIJug+pQUf2Rqa9SDVQabUkkleTDTMZyR6Qg9oFvQ1EILAtrNbXGXiprt3gWJYVp+hBhr1t
	XQFwAcyw=
X-Received: by 2002:a05:6402:c6d3:10b0:6b5:8719:6d51 with SMTP id 4fb4d7f45d1cf-6b7c0c1661amr2023087a12.32.1794585900329;
        Fri, 13 Nov 2026 08:05:00 -0800 (PST)
Received: from [172.16.240.104] (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c264d99csm1123946a12.36.2026.11.13.08.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:04:59 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 13 Nov 2026 16:56:43 +0100
Subject: [PATCH v3 2/5] dt-bindings: thermal: generic-adc: Document
 #io-channel-cells
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
Message-Id: <20261113-bat-temp-adc-v3-2-743979a8fd90@fairphone.com>
References: <20261113-bat-temp-adc-v3-0-743979a8fd90@fairphone.com>
In-Reply-To: <20261113-bat-temp-adc-v3-0-743979a8fd90@fairphone.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Jens Reidel <adrian@mainlining.org>, 
 Casey Connolly <casey.connolly@linaro.org>, Val Packett <val@packett.cool>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794585895; l=1375;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=I/NJZJX7ehckBNBNEstT8hdZRvbJ5dgDjnQjjzYNTLs=;
 b=Ht22iLsedKZL83BN0JDY5PWcB8ObVo0t6BTxz26Nw19xpDmgxebf+ud/QHUeqUQWi425ecQ3+
 SxCjc8QTNEyDHbneK6kZJZLlWO3P5cfHB1Ugyxv5BwyqSTZWKUV7rxS
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the property to allow using this sensor with io-channels.

This means that the output of generic-adc-thermal can be used as an
input into a different node.

As a specific example, generic-adc-thermal takes in an ADC io-channel in
Volt, outputs temperature in degC, which can then be consumed by a fuel
gauge driver to provide the battery temperature readings to user space.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/thermal/generic-adc-thermal.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/thermal/generic-adc-thermal.yaml b/Documentation/devicetree/bindings/thermal/generic-adc-thermal.yaml
index 12e6418dc24d..317fc39ed46a 100644
--- a/Documentation/devicetree/bindings/thermal/generic-adc-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/generic-adc-thermal.yaml
@@ -24,6 +24,9 @@ properties:
   '#thermal-sensor-cells':
     const: 0
 
+  "#io-channel-cells":
+    const: 0
+
   io-channels:
     maxItems: 1
 
@@ -58,6 +61,7 @@ examples:
     thermal-sensor {
         compatible = "generic-adc-thermal";
         #thermal-sensor-cells = <0>;
+        #io-channel-cells = <0>;
         io-channels = <&ads1015 1>;
         io-channel-names = "sensor-channel";
         temperature-lookup-table = <

-- 
2.56.1

