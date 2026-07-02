Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E087349AF5
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 18:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783017891; cv=none; b=e4yf/KuXtt61fDToDIPtX00KL8X4jkbmtwATfyfAjZAztNF+seaMLYe43aAeQQAobCqKaS+3P4nwXDtWCEtZW0ia+bOruE0H6ITstOyEC8YzhJ3gL2JXXNMiBzc6AL5UB6KIX12TmOrmAKUAMUWxXY4Ay0HlEmpIJaPOetk1LaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783017891; c=relaxed/simple;
	bh=2tsxkNR9F5pO8FNQFuKchWU6sLm5NFEmOJkyNUp1pj4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ju1TYymZN+6pVJGiIYVyqBoKEUK/OjO+yUzgGCuD2iJZQH7WbKg5uTHGSHlTNvp5mZSVSfNOgSMADj4eXDcraJyo9XYWDt7IFxeF1vUR8LglkAmRYDS9NsKhDPE6nncYDdRBcNUGiT4wIRzaaSw2PAF7kt1zXtQzK/SAh2pgqQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DjY6VnkY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T56/P66L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DjY6VnkY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T56/P66L"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662E3K3W514999
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 18:44:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=6MDHD8hwteVhhiUjTnaS29ZW7oOdQOR/atW
	tDXjukkY=; b=DjY6VnkY3vN9Rul4q0vxLmpCwl/4E4/Ffx0rtpYi4rPZ+QoS5ji
	7ookkELsSSAntvh2O/l0yN4FRQmT0KP9KU33neKsadlTRRmRs+Lb0lh7tIg2ReLC
	IeDEGluhrZcEIZc6l+VPYR+FdB7FLGUwBigWg0Hby+tLe5UI2TKiJIXQIDqRX+yT
	sodXKzzhIfz2LjMx57Vmp3OWvYKdOk22CMFzCZRCRWzB5ZyfSnkDeipIMwvhao+q
	IdjI/frr/wetrJv+QYyphjbniNTxG1ZjAJ9sAKMCAg5Xl2Lo+EMLNcTwAssdEN49
	By5k/h1tTyNZ/jEaaiBql8zcZIvq0wyU2Jg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5npra9ym-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 18:44:49 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c98a4ded1d7so1463272a12.3
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 11:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783017889; x=1783622689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6MDHD8hwteVhhiUjTnaS29ZW7oOdQOR/atWtDXjukkY=;
        b=T56/P66LxVtfz7OcYe7KcrrPG2B1cU7GjdJRMG3FRs+M3d1rNe1xnTNSaacU5tjFhQ
         xeesg+HdlDMcfRuZEXq2SRSJMd27IGH80BV9wVdweaLGfo2XacUxUbLeJ3HFyBIibVvS
         LbL0vIqhJd00VSfad/SDDHxuhSYT7VG4QKdDaYxqAx8uOpDNfIDRmER4SCzS/Fb6FgcF
         GcSLqn4oASb7kKyLT8nbsFHyIqD4JjpytNXqEG3r/3iAia8W85UZ6PIvTwrKNUq6hEIF
         /jvkc1+UNkXWG7Az7qBg8KavGaSfhxyBsOUlWV2N33fZAttC0GF9Tv0xl8ClwRQqvobH
         6XLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783017889; x=1783622689;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6MDHD8hwteVhhiUjTnaS29ZW7oOdQOR/atWtDXjukkY=;
        b=Erj9B2UrP/ak6C0Q7W6G80J5hG0Z6Y2m4VXym1JZL22eSajgm21xLmGRhjklFEw/cj
         CAhKdxmTpRDBbg2nKUJXKs/aSNZJs06Ka7+BWdCUkWaVCYdksslKE1SqFSGvZld9m4Fk
         l9pfs9J8xXHcdfbTSfTqF5s1ReQXHiKHkKL9KtGk/tYeHY3SwaG0/7LhbzWfi008A2iO
         jbysRi+rjpWZPO6ESr4ZkbsGOfN1z7JD2Yepr3lihnuvbhDui600IjYcOxbbrAGxa2cS
         O85tNvdBtuM1v1vVqvddIZ6XIqrwTjeIrDNk4urU4vo0OMp0nw8OhMB+1vdGdMNSGTq5
         msrA==
