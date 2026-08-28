Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF4A3CAE75
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 06:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787896848; cv=none; b=oql8299Ht7gr44R1KvZS1hUHl245Xp1LKPSAnUJAohsTBcAfWjbW4I33WZAqasKonhqzJxzCDuQe3hBh3alhkCVqesvc4hkFzX8xKGpz0LkFgIzM2yjswV/SL3jzlKqo7brn3I2IEDHsLa/Dkt+879owN50GER1G2JqCPPtROqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787896848; c=relaxed/simple;
	bh=hUgMZ4VN5Liy3X8evZo89cfzTiLq5GALmn3wgJjAQis=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WF/GCoSUUh5rGpkui28HEay1h4aoFKBGsUPSPjBTQqLEdtCUifGv7D0WFq+kE4Fa6YJTz7D29SooroFEOUQOrl1PrOLdsXYDGBATTxNzXnOw51jfeg6w2BuM7UbkrN/LEEONGB6XDD/CuGrwBfHdNrnUNC7BR/DRzp9mrfcTy0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bLk/gk3n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I2udG6A3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bLk/gk3n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I2udG6A3"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67S4mmAL1352985
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 06:00:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	igaTs1zMayZ+XF3KQoqMSWdbrKkySvfvzbcB4KjbaQA=; b=bLk/gk3nyvXGINWQ
	tbcc0j5KNsS/kLVqg0+SH2uevOpj5C8tTIaeviHkjQr/f5UxY1VPOQFxkd2jfKrw
	sKjKa5uj3TUKsKYvOR5TNWHa8ARuNTNt9+ew03sFWnbJBjpx+IR8UwNvwGVCB7Du
	wQozt1MhmozP7Pth9/BqPBkNH73sApj9gX1MvCwKki45Sv1qa9yuFPSmDvP2HKOW
	kCas7Pchy+MxjMBqTlKs//suldfvJXPklNXstnJAsUmZJSTqrvHu0fDa+M/Qmod1
	xwAy4/57bY2Bd2jaJsSXCPR04VLqG114K5LvX2/YPy94KrHG6tGM24zs9FdrJJyX
	ejjoNw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb3mu875c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 06:00:44 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1c057f480so885162a12.0
        for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 23:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787896844; x=1788501644; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=igaTs1zMayZ+XF3KQoqMSWdbrKkySvfvzbcB4KjbaQA=;
        b=I2udG6A3n1sx056A0N3QJ7hLzqIPUOS7oogfHZhtdaxUOFYA97JRiijeg87Por7aVj
         AnLlbbutu60/l4BffiKJggTmUNMkKupV3koGsOMVqF4vs0/xjaNVfKIvDcewsDVuHLdT
         1EnMCP4WPNof7VohL7tgI8g8QImwSo4cYSMaQtc4y1lXV6RGku6cU6yu/gN2ZKmieK09
         RUUoUIMTVnLBqk6Z+KyoSQIllZKx0YftJ9nbndQ/Ue044xkAIbHLPPRZEdkqUD4WUwAg
         fxJ409q+sHxHiFNRJ8T5nfyebV6mYTXCrLvChubRs9exzPfkihrAT+Sj/z34BcYEb+yU
         L99g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787896844; x=1788501644;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=igaTs1zMayZ+XF3KQoqMSWdbrKkySvfvzbcB4KjbaQA=;
        b=VpiZP5bcRnYLGnh2Zi3s6UptDEOFSTzVHbhcIWyR7mRvvxEvl++FUtxPgjXnqAkXSg
         1OXHEkc4Axz5eflgpGkMEJTOT0Zsb8BXElMUXMeBP/9bxcncHVAXm4RfThAyxsTVwoNd
         QVKYT6L+QrGrL45QYUJr/WBBBQJsp/ff8KH0GWXT6I0rtQLM9097pph766Y0VBUfcp87
         36RQvRPfn+5EE8eMqUIfv29c0YuEEiY1ENZmItrDU4ujLR28yljcQYOzBpZHe9mgW7Ej
         DLkAa31JXByrHCK4kDXzRVgpQHuGSOguxOt+c/PJLf4RznyIoUKu6xSzdhrqgn1/M393
         zqew==
X-Forwarded-Encrypted: i=1; AHgh+RqWiQPXsN7fAuYuhNyGZ7Da/06nwLehFHrRDGNtppjJeKpL/W4LPY5YCvsxSUpt7xxRRiKc59BPiEV0@vger.kernel.org
X-Gm-Message-State: AFuF++n/sVSQ7NLV+hsBgGPeZa/N+WBa9GxktCw9olsgX0hQH3pB5ZfN
	x1N6SYP9+hNL+i73TcZbiBCa7gCR6vAlQEyi1V4aX2y86rzfbGAdknXsX7jyyF2rPSMUVlptevL
	x5eF97bXMizQ5j2p1sWbXYZ/xwjESAqz5hxqFm8uYjhOAQN1PHnbYuAXcFFURhkHd
