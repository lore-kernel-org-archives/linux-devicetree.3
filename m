Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D5A50E5B3
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 10:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790677925; cv=none; b=ZLwt88CFE2TrgAiCxoysvqD6U1L87aT5tqZ3eT2zbVODNUlUsA6kyICI5UuYXcDrAiRVkrNeaI1FzAp2yOo/D/0xm5l/es1vpZfrzl3h+p4CqhJbrpSoa/otGL1jAJ/ajQFOj4mdJFzNhgMjwjvAwq0oVwSvhRQRTm4YBdv0lUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790677925; c=relaxed/simple;
	bh=IH5VHP8PlJx1l0p+Guv+UYdwTidwqn/CA/t4WgQLJ6M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lv1JsJw3KCFugODuXGdgilmxqFncpzrDali/hklFgrEqzJnabLhc73alZWJIDWYYO7NmXQWln3hOpBrkf4Q6UK43ppM9/khhMGulAvTBLGocZw4c3bDbu94uKD23pqAnsm2SAHjyzYZp5Eg+jjjNHnmPklKbw79p/goPk+t932o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R4WWFITE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V6Rch51m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R4WWFITE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V6Rch51m"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T7TZIi760475
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 10:31:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PaGcr6dPkxjT8OOUNQPS0fduIi0Haz1qrdIAgjta42Q=; b=R4WWFITEKb+ehCNn
	JjHEHKjyz2o5nSM4yvI9WTO14syJC9mFAwC9eTjA+CppFd1mEYhhKm3jwGdv8tie
	3Ttz/+ictCsDKm/UYV+stCnsKxAujVDVTd0vnN+FBPLmqmC2n907IDg3tvTIVbg+
	oFNSAOJbA+tRaB8JYfAEYJFUK01DpVIziu/tkC0ru1iCywBvD06MY5MGuxyIrpWn
	EAps2FxGNuhhKhf7/7DCfDXtlLmeekVZ3XgDA7UcdBOWFb4+JPAjh5CCiVUvskBP
	HchiAjLGnQa94m9D8jdRTdCETxwODDKYkHda21/G4kZaGitA4sn7BiDZYgyUdAhi
	Z4fPTQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyw03kgwu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 10:31:38 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc51591102fso2821908a12.1
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 03:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790677897; x=1791282697; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PaGcr6dPkxjT8OOUNQPS0fduIi0Haz1qrdIAgjta42Q=;
        b=V6Rch51m2/e1HmRcM6wxxbRsiLDCGDBwS8MPoupG+dVCPl9vxrR9pXhRVeEqJkopL9
         DBa228+MZcfG/OjWGDWPQE0eBqbICH0DVQ6EQk+3hkDjPrA+xpQdee1QBXQ/iRVpH3dK
         oSBK8rrMBvUb97jb9zvE+mEj8vMxrdpkqN50v1znfoKoOy28EN1jts3T+azGHlTFR0Kb
         u8aBTPhnTPaYN4/+m8Qz8ylWgPXAz2a05vsXTBGAhhQref7zcuWwZXBOz2J+CzLBLB8J
         uE3BkfPgwszPKG+U+Bsprfu2k6RZqUgpF68V3qJeSPfI1q0Bm4yWs64nxyO3Lqa3Tp1U
         WjGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790677897; x=1791282697;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PaGcr6dPkxjT8OOUNQPS0fduIi0Haz1qrdIAgjta42Q=;
        b=ItL2KUpppJpAZzPjYjKidW/UfY1f1OwdwnWzU7HCmHOcn3+E79Yb4MqyWuDznBX1IP
         CQzzALWVMrtTXtywY64F1j/6rwHSF/eWf3FsDcO6yZ3XAfFkuoLOEQWmqE59XyxHCtHp
         QzxkYth1VVMGsdS1XmTtDk76rd/TRHrFRVEtJ0gvS1y141l8EPV+gnPXh9H6WZYBEzLG
         lAqz1gCFSBAp3rHWZtPbcP0wDzBV4fdiNhbXZfWkrOYaJishS0mPk+gLVJPaTFCXEcmb
         uHrIVLC9vVYImFbG19jFp/8tbeCa5FQAmEmiuDoCk6mN+MgyIfIkV8b0AGWPmKntmRsS
         4LcQ==
X-Forwarded-Encrypted: i=1; AKwUvBwPIRzx1H7EbeFlDAbiCyXeyKWsIcztuszfjWltrIEq0fUDbdFQoE7lxo1P+S/q2rIneHrdbUVw3l17@vger.kernel.org
X-Gm-Message-State: AFq9FYLy8u9B9lu6thfrlGjAgyTNAW/WFnTXBOkimrwm86jvmUnsMXAB
	G3+oFibLRhNp12Zi2x78yftwL2pmc41BiITGueRlBmRCpiB7iTQ6RFt+bBA08NfcZ9tDD6s5PTv
	w/Que/Qmd/plTE/C+8CH+XWUrvoadcTmJ2kWkjflDn9b/WylS9UncptS3/NfEwUcJ
