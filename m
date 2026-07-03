Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483CA357D05
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 05:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783056249; cv=none; b=p9efZZvU9TOF6iOia8J9brLcDMHNr3c7dTBL1jKLafOpV/34ADsijODcsRi6QLZCbZWuqNm34jADaZD9hcQ0tq+nODf1kluH4aiYXaRQTJoYgPSJXsTNJL7pIUann/itGthvf+41kaN5IgtMywXTsy8rxfGZPYvoCnztrvnyh0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783056249; c=relaxed/simple;
	bh=PHavePp1mOlH1DjAoM7VWVvhRlabqCbza2ruxK0s7pY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=MR1KeEWZ1cUi+mGSoMtZDxnr4fbuO8foeidAvxcwmAgZ4nPQ51lK0LQgRzxzXeO8UW4668tTOpgDSzBVqB1SM3Ud1Fgl52HviD2LinAItAgBOYliTVRD58XksgcBVY7+XmLpNgaQtFWmgj+Y8bM7J5YLy3Wt1uyDaX69zPh7pic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D8J4vkij; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NcnMnfjt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D8J4vkij";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NcnMnfjt"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66342V7c2701108
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 05:24:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5jOrsQu3BA3BQzqCjt4lM5
	wYB5ifvp/GJxL0JPl091g=; b=D8J4vkij3IkNjuWIgom6p2y6tRIQ33U2r6wc1Z
	mIx+RdK9ZGJewayI2O5YTQvNXUgETkqBKYrSTr1z9NQlJfF7xedzPydbvuB/YT+O
	T3NX55Ydt8875RXInsdJVOCvsIlZ1NF+5AQK+cZwWAX6c1Ae+EGE6SqAzxc8Ncr3
	Nne+P+L7MOdV2aIS5lwJTcPpdrTDd9qbyxyMHwp00lDgWLVwHAi/W4PEAGBjQQ4q
	zMdksbvDJ7krAUNzO98F0y/tiyf11esRQRWY/T7cVI1x+gjnqoSBjr8SxXfolNWt
	M2I3r+/4bZv0mMy7a7Et6kBDYUBCeaXL9UyOBGuAfuoaRVuQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5n9bme42-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 05:24:03 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36d97a4e08fso422943a91.0
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 22:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783056242; x=1783661042; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5jOrsQu3BA3BQzqCjt4lM5wYB5ifvp/GJxL0JPl091g=;
        b=NcnMnfjt+cy+Lqe0lGiyuPjhoDk217DF7P4fXGb2cmM7EAh9LsBcNkB76DdpzBtfSz
         oPLjH0ubkw4MHWFUGcqEWjbUenIZ40yRUaF0jQ23PfhUgWYzrCbzhDi4GE7TzJZ/2T55
         B5ctUuinnXOYd+hdF1+S9M99vS2TONEw2eUMxYKZ6Pm2e65tDpNZbMK5ZNgHadPvVQKU
         K+/0UO4fHHWQ3HXIpskSI/T/lGPxCHY1cxgoAnz4Xb0kf5NBtDeXeHQxHjCLQgqRGg3d
         PqHDE4HKLyU4q19t7dUs6yon8XY2+NU4P6FGsSOQOPutG7YE606EGmZHj1hXYQFerIgz
         ncRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783056242; x=1783661042;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5jOrsQu3BA3BQzqCjt4lM5wYB5ifvp/GJxL0JPl091g=;
        b=JJDq+a1AGv5iLWWHDy7hkM0U0ecF2ooAQ5GF2ENlx0h3qVm6rwP3f4YiGjZj5B8AhN
         vxdo1EdfmbgPHhh34WtMANvNTOZ339E4+w0/0UNuZDXMpJ90bTVk1r/CHn/CoAx+TWjN
         oX34qYgtbVfov8z8QcQ50RxS5Nm5deSJL5TDvcfifxYMNX7ik46wcK23lcbsRmJCZXGH
         MuugC5Z7g0AXLRVc3wq7MHbPEBTVqDTyNcay64MD2xM54daX8/foApS8qEdgkc9kUCub
         QnOee4nDv3JQKa3ULEq+MgVaEebItMplw8xOaeljpncTP1XOwgDrjkokVVNtgoml/FTn
         KcOQ==
X-Forwarded-Encrypted: i=1; AHgh+RowSzP8j0qjQ3/KnJm3vO6w+gJ19iAdsGHVl51ynQlZxldbA+GNEXi0tqTAo2427wGFcAvPVpEXCi38@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5X8iBvAtoEfdHYPh5q/y+RWtrYD3tCaaqXsTvuN8YHcMS9Y6N
	bQBZL96BOipo6keBCrPswqQNBXazJWKZZ/Bv5Ejipq2XnACV9dSXMM2ayH5ik91xDQ8YvK/EA4l
	MHJ/14zY/xfwivUq+FUHGlVPdoqCPclMYrzIMFluegiXbiBfUYNXlE4EbnOgVTX3l
