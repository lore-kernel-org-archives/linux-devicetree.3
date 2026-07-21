Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A304470121
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 18:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784658668; cv=none; b=XIiFk9qVxdJ92njpbs0scZ6Q7H9mKiLChyIz10EHrqutt60ifs5O+UOgUfDm51EuL+RpCD+Rp3PmXvlOsf+2bh5Dz3VYdVJTTEweeIXe+q0kFCRJ4vdCeiWQDwm6EVGOrU25HVsA6y3CRSnYbX0fp57R8aRHOQzLskpZE/0I7r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784658668; c=relaxed/simple;
	bh=5I5lbz0IkGnSSf+eD2DnilU/bDrc/JKDX+01r0iVHGs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IhRGq9JggVqZAy+6rG5ONb0C38clSAO91jb9FAdpmUn9wNuymCpQSdKcXvrPqJydTtW/pfbWuAPHLAFZHOHRmtO5YqeBDg0e7bIMsHHdRF5/FoVrNt42v40ewFAp3Wm5qe2ElculVt9HXs1NiM3Yx/Cc0oKovh8avMOHxWy/s3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dx4oqu30; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V6lHUBMb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dx4oqu30";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V6lHUBMb"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LH2bRm2160252
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 18:31:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iSSMm1lsKC/enWVAG+Qh69ldXvQhKbd1hRZPY/y5bDU=; b=Dx4oqu30nVdz6ojr
	CCeeMTi2AXPnZ9KTsF68P6SJV7cSjXKycq0y9Zbc81DWhTMU8emK+QdJM9t7qCIO
	iJFL2/nueCDeyNjMtFTt3LEyFFUnkV9iD/6kBLLu9ZtYLHnDpNC7Aqnkss9NTzVH
	cWvjL5x0NuyTt1N47xLdEsFiic0K59vWgMx9VrMSYSZgGFCF2caMVH7gW3qbxZ/g
	TLTe627HkyLpH0ayhss3k1YHPj9USXBtTVGc3XTizLC1RGR641HUvQsNGvt+yHl9
	1MOEY2StDt9jF8k/gJyczAFNy39g4+JfBY/Qr239WP2a6EmSslvsPYKlgw6v1I26
	tNsecw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9c41jy4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 18:31:06 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cab3e9cd922so6205361a12.0
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 11:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784658666; x=1785263466; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iSSMm1lsKC/enWVAG+Qh69ldXvQhKbd1hRZPY/y5bDU=;
        b=V6lHUBMbOUZLyvYyBO1Ir/QtUVrw9veTuADwCb5RmPrEl8ukCKUY9RsPlV4NJ1zGU1
         jyjxTwJWy7sl5GO/QDTLf2YoUehnKBXb2GJKQEnTy90sJMR/xZiVYlyrMANqglfgc0MW
         MoWU+FE8f5Y7k2UONr6pbUvM1SDULgbiwBb5awtQfpB32ffXaDhRdFuD0Q2d60fKv+7S
         0WvrYQoMXzIfquIwT3K7DexzaDqImoSUAwvq1nlRw0wF9EN85GfHcHMlcOTRUAPX08af
         o2moGVujNGA0ksZG9J2fjyN7+7iX/FCtruXWRZTkRzMrb6ICzGxSmUQ5z2/vRO6Q2xzE
         E21w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784658666; x=1785263466;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iSSMm1lsKC/enWVAG+Qh69ldXvQhKbd1hRZPY/y5bDU=;
        b=K3vMrEb3rfgTTV6kxxqHjxIID1WbABS/U8RiHeBeNU6Xc3+d2ClAhTgXafJv0UEt1l
         HOq4zQhkIxmFNK0sQ8XohyhbEt/+PMfAtr9e8HkS8AEvH5StHY7n3a6MTdR5CEhQNSf+
         ksxvkWkx57yRsyYzp5MgFgUbw/nJHmuMSdNyc2R3M3CzoLxSqG3grwvKA8auHW0yDUQc
         JyGD+3LnAm2HQ+A3fwF4EKjFgoptSSV0+I00HMXh4VKhb0oiIwpy5STVhD4ZxPiLHEqz
         HLgXZE2K6Qy+8q3IufSpJCaKxTKCvAHmQKc99cUKxnjL0V5UFCOLzLirzlTk8m9xgLIh
         i9Vw==
X-Forwarded-Encrypted: i=1; AHgh+Rrt5Com3b06cKFD7v2bXAH95iVbWzM2Q4uoNaByvoIAY/6PBJpUL/90rSfKyET56N9NYxegYDWr1A0R@vger.kernel.org
X-Gm-Message-State: AOJu0YwVwcQOAgV7nDtvn6t+18xGxuWHHsdYhifJ3v6DoYBsODMR287K
	t9ZLVG+5lGEu1FYxsqzVHrnh1KGQs/zp5aZgzXgYtbUDQkJXAfMUTJlNNHwO2Aq8H7jF/rpcZfi
	aR3AFYHAJFjoZNehHfZfUyIbFkXLDeXpdRCh2PH+311x5heHh79asP3bYZF/0T//y
