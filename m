Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A1138D008
	for <devicetree@vger.kernel.org>; Mon,  6 Apr 2026 17:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775497595; cv=none; b=SZcgJyripOjVn1yT/42FWB84fKhNGJH54Y6nTa+raSCtD+JY0py2fmir6bytx+RjrfcNcZ04rP7nKuxXYF4PJk2InEWIWAy5ee5egz+cBQxc4mKSd/zjw/7gdExK11UQF1yB8Jprd/PiIjiIl/yHZus1EHj7NJVjePUd03WjbXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775497595; c=relaxed/simple;
	bh=QdOC66XZZCWOHZW7ZQoHnf5/HhV95/1mJuOXa+EXJKA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=k1VQnw0lFh3hSoltlN8BlgRbCZubDqEM8VrmRFwtYsrVlE0JL/128SU+HlvwoI6HzTzGQBfok5A78JpmzrAJrDDkX0dNHe2GOsOpTY0op09t71uLnipeVYI5Pcha4itckkZe4mlvKTNtahqROS5n49KJLqFks8vlcM885sug0Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IhYq8dFH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JXRwqrcU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IhYq8dFH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JXRwqrcU"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636ElYP61151547
	for <devicetree@vger.kernel.org>; Mon, 6 Apr 2026 17:46:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9YE85mLITHB
	dDGvg5diTEIAkT3ukV6F3SoC7WLZMtT4=; b=IhYq8dFHht80QXwov6NohP+++xP
	Btnomj0CuqSyHkapzdyB95gVvOrTfBoqqsDpooTMUSTSt4BMHJ+tmVFcOZBmAX+s
	XMytEXsdaPj+f5T6iNsIcI/twoNJMkHiQ3SVX7dF3z6CIRxsBzBSULjz7S8ocXGl
	jelct0gj7FEQFLW4ezK3YtwVwUv0q0GQzsXwv7ruYQkiI+dulSb2TwhNpUh9g+x0
	5NGOwhaZoV5qvpAg/WzkE8UaQRhg6qwYfInzW/MqeKrJexMJq9wmdJHyB2BQGLL9
	3f0C5LToUqrx+0+1MqisAfB1gNSsLgRLMy50qrjvfbm2dA07hB6OT625niw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcewerkw6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 17:46:33 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c76ad3b732eso6509234a12.1
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 10:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775497592; x=1776102392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9YE85mLITHBdDGvg5diTEIAkT3ukV6F3SoC7WLZMtT4=;
        b=JXRwqrcUBfXC9C7/DCYmdhKkM/Uvt/hc9ex9RpV4tRIBn8B/sh3PfA9n2dD1B7Uwge
         49tst3B/lvORHiY4EQfPITSthu1mT4An+w9o27eL613RktYF144fZJNatcYqE3CjWNOx
         zhmS5wfmY0HQPq7U3g2mW1UTmj3Ee6b7h2ssqw97ePr71HutW1VJAUUPlj4S0FHHyRnz
         NIYrE+N4jXw1Wefx3cINKMVV+UPI9p0hbl/yqE6O6fO/SJHXBOZz72gcNKzBlal53k7b
         fQO5eE/r4xE+lBvRFbo9gqaMK0Hb9C1E6lZvvHD0aQCDo62MpXOOqbwXinqghSsJHLsk
         +jmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775497592; x=1776102392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9YE85mLITHBdDGvg5diTEIAkT3ukV6F3SoC7WLZMtT4=;
        b=XBa3CDw6O/4pKpWLpg3aUrKE3gHwHjJv5rRsmBHwWFKvIrUsZYkEZv/3KvYxsM03Sk
         zc79bjMuzFXeQdET8XOIplEHo2RhwYGMZqxptm6omZbsXpZVzHwhZrCi0T/qk25gOPdZ
         uC6IU0Ow/6LyKt3qPDiKwE/Gq7ZYLUPLYewiczqzw/AlLVXSkHwbKZDyDGRwsYBUDPS8
         ofVa1FGGRbV7gr3XymT+oL16Ht2HG+GtpCGBxa6UzbcTZATLjXV/P5g0hgbn2F2pC/sz
         mw5kb22LVl/LqToBTp9hxlxDFXYItH1T6IETsV5+FZXR7dsjbyfS+hR4mAYfAdPN0wSa
         AWAg==
X-Forwarded-Encrypted: i=1; AJvYcCX2RC2u9DE5meH9rWAYkGV1/QxirYZJi+jWac9VG2GeM68UOd6+cChlwJGeYgU2k1ODxCiQdOQlOERe@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5t/ZwXR25Xkf8MFNRO69v/Md/CoVYms808VtX7nf4hHw293Jx
	9n86v7fE4WX2mDaWREfq96DHodh//xoAt8g9OFk8sHckxfLMCUoTNGE9bgBoQJwUvuQbEPCsBVP
	YiVNHKcViiYGP3OOkgm1VB6LZbBQ6U7ZO15UbGSfLMatFjx3WeJZaCTN5ApynpkDA
