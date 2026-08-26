Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17F93DAAD7
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787742994; cv=none; b=IggnMLxrNuoNdZw8MkP863+kAC3i4iDT7fBgr7XLctJu1qg6YJgLdLXXAwBrLPLHp4NXkChhYafxZycf7VLN3hHpIVIyl70T2zxBbxhBZgIAi4V4Fp1TzfP3Y4guZ1QEWOMvnnMWnrIdyUH8sT2m8UoePNya9nQdsSP0MSMTW5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787742994; c=relaxed/simple;
	bh=+2ROCb6kqVvx17mUmZm+JMrsgCHyyS4gQ9bjeReqjas=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YgQspqoobpfrKlOjlQQK0gUXl6IKYJob7i9IqIMmBrO8qUCjsMMC/fU3eWb2sdxKUYAcBs9GIN/fl0XsF0YxxubgVr/OuE+uGcByV1yM+sB2yhPL2E84TqlbiZNhXmGujAIgTysB/zUCNdpIabdb2evpF7fzxhKhGqzJDl0GQhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L5ddki1H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NQrdwz65; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L5ddki1H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NQrdwz65"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAHeU7519248
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:16:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NdZFtBZ8aaJXcDnF46oSRjvRUH8o02DrQqlCp10tq1s=; b=L5ddki1HCjdvwZ2v
	WvXXuVauZ+00QmW45h2gDl6ENJcwoQ17Wk6Jb8XfAM6jzVIbSP2RgkJwgOXPdaKu
	W8MzPJp/Sz3w+oe6MxaVFpdnp8KKvNJ3b7BP3Lsw8CxzwtTSLBchnS0AC6Pbl7X9
	oZGKx931eH2l3QalEL+555alkJVEVQRR+i8IpePoDmbOO/yaRgHTU6VH6bsPcg8f
	DF20X7opNUNPbmQmteZmxVKd+aq/fSxifHwWMK7180pYfJ1Hbdu/Tj3z9uiyphsn
	GihHVZ9hpeTxuP93Xrq2LhVoKeJgW5ONEpVdp+YEzS8sdubyljPzFi6yMXKHxajv
	LU28Cw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9x2n0882-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:16:22 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c0e702df8so11467891cf.2
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 04:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787742982; x=1788347782; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NdZFtBZ8aaJXcDnF46oSRjvRUH8o02DrQqlCp10tq1s=;
        b=NQrdwz65Imaolx06dODY7fyYT6I/uc/ZO1MAff23oSjqYIeHRw8lnXoHs6NQqXyT2t
         WX/BROb+WYBduUKC1SHjwMMFFJJlb7F/dvmB3+DhkQ3YMo00oA6cX2WE0jgvkgFR46lO
         GisbMNMK2SqW2dk+PHvbiuizUsHuPfBvSzjQUAgixmBbg5V0LFL+8PIbQDM7QeJRBjyo
         XlqPQYaaIAbDmEnDXJ4S3mQxtpK9/uK+f+zEK3wXUMT/7ssuU1bygB2FuJJmv3zQ6wJ/
         fHxeR3Snwm80lEFVExwRT2iyYbhjYsq78U0n+bUQBhosj4C8CbtsAKEqW+GpkoOH5J7G
         sv2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787742982; x=1788347782;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NdZFtBZ8aaJXcDnF46oSRjvRUH8o02DrQqlCp10tq1s=;
        b=rWwW7/tkjf0LDbQbfb0f2XUKc8IkYmQ8/RSusY6S3kkVkBH3dNalPfDcrg1ZNcy101
         4HZ7nigrhoj/P2GFnggxVzk1TadaHx2Ueb9Fg+V6bPOP/G6yGQ4WWLbCHieokc66FNkV
         aJwvathYPjbq5s9ahfVyWoPDOLTHNQuYDIv7WS+Hbmglms/QlwrfCgP3+sZBwhRFUOZQ
         rdhoJDnmQwy5BoHLLWgf6qwv05xbDKCoNTce5hL4As4wEilX/8sE6fv1D2eOcxdMlgQv
         sGzemVqRTiJhzpztvJKqaNRvhcC1q5k7Oyc7ZmkS4lqGCyKepH8WAJwgXh2HGLDvNu10
         peeg==
