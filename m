Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4A9411A04
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572506; cv=none; b=D1gbe+LywRFoZXr1lPWrat3FqpV64TlsFkJUY1YSZdhxKn43Yq4nOEFlTA9W2gzhkYC80++wExRLYH3RjI1urpucVMk4BkJFk0aybHarjGx+s1UDEzRCUf4SJZOkBZC0l+Sj2WliZUm47mClIRiRaNs6xhn1a5Cwfq8zJRRqf9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572506; c=relaxed/simple;
	bh=yHkArQEhwJqq85ZOnDKd0QXWMauHDprOTAf3+s0+ug4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SV0EByO644mqd41gSdi5TY21mlstIx8z1Y824NuQjJx9p3WGSmlsrLeELHActVrDuJ5Q5BfYj5Zdj48IXct8J2gYC4xFakccCwOdt6rXTG/fUtkardoMlQ85lWMtpWCsXRxRiwTds0iRfJumsbzCyTptYqkggd142SjrCKy/eaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EfxqYtE9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fd7eNtmr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EfxqYtE9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fd7eNtmr"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMd7r3194977
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:55:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NrSB/fAC0Fl9q+cTIg6QyU7PpT1fGiPMuMV14aKjxc4=; b=EfxqYtE9iu0kcbph
	FBsi55IvVhDh/XbYrB4XmnfRf4t8n2LbgRBsXd+i/aZyk7WMnI4D1ShWnFhdJiKl
	7S0GtyrEezPuJ+JiTTPtFmuw1UJkfXEl4d3dyNWAvqe53y/aM7Hm8HVsb6EeT2Nf
	Qsj8inRnLdy3zDbFqDJXPwwxSuYnBYwotPzxYYhRbkD17jE74LGy58ZbzStnTf2b
	zs2zITOgA/wf77v5jg2HDSvRSXQkpBE1xEZ1xRAS2sg8HVYvrxBfqe3lpc2s7UWo
	evaz+es9hau3Vx6iIkAKLfoiE6zaORzWlm7vxrbSfjkpQgvbFW1YiT46DDXPP14k
	LcD4mg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8hjgs2sa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:55:01 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52d9cef8d15so63869371cf.0
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 04:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572501; x=1788177301; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NrSB/fAC0Fl9q+cTIg6QyU7PpT1fGiPMuMV14aKjxc4=;
        b=fd7eNtmrVQFCqfwCWDxI278tigG10uhP5Y0wVuc4kez33NK+FSUklY542eCfjR3BX/
         SAY+kRg8D9cogxfKW/7dfJfPD/JTZbntEH9vBBKB7Nklle92gsqpQkU8RAb5cP/IFAUx
         nISEGy+4AFt2awknoAWXMeEHism4PuNrsF3DVEf3f3LbLvJIvHoAM7lDXFF6Bq2Iqv5M
         cHrH6SBPnrvaWvfvWX0EkAPxTwXZA2/t9sXxU7xCuGqkyuvR8RL/9qs5uxzrq5A5kNun
         MYL3FQWpNeCI+FR90OvewxxVkf6ZVUaDhoh1K9aF/ipR4vlcNJw4ho/qx7bsNVMxQfI1
         48vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572501; x=1788177301;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NrSB/fAC0Fl9q+cTIg6QyU7PpT1fGiPMuMV14aKjxc4=;
        b=h9Cf8qDifq2yCfFYQg0BciYowBRNi+dSoQlhfZVwjWu8Q+04Ty79Wxc7qCkweP2ONQ
         739UOXG890dM1gLXuNt0Xb8fgcAoZzUAvavGG630ew5jofhuRTOeh8rDEne7gtSgn+C5
         wK3eN8dOF78X+5y9y+QWtHBB+T+WcKJatJKD5RCJT0F5MP0hK89uyViHsiygwQm4wLp9
         KPsNZcMZV4JPqmqkthlpbK4F0WaLjPSml+GeSczWFykEaeL3KCbndivngInfIUNu4e44
         VISO3JEVa2qthU04fL9vAbiBAVQeupTvT95J3lPIoJG1IWH1qXW26knfTboridoYo4mz
         XuMQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrxv6MJAFKkMh6rLxWgD2RHcM+zdSL9QRKTZEdxn7OxK54+jVWYhzH+bkg3Tu1nhyqOx4ovl1x4dcRZ@vger.kernel.org
X-Gm-Message-State: AFuF++mLtnAor9S78HynUtMH/rhdpKkL8fX0aE0yjARz2ravLYRIPhWN
	bJ4JSMHyjn7DkVOpkqdLYBGew7BA25J6zRSkd131ZAlqDFCUld82Dq/QJw/pT/3/aF9+aUAa+gV
	uxLTLaoK+rhmMO4vN1N+X2TLiN096W6K/GFt3QiScbNcD0k/C9ySpuf11MEnOmdSD
X-Gm-Gg: AR+sD12EOVSVVaclH3R+3QWaDyUKddd8Rmq5KNY6F7vtTxdJoRmW056uvkYht/+NUbi
	aq9R+EEyPLZfxnRbIxusZYChLuOiIoj99Bcs2SNaiKPX1PcK9pK8ow2z86WBzf5A2Mdmshv8fmv
	trLeK/SKxMm02Br/Ydxjad2ebCRWvUDIbiJ1MJOBuEHA/ZKl3xONF+8PcG+EbBmiRAWwI+JENIA
	/kZddN+ai0HpsjQpgj8iYB9nOQNwWO6ZbaoQaIuewMRAlB3BS43wmfurW6Syb7zglrhGnf1zB2l
	6KhDzSqlo6eJt3ZMfCbByCr7gMohumbjQSnjqTvgarrQTQo9AH/khnQ4RdF0TKLQYVuxBwKMhuW
	PN/22THWa
