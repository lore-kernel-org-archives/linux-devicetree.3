Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A888345FFB0
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 15:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787065850; cv=none; b=B+5Q1bFoHmVUYYOwjdq1uY3P7appMSwVCA18xmKwKj3MZ7Y3JejPAw7sZcG7JQZBMWf8uJZI9gNhBFUzhUGRBMzsZm6J//mtU1N72g4zPG9COn+R6OhrOeJolhz+c+lajon4AoNzy8QW5uogxQqTraxUPRhZyuY+Zaiynpcna18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787065850; c=relaxed/simple;
	bh=+7pHwsnV4lHrk8bBeQ822eoOERyjkAcl90hyw9Ad1Eo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dq69kRjpVkb6i7gOH1atkQ7KglNYwDZqeVSz49K0pz48hXuiANtHXVkxgnVF+nudTCXh1NbEeKs8bjBzlJs6t4RyPTwQ7iHje3coQlzpBk5rOM/WLcZUi8a9GlGOI4wAUu/2lNIfH1zOM4nOOuIWRkNnIw7qhUIwO4PgHTz5Nz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WH/J7bt2; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WH/J7bt2"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c20ce3c118aso210653666b.0
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 08:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787065845; x=1787670645; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XJ2AQS/8vCTGcQEdQTct21p9QgOdd8opq2N9gve7b/s=;
        b=WH/J7bt2wH+HBMoxP887XG7EtzPN3XLvEbs5iinkE4w01sz3/q2sDXMyA//RtJBGjD
         9sW4NknHMTSDBrGY9m5KM4MoagEF7cHSQh6Jk/ybrogiLMqf2LDXqFePMXRUTQpG9jVT
         Di8n1tz7KW4Z62qS4jLpAvbClMMbB78dYOYkO9WaPgWhMJf1PbdRX7KIobVmy4lhiR8Y
         KdUq4fPLqnyC84Dcwia8KjhLbeT+ONgFZphs7eHXNJZcjJoqf/o4AWIaj41Ao4yf0ma6
         TJpMilqQM0aGm/B0LZrplh5CPSd5NlSiAhp6qyOIu85t5CHBd0MR0EaeRJ5cmUQyKD9N
         gbkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787065845; x=1787670645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XJ2AQS/8vCTGcQEdQTct21p9QgOdd8opq2N9gve7b/s=;
        b=PwgC+1677viGytP8JNJbE5d/RKdkZx7RvaEqHg7Pk4NOAx+hglkx34gN6vMP75N3Vb
         BzjCALGhT0z85Li330TDreXCmj900ZIwLjrk+zR7nhqjuUfJRJt+ZYLKjhhdga7u6N3O
         2x+AsF1rRQnT+34nf31rnag9z1WDtp1M29mSThxW/PClVcLsFwofN+7qhGxZKFM1Alp/
         3o5jaKil6fLMPSs7DLxRvcAWP9KB+XOJ+vbpnSsUOdtzeUcAqFnFUPB1eGu84Qcosfbu
         mRvMxxCHZrzvwkeChnOmbVke02Ipv2sYDQKFq/PudC1pa8tjNjuzho4uFyc+dxJgoFO4
         uYag==
X-Forwarded-Encrypted: i=1; AHgh+Rpp59gy5tc2woUXeFICBAdKwtRUY+4y6C4FXTBOmqXx6S/j07g0FXa4UyIltNjHZxnDqhi+ZBSSyvBC@vger.kernel.org
X-Gm-Message-State: AOJu0YwLiixmhMpvk5iBlFka2Hq5sWon6201b2/A//d6VnLCCFogfT5e
	hLu1BIZhhy3bUKvCP3YFEcFc5lTb/bv7DfzBm4+kC/1cJYltSrbxYnnV
X-Gm-Gg: AR+sD12ogfvmsoVmXjSlE+HfelvNmqaqoSdRfWnKAu7yaUSEG+shPMUu0GZtx/cSRy4
	Io61Tvckkg6radxJJmQ+b2hWnKzOnolrdSj3HENZvijJLlpUuvePQU4QnEQmf9N2z7GME3TwfNR
	V9lLAx5QJxYHX6rLFmzgrV51RAhzKvXJNTk7AGbUgVdoB1rg9vMqEjWdeDDpIq9CfYQUPnzg927
	2q02ujn2Sekry5FmcEYkGl+n//SEAdaVwgbzlAqRX7d6wkpGpZLPviDv+uOmEPo6JwNBLrayTS4
	+4S+Mx/QYBmgy2/IS/Cf0FATaMlbI2n/eC92rPX83LPt0tBNdNTYkmZ0/TtES21zIXcv7TFR65v
	dgX/YVoVNQ8th1KcMFt/7FspqHet3kDyDDKBYzjrefgAD3kkrqr5uR9sueNNqpf2XyllmufD5zV
	5Xkg2yT09X/Gh8UvTUs3MxK8XwuwgGI2KSBKKrnc+kkCIIv96cPy8D/3873F8imdTG1HkevFuWT
	iC7C9ZcoQxjCDdKT7BlnkxDFQEXLoEKuA==
X-Received: by 2002:a17:907:6d1e:b0:c20:f85f:e7c6 with SMTP id a640c23a62f3a-c218b0b63a1mr487444866b.8.1787065845137;
        Tue, 18 Aug 2026 08:10:45 -0700 (PDT)
Received: from workstation (161-53-210-87.ftth.glasoperator.nl. [87.210.53.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c217fe69cf4sm205772266b.3.2026.08.18.08.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 08:10:44 -0700 (PDT)
From: "user.email" <zstaseg@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Stanislav Zaikin <zstaseg@gmail.com>
Subject: [PATCH v2 3/3] arm64: dts: qcom: sm7325-xiaomi-taoyao: switch to device-specific pmic-glink compatible
Date: Tue, 18 Aug 2026 17:10:39 +0200
Message-ID: <20260818151039.409767-4-zstaseg@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260818151039.409767-1-zstaseg@gmail.com>
References: <20260818151039.409767-1-zstaseg@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stanislav Zaikin <zstaseg@gmail.com>

Switch taoyao to its own compatible so qcom_battmgr can select the
taoyao-specific property mapping added in the previous patch.

Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts b/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
index 6f8bc65bb99b..6621cb40e710 100644
--- a/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
+++ b/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
@@ -72,7 +72,8 @@ key-volume-up {
 	};
 
 	pmic-glink {
-		compatible = "qcom,sm7325-pmic-glink",
+		compatible = "xiaomi,taoyao-pmic-glink",
+			     "qcom,sm7325-pmic-glink",
 			     "qcom,qcm6490-pmic-glink",
 			     "qcom,pmic-glink";
 
-- 
2.53.0

