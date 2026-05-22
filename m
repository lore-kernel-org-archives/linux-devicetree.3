Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223FE3815D8
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 19:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779479673; cv=none; b=Idy7wm/2vSU2GjZilqTHJz3y4ugUmSUsb2Dja3k5SI0/qVtoKQmKQvB2PbgNrmT/nznyQ6e5ImOG4EMH3ysu+4oZqSWa/hZTqJpUimtteTMeyexZGwvZNhDS2q0XwlJ4Ba0Da01wBRCm/JmMiAgzN3o+BAGSGamD1m7WzdW6mY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779479673; c=relaxed/simple;
	bh=JXUWuqCkZu7GYMQoQ69purv+atgQKu2aoOG+jHJfnik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PJxiZGvvQDDocxJPBJwVFQkjuJ7GxtrWug3r6j3QvH6A8G/QKJzLhb8+G1VFislMiWU1jvwjuHR0EILfxZfTqij9nWaha9UCC55+zS7euO1ws8g+ZQ3h7Ej+H7U662/VrDEqNshS2TvlKuIT3mao+KytnyebkUlkubr2+3M1sok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W6wojpgM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WbOS7AI2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W6wojpgM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WbOS7AI2"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MIOggY4007089
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 19:54:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZqsC6K45RuJ
	1t1Xk2IH29zk7EoLruxipWMR0nOOkL7c=; b=W6wojpgMHFvodO2bjTqfpy+xS9x
	wH5ynEAWt9H9YO2CiKkkCU1Hchj5q589fntpEpq4cQ+1Q07t9NiG1hxkm+q6WPPC
	tdhgHs6pkJZumjkxsIXTyvD3qJp0mfWa6b0/qXC+3bcFtS4FV0/mOloiEovj6zSa
	Iqu0mklgDG+y6ygUv2SjboRUfJqZtBW06KbhAVXilNbigt0EPP3g/IX5eF5emJlL
	GwPDwJkujw9HPgqbdMoN6zsLBMPfn+RUQUiztUQIGBbJdbb0rRj6uDtUZ9oBj6Tc
	eJLGeIiKuEuuYzhVRa5Q0zwsDYAHWUP5BP8zB8XRnx0hHsyOK2dIw23Y+kQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eavd988vs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 19:54:31 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bc977e6aedso74885365ad.2
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 12:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779479671; x=1780084471; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZqsC6K45RuJ1t1Xk2IH29zk7EoLruxipWMR0nOOkL7c=;
        b=WbOS7AI2+HtkqTZpQcDQ64BGtLl2i1tRnAUGK5axzUw1cig+2U8kKvoPE4VzcM3wHb
         M5a4bYC+eASgzUiOe5ixTo6x6F9i0hIYe5yMMJRc5gZdGgBV5H5AmGbF9NrsCB9QT3gu
         IT3+06vnjTHvljQeE2jD+iihS6GOKT++f5j+JlfS0WvR9P34PdR0nmu89GGMbcqPnPPN
         KNetzPai65dRroUZq9uh9FfdL3099p/5U48HLkDbvR0gp9kEpCTVdewWKkoVw8eNeiFi
         1C0SZLqJrdvCJVWmFxtlG6ncYiRhCjHm8fbiQWhe7m3JA11TWLJ3ZSAFTpf9GTJBcSwu
         o+yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779479671; x=1780084471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZqsC6K45RuJ1t1Xk2IH29zk7EoLruxipWMR0nOOkL7c=;
        b=dwmJBP3pNfGF+gV+z2BGQKoTXjuXgQz7CMp6zIsiY+FOiFsbYvtIQv2Z6HkGXocZbC
         T6my0FJm16+SKKFIK+VH6pDpYz9W5jYso6MNAyT9+7lLw1vlaIG1ZpfrEvw8y3IarcpK
         9BomsHk340X9DCV4fYtMDDcN5s0zcOU4MG1WCzSBCfUdBVyGWKUgFGylMvuoCRfx+fiZ
         YFt1zXvn3vHBuqGBoE19T0udm+vpHiMm+V4AaeyUbAs528hV9sWQXxtrhVVRkjmA1Wyy
         LYyvDJpkL6qJ3KHRYLSMBunsQMhiuOstBgIXFE4T5JhF3ySDYUYwuLtYVRh2GLLsr5rb
         JJhw==
