Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89D23603E0
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 02:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792376162; cv=none; b=YEBrKuAMrgiFR8LrqEyod7xqaxXorCU9p2IBBhvJ9ixdIsYZBb+GVOMPsMYHu6PhPtpQdpxh8nc/sRBTmdAB8reeUFTnPULd/+F0e3zCKL/ACrPWfCvAs3sWlewCSSW5UlHGK1i+Z8GL4cPUavfCGdj1lgxeVUgKJQ5xnZyg5KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792376162; c=relaxed/simple;
	bh=CfsKmXvQMmfwhivJPr8zI/3pkslY9CJXxhXXPKPNpk4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ploP5KWNWDvFO7JO+/Iv5c/QtcoDtdnDM3Hn6qBivP7uTjIYUVUmXKdFC/06KdPbwMFiwAmQvyF5O/eqZM1mi3FLACm23g+6ciofFLDto/JhBGGXZ2dSylRpGzR4lq31v4jylzBZU9DxG7jBogMUHMK3/bV7GlApdVcPqKwMsoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IF6SvwoF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YsKyxbMN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IF6SvwoF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YsKyxbMN"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J1FNs51263023
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 02:15:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PPDc/2Iyewb
	HKgbAhopwYa/tAZzWomqFwflZJ88FaEk=; b=IF6SvwoF2MsrRNDG1M5neVgHJqX
	3S4yeRjytbLnsi8jiRbGV2m+HT45CXlAwiJ7nh/SycYS7+wP2q3F8CUFjnCWv9o5
	6ny40mjkam7C+7YZyGq9OQsmalCEKDg+KvlWPX/Bf1UQ5Ka5c62TRNJa+GTOPW+1
	9/bU7f5uB3cRMvQkaij02mK2flTwojwa8k9YRiy/MvucmtmXmLG2CW0T6iFVUIoI
	A2cm+OziGXmdZp+Fyy+4tkot72CqardmoBm0TMDqJWdWB67ikTsUSXpLSs/SK34L
	5mn2mgYVGxk6sQowEai7MJmsSHf0rm35dazQ/mcEhARDcz5ekThuBy1qiIw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5w18hxk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 02:15:59 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341eff9e381so5251511eec.1
        for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 19:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792376159; x=1792980959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PPDc/2IyewbHKgbAhopwYa/tAZzWomqFwflZJ88FaEk=;
        b=YsKyxbMNUbCRuA60qdrfJjwGOE+addkK3vGgv4FanaNVxS5Nb5j29k8mHT/muN4EZb
         g0TBuuILMSR85PYZMZs4/3T92ARqOUXnUEoqAVECH9lfReT1U6fui4GjQiWEB649DIe+
         KZ9Nd+TRa41JayBUwwJFjrS6KE5YGMXrV1ksyPeGCg1RxrPKF6XKaXYQccb3NXNdHrJZ
         HGsuun2ZktuqJmUD13zmhjiJrOErqdC6TaiiraMXXdDnLo43swuoVrEREGNSLUGoG6A0
         3KnOQtrqqcvaqtgK0yrocJV2i7RWL/+aVPxsXAGxPBHWje+WXCGL2oW++wZd3yWtr6/M
         A5cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792376159; x=1792980959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PPDc/2IyewbHKgbAhopwYa/tAZzWomqFwflZJ88FaEk=;
        b=nx1Um7+H7Jy8aQLp/sO3NxC7KyRP7Jv1htiIHz+CjEcZSK1nGP1sdUyEsZ3p7yhn/w
         w68tMUWsJznQ/UR7Q0EuRXUFoFQ2WR3HnNpT7caWN0OGqMtCv6jL8Py27N40Fy0eodpH
         TuFlHpALDWM/AySnP9umRsyzQRlraBjG3SKyWZBt1csWtVseLuZNUAMHQLVX92591L01
         JeVQ3UwBh8Ef5TrLpnZyWCCKF1MOuidK2KCSFekVo2SmZXAMz8y28vy2a8q7baCL87dz
         pFUhoz6YqgF3ZVC0PbIPwcgJ6Yo+x4Gp07/Gi2pgHClUoqdBSxTN4YnzAv6j6p7TPxnY
         cXwg==
X-Forwarded-Encrypted: i=1; AKwUvBw7ZS9ofVeuqZHR4j/tDUA07kMP1g7uODvTi1l+CECHdejmLWGuaGrVmasWlot1XqhHljyCLXlKWahU@vger.kernel.org
X-Gm-Message-State: AFq9FYKbHTlQSj2qbfNnl0n2AGNKC5AKSg9wbTd+s27WMdfIMiGCI00y
	eOdRGTpGG74LJh95a3nFVt/CfJ+gFCABwBPaq4EZFFMewE87VlkD2I7g45IXTMU8Pa8+5zdH3KG
	xphtmGBu8/sO9HKaEPtZIiSMz17oQq36o33AqXk+zm1E8WIVwAIuc4ynrSPEQTe59
