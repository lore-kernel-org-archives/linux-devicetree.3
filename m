Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B783BA222
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 11:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783077240; cv=none; b=MfRrup4w57CLIGJVFC824o6rJ8wBWQy0JsYJ02JC3fwk1jwi0SLYR4W4k7kE/IrROXYPKDLitK5c8s5As8NKP/Y9TPYvwTY/FuMA5jBu6prLEuFuJLyRazIZnOR0YvJGTCVzI+lOSw64HK9lTlXPwFyPRS4yApUtpMi/wOcYocU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783077240; c=relaxed/simple;
	bh=eUR1ZhMyDA3A7UIWzFyJqoSdZNJXxJylHr+xBgv7EEM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ca8nzgxwfMO26z4mJYiK13o6v98QAwpEzZUQSyfgI0zR7rm4nbb21STUe0IjIdrr6ZGgwNp7vWEaej7LzvUyxjNnnEiHdcMCxxu33pdKKAH0hNVhwkar0MFC1OSSiWae6oXyMmathJdtEVOPPV+uB3dzl1ldrL6A9QRxM83IRf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nHXwZyYq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yn8ErU8J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nHXwZyYq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yn8ErU8J"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663684hX3053370
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 11:13:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tb/arBz5/zJZCD+IeMFyoWBOsYq0JoqUHeSRt4cbXiY=; b=nHXwZyYqZ7ZyZozj
	PhsIo0k13FKtALYVq8J60JFLXvqtZ+ptfRnl7kuPv1II2vrJtNBhhsVYD5iea1J8
	mTDIBiAcYIiK8KZg1SYvR1uuqBhrZki6pKayNFu7cLcaPl/Yo2hlp5gj+HIv47jU
	MboSZ5IqCwnaJpvtngZUVtiMjWmbytCeYAKkRhuXiJd/N+r7yVErv8HANF8c6AYV
	XM5IovbwvrAhQHW7kWPRYuVPVPepFYwtbRB5rLuwumkOMd7GKxMoqvR+zoUOvi/F
	JalDf14AfXWhLPeT7+Z/UTzi4fzgVTD5upfUQXd3z8eJKOnQUf+tPHIaKHluTrH1
	PWPfSg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f67j013wy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 11:13:56 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-847b8d76e3dso835693b3a.1
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 04:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783077236; x=1783682036; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tb/arBz5/zJZCD+IeMFyoWBOsYq0JoqUHeSRt4cbXiY=;
        b=Yn8ErU8JeQvDCAaoxBN1PPTPx2uidledldRHctAnHU5uk+iYsIci8Ij0eQuGLfUL5m
         bCKXBfHE9VOqqpN8iRNHNtqO6IuMgHAw1CdpOa50+YpjCEDM5PEBi0snsXEPHGej/EeQ
         GplEUn42zjZ0dEQG9ZV12RRiy/OeCGrtQ8X5R5gKInngvL/kXDVPtGW+cTr01nyHzimw
         SGaS2HIVIcZWKJwdHLmgknHqK89WsP9ZQvOCEltjBkAwlOjG0QiaEiLfG6JlBagFpxyO
         5tGHuZo4e7q9tnq71VoisM/4mt1E9dX0XDD9l+eMvDnl8O5C8oTtFeBjHoc4l3OZtFiw
         s+Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783077236; x=1783682036;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tb/arBz5/zJZCD+IeMFyoWBOsYq0JoqUHeSRt4cbXiY=;
        b=UWGb7ssbaY/WgMUt5MqtEaR4mU+ey1ynuaELkSm+ue6K0AZWRx5Ik1TErZqq57LJcb
         RjFTWaC5s6zSGIrvJD41wKKC53/x/INYxWSyKU8Y1X29aAB/ds2UywqPTo2TA+dnhx0U
         eUIm0e2054VhE2LWD+4bKfxHaNzCc3Rv6yImyocwRBpB2ZP4CZdxrUZz3dl2FXEmjX+y
         Ohun9LptOrSMJeVqxR3Lo2gUb3l1YmitQAndkZjKEg+/rsREQPIvXX0wK2hW2wbaQfkq
         fyHRo5FofcdBJRqq9BWaeyIp5pTw8Zx/i3CszKZS+XetXK90G5bnJJDiI7B/OBIqVjpC
         FN+w==
X-Forwarded-Encrypted: i=1; AHgh+RoE+oKlnOyNWdcOtdtNjBiKkO1L/qRf3wS4gtgcFSCudrQWOnv1EP16FP8ApaKXrMuDfKmbwl57bfSK@vger.kernel.org
X-Gm-Message-State: AOJu0YwOOrb0+xH3z5lM2TeYhqB45E6xG+CdC5dmEKMTwP6AjVZ/4S+C
	+gHshX6U3YmyJDI5c8GryxNoQkl8BbzdMKdSBx1slk1bxYVOobjVToDpUg+w9HEVNGGFFQWMDcA
	kiAAmRma3BlEc+wwHeV14I1jzRJdyrlaVjYhCrUXr643kvBKVN9qX12AhJ82/VQDGxpqRBSCQ
