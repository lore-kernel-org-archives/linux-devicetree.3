Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184A04AB1A8
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 09:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792402770; cv=none; b=PyuMl24tLjbHUQOH9jFwJBOQe/LcLLimUzru/YurVIzOvB1yWFyJiYiTa+kAYFixyrwzl89TyiRect+PHXWJW9lOT2NOm+FqgIqk0ovN4UvfrngSPCtrhGRHe7jojDZfl70WgsOfZX3f6n7LvRJA5NuovQTO74v9lzATvErH/BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792402770; c=relaxed/simple;
	bh=c84dLn0TB4Eq5glgT2VM1SOLQznxul3sNGRaB1nurdc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TAzeo/LKA0Kxbv+mbG5WAhpqvS9A+Qv70XzwJBiyOzHS2OHCOXjLy+Witj1RaTxdEXQ0C7ZzNoMAtzVf7sDJVEM7QncojxIW7mQvpV2eOmRyK04QP7+TNdwxk1n1KU2Nf957RZKipsm56MLftcjb0MdPkUZoai8qiJl+8Z7u9K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U4lAlwYu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CwhK4drB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U4lAlwYu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CwhK4drB"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8Or0O1665482
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 09:39:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4qfL7piDG4R
	h9USRDzIt+sOlvyefKyWytxUWwXJiZms=; b=U4lAlwYuFzec8328ewD4N7V9i6X
	RMgaqq+O8Oo7RV90hWDCKKR4MLNLD54z5QV0mUmudBvJRHDUs8GvmY6DnM9+2NW5
	mCqV4YCdvDYHiA/tHNjqwb3OrS+YN8JBx0U7TEBasWvtx+wRsN0rj86LVajAz6Ck
	YB2ve8wg2X6vKocKxZ2PTOK/RNtaB1gpToQVWnTh8ybh9BAV5SnPY64hNvgpzDk2
	+X1H7avsilf3WX0NeTOpisp9TZgIpUD/zH4e+/9FjIa3lATjYH7dzMAYVLl5iAkl
	kY+tj6npqKPHdDzYSAQQm65IneE0AoagioPpzkqcwXGO7VYQjNl3oJVDdkA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3n0dx3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 09:39:27 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ad3bf3fe2fso227251a91.0
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 02:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792402766; x=1793007566; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4qfL7piDG4Rh9USRDzIt+sOlvyefKyWytxUWwXJiZms=;
        b=CwhK4drBDY0HzCZshW3Pt5+iTgoJ+xUrMIPGcAfhz/2Tm2Pl3o5HgXGnxuKzh/XSWq
         WQEGbzO1sq3+Xt1e+dAJkMjRHzzjehaR3YsLI2Y8+RE15Fwl4LLjhDYgGlt+iTDbM4L2
         YMGEiwoUceJehrZdytF2neaZP0p0nK4VJ51f67QIc5kv6744xgi017UOfnQ06P+fjtiF
         A0rMHhUTRoFNEeT1gjVqSlHCpCoQHyKpzUa01NWUQhXG4V9FU2cXhIlhSO1fbMAC0eGA
         +qoA++UcPaRB99ro902o9xmCho9Z+7fCZ9mBxI17xZGAeU8L6JPB747dcajCPmzC7WnK
         nMPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792402766; x=1793007566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4qfL7piDG4Rh9USRDzIt+sOlvyefKyWytxUWwXJiZms=;
        b=kAZNcLjjyKRx6FBt9eYmjlNi3iVhXA9m5qsQoBNUZ1zwBg/EfczsuPi7bQTUbg3yGd
         xiVDM/n7t3IgMHFjrAxdlXQFNNcSld3+y+6dOkLm0ZVxdEd9u6/ZUm6xBuEfXyVJcG4h
         T2e1ZEY+cqkgje1Lu4W08SzKl3+1AVaKEL7VRGgILIx3aCfUELMdukwvr4xYLv0eenpb
         +wMoWrMjZtpZXrO1mACzGbML1rfzexgAR54gxDpFUh2ELCZsmlB67C8JcOY/ULCWMCPW
         fZmlXavsgZ2nCRIUxoZWteoAzSs/kXYhN24UUbEdwj8SxyDdNq1c/iEOnTqBn9vwVnV0
         MQbA==
X-Forwarded-Encrypted: i=1; AKwUvByWPXGqeu+xb54Cyn7lY9TrkOyxzqF6Gqt/jeQTYV+T3xcxDWX2HpKqsbp23NhyBKRC1t82+roeYX3B@vger.kernel.org
X-Gm-Message-State: AFq9FYJcFs4gd81gZ16jyWjriie6FV2jUm4NsrM2zMl2j2GX7DoPvpjR
	T6qJkdvLH+0yUUGAY86oQJd1OBEXe2BOUB1k/peuSkdVPQGWtrRhnybtdDwvg/nu/APKKu/NteQ
	HCB3D7FXe6ImLA+Hs4zQcUeeU0xg35IwVPx4MRjc7v47aY6Iv2ORabUcxmh3V5sCT
