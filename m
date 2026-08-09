Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9056F3AAF4C
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 07:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786260476; cv=none; b=Wo6vr4GHbPSMLYA1Oi50JcZFyannHaNnfH9QGqiVopp6GObME7h0n50eQPoI8z1DyVJTIPMk1le1jXXfWf1S67om3b7Z3JkcBBo/nBEDCXrPo2Ik6/M6PsuofddQoWGEt5vk9VM8YjZikNyMicmhFdjqIMTaJAe6bCrI0Hw3CLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786260476; c=relaxed/simple;
	bh=y6+SHx4jWzVSPLO/G65pXmYK7pxuxGZP/jlOkCWmBgI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=moIdJr7Bnlj+iuhryh6OIhM7iDZbe/OfAdpLmiMByk34mfiss0By4SCeQ9LZyoTTJ7Hf86Q1ygWzEHxksM6c6njRyYxZ1OQJqJeDGd3LoeQtsojKBni6rjtqfG8LsqHe6DsO/Suwa6AOATMZ/KkfrVnNkUySXUGqZBWD//JO95I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WQaAHxuS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=drJ+8Tzl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WQaAHxuS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="drJ+8Tzl"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6795cvwb2226156
	for <devicetree@vger.kernel.org>; Sun, 9 Aug 2026 07:27:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z+0h/yCGszgApHuFMKwiBZEILGKsMyLoKfzrctSVWl4=; b=WQaAHxuSent2Jsyc
	u3xpRYhi8UdSOyk2E6gBPQiR4iOUOQr6zojvtxgJS197LWZXIfaVhNTuDeTvDHl6
	wzqrH8HRmZLsPUjBC4xdccOdFSgzU08ekkJdvfuIwkgWgDk91M5bjfwAtsmj0fAD
	k4+HqRvBcWsUzC5+TWAwI8uBTH/X31hewTEJxUoFuWgKK3iPUrZDdIRWwTCPcTE4
	Am/Ik20QWFLzsqtav+uI0kSxJvQBqhTMJzo13eFM4OB9dgm9xYh2v1zmWE5tNndG
	xqDTJhEi7cRxuB1hvchGmBasRIh/jKITLwEyanOX24gJluKVkbSN/cNDp+6BMPWa
	SITchw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwuf7ajuq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 07:27:53 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c860544c077so2138370a12.3
        for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 00:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786260472; x=1786865272; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z+0h/yCGszgApHuFMKwiBZEILGKsMyLoKfzrctSVWl4=;
        b=drJ+8Tzl2zoLEL+os2be8GEyv8qE6ZzGRtfGGVHyJ77fIPAGtcWFwZM2io8pAorLy9
         wN/+Gq0/u+a5m7sF0J6fqxpzQt5KGPVdNjg3zSX6EnbPnyPsmpYAm061ccctiq6+xH7v
         OnjzrcthBKLmmHls4AkSfJyEkGwvhc/KIdO4VivLJgAfiFW0jdxK5Ko3VrLE5nhvsTCR
         K1qANPBZu0ke9M9rJoH0kWQGzrXSjklC9deUDHEiOBjN6UxIhZr/52D/2r/iXfAOssVu
         K0fxjfFJdJf8JiTZHynlbohdNVxFNgTYZmP8rfokR/o9uX02XD+IHOXYpKO/IhqblNdt
         xx9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786260472; x=1786865272;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z+0h/yCGszgApHuFMKwiBZEILGKsMyLoKfzrctSVWl4=;
        b=Pn4mNDVVtzrbCHDriIhT3pFjPLBT8d/gJFyeAJl/YInO6FZiJAXH41Vbz4+Cb1C3Jb
         eXuMw0Zw2DsRBc7rwzF/8l5ysEmDu1XrnDHNDWelxr2KUJabb5XbuRs0shrtKzsd7pUr
         QpRt0U/O+85E9u7XHFEej4kNiWDHRDbRG5dWyHcMvAOWRvKw8+nyCA8+W05m0aV6LMwr
         tXS8iX6m/OiWTKp6Vj5Ep30dDKqGGzHQLzmu4Kp50TuUu8iG1pwmuA62k7H+2EyY8muF
         jIVMziJgv53CGcjnxLE6TyfzGS3T1+DDZiUBPTOyXspGANzym80OWpLIaq8jsjE4trgL
         khUA==
X-Forwarded-Encrypted: i=1; AHgh+RqN6TeJRon5zUPEdpvFqzKXdfmy5znaugJ6G61LVCJSP1MN8yPzse+L8Ru3Jd4R2Ur7rM/F6Ks5rRUq@vger.kernel.org
X-Gm-Message-State: AOJu0YzevkDqu+g55/eZz9s33de55ltwr1bOHUq8xLF1F4Dzs3KRsqKt
	k1xAXOWQfAZee0FabNZjYBpLhcWWHZhsqK0/Wrt41XS/RUel4IiCtRo/GV9p4j0FyaTnxwHMXSo
	M8M0u3aN9DcKJoP17UoO0gPUxfy9FdKv5210Gky2dGePDqTrAGatpdrDAsKc7t+a+
