Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2724A3F1AB0
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 11:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782472405; cv=none; b=AME/3rX8MrfuMxRoKog8IJ1EQVgVQQyDEr4zxBNG5+Qq2ksF+33SZIWjzBRHTRcMdCb34ls0lSnS+DCuiW++iHFDKN+Pcz8xIeAVWx5MCtuWeQ/zqcumXYwx99FgQOEQYPMUMfDURTckDFZCxn2yhsjhM+zofMgzNj6K9yJaokY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782472405; c=relaxed/simple;
	bh=qozuC7Is+ZCJZuPyF2xzQxbdLW/oCm/LscdAx2r0Xz4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SCP2Tkg6FuKTWzlymM5KzESoNFW1LHgMbAQEsPpE04X3WqvU5HD3x+XQxC9m2Uo9qkqxZOdl1aoKfxpJH0Rj8yqooq8XgT4cEqBMPZZcNFpU0vb76CHG5kNHJwtuYS6X8XMHPZ2p5tB6mMN5qdHKemKxNpUZztGvTAr+QPGxX+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C1Syo4uz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H1r2fBxC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C1Syo4uz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H1r2fBxC"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QAcjVt2239442
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 11:13:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7Bp4Y2VnZXk
	iDroJ1eKwlaAmIoOmqROTyYy2Kou57Ds=; b=C1Syo4uzs23K3huKDFuKYyJ8Dwf
	il3YGtZRX3yj12ahab9TknglnawwKnU9xwQzQcs7mNEGInmmyttkdCjr0mVkwaU4
	IoCs0839Xv8XUdNYPTFDpCfofOQ7Es9QNWcbjZLqW00aK5p38j239YERgbMffTN7
	uBOZpG8mj8E5iTSS4G8DpTI95SZiArCyL/SoZkrHnJQegYK3LpZVoKwl4ntnjT2v
	3CIVTVKwItPyI6WZJMWiK66fULQMMk+MH1OXl/jF4CAKX+bLZVve17n4o6WAoaS4
	ArNZb4afmeVUwP7sx+P3ucSxkaPDEWvxdHGD4EPOR0k+y9U/IW02Nhmy6pQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1fgc2303-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 11:13:21 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c8591a647b2so21131a12.1
        for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 04:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782472400; x=1783077200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7Bp4Y2VnZXkiDroJ1eKwlaAmIoOmqROTyYy2Kou57Ds=;
        b=H1r2fBxC6ltDonrlPeGx3qYsRwkfqI7ieFziCOBeyIbFUBKTbf7DCpuiC4dPMNywhG
         hzjDYXKB994okS/yjjNAiBPH552aQjg7ho++AU/QUdssOLdvHwT/2nCyjt5ZUqFPKWdQ
         NIHUoz78Ef7cb6O3a+8WDu8Xpusx6l2rTLAzIaII3uNyK3fbR6VozphUet2ItWcKNLeb
         H0yermwJbq30nLgvm4BRNNMzExMiwP2rm5mSKosRvRYwJS5+21QQCzOJrkwvOjwcc3pC
         MPhxyIyhPPmBHpDmIElTXM2UpOlCa6yGdu66GgzlStAa9BaBOUKNeqZVZ18mQGeEhu8y
         KO4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782472400; x=1783077200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7Bp4Y2VnZXkiDroJ1eKwlaAmIoOmqROTyYy2Kou57Ds=;
        b=iCTJp0mKzx0mcmDdW1/1PFCiwIRdTSMNgV4Vs9u6jNlavBtls3xqQiDP5MDdPSLRQP
         2qRso6v3otlMemPMP06rdps7IbjhAoY6PTdpKHZ+OBCoxn8pp5Osi01q2TRhQy5dSB2I
         CfuhZ+WJ9ntlJHd00PmtO1t9a6KvH7Gosc4/LQMi5jdIbyhqQL97oezoZ8r3yQtaDrza
         EtUpJP26XnuVXm0HSPLfEfMsJiITGBqgk53lUm4vvZIAd0t5k/QaYAjRK8GwXmfaQCj5
         EGqJlN/fwSNls9TjOLabSdwo4SBaqE/z/mSCEZ+wHgGyC/JWWSNZ7k67vDDPXh0ZxXgw
         lsxg==
X-Forwarded-Encrypted: i=1; AHgh+RoNNNVr0V5SJ0/Im2Fz8XNZ6lvBOBUjuoSLCbCS55IWn0ltHSplylQmpxc0FA93oK9NI9ytFVa/7+CE@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh8Kk1t7ShvMXUe7EevYgE06YJn7aOXLXlVm4TfzpqExM6ijZl
	vZS76zufZk+NpNBrnRp4OpwQ62c8g9NMgBcOm2NgI7rHK7/EcTv2Wz6KOuvDqupLTXeooBBEHhK
	PJaAOOWRZnFjVMp9SDlDFI+mHI7inH4MiaKoQ8u3etnjwPt/cBMMyjQc3S5cUKl0YNt1U3wBK
