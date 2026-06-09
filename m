Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19BD3F20E9
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 10:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781000605; cv=none; b=YBcQEYluFQWpHctA6tbXiBXxfQF+BOyON1DuSS8mp3789BZVb7qplCEKGCF0W6MAADFKwRBtVt1dxQ7finJDlmWATxSUUCnoP6iSvVYwNUQDktHp3d7Clas2dE6SHAoFMg4yZi4S7z4l56foTRReNj5FPseIJiYz5pZMOrmQ3gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781000605; c=relaxed/simple;
	bh=QJT8DDYNM9+tXaQYnEtfZjV54zYFg9aRhXLBf3w5u+0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RRt8G2qAUW9aT5ENu5ay6ky79RcJwJhMNv7JrjOhkvaTJrFw9fphhwlc4kZ0iKn08DykBm+OSbN7HMkDKySJ00hSYXVajM0tgumAPWS0Guw35pglRifRcYwfVBavGAQWm9O5s78aVKNm9LUHwEVj4C3My1+yfQ47EOFp3xtaTvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lU5JAjXN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BMrU/pi4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lU5JAjXN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BMrU/pi4"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6599vL6P1907457
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 10:23:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yMkSNONUnm2KHs8hF/QzNax1t2KsrzGvrxMSvAbRTlo=; b=lU5JAjXN7tzqZFdH
	oQ/Fx2PtL2lysTlRsVCS6GZLXdza5QZNba5SpBiel4RkMVW5dEJeheTQNMwn85Hn
	868AXxwJxOG5adRM+PFe0qapjGS5dEqIHqTQ3xO0veKoCKg3pzFifsvOWMutHHJY
	xtgK6Pcdsc9Pi1HE+jXTcsIXxkZ55a703VqI8OuuSZtxX4/jjjV5RBoMeKF0ysjr
	d+LC5SHpXxjVh+9fZqPud/yObUHgu1KPcAUYGQkQCHUZ0H0LymftEULt5i3osxJt
	ljanmoac/p28fJxdqUnAvg4J+ySkSbqbxcBnnQ239buxchBsns5dWsF1ue9+HWcA
	lVzpBw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3jr8wk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 10:23:22 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0c32faa62so98851055ad.2
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 03:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781000602; x=1781605402; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yMkSNONUnm2KHs8hF/QzNax1t2KsrzGvrxMSvAbRTlo=;
        b=BMrU/pi4oFskVnRHfEWJviCtRc1YNBm9brTkCspkA/HQ/E2xX3fe5Lu6Mo0CFCzft1
         adrvgpEpabHH7fnLaVTAryswwg0fv0vnpI+TGmq5eLbE9s8bgJ3bbuf62e/Y13PLPpaG
         R1KQ5/bP9HY/3jxmnfxitmmCn+gkwApp6celfDzIRL9rXiEaLIPIAcexsS81SSzlHoZP
         1t31i7mV3XQGHrIst+IT4FeNasLNNs2Op7tKwnYdbMLru9upzCs5cPW0cMBwuuFBEcQK
         2w36LLrko+1Q9w76NtE1LjQQAUxizH+AL8K885MLOPi4l1htOyDJ1A8dez6BQQNHI0aB
         Pslg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781000602; x=1781605402;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yMkSNONUnm2KHs8hF/QzNax1t2KsrzGvrxMSvAbRTlo=;
        b=Qztr3O0VzBwjO1wqB1klHt/nPrMKmAPINcomiKisi4iF5MahyDxmYbIbCHwWNdkRZS
         R675PXPGE9CNY/61THK24CYdktzmWd3fk2HQE1TBumpV2Hm/XeLcl7ibCvBZWV59iotS
         4NM/SYwWW6aMzCL2yr1HRCLOyxAvrtNwgQXwoApILkJHkM7/cJ0Xb1R6vZqDb37Ts9Yo
         pgZux5hUfJBksKl3RmdLUST1tz38T/LZtiLXjsZDqVexjLrAo9DDFn4JaIq1vUb8AYKM
         yGBYTjT3Bj/goWLfUgWxyVO41X4HTL7M7ZJgyn+t70dEw5tHN/gx4C2/Emi1tXgp+9Vh
         fS4g==
X-Forwarded-Encrypted: i=1; AFNElJ8uGdOWcVIcxqkcEpF4d1fLOUZFQZq0tfwQ8kOf2yf/4W9Gjf+qBlbighYvn7fO/pxz8TxD3zrptSoS@vger.kernel.org
X-Gm-Message-State: AOJu0YzooyrFLRxkwF/W+IFduO6zyXntiw2TntwXxl0V8WBFhsOXC72M
	U8f7F7l9kT+CxLnQtCkKltx2pb1i9ZJyuus20Q5Qi2ieY1B4IbTwAgdvtbcJqyINhDz+0XufTNS
	QL/M4ZGdvRuSGxv2nYI6CA0rqeh/Zo+Ut6r9eHC5BvAv1/XrLvHM7vK/IOs48txvn