X-Gm-Gg: AYBFou0sLgGwiCFYERYSLsHaEsOj7zwaj8nXwPEi0bDEJRGdQ9Fr5zVpej648xwG837
	U0dGRTq/tJmLmRdPu1v4/5rMFQbaLzJd/wj22wY5A1uUqS0BWw4oovwpF9NW/crHU+nnVq2QBrw
	Ki3OHzr0YrO+Qkl+lZqykQryG17PHaeblqfBMmdIre7vWHQnUaCTV6IZqrdaePB0Wd6pSUJioWf
	EGC+GfQhDXsKXwI+cS4YONLjUEtfhc/ft12JGpPQsdO/jV+YtHWUbJijZUCGEkCMN8rAn39MHnj
	6WaMKtaqd9LFLpGWD44CqNHpVgR99fECKg9/+n+5V3GApgCUUpBl+d7wOMwKwTU/6d64eBZIq7R
	fVVLXpNFkNJrz5Q==
X-Received: by 2002:a17:90a:716:b0:3a4:a054:3d24 with SMTP id 98e67ed59e1d1-3a4a0544638mr1037493a91.60.1790677897418;
        Tue, 29 Sep 2026 03:31:37 -0700 (PDT)
X-Received: by 2002:a17:90a:716:b0:3a4:a054:3d24 with SMTP id 98e67ed59e1d1-3a4a0544638mr1037477a91.60.1790677896971;
        Tue, 29 Sep 2026 03:31:36 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a492dfc5absm2470791a91.3.2026.09.29.03.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 03:31:36 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 16:01:22 +0530
Subject: [PATCH 2/2] arm64: dts: qcom: sm8750: Add watchdog node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-sm8750-watchdog-v1-2-ea06d5dc7e54@oss.qualcomm.com>
References: <20260929-sm8750-watchdog-v1-0-ea06d5dc7e54@oss.qualcomm.com>
In-Reply-To: <20260929-sm8750-watchdog-v1-0-ea06d5dc7e54@oss.qualcomm.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790677883; l=842;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=IH5VHP8PlJx1l0p+Guv+UYdwTidwqn/CA/t4WgQLJ6M=;
 b=mNr/z8bk5wr+wP+42cFBtlNK9/4qCofqS1YEA5f51Ao/KAtZXXOyEqMj4hgh8wtlZWmBiqq7u
 tV+3x/3phAmCEltZEVJU8V4jf22bagHdkN9dPT3kFBkBR9Kcjdv9EkX
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA0MSBTYWx0ZWRfX2fTqcPQ6SCIK
 ///kyTvmJVQ3YbvtEosxo0RXf/td4THCVlAarnolUg1N4lKOT8qMjVitaAs0RYcrcRQF+vwf06D
 NTS4yH35AjYzn62CZ342zu6aCBFHLog=
X-Authority-Analysis: v=2.4 cv=SIbXx+vH c=1 sm=1 tr=0 ts=6abb938a cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=kZvZsOVO2oU7rQrdTw8A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA0MSBTYWx0ZWRfXw4kEmaGuS4gu
 b84GkzqAKLcJJGevkIBrFiffaC9EruhzBDHspRXd43BDup5Tlrj/QFho531i8a9+vh02Ddmbp5H
 z97FWImeE5RbomYiitd8GWI4FVOf0UvfoEjnF0WCH/h8z9EmNklWw7pANbwlBuxKYOKKcWZjibU
 TLK8ac2i5yMUX3NhIGvwuJQtLvgq4ZDQNkDTyMCZKvHKsYrCQ9/D8OIq7VmhSEWadeRT7EHKjAK
 w6gsiDqisy/4C32fDFKhMl6cYGwppCHMKh8IgxnvoqWMsyMvqGpDkZadMa06V8d4tKH6rYLBwmh
 CW9vmzOHjeUEnGexNoAoGeR5MmrwcPpl18JF+qh0LPr48KTMAxnVB5HZShsfa+jMUUiP4+FBsbY
 lWKkJp25AZ7putU3scaT4ASdv7ABFZ/1YiaSDThPDnsT/vwI7sGcaJvdgv7VdtHvUsjAqB8S2IZ
 GOMlNLyIztIrrHTZn1A==
X-Proofpoint-GUID: BQIV8YMALg9T0ASAtjqtpL_yZZpovep9
X-Proofpoint-ORIG-GUID: BQIV8YMALg9T0ASAtjqtpL_yZZpovep9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290041

Add a node for the watchdog on the SM8750 SoC.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 8ed5fa4d24fc..53125e5dc4cc 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -6006,6 +6006,13 @@ cpucp_mbox: mailbox@16430000 {
 			#mbox-cells = <1>;
 		};
 
+		watchdog@16410000 {
+			compatible = "qcom,apss-wdt-sm8750", "qcom,kpss-wdt";
+			reg = <0x0 0x16410000 0x0 0x1000>;
+			clocks = <&sleep_clk>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>;
+		};
+
 		apps_rsc: rsc@16500000 {
 			compatible = "qcom,rpmh-rsc";
 			reg = <0x0 0x16500000 0x0 0x10000>,

-- 
2.34.1

