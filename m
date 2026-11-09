Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184461;
	b=SVKlia8mNJwnKxua928J3mJFbnpDSnKbul7dMvbB7yyB9Ll43keE6wHF4oR/JbN0o7Ke
	 fKcYXFsuBWY3xOwBiV7xK5bk3+na/Jd51E7aytfZh6nnFx28HUF93Xk77J6ube2/qZl3x
	 U4AbfVoM2EfmgeNIh/h0523BqCde5Vgw8BcCiwGow6bdWBrCDe05RbSxRZR/w24Boqnym
	 NE3cDbGVwggWUHovgGAOZ74Kpte/GxhmQKKCsX7dShAh45GCZ8nD/jlG+7GIbouX4MnpU
	 lx1c6lTAPDzAxBI42RHBh05KLT9V0pW9BxaUcLoZIWkzoYOBaHi67rqYAlHTYXq/iUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184461;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=w98VdCA9EtnwfzZZ4SHf5Gk3YVXSBdJ/uT/O1NuBZJI=;
	b=zw/eMp6m2LJ4qqf5oinLOev9LWBIb8ZzolCqa7pVSqpiTOPcykI7DNXtlnYe+PvBYJlP
	 Mrb00WH+drCN+vSe0boA9GzhtEruyfSeaxNRvsQtG6ro7B0/LsvaGG9lZOtr55lKKpCcC
	 dOZMELFeig+tbr0A1ry9F/Ae/Cpg7exkx8tDPq6vyGTF0emchI2Mj3QDDNCSWRyKLi+UI
	 dJMoNi/qa7hj648KjYzzzQ8DsgRdcMHHHlIKPh2cCrMMNj66HzjGAtvIHPuJS2+CMxEaP
	 BUOT3hyy+uHMyxp82B81cIay6BeSRKiNmJM2dSPk9pfg+YE/WdbX/TOT6GOro9ga2ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N7tYZs96;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C651F6083603
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 00:34:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C651F6083603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N7tYZs96
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-490d59c3edaso229608f8f.1
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 16:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184459; x=1794789259; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w98VdCA9EtnwfzZZ4SHf5Gk3YVXSBdJ/uT/O1NuBZJI=;
        b=N7tYZs96oQb/Ryz4NJ3+wLdB8gJYPV0iNzi0rgwTg8Dg6VnhJLQB9NE7KBBYmhqD6Q
         axv3akcYK460vYrVrYt3Y8pjMRxB16kOVcf0K48qc42a/8TGC86FwwuNSDSXLA1hshxp
         XP5NnH8JLh/r0xGiHagFvOyQe9k2AUIS1Pm+4EFPEOHWnjDLNssuwbLINZZGdJZhmIDh
         kbRkGnA3vcUMtNJahy6FnKi9GjefzyQbTZDRLiSLqJFXP5eAwsWARsf6et9MsoIBKEzN
         cBe8CuhK7MiiqlUEWwipkjXVaoHzBrSnLgAUTUGXqGTOzI71CsQIVtEWNZdH6oir6Aec
         712A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184459; x=1794789259;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w98VdCA9EtnwfzZZ4SHf5Gk3YVXSBdJ/uT/O1NuBZJI=;
        b=kekNuBmcyGVN6YRbqKTtQ6cBhry9XE4eC3FQChI9oDywGX6JK3SrfpAU60cLl/iWfZ
         kvmUrWOu/M6Xm/nVqgbBBmhObwbj6BzWI7nGunOSWK6k2wscWjMhMzpy0GqTwskWr+i/
         rET5jCH+kXaSBxr15MhCJz2BIMAXka96aoveL0PLoRIIxiwY9iQIx4gHm/WKk0nKaRFT
         utAsHQpHB519xQPomeXgXvzXlrmLx7Owq6AOUGF9IF2JzevwZRrp7wjI2FcuRQ907q8R
         XU0TAdZrwq0d0VHz+xK7Vr8ijVVc3HRiVtlcqzd+aTROYDyafGnKvg1CUtcH4ad3efDo
         nfXQ==
