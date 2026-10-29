Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793257431;
	b=R1nS1kgTVgExh4wI52ry/6jgai3/jS1yZ/9KL9iug0l9iJ/naqANKl8hd0AAqD7l82M4
	 9v4txpuru+WBnMSZCZuQbATRNJ7ssclfMgAsjG4M/q+vCas78AuuTCatQ+V/qhMD54aQi
	 OrAfMbhH38m6ydnyLUBpJ0lf1r9pUdOLcr7Vfu0R5l0ACJNyUTz35/1Yd8Ua/GSLEzl0m
	 YoZFTGyY+VGNKcBTt4D+cdkCMps3eUyYNhHfUN1G33VV6WCkDMX1oEiDMoOd5b/G9hT7I
	 LxUxfY44XWcopbADlxb5PR0ALdYeel3e5noChZCSw1PpNrZh7b/dC0pfUt9O6e6Bd+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793257431;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=U4fFdtJNvcZ6y6D1x1v24LO+4CMQIoUBaMtD1ZPuCLk=;
	b=Ubbe5F+HcfrmAdSP75p/9E+azCPE4c1ycJixkgxo3wBIjDnt+L2tkwJP2uw3Hg7MXgox
	 G4zlnErR/O/CfdMoA/xVQ5P6RkfySVYLeHNLPKFLvd6HkIL1l7yvM/KhUrHtsnQ/ViUoC
	 4eWabvHE0ZoEzT3mihON4q3P6cnhfch7FHWRs03lSzbFOT2zd0x1475iHuEds+IC19cUm
	 BzbTK5ZDrr/ygiAD84bHgMAc/k9nusxXvBtwzVYO0h5rYfG00+M0bs61vQHRAe4SPCR1u
	 ioC+qvyvOjl+bL4NS6w7Zg62YAsMfmUDCqXtDfU4VN8MhyJCQ/aobMEjPT2WDV7al2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F+pudE1W;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90E4606A31E
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 07:03:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E90E4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F+pudE1W
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3514b90bb89so3356372eec.1
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 00:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793257430; x=1793862230; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U4fFdtJNvcZ6y6D1x1v24LO+4CMQIoUBaMtD1ZPuCLk=;
        b=F+pudE1Wz7CqOqPaimvu4Pl/+YNsvoQM/t+U/mEYukGErBeyHWCN272+UtDoWNvHMC
         vAbOVjw5jNDZKqVWvZIigAyIF/4ESJZJg24DbMqgqsPrjUo1VXoyaa84Qnoc6dpgsKow
         JnXYjABw0qcn7QpUtnBpbMfNOIp8jsS/bzIG1KqgA32WsNOOhrTRm0M8ilMrd+WFoIIj
         2Hu6CwA/ZyDT2GE4BajHITQmDKwrg38kvYBXwKRGjaijJByJT/VazKfta/CnxRw+8FlJ
         ut22x4oOCDQDYQeIdnZqr9s59cDhITvsT3mB0kPl54Nkafg1zi2Q1XTY7Hd5k28YU8XO
         lt4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793257430; x=1793862230;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U4fFdtJNvcZ6y6D1x1v24LO+4CMQIoUBaMtD1ZPuCLk=;
        b=ATsp7nbURusnNHoY5vDmgDpcxdjsQMvFz2qT/7n9ydlliK+xTPKX/XoBlOurSVw4I0
         OXrRtPzHGmMVeFF5OTl9UNl0WgxV68YXDhBi0MkVOE90bj56NGOH0+EWtWybiftT6Dd1
         1nHyvsgHD32RujOL6NSuOP25AXNDKyl2vD7rvCIpOOP7Vkc+w74x+njZ/EMKbZs3PePI
         ce8Pcs6lfTMLn/96P0TEq/0d65Zfl4KUFzHwu23fO6N1x6PV1CHbvlmlio64+diXBGj5
         3ENefPIjZtGSotXXXCWeli029TKr5TgynTvCdF+9qyUZa5nO3PJd44nDxc3leJozIv4v
         j/iA==
