Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B89332ECB
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 17:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777312468; cv=none; b=GF3n+uWizvBwzV5uF2h6YGJUCUwKw/Ygw89yU3gy0S1+Y3sFx3kHiSkwUVH+ReRm9W5L+dunSMOyr6vy+v449nDijjJB3sSICfTkdM5vkqAqjGRXahjIVpZj1yZhZPhk9Lv6GS2zj8lpNX1rVTELSI62h7advqzs0XJu4x0+4OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777312468; c=relaxed/simple;
	bh=H7uhZ+16HWzdzWJwbCsCrputCbUs3rrvqkdvxVwe2AA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=cypQS09SEtj324yI39bTLBWnb0/nErZlhkzLvNWna2I75TevWaaoBtmKU7S6NXvjPBaOZmLZdFUYwoJh+hTwD0WEANW/KDKhk/ozEzVjcmZ0wlMfZl7zyl1MXJgO0dAQUDepfp3efQ99nacffSu1E4cYiGyqQUJTJbx/+ypEqcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AYwaI8nU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MP2KIFDF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AYwaI8nU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MP2KIFDF"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RDqZCo665837
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 17:54:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/Ww0CqGEY4qW1eMzLhFoFo
	sf8SrTRYdwf/vxYE8ysHE=; b=AYwaI8nU2GnyZcnSl6yjWkBNjzesuhiRRSz+Tp
	sy7u09dZGClrSzOuG46D5KlXhtsxrZ7kvRtz4nAXQCl3/Gdw+IwT2skoRKxbwzJS
	NFs/MCg5T3g+3or0JCvM2U6T/jX2ecBIxAVXF1B+1Fm0U2Klqybc+p2695ylQF9P
	8z8McoMh9ebh3SfTVJRr6v25KydnWS+P+odeckuQuew+2d0f3WNn7CJR0Xr7NWlw
	esNW3fQ+XsLlEaeAx9CtqNBi4GCctpVOU0WIcPb9cnWKDebgpkATSzqZvfkvHztP
	0gGhfJtotfdkID7Icf2pdXNRAJOtB/4ZqqmOlou7fthoR+fA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt30n2mhj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 17:54:26 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b2ead99f5dso130779055ad.0
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 10:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777312466; x=1777917266; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/Ww0CqGEY4qW1eMzLhFoFosf8SrTRYdwf/vxYE8ysHE=;
        b=MP2KIFDFdOALBCYy5NtGqNg0j61aBMOeNRzSqaOUep7tFyCC5QuMlJHOrZ05AZoMjI
         r9ZYEbEqn04ILjimBT3ADz8upmQhTYh+iL++7oZ/PeH9UQlh/A+XgJQ/wd1EHHJGnFTy
         ji2Aea1omxr7GP4/FT3UxZUWgsm96y89Tnm44AMha2zyjPsVooUtuVzLc5KKh648NWYG
         diPp1e3Ch2ILmEfBUHAw1Jf5KwzeN2mtaPCZRMaWLcu0MEqRqxQtoT49MvKRGWiAskoS
         f/XwDfxUnj6QhzoJPRVKUs8LPyAlKosznwki5ohKuvIJlcwnwtdN2AI2aKBOu7kmHvS4
         ucDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777312466; x=1777917266;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Ww0CqGEY4qW1eMzLhFoFosf8SrTRYdwf/vxYE8ysHE=;
        b=Rn/M0weLsgqHromU1syDJzANjKfH2rdBwA42SQs5fiRS9UkdK6mgunxM6SXvB27gFX
         EyXybJaNDDK9I2sjd9xF0uHfvzOjMhYKN91py0g3TGjIHBQmVen+gvubQdAOg1ZfMe+f
         DpBdEyrY0W+m4hQd2/cfT0HWZOMVvHWZjY9ykNWzgYPICqFfFTX0zMzuh97LTHDepK3J
         WZb76UFQELCuDXBxMDCbJXrecf3mjMONbXV+FaVA1tPI0aiCg9Va1+JmjrilBa6M1TjI
         k0f36t8oef9BpZgJPjGbzyJPkJi9Fp504ftOB7wJW0DckVdeBOL62CcQEKqph4m9T6DK
         yACw==
X-Forwarded-Encrypted: i=1; AFNElJ8JW9t2OWcHVAYYFzer4JyhIEie21Ohwyq99fdoSum6cg5yTB2z3aJw4F+N2ILkhqeyPMS92jJYM3qN@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+cfFtOIoWt1+hKaaHh8sKZG8qd/Vdu5zyPJxsHSMyhml2r1I+
	J7OjNNqxrG3+5zDJxFzmwbR54dSd5c0s/axs/JO3NJC7wl60OswKUWPs3SV/qq3NTN7+gGwIwWW
	uiCit3gkm7baJeE6iGdZxebv/DSw05skewx6cAQtQb5HX+UnDk4aMPkltyMqz+/RW
