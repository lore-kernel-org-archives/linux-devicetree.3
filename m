Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794807308;
	b=42lV9y9nw8/DGT5hTjI7HuiLbcGRBYjqFjlQzfaY8NRW5IX3DkzE5wVuIVddCRwpvNQF
	 TkxlUBcdAByeegpJKexZNpFTiKPaBgQgCBdulnvviix5de2HIP9z7ICeZsJxeRkeWpTt0
	 NV7nmasQM1xmly+AjsLEE2ObNDsAwzZQxAWbVtxC24jNWO7qVCiPHl9zov6vGzKLTB4SL
	 c35QKBm26Q3ydh1JJMDgxCf0KvWZ6RiiAVD8A2tixmKeFFyTnzCscFz/sBMijaR1RbW0o
	 Tm59MsdlSaBUUvFB86fiPixcdZ3C5KyfRRsSRHqcDpfmUnNy+HTxHq/HrA0daV20Znw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794807308;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=S0rPbDJDlkerZ4MNM0EC/3GcwzUG+YsiEl+gjmvqeKs=;
	b=hUCA9PQ+jX7AX/t9BPsT0/UB5YgAc/j3LIOa+V7ALzCiPPWvRE+tJDyG6claYoelAuk7
	 HiGur0jnV4VwSEB0ub/sdUYqc68cWWPnhXSyFbW7oV/CVAI0LbRm6hWYgWofizwhVMa2s
	 qg9lFCftGwu8rYL3uNZa9/63H9BzyreaH9s1c+uPtciR109uv4oHLjdj1Su2b0Mm3IpjD
	 jZcvTofW2/V4mJKk7v/TQ3e2RS/rSWseacKEYmB/iqKGNMnl4SHv3pvwBJn64X2EEgHwR
	 yDNfXWvb11bf3Dx17fkJKW+r5N7xGUKtk57BNpDE/RKwFT69oXsUYVk9xdVdVhndkMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gtmcJfzq;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D794E606A32A
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 05:35:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D794E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gtmcJfzq
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-170135e43c7so4836069c88.0
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 21:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794807307; x=1795412107; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S0rPbDJDlkerZ4MNM0EC/3GcwzUG+YsiEl+gjmvqeKs=;
        b=gtmcJfzqFlYh9d0VyRYPkwL85gT8VgY6z67ijGu0jwBTfoh7XzAVMXNXtbceVD7vBK
         f/LFyzuhqMPw4pUswhDVWBTqw5YAktZY95axELCGP4ZJfLye3mbWg5PqX14PvIfPXvFD
         jifUYkREMx9ZUNpGakCHIaadFE3zXgmzrZ7cbIY8OJpF2ivHHcKk9xQ0YV24MUePsMW3
         T/PAG/AnY0bCp/qwlfZoGiCYv0exUXKlbnNLJpEhnGniPB+aIcHv9/sVgWo/4jL26N2Q
         sr4YXYbzvWguag/oMlcsj1W3t89G3muDcdGN9bywCRTIqdRkp7RJUsRbNEOtlHmxO7l2
         3mTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794807307; x=1795412107;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S0rPbDJDlkerZ4MNM0EC/3GcwzUG+YsiEl+gjmvqeKs=;
        b=naUhKKBgQvb5nziIsqs3rKQFF+LJVnFvhBVY7SEkapXp7p+6blGaDxQ21Ylgc53opT
         KxtJ+Yna0UzlEuOWOqlnbsiMIhnkRDt5aVTcUoiWwLAvoUH4+McPE3eUPmgN98TGzqku
         3N6z5XeJb6UEAx2YiLgXUXBFdlldpNSh2q1Fys/lTksqUiYdwjGKGnud82WYJCVxGYzg
         pDb7aieEgbm4dtmuroKYUVHkNMZJJKQER+H4Y6Dm0PMrS1XjmIXaKU4UdjJi9VDBcyc7
         I7719SmM1l494Vj6+puxDsruLsHAxzlbRkJG/r/5uy/QjyCxOKDSOUKv65p3cDcWVw6i
         e70A==
