Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793778411;
	b=NZJMOxQIZT2SIUYdqRHvpeL/+pWWnHiPShZ3uDCoYEXkEW0S0li2s4b2SY0gVOr20/UT
	 9/k74R0fBA5CvlNbEgVDRle6YQcznNsEUM0pu8pQTprkNyrHBaLip8yMWWMebNftRabzz
	 75yDuH5x6auaDOPws5E1UOqpVRbfKtvdKn29wPA1MMul+SUhx2zqAsslSsDdamtq4WfKs
	 8K+Og3T8mwMO0q9p0Iq8a3ba8wqF8S9dJJii0PyVgzrPLyBeI/0RAutD9oSwHw6WJTnIC
	 im4v0IjuVE/ni8Q02fqfZvgv7GMcYrpxQoeBqizH1HDRtmDSZ5qBEgqEyU07pux7sLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793778411;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=U4fFdtJNvcZ6y6D1x1v24LO+4CMQIoUBaMtD1ZPuCLk=;
	b=ZIYhZ0toGpPscAdZR4YeChA/igXeK9yy/iuaDPPCX5tILvoY+PihF4NGd0uxBQP1ZhJl
	 50dP+Tc7RXVFZZBOIDLr5erv/iBKIN42GKcFDqrrdljYiXewm+VHX5Bfx5Ts+J4TBr699
	 awAbmx90hSNNyoFSAIc1TghAaE8oGdqu2fBG55iRWu2aHs+eQHXsymH+JFKH3FRKHC1qq
	 i4/xolUVJIKOcGLaZ5XoBZd1BmgUf39zo24bgE61Tb8xF01ERfCby1D+a5PwloBFfLQQf
	 QtxlIdhDvQt9EfUCX3RtPU+gpU6aFKddmBj1mKKY1zsLxrsW2Ib3P4LXyPqdaHjM3kQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sV3ynZL2;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF24606A33A
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 07:46:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DF24606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sV3ynZL2
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-35c76e9614aso489028eec.0
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 23:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793778409; x=1794383209; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U4fFdtJNvcZ6y6D1x1v24LO+4CMQIoUBaMtD1ZPuCLk=;
        b=sV3ynZL2djp/uSfXZHC9ADdJ2Xf7y9fXRV3nczxd92MjSP4LgMOOaBP1T9LpwyvOfe
         Znql1e8wAVB0kHXK+wF94w0TqsBJFhULKM90WcGi1ELan/WbL1I8lKhy8sYBVJ+/7Tfi
         W5s7n/F0aBc1icuzGa8GlwKmTIHx8dLKxVmxUCK9eOpP+RFggQsiTgp3pl3z56AWI/6R
         JzpB541XSbN7HUQKzg/FJlevLki2JSj3BLb+sKG/cXdpN43Kxcp2W2EJAmG67WJKyq2G
         hjQPVIsExLqUJmZjlpbdp/nF4Vttuwc6RFL3s01X3cJ+IGFXTMrWZZGkYYrflGWLT0Vn
         y7tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793778409; x=1794383209;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U4fFdtJNvcZ6y6D1x1v24LO+4CMQIoUBaMtD1ZPuCLk=;
        b=RRFMOtXnO/Ltk1Q0n6yOBarPqWRe1n+CgegT2R1UMfPsI4cFbvSyUcSlvPZBxkqTF4
         gESD1iJWXgietWVPrekOVMTzHZoZh7WTJjnOrxKurBKsW3VOz422/WSh9VbS5tz0aPjW
         g4rzifzmaouod4/MhoHWFxUvt7ksX550x7hZSeofQjhTKBmc6AtFsId2h5RE73+QrWdt
         CVp3xUPxrUvfZb+W/9TKsBtmiP3Syc0UbN6jbZnbe5LuNIxr8BJ9xiXT+tYjKt39X11+
         4+t8Kj/tmDitSDkPAFzWTwiR2AiNmLLnl/l7IpRGgnoSWMfXC7CWZkg4+lyoPPApSYJb
         U2BQ==
