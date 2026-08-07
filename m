Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008754252BB
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 08:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786091168; cv=none; b=jFLf09EgcJGEWhjqOVHHZk8OXrq6X+vULRmxUWKp0acEvraYHqAe3R/WdNDQTHOooUOWSEKz2XuhLTh30CAMvK/swRqHlMlQIMhfx/5rxDLYQBzv5MinlYLqvqDis0XLuqnsEM7vnYOGvL9OuhPh8RfE+n++fgrNw0NPwekmhmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786091168; c=relaxed/simple;
	bh=k2QqCCh9X9jHuhXVXYKmeUNyCph6NCLcDyyxb6DSt9M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J9CmXVwcn7TSbHnn5IiSEKHHOI9dNOrcJBAJrxqliEsUje+Meu3vLpwUkwT+QyrM2N7e+fVKnI8BztJZTYqjazL8zjHY/ganC1qGGCKudyTqEOeOwt4v13XQw/jQcXX127i8RfqiAdIaFOVkm/rxR6AFX3NTRQQhnHgTltF39S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rd/pIsCz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KFf4h+3o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rd/pIsCz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KFf4h+3o"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6776C6GS3576204
	for <devicetree@vger.kernel.org>; Fri, 7 Aug 2026 08:26:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uWa9gET6WAVvUhHxtXVevYTe4vaEKY3KFNZ8ChrERG0=; b=Rd/pIsCzkCJ7sJkq
	hX3kY4lm0uNJK/x3yfsA2x27SYy/XvmjHFfZuKx4/q2cw9jsPiDa3t3as67dUtJW
	LVxvenSQMPGgMh3BLrM39e5F7TC9qInycSsGhL1TKsqjfLHc5K9/S9xlO/o6hLZi
	LncHGdDusJS6gfHXoQZIqf044EyO/zNATFg8p3k8FVS/Ctr/mObuFAC4N+33tke6
	xU7rt+YF8jqZSbjUcVISVWx0a4Blg1XFh9Dedw8HFMeUkV0J5+Vj10HeM2euES/E
	dMqL0daiX6pYFyiW5ipbdTdWrf7fhS8dd3wG8w1QEInSFcVi/lZQxcMvLURNk8iM
	8J/0zg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fw9vu0fgv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 08:26:06 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cfc52ddc55so40332845ad.3
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 01:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786091165; x=1786695965; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uWa9gET6WAVvUhHxtXVevYTe4vaEKY3KFNZ8ChrERG0=;
        b=KFf4h+3oDVBWyUslgxxPZPN3GP1dbIvBqMG+txSfMYQ38+vhDcO1h8ihtJASYYMqWr
         MlQcUK29iubeciy3qWr3Im28MumcExddW7lPae+wNdKCP0dqs8p8vbIGmmomsiWBZrkE
         /LHKMo/qOjLRHKdSuYdUxhWsaor0wA9rUeBL6SnoERuvoWebcVD1fHpQsiZcixU0bALr
         2AsrrijGk/LGTSkRcR2yOijKmUrCDpdKj7F666yeGWTe1hngRzPC5OjxILh7IF5Dyahi
         /EvKCHjAzNhZ0uIM2/WORei+VTz4kErsPB7UGiNPVDb22KHnZb2y4zpGCAkxvgGkX7nr
         5Mvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786091165; x=1786695965;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uWa9gET6WAVvUhHxtXVevYTe4vaEKY3KFNZ8ChrERG0=;
        b=N4Uz37N7+m+xXMbQtNuqJK8HvOPnbYAbKpoXAJS0WN2V3XuNOH7YMr87WI7t1z6pcN
         j8GtwwH4uMhR8rIqe4aZ6GAnbIObkX7p6OJsW1nyr5v2iIXJem+HP2G9MBC/m7eNXb9n
         rw3uyt26p4gsmwL2Jh6h8rsCF4dTNoS+JCh8qz5tscBxMDOurataAdZtFaPV2KfGfAj1
         wDdPyn3Rl9HaiYEFLg8XhIZmmsEzAcSuyD/monBKtJvXPlBYTnd/6/oq9hVRrIcl8q1j
         /HEt7fN3xVFsqR84oTqf+u+9aqaydGreUV7zNcDcKsn6rXGQxlEBgdo/Ni3Lg7ulei9C
         huTQ==
X-Forwarded-Encrypted: i=1; AHgh+RrAr5hRfr5lkvtuo0gQF6Mry0t4k37wyG7aG9JjXu05Jc1wk0RBTTiq7TlIvNLHvn5KVd+ppBXeDWb9@vger.kernel.org
X-Gm-Message-State: AOJu0YwMzRCxPNyVu7r0UT2YYyC6P49ob4/tGfBkckE3745tT88vKS0j
	+S94ZKoCM7JGlODhgOO1YS093xs31MWKyvNhzvO15/jPjFoovuGzD2m2Q4JuTpDe7tesL4GtInO
	4f444jzt9W6DmlWD7geuHcC0dC5GovKMEnYQeSPrdiP2F4PM3otZMUExBsH25K6gy