X-Gm-Gg: AR+sD10PfwfJfanSV+cd1+CF96RlWbcP8VlCypYo831omn2OcTtqFrmN+SpmJgVSich
	Aqf/8xpeunJQSz7SDUoXm88Jfzx4I0itN5quC3Vawioo6bixLC9Gfp2XXr/YHDi+SrA+GJhWWXu
	Lg13yBtVMsw9aR9ogIGGpvqbZuXWsWQ6v4jnkkX3HaB9RsdE4yTsIrHudEvzeZwqy2ST0r+Dep2
	A+O2pXyal+9/m14/rvNOye0RWNcltIpbs9MqX4TYY4Lp32dmvZVuN9eGedWszxG1iJEL/jK6iXS
	visWKKsrqhSkCT3jLexOn60SGs7VIuUclh0dX+XhYfCHgciaaIAbux84pF3jxjPd3eg9+joaOph
	PM+d2nmWnMEUCKyM7BmXuomT0BGfimK+vI8dv5F4N8yKkfHgKaRxBYBWls8HdkC7STaObQWKpPO
	hVsfa2fMQvoMkyhuk1fcGmIPk=
X-Received: by 2002:a05:6a20:d38f:b0:3b4:8bc6:138 with SMTP id adf61e73a8af0-3cbc03b5526mr18623795637.23.1786260472473;
        Sun, 09 Aug 2026 00:27:52 -0700 (PDT)
X-Received: by 2002:a05:6a20:d38f:b0:3b4:8bc6:138 with SMTP id adf61e73a8af0-3cbc03b5526mr18623755637.23.1786260472066;
        Sun, 09 Aug 2026 00:27:52 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141019b4eabsm22655630c88.6.2026.08.09.00.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 00:27:51 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Sun, 09 Aug 2026 12:57:03 +0530
Subject: [PATCH 04/15] dt-bindings: clock: qcom,rpmhcc: Add Kuno RPMh clock
 controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-kuno-soc-support-v1-4-5e0ede4a0c72@oss.qualcomm.com>
References: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
In-Reply-To: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786260433; l=862;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=y6+SHx4jWzVSPLO/G65pXmYK7pxuxGZP/jlOkCWmBgI=;
 b=qhU7O99SDlfFR8Z6z4Kf6lk//kHxeS5D+db7xUfMIC/OxSBf8i8E3N52EXWsiRBWNVQrND6cW
 vhQd68Gdn9PCZzv27ywcqXlAqhuAQfcYZG3McnmiuRemmqvrYz7QiIc
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDA2MyBTYWx0ZWRfXyU8HsXnoZ4Jp
 469Z2qPALAJtWrLACqXmi0UGmyYAU4XK0qVmvNwUNMcPOwXQgZJpfHsYm2wZlKaxhKWPoWPFFAm
 7xl7kjvAMEXRQ5ZmOMIrB7HHsnQpNtU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDA2MyBTYWx0ZWRfX6xzhWvrhiG3x
 N9u6F3X4i0NabGBiQxV/xJLAagLCIa8ZQkvIhbHssUdfWHpLRtc2sZhNf3xnvcDcI9cCr2nSOze
 GDw7wGZ5Qm6U/nUpRMHpXA3TCNorRd0DTJ7kTa4c+zPclgJpAGTXmea9PAlxVhU1t+PLDKeyLdb
 q5XtB7J8xV6G+WmJshQ9siR1AwdOWhTQa/BKbiKZKgU3KkUckMHhUpGbbNgVDU1+C9uPhcb5n7Z
 YVQeV4lxLgh0hlbFIO9e8Mk7RUr9y1+ec6oxF1/40iRBaxHfiIU02+IObcXsWot8QxTigXAnoH6
 S2CFJvTzbRoVrX24+N0Q5UAj3PhDFmVXU5+Y6mQ7DWiLVXFLDpboXqTwAu45Ca01FzOSiqyGqcu
 7EOc6KlQ97bjenuCwYDoeu85GroXoOdvDLCemdpXKvYY9HrweElfFIYtsuneKYxJVaes1+QMsfP
 Rp3KpTMlXLH2FCF+/Ag==
X-Authority-Analysis: v=2.4 cv=ecENubEH c=1 sm=1 tr=0 ts=6a782bf9 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=jfL2y6gmHgFrDZrSC00A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: pyQdJknxYjVMXDd-jOkBWVaJWa1AyrIB
X-Proofpoint-GUID: pyQdJknxYjVMXDd-jOkBWVaJWa1AyrIB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1011 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090063

Add the RPMh clock controller compatible for the Qualcomm Kuno SoC so
device trees using it can be validated against the binding.

Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index d344b3386042..971464c63ed6 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -21,6 +21,7 @@ properties:
       - qcom,glymur-rpmh-clk
       - qcom,hawi-rpmh-clk
       - qcom,kaanapali-rpmh-clk
+      - qcom,kuno-rpmh-clk
       - qcom,milos-rpmh-clk
       - qcom,nord-rpmh-clk
       - qcom,qcs615-rpmh-clk

-- 
2.43.0

