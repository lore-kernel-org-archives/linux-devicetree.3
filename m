Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794490394;
	b=XwA9G09cDSVv3u/JzHXECNkJzE8f5icoqja0n29cj8BG5G0HLL8OwbLSfkzhJWssi0MC
	 L6I6fwYGWu3sNWDB7KNWlhh5tkcXliQGe9T0+57rq/kIy4DvPjihgyYRwdzQc8LKz3WO2
	 BsiUTx0VFCFgJ1YGbO69Wcjo2bx/2OSDfwAWLaj5UcRiLEjrR0QgVBn1rJ0PFYFwL9N03
	 0JiNjMXL3GDeYhu/S8LRJZamRJFZ+mEfpsD20ru7GU4dQcX8wLM/rzwJ+omAboIDUUna4
	 SklK80JT92LabuuGRXJ4DwicrVsEoFSFYYxjZBdgY/o8fMy97zkTmsbWG4HqNnHHGOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794490394;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=wvEDmKLTGoQ6vEInH+gEDPqQXc7GEYDXGgo9WOw7pgg=;
	b=08OGVdm6xy/0e/X2csq6tnXoLDMDBmH0vgE5K4YeETUOreAUvqPDXVhcGTRYuxZepdCk
	 s+SBINbR+y29DlQPAnnmOMBxCzgfccOoSVBSv715N7CIqKWNJCeaJo2bK64dLqHcZx1sZ
	 70SMx6XVkFjLIM5snpTvwM/jVl9xa2DPY+UHGrLfsYl++uWKP5ab5IFHznWO7AL0Wo1a6
	 RrLhVkevgb8jW+9vndAf73XrTfXr/G3PwbEj7LS1WtJW6Zz339QDAsV8Vu2BBEBZVeNMP
	 ixg8EvsP2gjnFBEhKYQH+xl8sJ8RKOBEnh5U01NyjLXPHMXFmla8lEfJRNjNXOly/jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="b84wM/G4";
	arc=none smtp.remote-ip=209.85.208.172
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90699606A882
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 13:33:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90699606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b84wM/G4
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3acd239776cso32634591fa.0
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 05:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794490393; x=1795095193; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wvEDmKLTGoQ6vEInH+gEDPqQXc7GEYDXGgo9WOw7pgg=;
        b=b84wM/G4vgRMKU6oCG6n7mGlXsC5PjUWqVhtv+VHwzTgQ/POI42br+FPYNgXKgeDMC
         gLIwKYG0rSsVu9Zp/iLKcFEbA3WReq99mpRHi+ae8TDkvji+Y7IU8iblAqCRkxEEN5YV
         Z5FvV4/Zg1hbD5/ByTdxz1Fslu1hi6EHd6N3HHgi6XQEI6SGHHSqcWQkatt0r5+ix0Wf
         GqI/pXr2qrbPa8ikNrHRMK+At38t4EKqbIMUp/ApLb8mCxWCN9IS7InZ8OOn0nRxDLty
         seAGVGYOLaJjkjb8v67DwCzn0gN3l4PfmtcPtWUJ42hVGFCXWgJ8tAWMKgS9900UCXUq
         Alag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794490393; x=1795095193;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wvEDmKLTGoQ6vEInH+gEDPqQXc7GEYDXGgo9WOw7pgg=;
        b=n1k78LEex4vT17LTyZBgkCpJ6Ld6GI+QO3MHI6FLKe2x9sjylVhUpduhRf7P2mbt3+
         HcbVFQP72JdNoLmsiwB4483gIhXfn4ssCB4lIGfDNx52KCMj9QZ9A5YXBYFwIvgsFHf3
         4t2d/EvvwoCjBaiRh/z7Q1ZaGD52CjY40Io5z2WWWYnAGpaFBKOc/B5IdO+1J6pJ9FAD
         qvX6GGA8KmZZOUxOLgw/F2SaM/vgP1G54vJPpyJ/pVAX0uvZmc1g3OdP/9rbh6kuzAef
         oPn4EdjNMVUsdFiGhlMtNayFC5IwhTB3Y0z+hI6GPdDzYTVP43MY272snHkYs+mJRI38
         FM9g==
