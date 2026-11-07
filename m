Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794018382;
	b=Kz/A33wdIy5Pfg1EmT/ACPFB7cN05eb/i+j+CWK1Zt+o7DMqUvGj0+88qeDtXBSveBS1
	 c/av4CaBmIzLQwNazEQmPa/4aNEnA7iSJcPUy34B32PHB2N3CmYawhcldIO3iY9zi0e9+
	 3qoCoIGGfgbmNxqgWoAHviUkNVUxP+voiuXMiMX5jdXOdoDwg1Imvd/TRtmtMLwLEJ9Nw
	 wJmjAqzSHWQLIlm2RNo2IPS7NohLlHNCul+dCJNrDL4EWSUmkqTSHDf8MJgXkZrLSDN0Z
	 eAH9I8wdcnFbrKGSCNeHTA0NTYpgTYosqoYL0b0RudKoCZZ/j8GyS46uNl2mQ00GaOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794018382;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3m9gvX5lYJSbOZKXUakfxz/981ELA/QvqN7rzqoA5W0=;
	b=vCFx5gT7gFeFROccGBL7TXInVtXl7hbu/fQnAHRkkQdoYe6DSgWSZJHldnBa4IY3l8Ae
	 CFIYPWN0qc77fwerHLeJFQtY6NVix0t4WewLZqju20gq5Wy/gkpx7uU02B39cJC0sRrlo
	 xB2whHnrunshhBIUYLY2Db0EQSEMUjZBW0BN4x7KyNIjYyPRgY/BpkpzeN+aAZIbLHFtm
	 q8+GLgrAHxAdVNqCiAh+kEM4biUSa+ESBeEhBfHFuH8S2jYoi24AMx2V3ynDjaJjFx1wR
	 V1rvhE6LaSUrwmJyrDLTUJdtSJP5lGf2VGzggse7AU8IzbmriBWLceZcUtCjiI81lIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MEKMoMiF;
	arc=none smtp.remote-ip=209.85.221.177
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99DA606A330
	for <devicetree@vger.kernel.org>; Sat,  7 Nov 2026 02:26:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E99DA606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MEKMoMiF
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5eae1276409so483500e0c.3
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 18:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794018381; x=1794623181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3m9gvX5lYJSbOZKXUakfxz/981ELA/QvqN7rzqoA5W0=;
        b=MEKMoMiF3xiJ/l3EFchdNu8FNUSH9MLUfVZo0v09Xw4FDNrqmbUeH48Ps8MvBhxwDD
         3cr8p7soVGz8dbByWssGeq2iItiHX7z2R6Nodnu0mmMywiMjiKRyivl+wF5XY/Kgh4j9
         zmAjgLQrcLPMCXbCCp6kFpGwglmLzyoGZ4vAE9klB+AQMfzOi+Us2fZ+hLaptFLcZHWJ
         FDIAuwpvE7EopYDrbqcpep9GCHyub+9XedsvnnvYD8gGwRQWb6XiojibH88n3T3LB36i
         WoEm5c9lS8oL7dXA0ZnJ/1pAO1VMgxyai877TrT6ikuOEjznQCxy2fyDF3/i8scBa75N
         tnLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794018381; x=1794623181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3m9gvX5lYJSbOZKXUakfxz/981ELA/QvqN7rzqoA5W0=;
        b=t5llmVKL5KZlJvxDqyyJG9kOYA4ypZb/AZUpImL7IlE5DIootEyzEoS9QejJz9VFpF
         N61Q9uXTeXh9JqFZmRrhziMqB/7G8aas2yXVneffs/igRkg6S2CbK6TcudtrpTKMUnDj
         FVQMCRgqSsGMt4ZgZtJ7W/DESwp46KcBYTGw3ihi38rVzkwu5IAqtKMnXOLATCcvnz4u
         WRbPtegi9ccLCvw1KyYrdqyFm3lakYsvIejP8lHYLFD0r484t8Xud2ZdW/mewzyIbES0
         b6GS3biH9kC4YnwyHETctl4biy/MyDbjNfo7gA/EGgZ2y3lzLcJ0sS27fPENbDAU5bn8
         jQog==
X-Forwarded-Encrypted: i=1; AL+hErGLdAU87qqhds4Q6U+D7TzARkbOPu4jt7od/0ymSykmPqyXQSfMFUUH9JNtKuCt4oDuFlOhliZ86iWO@vger.kernel.org
X-Gm-Message-State: APuU4Z9mpXa1+mU4gz8AiPRuUBDK6Hv2vlWuKNDy25dslV8Hw0XBB8rD
	DP0xR9xrJEzh30zPhdNnuihNXkh3tEBiPQp0Klw5ewerbmmbq9ba6i9P
X-Gm-Gg: AYBFou0PmwN1XNh7KW2KefVnnJ9UPe3KyZh/pnZgFO5pMrA2cU3Uk7pFQJJ9LFpk3LW
	RnY9nLKZKMQsegRGtusvj8OjP8d7z8lkJQZMqv3LANYlzJ7xWjgfrrbSWZQJhgQzYO5OSE+Wq2C
	FVl3OxC9ql8iC4gz0ZMGcsOj6j79APPi5sWOlLYY+FEeFedo0jUqIEXsQfYZ4shgdxel4eZTOCh
	hQtEli+HrO/4zT0CGsy1HHTx/bypwWlJGkKZN29CTiJ1yBSoabvibNCMIF7AQTH9Sh4CLXziFFB
	CXsXyFk5c9w3NLm7g57Y68JOYY6fvjtMXNs7y8nf6wEhSfPIsZ1+rkPLXyVF04ZNV0aZu3rLKwo
	hhgfUmxgdRu/fG6Ebt52VIxKJL8JtI9zWdYOs8gTxHBhpfrfcogaN7pcYHkpdv5buqzu7DpqdXD
	hmBej0WfPWDg2PhTv4uxE+Uml/rXwT7tLLiRlU8N4KXpc64bKbgJj0xTbBIn6BtHdgSLfrPThcU
	syHsA01xjYnsWEUtTiJL7rw2FR3NORl4B5bR7u4uHV7L8eUfld8vvRvyIWvsi9waZVVkyNi/Fl+
	yn2Di6U5YeVNKueINLxUgUAH8Lpc+/OGRUrpMvBx5X2a5kVPSg==
X-Received: by 2002:a05:6122:d17:b0:5eb:2a6e:d3a7 with SMTP id 71dfb90a1353d-5ecc43eb11fmr2142243e0c.12.1794018381006;
        Fri, 06 Nov 2026 18:26:21 -0800 (PST)
Received: from localhost ([174.93.36.89])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ecc64a5ea5sm2744407e0c.4.2026.11.06.18.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 18:26:20 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v3 6/9] arm64: dts: qcom: sdm670-google: enable adsp
Date: Fri,  6 Nov 2026 21:24:50 -0500
Message-ID: <20261107022453.159341-7-mailingradian@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261107022453.159341-1-mailingradian@gmail.com>
References: <20261107022453.159341-1-mailingradian@gmail.com>
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
2.56.0

