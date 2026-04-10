Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12083AC0F0
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 08:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775809034; cv=none; b=bKyXjjEazJ5yFrhwA3gqIyEjHfOX8LYYns7JC/HrSQ9ENDsPeLvvutJpxSIh+nGCz3jGsLM4iJbKnr8V6hcW486oe5IoeqZg67y2WpjD0Q9q64g+wYqzS1XJ5CJsmCTDctTX8bHqsd5z/+oUZtFYTgSLTQZQISrS+ohgqSPF3DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775809034; c=relaxed/simple;
	bh=B17bVmBmnkP1hcqtGSn9ht5X8PSnvCu4sZaG15J8RhU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OjXICjvqyV6hqSd3p/clmZQykLXHLU+TQRL6PJOhjJp962ymMPDHjyArj1lBkg34hqg3S1sliRqQtRdGBGTRGLLwpEfnQUucgfY/vo0q72auAEy8RJ4g+DmGOEptWjM8psHl97iSXwMNwY7d9/lsVVhMvfU7wjFN8CFGw1USk8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=ug1GkVtc; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="ug1GkVtc"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b9c280322e0so213390066b.0
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 01:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775809031; x=1776413831; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/I8STiLmCdAUWAKR9dG6wn9ETGBCkr8LaZ1bDk3uHnc=;
        b=ug1GkVtcL3hcvY2TaQ9+ntIpARBqmZoQjXbUh4IAJc2h2TZTwuXCJAvOEzaANt3qny
         fUka1GmC4Fcqb0UdHmGSFQz5cQ7O/KRnIa0a/lpXTU9L6kctR/KtuU4CwU2u95oZr8xW
         hV7zCncgHT9OnvKbvKhpB7SI5y8cvvKXQHlxHY/aby5mz/bKpJ44q/31Zb/daTsF6j2M
         aeln597pCeX93rKqmT2FadNuy7Yq3w69HURp2dtGqoNIyfDJzxwQ2ryIDqQJ3+YudDBD
         kJc5Bf2yGLH5UsLgGl2Kd3b16VUZ2gfgbjMqzGvlATwQj6fB5CvQwfYLMnBMn69riBSr
         9d7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775809031; x=1776413831;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/I8STiLmCdAUWAKR9dG6wn9ETGBCkr8LaZ1bDk3uHnc=;
        b=XporC7FQz1QloDBYgqIRblL4g0WmyCXtHDNfG7rUdy0nlktIP4V8PQdPIJiI1vl1zH
         y+3IXGSPneBTtdQY0AGVBaPfcbLIDkE/ldrl2xd82eYtIGTGNGB216lwwumn88xv5xoG
         9lC076mgKLghqLZiraPZ5w0NZLi46ML1/rmTGThT4fExh8fl6L5IrUVaaxhJLtbuc5Pu
         XbIeIBYgj4DLUyEbtNNJk/WgAbGh17MbQPuQ3JRaTj3Nn2EC6kriwo4kZkyYuSu0CKSA
         sABI0fExHK01tOjsSy33POU1XGKZSvzsS2p+ljINHofWKm7mqOV6BygKqPBoheFchDib
         tUjw==
X-Forwarded-Encrypted: i=1; AJvYcCXfMUzxCZyassu/435LkPR5OwDG0UzgkmG61tRQuLhUh/jukW5AzDOxGTBl7DMze7YvTP1ASPTEDzfM@vger.kernel.org
X-Gm-Message-State: AOJu0YxzfltdTkd4tYMch6JjOuIa5ol76tJfoMY17euwMXsiPv21VHy1
	v7OGGdyZr4g9hb8s9kmMsN7liAk1cugO0/JISYHo903x6OvpnybkBRwHgodQsRaWAmo=
X-Gm-Gg: AeBDievPOk1o2dwhn9iRAKTMWC439SUphI3sE24Ws4US4e50suhYjvV38eoZIyDoLYl
	SIUG/LfjKwE4CkTUU5kzl3Me1Y7B1zZmaANf2kYMHtV+5HXWYNJGVj+XGX8j0jRfc+wGRc/TcwA
	ZiuDYxP1ec3dORriay01jhdSTbS2HeaHfp40RRBqhQWycFk8ZO51FM0I2OCXKkNkImYXNAOs6aS
	NZH/R0XSkCiLuxQsCypYODs+FX69Yvzd+8BTRb0KgaDc1waaWvChuoBvIAv5LOLcHhC7BNZUVWk
	JhHHWHgm2BpTfoDEN8VY3Al2a1TMtyQVFD5zj35Dp3ilbt6rlGnaYGZfvWr9C4EkX/+rk53+qY4
	uNPpEKJcmJNwikHWBt9xdARgRQtiYtEy3lcf01nGsjyvLEOc0i5rV3unbMj2MSjpICuCywM4Xwy
	4YxXSZ+n0eBvZKnM7oRMs13apZFG6COfG/QO1fHHEzQ/MBcJusLo0tRnFSR48lQEd+w1qqksas1
	FxnGg==
X-Received: by 2002:a17:907:a4b:b0:b98:6a8f:7916 with SMTP id a640c23a62f3a-b9d724958acmr135988066b.15.1775809031197;
        Fri, 10 Apr 2026 01:17:11 -0700 (PDT)
Received: from [172.16.240.100] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e7c7c81sm58488466b.43.2026.04.10.01.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 01:17:10 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 10 Apr 2026 10:17:02 +0200
Subject: [PATCH v2 2/2] arm64: dts: qcom: milos-fairphone-fp6: Enable IPA
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-milos-ipa-v2-2-c699b6b8cf27@fairphone.com>
References: <20260410-milos-ipa-v2-0-c699b6b8cf27@fairphone.com>
In-Reply-To: <20260410-milos-ipa-v2-0-c699b6b8cf27@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775809026; l=815;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=B17bVmBmnkP1hcqtGSn9ht5X8PSnvCu4sZaG15J8RhU=;
 b=IwTuVvJsgu8rMOmBfU26s9NGz8XHAIiBWQdtyotBXFTPHny0nzmz0kWVXDv7QSRNEsBbkoW2N
 NlN1jSMUPp9Ad/0y60KMj03S0YNmYQu2xXVp5m43wEW9CKVgyJVRdjS
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Configure and enable the node for IPA which enables mobile data on this
device.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
index c1899db46e71..31c6d6627619 100644
--- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
+++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
@@ -690,6 +690,15 @@ vreg_l7p: ldo7 {
 	/* AW86938FCR vibrator @ 0x5a */
 };
 
+&ipa {
+	firmware-name = "qcom/milos/fairphone/fp6/ipa_fws.mbn";
+	memory-region = <&ipa_fw_mem>;
+
+	qcom,gsi-loader = "self";
+
+	status = "okay";
+};
+
 &pm8550vs_c {
 	status = "okay";
 };

-- 
2.53.0