X-Gm-Gg: AYBFou34VwrLYmo9euZhM1q0NabUegG2F+w+NQBAt7mGZ0e7Yo2s/CnZDCR00ssZMlm
	oOOwxrf18ZBKaHZmBPhiWBb/lG2jw4jXD1O/f6s4JvrVJgj1uppcr6X4zAvRrg1ahRXSTpnwTZi
	EurXCsA8Ga6f6BY7GpCQo3nZJhqLQ1A09IeTPKKeylhrv+4f9Rnr01Iu+1GJQcUeBjOU8EVzjAt
	GztHJ/B7aiWP/MuvGX2Xr+/GTHJxPdKRnnhFfRMmchfMKqABM3C54Ph54oguRpatpDY1W8VxMpB
	T5BSLEJqXu+vz8BQE5HX3DXbsn/OuWVsZqwbsxU+F84XhxsHXHAS4c/vUmBR5x1TrhJ0/CLQ/jJ
	JU3DRnr4M31MtPSE5r7BVeCs0XJf9
X-Received: by 2002:a17:90b:1845:b0:3ab:a188:b898 with SMTP id 98e67ed59e1d1-3aceea27828mr9020703a91.2.1792402766495;
        Mon, 19 Oct 2026 02:39:26 -0700 (PDT)
X-Received: by 2002:a17:90b:1845:b0:3ab:a188:b898 with SMTP id 98e67ed59e1d1-3aceea27828mr9020689a91.2.1792402766058;
        Mon, 19 Oct 2026 02:39:26 -0700 (PDT)
Received: from sdciot-sh07-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac94627250sm19758688a91.8.2026.10.19.02.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 02:39:25 -0700 (PDT)
From: Linghui Wu <linghui.wu@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linghui Wu <linghui.wu@oss.qualcomm.com>
Subject: [PATCH v3 1/3] dt-bindings: regulator: qcom,wcn3990-pmu: document
Date: Mon, 19 Oct 2026 17:39:09 +0800
Message-ID: <20261019093911.3199891-2-linghui.wu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019093911.3199891-1-linghui.wu@oss.qualcomm.com>
References: <20261014121910.1509541-1-linghui.wu@oss.qualcomm.com>
 <20261019093911.3199891-1-linghui.wu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzOCBTYWx0ZWRfXx6pcJlzZnge8
 LeNfzwGprcjnc4Ko7I4lITSGWkHqhI213Qb31XYwVDPqMkNwZhvTrpn2tQnFaKki8XNF/h1zVJB
 IWKAc9nmf2v7DOJflT/ZfZVE8ORvZbI=
X-Proofpoint-ORIG-GUID: Nf5y6EB5kTBDR6JBDPCvDI4G6CCT54pw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzOCBTYWx0ZWRfX63XwdvV6D4jc
 87HIZ9hepUkw2OJZwi6GrgigGIoFZ6fvmgCv4PfCTWPWDvWIHor+qjWdgRNaXvjaV6n00XGbuu5
 Tel8narRALktmjG3oiCtjkPt3DR8sB+bdxDksOO9zdMZ1vnosWYwvyqzrR0GwH0pUpFf5a4/YBr
 d1u8ehrs6J7iBDrD4i3+0I4zUvoD51Udn5zOy0J37jNGsljywf/dRI1kzQfy6qPjbYmwSqH5CWu
 rHEtIk0fy3JTXx4n3+snGttRMkHf146T2LzaaTzaAhuSz6R/VQP6GNAjftryHR6Qcmqor/IgHsr
 rVsocBToeKgrRPyIXEyrZ/Df3GN9ajdwEQ4AXP1AxrvV3RmS/XOkYo2ZxHc+UjXALwJU8oEfhf0
 qtBtjI9TgAha1dWU3H6SWciDdHoIGAXspNBAvRwQpZZK2Lt/TqaofVazCbwq9WUEIPSAY7j8WDS
 5dsAPngnIVgd6mBCVmQ==
X-Proofpoint-GUID: Nf5y6EB5kTBDR6JBDPCvDI4G6CCT54pw
X-Authority-Analysis: v=2.4 cv=Zf2IpcVA c=1 sm=1 tr=0 ts=6ad5e54f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=brVOnVl_E7YOJ4RIXMgA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190038

The SW_CTRL GPIO can be used as a wake signal on platforms where the WCN
device needs to wake the application processor.

Document wakeup-source and require the existing swctrl-gpios property
when wakeup-source is present.

Signed-off-by: Linghui Wu <linghui.wu@oss.qualcomm.com>
---
 .../devicetree/bindings/regulator/qcom,wcn3990-pmu.yaml     | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,wcn3990-pmu.yaml b/Documentation/devicetree/bindings/regulator/qcom,wcn3990-pmu.yaml
index 9a7abc878b83..f0372e28c99e 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,wcn3990-pmu.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,wcn3990-pmu.yaml
@@ -42,6 +42,8 @@ properties:
     maxItems: 1
     description: GPIO line indicating the state of the clock supply to the BT module
 
+  wakeup-source: true
+
   clocks:
     maxItems: 1
     description: Reference clock handle
@@ -67,6 +69,10 @@ required:
   - vddrf-supply
   - vddch0-supply
 
+dependentRequired:
+  wakeup-source:
+    - swctrl-gpios
+
 additionalProperties: false
 
 examples:
-- 
2.43.0