X-Gm-Gg: AeBDieu7x9K1gbyQTFVZZYxw+Y1i5s7gWkekpIf3NFDSfb704fzSCAAqC6gQaKc99e7
	wdqy/vG1KwHToaU8k0xgkdHaGCk8iT14jZLZBjdVoYm+v/IhQMgqdRWh0E6uzes+ZTomm/mjXHI
	XOSPU1Ytijrjj8zhfj54GcywxWtPBOZgcW9x6tefd+z5NwajwtQASPeMLIH7w7E3QTCnCsLIZvS
	ooSc+Ksv7OqKB6+W76RlFwDtqrTXyTFzjT984PrWfQXHEIKRdvRQjSnZILCYBpNPWhFdrOzO2XE
	UWkGO4VZB63xtlUcHJRdGj0vGM9fyWbC48i26S8DAVWjz99MEBiz9U13uwUhWCz6d7sQLl5S5CM
	UmB7DBzHxWKhbNm7sY9zpkh0bnFz80/AFMjtm0PyQXupm27rFEsrDfFn9o+8=
X-Received: by 2002:a05:6a00:3696:b0:829:86a5:d30a with SMTP id d2e1a72fcca58-82d0da772d5mr13406114b3a.16.1775497591922;
        Mon, 06 Apr 2026 10:46:31 -0700 (PDT)
X-Received: by 2002:a05:6a00:3696:b0:829:86a5:d30a with SMTP id d2e1a72fcca58-82d0da772d5mr13406069b3a.16.1775497591351;
        Mon, 06 Apr 2026 10:46:31 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b5f1dbsm15227400b3a.27.2026.04.06.10.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 10:46:30 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v3 2/3] arm64: dts: qcom: kaanpaali: Add USB support for MTP platform
Date: Mon,  6 Apr 2026 23:16:12 +0530
Message-Id: <20260406174613.3388987-3-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260406174613.3388987-1-krishna.kurapati@oss.qualcomm.com>
References: <20260406174613.3388987-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: KpSmPNfQuzJEN5SyvXe40y11AIq8GKJL
X-Authority-Analysis: v=2.4 cv=E4nAZKdl c=1 sm=1 tr=0 ts=69d3f179 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=FoofZWJxhLOGeeMvmPsA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDE3NCBTYWx0ZWRfX8nohITb9VItE
 b8+GP7hpOaq+geaPCUkQs3ZKSaJv4L8oZpMofXfAzpCyN+kQD5MiJEocX3z9Hl2p+HVQVX84V4q
 HSerz+oZnVwXNEdIioXbYwdbJMnvUYELIqu21p7WwV6I+CoKhDTLi9To5rmpm0lb8UTClVf2I+e
 a0E/OpngqbJaVktySiMHaZKV2eI28UI6rP0QAshFbYNror3Sbgby7qGb9EGp2Jj9QnT/DS3SADW
 iIe+EhfDwG+F5GWB7fwt7vSIphFJAEzA6+FPOuA7HbT1oJLmg16T9lDW6OWtQTrj4MJS7D2sE8G
 KG/bcgwqxHFmucuvdJ88Spwb5TGVOGlAEO3gmhM7ZEcGyhgtBLgj4aXCGvznMIZPuRl8+hdVFgw
 r/1xXk03OpwfFKRwLRoGAGRCV/Z5UDSVUzAB/fEO/OnkeTVXUr6bClMMXz5N6mhOQwusynM4wb4
 yoQbTYEw9XFos7nIfAQ==
X-Proofpoint-GUID: KpSmPNfQuzJEN5SyvXe40y11AIq8GKJL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604060174

From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>

Enable USB support on Kaanapali MTP variant. Enable USB controller in
device mode till glink node is added.

Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
index 07247dc98b70..f9b5b5718b90 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
@@ -952,6 +952,11 @@ wifi@0 {
 	};
 };
 
+&pmih0108_e1_eusb2_repeater {
+	vdd18-supply = <&vreg_l15b_1p8>;
+	vdd3-supply = <&vreg_l5b_3p1>;
+};
+
 &pmh0101_flash {
 	status = "okay";
 
@@ -1321,3 +1326,25 @@ &ufs_mem_phy {
 
 	status = "okay";
 };
+
+&usb {
+	dr_mode = "peripheral";
+
+	status = "okay";
+};
+
+&usb_hsphy {
+	vdd-supply = <&vreg_l4f_0p8>;
+	vdda12-supply = <&vreg_l1d_1p2>;
+
+	phys = <&pmih0108_e1_eusb2_repeater>;
+
+	status = "okay";
+};
+
+&usb_dp_qmpphy {
+	vdda-phy-supply = <&vreg_l1d_1p2>;
+	vdda-pll-supply = <&vreg_l4f_0p8>;
+
+	status = "okay";
+};
-- 
2.34.1

