Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794557803;
	b=iwdN2mc2sgkSGVydqG7sVCSeiVQC9v/cKJaHaFOHsuU+u3rLLwuwgYwOWdjh7/NI7ns6
	 HIQJL+86hxwlywIa99JgaSyJeLeyZWZu3IAWxEziYGwZdjZx1Py84E+6ts5B1x8W48zAC
	 cFWAG29ifvC3LpUjM4QLRLjcQ7y4/boNfvf3lgzS2+vYUeGg5tzIrBnOoTrI4Y13Mv1os
	 uaSljSgo6itb96rRkv2NB+OYC+D9TN1qStea2LMSmRXXUlv+gCsjZjPaO1g7wA753OZPV
	 EHTPa2kcct06+sdyqDnLsotf91XHb4FDq7/aMV20hpyUVQlXN9uiUpqtLd9EhGbHeqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794557803;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=iQFTvmXhc7Os6jgWWtbp3W0a+iCMVy4yMh4ovPL/AhI=;
	b=j04nW+LrgK//lOMZ5ZDjECX8PDP2ki1++MbZmoPNupzT6RtrpKQ3x6t+LFTmh4qhHyVv
	 Vl7D8glMDPy3fVpnI2pYCnWD2wtWtX2i4hknkA2aSGfpAIX0x5WzIukpS2N6tSrm5Geop
	 meukRc72GHGCcO216ed5IM6hcgfUeXLT3JTQ5mBhkrmAe32mfR342lU5ucBQgCV+wfAZ/
	 Uy1jGnOzVNNUtpmGHuT99YzLNFAklvcIgsQBKUq3BuhNHxXcb5A/YHIl7JOroHPAFKcFS
	 a4HFSLnqSYHO0NNm2dqYmFnGBaTCl1teZH1kqYsTWpzG2ionTcBbsFAWvt8R2fYUfaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=MSscyRQQ;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D88606A333
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 08:16:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45D88606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=MSscyRQQ
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4cac7a7d3cso101856366b.3
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 00:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794557801; x=1795162601; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iQFTvmXhc7Os6jgWWtbp3W0a+iCMVy4yMh4ovPL/AhI=;
        b=MSscyRQQ4ju3BAXAXTqwR+KnoFm3xqXW+bk05zNcYmZZ/GU3BcPBJNmWgnFWB3+u/B
         2207JCdcECYzl3Ckdq9gwJKzEXaxeefn0qlLcWzFVGzJK8eHO/YGboT+aW22A5V9tieX
         vMyFzTi/kbdPCg6VtFGgFm0EZhbIZWpmbqZDi22qYLCcsstULFdSTExzs1E766mwH6J+
         JvQmD4DNikUfbjPN+QjlpF+aFFsjlkwu6YYXmzBDndXhYWTz+qGJPvZjD0zvi84ahmj+
         5fvUTnA2Kl/gLwBnCgHambLU/GmtoBf/G2OIVLHlMPH+spsKfIVgbHT39AVZ0PF6xvZ8
         lyLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794557801; x=1795162601;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iQFTvmXhc7Os6jgWWtbp3W0a+iCMVy4yMh4ovPL/AhI=;
        b=mL7jhiWDFyCMtTMVx3+BH2cQP+jshvWclZoe/LZjMt/e58FD1BWgl0rNOfsyp7MiJW
         bC8gqIDybycYH+cqa1fChqjSrR3CRuZsh3s5y+agRa4uRrrPvHbyXrLA6ZUxMR2JmINE
         jJs/aaWah5j3ybeClyXkRXwuI2UGOtmjCUnMTcA0d2Zga9oUGWk47Dzg+jgUcybKKUjv
         /nfLYJ79ZpVmPUuKqsJoZEyeF4WJhXcD3PD1GjTDoztYjIKltIpLZUjyk7XpJbdm9Mis
         Cx8ABmEs2MkJfL+A4EZMfXzCXdKxGEcORXwefQfz2nSi2ts1JQmAHCxoPXWNGMilXhU3
         V4aA==
X-Forwarded-Encrypted: i=1; AL+hErFYJ3hFBapWTQX2J3cPgmByAmrd9RqNbBlwDcFyguZ9XT9tGMysDz8rT4BdLz83dlmEtiVSJuw3930d@vger.kernel.org
X-Gm-Message-State: APuU4Z8jhMVfOpCn84Jbf7k9wpUZbejswuExwf0wyYXnVNNHe/VpiglK
	1TLAu0ybmABsG5jHeJeRBpCoAsoamFA/u0V9mxweHWDClFqZa8ZtaxG7PLx3DCxMwXM=