X-Forwarded-Encrypted: i=1; AFNElJ9CjbZM6mtZ+NjrbouYbPlLPEUWSuG5QiApY8gj9IjltUFM5mG9DPgeq1JFnje6RamP+vTupnocbvvt@vger.kernel.org
X-Gm-Message-State: AOJu0Yznya6jl3wY2bSJWKPYJeMtQHxBXPXrKJVeVb1h/7H8Jy4DWNFa
	dlnYzbEqoxw0noQ3jQOmkT6TCHoJUdDk/qngGfBoG+rbDLUSpRcS96uOcKR21ZH5/750EcHhVjV
	CZgu1syrX5KKLpgukT895CqXS4Wy2A8uDqc0MQy3P3gfoC7vKzkYeFapFsD808jKH
X-Gm-Gg: Acq92OEVrL1RvgXg/sIn6Ctq7VOtWUrQFhSjJ2sdbQT2bhHayGbT2rrLVnw9RZ3XZCL
	dEznzEpVIyUKVCYVci7BufKa8AO7mT7KsKKjaMHtAvXm1/VPgd63L9LC9Kkka4uNVtQx2CQ0ezY
	a1XGMVu6Spuemv/f5mvYU1xJK8ECpE0z1HXX0CoW8BP26KVS97CU6GBzH3MwhK9cGdcFIKiqWRx
	MmDaN2axMphV1pNOJqYUEVlpAXcaSJeikTGPSECKsxOpr2dJJO6uxxXIvWmGFSY2dqnpSofCRtH
	FYYxk7URKQr4d5v+/mRbkEsXP/18YVf2sW+EpwClR9DO3jkKPRjBm9SDnRHpkRU3IXX6J4tELJH
	WqIpLh7AeeWyS9BpIBbC0eHohhfErB3CbRLxDIW4IVOAefYzB
X-Received: by 2002:a17:903:19e8:b0:2bd:b6f4:4500 with SMTP id d9443c01a7336-2beb038c123mr54734805ad.11.1779479670764;
        Fri, 22 May 2026 12:54:30 -0700 (PDT)
X-Received: by 2002:a17:903:19e8:b0:2bd:b6f4:4500 with SMTP id d9443c01a7336-2beb038c123mr54734515ad.11.1779479670216;
        Fri, 22 May 2026 12:54:30 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695f05sm33541155ad.6.2026.05.22.12.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 12:54:29 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v3 07/18] arm64: dts: qcom: sa8775p: Add minidump SRAM config to SCM node
Date: Sat, 23 May 2026 01:19:58 +0530
Message-ID: <20260522195009.2961022-8-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
References: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE5OCBTYWx0ZWRfX9W2g+4yfs4YA
 VixW8WPALGkucy/KSfwhFLPr8CPSR1QLQunn0Kc8kBrw5vqKzt3DD42s8CRQnKbR8bqdzoUJ/gf
 Y+a9yA7v+8UA1ROeYjts4Ssb/MKpGZD2+F6DF34TDJGK3mPsF6LeNq38xsirpn0b/zWtV9nL/4O
 4tNsuBYXfisS7HSjvusRIV7QUbAtBIVGXYgXP2ka3FTY195igEvEHne16Sy3lkQKy2X66bIPlK8
 ktW80WIYJP2wEflQnDcSmfTlmXiHdyxp02+iAqsE8yri+iB+1H/Ni32nCFNYVJExWqXn2tzOlwK
 23I9SteAX1GzC4D7veLMzuHsYqXaRdGTPhGOwoGSEeZDK/bib7AXGYMzzdrozGTTWZCNx5cmkGl
 aXuC7PRDbUFqotI/IQPLN9QCaKUlx7RlRIPJbLCwOyrefLRswM2a9kA0C+wjwiLodTJ95HEHfdA
 FEFRkMVP4GCjKajHAzQ==
X-Proofpoint-GUID: 1j8aPcs1mg5wV1ewybkKO92QnN8zX6d6
X-Proofpoint-ORIG-GUID: 1j8aPcs1mg5wV1ewybkKO92QnN8zX6d6
X-Authority-Analysis: v=2.4 cv=F+dnsKhN c=1 sm=1 tr=0 ts=6a10b477 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=Y2DO1TD2eDIuzSEqJuEA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220198

Point the SCM node at the minidump config slot in the always-on SRAM.
Boot firmware reads this word before DDR is initialised on a warm reset
to decide where to deliver the minidump.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index bc7b4f65ad5e..634000fb22d4 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -524,6 +524,7 @@ firmware {
 		scm {
 			compatible = "qcom,scm-sa8775p", "qcom,scm";
 			qcom,dload-mode = <&tcsr 0x13000>;
+			sram = <&minidump_config>;
 		};
 	};
 
@@ -6817,6 +6818,10 @@ sram: sram@146d8000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
+			minidump_config: minidump-sram@1c {
+				reg = <0x1c 0x4>;
+			};
+
 			pil-reloc@94c {
 				compatible = "qcom,pil-reloc-info";
 				reg = <0x94c 0xc8>;
-- 
2.53.0