X-Received: by 2002:a05:622a:314:b0:51c:981:94a6 with SMTP id d75a77b69052e-52e09cabcedmr173156961cf.23.1787572500618;
        Mon, 24 Aug 2026 04:55:00 -0700 (PDT)
X-Received: by 2002:a05:622a:314:b0:51c:981:94a6 with SMTP id d75a77b69052e-52e09cabcedmr173156541cf.23.1787572500118;
        Mon, 24 Aug 2026 04:55:00 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:54:59 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:53:52 +0300
Subject: [PATCH v3 05/47] dt-bindings: clock: qcom: gcc-sm8450: Add CX
 power domain
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-5-f1205a92682b@oss.qualcomm.com>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
In-Reply-To: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1706;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=yHkArQEhwJqq85ZOnDKd0QXWMauHDprOTAf3+s0+ug4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDDaVsHMUtSwLOrfAcpVYNRmFLpGyrR+vGMQt
 YaavLm8ZTCJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoww2gAKCRAbX0TJAJUV
 VqYsEACXZWZMSpE/Z1V497gTDxZAB5/SgcJX5hR71gPfsuhjwA5bqvw0DrXSKpbZBqTE1Ro3myK
 KraIwUZtRY/5K33A7HoEG8RMnAWnau8nb9Gw/cg0vR3S2mt2G4WOiWzfjWj06ZmseCHXRxpDRec
 hFfpLob+v7G67rqFXJ/hTBagz9+B6aNYdO5gajnAD2DDjzUxDGcpshAihHBltZXWE7NIMSilDhk
 AdgI/x0tTRtYezLBFvPL0tfcFjNh1dQqUZetX9ys9wWr8EuJ09TPBi5h0HUAOS3LjTusW/UHE95
 FfiDDanqB24ambq2d82mOTOVgYLIUTEhksX6XaByvAdv53w70AJN5R/133x/aGFtsJVz4i3f5SL
 rHkTw3V7U2J2Q1r/cVO6Y5zkwUPlSBxblOdFkdbvxgNq++7jD6DcuemU/6BCo95AxLTpsncJqi6
 2IWPHPyftrG/3+Pl+13Q6o6HVYEf4ZKA7ckE4LgfVquCNhRhMxiX+WbsphK3YxHV/gK2DBBzjtU
 r427B9vE4zqmoJJjarfeTyNer+iQNtVYuyMfDaAggiM2NduXfKLvY5w75R43Dg8bLgeZb2s0P1n
 Xl/KKE7+lRx+0qe48dGQ6sIqk/WGmztDsfAny3FrrlP4l3ifn+7YrY+nDUseICPMxNao/Hx8nYi
 F4cJIqRxe+8hpgg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX2N7WdZ+07qJP
 8lZhtaSqA7IdudMTmSyQg8ZHp45IjmGRKh5pUO3NI02c6rt4ik9hxIWTtOhH9uaR63ZbXJ+7wMp
 f338ttY3p9P/hnU3zFsvcLHdNOwqj9g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfXw0EOuUlrOycK
 LHjZorM08gXxGKTC4kUI/jgDw6bCBi3Cr32UOMf9GzW1Gb8D2jprgpcREY0BKhKNll32MAuOkXm
 BZOFSb+AYj7fH7F2rmHnjYFeJre8UWZTGaYjXlKOZ+NkItwtsORPMcFONRiYJPv4vcoPh4IrtY4
 IPijm6C0GXeRX24GTzDFjPeVl5jNenQq3nNBDGpmRfflCYzcYBkqV+kaUSdf/Zv90kCdNdlmcjf
 3uHP3+YKnwc4UBXBoZu6tG7cXuWixMLcw2K0RV0lqnKfffWIhnNT1XPHKns4v+Mzv0/M9RK24Ag
 zi+mJK6u1+l+6e7RhvGgp2/ovUc6+edVWq5MW0JD4f2Yr4tq2uXPbXsmfngKP4FuyUwaHtKq2m1
 5n85uCn/H5QoeLcHIbn9Etl71geJREukHQ3Fgg434HDvr+dPrM0YaFACpBtQKf64PKnyR/uy3k3
 NXnCX2hOIhSGDklbAoA==
X-Proofpoint-ORIG-GUID: SYIohDcjsXWC41fOXVe9lCLdwcrRL0ko
X-Authority-Analysis: v=2.4 cv=CoCPtH4D c=1 sm=1 tr=0 ts=6a8c3115 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=1VWmMwf-hiIXLgPH03YA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: SYIohDcjsXWC41fOXVe9lCLdwcrRL0ko
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240099

The GDSCs provided by the SM8450 GCC are supplied by the RPMh CX power
domain. Model that parent domain in the GCC binding so the provider can
describe the dependency in devicetree.

Add a single CX power-domain entry to the binding and make it required,
matching the hardware description needed by the GCC node.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml
index 3169ac05e1d8..f6f73db26896 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml
@@ -47,10 +47,16 @@ properties:
       - const: usb3_phy_wrapper_gcc_usb30_pipe_clk # Optional clock
     minItems: 2
 
+  power-domains:
+    description:
+      A phandle and PM domain specifier for the CX power domain.
+    maxItems: 1
+
 required:
   - compatible
   - clocks
   - clock-names
+  - power-domains
   - '#power-domain-cells'
 
 allOf:
@@ -61,11 +67,13 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
     clock-controller@100000 {
       compatible = "qcom,gcc-sm8450";
       reg = <0x00100000 0x001f4200>;
       clocks = <&rpmhcc RPMH_CXO_CLK>, <&sleep_clk>;
       clock-names = "bi_tcxo", "sleep_clk";
+      power-domains = <&rpmhpd RPMHPD_CX>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.54.0