X-Gm-Gg: AR+sD13E1fuZ0L/agRhIp0hw9O+oR8r/rKuO0Sd6YSm2c82c3jsSPYf666FZJxpXtGf
	tTiOjjKhWIer2bz5HiAxoQ+sTBivaa3K8fxyEpdi0OLcfvxf/Scif8fbzb8Xt38MMIScH0YA3v7
	2hju68I+xOYuVlgnMhShU5eWMLUPcmrsXqHRu41Ly2HThrFgcL8CBQug1KoCMyksY6h3ugmhEWx
	9f5Qk0Yfy7hzKzNAZbNEDPwpHzC7Lgl3YOH7DbyGSlWO9Jj9B3uYl4JD7TPxYqDVj5o9KOKph1Q
	vzt8Tqk5Sm28vlSwX8lcbnZLNMZeFBXeaTLuhP1BGI1j9/UUWajog3GJIHvwsDbc75ZRx2gdyJk
	8zktA5UNDJEZWB0q3ufIPM3BagpBkObWRu0k=
X-Received: by 2002:a05:6a20:9397:b0:3c3:a20f:f720 with SMTP id adf61e73a8af0-3c3ad97174cmr19810363637.36.1784658665683;
        Tue, 21 Jul 2026 11:31:05 -0700 (PDT)
X-Received: by 2002:a05:6a20:9397:b0:3c3:a20f:f720 with SMTP id adf61e73a8af0-3c3ad97174cmr19810287637.36.1784658664900;
        Tue, 21 Jul 2026 11:31:04 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1ca3efsm1185298eec.30.2026.07.21.11.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 11:31:04 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 00:00:14 +0530
Subject: [PATCH v2 09/10] arm64: dts: qcom: pmih0108: Enable BCL sensor
 node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-qcom-bcl-hwmon-v2-9-febe2805e17b@oss.qualcomm.com>
References: <20260722-qcom-bcl-hwmon-v2-0-febe2805e17b@oss.qualcomm.com>
In-Reply-To: <20260722-qcom-bcl-hwmon-v2-0-febe2805e17b@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784658614; l=1082;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=5I5lbz0IkGnSSf+eD2DnilU/bDrc/JKDX+01r0iVHGs=;
 b=iwia30B3J83j/rQiJVBqhYlBA1wPb+lMfV//HNpSoPiYboiackd34tc5/CtbDWdBWjEKbVJHc
 f+ztwfbXqDZDQrNuTKi66szybumPag+1gRvYaYXojK3EK/jlPbQwiYV
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Authority-Analysis: v=2.4 cv=I4JVgtgg c=1 sm=1 tr=0 ts=6a5fbaea cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=09zRouN1k7u6xsjrD3kA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: aRz9GbNXk_jcmNv6MVz1KQ1DFmMQoVDU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE5NCBTYWx0ZWRfX+fsW+vuCPGc2
 gucJ5mPmf5b+UcfHu1F+Zl0GD5vhGUPs9v0iSjTk7Y+M7ZyLOyPbUyVNDgHc6aGdjGc7wzwrK4A
 pTgo7BksmG31Q+9Nn9cyvzvrlTXRcV6yaL6qImEUhBSQa+ETt4jE7dCDgfYZ+GL515eeJMUp0rg
 hGhw+g29BIqKKR1zS/zTCK3+YCAJt3xUIt4Qp+BIxTXoD9I3fCC6G8c78ipqydQ2/WZwpTDF+V6
 YockWq81qI0cQ2bdaXy2eOvV434+Tq0wyFF2FdpIQ1tg91VIV5OEr8kTDncHSvrevI6P4jyvVaa
 eQ1hFoPcTEUVpsWeOrt4QVq1DkmmiegOQzD6AJ286o8sJGqS3NJHTfM1yAdfxKaDIil/yVNyEgS
 lWBJIh8ijAJV1qaKO/jQtdcSlBOnCc78R7vggQqxTbsc/npuKoz+wPb7QaOsigx6cSTvjmLNRCx
 /xgPaYNtjiRmfchimcw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE5NCBTYWx0ZWRfX25TjwjWd2+/a
 4fHLvQ1OKHkmAuglBX794APu+9J4kbaAgfD3SG+X6FPkpBGZAI96Oo4SV1kf74Ifdynt21MF+Sx
 wgI1Mzs/BN3FHD1YIkqz4bRrcFfUMBE=
X-Proofpoint-GUID: aRz9GbNXk_jcmNv6MVz1KQ1DFmMQoVDU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210194

Add Battery Current Limiting (BCL) hardware monitor node for pmih0108
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pmih0108.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmih0108.dtsi b/arch/arm64/boot/dts/qcom/pmih0108.dtsi
index 1c875995d881..1f91e788010b 100644
--- a/arch/arm64/boot/dts/qcom/pmih0108.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmih0108.dtsi
@@ -49,6 +49,15 @@ pmih0108_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pmih0108-bcl";
+			reg = <0x4700>;
+			interrupts = <0x7 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x1 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical";
+		};
+
 		pmih0108_gpios: gpio@8800 {
 			compatible = "qcom,pmih0108-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

