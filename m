Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864406;
	b=EL6t06v0vW6fsH2LEFFWPCXZX2VlxqNNXds+bgMRtmTpaSIMEE6CJ8B4hROUvnlpfG/a
	 T26JaeSGmQH4oNg2cptThsCED5jeLRah4H+LPQnOZZeG6ulVIVXsThYURtx1rlOxx09Hw
	 pUxv35GJLBj/bB3CaeWmSdFfciMlaGUyXdfYGM7RVfGK3h2r76VM2+sQ+SgFkVbvI7D4V
	 S8Hpkp/MTSJkLbQfkj8o2xg9sGPP0KYtKStPavkBQJt4iCNitmWlxb9FsWiK+GQYdUa6E
	 I0C2Uq91Kh2TKrWI5LgCNg6d0NQJUBBlIY6Kv5jGo/AGZD4a2OvYW4I4ddFyNlVoDdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864406;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=dpKnhnsaRxCp3BhNS6dMqX7R85atmEMYETrpv/6MbAE=;
	b=K3ZHM8wyHnO69soiHdkdmDxTZp/gYffqM/ZsVA9Pm/hOqR1YPTG1vyynqfixQjdpLJZv
	 PJnQPgTRLJi4dUBl+s6fwTnlFPNjjamBKVoQOP/S9U+CXpky/VS9dDZKaauP4JoTUa3nM
	 mkMwZjYShBIWjOdLWb+uOBJtJWQChP4TakWkzpA4ecLzdOiYumSvpVz+aHN1VO6D8h3m/
	 HrTyMjh45nYUMGXw+2GNopx/DJbWQCQSbTpnYqvz0CTmoloWq0A3YKE+7XymaNclerq+c
	 S5F2i8u8ZcRY1RNLP6mBo6wDZ7FCHcK2rclE9YuCYJGiJ+uO7ZOcfgin84nQBUJraDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I8xDJoNf;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22F2606A332
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 21:26:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E22F2606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I8xDJoNf
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49d05d51553so22760965e9.2
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 13:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864404; x=1795469204; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dpKnhnsaRxCp3BhNS6dMqX7R85atmEMYETrpv/6MbAE=;
        b=I8xDJoNfZaRem9zplTnlWWkiwNtJLWG+95Fkcj3/f/c0VDhRKNKMbw9CXBZAkIBDQu
         KDi7/92PC3BzuvcqK70i6KVaw5/vQRoUZV88eKUrBui/wN6PXFES7rCc1jTGUFM2zsx0
         Ym/aViCUG/uj7Th3xExXkYUMx4rwKh1Gt8dwbBMciok2YHaViaONWVDgji4ZkirXtbkF
         r7M5mJAf0zQmkErxe4iAIG+Y5CG2v0otB+0lyKfhR9hiBplgFEKH6QXgv33zgqv91kCN
         1ltycZwiQftZ4czJXOw725iSoIdwqdftqpGJ4iR8nG1Yk1waUYBsFZ6LFBD0taF0zsRF
         iJJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864404; x=1795469204;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dpKnhnsaRxCp3BhNS6dMqX7R85atmEMYETrpv/6MbAE=;
        b=mUhOaKf+VFFK4LHN6UsmJhj0jzfQZJc/9tjYSL/1tw4ilnPBh5GCfzySk2a9u1Ivr4
         FW5cMnNItQCy7ZATVfoUYISjoWNdhf/7cxm5jFViL1ouY6YecjclDN2J2OpCOCpIqCI2
         RRtOSMSCmEoZlvplpYJGVJsojuh9B/Ejg9/morJUOY0dWXdF8+zfm/aq9p+4HiuuWlwI
         N4fhFbwywXZjHoRsXnwpQenRTUF45RFTGiqgkxyX56S8XW0QeVblyKtBYMYr2UOnWP/i
         CmhV03uZizmPsfVksP+mHavycaarVgQjiCsamJm0J6VrbMVxSKXY1AxpwInihDvFmH/1
         rPRg==