X-Gm-Message-State: AFuF++nVIaJmCl4FMaxAEIUGc7J+iv+kHx3q5YrFreKgQR23t71tjTWP
	xUEXruvom14KGMPZLUg2cEqp4vvR7jBEEj4+dFLBsht07oap06qopOLGBeb2uFG73YXUo4aIido
	jOLe+t8JUTz4n2kmmYIHQIfvFp0SSmkaRNJkgF9Xc9if8Y2bQ5/CV2EGbrUC4Tr3s
X-Gm-Gg: AR+sD11cIqZXbKEz1wnyRKmGb8LzA7Ry66A0nDPl4ivral2h2Gd9LEtbUDY/7dY8Vr4
	4tDVG5Yyu1nBjuvPb9ondw3Ok7QiR1GT7FAm7h1U20blBw0L3nYNEp/hf3vLVZOxPPoWBBOWYlw
	vXePMOzBb7ZSCsOvbQZt9OsBxLfDaqyXqlTz/gjNcCrdjqsSbHIBCUMCqfkaSUo8+Io0iXLC1Oy
	5QwPocYUZhKeGlSgGZLLPq+HUmRohbsI+BjDR3vjxWQyaHIDrmrTyYTNs9BdpVM9d7WDKUFSQTG
	4T81Xee2Fz3pbl5B+6OExrM6MlHZ2WWncxRV/iFuWP5/d0S0PGZT5DZvALhMMp7nTzkMXBf5trV
	yHVRZCCdZwfDjx07ToWT1rBQ=
X-Received: by 2002:ac8:594a:0:b0:52d:953b:2c25 with SMTP id d75a77b69052e-52e423cf77emr57101901cf.38.1787742982308;
        Wed, 26 Aug 2026 04:16:22 -0700 (PDT)
X-Received: by 2002:ac8:594a:0:b0:52d:953b:2c25 with SMTP id d75a77b69052e-52e423cf77emr57101441cf.38.1787742981875;
        Wed, 26 Aug 2026 04:16:21 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5de8ea6d0sm4577843a12.13.2026.08.26.04.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 04:16:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 13:16:00 +0200
Subject: [PATCH v6 08/10] dtc: dt-check-style: Add test for trailing
 white-space in DTS
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-n-dts-style-checker-continued-v6-8-f270b1e81f8e@oss.qualcomm.com>
References: <20260826-n-dts-style-checker-continued-v6-0-f270b1e81f8e@oss.qualcomm.com>
In-Reply-To: <20260826-n-dts-style-checker-continued-v6-0-f270b1e81f8e@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1226;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=+2ROCb6kqVvx17mUmZm+JMrsgCHyyS4gQ9bjeReqjas=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqjsrzcXXLIdW5+HKR0+bFE9ukr+ZYYwGbbmpsh
 L04Nv6fxlqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCao7K8wAKCRDBN2bmhouD
 10/UD/9MNR8EgV/C7oNIupAuP02wWuFOtKfCcC0zlaDFDMgqHdEVfxDLPiFu5tudyQRsT7x+TVy
 q42tIm9Nj9w3PairJFmqUDPJ4UdJj2RrUTjCJj8Nw/b67hHRrZDRzLZ9EFJi/4kqNiqkCvp7lqm
 XNSfNn5n8Hy2vYWXhVJRHd9vq4vVgHiMEMH3x2YHsxTUqTotWUv1J7wD/x+safpDkhHMULg7735
 9Ci0L8OOou6hAHaD+9nObdqTSSfA5/BQfo6IqP3pEitQKor9SA2sNH+MY/79T7LN1b0spad5fyD
 4JlHo/VJD8l+oOOcaFXveTwKHgsYdi7XyCIJ6720vG+jPxbSFyLsBiaFI6nmgxowHfFzOQSof9Q
 SMLKWoTmaytThYJm4QgVvCZNaAlP58FgYjtNBAI2qL3caE5KdIIFBnO0/Gtznb/XV9P7YFiXrOw
 r69xFLZeFDonwLz6bemYE1mHJ6IsaVYyi9CdVEwbJpYen2WpfJsJSZ6fgsex81UI8gd2nsAyKW9
 UvGpX/TXNK3JR6UpdLMMoMKsOEOTVetmf3d+GRCpIgCoJokWl+O0jZHMnfET8qzrf+Q7NkmeBKO
 AuPDhLhF755ZlTrpCUDlcgq5h7rA57uB9vHsTafXXeqLJw3Do2S+YMD5baCEyTuafVNa7axIoKD
 osxWiYGj3yLYJnw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: VNezxHXntK8H_IJK4j8ls4-6vL_byYPm
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA5MyBTYWx0ZWRfX4nNdZmPjclF1
 7xdMdS7PZJL+vvrttu2uXP6nNI9hFoHQAjrBh8V/50UE6toH9B3CK/j4Grj3ShJ8df/LgbWoYXh
 HkkDorr4p3aXS8O5UT0UXLZ2XajhC3U=
