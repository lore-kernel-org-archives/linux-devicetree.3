Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793257440;
	b=TMYJexdqNVx1pOryelKXGSiQITuyBQfquOaVKv0ccG3nVUCPhYHQjk1LpIZ5OVS6Exre
	 DfGdrcKtPQEQ/xzZOChSBVhuH4DAfVgF1oorWtedzsElGSblYHh5sHB41S/qq9BkaN1vK
	 mrnXMX6+FtbyPYs+VWzWMudEsrCQI8SNN0u5NgskfJZx+ffs/jihaFZm61fphR/UG0olt
	 K2WRPnYMelseduS/6vOwWsHn1TlK/YgBqQ0w7pXf3j7zAUSqkR0UxpISuk3iQUfZvHDy9
	 6K/KKnD8sn29M37UibjZhjhkVInu4BnhtXoOSe5MrAH/VZyYvkkIPJ6Zzi9sh21wNAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793257440;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=uLXUgShYuzqF4ZAuBg6KTg6ZZ2I9Cs8fD8/hYe2JXyc=;
	b=OXE155JCmmkkqwyencGVhiAPqNSAoM+mHIguV/eDzII9VcsZaJUKLGcHAHBOAlcHzWra
	 4wkm9g5IkXLeQKMUzvykcpXfbgCxp8kHXElSR7ID5eM8IAx5h6YDdLdXW2wfqlpzm1BRw
	 QYbOpQ4qOW+gHd0J+2MeviC8mR8jsIQIziogKa/67szLhBhpH8fWhEKx5KsQJsOBaK58C
	 yuTXJpgz9bzuRu6G90FivhwTsesBmnuyKHe0zPae8fnBhE0Q7Tay/SmSJh2lBBu2XA3r5
	 6QficdJL00GPXZHSMEznEx4r0hZayhKE0FosZqcPERI/2HSRlZ+jBttRrYVgOGqARmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RwNoZ4Cj;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C15606A322
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 07:03:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5C15606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RwNoZ4Cj
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-15dd124bbe7so3335558c88.1
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 00:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793257439; x=1793862239; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uLXUgShYuzqF4ZAuBg6KTg6ZZ2I9Cs8fD8/hYe2JXyc=;
        b=RwNoZ4CjRuYkg/jasy/Mjn6HOQL5A9DiWfE94RbDJRoMBIXOa8tue5p1UA1PCBjNZg
         9pTEnZ1J8+Nap8yqIUe2E018rdqcdBP2Z2l6pgc5BghO3yb7IRMemJfa5nC1ZKO7Ags3
         QnSoYq79LIDVDMnxJgW2vBfTNhvDlc07kKp87hfd0su92VhjpCSkqJo1wAaSSF6LCT6e
         7Wo5UFuWTCyP8d082kzIEGc2gIYbeBi+Jy/kvyB5Vojav+W3TvejUZ11XSWmbTEdypki
         YgC/ofrBRKlR0nPcrpLSscwvR5e7KdPY4zccsdGIh9U4+KLaTWfC69e4L7gajvFk5Di+
         Xw6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793257439; x=1793862239;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uLXUgShYuzqF4ZAuBg6KTg6ZZ2I9Cs8fD8/hYe2JXyc=;
        b=OpeYcM4s+Ito8P2EsOS8/zOby78kvVBIksLQ3c0Hz29agnJwSt7zD8sam5uoSDMq6J
         JVJDubVnEGYNr4JwE2MJq4m4H78b+pP6FAPuuBqfWJVKrGXmU1zA5s/82ljHLvfvwV6o
         WkoMYzFlVCpkb+G3bZMusdspE6KmPkacFd+OQMaHfiChCf8W8j3xpUg7WwcYg3ljS8mf
         A9fXVPPfgurXYMuGmLNtuw3I+Hf4xC8xKgPXyIVq6srvGYvdzX8MttzY9QIzPCLUXAex
         bqBvAI+Fl+89S9Lnk0KJuzOt/hxIXeLyGTKBjpdF7mvpEQWjohg6z9EughElQvNWR4+2
         TJHQ==
