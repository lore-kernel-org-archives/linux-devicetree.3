Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795378480;
	b=lVue8yzioOVrITbnadUaKNi8TJZju9gEEgYZLcDPzHidATNRkJkNF2iMASyxg2nvlORk
	 qR/b/3ig6EQsuA7tEAGVHh6M+Pw5Bxao2YXk58nBTfStosJs3hxJP541C/LAdloHbAwcT
	 +6s6RXse/tr9RT+oHEaKok4wrqXtfR1uyHij+3eNIdvVfC9g+2l7tCby4AyN/zNOPyLlM
	 bJwnVDJY5ofKE3PFj3BgWLiUpTCaXqjBVYHZ9N2bOkwMVXGGIbOl9iX/h7L/6bx/yOEjs
	 3oXAIf1YoR3sem8d0McS7DQOMVEqDbCMMSK+qre8oxdVv4DBC1z78mZc8H1cYJufhhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795378480;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tAIopA04u3kiScfWK01xQnJoFdVDI60THi9oD6UnM6E=;
	b=FWDSIsqfFc3x5Rlu1P47edq1cUEcIqDeJC7tAkIhqepQQDeANnY7OF03UY+tmJ45YxBi
	 Ag9TRgOdAbay1n1J5rxklUUmt6EivTpG7xt3VCrGLt1i91CSI57prC5ZkkuRQWkxgi5dV
	 yERDNlkmdoGUpHCzlVCZm5G1OOOef3OUxiIWV8cjolvRX5N/svTtnD7H/W3aSkGixuQol
	 MSV94QepMiV7xP4LOxrsb8i+dQgWoVkM/Am5YJVdAwBXjdnbjrMIkHrvh5BrqK7hy8NsY
	 3BJ00XVR4cVVoLcH+OFuzxWVzGt1mP1N3baUdkBEs3H1OFPgh+zJToz/xexAKqlPkGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l7UTF+Jo;
	arc=none smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BFC606A334
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 20:14:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3BFC606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l7UTF+Jo
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6ae305e3bd9so4417979a12.0
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 12:14:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795378478; x=1795983278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tAIopA04u3kiScfWK01xQnJoFdVDI60THi9oD6UnM6E=;
        b=l7UTF+JokCqBU6VrJpo17WRBv3eGYi4FnWAlc2Xv7GUlRvrFTt8ZEo4zZcogx2mkyC
         PHOD1v4KC/TTLhXKYsMHZQ9y3MLg2KNhTC22emUWRB7tovYJB4JirU9U1YzVR7/f6Wmi
         EHzmM+TMFbPqOzq1XqRjXHGhbwy6dTB3OxOsShl1bwdG7lFdQydmV63KJ0k1Lz/1XWKZ
         PXkzmE4mOSgt7g7DuChgqqHbk26ePf/m/QnC1oflW6BbmZ4DgaZ9no1uYIsNkkvP/MlF
         /Ki4bwJ9masRw+++WgBIUC3W5bqdTAFZB9ews7NXrj4R8j3SkqGhDl2pPsFcArLb+Oyi
         DTBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795378478; x=1795983278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tAIopA04u3kiScfWK01xQnJoFdVDI60THi9oD6UnM6E=;
        b=QFPE+jPnYxoQglufwiFukEmzJpaQZ59oNgUjuXFCGT8To4lNFTEuaOMPDNZAI+dr7y
         6BcBepPxs0lM0qIqyr7aqAcTiw9uM/ybfopfbw0+59HQfxqDVqEf5mvnr7JsmvmI9s6L
         CCL4nMd/qQzn8+1gysDmrww3x3SOCgCfNOMalIL7qQVieT3SErDvahhO5WsSw481Kp2P
         /vzvpkwL5Y40sP6TqoFeymf6Q1RC97GZOCRt2rRZl+r8MJUZ6fPZ4P+leRKD/wcON8VI
         JuZJQPe8DvpCOMJAvMT/Q+5lpH7d5tu5rXGRmXBFABCdaAAQwGQkRrKUi8lB1TkV/yDJ
         SZjw==
X-Gm-Message-State: APuU4Z80l8zhbDl4PhKApG7+nHf7zXMgfumOofhLMYLMfXQlZLDH1fiL
	skn9aqtLElt5iZI4WSIfBDkmMHKcfn7UStYDgq/dE+JhHn53R10fz9es
X-Gm-Gg: AZFdTZdudMZsbX0aA74RBz3Vaw0FE1HL+Cu76G4ax5KMKudeoj7uKzyE4sJwiUQ4lGf
	G0/UwPdJWWT6Xch7BddStcgBRDKdLV5G795V2mNc01/khgyJRgz54rIw6T66H0fHSWM/mxm1jbY
	QiXAUKo/KY45XiHv9eVSdw/omTrzA4NYpiVhbJ8eLJrSXlI+79CvMMkhWZXpjHIV/tu8b2q7eUW
	QYbHDnfxIJ/Jxr4p7wb/M605LH2fgnup9jrhCaxBeGhLAdBD9UuLd6gLjkcrzzLVuBejdoPfkkN
	lKuBwkYD74gECiMC1hVRRvxOBVKfnjs9a0EGVi29HwVC+P0qCM1F/wN32YDdjbqsraC/IbsRbSZ
	LUhKaaHvuml54IkYENz4Ff5xvIHxwBlECX3wQVPBHRRtKK2aN+nKZ9xN2SstU9ngUAge0/IXShv
	D9KIRDBxyGzToM08W3vsL4Ppai8bvAWvHYPmn6Litv7+uxAcInyEkfUvcwKsxxtE5RSb3cRI13N
	8Tr8v1y6YSCOhACFcXYsH6qzXoGxX7fSIAPMJsiCsbYZ8KMfgJ4X9khMCSYh8y09lhvSbxn3WDy
	xdBb1m0yjYoNEGSR40+5jqDyLq9TFFKm+wb1vw9wj47v0kPpFOs7YOcnMG2b59H1gXS3OYy5pEJ
	BeImdqAdRwA==
X-Received: by 2002:a05:6402:42c2:b0:6ba:9142:da2a with SMTP id 4fb4d7f45d1cf-6ba9142db1emr1776415a12.21.1795378477854;
        Sun, 22 Nov 2026 12:14:37 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fa8basm4424074a12.20.2026.11.22.12.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:14:37 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 05/18] ARM: tegra: tegratab: Bind VDE device
Date: Sun, 22 Nov 2026 22:13:54 +0200
Message-ID: <20261122201407.23742-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122201407.23742-1-clamor95@gmail.com>
References: <20261122201407.23742-1-clamor95@gmail.com>
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

Add Video Decoder Engine node to Tegra Note 7 common device-tree.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi    | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
index 19f5549867a7a..26f1f7dbcc4c7 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
@@ -47,6 +47,12 @@ panel@0 {
 		};
 	};
 
+	vde@6001a000 {
+		assigned-clocks = <&tegra_car TEGRA114_CLK_VDE>;
+		assigned-clock-parents = <&tegra_car TEGRA114_CLK_PLL_P>;
+		assigned-clock-rates = <408000000>;
+	};
+
 	pinmux@70000868 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&state_default>;
-- 
2.53.0

