Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795485407;
	b=33R3GUX4YPRMe/BjRmF0J1dfKJwNF9e/u41tM8G78u4Xi77yNIXs9mwLxD+C4yPhurdU
	 9NY03oHlnPewjQeFUyOVyQAJCVu1kD+nM+p9JkXIshfkYKdjK/ZMiMhNdeRDKq1u5Z9i/
	 8//caXV00K8JCOu+EE0U2NVhyztrAnGCzTbgfNEEvLZ0o8EKXIHzL9ODS4RxptdMmg3BH
	 o8ScK1UBvvNYfLmm2yPPJicgr6Xc6rkJFN/SqPv85MPUouVkdOnPwPSqoROuTIDBiU7fA
	 jqHFovLyvAR1tMd77unY+2poANWAuP4b1Go5M8NRGc3x4dHvAe/2Pv+a4fgLqHKerlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795485407;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6VsuKwlRwWJYLAsfMzykziZnzXbEyU4vNFoxq6pdzj4=;
	b=wD0glu8FHc8bjNozWCHwyJOO6a9ntIfrVWdxPYbGCfd6LMa2FD+kQeB9Zwfugcj5aXHP
	 1bjo4dilWsAIW08cevSnSge8B62EwjaMoD5Oj1WBq9Irio1XqDhKG6oaO39/SU6FQLqYs
	 7lypqob5/hS3nUUsLbLs7VrhKDmDOI3Vn++vGfnBTTsnJYnNcM9P45209nTnbrQLCG478
	 DcKcGqHlq03COZ0jfZPpSO37IpJbfwPH9FobfC8LfZ/YYXHzBtBCFnAbZtEuTXxGWGRng
	 I+MUWPQu7G2exQA2VMYWW5xO/lnlTMUddyBBGrWqeXoPCy3SgYpbpq0FxR6n6H4v5DQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TAXscRkF;
	arc=none smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483B5606A321
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 01:56:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 483B5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TAXscRkF
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-5365d26ccbdso48740451cf.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 17:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795485406; x=1796090206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6VsuKwlRwWJYLAsfMzykziZnzXbEyU4vNFoxq6pdzj4=;
        b=TAXscRkF9Yx9KLcAv8IGhP0/4x+zy+9DS5x9iUu9ZnB+ZIpOGR1w+22i1Z0iRAJgFy
         lVOMbiosBEvTShCgO7uRDgbDCGlQgDLwpUlSQboBYkyVgjnNrWRL6w47e8EaN+KSge7c
         +WgICzH1CPR4j/Wa+SFtFGDoMgAGYsoKjzRYiksOGL37i02modDX1lXUL58Qnw0XbZqw
         dhNH/Tl96iERGNyVq9aiHLibJUtEvA3NQEJCEZeGIcxvh7LMrOQsiGx+h9pxivCcwpq+
         4isibU9ICG+cKhwsyqr4oFdZeCNBlt9zknV9zVZ+C23weE76xqvbKtkZFTaYyXP9DZay
         m+3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795485406; x=1796090206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6VsuKwlRwWJYLAsfMzykziZnzXbEyU4vNFoxq6pdzj4=;
        b=FOmkBhMcRf89CQQ/lzcWFRGFp+KdDDzdujhLJAE+0Va9ZydCzmOrtApi7NHEYTCA/1
         e77IrDuvjKuAqhO5xD+9ZWvQK4gjznO0aZszAdSgDd4wXHm55nLvrvjwUDLRIXl7tA2/
         Kr9CDG+bqKaHbkWpSi/1yvER0BT3tx6UrZagRWJ1Q5bv1J9Jzqlewh1Re7fPDokiTIFo
         xv6rmfBC7tCkz7Er3u/Cxml9hTY5rzHqMBAQ1Q1gvUqE99GsBlcahZZz/uGAl27euElK
         DEcYeiq8f07mw61OsMqydQ2DXEtwRcLFzmYR5tH4f4Nt2jn1qnO65PAdymwq7SPrqPk1
         W9SA==
X-Forwarded-Encrypted: i=1; AL+hErFhaWpvaauD6Y7mwDCAhovUUhLZ6xxYL4zrRJLhtiQCOdr+VBwPB585BWzUZNPIBicE8rOyEXx+ytGr@vger.kernel.org
X-Gm-Message-State: APuU4Z+C7F81f3tnkHshxNYDAAfSivEFB0CzzewMCx9j1zewmZwnCwfn
	A4MpG3HdZ2ZYwY39WCAao9jpccRjZuz+ntsHZfF3wehpRP+QmvAmKOUr
X-Gm-Gg: AZFdTZeQomP+gFzHh8YWgWb7UkT0gAOEYmONUlgAx9RbjuN7rLUkATtExiU4c4EHpM4
	BmVzqloF6NUGz7GJaMBLiKueFEKilPquCeID3ZBRcdw0JJDtCuW7QE5Br0gTA1hzYu6685C6KRV
	Hvah98JCmJsnNwXLU0pHjFlAcr20huEHLvvI19gFWox4T/H60dUusRiuN6NcEcn6Djdeq1Y4uJl
	/dg7zN1wzKIjXWSLH1A3mzOXWNCwYfOhfIk9goHMkzEkMH4o6xfrCrUL+yrjHIbRCoHQhCWl48C
	cEEZHGJOYC4OvDECWSaXdcq1yv9w2eTrqJQnTLyj0XDmNIZAx3Y39qbq0sG4lpxatybbEGpvP8b
	tGHnUpDf0O7fhe7U2wo2vonm9PsNwCn3wr4lqM3fv8awCzXdrus8a/nS1jnfSH7LUh510KOigMd
	bPEns/QEhXlHebVDwiXG5vqLKUW7hXPl0UbvlY30kzpL35sun3CKCBb20ppTzqaDIcaY5xYmLtg
	Ur7vr+Nr6L1vhp7dS2+Z13l8MYFjsjeudDA7/YJ0wgG7nhu8hoJPVm6cjsckQEIe6XtF2xs5QiE
	jqojOGSwiIc0WjddkkCXr09oXRhW
X-Received: by 2002:a05:622a:2609:b0:55d:6ac2:ceef with SMTP id d75a77b69052e-55d768a3013mr248411801cf.2.1795485406231;
        Mon, 23 Nov 2026 17:56:46 -0800 (PST)
Received: from localhost ([174.93.36.89])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d788116c9sm115098901cf.4.2026.11.23.17.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 17:56:45 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v4 2/5] arm64: dts: qcom: sdm670-google: enable adsp
Date: Mon, 23 Nov 2026 20:56:08 -0500
Message-ID: <20261124015611.187024-3-mailingradian@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261124015611.187024-1-mailingradian@gmail.com>
References: <20261124015611.187024-1-mailingradian@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the ADSP on the Pixel 3a in anticipation of audio support.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
index 4ce9b62abe53..2044593c22f3 100644
--- a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
@@ -199,6 +199,12 @@ cam_vio_ldo: cam-vio-ldo-regulator {
 	};
 };
 
+&adsp_pas {
+	firmware-name = "qcom/sdm670/sargo/adsp.mbn";
+
+	status = "okay";
+};
+
 &apps_rsc {
 	regulators-0 {
 		compatible = "qcom,pm660-rpmh-regulators";
-- 
2.56.1

