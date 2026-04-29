Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842013BA243
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 14:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777471815; cv=none; b=XtDYzeXXxhsS7NuMYbzwHrhGd/w+B46A2e+VtyiQ+vwrWe0m5ASP7FUFpDgfm0pGna6bgrM6P13Ndm5EegiPE6emiKD5vJn4SaHI3j6JrTznZWtY6ilAI+4yNazZKgsuYOSaq9dzClBoBjslf8+NGXGiKKPdJM8d3/iopFuWc8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777471815; c=relaxed/simple;
	bh=ZmSPolJcVe+fEIAGwoyfQ2txKJ/fL7rgRfJjQ0veQkw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=slSCmLjn46/RzEsRBpKUy1PYRB8t5XtLdz4/5A/DzYKPzdrfluf/op4XIVU1/Xm3ufPRSRkbmcmAp0hst1uynpEU7K8Rne89PnG3rbL4vFNyb4hI0iRmEbe3Uuh8scIZrdNInOFqp/HK1LiLGO3KWSTDU1gOBigLmmM3iCUjsPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S5emQm3S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DSY2RZxV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S5emQm3S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DSY2RZxV"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8pusJ3752544
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 14:10:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DCmszfLBMo/STFogk4FjG87dVSfdVQhr5pTDwhUSFlo=; b=S5emQm3SQ93uC19f
	rFj5xSxSgWrT1L3UN/EO+sqoJMqjUsge7LyNQiGY+ZeN9t3IAnq4qYUCwKOW/82Q
	yAG3qY8MXWTp78p8wgAEdQfwL70v07BVzv18AkNGn9siTt7/TPaiAygmgsuNKBLk
	9hBmB/tuAEaWiGofKVYZ0aOM6nw7rep4gtNM14Ty3A2GNLuo4eTUMWro6yIciM8j
	trVcQIR3noPwvGCOkbjkEYV0Dt7xTSr2NEbeJgQ80rrEQCB38CnXPw0hVjJmRKMp
	j57HNHJDdKj9JfU3H7gW1SSkF1RX+XZqGGWYUSmoM+rBYSLHTWCcfLqHPwafhz5A
	53qhpA==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duch1hugh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 14:10:13 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-64eaa6294d9so16081004d50.1
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 07:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777471813; x=1778076613; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DCmszfLBMo/STFogk4FjG87dVSfdVQhr5pTDwhUSFlo=;
        b=DSY2RZxVmxcCJfZUGv90iIpPNMOdu02ObxM//mI1zK4EZzt2GrYee3QOIPSPus2O2t
         uHJK9QxKMUFPcsxAJeckYb+Ze/FFfNWj8dGrY93d54/EXYC96Z87XFU3yZw/jAiZj8WS
         whBjAQ3aaOeqBnXn3vAAzMLbhhTJUpvvnt7jnj+Pj68QOz6PWG0dQbekxs79ACW1kXOW
         NteUOwsEqkMRhtDikOP3fpZBbrYjmsrh9ex3VlWpc9prDkNoStAKMHrCHqjnFuZqW70b
         Yp7Uubu0ExnplcIMQdP5mgtTOl3sNUncMY4LzMjzd3ClyrHSr3SJ31n0clFbz9Hhu3lH
         9Hkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777471813; x=1778076613;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DCmszfLBMo/STFogk4FjG87dVSfdVQhr5pTDwhUSFlo=;
        b=VKJ1UiEWFJZx9a3TesncB/h1NZPDdWboJpUc1HRult30pB4unSiTDKZMHLwGZId+6H
         LKQBbJ7SPraF+uYqxviCJPgRL97uSuKNGr1q7uxPOkTZEUP5XwHhA4B9jpAikMuuueAu
         m4I4LCxySxV1h1CzP+NHTkUdBW0J2mEQUc8y5M16JbjW7gCi+2nOxePDHuhnYFkADJZD
         rE8gwphCLS0tf3tp16r2yrj1f0nzdCOF8FnRgzN0QDGjkeKC0vwGX16OuLfuahr4/S0d
         ai7l0oUeGXmD4X+kaXx2Hsy+du1mBut08h+O9GD1YzZEdOqFrxqlcYYGlqAdCkUFQBkL
         UGjw==
X-Forwarded-Encrypted: i=1; AFNElJ+6zgwMP0ioDX5NwhEyf9SnOHT8VUoGXRh6txbKnBpMst7mDCjZpn+qQF0JkXPvMNR4vSxPFUrywKJi@vger.kernel.org
X-Gm-Message-State: AOJu0YzW4b4d03JCX886k6ePSukdMejjSF0ZSqWw4ifoQ1lqG6aF7gzW
	ZLNVHHVPFrfJDM53NPQhDlLg2danGt5pqZJGKztxbSvHFx402swlFmDQTIFd1tOJ5xLSyuL7IPs
	SvC+auMNNEx9Ge0WT9pj79ha2Qt/lR/weE2R3wXhfHgQhlaXjcKlvP1Isn50EuJE=
