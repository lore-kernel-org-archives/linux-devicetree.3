Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793778420;
	b=risRoVZ2MF/qLbjesMN072onH/IGuixNBTW9hB9AJQiwyMaaSzU1zhZgE9xVPgUCEHzU
	 SJ3Rs+zbDdS8qaHgpxxxsEwpexagNxr6ZhUsvXIIFR467kr8aZq/9M+vcDq+0bbzJ4RiK
	 sqPAXDKNHMtu+0r4GZOZD7ty8PN0tdW9iECWaq8i2NooOAHh4WkUrPb8jCMTMvx62uFO7
	 q7+9LNNrKRDfr2HaqEGsScaM++rWgUraZUWk/h4+TwJjk+toTRvDDbqUyfczi4/ZwKArS
	 V5C0CWAJEmO6Msbm5oPCb1ysKZIITJy/uQam1hNMleLZhZMd9Qndky3GTTp91G92dQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793778420;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=DGl/9uJ37exsA4SzqKmECUxbZxp1oB60g5h/tILooTs=;
	b=wDl1tj8KuO/gPWrOCkNGNdzRke5eEWLt2xm/lbGaQbRNs+lQGQvkkVOsqkZ+KMzYaI8i
	 Ds+pRRyWql0Sqoh+kphx+DXKMQNy31w0+QdCEqmAMvaxAvbncDeeBPvBBn9oOQQr1h8ki
	 DntQDjwan2uj/7gSxAr7iR9p/Q0lYmrBghALF63Hzc7ubZxVN2dpBZgKzMoIWmAl8+del
	 Y5pPwaa9giEI06JKtDolib5bPAKMRvtmQVQ5x8WoIEqXq4dfoWY4STzMKNb/cooICQNyW
	 5BYjhgDoYwJdqBwmRUq4oOgyxBCXK7zW9Ptlsk4PS4F6CAT5rPMB20NdI615STNaUgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jKoYC0Yr;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9099606D816
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 07:46:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9099606D816
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jKoYC0Yr
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-369f33df08eso676179eec.0
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 23:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793778419; x=1794383219; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DGl/9uJ37exsA4SzqKmECUxbZxp1oB60g5h/tILooTs=;
        b=jKoYC0YrzN9VC1u9oq90fiiO2uDEAFoopwC5u/qAKYEgn3ytKayoWaV656V4el59KV
         RxmBVUsaO4YpnBBMPc7Wq5/z9Bdzd924jqwio3tKwn4y33OTEWoyqSyr5RyF303cgIcF
         H9dulUwkrVq/a0E0x6cbEemNYVggGVPs0EAFkqaY9DjIfhQF+Uj5DjIYcIh83FhYnbX2
         +Du8knaOHX6vQtFGpekj6/kSlwty8VrFjXTPPtmeD7DbunqHfQCNr+BstZO9nDzMmITB
         m0EtAvhzfY5zVt7+QMIFpO0PZWHuZyZkeHjDTa6Y3Dh/vc6Z1rQTUiyUef/M3AgXddaI
         4KUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793778419; x=1794383219;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DGl/9uJ37exsA4SzqKmECUxbZxp1oB60g5h/tILooTs=;
        b=clsMWSmi6XYQgtYCu6aXZy2bD1V1VPSx0/KEvjuJS3mTwbzIgoCsQQoKWSA19wUN9J
         40ggpdKUGlka1KeR8BMMeE4MpmV7qByk7PqAXEIDwOCE21OGPc5/jC38vPv2/PIRg+TK
         /CYoR/Y3gw209FLSteOmL0Xg19zJ6pW1eiw8+TJRTbX1j/E8r8qubpCGZRdlvMKbgGN3
         Ly2IEci8ieqw28WhwUBTXssTIm9DEGVB0F6HHN6DjGsKUcSlNG+EnOFPwpLYjDi7zEQF
         hWAyuyiKC0bYUW+HioB9us4kfFS/rbM9MJMikrXGMrr/Qi14HORLzfrVQF4fD8W/Lkjw
         4wow==
