Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793778429;
	b=z6AsneHRi9kjVOOSL5nkcqYNdbRtA44ugDPIzoSJvb2RyoAZBLgZNSSwjXjRLUKN6W5M
	 0nuwVn1+2t3Xv0cRB/sLkpLGOcBb0DrawKeZ2k1is3e/vWMWzXdOKUy/WMcHK9StDK20q
	 ssNY286rCumOaa9pbJcD/B978w0yCE3eBrrUjV/fwwdDejL48qdAAWIoRN6538Sy6Wyef
	 4kY72gXW05H1yLjcnGiysm810PrmT8wvFZTcTRjgn22GanNXY3ZQPqxudCMJEJkt6Bipm
	 uy2y7y9QZKzfYYqBvC5E5Sl3jKaIkNJbiiK1k6C3EljXFiyuEaoRxsjhotdTF6ZuHfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793778429;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=J6yu/WA+9/TduvIgw8i/6/eU7fXdqXxpE3Xb+fSN5P8=;
	b=4TNCCJ0y0/ZAn/BsB5C676PTQGhfcuEZayRGUBvciY5EZQg7vviQWd5xFqzmQjS7moTX
	 uH/rL2m/WtckBVrh3bPFmZ2QPo9CBaqWquWBhWbwg5ApE5+zGWGLriuWuZSTbyU8cDiKR
	 Ct5b+2+l1YjUNploFSZokYFWLS7o7G6M+iAD0AZqY2k5wnRpLID8MC3vmsm9l/aI3tk8x
	 j4CTnyosIjm+bNOWPT0q8z/Dh3nwZjmyT2q5B0QZ/WbsgEMGXEYKaqULvgPQUlFLbznFC
	 i/yExlFajbVweURGXX57vZPT+XdtNY2+7tW+qJH8/ciSmKr4UNYQCBTKtspfveRbI2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sl8t+O+K;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9800606A32F
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 07:47:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9800606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sl8t+O+K
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-35b2c599f43so801185eec.0
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 23:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793778428; x=1794383228; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J6yu/WA+9/TduvIgw8i/6/eU7fXdqXxpE3Xb+fSN5P8=;
        b=sl8t+O+KsQyQ5DSrejOdiSjykamgCVW3ly1JTuZRkT2dhUs4GoP9/ThyCQGBq/XCCp
         U98webc/Ysmoh7c9MJY3B5oI0yPCgntB/GcL9AXhTlIWSK5dygUBPvtaa++R2IgqaOwc
         zncsdYfkB9nhgfUkuqV4dxLndUwnHg2X9ZS7Nm3H8HIkAU5e6QZUSZrWfK/IGGrwpORd
         vlEbLyuIsO+aHaGtUKKT0QXkAnEyY83eAafBQ/gK7LcQOXlhYuE1e/IaBdGbUobFbizJ
         gKELP86j/916+BNlfrgufWSt7aL+7ggPX5PPBcSFgpyaQEhlHk4mx2oV67aPqyfjc7sm
         /gYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793778428; x=1794383228;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J6yu/WA+9/TduvIgw8i/6/eU7fXdqXxpE3Xb+fSN5P8=;
        b=GeNPxKl4cFUURyQPtWyHL4Thc3lCf8WFVti+Jeeb6HeTNC+bt1Bl4a24fqHiPsdVS3
         LPBpuv+Kfvt98hsfK7QRoAG0Y6Mx6gPEsPkoGTIx1uWbSvE7y2itzC8slajrSjmEkWEj
         1RcNyjyv0HeuIObfNsVMePD6FERJA6niT9ZlWMFCjNxN4JU1hhpkBXE+eV9qm2OYSL+Q
         qz8UASI7FyM8aKy73xjqEoJ1Z80fNAB60BE2WFX5ejbt5JH+bMELNlThN2cWIEfJQy50
         MUP3CYOIE2etfGl7iOQxQ7Xh7wwi5CVpbJRPyADrZADk+JY6lx4v9fcYt44whtrZYE5Y
         fl4A==