X-Gm-Gg: AfdE7cnZLsfisJh7bQqkxSwfz4U4TFeKTaYgZ8x9dwbwfE9dgP7zId2Y4oRRC2JlZy/
	dseQHXRmNsAdT7uFO+sUcdLjKTlKYjZRXG6BTQkkWY9Felpumt2uH0wc6AYICaUdwzwhbPbq+dj
	XQE1+h7FROwcSNHLeKfss1YSooLA12MWPN1Y3EJzKJ/Y9TayxibBYZnGDNk9XQOjwgAGkQ1YQ+B
	mNWoQXddLM99waL/cywZXqEeH6D8lEbdCOHObd0jv8F6EoyKZhnXaJZiz79lRWuaoD3ZVL7LHZS
	3sJByBFRFVSYcL0hdZRKSRukNPxMTkcmtRwCBwxpq8B4fxLLHxZN80IJzEtUrw/zQ+bFleIHAWr
	Y0trybmyk1ClilLvBuY4LHh7hnm0BPtCIKHylDG7Z
X-Received: by 2002:a17:90b:58ce:b0:381:1b66:4734 with SMTP id 98e67ed59e1d1-3811b664f25mr2425922a91.6.1783056242235;
        Thu, 02 Jul 2026 22:24:02 -0700 (PDT)
X-Received: by 2002:a17:90b:58ce:b0:381:1b66:4734 with SMTP id 98e67ed59e1d1-3811b664f25mr2425886a91.6.1783056241712;
        Thu, 02 Jul 2026 22:24:01 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f1cbfc285sm7219105eec.5.2026.07.02.22.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:24:01 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 10:53:39 +0530
Subject: [PATCH] arm64: dts: qcom: monaco: Add passive polling-delay for
 gpuss thermal zones
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-gpu_polling_delay-v1-1-132de4dd3cad@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFpHR2oC/x3MQQqAIBBA0avErBPMpKirREhMkw2IiVIU4d2Tl
 m/x/wuJIlOCsXoh0sWJD1/Q1BXgvnhLgtdiUFJ1spetsOE04XCOvTUrueURA0rstGr0gAilC5E
 2vv/nNOf8Af43+WhjAAAA
X-Change-ID: 20260703-gpu_polling_delay-9c0c642149cc
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783056238; l=1058;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=PHavePp1mOlH1DjAoM7VWVvhRlabqCbza2ruxK0s7pY=;
 b=LPtdoaH0Do8u4M1o86/COVBms7TThDLR+LHdv6ruZxiCnTtj8Y4OY2zUs57Xair5BDk3ajDIA
 d4zq1KaUIa9BitEehN9FIGBOi0xsuaHG3m334It0WwFi6BYcc9C4o4W
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-ORIG-GUID: obKdpJn34nHG-9BqsksmSkmXPDF_Mw7R
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA0OCBTYWx0ZWRfX/IxgH0DsYSey
 gPhDMeNPXYSB+PNLLRJrE9Tauae0Cb8n0uJ7X0kP07vqjzKPJXdPyvLR6VJoadgSYE7E3kF+1tZ
 s0NlRzx0aVaS+S3LoYNqXptJgJ8gcSA=
X-Proofpoint-GUID: obKdpJn34nHG-9BqsksmSkmXPDF_Mw7R
X-Authority-Analysis: v=2.4 cv=bOom5v+Z c=1 sm=1 tr=0 ts=6a474773 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=EzTgQT2ADBj4VUy-sZYA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA0OCBTYWx0ZWRfX8z/bEbbm1IOo
 TBcdoRCpSwuDj/k461cdqE67Y26a6vbt0qsAmYbuxvOoqwAuF8nj3ILfc2ypE91NG7hF+9G6tZC
 lhVDq9nhzL39E6eJ4PAAEs1p6MxkK+CHkN3i8fWmesVj/+AM6p2AEXlT8O7caA5YAZORemS0zEj
 LrEO2aGjf0T79l+Y94isXG+Lu4scNi2eWvwVva8pWK29vExqZgOZaY46qEm4L3kQAbj4I0A5o6o
 OquTlKu9IBnp5ojKYZu6yfNHse3Sw9qDikTNE+sR9axaYh1GklTn1/uY+dt59eLd8YtVLjgTblz
 sHfTlsgTnW2m9Fu76jjI43M88xjYPpMy+EQAxfIYEHTM2j3VwiwNTAkl/teMd4UHsBugY4GXcgv
 n4kUuGqrUulDZMa8vv7Jx6HRSslvOuWuVVB0H+rsw7ce71CYFIvBELO3M8CFBR9x7+d8cesWyky
 /zJyIok/5MqvQqGta5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015 suspectscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030048

Introduce a passive polling delay to ensure more than one "passive"
thermal point is considered when throttling the GPU thermal zones.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index e4c8466f941b..a3943b6f299d 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -7895,6 +7895,7 @@ cpu-critical {
 
 		gpuss-0-thermal {
 			thermal-sensors = <&tsens0 5>;
+			polling-delay-passive = <10>;
 
 			trips {
 				gpuss0_alert0: trip-point0 {
@@ -8028,6 +8029,7 @@ cpu-critical {
 
 		gpuss-1-thermal {
 			thermal-sensors = <&tsens1 5>;
+			polling-delay-passive = <10>;
 
 			trips {
 				gpuss1_alert0: trip-point0 {

---
base-commit: 4f441960e691d37c880d2cc004de06bb5b6bd5e4
change-id: 20260703-gpu_polling_delay-9c0c642149cc

Best regards,
-- 
Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