X-Gm-Gg: AR+sD10JPAvg30n5rYAKMs5rP0Q/fDVPC+G1duQyhfjgyTdPmKqHNKzZJjKi9zoQ34o
	dHW6I2+yP2NTeL85TqOpfqr9FkFF3/OeS4gF6yqZvQY5HKRSg7jh6ZArhzUA9Vba8shYEoBYZWT
	P5o10aDqz68kch+XCuHjg32W9aXQ5s8PWnCsQgzS5U7IHjFMsfV/fC+xVPLHzETPj+qt4qFEta+
	LMaju0DC9oILMWGja7gL7VtowP0fMzfdSaGcoTTz83Uqpo2csmcqFiVc2xwQSAnf/m696a5nBwB
	D6yvUFQ5pyH8lP1JQkJxvVEZIpzevA+iW5mlc+H8aokFGpdftjo9T1fKRSXVOLBMX6lrUOl3koI
	45r7wuqhAVGi2XcmoKgHdGc7N7wHK61dRXec=
X-Received: by 2002:a17:903:32c6:b0:2b2:67ca:5ff9 with SMTP id d9443c01a7336-2d106650dcbmr77510605ad.0.1786091165101;
        Fri, 07 Aug 2026 01:26:05 -0700 (PDT)
X-Received: by 2002:a17:903:32c6:b0:2b2:67ca:5ff9 with SMTP id d9443c01a7336-2d106650dcbmr77509915ad.0.1786091164607;
        Fri, 07 Aug 2026 01:26:04 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bec2ec20sm5377977eec.28.2026.08.07.01.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 01:26:04 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 07 Aug 2026 13:54:47 +0530
Subject: [PATCH 03/22] dt-bindings: media: qcom,sc7180-venus: Allow IOVA
 reservation memory-region
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-iris_iova_600mb_fix-v1-3-3996f67e33f9@oss.qualcomm.com>
References: <20260807-iris_iova_600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com>
In-Reply-To: <20260807-iris_iova_600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Andy Gross <andy.gross@linaro.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Pierre-Hugues Husson <phhusson@freebox.fr>,
        Marc Gonzalez <mgonzalez@freebox.fr>,
        cros-qcom-dts-watchers@chromium.org,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Aniket Masule <amasule@codeaurora.org>,
        Malathi Gottam <quic_mgottam@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        Renjiang Han <quic_renjiang@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786091113; l=1453;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=k2QqCCh9X9jHuhXVXYKmeUNyCph6NCLcDyyxb6DSt9M=;
 b=QxFev80+LYxm6vHDtmI7oG4xa4xX6nSDpEXDR5undg+BHuYkeyecUmgHxEtRXsJ9VSN76xt+y
 yZkUXvpA1aFBks2i3lB565t2MiQcQ2PtjzNC4S8jZ9sxUJrpTZMTqpc
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-ORIG-GUID: NQwUVpxIQCRZ-tuRzIpqQeVSQcRVDX7j
X-Authority-Analysis: v=2.4 cv=SYbHsPRu c=1 sm=1 tr=0 ts=6a75969e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OD5a0iPE9_tbS_7HGJYA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA2MSBTYWx0ZWRfXwBume4EOySkU
 nePDt2ZLIwBplDlUrughp4URig8A/avMFAysUVt1K64DSOLQeSqU4myAZ+PMv8C4XiftBP4JsQr
 fgfXezcdtWBT22qu4J+6KJDXwvBaWkI=
X-Proofpoint-GUID: NQwUVpxIQCRZ-tuRzIpqQeVSQcRVDX7j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA2MSBTYWx0ZWRfX6oSpHmCzVuuI
 i3cYGvBl88qJ7YbTERaeUzh+x9pjN2tvrahT2zutb0orL/tC6q8DXjdJ5uJkxoqGO5E393HAFCf
 oDeiWYX87TQU9MQAv7umXdLnTDQAPu9UUsApmyQralbUO3edxT8inmbRLohU5dQ8mEOEs2QjEvH
 CIqswGQhxNVmbCKkwwSnSHz7BfWeeKa7L9PTNoQ1N3EfW7RXSJkM//aWJA7bOz0HKz+c/q8lbz+
 cvouj5tUFFQcoSMCqMuGQ+MwYzxQWi6dRuNvM5oV4AgcK5jOXP0gxgfXBwjj00GffPd9f4lvDaw
 q6rgztoP6zbfM7z+eGq4RemW7OZMtGr8/7pqN5izyKlfjOalfFbeUwJ9vUXaHxs6fC8tkyfJ/E/
 WIyD5LoN7X09Bl6TXJDZn+O1IPXzVRqWB7iJQVyL9udEThiBvdftMj5dtuuhJ+UovheXSlQZ21O
 UqNuBP8M01lbdpSgBBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070061

Non-pixel stream IDs should not allocate IOVA space from the 0 to 600MB
restricted region, as this region is reserved exclusively for secure
non-pixel.

In addition to the firmware-loaded codec carveout, platforms need to
declare an IOMMU IOVA reservation (a reserved-memory node with
iommu-addresses) to keep DMA away from restricted IOVA range.

Permit a second memory-region phandle for this purpose, and describe the
meaning of each entry so the ordering is unambiguous.

Fixes: 545d984cc90c ("media: dt-bindings: media: venus: Add sc7180 DT schema")
Cc: stable@vger.kernel.org
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
index b21bed314848480b82153e49602f0b19e08e7335..52de5a5465b0f0b245b55eac6cd1acf16a00f7cf 100644
--- a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
@@ -51,7 +51,10 @@ properties:
     maxItems: 1
 
   memory-region:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: Firmware-loaded codec carveout
+      - description: IOMMU IOVA reservation region
 
   interconnects:
     maxItems: 2

-- 
2.34.1

