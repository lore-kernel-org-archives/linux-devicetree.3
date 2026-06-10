Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E94372EDD
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 07:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781075425; cv=none; b=IkRrG1GEOd/kpr0Pr5R0Za83YlsCGUCbMJ2M2Dn443RQQry/+QGUDAN50/4qqICLLlTX3AQXCrCtaTU/9PGxZrEeLIYvowu8mC2wxZmYZlVTUn4vpFCr/fE3hsVvpU2FAhR/T6FBGTPmZcOGCOtp6oO/uQGT8okUbSTOoTVI/aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781075425; c=relaxed/simple;
	bh=CKh0/ez08/oWAd1EC8MVRN8pQSg9MrtVXxPDqpIuVEY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Gkwx88KWdOQkLdwLoJ2r1XcK/AXiR6GYgMOrEJ1T0VYn09On8HhT4KciyqEHBtl2p3+JmWO15ZxwFHndjC8CwzIxI/dgu2N5w0LTd8lsEZE89SGq3XS0CeTcfts4XjYuZ5G6xO3DVDicoHpvpfTzg8aISfrv2N5uHITQqSIbkfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=noRRZZ/9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BJZwi0IJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="noRRZZ/9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BJZwi0IJ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A2ek7h282701
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 07:10:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fXb6ece795ot4aiL/c3+Bk
	KfpbmqqD6TahVlw7jD4dY=; b=noRRZZ/9Rh8fEmYLGMx4gnfa1I/PaZbbpy7GHj
	0p0h/esldJwYrRakz4vj8w1ZjnPVWehaO6mkYteuag+CHoWJ3BaNF6Sc3AiKt6WC
	a4sm/NRhEmENhO185kVG1mVbMrHTqnIyyx58hkrSPWSRj23UEQIq5FZTf56VTh12
	tADJQRUFF9fr+bTIWYgE9VVTdFRQwmdLSCU7T/jbwX5MhG/2zOb6vnx3NW/bJsFH
	vmfEUuSNW9FwJrBBCGQskaiaQyU4YGNcBKhnFpmA4BvQpWiTON0XJ3k9Woa7w43m
	pBzMlBIT90Onph3JG22lQ1falz9SoZBF8ueJz7qkugQ246lg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnns7bd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 07:10:22 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-304ed777a96so4424240eec.1
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 00:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781075421; x=1781680221; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fXb6ece795ot4aiL/c3+BkKfpbmqqD6TahVlw7jD4dY=;
        b=BJZwi0IJpGhnuTFfU5EnLVav3d9qP/vdR51iEN/652lt3IFfhObwOMdH3c25Vh/2mt
         k6KFwmUt0YiaU3Ie2Cyt9/crNt1nQtCYuhD9fithd0yaoHIgKfurxlWqkwsw+lTjjz9v
         GS4eQnMXYNY7CBLQfmuUD/Iq1UZRlOQ98udqKF9Dw/cwlWgDEPD3NCFqkWzICp1DP2/m
         MS6QX0DvYcWr/M2C7QjUOUYVVntOKiUojD57E+CLBVjON6ifvbG1pFyNZq1Tp0rVo44E
         kwpTriqk24CpzyfqNwyaYHxSlYm4uYp1evSFvpmmWpsUiz6ew2hG3ASefll/Zh9JfwG7
         3QCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781075421; x=1781680221;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fXb6ece795ot4aiL/c3+BkKfpbmqqD6TahVlw7jD4dY=;
        b=F84zycAsai3QPMVsMHOLSbCD2RvzV0i2YIGaZVF4n7evcIIOtZ3N04wOlgk8THCdrP
         JqK8HASVvFVv4zE13TTUwtbtX+F6PyRQ4tx8ZBsF3uLHd7xZFJcVoY1Qs256fTCGjHYn
         yhX8ELcdXttxwHIqkVDnhxxjSUZqUcN1NCP8KIQz/e3DdGYZx9UnySDQ3/R2bnQqM14l
         bUBJk3fhoaB2CzCLnlGYdROwsb9zh6/83pqe2ndaaOFjPPDDL+Ho/SE57urGcH1rjoju
         1h0HQzPCYEW6RXf7COXGJGFtLffnHZBbAMxdKmhENFEpyUYTfme27oOBIXtD2QWgPVy5
         eNlA==
X-Forwarded-Encrypted: i=1; AFNElJ+jes/YXKZvbcEBY8HYGppx/GE6rZaZWpwj5TTel78vTHw43y8G0M+p1o2NAAmzSy294FYbxVFaVOG3@vger.kernel.org
X-Gm-Message-State: AOJu0Ywwu7/xWH50wPcaec5USmd5FxFJpqRvYyOABVE5+SQKrQPucgoj
	2bCu4FZw8SvozlXqZ9686nKC9vmlgfY6QK3zGheL72C3JwZ2FC3XzIvLFSsS/BzKq5jQJXVntVL
	q8ZGzu1FNj1XSgz3iTPVpUhUFVQYVyNZpPx2MRDH+I89JdRUEbw8d+4K6BjLSc3U6