X-Forwarded-Encrypted: i=1; AKwUvBzMUggd4nRf1B/7T75JJKzB95ABHFqEZL3TLC9HPwKmD1AXxJ7NqTt7VxzxJTXqSsKeL3BTyQSrAkba@vger.kernel.org
X-Gm-Message-State: AFq9FYJponwoItpx79kI0srVDWFpYUP9fLeFWWHscTJawF3Q7xY/P9/v
	wjCCvH3XPRd1RkNNvifGaTDd7EiYaHxRPVgRXyId0dzJEIOchVeJCpWl+Mi+Ow==
X-Gm-Gg: AYBFou0mCxSx8LSxGuYFHRVXAc5Rivo92QPLDmpeSn1JMqbnWvSOO46ZLBzKP30u6uM
	ZXpJS+LV8a2JRuj3Epg2T1zdTxb3pzFHhKSoFw6IS3dg0TuMOe4sBbrQeQlMBpMomPoT7lKVv0a
	csrqhQPjS7kIjdbdJ+0ROjyJPq+9rwreN/YAZt90R0H9AyuBzET74bOjGHoxTtMa+7oTW0v045A
	sNWwLC8Ch0SaHYoyWoE/VOnz1QFKqto/Q/ji19XnZvub62XV+Ws85ntbNry1V9oT9Uf0bV9x/z8
	aIluGRUQyiKVlWZRjhwOcB8BWbQ8yKCYStVrVXPhS8NSD02S5QO7q1EmfllrxPakqoyWu1K43Vq
	BQkAwD4txQqXIBHsmEsCnTL1IwcD4xB4vGPcXI40P1s/a257o9YTWljA3wgFEjF5D81tGWKYdfI
	CLARVl9o8DwjN4Sym0Dd+7BbdsaDod1TZG/ZOK22aMvcSiFwmB9hW+DZ7a/cndDoZgrphYtkoZ3
	fhoqQxqk/g8iBzE4lQhH+CyM/AxykA+Ab/JuC9D31799UiONyD2kdfA6ap81s5XLNdD0MeaiuA/
	STus/kF7POkd0rqo3cj8V4XjzW0i6AfV36x3GYIggbCXsnHgf2aZm3CjGP007/h/wFwdWyelRZB
	XgMa+7TgT+GTlTAulp+3FJB4CTGCG
X-Received: by 2002:a05:7300:e11a:b0:353:7d17:9a86 with SMTP id 5a478bee46e88-36a200bea2cmr7029875eec.26.1793257429997;
        Thu, 29 Oct 2026 00:03:49 -0700 (PDT)
Received: from Sobhana.localdomain ([152.58.200.233])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a2398fa4csm16955443eec.24.2026.10.29.00.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 00:03:49 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Thu, 29 Oct 2026 07:03:00 +0000
Subject: [PATCH RESEND v11 3/5] dt-bindings: firmware: qcom,scm: Document
 SM7250 SCM
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
Message-Id: <20261029-master-v11-3-2c29e382162c@gmail.com>
References: <20261029-master-v11-0-2c29e382162c@gmail.com>
In-Reply-To: <20261029-master-v11-0-2c29e382162c@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Danila Tikhonov <danila@mainlining.org>, 
 David Wronek <davidwronek@gmail.com>, Abel Vesa <abelvesa@kernel.org>, 
 Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Sreeshankar K <sreeshankar0910@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793257394; l=838;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=n/5l0LzNHQkrbMmziTZYOIF2FEcc8PMKPnj4oscjta0=;
 b=gjdaSkAxoqehvftK1W3o4GIVUIA72A6eMiGKTKK8PKFf4JbbGxuhscbbg/ywU6MqKNl0mpR9g
 xohlD0CPLyOAVuyH5IEDoVDWsgs3nVO3qP+to1jabBDFYp6pcoRN6tB
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