X-Forwarded-Encrypted: i=1; AKwUvBylWjWMCWcnNtbMRazkkYJ+QnA8elsAmODZcG+9sXnTGgdaJz1WiErQk87MVcTDu36B53muorw78F2y@vger.kernel.org
X-Gm-Message-State: AFq9FYK7ZH2R+Kyk1KOqtOFXsJTLkRkQ4lbOcI7Wusv1sDHvPNi27Q0E
	XxcaR3mjajj4FaJv1pLb91qTZVxe4xtHq7nzK5FTzsOaZGR2EH56FGAK
X-Gm-Gg: AYBFou2niS7HVBbln4JL9gRvaGl/Y7N2W8wdoHulM7Rd0hY9DRKrJ2loqjKYY3qKxeb
	5l3Fcf5+J9DWqjnl/VvHBRrbG+2/Z23SEBC77NbqHRUwbkT/FqWVLGiAd4nTaMwk5IvHfDjLhNA
	6TXdqP+qFsaMOXTZNFZMfHYK1BMWWUIwSBytcBF7JcwlMFKyveCOtgd6gPc2Dgos5FQW9VMWjHv
	RsBCyuJ4khARP6Hl0SXOkUWROcf2HBf0CDubF9RRNSpHFiDQANvmQ1b3nR98xSelFyzEUusJxXW
	KYg5piNnZwHVWCUoUQsgZU/KvBAp/UPDwQeYiLYipqJCB+oQ6i3OChFR8dhBzPSAwPZcAswawa0
	/xbTrCmCZEF2TOZu2gPOqc1Ygo8J1bo6Wj0/EBUHo561uRDB93SmYVimFeGGrnWna83GwkfPImQ
	gEiMUDW+gTRGE4sWQwuEqQasI63FzKqt80WJ+O4qNThboQFrC1s7FXS+BWrJfr/aA0I5fvlD7Or
	oQmxcT1yQbyTjefIUAHhUgUzDkMI3QBfRq9+PD7y/VAG4bPT3v9DIePt+/BGOt+wTIMvjfaS27u
	6QNKmFuQeJmHrVgK7oReGwCmaO9k8cSSr5pfOWpEN5Uv9RQ3uZ2hxChOUS03IQ2xIuQ+IiBabp+
	AidY9t+qe3zbKGLrrT0yoJlhQk4gwvQ==
X-Received: by 2002:a05:7300:cb0b:b0:351:4866:255c with SMTP id 5a478bee46e88-36a204a1735mr8418969eec.32.1793257438736;
        Thu, 29 Oct 2026 00:03:58 -0700 (PDT)
Received: from Sobhana.localdomain ([152.58.200.233])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a2398fa4csm16955443eec.24.2026.10.29.00.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 00:03:58 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Thu, 29 Oct 2026 07:03:01 +0000
Subject: [PATCH RESEND v11 4/5] dt-bindings: cpufreq: qcom-hw: Document
 SM7250 cpufreq hardware
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
Message-Id: <20261029-master-v11-4-2c29e382162c@gmail.com>
References: <20261029-master-v11-0-2c29e382162c@gmail.com>
In-Reply-To: <20261029-master-v11-0-2c29e382162c@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Danila Tikhonov <danila@mainlining.org>, 
 David Wronek <davidwronek@gmail.com>, Abel Vesa <abelvesa@kernel.org>, 
 Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Sreeshankar K <sreeshankar0910@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793257394; l=949;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=x7hZEQOYoMz/dmWpmgNA+PhWEJ3zQC81cV4z3jRraIo=;
 b=ufsKTZU+b0OXPb0mc4gZE8Nc3udFJHAZgWNoVr7Lb6gGfhe/dXr+syALCRixe/7+HHnMIsdz9
 7leJLrSZMDvATc+wj7zQErP26XHUzfF49khI1iWjHMj/aRS0k8/yGm4
X-Developer-Key: i=sreeshankar0910@gmail.com; a=ed25519;
 pk=CGSHduvtn2hwLCNRXRc9s/fh6X8PH/zNdp08zC8hOuQ=

Document the cpufreq hardware on the SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
index 98eb36bff..2dc2c265c 100644
--- a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
+++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
@@ -29,6 +29,7 @@ properties:
               - qcom,sdm845-cpufreq-hw
               - qcom,sm6115-cpufreq-hw
               - qcom,sm6350-cpufreq-hw
+              - qcom,sm7250-cpufreq-hw
               - qcom,sm8150-cpufreq-hw
           - const: qcom,cpufreq-hw
 

-- 
2.43.0

