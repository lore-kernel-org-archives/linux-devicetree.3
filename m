Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1B435C6BA
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 12:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787144028; cv=none; b=pEFQI+WqHv3NGKqmgsoYRJCpruhzlf0X7liwvFU2MBKZ3a5xEGlNIlsEr4y/zpEEx9lgBwWDkSEggJbxO8F+AJjzrYvBOBocerNp+rRP/HQI1Lnlni/I361ns1kFfB7JB8X2wgzRLjxBpj1jm2ynVpChfqm6iyqVNuLqwxuoi24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787144028; c=relaxed/simple;
	bh=uiH5LC74HtGoUooDtWPifVIUwlH74OMcI4/Qjk4DDlc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ygiwd55QUJKylXqjAdonmgjV8ISv+CKxoU9FIeIoWFE4oddGLbvQk8i8XiSa/GJyihsxPx18+4mHgBVYX7zyXuQIdxqyiY/SG/nW6UXYeCV6giCq5rPt5wlyndedujCs5GxsLraCvQMuDBeAP17B3QVYEB7eF/pdNM08CvQZVsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ExfNRz1j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UmM9BLZ7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ExfNRz1j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UmM9BLZ7"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JClJbm870970
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 12:53:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a4JypXCcVFXJYX/rpEzE0MV5AMG/upx6Kutl9T3ij4c=; b=ExfNRz1jSjxcSjcg
	y0yFk/r9w20Yg2Ch2EtTDW/HoiSxGuRIvc7Lp2wwPTc/OBY+5acR3DNKJNMFNFZ8
	Xf2gYfpieUrqZqKcyQsB786o98xLU0y/teK3P7aTS/llI7SvKL9exw7K9d6ivv+6
	FIY2tpK/A9gDdDmPFAPrwIWExe2LpxGMidZR/P+i0mKteQZVc86XHJJxHhifyzy1
	NCfOL7h+JXAp50pl6bX1vB5cifdlgh/7tVwuZ26SFxFwnncGx7wyE1DB4qd0rzBn
	X2qnH3XudHySwz86eOcwY4YBPKrgDVCJj+xJBuxfUZHNmGt1rx04KZqJ8AsdvkAQ
	hEruLg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfpu7dm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 12:53:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9308eafb465so199769085a.2
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 05:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787144026; x=1787748826; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a4JypXCcVFXJYX/rpEzE0MV5AMG/upx6Kutl9T3ij4c=;
        b=UmM9BLZ7rVn31GIumxeFb3Zcvm5D056Ugvuzo8ErGiUoDZvxLZ1V1TujgGSQ8Cr85Q
         9+n4x5h4b6QatwbUNVioRZu3xmTnOnacZR1/7AHzQd/pNbTbCwFd/84j6XRTD4YGtcRu
         zF0JuWQx6+dVJ3rlbO2rl2lbF3H4VYeLKDGnijc5N3KDJXe2YLSzXw+dyoV4/jwTC4af
         TiyktztthpxPOkYMIxnOVKfBaWIaHQW6uhKzAQUc8BKaYIi8724qKSEMr914sD2sRy9l
         KwUS0lJ1QNzIxeYkV3G01lcO1AMx8vnoT/fzz5vk+i6ELL75QXQ46aU/meepqBro20hD
         AsiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787144026; x=1787748826;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a4JypXCcVFXJYX/rpEzE0MV5AMG/upx6Kutl9T3ij4c=;
        b=XrXFCOMzJJpBnpRpwOKPmuzZEuzT1vLmYgdfw4RDqKlCvY6nS0A+56TEN8aZJ+PQq1
         OqQtvrM2NXl1JE/y6bBHqpBy7ydj4Xc+vb7XA/2QM8qXX5U52GZJEkk6GqDL2bR7t3VH
         ZnGhKTJ7zP74VsIxY5kl1Ww0k3IKPp5GWxRuA5VZCo/BJJ+8OCI7gTfh3bqNWfU6h7tI
         f+zQXnRdu6NkIuziFeQGSVmd2ygkXY1tbb619WAKaVrz79rQUU4FlwTqmz45RvldVDqh
         j67DmoS1YPJhXoP0JMDFyP0LLGf59MaXABKVKDuNkS8XNoqrUgjUV434T3UaOR7FjcHT
         szDQ==
X-Forwarded-Encrypted: i=1; AHgh+RqkHuNEym0qv/J5XDxQ6cQTcTR9cAT+lQ5yXhajZ1ydvOqYbntyX42d6fKMXGXJPRftju9WZLWuNNZP@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2n3pwbMb0XgDZz/ylWm435THIdVtBja/uvPEfVSRMTgC4gkSF
	RLcSfrw0rfX8/ULI1GZe/UX7xBRCJ9nTXT/5wpkuuP3m/AURNplp7WLEvaWdjgE4ud+S56Rc3F+
	8oI1N0P/HybDJs0hEAxmTNy+5s/I8OoD2WFQ6fksYPBiyglYS/qeLe2bjM2TyLzSU
X-Gm-Gg: AR+sD11LwUQGdZaAUNq5OP7Cccu3xQ/PypM1MWg3cEvw4ulnllgHC9EYWD4u3B+4lU+
	wxzWqQ0k+vG9/2Gyj7455KmzFCh6vKP7yrbVId9Yfp5wxtaIwGaL9ZtVYiG49j9WY2LR8rI9/Zp
	cs3dxRz32qUmLCbOql16KfnlOya/DpYXfnRL2EKt+g8nV/Jue48r+50Pp19bAnuIUNVW7xHqm1x
	I9F1iRsa5ixpR+JFrcBGeSF8yxxV6NWFnVoYEe/vib+0Ga9LMSE98iOYmEK/V9QmphfqQVUeSo4
	2QRf0BuGhQ7fPiOFcwLeLUTvD8SIMsOIOk1G37k0t+e3uz5hHFrHXQbiOyBASpKMuj5pyvRv8fr
	g3j63p4IB
