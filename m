Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6238533F5AC
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 03:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776139186; cv=none; b=N6ncgMxLEvSElpdnEg8M0H/fXJGyjSjwr1ZMBHTr3n+apvaGdrqe9ZsPViFWwJc775RLxA3TorsUtlGmYqdEBgCA6llKPK6BPUiyhkLeHyecew/9HVcNBhOgcPfNG+JEe5RAjpyfPg3HoxXgDxuqJdK2KepvwKkFGwayjnPthGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776139186; c=relaxed/simple;
	bh=Ce9+SAsfP/+CFmQPP39cghQOIDmK1UbSevA/koZEFho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RgtZvoahg0qhqIkClK3A7XnJv05E6wZxnvovL9deM5rahUORdxzJasmaF5BGZMsEv+LmEeV0kEmtCNnTcOEmseOqp9aPKTgD62E/3WMsS3ulhIu2t/fKguolUvp1I+QS6ji3nI4FIvwDCJVTLFJgLbKYDinV2PUotEFOJmUn5pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HGgOiD8V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gEh2SDBi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HGgOiD8V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gEh2SDBi"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DLCcxB2386476
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 03:59:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tIla3JLeBXd
	KNdERyaSRd2/nhYyuYQKd6ooLh2sH54Y=; b=HGgOiD8VPZn5JAlsOB1hVye+xNL
	rXK6NjTXhMgqTExImDuhgZSNzm+AAni/4YCSBJyvVXp+rrZHRhGKALxY8gSX1e9/
	au4X3BXNW3Z1UVD8rArcNOJ2TmLoiMkA9GwGd2Ab5BwDAR0MrvBQhvMvVV4lDZ8p
	Opzwq1LI20H+U0pRWTW10ZHNHAKrsLnvyNVR8/n8vY/IRMxtKtKqM42SKnE0kpOW
	RftD4Dse57sStnFLcvre19k5qFeC1JHroyhfI5AeCp91Zx9G20Jo0Ddv2ksGmg7R
	THePQ4ccNPOUUv4H3bY4EqhVMAnigf4rox7Bdo0ZiJF0TFugNpjcJhXL2tA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86w0x03-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 03:59:42 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2bdf6fe90a9so7147249eec.1
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 20:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776139182; x=1776743982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tIla3JLeBXdKNdERyaSRd2/nhYyuYQKd6ooLh2sH54Y=;
        b=gEh2SDBiedX0Bs/KVIZ/inmz8uOozpu9thJwIBwM5hMOwkkXF08ll1XrQovNWPKRo7
         An+PZsbavahluBooyUEm5sgie7apArgJhoUTBTra/UgaunIs6GB21s2eB3I4nPtAsJjN
         OgAnjQ/Ox8LPh4G4sGVw/9bHGCVwQz8VaBI7ye8TbBPthvuKV28DArt8XrFDOZup48KW
         VRi1b4hZf5IhlYEwHuVBsoX/8kmmvzjHmnpmGjEVhTw96MBEB03Dj62sR8o0xIxwOP3N
         L801PIqQC6lN6P9aaV3JhzsCWHwS8ezHVb7PVgpnRhCOnzZ4sckUUt4Hspr7lb27M8ap
         fCbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776139182; x=1776743982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tIla3JLeBXdKNdERyaSRd2/nhYyuYQKd6ooLh2sH54Y=;
        b=A59Z7Oi9v5AjH7FXr1tOUnHvnyAtG0pnTJu7agHoS/2KASjNfhgyFQ1iAR8fZN3f43
         34oc/7E+Zsi2A+Khx29YGYa+CEP+eHPLnbaiyiD9c9NW/9gbbupJih9XK8IJYL/qhMbv
         m6Yv5+1qp5qg1Qd2WF7UJXSjHbMQ/HxliaiooyDTXeGQsgJwytJptn30VrE9kFS1ptxO
         PuqsFk6BuGPqIjSe0bvkPVLl8SmUGfOyabiZtFP4yLo0luMwpYJZh6M4uqDeS+2/eNNO
         3805wQSO93tair0WoXoSinL9QZXyUstHGKWwTt8n/0R3Hk+pn6hbyEjtq4rZx2tO4INJ
         16pg==
X-Forwarded-Encrypted: i=1; AFNElJ8QiQCRRxNWsdm0MgbG7PaxPMydtwuQTVA5kKR3tdhpqWifsBUGIwXDRx4K8r6dbYO6MtqNjwRAboqr@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1TdxCuyIE6Tm60BnWLltcKTmlzBERkKBq0TDzcZQeMVdMvtLY
	w6bZDHVyBFJlyBoEH92qYVf+mNbmZl/kfiDIZFPq9aQuICo+q9Fn7zh20EMlOpu4XtBrKs19XUO
	Hy95zhIIWHcBTA3n5cnqLAEFDFuNKfi2p+7WmHoCb6zqj1uesMGSHnIxH3pR3rhIT
