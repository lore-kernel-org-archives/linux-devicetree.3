Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F914B2034
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 09:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790068674; cv=none; b=TVJdYyUutd2AK/TtKcTi/xoPRjeO6oUIMhU7FeE6Vil1QNZyxsRw53gxjJVFs0xe3dNRSgWyQRc1llz9al5ApecjwKszg1+gGNeqv2geyids7CHM6Ar+TDWod6L3VPa5/NRjZ5IoTcjv6yl5bwkvmQxuPmpPnbucFxKk0ZulyYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790068674; c=relaxed/simple;
	bh=wJBG6mE/rST4drs02F+VqgHDWCr/2TAtj7XyKJ5Alvs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BRvjDLN0g8F3DmTy9bpOB4r1Xhj7Asc0hqflCNyx0D86QNUGiJ9iAwfBGFfofi8Rp52RzzWnnqZMZWppfa3v+Gu2FgrF/zM8+2c9ityZzb115xZqOPvYMN83P+9nSUi1K4zu6kZvpYswCfQNf2whEpUe9tgVN+UCOMNgm6H+Boc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F+vBvQZO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=beaj5Hso; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F+vBvQZO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="beaj5Hso"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M71FGV3840820
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 09:17:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ldGcIzKFoi1EOpald04tufg+bwUz1eha0Q+
	da4RYtgs=; b=F+vBvQZOjAjwqirZon0Hbk9Q6KGoFWC9jR+JGVLfjACO3vsOIMf
	368gsWza79w8HBmkJ9EgpicLePtmgZvJiJjqwlirYGrUU609Ra9gT0iSQLh9UuTi
	EyRPJjg4aP4BZ9bDJZgNS5t3UBwrGzicdGfbve+Gaf0Jv1qw+uDiU9c5d7j7nzMF
	thV3n/GhPgRAzavkSroQB9JuA5RmhVZqz5SGMMabdr/rk2fUlVtkOOxIS2x97Kt5
	RhX0FjnHHERVjeaDgaVkAVHD5ZlVjd9Ff3O/Mxzm6W+OfG+OHZ9CyvnX+VeEw/2i
	HnqLs1fBZSyVx4jWrAC6U2mxaYR4YCtFoRQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu8v538us-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 09:17:50 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc4afc810bfso708374a12.0
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 02:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790068669; x=1790673469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ldGcIzKFoi1EOpald04tufg+bwUz1eha0Q+da4RYtgs=;
        b=beaj5HsoP+h28ciFiPwtOOfoiaE85xslemP+rIJGl1ULkuXggJal9XmpG3FuJpWx5q
         dp3iU9LlzJyzyI8T7WPsouHQL3A9aS6u3qFKvID9MD9QRQa44jVaffJPqmSh6Yn+DjpB
         QoYKYoJSc7SBjMuoYbTkzoqHJKdW8rxsA6sDAMY9gE6j28X05RutvtpNnOMkNY5CScTs
         sJ85bNuNJ0M3iX51NlK6L4oqWX60PF90fnty5dY94uc4DDXLWbLDgU8kU6taGuzAN4tx
         AS5csYjSdW7cojxtVBYFeGObhM6jzUzc7+z1erkUYQLFz1p7bI+lUy8OcsOal65zHMRR
         Bfbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790068669; x=1790673469;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ldGcIzKFoi1EOpald04tufg+bwUz1eha0Q+da4RYtgs=;
        b=ZqTCUprCWnBS1k8NXm2R/2DVkSTZc1gsy4SNDr0SgNlMF+iUyzEiMtCeHxyNOmAipd
         mU3H42RrHL+HBiNmGWotrOtQJzRI/qj4H/8FCQE8zXxVBoUL+aMzzDxcd5pF4hikC2u7
         yGO0aBOz3wxLpseMMK0ukuxOBdtSf8sdwZ0XtI9wte7HdEI51wqjeIRcV+BMswvgIW23
         mEpVYMCA0X3dQFilT8XQBPU1K9h31/6A7b0P4+pjd0Cs8ZFUIEwiOqSzbmA+X3gWsO82
         nxIIH9Gk9joiud0wp5Ay1y1rH3ODGtEHJ3VICquQ/uf+deh3tHV7KjJ63x0r5dfv3noM
         h6Ig==
X-Forwarded-Encrypted: i=1; AKwUvByM25D8Dpf1SRAmrb/6JnyLs3yFM6AFNcVp/ut8VGg/L56m7k2CrVDOP362sBVxK8RF50zci1NmRAdr@vger.kernel.org
X-Gm-Message-State: AFuF++kAQA6v2JdRtVL9u7lkLicN+G7J9BdFKb4LYk+UXqArF/xu3kK/
	hSZqw7bcn9GKS1Fm9HBTcLwShL1uzR6mTBpDt6SWXlAgWmL1ICx82KAprFossgMA4fj5g5VkG1s
	RytBGY7dx3qCCKbqZyz0r2joUj88+3ev9CMM3z5EOQlDQ1eY3xLgzyY1K2eaG7GBD
X-Gm-Gg: AYBFou3EXIcNydVwkZP+9EiD3LQO0nSndkTkAO5WfNXQq9r5O8SOmuIW8X+94JxNZbI
	WqWf94PmNk9X9MmHFqlO4FqrJmbkY2lJWrOT6VhuyHDy+AHh/a811MwNRzHTGCcxsDPsZG+5XBb
	pqMaiRDvc09h1eIpmlU1i/6neBufjSOhsbCinv8bjE717aOzBq9e3+ADVVfZeKx2I8JiSDadML/
	C4ceBdq00Nv2jZRDtfG0lHDvrnc84qz23Xk/LkElZrRKCHIrm+IDjdDVWGmevk0nshXmQSXhOqi
	9JwD30Nx80gEeYaELxsU5Xftxne2rv+F96az5JEpYQ5aR4LiH64WxAZH9Prbt+63GdHwq0CD+DO
	ErtrQ+NxAlXEKygJ96J+th/XUaOD+qSgdtKQe5qYp5Uo4viZdjKmqNYPjCPI=