X-Forwarded-Encrypted: i=1; AFNElJ/6nSR7UKyMn/wBRIixZVP5b8lak0NlrFY+qb80Ji6gtLeCk3zoaeR4JxkoKRXEk4UzYsfSRZOzn6Uc@vger.kernel.org
X-Gm-Message-State: AOJu0YyWfPNrbgPRbbBAFo4or7j4MQgtiWYlh+ZmT9YyxyhU7eXgODZV
	oWx1/MiL+d50YSauxQ7DQs1/XgwSFhh3RcnB+lEdYtgO13zsdcwxeaIUQ1mUwGiplMEbC4KRrAO
	cbl7cYWLB1uTcyMQZh7hYFk3jjsd+xYWrtVEJr4xx36Y82+T4fEIHVmqfrr+xqumu
X-Gm-Gg: AfdE7ckJ83cDgRU1HErnUuClGRTEmmMWc6W7u1mQ6aBKYNwP6e5b+jEMQOWt9bHSPf+
	yFztlVpts/toO/sNIZu/1Cu2V3TXA6suj2oWG2v8c78p9qFFjS246NDkZZEOpe+vZA7lhJOY5iq
	lqzS77VY+gjJ5Sw+tCQbtXSaDhq8fpPH1zaz1JW5zrHD09sOW1a3IFV7oNF2MBNU5nkM4rPUPxL
	bFmWF2povhoKJ31OveindBxXs+3tN+CqyjGDF0uCcg9sxEIVDEnUNG03W4tWu2hyFESmtpFqqhI
	2/1CXcCTtp0zMELtCUkG0wz2crjhYAZKI5OnwIPXvh4EISq2VQVEJTVkAlVEc53X8fnjoXIR50V
	QwcsC4nnFJpgA+9G8FaHj2Xi2WIFThac2GF9JjnSR0yQTJsuyzxaUGjDjJeIcQIT94zICSIhSr1
	skEFd8
X-Received: by 2002:a05:6a21:e0a6:b0:3b2:86cb:929e with SMTP id adf61e73a8af0-3bfed41d914mr8071407637.46.1783017889054;
        Thu, 02 Jul 2026 11:44:49 -0700 (PDT)
X-Received: by 2002:a05:6a21:e0a6:b0:3b2:86cb:929e with SMTP id adf61e73a8af0-3bfed41d914mr8071376637.46.1783017888569;
        Thu, 02 Jul 2026 11:44:48 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa33asm12367052c88.5.2026.07.02.11.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 11:44:47 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: kaanapali: Add missing properties to usb controller
Date: Fri,  3 Jul 2026 00:14:40 +0530
Message-Id: <20260702184440.442037-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: feKo6mvIb3o_zRB4d7lONqS69t4CMN87
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE5NyBTYWx0ZWRfX7ksbma/FSNMJ
 WDaZK5Dwa3SGrHFA+CkSrFo/Kthno9iDrD0NoeDA4MVqMrnPygZdqaqS3ssj62kM7hPJzkUwiZX
 REeQJC067pQemKFZoW8viSph+YISJQQ=
X-Authority-Analysis: v=2.4 cv=NsvhtcdJ c=1 sm=1 tr=0 ts=6a46b1a1 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=4FngYTFquQ6D0yzj2koA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: feKo6mvIb3o_zRB4d7lONqS69t4CMN87
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE5NyBTYWx0ZWRfX1AKI+OyUvBxy
 3h2vP0hUXZTg0ddTZEEa10K44OPokg+3mRIasKsatxL3Bi2B+wiZ8A19Jy0Uzc+u3nBGjVx3p0Z
 +/HwdoFHU5VUQUtP3ixTuJ7NE/io1OOa4107ogyDkY0hyzgLDZYferJcraJhzcedI0opWrRPE59
 GaJDxIUy7imChNtBwJFXtSeFehcDFQQKG85gzh3U2Es8bFMBQggphAbCRq6AxZqMua7hLr79c/G
 sGFlfzchnH/uDdkVAEW1/AK82XJZh8Q5zMO3BmJqo/1oO3pO+y4msLMIDxnnhYP/UnFqj2pL8tx
 OgGTnBm2GChwcSpe8Yq8WP4GSVs8dLU9GISsPkXV4bSs0ALrs+nJ7eyk9bTzwg19xiaybfsw5hX
 sBL4bkGq56vXZe3ZtsM6GBDSUacCHpzHkda1mmVLDNFzpfVUdkT9xjt7L1lUh2iWLbL91xGuSNq
 JIQi6MJs8A6J6bCklSQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020197

USB controller on Kaanapali SoC is capable of switching role betwen device
and host and also is a wakeup capable device. Add usb-role-switch and
wakeup-source properties to the controller node accordingly.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 7aa9653bd456..c88c5745dcc1 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -3557,6 +3557,9 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			tx-fifo-resize;
 			dma-coherent;
 
+			usb-role-switch;
+			wakeup-source;
+
 			status = "disabled";
 
 			ports {
-- 
2.34.1