X-Gm-Gg: AfdE7cnmcypkSl4MTJTMfGUflBDNp+Weub25n0DuPd3MPDKwfVb4p+AIcYmzmyq17uj
	nAwKoMlu7Lkmy+OFKC+tPDxPi3TJhMvkBvbGYEQm3xJy12liKrx5J5JxNpi4knDjqQAYdixVNDb
	TS+7pfep0nKLmQJjZCPd62SEI54e1SmwakcR2qnC4cCqXWBE1c5kA5y0mRl0dBxApn/teVULn5l
	mE3Xunmo3qJqiUbj1qpGjLoPiABjZ1kMEzB2It18OsXmVRW+BSCC1KiL4E7Ey1j8nG2sTq+D71e
	4AoTRR0y24mUh5Tp4UZtVCbbNvrjxgIBYxVE1G9B7CgPwAd3TOV/XfgAQ9tVEfeCHZ0yVW3bmdQ
	2Rpf9XxN/bLYqMiI4LDuK3zpdA971/3/bFJgNLf3v
X-Received: by 2002:a05:6a00:4516:b0:842:5a8d:303a with SMTP id d2e1a72fcca58-847c0950567mr10109291b3a.37.1783077236069;
        Fri, 03 Jul 2026 04:13:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:4516:b0:842:5a8d:303a with SMTP id d2e1a72fcca58-847c0950567mr10109262b3a.37.1783077235580;
        Fri, 03 Jul 2026 04:13:55 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb94b3e6sm2729490b3a.33.2026.07.03.04.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:13:55 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 16:43:41 +0530
Subject: [PATCH 1/3] dt-bindings: soc: qcom: stats: Add compatible for
 Shikra
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-shikra_stats-v1-1-0aa0ec1fa83e@oss.qualcomm.com>
References: <20260703-shikra_stats-v1-0-0aa0ec1fa83e@oss.qualcomm.com>
In-Reply-To: <20260703-shikra_stats-v1-0-0aa0ec1fa83e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maulik Shah <quic_mkshah@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783077228; l=775;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=eUR1ZhMyDA3A7UIWzFyJqoSdZNJXxJylHr+xBgv7EEM=;
 b=pIJKPuGZA/eZG7DyeW2qWQF3Ho7Bc+k1kONKvATjRrf0dFcCI/C7bgqRzL8MytFqxI+ZFKil7
 kku1rDB6QvJDObCwYqhUvZ09361baGKtvgUdkI0EZBExbv0VdGXvVL0
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-GUID: M1fa1iyi-0he2ZWDWASlL_1X6Lf8_h5Q
X-Proofpoint-ORIG-GUID: M1fa1iyi-0he2ZWDWASlL_1X6Lf8_h5Q
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEwOSBTYWx0ZWRfX2PHbDv837YCf
 8Ak8rCyipwjPfYTFLAMuUGYSG6HQji+0+PsPelmlX6uul44MG9NtbWciM+OVNGwRqfC/oppJ5gh
 9DU7I/tp1h21jYupReg4ehoxez2jSyo=
X-Authority-Analysis: v=2.4 cv=Yuc/gYYX c=1 sm=1 tr=0 ts=6a479974 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=TNscMaw5zNdbRDkxZCEA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEwOSBTYWx0ZWRfX1TsZA95p4M7M
 EmPKwx8EwhJ18bKxekXNmBHux5CbFSV+0fK1yPBDqozp1tG0aK4ihyuWE2gWLcjAsvBQyUt2lCk
 /gDngXIbVXfqD68LoiHfTWSfHd9joIakgNqyAL/tmFQquFj6Vvlve0k+OR/PYaUdWn+e5iprhIS
 HqcySjBt61Nvhy2ZoDFSxxQDY/5vGByUPFa4Gl2mdd+XeG9i8b9+lLLejfuNlqDDX9WmCZPhy0w
 9e5OXHlC/jmPCB9omJ9LqeHd5wE1Q/kSocWu5LjNziippj/GPuhSw1lpLGcJfXEZPyDrlyfF+M2
 XevmCU/N/fBwlN4plpdEz+cY2tCAF57JJQ2JjPDk2440bij8a0Gxkv09JBjqrjjmNV5oTSxqYvx
 qYpsvjzWfeyl6DhFQ8zHPg7ZoYxP7TK3P0k4XGexs7AKjVcO6whYVatbHAzEJ/qfdrsExzxQT2T
 8MS5D/oRKPo8kS7qIaw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030109

Document the compatible for Shikra.

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml
index 686a7ef2f48af11a0e63904ff979e40d7538de65..43751115c5b4e2943c93d37d3e27c839b4057529 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml
@@ -27,6 +27,7 @@ properties:
       - qcom,msm8226-rpm-stats
       - qcom,msm8916-rpm-stats
       - qcom,msm8974-rpm-stats
+      - qcom,shikra-rpm-stats
 
   reg:
     maxItems: 1

-- 
2.34.1