X-Forwarded-Encrypted: i=1; AL+hErGIJP6AJxSziIaOzpRwFMgSooFaRW5rL/DVe8JPK+cktkeZv1GtO/LFttJqmHyGUC+LxT2ZTrgJz0oA@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ezl57lNM5ytwBSQvVCdtN671+81NbX+SI20vbk/7RTbUFtFyc
	5IvysWh7Brq35jqcHUcTFVtfnuLuy73Tufz8enAiLVMocLXgD87meg1P
X-Gm-Gg: AYBFou1dSNmRxMduoIXyC9xPjyU+fAtVgQ16J0m3uH0ls0QKfwQlF9FR7loeiTKmnqn
	z/Z2v0p+Zfg5jwcFVbSds1vJZ1M4IWg6J+ntpbz3VGxG3TBmIAGzIu1L1r/1sRgRKqkYdKCZwmA
	AX0rBrNyxWawjhAszovdlD68rpQWJHS+YFOh6w9J40KrYu2sv07IlEbQY+XTtsDPDMpnZRVYhJm
	6wDjD0zjbN/b+726JCeghveka87BhyggHBCRDL5lyx73PU+uEuS05osNdF58lMlpj1oEwHE5ysW
	2LRCyKYrZpYQBMzQAbP7g0byZGUiY2p3HeXB5T3aLISz82CR0PSdzo/P3Qv5namefCecp8RDAQy
	tpdYRRYI1NFbjFVMdedJfygyu2XqZf1lQxx3VT6KEXz1mYPHB+6rH7k8nxIV5Y3sLJMN58YkhUF
	ab9W8NW6r5fLcBAsPC0/KX58en5xwEf5K2zmzdEh2vHI5W3mV+rqxG55rHX46MCO8E+UgrJSlwS
	+RpBiKBBYTWxBBEUbcKKY+siE7/d+pRbwxqn4b2Oe5qe/3v641TBi8S6UjXBt0LVHSKhXgfAsbx
	d/RIkqlXhYc1E91NN3dXcddVUJKhDMoMqMsbAMszVjUSuGUzRkmrgcQQkjldGiDhtJA5gL1k6kN
	ugubH
X-Received: by 2002:a05:701a:cccc:20b0:1b5:32d7:7d73 with SMTP id a92af1059eb24-1b532d780bbmr1029121c88.30.1794807306985;
        Sun, 15 Nov 2026 21:35:06 -0800 (PST)
Received: from Sobhana.localdomain ([157.51.206.8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm33463380c88.5.2026.11.15.21.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 21:35:06 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Mon, 16 Nov 2026 05:33:51 +0000
Subject: [PATCH v15 7/8] dt-bindings: cpufreq: qcom-hw: Document SM7250
 cpufreq hardware
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
Message-Id: <20261116-sm7250-v15-7-6acbb232fef8@gmail.com>
References: <20261116-sm7250-v15-0-6acbb232fef8@gmail.com>
In-Reply-To: <20261116-sm7250-v15-0-6acbb232fef8@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Sreeshankar K <sreeshankar0910@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794807229; l=1157;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=tYOW7ZwAVWXKL25nNQ4vkjon/atY4Dhfdawj8MhM0Nc=;
 b=hoggoWb5jYIyIe6oCAJ+uw0gr7l4FQRLq2gxxhWWrRSTin9c8YLMUPS0qAHLKvjnJhZnO3guj
 zwZPzqxzYjzAoNywaOEbGWxmFGqS3ST3v5/P7mGL67kEI0MsM+mhyK6
X-Developer-Key: i=sreeshankar0910@gmail.com; a=ed25519;
 pk=CGSHduvtn2hwLCNRXRc9s/fh6X8PH/zNdp08zC8hOuQ=

Document the cpufreq hardware on the SM7250 SoC.

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
index 98eb36bff..f8cdb652f 100644
--- a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
+++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
@@ -29,6 +29,7 @@ properties:
               - qcom,sdm845-cpufreq-hw
               - qcom,sm6115-cpufreq-hw
               - qcom,sm6350-cpufreq-hw
+              - qcom,sm7250-cpufreq-hw
               - qcom,sm8150-cpufreq-hw
           - const: qcom,cpufreq-hw
 
@@ -201,6 +202,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,sm7250-cpufreq-hw
               - qcom,sm8150-cpufreq-hw
     then:
       properties:

-- 
2.43.0