X-Forwarded-Encrypted: i=1; AKwUvBx98PUdS6gg4839ft3Awwn0YpNa06wFRP0C3C2j30wO6xDIGaiVcUhgHchRz2+6oymCc1MXjhy0LpVM@vger.kernel.org
X-Gm-Message-State: APuU4Z9/oPIIiuezj0BsnB9Ct8Qy8d1wXlFCrqGDWBrhuvL4jNcEzXvH
	jK4Jsb3nK4ncsZfRIfKjy9KNIm3vGmHH/hSYy6CrKIAtqF+McH06CSDA
X-Gm-Gg: AYBFou3+DcKAC5QwzPA1J43OD8VQ2ATSVm3HGv9Z2YSKyb8JuGCV+D8O6UFuHmlLGQ9
	ViijZKcnF5TLZI4Pwm4cwjHUyRGxZy1mHJS6pCHhMeYPD5fxc3q9bznv+6CmG0YqeB0LqxbUxpf
	Xe+9NHQslB0Fy8i46NGRLGZV4YhwGUrjBK5a4ld7kspGPMG6phoVanXmnafjlYhlBzlc5nHdJAs
	uOhTwV0+2FxNBjqIgcN5c7CM7uR2od1p6S4cSjsDp2Pa9Ssedq2ZrWJS5GQ6c95shJsl5q4wG2P
	gYnA5jz6VJ+mfUN7N2kyMlz2AEdLwon47WygMlbc+2hIXfuW3YFuHW6zzavfKOc/gSRRFZvbvml
	beqpb9ssbaEZ+7rPeQ9Wy+QDPthH1PrvS/fNN2Gse/j3EJXhEdz8H43H3g4XIe+RFErregMqHp9
	aAEdVcjpQcEoapHp5jwODgppmYvBnCkLpafgAwtglTenpb1VhXQULhvd9msnOZ/ssfPXAp/kq0p
	aPySV7OAdccUZigJb70JIBAHjm3WV6+OeZXOzU+8Qzwtkq0bv/GwotdSaJZlRQj5TjNdKDajeZn
	oqoszGq8d3lYlMHuniq8d9KJvMnztLkehkJ32viZw4U3DpZJWqPSSlljtrNhhYP/5ZZsc5AiZTv
	4KLc+KA==
X-Received: by 2002:a05:693c:6316:b0:36a:7bb7:4609 with SMTP id 5a478bee46e88-36a7bb74690mr7403733eec.34.1793778427751;
        Tue, 03 Nov 2026 23:47:07 -0800 (PST)
Received: from Sobhana.localdomain ([157.51.204.42])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a67edsm4566016eec.8.2026.11.03.23.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 23:47:07 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Wed, 04 Nov 2026 07:46:08 +0000
Subject: [PATCH v12 5/6] dt-bindings: thermal: lmh: Document SM7250 LMh
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
Message-Id: <20261104-master-v12-5-57fbe9eef978@gmail.com>
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
 linux-pm@vger.kernel.org, Sreeshankar K <sreeshankar0910@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793778372; l=839;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=I+Xei2sZyAD45OKuTBmy2G1nFWggAI0hWE7RAd9U7rk=;
 b=GV9sBUWE0iEAWwIlPa/SGOrrN0lri3O7hQcwiFcVGn9liKszfRaOKsyvnpyVcbDKLNf1fDcL8
 39Nm0QD11IADHiNAZse6CTtX0O+2atStZ6s5c7Npz6bntVLNBEkGcjo
X-Developer-Key: i=sreeshankar0910@gmail.com; a=ed25519;
 pk=CGSHduvtn2hwLCNRXRc9s/fh6X8PH/zNdp08zC8hOuQ=

Document the LMh compatible for Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/thermal/qcom-lmh.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml b/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
index ce72347e2..b8da39f8a 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
@@ -26,7 +26,9 @@ properties:
           - const: qcom,sdm670-lmh
           - const: qcom,sdm845-lmh
       - items:
-          - const: qcom,qcm2290-lmh
+          - enum:
+              - qcom,qcm2290-lmh
+              - qcom,sm7250-lmh
           - const: qcom,sm8150-lmh
 
   reg:

-- 
2.43.0

