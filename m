Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794585905;
	b=apRMf49LQkqhzuAmnCR++j6CFNqsrLLCbFyWBu5k9GNbH9VbFnY9rJfXaASn3XnLgT29
	 /jjj6/5ry9Sv2h/q1/MX9zGIJ7aj6VeOpw28pxT+QdfID/hMlRhBAXfY29B5boIZuoicJ
	 rQWVOm4fEIRVB0np19iKFEq6HYqns9yqPQsyC8ILOQEQVdhhdfijvnHo6v8bs5DfoElOy
	 g12Acs8z4X41ohcec3gANQnjO711KKGNTRnt5a7UEMxfda26nlaRh7ZqprBSqiQD1lTr1
	 /8y4j12OHFBtGTf6hMTIqdkPVgmylSrsjqLXwHkzI1gPsoz3naFPDu+VOYo0wnmsCwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794585905;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=xw3xnb7M3ni/K395S76W5M9HsZ1EBFx8fzPBd64UQdY=;
	b=W2PlTZrYQwSqex3tkiSi7aI1r93j9ZtzHtVAzp5TqC6IkiKERAOd3opW/15ck9/0xncf
	 8gwxY9MZbMHe5ZuuVtV4E7IVkE9Q/5b56kLMhVtkefTQANY++9CdggyWi8VjxIXNEqxLL
	 l17ILY2jk2pUaNJvSfajnp9HBZZYAfCbE9haTd4tszd5CwZmcy0+xREAdDk1OWydfL3Rf
	 fF4pH3GjHQBqKziLmE5A3CAw4YZj/7+a+z8AkpqyNpM/Eo6oqvyNk2Q8zbLWlTeSxPMTV
	 EdvSFNHl+yOIqgaMhL+I0/rVH4N6AZTtySZ0XHS8BYmvHXHKkWJDVsGAFO8I0Ngc64w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=CsDLFnXt;
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4204060A6F6A
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 16:05:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4204060A6F6A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=CsDLFnXt
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b581b6b0e9so1704258a12.2
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 08:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794585904; x=1795190704; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xw3xnb7M3ni/K395S76W5M9HsZ1EBFx8fzPBd64UQdY=;
        b=CsDLFnXtB3WQ1uRAtL8aws3SolQHAtawncLSuzZPxSkA+bkQI1GAq54XPJex/Ud0wa
         EKWnT7UnEAVaqSpnyo32Ah/rEBa4EZSOOv9HFTpYrKnAHHrMrFRvbXVX+l/zeWSK00uR
         cyQhJpE2bgjnpBr6UKRN1a2QuYXr15PO7++KJLHnTIf4ZtGjlMFN68qoP4H+j+lT/kIf
         jqdG+IjYbtGtMwJzN5AaX31+8wOvMxnMu2IdVCLPO/xrb3qg7HNBi8Hsy4Q4gXuwTdwl
         JF7s93f6rXH0EgrcPxwC2lWZygZuw9kytyklugU2pHYTmMHAj4xrfTMrhfrtwxuJhyK4
         1qVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794585904; x=1795190704;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xw3xnb7M3ni/K395S76W5M9HsZ1EBFx8fzPBd64UQdY=;
        b=mrXvdUlD+EHMAKCne2kr6ywzbB4DCZdZ1T5JyOWomw2Mw8/tkpfS3lcKfRRLhE8f8K
         q5sH3o6PZ0S5zN9YqNYZF/57TROkIsxMLJetMOg0W8gmNkthXTL3TYQqy3xy7LkE1Mru
         natCYwsU595gB+McHlk3hh+aVVmgvyKA1/tjqXUj/Dd7BfFwr920roQVvgT81Mf4OIPy
         FzTTsq97muLjwklJUUfg40hGMJTejj9LzLWtgv1sIojL7d9ffz3w4d2d9wYe66VLSjD8
         9fqoR4JOHHrcCxfn63q4hFp8OQJrP0skRv6aKs3/BxTUqUThklRbGKkf0Ik+ldyk58nE
         si+w==
X-Forwarded-Encrypted: i=1; AL+hErEoO8ED+b/Tu0Oc9rjMxByx4cUA/B9EhT7O+sSrbjM9e0BWOBjmt5EoujSkO0s+gkriR8Y5Woj26wIg@vger.kernel.org
X-Gm-Message-State: APuU4Z8AHitIyVmuwCi1jpxBLrFg1dVLjp0gt2rc/2p2PP1il6KoztXx
	Z5XfwKfKcZfS4CIr7VHGZ1uNnLhxqKZlMNsCwso/bY6HjSsExRNaj18vEFDsPSRw+qg=