X-Received: by 2002:a17:90b:3c8d:b0:39e:4c97:ce0a with SMTP id 98e67ed59e1d1-3a07320a6d2mr494433a91.43.1790068669264;
        Tue, 22 Sep 2026 02:17:49 -0700 (PDT)
X-Received: by 2002:a17:90b:3c8d:b0:39e:4c97:ce0a with SMTP id 98e67ed59e1d1-3a07320a6d2mr494413a91.43.1790068668832;
        Tue, 22 Sep 2026 02:17:48 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e610e8439sm4595857eec.3.2026.09.22.02.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 02:17:48 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: nord: Add LLCC node
Date: Tue, 22 Sep 2026 17:17:35 +0800
Message-ID: <20260922091735.491481-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: tF6UmukugouDHoJLGOqjW0SSlX96nHpi
X-Authority-Analysis: v=2.4 cv=B+0sQ+tM c=1 sm=1 tr=0 ts=6ab247be cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=liGA7vQCV0veY2hd_ucA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDEzMyBTYWx0ZWRfX95ta9yDFIkSe
 Voy+zfSbE+qTwqUaDjeHufw5Agd2+nWMn6sJolrdxRlspK+G5x4hLzfpI63IRdG070bkgJJtJCL
 m/9UeiP8THUmWMcqpzdlPBJqlI7q2PQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDEzMyBTYWx0ZWRfX+xayiOizPurH
 DZhyXdM+BBaH4K2XZpHGIC/KTVB34VwMeLGnDRRIz8EXZNRGJ8h5iZU9EM9+aTr32NcoejhGRqQ
 zWZ/pwgY18rJy0AqdYu66otki47vhN1YZvXd7MI4RiOnYkdRU/OhJXhYobUENnMSAspQxME2vzi
 CqlxpXApPMOGkB27ojGkabFBe/CNmI6+W9mf4bxN4rUprxecN3DIyr+EoMqtGLDWNcN71h4/2xc
 mJZzgihc8oc/LlxsOFsbu8s5W4Jx2D6yaym3Rrun1D2WCs5rh6sOf00HCtKDJTUJygFcdORs8Xh
 H7IYENr4RwELfp3GFzgI00Gp39g4sqmbHpqRobjwt1KQTYf04QbIJ7YvdhuG/2sRg5mIQcFHsHq
 D/7RFjx8CrV6jQDRX3BEUKiV5rGYJdjLVWRtXblInDezKGAISf1Meuk+C2xy2Md07VrGPOUpf9i
 LVdqN2K3u0GTg/9XUOA==
X-Proofpoint-ORIG-GUID: tF6UmukugouDHoJLGOqjW0SSlX96nHpi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609220133

From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

Add the system cache controller. All sixteen banks are listed, four per
DDR slice at 0x100000 strides from slice + 0x800000, followed by the
global broadcast OR/AND regions, which the driver expects at the reg
indices right after the last bank.

No ECC interrupt is described, as the Nord interrupt map does not expose
one for the LLCC. The driver treats it as optional.

Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Dependencies:
- LLCC driver: https://lore.kernel.org/all/20260910-nord_llcc-v1-0-30fd1cca65fe@oss.qualcomm.com/

 arch/arm64/boot/dts/qcom/nord.dtsi | 40 ++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index e0496fd40c30..6896bda14ef3 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -2071,6 +2071,46 @@ watchdog@17826000 {
 			clocks = <&sleep_clk>;
 			interrupts = <GIC_ESPI 848 IRQ_TYPE_EDGE_RISING>;
 		};
+
+		llcc: system-cache-controller@21800000 {
+			compatible = "qcom,nord-llcc";
+			reg = <0x0 0x21800000 0x0 0x100000>,
+			      <0x0 0x21a00000 0x0 0x100000>,
+			      <0x0 0x21c00000 0x0 0x100000>,
+			      <0x0 0x21e00000 0x0 0x100000>,
+			      <0x0 0x22800000 0x0 0x100000>,
+			      <0x0 0x22a00000 0x0 0x100000>,
+			      <0x0 0x22c00000 0x0 0x100000>,
+			      <0x0 0x22e00000 0x0 0x100000>,
+			      <0x0 0x23800000 0x0 0x100000>,
+			      <0x0 0x23a00000 0x0 0x100000>,
+			      <0x0 0x23c00000 0x0 0x100000>,
+			      <0x0 0x23e00000 0x0 0x100000>,
+			      <0x0 0x24800000 0x0 0x100000>,
+			      <0x0 0x24a00000 0x0 0x100000>,
+			      <0x0 0x24c00000 0x0 0x100000>,
+			      <0x0 0x24e00000 0x0 0x100000>,
+			      <0x0 0x20400000 0x0 0x100000>,
+			      <0x0 0x20600000 0x0 0x100000>;
+			reg-names = "llcc0_base",
+				    "llcc1_base",
+				    "llcc2_base",
+				    "llcc3_base",
+				    "llcc4_base",
+				    "llcc5_base",
+				    "llcc6_base",
+				    "llcc7_base",
+				    "llcc8_base",
+				    "llcc9_base",
+				    "llcc10_base",
+				    "llcc11_base",
+				    "llcc12_base",
+				    "llcc13_base",
+				    "llcc14_base",
+				    "llcc15_base",
+				    "llcc_broadcast_base",
+				    "llcc_broadcast_and_base";
+		};
 	};
 
 	arch_timer: timer {
-- 
2.43.0