X-Gm-Gg: AfdE7clacavO860uIL+P80sNf/qyec9qPNGDOitcJANCUwYbCnFZjYon5NOD1rz+7p0
	wwKKrYrbX7XWlZkbcSs7jDHTfmktOmPXI2awDMjkOAU9AYBB4O6Zdx5WWjUjVrVg9ooUWr1nENM
	/EreyA3KPcC+d3MNt7IZUs5heJOcoqWRHv9Eae8ijTpuylZS57llbV4hYGRWeX82Q2/RAYCocyD
	Ib48gTw/XcnEZEtMDGsXUp0l1IvC8/+/vZW/Guosy8Dqjj428nwLYr6JiHVwZUEhqWD7J7InKSy
	Bscj0l888ziC7SSogRkthaX+I89p5Xr4FbdccE36EPc9xR5pXMRDIRUaERCLun6a3nihINQq2Mf
	hDxf+EruSrKm+UkR+AuWOyEULoZHGx+5wH/fHK7ng6Q==
X-Received: by 2002:a05:6a00:ccd:b0:834:deda:c7b5 with SMTP id d2e1a72fcca58-845b3ae2b18mr3598966b3a.4.1782472400580;
        Fri, 26 Jun 2026 04:13:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:ccd:b0:834:deda:c7b5 with SMTP id d2e1a72fcca58-845b3ae2b18mr3598951b3a.4.1782472400121;
        Fri, 26 Jun 2026 04:13:20 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845c7c935f6sm1097384b3a.19.2026.06.26.04.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 04:13:19 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, umang.chheda@oss.qualcomm.com,
        mohd.anwar@oss.qualcomm.com, krishna.chundru@oss.qualcomm.com,
        monish.chunara@oss.qualcomm.com
Subject: [PATCH v5 3/3] arm64: dts: qcom: monaco-ac-evk: Add IFP mezzanine
Date: Fri, 26 Jun 2026 16:43:01 +0530
Message-Id: <20260626111301.3479559-4-umang.chheda@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260626111301.3479559-1-umang.chheda@oss.qualcomm.com>
References: <20260626111301.3479559-1-umang.chheda@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA5MCBTYWx0ZWRfXwmG3qexURcNV
 hvtQDlLKoZJORcpn0floe+Xg7piibElbrzHZfLyLmIO0nwEQpF+1pnpNjoLhMBq8sezmMSzZAv2
 Hhy3bppLLtYc6FfsIQy3nG/dvzHga7Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA5MCBTYWx0ZWRfXxuyCoAmQ0H8K
 mDjkPEMnkoKhseVTSD1sSgHWClVOAx8JEUgu5SoXr3dtzRGoRT66CBAgX4GewhRkMER9xVL6LBj
 sEgKkKNAE9dGRVxlsTzrRNIaK2dxIJFMpfrRc+tcO91IGIb7fhmath2W3v4yurwzQF9hiHF531B
 WENG0TRJyjEbrsMXHcuv8R3LPVgYAQwLrWTQaOML5KZmEpspvg2E6DceYePu23hwla4bjsKg0tx
 OGoUkQbGJaVdTlyhfMc+5+XZm9lTkqVjcvPcNOWjF06F5LtACAgDYuU7hRzQ1rym1MDK1MhLb4A
 wypXuO+1U7PrlcQL9p2yKFrYvA28CXT0fq1ATyhZ1eoOw4KBrF0jAMoqOEr6mx4KHb6yGoTEtHY
 7LYxUcOteG1VMmlB2KiflavIytxf5pUamMJD0tenybNpkH0MVgHxuD3rim5UJE3GWXLnGKpQaLR
 nviIf2wkJcyclApxsXw==
X-Authority-Analysis: v=2.4 cv=O4oJeh9W c=1 sm=1 tr=0 ts=6a3e5ed1 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=stt3cGQ3O19xYmmBwvQA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: hQsC3QmXw2sws0g5hS7k8OecPVXV4-tC
X-Proofpoint-GUID: hQsC3QmXw2sws0g5hS7k8OecPVXV4-tC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606260090

monaco-ac-evk board supports monaco-evk-ifp-mezzanine attach.

Add combined DTB for the same by merging monaco-ac-evk.dtb with
monaco-evk-ifp-mezzanine overlay.

Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 90da4a3d4e33..97d8d5daba65 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -67,6 +67,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-camera-imx577.dtb

 monaco-evk-el2-dtbs := monaco-evk.dtb monaco-el2.dtbo

+monaco-ac-evk-ifp-mezzanine-dtbs	:= monaco-ac-evk.dtb monaco-evk-ifp-mezzanine.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= monaco-ac-evk-ifp-mezzanine.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-el2.dtb
 monaco-evk-ifp-mezzanine-dtbs	:= monaco-evk.dtb monaco-evk-ifp-mezzanine.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-ifp-mezzanine.dtb
--
2.34.1