X-Gm-Gg: AeBDiesdboJ0o0PPqGM6FfhWS4yct3GwAiMrk8yOu5FxQZflJRXy1DZlasPiQz8Ppa9
	x4YnNBIaqIT5HQb1m1XuQd7/lQ5TC02a3kY7yxuZU4OGXN6UlWn+TJs1KJItUtyCIdyHUramX9T
	qPJuu9nggx5GTGeqGsbzEcc35DjmvPzJaAoAr0lCq5VvTFl1p9FEhlVk0PK8W17hbgLJL2LbNrn
	q6cfX1do8W4FCFs6bJF2iuDUAiiHYMokra6F4u7o5MddA1kN82rjldWaN66o4KnZU75MDMVwKvi
	2u32tk/fYf2yr3KABQ90diCECuDF6LXE/uq4964m79GK9KrcGVNuWhXFSi+K1HMar40frmtTEZZ
	WNVXQdcFF9WiXT+4coGdtO/hnjmwNUpl2+rN8T9IW2zs9Axp8hq/4oX5aV8UD2ZRv2sGUUPAJ2T
	ztXm9Bwg==
X-Received: by 2002:a05:693c:25c7:b0:2c1:558c:16e1 with SMTP id 5a478bee46e88-2d58678f385mr9574989eec.4.1776139181666;
        Mon, 13 Apr 2026 20:59:41 -0700 (PDT)
X-Received: by 2002:a05:693c:25c7:b0:2c1:558c:16e1 with SMTP id 5a478bee46e88-2d58678f385mr9574977eec.4.1776139181156;
        Mon, 13 Apr 2026 20:59:41 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d80acca4c5sm13949983eec.19.2026.04.13.20.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 20:59:40 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 1/3] dt-bindings: power: qcom,rpmhpd: Fix whitespace in RPMHPD defines
Date: Tue, 14 Apr 2026 11:59:07 +0800
Message-ID: <20260414035909.652992-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260414035909.652992-1-shengchao.guo@oss.qualcomm.com>
References: <20260414035909.652992-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: IUHK3RKmJslwCk0qTJ4Tqx3En77TsGTO
X-Authority-Analysis: v=2.4 cv=HKfz0Itv c=1 sm=1 tr=0 ts=69ddbbae cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=6qMARqoqku_Fr_bgoQ4A:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDAzNCBTYWx0ZWRfX6iix1tewGWdj
 kBYYRj5INTPHX4Rq+u6vXPszXYULzZs+MtubNQwbcdBimIuA2kwGPgyk2d8M/TnzkE3FTA4AOJo
 2N5Ruoylr0FTpKep/VBX7jhOdhm6v53wG3kKQI+gvufMf81CpRS29WLGbStJ3X27sDxjQvPb12+
 r125EpwPbosapM4ls771alpLUlnyfyrm1Nmh+yR3jqzUeRSKvA3/QkKd0/h2GYoUiClxm0zKRyL
 v6L5V9BioBeybBvrk2UiXipZEarApraNrZrTKbNoU6/YoB5Z/QY3cbfcElnb4l8UkV+sSpBK+uz
 +w6PXfa3mRYhtUlv8o5/FHTGyGhAm0sx4O07A524/v0DIyLCOO6snnCaKHQpqnI7yZP/y4/Po3G
 Ce3mi2/hhJ5SFn7GaiwTU8YL4Z+a5QsL5vBX+8vsu/qBemBYWhO5U9PtQvk+4ls7t8zmN5eHqQn
 B23WSOpKmFg56oxh9eg==
X-Proofpoint-GUID: IUHK3RKmJslwCk0qTJ4Tqx3En77TsGTO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140034

Some RPMHPD_* defines in the Generic RPMH Power Domain Indexes section
were using spaces instead of tabs for alignment. Fix them to be
consistent with the rest of the file.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 include/dt-bindings/power/qcom,rpmhpd.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/dt-bindings/power/qcom,rpmhpd.h b/include/dt-bindings/power/qcom,rpmhpd.h
index 67e2634fdc99..74e910150956 100644
--- a/include/dt-bindings/power/qcom,rpmhpd.h
+++ b/include/dt-bindings/power/qcom,rpmhpd.h
@@ -7,7 +7,7 @@
 #define _DT_BINDINGS_POWER_QCOM_RPMHPD_H
 
 /* Generic RPMH Power Domain Indexes */
-#define RPMHPD_CX               0
+#define RPMHPD_CX		0
 #define RPMHPD_CX_AO		1
 #define RPMHPD_EBI		2
 #define RPMHPD_GFX		3
@@ -19,14 +19,14 @@
 #define RPMHPD_MX_AO		9
 #define RPMHPD_MXC		10
 #define RPMHPD_MXC_AO		11
-#define RPMHPD_MSS              12
+#define RPMHPD_MSS		12
 #define RPMHPD_NSP		13
-#define RPMHPD_NSP0             14
-#define RPMHPD_NSP1             15
-#define RPMHPD_QPHY             16
-#define RPMHPD_DDR              17
-#define RPMHPD_XO               18
-#define RPMHPD_NSP2             19
+#define RPMHPD_NSP0		14
+#define RPMHPD_NSP1		15
+#define RPMHPD_QPHY		16
+#define RPMHPD_DDR		17
+#define RPMHPD_XO		18
+#define RPMHPD_NSP2		19
 #define RPMHPD_GMXC		20
 #define RPMHPD_DCX		21
 #define RPMHPD_GBX		22
-- 
2.43.0