X-Gm-Gg: AeBDiesXI9Jn+nx1D4EM+jwQ2nWgyptRVL8tqxVRAOBKjH5jT6DXzgLYSugYuh3e8Yw
	QqdqpTUNN5CLQK/GjNbnTV7BEzY+Fw5Y11IY4HR5DVCEmN+HMa4kmPhIKD8lsHjTusB/PnS7QmT
	D60YaT+PFyGCMb+fLbRy7cfNfZPkJNow5Shkihkn0znF7RUx7HjqGnGpbt0mmnNxnnIUuxwD0An
	YPWJ+eiVK+jit8nsCHb6zzWlH1QmjvXOUMmE5plaMsYi9lVtTlD6KXt1F4tPFySKp+0/fyXkefP
	KMJm1mXy2C8S3xPkRPmqsXFXzu92OO4Knz5jWa0cUa9BVMiFcjabNgXJ/94XK47Ra2thOPv8fvb
	l9IA8KZBjge0Ae4R9C2c0X6/oHJTW9kF2QIBgtQwlLs6xde181wy+PQC09mPvig==
X-Received: by 2002:a53:ac90:0:b0:654:27b0:8881 with SMTP id 956f58d0204a3-65beed37a0bmr7079789d50.3.1777471812917;
        Wed, 29 Apr 2026 07:10:12 -0700 (PDT)
X-Received: by 2002:a53:ac90:0:b0:654:27b0:8881 with SMTP id 956f58d0204a3-65beed37a0bmr7079755d50.3.1777471812506;
        Wed, 29 Apr 2026 07:10:12 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65bff7ce720sm1286731d50.21.2026.04.29.07.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 07:10:12 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 19:39:56 +0530
Subject: [PATCH 1/2] dt-bindings: power: qcom,rpmpd: document the Shikra
 RPM Power Domains
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-add_rpmpd_shikra-v1-1-fdba28564380@oss.qualcomm.com>
References: <20260429-add_rpmpd_shikra-v1-0-fdba28564380@oss.qualcomm.com>
In-Reply-To: <20260429-add_rpmpd_shikra-v1-0-fdba28564380@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        kamal.wadhwa@oss.qualcomm.com, jishnu.prakash@oss.qualcomm.com,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777471803; l=843;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=ZmSPolJcVe+fEIAGwoyfQ2txKJ/fL7rgRfJjQ0veQkw=;
 b=BA3H/jKRX9lJg2PzXkgvtqBVtv+fLAI+34GzeYlG37O/T2zP8y67LYopstFEWvnuCQQ+NP3Au
 azLDLQEmk2ED6eKcTHYdw2RIpFF7i77qetlkTIhL2CjxsRcvnpj5tZG
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Authority-Analysis: v=2.4 cv=arGCzyZV c=1 sm=1 tr=0 ts=69f21145 cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=jkam1OttE9FODJyLpI0A:9 a=QEXdDO2ut3YA:10
 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE0MiBTYWx0ZWRfX2J+LXa2+0feJ
 6o3Zv2sjEw/64APcvZFovWeGeDd0qg77LH/jRUHCMH6m5+5coUnoZFDKPU4ghfWevcXF2Z2vxyw
 +YIJjpoIEocGaqN+wlLRgOShheQ46mNrSm4vlR+y75oW32IzBK6id8gnE6laCfP2ZB6QoDADyrt
 ystBTUdhG5sffIyuDgFd1i/5+KjqjXao2o/j3DVtLBc/y3VsWPwnzGbvO59mdo0yfZB5AkJwOXa
 5YciNUoY6eeUPB/vt5LQRrpFmVTPXSA62U4v06Z0tQqiYcBU4Terd2P2uT6rT5J1NMb7a9/to7s
 4yyJm0zrzBMOYh6osEX5oMzQ4U93utaWqQ/KFHtRrD3Gve1NtT4UDLQ2sRUosf92quVXPrZ5art
 Q2nFQFASAnRjIyomP6ZLkzwE3fLCLnolkrNua8uHkHHQWJ5IvDIOhSMZs24E40FrL5XseRr7uS4
 B89cAPm1XHmFfLc0Vvg==
X-Proofpoint-GUID: PVPHKQqQLdkyvun06L31b0Lc6VRKJxCR
X-Proofpoint-ORIG-GUID: PVPHKQqQLdkyvun06L31b0Lc6VRKJxCR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290142

Document the RPM Power Domains on the Shikra Platform.

Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 0bf1e13a99646c0325b03fc5b3297ebada21cdb6..1abb4b733fe79dfa267e953f48219093ad759330 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -55,6 +55,7 @@ properties:
           - qcom,sdx55-rpmhpd
           - qcom,sdx65-rpmhpd
           - qcom,sdx75-rpmhpd
+          - qcom,shikra-rpmpd
           - qcom,sm4450-rpmhpd
           - qcom,sm6115-rpmpd
           - qcom,sm6125-rpmpd

-- 
2.34.1