X-Gm-Gg: AR+sD13M/K8Ws/gamZTwjACgBovDYK/vTBfvU3zUgviDNmhc3u8Qe5i9UOC79BeoNub
	f+h5D7W4CKWvMy6NRAMsk+EKONl6vrD7VEpVcACb3p77AI0/wGgavhipoOUDVVDCJUpOaY80ogz
	gfmhRqTSggUXeG3p41Vqj3t5SE26jhhdtbd+yCtQk9GRwP/8R2zEY5BTDfubFIgr6LGUBDv8n+N
	qt9OHMmP7DdjzqD3AhXYNfX5Tfcl7iINyqDWiTSilSatpdt/PWvm7XwmTZvBByySrVgELipwK6q
	4usqOXZzXVYxN4eOYmoFvLnOLJDR47hPpoWyT1x7ousu243HqPsGGdgZ2XCJV4z4VL7aaRXvvJH
	o4Aa3cCrSmiYx5MskvmO33E7hSx+uGMaO5UZlyQuUIGkDcNY=
X-Received: by 2002:a05:6a20:748d:b0:3bf:7bf7:7913 with SMTP id adf61e73a8af0-3d26951c53dmr6522323637.14.1787896843982;
        Thu, 27 Aug 2026 23:00:43 -0700 (PDT)
X-Received: by 2002:a05:6a20:748d:b0:3bf:7bf7:7913 with SMTP id adf61e73a8af0-3d26951c53dmr6522222637.14.1787896843568;
        Thu, 27 Aug 2026 23:00:43 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-328713b0451sm1759033eec.16.2026.08.27.23.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 23:00:42 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 23:00:35 -0700
Subject: [PATCH v4 3/4] arm64: dts: qcom: hamoa: Drop unused #reset-cells
 from TCSR node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-hamoa_tcsr_qref_0826-v4-3-663c9d30468d@oss.qualcomm.com>
References: <20260827-hamoa_tcsr_qref_0826-v4-0-663c9d30468d@oss.qualcomm.com>
In-Reply-To: <20260827-hamoa_tcsr_qref_0826-v4-0-663c9d30468d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787896837; l=851;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=hUgMZ4VN5Liy3X8evZo89cfzTiLq5GALmn3wgJjAQis=;
 b=iBicsAMu/N59YTxIfLvuy8sJ5GTMN/WmYOJLBkkBQyEuh0AEzJZ/mI4fitiBSkP7qIGi/Y/3B
 2Al4kmMW4KRBAPiV2av1y7TO6CPqJzz30ySMRLUu/ydTrgXPCrfo+VZ
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Authority-Analysis: v=2.4 cv=ZbMt8MVA c=1 sm=1 tr=0 ts=6a91240c cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=xPGDdNgMfJHLDNzms_AA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: qzNGrQNRuvJoFGVvWziEzKp18WBr6y-N
X-Proofpoint-GUID: qzNGrQNRuvJoFGVvWziEzKp18WBr6y-N
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA0OSBTYWx0ZWRfX0GQE2/ih7JRb
 vMN1h90CYII9KFYtZfXvq9tjrHII5pcEpYKSKpfNOtZPAZnZVP1uxMzKIJ12ZTa8Ir15jumYCHM
 4/f+F1+6qIfDTIRXkMo/lx7akmVm1Fw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA0OSBTYWx0ZWRfXyUNqWsgQMxsL
 9oK9mH72P+irHEidhxdcBYCsxTUBwtZ0KiH10/0Z1amE+sfNuPqpNwPbW37DEgTz0GbmwgAZ+SG
 G5Bd+r3uQ2SkXrwe2kvJix8IjPOABnND8Uh7fJzKxKqIkNr1bCSrsr58TqPBcpXHyaHArIfx98t
 VzMuonAxHZLFjN0PhKejSArdUdT3/MORdHZMUpE7T50dltgwHbzhC/dh+BPwL9JEoN5odozbykg
 S+VguEoojUGHd3/TxSRbD4mzN+Yk3+fkG+nq3PupdmvP2A1oTZU3w+3KqVfluWu/xiB4bM0zzQ1
 EoOrC1cIohPFyWo94kSaSH0rK0RWT+xsBGGjaTgcrFHDXfPvFTMuC5fMb3WaBDTkZ7l4YBh58Gf
 e+f3eA7D6//o7CqyVX6ehlFW0quGF8oY0hp5gfyboop1NYtQ50dMgLXfY3eDTqnTZvOyNo+gJX0
 41q5sIPUSj4BGkZhjHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608280049

TCSR does not act as a reset provider on x1e80100: the driver never
registered a reset controller for it, and no consumer references
&tcsr as a reset. Drop the stale #reset-cells property to match the
qcom,x1e80100-tcsr binding, which no longer declares it either.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 8a96ea1bdb9c..7f62c624e4ca 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -3984,7 +3984,6 @@ tcsr: clock-controller@1fc0000 {
 			reg = <0 0x01fc0000 0 0x30000>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>;
 			#clock-cells = <1>;
-			#reset-cells = <1>;
 		};
 
 		gpu: gpu@3d00000 {

-- 
2.34.1

