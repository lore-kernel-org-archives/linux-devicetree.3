Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793810846;
	b=ICvXIUfgQnueL61tijeDEvnhsJG2qikNACDIsI0vhYZq1+or7rCv2QJfRH4ZBLpic+9E
	 ay5O3jDNHRvQrSVHinKUOjkJG0TF+mjyddmVeDY0VVeSknaN/o14iirx2lqv9siU9hQAM
	 bF+i/MYsQCr3lxZsqVSJBQhJTi2Re5Uu71F2HJC0FEG3QtBvVtoRSv/8jW7B08Ccp8ZkL
	 x0eOAi/HEuiqETngIQOBipoZPqE6wQlMYv6IK6qf4i5ErcAikGKIg1Tss+87kWimFJDZn
	 yo3mlsr4uMmLj9uob4XQA7Uqw3UE+OtNF34OHIUrBCKv2DZgEFDvySl02l6wDlUnijw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810846;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=zMbG6vrMcWe5nACzqEmNc6Lg/tRkWbgNePdHtBr1o4c=;
	b=s8mbsJ8z05qkhidOi+8+K12MgldZxZeVqywPiRWWV483EZU4NqiEZSKzwtUet9QE8Uo+
	 xYE5lDojQKxn3CopF4snHu7G11DtiEkPJYNkB1HzaQ6+iVeq5dNuVD+6tKnyG3INqrDly
	 F4uqSeDx2Sop3oINUmEecCnGe7HBVQhXKqy8dDmAmgA0GFath+Io++1xW30N8G/1uIfQi
	 rxQH7qrcHoZkKFH+63I0Xmoh96OKtGYUNUpOmrHLxZCcCtqV5s5H48rIICOnN2RS7EEoC
	 94kh92fmmHmFafM2BlAb9a7gim6vUQTzcnlGEEILBDr3PQPDhWtBFXhFsUN/0wwBGCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bq1wPuid;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496FF606D805
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 16:47:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 496FF606D805
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bq1wPuid
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1ae18eb9ad0so973088c88.1
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 08:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793810845; x=1794415645; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zMbG6vrMcWe5nACzqEmNc6Lg/tRkWbgNePdHtBr1o4c=;
        b=bq1wPuidKb+BpFTqMAhm7/EWX8A0CldFXYzvw7TglvuSehTtA+Wv6rhY2jEAUupSPz
         8Y+6bq9xZ4N22LC/k/nHIU2VRG4ER3x4QhYoQCxWfRAiy/vR3PtZmIv2kgsjUAd8cusj
         swjHaOz2WNvfkpFbGw4/4xxxjoXXGnGZKtQp2GV2xxKRCEg8C550O7PCCGoUHdi+MqYB
         c0M9ArvTTm8LLIkCdho+PEOq6aqF2A6sUoxxZAZUY1J3Vy0xYJ3rBZ93IVmMGnceJbb7
         U7A+9TZZIJmWG75sp5+9VXfLb/Ll2bWz5tr7EoZ4xU7nWPjOf3caHWdaZTOVz/74+p5I
         GrPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793810845; x=1794415645;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zMbG6vrMcWe5nACzqEmNc6Lg/tRkWbgNePdHtBr1o4c=;
        b=mkcDLtGkkFf9VeolUYW9h9/TcRTgC+D7O4B8JpIrl7lX9Zaay/D6d4zElmCID3hlbO
         qZhWI52YMMfKyQ5aecKj1GZght1UYGEjx/IqpMDarZHNMFXrvkPbHvaXsKG26rfR2Mhk
         Kw6CC8ZobeBEH0KLNVde5+wmWemv3f8hPoEWxDKWmTPS2orQ4ySjeImBJiQKZymcK2n8
         LlXsxI/Uj0VeFlZWiCfIhefLn8YSGBrFx+ohNQgtkL0YvlcQzrXIgQTYvxvelpMKZ6E3
         UV7pJykJn9Th/R+BzgdkJFYLgics0nSpVLoJop3ENp//9Y8F7j71n18FZPrnzrgMvym5
         nuRQ==