X-Gm-Gg: AeBDiesrXrvFr7kfIjzJ6QJd2rWiKp9JBiC2I0KST9nJEuvs6VeBYTNyWwkIryPTyCW
	CW5shThLyEoa7Imsh5mrVyZB6wUBO4MTTR1eX1JGXVJWeCluAAXLL4SEdhxABVNcQiJYJ3sR6mk
	jm/2jUaGqjzsvXPNbpEbUMKRjDO96lElMpE5ZtvGFJCKOuRZDSTjlGmKqhQldpnIbUq922xw0Hw
	xReWYcv0EfHy4UoRDyzpoiO0zWV3uguRSggWEuiKL2sJbffe33z7y/hOO6cYVk6i2VVjGcns1Ru
	czuRHChXCUTRoOrccoFsSW+B2b6N56B+kGBiol7ddqAMv2s1MhfbWMWb6OC7WQLL4iFjPHf9qbq
	rtvk+nGak5NQ84pvaxYedeUCoHuysoQDpHGm5bbDyzuN6uT1Es5rJr6w1
X-Received: by 2002:a17:903:3c24:b0:2b7:abc0:3bd7 with SMTP id d9443c01a7336-2b97a8a5a11mr2509605ad.9.1777312465878;
        Mon, 27 Apr 2026 10:54:25 -0700 (PDT)
X-Received: by 2002:a17:903:3c24:b0:2b7:abc0:3bd7 with SMTP id d9443c01a7336-2b97a8a5a11mr2509365ad.9.1777312465405;
        Mon, 27 Apr 2026 10:54:25 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97aa7b60esm1016955ad.17.2026.04.27.10.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:54:25 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 23:23:53 +0530
Subject: [PATCH] arm64: dts: qcom: hamoa-iot-evk: Enable Adreno X1-85 GPU
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-hamoa-evt-gpu-v1-1-5434b5be76f5@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALCi72kC/zXMwQqDMBCE4VeRPXchBmnBVyke0jjRPSSxSRRBf
 HdDpcd/YL6DMpIgU98clLBJlhhqtI+G7GzCBJaxNmmln6rTL56Nj4axFZ6WlUcY1SrVOWdB9bM
 kONl/3nu4O+G7VrbcI31MBtvovZS+CdgL/2kazvMCHcVcZpAAAAA=
X-Change-ID: 20260427-hamoa-evt-gpu-dea01004ffce
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777312461; l=946;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=7ol0WW21RWyziuHQd+8/Be8+w8BvvdhRkpEfn1Y+6fs=;
 b=hRCWXmL33c20KJt4rH5nUkjyMAdV2XALOPdfdeI+ma8u+mTMvoKFaquYq9/v8czRYniGONFgV
 27GHCAydJVpD6uCyc0kpeyP8TKOyEhe1fsIcvAPvetByHLBTWXR+Izp
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE5MCBTYWx0ZWRfX/l/A/i3Wbbmo
 PnBcesYI8DC8vXcma/b/V+P+VA+m4untOSClKSMFgNp0E1u+VOnhJsKWxL9lSIlVoLKYhT++W+6
 CqkDv+jzEIo0Gu+oPK1GZ5iv6anMQz1GcaBagsFu6FgUsVyQV5gyVqzkxFe+5Wz87o/ldZ+f0bg
 52rFUv8xfPELiIbRwBnqoZ2BTDhKiZRZDnsxerNht8KNFSLM4nWDveOzgwNOzQ5YKyQJoj9FCJR
 0HpYMpuJpJtkRRQKrW1rnb1Vtm/2kJxR6ryXWXUVP1tq5Iz6HdrmTsTrduZzcmAp5F3cf/mRSXq
 aWV0SItw/H7s3FdihNn/VIhPiRUCwwfrNFTIpAGeek+d8iOEhKzrgiX2nVatTD6oUPBbbuJ9Wrt
 ahzPtWyQjGnHTmURybx6lrlvI7RqiCSRHm38yCLEWxyC7r1mxkixOPXALn8edlirIob4GApmUpZ
 4Poh3Gcno0q1hxa8OyQ==
X-Proofpoint-GUID: qFSwzp3ZCAQQ31cXjRpzg71MZOqN7rAx
X-Authority-Analysis: v=2.4 cv=efANubEH c=1 sm=1 tr=0 ts=69efa2d2 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Xl3f10jGzgz6Ja07nhwA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: qFSwzp3ZCAQQ31cXjRpzg71MZOqN7rAx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270190

From: Jie Zhang <jie.zhang@oss.qualcomm.com>

Enable GPU for hamoa-iot-evk platform and provide path for zap
shader.

Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index 460f27dcd6f6..b2a2538747f5 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -729,6 +729,14 @@ vreg_pmu_pcie_1p8: ldo9 {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/x1e80100/gen70500_zap.mbn";
+};
+
 &i2c1 {
 	clock-frequency = <400000>;
 	status = "okay";

---
base-commit: 6ffbce0fdf09f89d4f970301f6ce6d6d88d9393c
change-id: 20260427-hamoa-evt-gpu-dea01004ffce

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>