X-Forwarded-Encrypted: i=1; AL+hErEumsAfA8lKZZhrIR0fZ6OMcgLrgUHL6/EvuJKRODkjTrWPvqWcEdCs8D2X/G7LNu5Wk0UuFq5M/LSX@vger.kernel.org
X-Gm-Message-State: APuU4Z/n3u3XzNDgWtbk6lJBvz0zUHc7RuwHY6M7pCd3sPK1cfapDKap
	AjjxbNDr6RngZTwJrq/9UuDV9Y/cRiyUeiEeTo3iR6N9ojnQaXjR4pyU
X-Gm-Gg: AYBFou1sp2nP4pqhFAMqCf0Lg+LYrndZf/KC1KeYEn7HwPOefzz4W6+O8ts5QhTu0i5
	23Bb9XPLEkxcYWVURYUvlGarDFsNJAUQ/EGLelXirB6u/G5t7KUUQ6j6PTJVpGMR0zCZ0VZcLH0
	VWI1MQ+TLl2GDbRRoXEIUTFPd5KSClFwPKeP6pnamq4b03tiejGA0Y5oTeBN1jimBG+N2Ejl8tO
	wfnBw1E0/DM5vTNidBSFP9y86IJp/s6lYODJsh9OzVizdtdjPI6f9jmrBtC2pGUE1rPO1p8645A
	ClGlVHGkXENnTVXOQ1kPYDr4amsNLjxtjbj92yGtVmwRfxZmqhgrqf3YmhRfcvPBZ55F63wkHxX
	IcXzCMtPpiZkzFRxaG+GJYb1ri3C7pYxhluALyK5cx79Hc31og7GpWn8zLZoDQtEKX1D3wWhm7J
	Gs6omEcDyz0E+m9k1rEfHExsEpvOrrj3hXqYPaLtUE7fz6w5N3FxjQBkxmhtvIvgInFFgWeQ/2F
	qPsIlQcCr2DHyXURGJniH15ofsoK4u5Ts+v9FH49NHaEbANf8E5L8ZidlqjqogTbOK6CqpO2lDE
	6OVhdLt0YxWnOh6QiSY4dYr+8gGBpb3YWC5/i+Ho
X-Received: by 2002:a05:600c:6994:b0:4bb:647d:dabe with SMTP id 5b1f17b1804b1-4bb647ddc1bmr178719475e9.3.1794864404416;
        Mon, 16 Nov 2026 13:26:44 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a378138cfdsm1260150f8f.58.2026.11.16.13.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:26:43 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:26:18 +0000
Subject: [PATCH v2 02/16] dt-bindings: power: qcom,rpmpd: document the
 Halliday RPMh Power Domains
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
Message-Id: <20261116-halliday-dts-v2-2-2c92438c6c46@gmail.com>
References: <20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com>
In-Reply-To: <20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Lee Jones <lee@kernel.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wesley Cheng <wesley.cheng@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
 Bean Huo <beanhuo@micron.com>, Stanley Jhu <stanleyjhu@google.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Georgi Djakov <djakov@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-pm@vger.kernel.org, Stanislav Aleksandrov <lightofmysoul@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864382; l=1076;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=2tteAd38AfHrvk8Awl3RAniXNSdGBzL0LwEwE8e7LoI=;
 b=zXzEFbpmrw7cpK4pILHkAa2JAONx4e/NBSRGU4M7PF0mG2S7il3dQ8oQ1GaRjzlC45Rh8Rzj2
 +R95I7vK6fnC+0EXJojPOiNt/4zRdqb4EXf75+xmDMH2zxxqkWubFgC
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the RPMh Power Domains on the Qualcomm Halliday SoC
(SXR2250P). Its command DB has the same power domains as SM8450
(CX, EBI, GFX, LCX, LMX, MMCX, MSS, MX and MXC), so use
qcom,sm8450-rpmhpd as the fallback compatible.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 8ee1c25a7c9d..663baae9cc64 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -82,6 +82,10 @@ properties:
           - enum:
               - qcom,maili-rpmhpd
           - const: qcom,hawi-rpmhpd
+      - items:
+          - enum:
+              - qcom,halliday-rpmhpd
+          - const: qcom,sm8450-rpmhpd
 
   '#power-domain-cells':
     const: 1

-- 
2.55.0