X-Forwarded-Encrypted: i=1; AKwUvByaNcEXhVtH03R3Rw6tbxc+BLhGRCJXkztqp671eJm58FZCUY2dJhcz2lV6nqCOwAB3RZcmjy3idI02@vger.kernel.org
X-Gm-Message-State: APuU4Z8STSN8GNVduw1pnnrU8t51p5tAMsvVGlPNPaec+d5xzGtjS7Kl
	5ZIEj3/WdZVUopCAoVCFMnluyh03gwab3AU0luzokYLgdwCFGzTNPGMJ
X-Gm-Gg: AYBFou2HQfmJtukdznegga+I2JoKuO7GDR64G/vFAsOf3WukpEdvxTJNT9ylhP6OunG
	Vf9co4fThSIysJVotp/gziuv3b1qImyJVRgY7rzo4iNdAcnWyzqfpvCWHWkpquJ4oO9VnMPeVqQ
	7nUDmdOHTy3s97mOe/2pb/ChyR5Ct6XjXUpC+hK0lBj7gBBK7Axi1qnzCMTemziQbB4wxx0kWb1
	Oz4FFfHoAbYoGto77rsELEiNykDIHw/b9bu9Kb14zIdVVrcwyC4YE/z5TH2jnyfMX2QuLNA3EKF
	FWS7x+e76azbHhkhNLVmZ5dIGVT281IinjgGN1DYSMY/T/bctVyvGbVcOzgzP7MBg8p1tjxcOba
	HDfcsgLsE6A4mz9/BUQJsfUkmhBOj9MN3Vn99yeZCluv0/+r27Z5ZWLAy+z8S2u+LpjVI/hY+DM
	GVySt9/urg5/W2y7h87dmcwE9UcjLDb/9FPRv0/CCz4t+pwl1IVOPICD6f2paJmUDUA4YULqqxS
	7ky6f6lonG1JI0/exzXpdnfuSGMxkWQ6U0RcAUbqhmk53ku6jpqLmkmAktxIHXLGN89IQAbUm+f
	2Fa+JdqwGdRtoBUMOXUJm0jy/LJtY3fv8bBaSMm1d8z/zptVxmfO8Bg+4TvziwGKm+UOXx1zofK
	imU6yOA==
X-Received: by 2002:a05:693c:880d:10b0:34e:9923:e372 with SMTP id 5a478bee46e88-36a4241a810mr24748355eec.29.1793778418484;
        Tue, 03 Nov 2026 23:46:58 -0800 (PST)
Received: from Sobhana.localdomain ([157.51.204.42])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a67edsm4566016eec.8.2026.11.03.23.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 23:46:58 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Wed, 04 Nov 2026 07:46:07 +0000
Subject: [PATCH v12 4/6] dt-bindings: cpufreq: qcom-hw: Document SM7250
 cpufreq hardware
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
Message-Id: <20261104-master-v12-4-57fbe9eef978@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793778372; l=1157;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=C3ow+chGT1NNdSip5xA3Ydc5tLXGcOB+9coWbmZJeQY=;
 b=WKZd2fnmwMJZhaG92c4eTNHvDKdlRwAx2VMbZDZotKHNrMZIh4MVUi10aoDcVp/SN2N/9Gfpx
 TK983WV69hDAxRUjkumKjpFlxJY8oJfvTjwndQDKjm1+IJssrvs3fZc
X-Developer-Key: i=sreeshankar0910@gmail.com; a=ed25519;
 pk=CGSHduvtn2hwLCNRXRc9s/fh6X8PH/zNdp08zC8hOuQ=

Document the cpufreq hardware on the SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
index 98eb36bff..f8cdb652f 100644
--- a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
+++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
@@ -29,6 +29,7 @@ properties:
               - qcom,sdm845-cpufreq-hw
               - qcom,sm6115-cpufreq-hw
               - qcom,sm6350-cpufreq-hw
+              - qcom,sm7250-cpufreq-hw
               - qcom,sm8150-cpufreq-hw
           - const: qcom,cpufreq-hw
 
@@ -201,6 +202,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,sm7250-cpufreq-hw
               - qcom,sm8150-cpufreq-hw
     then:
       properties:

-- 
2.43.0