X-Forwarded-Encrypted: i=1; AL+hErGJLEXPnv/4ULzWeO5JZryjz/RqIli89UlpPWP0DflD3SXjGr+MFHHxfHIMKYICtdqdv/cG4ThDQOBW@vger.kernel.org
X-Gm-Message-State: APuU4Z8GiDOOJ6XtMrrAwP9JDbyxXiD2W7e47NlfrANkK4j8zCNtB/Lg
	wjK3Zu1u5m6aHME1Umhm4zV8bYSQh4jYgGrigfOsn10Y5tRbbwcENSzw
X-Gm-Gg: AYBFou1cB6WV+CGjqDDF4aiQ3uws/rAEDMJG8G3CdQNibK2imFsmdE59ENwvVO+6VqX
	3QquEzFADWqZZx6h7gzgM7hn3uW2WzlKmb5Ui4l0aEoGnWxLATIfNNnLmEGyGnvbFrr0w3YaG3k
	19MhDY/iOTntr/nrL2CtU3XqVEcp9OJRTjkm5tlD5zFKrONKCJnOo0gaXyqJe5kBI/Q43eJPe9s
	Kw7XqnG921eDv4Wg+92CdMq4tc4ugws7x+UEhcIAe2cLFZV7fPac6+EVmc8pKFIXCb4g3jqEfcf
	HWfknjnU2y1AP7pcHxTf66Hnp0nctAdx72QiKBP3cv4Z28KTVJEr3fhTI88CzEUO/qDkn0IIfIY
	4+J38JgPQDT3y2Diq12jRJ4PGyoeJ+B5DnlalfPMU34eGWWKDxd2Cul6vBdvMlzathH+4mXNbLS
	gYVCEG1Am+ew6LB/PIxBEtqu+cWtX6Q2h1FRhRvDmv5A2gnjNtlpWCe0noNP7WrIASiZCnrY1a2
	VOI7hSkU0aM5A++2MKXoLfIa/iLiStSfvEVlNVGHKs2H14DSa5E5FiEnCctwx1TK2y1Vsa+DrJp
	VZm4KIttDQM0dQxn7Zvs3FbLktt8KJKFelmkdfdJ
X-Received: by 2002:a05:6000:2511:b0:48e:d7c:4bc3 with SMTP id ffacd0b85a97d-494248ee013mr10847131f8f.21.1794184459219;
        Sun, 08 Nov 2026 16:34:19 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39c8asm6541675f8f.7.2026.11.08.16.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:34:17 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:33:22 +0000
Subject: [PATCH 10/17] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Add
 Halliday
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
Message-Id: <20261109-halliday-dts-v1-10-289114ab8197@gmail.com>
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
In-Reply-To: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
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
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-pm@vger.kernel.org, Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184395; l=993;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=Os3dtyGi4Umq8bQ7AEz34h0NK9e+Ws6GY42XJz6qujA=;
 b=whHNXCMkWBlbyRe6Xqxsfmk8vbhGS1Ie1Ck2sCxfwGhqRMBxKE4lbZ1T0XWovH16DltXzjMRT
 ok60qvi/6qNA6DJ9tcvRYuZUzSKXMRRZZv1H2XgMMF2zBm+cXxEQ/SB
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the QMP UFS PHY on the Qualcomm Halliday SoC, which is
compatible with the SM8450 one.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
index 10435a0b5230..a42bba9b550d 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
@@ -28,6 +28,10 @@ properties:
           - enum:
               - qcom,qcs615-qmp-ufs-phy
           - const: qcom,sm6115-qmp-ufs-phy
+      - items:
+          - enum:
+              - qcom,halliday-qmp-ufs-phy
+          - const: qcom,sm8450-qmp-ufs-phy
       - items:
           - enum:
               - qcom,x1e80100-qmp-ufs-phy

-- 
2.55.0