X-Gm-Gg: AYBFou2dkm0TrCUu2pRxzVUu4+FtjjZnHwFZzLC06056d9wwiMz4nRcrfm+7L9mLPl2
	/k8qADIzlR75CFEcBNurlwvjXD1PUxZ7FmI+jNCiEmffq00hhpjAYeZD6MuNgK4Tcle14Kqbz0G
	YYGDXfyUl1Rr92Z3VXKlxf3LZ88xK/STY2BYppZpD9YBa3WEb+NqlhxsWr96OaQBuB8hcbVMf6U
	rukr9BOAlFB/TToCNjhWNgbOdnhirgsv/04P8iolOfe37xmrEnH9EZUTdwH71v2g0jJmi5oByyC
	PSePXsk46MseKXpITJ/qldfF7iXC7fEThOht2Izic14YjSZo2OGExbVJM3OIcPivib3QYQnLz+j
	xxo1RoV0VtvaeXNXVyQTb+NMRzn5UnOTSMNc3t3sf6Wg6ZL7/vw==
X-Received: by 2002:a05:7300:ae22:b0:359:2a1f:520 with SMTP id 5a478bee46e88-361a2052f01mr9491240eec.24.1792376158799;
        Sun, 18 Oct 2026 19:15:58 -0700 (PDT)
X-Received: by 2002:a05:7300:ae22:b0:359:2a1f:520 with SMTP id 5a478bee46e88-361a2052f01mr9491203eec.24.1792376158225;
        Sun, 18 Oct 2026 19:15:58 -0700 (PDT)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cab0sm33841550eec.3.2026.10.18.19.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 19:15:57 -0700 (PDT)
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Udipto Goswami <udipto.goswami@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Pratham Pratap <pratham.pratap@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Chen <peter.chen@oss.qualcomm.com>
Subject: [PATCH v2 2/4] arm64: dts: qcom: sm8750: Set snps,resume-hs-terminations for USB controller
Date: Sun, 18 Oct 2026 19:15:45 -0700
Message-ID: <20261019021547.1694088-3-peter.chen@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019021547.1694088-1-peter.chen@oss.qualcomm.com>
References: <20261019021547.1694088-1-peter.chen@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAwOCBTYWx0ZWRfX0xVMx10wxoYa
 WBpzQ3KGcSr9KxIsoV+dz2ofC5OoRI9ZIbtoT8AQW4ib+QHVE7hlWhsGFUc6xEA0ull8kkKb6AO
 nzgkMDtdii4CeJlQFqbM8/n8dJuVSI8=
X-Authority-Analysis: v=2.4 cv=KuPYSmWN c=1 sm=1 tr=0 ts=6ad57d5f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=_PA-CDJEJREJmSlHXOMA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAwOCBTYWx0ZWRfX2Qbts1BPqNYz
 GzJ//UByts3ALCL6s/lujFdVKdhAnOQl0ZNc9IWbFYw2XmedfEcdTt8EZA0H28+DgKhaooLtsgy
 r5pfJZXJcAhQV1jjFezNtPU+AOR5IqUiUuGgKkSP2WtYRk227ozzJpx0QkseBtVuqMy6LZeYHNR
 YQrmCfy5JsfbzpdLKSj2I8xcBeVaLupzTM60rJ2S+egCzv2Mwsp3BU3xBQNGJR6cuFMtMZ/gzpu
 DsTuwdUXUGF7cwRb1GSmhHAsPGeyv7ckqfpI/CKb0DmpwiOpxNxphgORs1f1TdInsQ34WJyltfs
 cxhlmC74K0pYLN2OjAnRe4lFPYWBCUSbXHQTBq6EWLZzldTZLhFdEL7dhMhfXNwF1co6HZNmLCQ
 JNnh2ah3JOKZBXv7/KEE57zMqWpMf6TZhjJSArRLFQY9HoictlZdBX+9IyGyX9jpkzrQFpePaE1
 G8GrDJuQ+uQQy9o2lmw==
X-Proofpoint-ORIG-GUID: YHFkxodaSiQdrnwRUBC1cTHqHPMUPwSm
X-Proofpoint-GUID: YHFkxodaSiQdrnwRUBC1cTHqHPMUPwSm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190008

The DWC3 controller on SM8750 is paired with the M31 eUSB2 PHY.
According to HPG, host-mode USB2 L2/L1 resume with this PHY, GUCTL1[10]
(RESUME_OPMODE_HS_HOST) must be set.

Set snps,resume-hs-terminations on the SM8750 USB controller. This makes
dwc3 core set GUCTL1[10].

Fixes: 7a5bb9f60527 ("arm64: dts: qcom: sm8750: Add USB support to SM8750 SoCs")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Peter Chen <peter.chen@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 521b1d224c28..21ba6992eaa6 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3334,6 +3334,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			snps,usb3_lpm_capable;
 			snps,usb2-lpm-disable;
 			snps,has-lpm-erratum;
+			snps,resume-hs-terminations;
 			tx-fifo-resize;
 
 			dma-coherent;
-- 
2.43.0