X-Gm-Gg: Acq92OFB7xBXzl7PHzi+yBlwuH3WmTKA7m84cxcpkgGjjRozMXJjPrwyUf3Kbp0rqGC
	Sx5oZdxKC1ZApce5Q8uf70JEnvnsbIo6AzWPrV37wWnAyIq0YWfPgR/DP+/d3Uc4eTw65pXSr56
	ahcFAFXtx2BuoDha1kk2mhwEWfTN9xyQXj5lntdDHtaHkoux8kpgi95Ua9/xCvjCOFfPDXDcLhl
	42MpZKSI7YHqaUQvCMcquLRAeAn4Hp0tu54hLey3Z9pzHVemP4e9Xl7L+FP1EsnYwup032qqnLm
	Z44yeqcE6iZbpsFGgK4UtUXxE7F+uuAf2nf9tt+ODavuiL3rn0KZTzu3qW41ri30nSroRiQvXC9
	9psBhuaCQzYFE6AZZSMb3vEtIqrRB9d+PzD9F8uX72tW3N/ixrpg2QK3kcFKz8P7Ef9QPcChNEp
	va2YqZRHwx
X-Received: by 2002:a05:693c:3116:b0:304:d600:8731 with SMTP id 5a478bee46e88-3078000cf62mr11787773eec.15.1781075421060;
        Wed, 10 Jun 2026 00:10:21 -0700 (PDT)
X-Received: by 2002:a05:693c:3116:b0:304:d600:8731 with SMTP id 5a478bee46e88-3078000cf62mr11787738eec.15.1781075420492;
        Wed, 10 Jun 2026 00:10:20 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30791f6381fsm15947860eec.0.2026.06.10.00.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 00:10:20 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 00:10:13 -0700
Subject: [PATCH] dt-bindings: soc: qcom: qcom,pmic-glink: Add Maili
 compatible string
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-maili-pmic-glink-v1-1-a6ba02d6deba@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANQNKWoC/yXMQQ6CMBBG4auQWTNJIYrCVQgL2hnxFyikRWNCu
 LtVl9/ivZ2iBmikJtsp6AsRi08o8ozcvfeDMiSZSlNWpioMzz0m8DrD8TDBj2zdSa61XETOllK
 2Br3h/Vu23d/xaR/qtu+HjuMDNVw0NXQAAAA=
X-Change-ID: 20260610-maili-pmic-glink-bc4d89d7dd5b
To: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781075419; l=1100;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=CKh0/ez08/oWAd1EC8MVRN8pQSg9MrtVXxPDqpIuVEY=;
 b=8nSfpc45ikx9H3S21ihahdwdcZo1rHgnrvi9LmSZ994ebO3Lgqy7vdCOJSjcL+rUDIwAGZSQX
 atDaJaZwRvcB3gWCC0kO9BLriwbwYwQcHzaodeaiGKZVdgjuVpZnZyj
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-GUID: s0IgJD6CZ5z9OaOeDuO8JSr97vGuHJaP
X-Proofpoint-ORIG-GUID: s0IgJD6CZ5z9OaOeDuO8JSr97vGuHJaP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA2NiBTYWx0ZWRfX1J54uhTIlsee
 0TFX38EmpfRZdXkQ21pN+39gJns4Kl11LqA2U9rKv8w4D1g4pZxlMHP0rBulJSkWTvFwYRpnxuH
 Ahflce95WElXAaftzwXuMW0GiWukx7b9k8YwLVxhEDRKlBx6fp0J1A95uUtTGU1x6uItm1YKIZT
 qWgt5brs7PNLgXfUmW+pzDU3NQYVuqXq7uMwxcOgB6Yobl4DW1RWugzBvT41FDE7urEn1aE0pc8
 vVGyhN2392k7KVS6S+xrob3y5QmRqw2VnX0dAHuUD/xGQssnl4bhieVoMewVvDMj0oUvSk6U5ZE
 fFxjIpRkS21EI9cWBBD8DW/ZwDHfRUeM4QFUr5SLruc/WdPNlNkiJlWQg+d4PtqTFpBpVvUkZHP
 PNQIQ5eKJk3tJPaZzpaGl2CaklCPphisTqW3L52JpHdSeqkjund0fGT8mdyNlS311V16e0Wt06l
 dBNwx6hIVa+kqUdzykQ==
X-Authority-Analysis: v=2.4 cv=epLvCIpX c=1 sm=1 tr=0 ts=6a290dde cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Xr6ykaAEL7NZcsm-Xc0A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100066

Maili is a mobile platform that is compatible with Hawi and Kaanapali
platform with respect to pmic-glink support. Add Maili compatible string
with Kaanapali as a fallback.

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
index 2db4288a8a54..16ad4f5698fc 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
@@ -35,6 +35,7 @@ properties:
       - items:
           - enum:
               - qcom,hawi-pmic-glink
+              - qcom,maili-pmic-glink
           - const: qcom,kaanapali-pmic-glink
           - const: qcom,pmic-glink
       - items:

---
base-commit: 8a4062d204752e0d66a1e7e1a2f8834571a8d40f
change-id: 20260610-maili-pmic-glink-bc4d89d7dd5b

Best regards,
--  
Fenglin Wu <fenglin.wu@oss.qualcomm.com>

