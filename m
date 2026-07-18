Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7B9380FD4
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 12:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784376391; cv=none; b=eM5A+oUYFkMkDePJqGa434lEWOlCJUkcXZEh24CsIpPglKJsNfdIdhKup78kB01l6DPXtN7nlSvJDwri1sWTY0flYCRrGWaRz+oMyy+FMPeczfh1OwOsCBri6HgzoSqxB5Ud4am34LWrtxv7pj/tQHG0CQsQMwm59lz+sWTJm/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784376391; c=relaxed/simple;
	bh=gLdRfE2XgM5Qeq7CPxLflQL0jRjGrUxewQX4ANsoz5U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o0wVAVASgm52k1bzgKrFzfXEaDhx4T0Pz1nzYoVJH/3pVgrmzdSvimrqPnxAU0MxjmW5rTRmiR/+4sgPrtPvCMFmNLoBkXiiA46673fUxPRnfDT7cMdcqr0GWPzEQs/aJaZfdKbrJMEJcGiiwiF6J4WnRAuqu76Ny84ZRKFM3uM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mdcX0Fg1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R3oEf8m7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mdcX0Fg1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R3oEf8m7"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66IAHGhj026833
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 12:06:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oHfarHg/JbolBLcLFLPYXd9h4HjgHcO+ac0HqAdCJVc=; b=mdcX0Fg1F5ELE2dP
	bcOMzoeGBTZr0Uiquk+iG9i7q8cn8DR1oZ0zEbg6VdtwTZuCBCVImVtnqonEElW+
	ITaklble1z7v9Gk5WxU2oKphi7FwQCSRQoGzgYAl4bYKV7mJu4trQdRZnMzQ13k4
	I+xLmipm/1KTIQRW+elsOm5mQGqsbEJBBYyWSAcvVCvihyS1Do2rOPxEmubJfNOO
	pnDtS607jNcYnpBwfkGzaMQAN7dXKtLRbh/gpXf9Up9lmA/66JjJR6Y9yi3NhIsf
	vba3YZTtfAtG5Bvl3t3lg0egRcWJNPeOBDaUKgbgRc74kg/BspkL3MjlkEcfnWB9
	VzJasg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2nhgnch-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 12:06:27 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ce7fabf76so12167070a91.2
        for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 05:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784376387; x=1784981187; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oHfarHg/JbolBLcLFLPYXd9h4HjgHcO+ac0HqAdCJVc=;
        b=R3oEf8m75FXX0fBm+YvfrSpzCyrBrM58nCtzQhHQj4uRMy01iqQEDZHiSnRyo2h/j7
         PemayjwdACY0sjC2CianRFr0X/3b3FCLduh1PbuIqC/h/lSw/hgB49oTki5mE0tzlT6y
         pzS5ZIdjR/Hh+/wBNkdIf24CB/u52lba/jXzQpmFKfDE8sRg84VfzefSOAcIwGPCrro3
         I61iXx5OYiSpUvXbgpL45qlMSaA0vb6oR4O6YuOasxdV1VQq1n+AYpurPjgAX+FayfdM
         gD43j/2zgXr5rI3iZ9nHTSdMZXTeamTsFKUhG/EhzrgXdt2c3a4NWD31Lq2pICbLBInF
         iyuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784376387; x=1784981187;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oHfarHg/JbolBLcLFLPYXd9h4HjgHcO+ac0HqAdCJVc=;
        b=SlMrtFr589brcnRA1aM7dKLl5DTwfk9h7vwl3I0qPyqHraxJa537s/1XuTFPc027G/
         N0qHr31wu2fwVph4SnciTFLWbaqg4E7WTcZY4ltP7a0kZwfU/sVJG6y/Lg/0hR7DlhyR
         A0dWXMBWQMsDo9ZijA+IcR8oiy9GE75aiS6dCGJd7Jb4f8L/hi8cm0QTGtt7DgrR/4sY
         64vDEk64uQbHzFnU18mXDOHjyR89IFw9knUGuVAcWoRXOv44/v35ononuuwWJQoCEhQG
         TONQ6i5TNsaptUZEAvad0IhRLrcXwUpbP6WROwgwbQWtI0RB/+XlvMEzULOMJXLjwZn4
         xGOg==
X-Forwarded-Encrypted: i=1; AHgh+Roz2t0zztbMeZ12WXkEQTPJLsvAckefkjMDI1KtmMOPO8uWGRHZc70pNo6qnxt93v2NaUjEz8ySrP9z@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/TFS1WkjCccQBPJTqUtpGemuVqJG0Tq/8Biup6UF4BzPIZoZF
	R32VUY29AWYFaMiPd+sOW7ZJJnVFas3ZX3VxcNF8Zu5FR+FQ0ObUaROw4hl51vfWOz4smFvTe/g
	Zsu+lNTmgd6Ardx9oZo4F/PaNzBGRPApea8IMQSp2AcIhhrl0awueNwgXkfWq/asHrePwumMZ0g
	0=