X-Gm-Gg: AYBFou0mdy1/Xpz/HH3T3WFonn2iSyJ6OZ3zrQQGZWkRTyypPIS7slNdV5vcXVvZt2T
	CNjKR+7DVECsiF6HWEZS2cTxi6UIxIZLt+QfMDiJGE5OTJyDeqy8ftfqjMf7m38Kf+tqz9q0p8B
	uvK5TF3SvMgN4QWGIxybFRAOmEj2bixKamKT0OP/nymKGMIgcqCeaauJrRAVxULhQjxtBhqUz4M
	nhJjrwONdo0fneSSbZp0qNKsv33lBJ+BeRNb+I/hb+P2DaXGeyR7mjbLRZ6LW/QL11zyMexstQP
	oToqSs+CLW1XRnSWKCeRXvlVi/QHVXX1m9ZjZBHEpzvNE3oTNqT+Nr4qg10GoqM/0cV9kHU1kSY
	r03NgmeCyT063dBoVAmOaidp/eYSND7pxzX+NbZKbThLcwv0Se0Bs7jPLjqUc3St9Gkj8DtCDeY
	56vsQb60ipR9l9f66rjVA9Jk2OSQ4o8GSNrxwypw2prnBBw+pr++hE7BJVGZh1a16YznzV2/o+g
	lR/3Cdj1fLx1n8Nky9iEAl1T29wvDQc4iDeY++rkyXyThpMTlsU5pJ4e51XQNal+4EMS1HV8bjT
	gtmK3uZDnOH20Up8vTcM+aGqsn8EKQqduvO+UH5BZvxh+ECZCHqozcEclS00nKOrE7bdXslm1Rx
	peHcroT4=
X-Received: by 2002:a05:6402:c4d4:20b0:6b7:8ace:4bdc with SMTP id 4fb4d7f45d1cf-6b7c0be5dc0mr2076346a12.29.1794585903767;
        Fri, 13 Nov 2026 08:05:03 -0800 (PST)
Received: from [172.16.240.104] (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c264d99csm1123946a12.36.2026.11.13.08.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:05:03 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 13 Nov 2026 16:56:45 +0100
Subject: [PATCH v3 4/5] arm64: dts: qcom: pm7250b: Define battery
 temperature ADC channels
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
Message-Id: <20261113-bat-temp-adc-v3-4-743979a8fd90@fairphone.com>
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
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794585895; l=1412;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=b7mnu5CgjN796/wKAPryTmfFj9uk8BxPsgl2XchGimQ=;
 b=39kPDo0KhTsrVvnjKB5C4HJbyboZEw6GYyL3G45auk6/fdnDjvSVTwlOddsdPKaBb22KYj5re
 PV5Oqu4IxGcAOs2aPblfI2Ry7nV+J99UGRYwq9dKkZe/+PFdMxVRJ42
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the definition for these ADC channels to the PM7250B definition.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/pm7250b.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm7250b.dtsi b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
index 43cab07126c5..91e83587adf2 100644
--- a/arch/arm64/boot/dts/qcom/pm7250b.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
@@ -155,6 +155,22 @@ channel@1e {
 				label = "chg_mid";
 			};
 
+			channel@2a {
+				reg = <ADC5_BAT_THERM_30K_PU>;
+				qcom,hw-settle-time = <200>;
+				qcom,pre-scaling = <1 1>;
+				qcom,ratiometric;
+				label = "bat_therm_30k";
+			};
+
+			channel@4a {
+				reg = <ADC5_BAT_THERM_100K_PU>;
+				qcom,hw-settle-time = <200>;
+				qcom,pre-scaling = <1 1>;
+				qcom,ratiometric;
+				label = "bat_therm_100k";
+			};
+
 			channel@4b {
 				reg = <ADC5_BAT_ID_100K_PU>;
 				qcom,hw-settle-time = <200>;
@@ -163,6 +179,14 @@ channel@4b {
 				label = "bat_id";
 			};
 
+			channel@6a {
+				reg = <ADC5_BAT_THERM_400K_PU>;
+				qcom,hw-settle-time = <200>;
+				qcom,pre-scaling = <1 1>;
+				qcom,ratiometric;
+				label = "bat_therm_400k";
+			};
+
 			channel@83 {
 				reg = <ADC5_VPH_PWR>;
 				qcom,pre-scaling = <1 3>;

-- 
2.56.1