X-Forwarded-Encrypted: i=1; AKwUvBwYO1pSbsHbIQRO+byAchMf6oXQ/zAls5TdkGBD3EZfYPmQknQzSgNQx8y2dxTOyylp6a0xZtl7wCfN@vger.kernel.org
X-Gm-Message-State: APuU4Z8+F7jtqrWvBrbWIPbh1qwcXr+itx5/N52QmCntPQBptVMhnRsA
	YSj9tmUoKtysDzvzFe0u/ij2ohgLh1imvqRvlVS6+W9W5HO+x2ksGbE/
X-Gm-Gg: AYBFou2zfeuGCihUaY9rrwquXFwpqvAt/aevTOzxZxDMkBHUdr81ky8q50QFOjdtbOg
	8WlN+r4OLr7Frablz9hmjB9SRUKfZDlkpjEfdRAx24kBHYhp1c0NNqyvxACIovhJtHXgip8DsCh
	ucaB00olCt7gBfQHB7+0CQKXVZQUVhJp/bFFR6yjJrv75Cj5LvKttDRDttZoDKgovXKKhKpf7f3
	8EmoK+wIcTI/TmT6xax+AURWDK8clGIoffJbQu9/BMdzt7geloQsUtvyrfv1QCjr58Cl3RAPrAG
	iVoSaGXO3Mc959CP7Jq58tkN7kTQ893jjfVe2bLPooC6zMrOrZnIFlfEt0vwn8oIO29Jc3oczuF
	13j88O6lHX3z5QeupNypJie1L8Cs3QIcpB+Jn7/n1kJnbdpc3a6O2Sf+saibycMw9tVAJCaLOWj
	F1aWvcyh4bYfXE8jvCiXGpwoPkEBVw1pIuMYDcWdZaKHBdcXMKus2/WqyBN07nnfb0aFqTNVCXB
	yTO/vyovS4QMFImpdusWU8ryaLmUiqvH0WDxMvQayWHXGPSQVWQQi8T17VcJ4gs7AXMCpe968KC
	2Z96k137oFTV+To64hCyDAgB8Ps9INsAIc1Zxb9iojaH//9i8dhYJEXJ4VjDvx0L6EAyEVxfWps
	DXapWDg==
X-Received: by 2002:a05:693c:42d9:b0:369:f18f:3492 with SMTP id 5a478bee46e88-36a423fbc3amr23892888eec.35.1793778409284;
        Tue, 03 Nov 2026 23:46:49 -0800 (PST)
Received: from Sobhana.localdomain ([157.51.204.42])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a67edsm4566016eec.8.2026.11.03.23.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 23:46:48 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Wed, 04 Nov 2026 07:46:06 +0000
Subject: [PATCH v12 3/6] dt-bindings: firmware: qcom,scm: Document SM7250
 SCM
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
Message-Id: <20261104-master-v12-3-57fbe9eef978@gmail.com>
References: <20261104-master-v12-0-57fbe9eef978@gmail.com>
In-Reply-To: <20261104-master-v12-0-57fbe9eef978@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, 
 Thara Gopinath <thara.gopinath@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Sreeshankar K <sreeshankar0910@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793778372; l=838;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=n/5l0LzNHQkrbMmziTZYOIF2FEcc8PMKPnj4oscjta0=;
 b=He+lmNaewUvT9cE0bl4y22+ugSs3dJvjKw92KlKpQtRY9AvK5BMkrVzkdj8zXEZl8fG8GPtLL
 uKhSpXXDFh5DROYlAe28kXAKP55HN9uHwz3XLOcdD+pVNlTNmMJWUri
X-Developer-Key: i=sreeshankar0910@gmail.com; a=ed25519;
 pk=CGSHduvtn2hwLCNRXRc9s/fh6X8PH/zNdp08zC8hOuQ=

Document the SCM compatible for Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 40a267c54..ee02a9c20 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -76,6 +76,7 @@ properties:
           - qcom,scm-sm6350
           - qcom,scm-sm6375
           - qcom,scm-sm7150
+          - qcom,scm-sm7250
           - qcom,scm-sm8150
           - qcom,scm-sm8250
           - qcom,scm-sm8350

-- 
2.43.0