X-Proofpoint-GUID: VNezxHXntK8H_IJK4j8ls4-6vL_byYPm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA5MyBTYWx0ZWRfXytcRe8+Ish51
 iKqG5X3ahwRF5VdpFufgjDH38VIJwQ/0EBPkuPuDuKOL3I1EdbQhgk1q2jLenswIw5RwvgZa7Cs
 g/HLG8XlFJmy7lXSN9CSLooUz8pTGeP8k1FDaLLYCl0hRFpARz12003fxrbbIq2l6InMoKLBOY2
 bYt6OVyJ8xMm+dNyiktEoUzPEEXbM/cPq5wYCymHTY/0zueJuxxw/73rZPd50FishxzviegLl2l
 MRiAhwSAq2nO0EpsX96l+rQGTEicuNwP5SgeJzfq46Fz/hJbt/hEAu8A0dwYLybnPvwKtOdcI9O
 ZlQ07/xKRancz7piF+dmZu/bEwG07GIL/pUvYvvVEhLGkD8/9colss2RopDFzxQNqRpt7HPnJAD
 jLE+blGI6ONcr8sE2ik3aSsYhpWWe/wzrp7QhuCEidfXp0xPV+5BtdnPB6nKnaQlV1Y0DPDmyt9
 MVTE2s8jROt/ZemDgxQ==
X-Authority-Analysis: v=2.4 cv=PPQ/P/qC c=1 sm=1 tr=0 ts=6a8ecb06 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ZteHwOODggqzs_94cHsA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260093

Add unit tests for expected warnings for trailing white-spaces in DTS
(there is only one for YAML files).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-style-selftest/bad/dts-trailing-ws.dts          | 8 ++++++++
 scripts/dtc/dt-style-selftest/expected/dts-trailing-ws.dts.txt | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/scripts/dtc/dt-style-selftest/bad/dts-trailing-ws.dts b/scripts/dtc/dt-style-selftest/bad/dts-trailing-ws.dts
new file mode 100644
index 000000000000..1eb24d91c640
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/dts-trailing-ws.dts
@@ -0,0 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/dts-v1/;
+
+/ {
+	compatible = "example,test-board";  
+	#address-cells = <1>;
+	#size-cells = <1>;
+};
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-trailing-ws.dts.txt b/scripts/dtc/dt-style-selftest/expected/dts-trailing-ws.dts.txt
new file mode 100644
index 000000000000..94d9ae9d616c
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/dts-trailing-ws.dts.txt
@@ -0,0 +1,2 @@
+# mode=relaxed
+bad/dts-trailing-ws.dts:5: [trailing-whitespace] trailing whitespace

-- 
2.53.0