X-Forwarded-Encrypted: i=1; AL+hErG6f2eSKR/GwlvhNwrKJrgO8k6139xaGZsQH8Sx+oYBbL6Uz6lznE4T02b8ruBXlC0joYlTpy9/rQ+b@vger.kernel.org
X-Gm-Message-State: APuU4Z+UZ+9LXuV0HEyKmsqcb5KMYg/2/qYLwvXB6k+0xzDMwck/AGUy
	M4HoFcawSmVBiDOb2jaxICjap2eyDWy0aLqIXzxIh/8X8cdY3Z++PNZm
X-Gm-Gg: AYBFou1JGTv3IJ1pC8J91zrzXtyDfFmcl5867W/U95VqzWhqG5Z3AzXwn3fw1ju0LiA
	im1nWets9z6DFh5ob9hsixq1gdZQF/JdPD1rC/D2yBCqM7HJ1JHgmLCQDcJDDwnOCZZs1h+JxB2
	e/ibVFEd8dvPJVynjI5C29a36v0EKAvdVz/Zoo/M4GQFFmpFwnUF/9SzdBb7TcKTgL79mWgY53t
	aiye5eS5bnIASc5U4XV/YZ34Sd7G5SGYPTp1hEhDD9DYuNbC+aYQMQt4ULOKgzdlS8ITQeRB+k5
	P1BN64U3co54/jOLo+PfWNwhdpbAFe4N7Rqx25pccT3ZPUWemi+MG7eviGiWXCpr16KesCfwf0W
	YXLHHnY3RqerXkEH50f0dxj1BlgRTfb49Akmcyre+iZqo0Ukj+16RRtmD6cjaOnUgjV9YQ9jRsP
	YLkSTV5pbz1p5vXuXt6CTdACJK3+YJ1TnJdFOUuJkPeP5twyFlMa/tfCk6X5Ok1yfXs+KP6P04F
	5sSokBmxgaR5k/8ujMK33wkZOXwIGGWsTbbKUrleOkPFuhzU4b8oxe80qthcT6N5iSKuQJZuiaB
	dVjh39rVsQ0uyMvSa2RO9C+dFRLpuPW3yFDek56e
X-Received: by 2002:a2e:a882:0:b0:3ac:8e61:fd7a with SMTP id 38308e7fff4ca-3ae126b904dmr12347471fa.16.1794490392858;
        Thu, 12 Nov 2026 05:33:12 -0800 (PST)
Received: from crispy-cucumber.local ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae0926c65fsm19217631fa.28.2026.11.12.05.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 05:33:12 -0800 (PST)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 12 Nov 2026 15:32:58 +0200
Subject: [PATCH 1/2] arm64: dts: qcom: sm7125-samsung: drop unused label
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
Message-Id: <20261112-sm7125-samsung-grip-sensor-v1-1-d45dd9c845e7@gmail.com>
References: <20261112-sm7125-samsung-grip-sensor-v1-0-d45dd9c845e7@gmail.com>
In-Reply-To: <20261112-sm7125-samsung-grip-sensor-v1-0-d45dd9c845e7@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2

Drop unused vdd_cx_wlan label for vreg_l9a_0p8 regulator.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm7125-samsung-common.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm7125-samsung-common.dtsi b/arch/arm64/boot/dts/qcom/sm7125-samsung-common.dtsi
index 59ef4921f31e..5685755a44f6 100644
--- a/arch/arm64/boot/dts/qcom/sm7125-samsung-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm7125-samsung-common.dtsi
@@ -214,7 +214,6 @@ vreg_l6a_0p6: ldo6 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vdd_cx_wlan:
 		vreg_l9a_0p8: ldo9 {
 			regulator-min-microvolt = <488000>;
 			regulator-max-microvolt = <800000>;

-- 
2.56.1