X-Gm-Gg: AYBFou3QZNoKydWhKQQd3Dtq7s951bG7ZpL2rwbzehb3WzWec4rXE9B2EXgwkUeF9jV
	o3AQYe0lBKKOlChT/yRrU7rNTAbUZa4bmyQvu68HDBeHqgwII7E5VcVKE2gZ0F/ENEehLu6LURN
	CJiPmqlggoPzTUT6zQS85GEH9WMVgnFUxrdhBXnxFxkxQf07t4WWVGHV0OLgH0soMSxncE43W1p
	a1Tkq5y5eFdtZpoAmGMp+QKwfSF2LzhxFkp22Xe1zs4Aj6BPeDLir/24OeSKogFHwUPEVNI20dJ
	rWxcnbXTFQZOZUbvk11u1HAQFg+PNjx/VTzSeMqvjyMS8SzvFukUfrS8kuO0BuNy0Rit8SQl2nL
	FZ0V4+WqRJmXb3gOjbkda3TvIrmv2B3RpITMOSDKbz587chLSA1rQpmySsFUSTVWBga1JPOVplD
	Nlu/s4z5xA0LD0XXTpF8mamZWQdhTDt/5TZAozF4+VSkoTyRewPsa8BU6dGHvwWGl6MLJ3vuaKv
	sj0Iur/uzWFuW9kB+q05pnw1QaWV5K1naBSZbbE6zSXJyDk+kZtwDvNRmSbw3LbGgUYTJ4uMzAG
	M6BdFfhorTvAoos9kMFCFbx0pKza5fJzf+2KDlb33GeSow9cHgZbgie2T778Y9vrLYVxsHMq1rt
	MN+bg/uc=
X-Received: by 2002:a17:907:72c8:b0:c4c:fd37:bb0c with SMTP id a640c23a62f3a-c509642fa91mr120493666b.29.1794557800810;
        Fri, 13 Nov 2026 00:16:40 -0800 (PST)
Received: from [172.16.240.104] (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b4214fsm65243866b.35.2026.11.13.00.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:16:40 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 13 Nov 2026 09:16:38 +0100
Subject: [PATCH 4/4] arm64: dts: qcom: sm7225-fairphone-fp4: Wire up
 PM6150L LCDB
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
Message-Id: <20261113-lcdb-enablement-v1-4-1dc40b49ed82@fairphone.com>
References: <20261113-lcdb-enablement-v1-0-1dc40b49ed82@fairphone.com>
In-Reply-To: <20261113-lcdb-enablement-v1-0-1dc40b49ed82@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Val Packett <val@packett.cool>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794557797; l=1746;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=KjTKTH9Miq+8wMoPpDn8TAAfkWHtiUZa4QdKBZGsgPQ=;
 b=0gEdfshP1PkmZVEL/h2v+0KFiWjmOvW0x74d6gZcB7Mc88ZUGZl6AjEnXDATqUxlfd90qJxBn
 i6waAEMPGQbC+r+RZ5r+EKzsjOrbv6MuRFlWCZp+Cz6OAfHYIEskU9Z
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Since Linux has gained LCDB support now, wire up the LCDB regulators so
we can turn them off and on as desired.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 26 ++++++++++++++---------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
index 37aa272019cc..d592bede6a61 100644
--- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
+++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
@@ -72,14 +72,6 @@ key-volume-up {
 		};
 	};
 
-	/* Dummy regulator until PM6150L has LCDB VSP/VSN support */
-	lcdb_dummy: regulator-lcdb-dummy {
-		compatible = "regulator-fixed";
-		regulator-name = "lcdb_dummy";
-		regulator-min-microvolt = <5500000>;
-		regulator-max-microvolt = <5500000>;
-	};
-
 	reserved-memory {
 		/*
 		 * The rmtfs memory region in downstream is 'dynamically allocated'
@@ -784,8 +776,8 @@ panel@0 {
 		reset-gpios = <&pm6150l_gpios 9 GPIO_ACTIVE_LOW>;
 
 		vdd1-supply = <&vreg_l1e>;
-		vsn-supply = <&lcdb_dummy>;
-		vsp-supply = <&lcdb_dummy>;
+		vsn-supply = <&pm6150l_lcdb_ncp>;
+		vsp-supply = <&pm6150l_lcdb_ldo>;
 
 		port {
 			panel_in: endpoint {
@@ -925,6 +917,20 @@ pm6150l_adc_default: adc-default-state {
 	};
 };
 
+&pm6150l_lcdb {
+	status = "okay";
+};
+
+&pm6150l_lcdb_ldo {
+	regulator-min-microvolt = <5500000>;
+	regulator-max-microvolt = <5500000>;
+};
+
+&pm6150l_lcdb_ncp {
+	regulator-min-microvolt = <5500000>;
+	regulator-max-microvolt = <5500000>;
+};
+
 &pm6150l_wled {
 	qcom,switching-freq = <800>;
 	qcom,current-limit-microamp = <20000>;

-- 
2.56.1