X-Received: by 2002:a05:620a:708d:b0:936:ef9a:deea with SMTP id af79cd13be357-9371e2cce2dmr349177485a.28.1787144025448;
        Wed, 19 Aug 2026 05:53:45 -0700 (PDT)
X-Received: by 2002:a05:620a:708d:b0:936:ef9a:deea with SMTP id af79cd13be357-9371e2cce2dmr349172885a.28.1787144024977;
        Wed, 19 Aug 2026 05:53:44 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0d6721sm77954795e9.11.2026.08.19.05.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 05:53:43 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 15:51:58 +0300
Subject: [PATCH 13/16] arm64: dts: qcom: sm8650: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-qcom-tie-cx-to-gcc-v1-13-840034124e73@oss.qualcomm.com>
References: <20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com>
In-Reply-To: <20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com>
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
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=968;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=uiH5LC74HtGoUooDtWPifVIUwlH74OMcI4/Qjk4DDlc=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqhacluYKvfl1UakPRiiwu87LtqVHhGKXn47rS9
 TcID0qZkliJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoWnJQAKCRAbX0TJAJUV
 VhOdEACtIMasiJ7df8ejDQeC6ehrgi+fLRzXcMcETR1jdOg6JLuNzS5Zj2kZ4m0qOvsxJzneiMf
 7K1tFOcy5BGib9wx7wZXfYzdx6lgbPjzMgDAkfR7RMkJN1/lF5hfVCjYPdyQn//iI+ozS2a9lpv
 RVBEH2HRhWWIk/y9bf3SquOFpQKQS1N3P82ufOkMIliHvyjoLb9qFlafRFpiadh7cNLupal2DhX
 Z8EF+yjOQ4hcFMQ+PJZM3vcUaa+3fbvVcolv4NzoT7IEBPRx0IEOx7jjQmzcpaX9Lt3oGDjFduc
 iAEQ8bq0sF1nmaWLBjTIEvmvOzHzgjN7MKC4fpdaryX6r+TriuFs2oQTSa8stM+APhLUXsppwH5
 fC6qVWU3z3kS6aHrh02b8Uc+FaiG/dp2iUg9pQINWzB0BNVb4y1miGEl5Ev3+dC67ZJyaXoM/UQ
 /GO0Us+i5VqfqzSj2AbASOXFm+1Uyf6lrhhWPALVc4iJm2Ff0T/IqbFtWuRAfjitSyWvANNCvYB
 cEEAJMpgWXZ4f0QNTtUaMGZLWWnukZ2ghn7cOwo0jcd+1bzT2EQ4RUfXdXJysDk//jSW/f1rxgK
 Pbi/BmPmyodZt124ZPApJpzw1QGGldXtaxV8y7IlQx4zQ0a/Js8KyY/wdVrqDBvO6+xcUfne0TY
 ibP5x8OZU/ScK3Q==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: N0Ek8jwGlJ13umWCFVc3trXJMU2s_dR1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEwMCBTYWx0ZWRfXxMfe0s0aV6Pu
 h05c4WbZy8IHF7VkraGDDCIADtbUUTJw6R7hDPpx13OQB2cCysyZFJMru+iWs6MCtw9+w1p6S9R
 mOJqww7sSOOda8tljnpbTCHUMtU8tMbd6i8fIA2xcmL54THoiiHLFtmlJ/nSis983vJY5W0CBkI
 L8YQLpf5JOGyL/WHQ/PzXhiNZgyYCaBg52zEvBd/LCb7VrawkGOWcowTRjDr1WZ7cfoQsOEOuzd
 qw9Pe23pevsOjGpRb+cbsEbtXsl8DBf/2RW5E603sJwdh1KwzR3xm4VhC5dwtezx1OfsjvAQl9n
 6asPFe3AEZDKU7bT84D6KwpdDknfWtVfoPOn7LNgnuzm4K7AjLGSIDx4GYVjtHGv7jMU8WpM7rx
 f1MW3W6oiOkvnDQKTwtP91qWPbJ1QMQGWK3g4qI7r878lmHmNgUID0nrKMMNBFojPV3dW5QBixd
 9jyV6+db0Ib9Chan9jg==
X-Authority-Analysis: v=2.4 cv=aMrAb79m c=1 sm=1 tr=0 ts=6a85a75a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=dUfsX-4dSnU6X-0t-lkA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: N0Ek8jwGlJ13umWCFVc3trXJMU2s_dR1
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEwMCBTYWx0ZWRfXxtlosYfCf+7N
 8k8DltbVJn+4wFK7mRaZPOE8KFmWVbMsoL4mgArunNRAe5X/Xk1paRljFjJdY0McOzD80cq14K3
 yBv2XEi1xogxzY/np5F+e958L1LZC+E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190100

The GCC GDSCs on SM8650 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index b679fd8afb7d..962797c15abf 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -2019,6 +2019,8 @@ gcc: clock-controller@100000 {
 				 <&ufs_mem_phy 2>,
 				 <&usb_dp_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
 
+			power-domains = <&rpmhpd RPMHPD_CX>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.54.0