X-Forwarded-Encrypted: i=1; AKwUvBxvp9RGu8a0ZfCQ3DZSP+m5PefiQlEPLhpMFV6+HwQtsZmTgmcm/dulUbwQt8nJkZ6BD18WX5YuPFhY@vger.kernel.org
X-Gm-Message-State: APuU4Z+Twhj99tcWlG1YARYNwlvticaZUT6rUQQ+s4+vm/S+h3mmRnAe
	cEHSRMINg4sZ3Jd/bwxH6376oWlxr2jUOwrY2nHGCkBbwOiNpFpv74VW
X-Gm-Gg: AYBFou2xNKJmim90V2LGFvHsRc1oJUqgmlVfaxs3nBNAqAFIeu8glIyMADXAxi4cUcb
	nE6niOf13XWEQeB/ZY9/GaqL/+khTZHWnULRFNiiSTroR1beRVmi3VeBNHT+WuY/4QkqBKX5ddj
	zJ2ip5rD/eJdFX116n7yYv3acTbxOpVZ4z1Y61YJEBdoRpOXwWG55E0d1P3WE75NteXA1foSE/K
	a/qIIRbcSaB/lX7oZ7nvhtGj4oPZ//8qg2+i+p58NbY6diLERMcy5xWAUKCPAi4+wl71X/p6iUe
	q27hP0TtLATqgsUt2UFFa6Ofa5kR+xT0AIiEtWIFobi0ZQc1N6Mz8G0epRsh8Na3oyKHV5lTGkx
	ETdCpXn2oZbaB1m/UJSDXf/2V6U2lqtF6ZB3Mb9vZZmgyAADnuUEyrJkCN7K39GOpmP8OBtFM9F
	QvIX8J6e5ip8W+FYGbLuOS4n1R1jxkUQmGHVA0UmX76PiXV4zg6uSWB1g/QJ4gjhPJeWbJos2kz
	EwpYpQ51EQ9jhiy6PFEpqkMwZS6nRFui9doX1+XkcLSO4yUKwV+g5Hoq5tcsMsj7BhlRR1winPO
	pbf9V3OoWqxiJ74JFQaCx0/X/tDaBuJfbFwqM+GnqaM07fqKOzr92fs+tz+Lt/ANHWu+R10Qp+B
	lGGYzGz8=
X-Received: by 2002:a05:7023:90b:b0:14c:8461:b3ef with SMTP id a92af1059eb24-1ac5e6f5132mr31506193c88.24.1793810845290;
        Wed, 04 Nov 2026 08:47:25 -0800 (PST)
Received: from Sobhana.localdomain ([157.51.207.207])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c57430sm10839666c88.18.2026.11.04.08.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:47:24 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Wed, 04 Nov 2026 16:46:36 +0000
Subject: [PATCH v13 4/8] dt-bindings: thermal: lmh: Document SM7250 LMh
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
Message-Id: <20261104-master-v13-4-355b65c6f764@gmail.com>
References: <20261104-master-v13-0-355b65c6f764@gmail.com>
In-Reply-To: <20261104-master-v13-0-355b65c6f764@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Sreeshankar K <sreeshankar0910@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793810796; l=744;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=J3JLI+Blhkxqdoc8xLtRIhgDC8KARWHgIPjkApYQ3sY=;
 b=kBVXuJVpl65Jqkx4GULbJr59C4L4KJhdnwRlb2jZNK7mV/HoJ5fAdvNJsr2e5rCRPli2NX6K3
 QcEZXucPf4MDzauU/SeHXl/IE+5KsUbsPsBPFVOGpVI3IJdTX0hYBET
X-Developer-Key: i=sreeshankar0910@gmail.com; a=ed25519;
 pk=CGSHduvtn2hwLCNRXRc9s/fh6X8PH/zNdp08zC8hOuQ=

Document the LMh compatible for Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/thermal/qcom-lmh.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml b/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
index ce72347e2..e1d5cb871 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
@@ -21,6 +21,7 @@ properties:
       - enum:
           - qcom,sc8180x-lmh
           - qcom,sdm845-lmh
+          - qcom,sm7250-lmh
           - qcom,sm8150-lmh
       - items:
           - const: qcom,sdm670-lmh

-- 
2.43.0