X-Gm-Gg: Acq92OHH23Lpqw2/9sOvQQe1QMj+BJ95135K5VXOefvvwfkRfYKISvd5Tyahvsi0TWH
	U9iDb/Qx/VzPcrqQK2N30Ps8Hvx+3zi5DSXEF9EtGGDjfRGFxf6ukaTIWWbNP8/QacZ/Glmxrfa
	JHdjBnrtK3UHKPBNnNBx0OlQ5J0r/4onXebaJJsmiAtugHobbkfeyqyO4rhdXyhiL2f7QJblCki
	kEpks1cUxQiNAjrB3OoY49NnLHxpSm8bC7CJqDQYY6Iyj+4USbl9m+T8kI+TXX0/3/BzSKbSGi2
	peDeJCsX6FJNUqAY3pS0z0T2RoRi5xqofKC5ReCkqvHWS1TbypPm6aHEbpc6c35Oa235La8H7jw
	+qX6YDhx3ukfcao+TakrRXK3QZIk7Ew8qIhHW94r6iqtlfgLeCa8hnOr6sBPdEQ==
X-Received: by 2002:a17:902:ce92:b0:2c0:db23:4a4 with SMTP id d9443c01a7336-2c1e85d210amr216325975ad.36.1781000601663;
        Tue, 09 Jun 2026 03:23:21 -0700 (PDT)
X-Received: by 2002:a17:902:ce92:b0:2c0:db23:4a4 with SMTP id d9443c01a7336-2c1e85d210amr216325535ad.36.1781000601193;
        Tue, 09 Jun 2026 03:23:21 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c2a4a64e22sm14738915ad.61.2026.06.09.03.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 03:23:20 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 15:52:56 +0530
Subject: [PATCH v3 1/8] dt-bindings: remoteproc: qcom,pas: add thermal
 mitigation properties
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-qmi-tmd-v3-1-291a2ff4c634@oss.qualcomm.com>
References: <20260609-qmi-tmd-v3-0-291a2ff4c634@oss.qualcomm.com>
In-Reply-To: <20260609-qmi-tmd-v3-0-291a2ff4c634@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781000588; l=1339;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=QJT8DDYNM9+tXaQYnEtfZjV54zYFg9aRhXLBf3w5u+0=;
 b=3h0mZAEUpF/rhebZrXu+hNdRzw8FWH+U67b2o2lspttI2wRaKXiA/eU9w27Mwj57HyPoDSpbc
 VjtQqfyRQuzD+5rXX6IRk0QiC8ta27G/AqOqHViUeWZH/VExq3rRW1D
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-GUID: NOlBOtOqgmyvbbWhAvJlaodQeBhRBpLw
X-Authority-Analysis: v=2.4 cv=aa9RWxot c=1 sm=1 tr=0 ts=6a27e99a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=qfTCltTXssArUCRCFzsA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA5NyBTYWx0ZWRfX0/OhJaznRKYI
 0eznyru8hPp2WxocRdCLPbnpYiX1Oa14Pr389ZRfjANfmcO1nKR6yrp63Gjz8/CcY1EicBAt9hV
 fLUTaesWdVmp8oBhvtZ/Jl7FQ6ZBSAzyCqPuP/cW6AKkvTlVO/IP2jMUPCYCaqxt5OeuxSQuuYu
 Kea03neFMgiXJrdtGCftO9FGVp3Lbv1lhczwC94qFJ5U8gM7qXORMthHCNlwTJfWj10K1r1jJQ9
 7WFlWQ/Z0oVecV/q/jot/BHqfIYpo1mTwlGgcc3TgKIOaDsa97gHXd1W85koLUOodo08pMoL937
 uN3qSRE0wJD42Q0neeoygJNOtMtNxsG5viZBOcUHfh28qslqFwADijSAJfoaUxSOY+npdTiFbBo
 sPyL0G3k2ZYEFyFX86xhXPlxgcreOR/NXESDGzmWmhuiPhgXyaprUFlaMgWA52ffbfgUwOXy+JE
 veSLg/7nCYSnhgRPdVQ==
X-Proofpoint-ORIG-GUID: NOlBOtOqgmyvbbWhAvJlaodQeBhRBpLw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090097

Document Qualcomm PAS remoteproc thermal mitigation properties used for
QMI-based throttling.

Add:
- #cooling-cells (2 or 3)
- tmd-names (thermal mitigation device names)

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 .../devicetree/bindings/remoteproc/qcom,pas-common.yaml    | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
index 4607b459131b..0d07a0750762 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
@@ -79,6 +79,20 @@ properties:
       channels and devices related to the ADSP.
     unevaluatedProperties: false
 
+  '#cooling-cells':
+    description:
+      Number of cooling cells; 2 for min/max cooling state and 3 when
+      selecting a thermal mitigation device index.
+    enum: [2, 3]
+
+  tmd-names:
+    $ref: /schemas/types.yaml#/definitions/string-array
+    description:
+      Names of the thermal mitigation devices available in remote processor
+      subsystem.
+    minItems: 1
+    maxItems: 5
+
   glink-edge:
     $ref: /schemas/remoteproc/qcom,glink-edge.yaml#
     description:

-- 
2.34.1