X-Gm-Gg: AfdE7clDqro7WMKo5zgVs2SBFQ+X1uCboNV73SZ3GqbOzs9DqF/iSfyc0xPrv0IZKip
	ZfX0qlyOx1PBlnwTGnMi2WGueecW2Qh+KfM+4b0KxqE0Jz2gMKTi19GZQhUmAjQMHM+wAUvsTb9
	mZfQFuY6t6ws3wHdecFy/p1L49IoDF+Sw5qbFBewR2hNgpPwLzcYMSMSPNptfAbYkI4fW7gnzjK
	Ojk6Anqm3Wogfab6KnJpzFBj5Vm7oKigCFmuF881sQvzLbUuDja9UsscOjpbFW/+mh1mFpzULqy
	k5achUwHYv9h/012CWGbTgDeh01C9RG8v/wmrKvs/EqUQGTRVCOsiPC+ND6hrdB+wAp8a3f89f6
	3jMHUcIooOgnIhGaTEBwyIVl5xvp/zsSXVTzMRLjxs6hU4QluS0GtHpNCRxqNFV6o
X-Received: by 2002:a17:90a:d605:b0:37f:9ce3:ca95 with SMTP id 98e67ed59e1d1-38e4b54436bmr6742268a91.30.1784376386794;
        Sat, 18 Jul 2026 05:06:26 -0700 (PDT)
X-Received: by 2002:a17:90a:d605:b0:37f:9ce3:ca95 with SMTP id 98e67ed59e1d1-38e4b54436bmr6742218a91.30.1784376386241;
        Sat, 18 Jul 2026 05:06:26 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429cf22b3sm17666314eec.0.2026.07.18.05.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 05:06:25 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Sat, 18 Jul 2026 05:06:21 -0700
Subject: [PATCH 1/5] dt-bindings: arm: qcom: Document Kalambo SoC and board
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-b4-kalambo-crd-v1-1-a1069b5a2757@oss.qualcomm.com>
References: <20260718-b4-kalambo-crd-v1-0-a1069b5a2757@oss.qualcomm.com>
In-Reply-To: <20260718-b4-kalambo-crd-v1-0-a1069b5a2757@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784376384; l=969;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=gLdRfE2XgM5Qeq7CPxLflQL0jRjGrUxewQX4ANsoz5U=;
 b=eEJFFhE7ccnlVUtCwj9LgbMDgBuk+fJ5bZHBsY6knHftqdfFK+o0Y7Fn/XeGOM1G4rmxU6eaq
 F3jpVRHROjvCpIdYkBjahLNb13vlyJKBIdgYcuV/iRbI7LrU3Nj7kod
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Authority-Analysis: v=2.4 cv=Le0MLDfi c=1 sm=1 tr=0 ts=6a5b6c43 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=M1bJAJ5Vo8V7ou8my7IA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: Rd39Mjm726XV7VwzAd4XheYn5p0Ekjzc
X-Proofpoint-ORIG-GUID: Rd39Mjm726XV7VwzAd4XheYn5p0Ekjzc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDEyMiBTYWx0ZWRfX9wpqYLHNu/xw
 +UpWEVlQHYVkijCuFJG+67SGqjVNsd1nY+aQoSWFuq/rabUs1COD5tzSNFZhIwudUaNYn7Neewl
 yMKpV3/5XZJcWwiIpKRnzzWXx1jacabasBo4feOyrjsiS0pfb/JkZkjbty87pAgi4SH90svqbL8
 APhSMWvAFUDQ39eFF4Jd4MeL04ubhhuyhnqBLw3h9DmU4E0QS0f6u4+hubvJqE3NTJ6zFeZvMgs
 m7F2MHehoUQEbqDf84uNjRjLfgS9sSceZ+bQNTXU7+R76n76CfV4yGhHKWih4qDrzKefRHgrjTa
 w1XwBc5Ndsigl3CaNSV8SUZ7Hp9xFJPx3OcsG+md74DeCxDdQewTXhBv8tqSMLMFDGaZYs0wcPM
 u9w26VvBVMEeV6IYFNVXCL/m/0lyPreFJF1J8aiHlGbX32PZMMgTWAC8jY1wfoiA91uH6UojRts
 61nWGm1bvn8mNNqDRAg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDEyMiBTYWx0ZWRfX9rYjKJByJK80
 3snehkGzyPFvctgReupqSp2fdMeEg5PE/mrT+LWr5a8LWAoxNTmhVjeIA6cXWKa1Y/HE44tC6yQ
 3NJo9DWfAzMO2keGXS10H+iw/q/Oa4I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_03,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607180122

Qualcomm Kalambo is a derivative of the Mahua SoC with CPU cluster 0
removed, leaving it with just cluster 1. Document the compatible strings
for the Kalambo SoC and the Compute Reference Device (CRD) board based
on it.

Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index c7c9a9279684..b0c07a57bda6 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -174,6 +174,11 @@ properties:
               - qcom,kaanapali-qrd
           - const: qcom,kaanapali
 
+      - items:
+          - enum:
+              - qcom,kalambo-crd
+          - const: qcom,kalambo
+
       - items:
           - enum:
               - qcom,mahua-crd

-- 
2.34.1

