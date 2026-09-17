Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A47D4CDA15
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 11:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789646092; cv=none; b=Btz05IVdi7jLAFzNwwcwfHr15LoXpYhRVnYEPvXu2ZikZ3+aSGOZuOL4gmvCGJhIjzkHqihFaONOwIYCy4XwJhBcXnFH1xGw173MBtiCi2HQjwQwgw1VAgPYTkEnpefcj8CUc2gdaFuN3EkpfAjQ7zYg3idZ0cAy6IM2jRyjxXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789646092; c=relaxed/simple;
	bh=o5+5tvpe0ZPElsvDSlWdf0J/aKPzIjOAQ/3OGEfPAgc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A0W010ifqK8K9XBubYAWRN0pnLgUdThnFoxAGzI/2mZtXWJyRz8wjgT/Y8ktYz++xzLb8GPNXTxMCZkeUKj7UoovE8ydwGnB81CvPXU0OnYHTjFV/yJk0jjb/QphgXWzNSduKsKTH2cwyAkXOjFL8gdjc9d7LMevfVCinkHflN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fa9XRUS3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=an1IJ64s; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fa9XRUS3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="an1IJ64s"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZZZS2410439
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 11:54:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZC54jYxJJtuuW78KoOpMV5NKoYluv61XVYUBsfKb3t8=; b=fa9XRUS33Z8gxgy3
	UfjfnRrJ+nlof8ovW8+nKgZGbWWhJiS1niw3rJ0aUhxf5hFfW4mJUoJRBf+eOuin
	ElmEIpkC+0wrVY4QkjMkXPmJtiXO5QRv6vbUFoVIT5IK4MqxkzlixFm2DGm06tWf
	osWeSRMjFej7jn2E0zw7po6ogOxnM0zsTJ5vEGpTVEmIELuU9lU/Blg6wCANTxkE
	byckj9CW60z4MnlAoPG9jAkKL4PkY895X53Sy9WAeKxNAZDLSLTb0qq6YIwbAHee
	7HAbO0dzvxSGKvbPXqq+VLssqMgr83jfMoPK+shCBFTpNO7cz8W6TUQycY9riG/5
	h+ny4w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grdd6gmcm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 11:54:41 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-86a2639398cso1571669b3a.3
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 04:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789646081; x=1790250881; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZC54jYxJJtuuW78KoOpMV5NKoYluv61XVYUBsfKb3t8=;
        b=an1IJ64sTZlH7ORh5g9y/QPR7d09lxTfm/dgUYrAebGp4viLkZVdOP+BVLJcZVPJbs
         qgd9ANSaMq+L18baz/TQJ3XF2ds4AKOnT63nr60uySRIVCvguClVdoKeMoB6XzHEDNYB
         B3AUhv2z/FO+Z7oxnZ1/oyFyPTYTjlcpkh5HkXkYoBkOfmuJcFmHqjOjv7GsgQE8TINq
         idAF2TQRg/5iLLY561BQb28CgDsfqAOx2KRUXazB/EWGJ5xBFpvbIISwSQo9XbVM5bES
         XypqwSbbDwfcAq36G+FHY18o4CttPImZJmAEByD/JWjOc4JoyRmc+Xyka7HH0pp88TIy
         L22A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789646081; x=1790250881;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZC54jYxJJtuuW78KoOpMV5NKoYluv61XVYUBsfKb3t8=;
        b=C4rnf3zejPI/38nY0H16JdgbU5geJOLJXtwfkfewycAu4rClb+d8CcjoflhzRGIxTo
         QttHHpX7i2VSMw1gcO9dpS/EB2xI1ceRgcxqSTHp29eWO0sc0mTeIF3TBi2vBgVjvMZM
         tAVUXBWDrLEtQ50F87w2mXyQMTVg8O2KnfePpcLpXsB9shBsCkFV3E42bb9adrcAAp5W
         9p85pg6VEPfrl0wwE43YA3jThtwml2ltdTKSlDTma9gCwgNI2agyUkutPkPI9XfFA63i
         y6EIZKIZHZVeBHZwx/FbxB9cMvXW5l6IFUyRdhgdEiSoEGAF2fMcG9lZXTWLTPrNVhkL
         Qabg==
X-Forwarded-Encrypted: i=1; AKwUvByJEL+O1mfCVjobHzzeZb2htBST9e8OGrTcEyZwkOmm/XrCOv1f0L8LtBXSj7/HOr4PqRmv4hhnHM6G@vger.kernel.org
X-Gm-Message-State: AFuF++nKTHUAwuHheeJdzOyJYB/m26QoPZdheU50dX+BkX87XXD+If0M
	VW7G5vUpcsNuogImt25chKPNbN6PD+1abEy+TSPpdj9TG+PvJ6/SAWak4xwkZuvp4YAMmwLAWt6
	fGapYKOQCLvTrDxb/omqrdJ3ueLfJgdYPqQq6Y3N9we2IydvMDJYNCGVuGdq1ZY8b
X-Gm-Gg: AYBFou0mwVH0CRZce0EH8C3YiuLTJHhFf/OHAgtdPTP69qIe5Cb6HTsZI4CLvreKhzc
	EOLJMu9Vou0hpWn7m4SVGPywT0jiNTdjMVgdfIcF5qcTAI1ID6pCXk980BDAYpV+uZStkKJvEnN
	n30GtiQBGt51tuTt27oUcQ+FhmZ7/VYkB0df6ncnsi9MC4bTkek7Wet6eT7eRxFgLbB4SbTIhsC
	NSwpMa9hqY4Wm6MSoBp1V5AhT0HTU5Jv7Gd+3+1/9uXBt/xoDShmSRwuYR8WH8f29/SoH42mutX
	X6KwtpDiOZJIryGZbpHX0XhgR2SylWVxeHDAiQqHmHXgBSeb4JyEDo6OxnGOd2nv6rgiSojtwIy
	9c3ouKPgwJsIhIcYMKMZhfOUWhs3+93liDw==
X-Received: by 2002:a05:6a21:517:b0:3d3:ae0f:5269 with SMTP id adf61e73a8af0-3dd5f72b339mr16718039637.21.1789646080758;
        Thu, 17 Sep 2026 04:54:40 -0700 (PDT)
X-Received: by 2002:a05:6a21:517:b0:3d3:ae0f:5269 with SMTP id adf61e73a8af0-3dd5f72b339mr16717976637.21.1789646080323;
        Thu, 17 Sep 2026 04:54:40 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf596e1f6sm18249500eec.1.2026.09.17.04.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 04:54:40 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:24:09 +0530
Subject: [PATCH v2 01/18] ARM: dts: qcom: sdx55: Fix PCIe WAKE# GPIO
 polarity
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-root_port-v2-1-0d627d0856d5@oss.qualcomm.com>
References: <20260917-root_port-v2-0-0d627d0856d5@oss.qualcomm.com>
In-Reply-To: <20260917-root_port-v2-0-0d627d0856d5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789646072; l=966;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=o5+5tvpe0ZPElsvDSlWdf0J/aKPzIjOAQ/3OGEfPAgc=;
 b=Wzddv6EHdKemMLY4IIEjkKoiDG55j631UOXiqRlnlH4xAnxhjM8RLy3EEtX0Gb8sBQ93X6hNK
 mwCiT8gmLGJBgp8xO/YmYRqH7FilkLrZH1NQdvd4O7JhOhyG8XbRqxO
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: PZmN1PWBRKOuvmCEgD7HE3IAIUDBZIyr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE2NiBTYWx0ZWRfXw9ML+tCAb5vL
 7FyM5va6Q6j52wMdRcI+IsDf0cZOnaBcIM40m7yIudiaAU5fEJVHT0bxZFeODaMN52I6JdOvDW+
 30Ficz5suZc+hvPMv8Oqh+qxKswGu0JDejV7voS56uwV0H2OF7L5e8li0DtOj865U1/kszn3HmA
 l/Z9KVA9PstmrNWTSbctjyz0PWWa4wTE00FpPlC6WWzBrtJzTeBUSHVKn1RZ5G+j5cqAgd/CKO/
 BJDyQWMSbaYgPXaAsCv1SXcdeRcU/EhUy+pMgFHc/RLO9k4GmHQn//LA0PyLLcO0naWo7Lc74Ji
 cTdrVYI0BT0r1MxpTZ/UE/lLVJVobGwdQs/EvkVYq1rm7AdW+mHSX4Vz7zkby+cCu8Fbv68heOb
 mmxR2G3OY/bxOcdkiWBekTPjVWGK/h1FdOy8ioC008WJoYrE2rHSEUCwumcJlVgCt+p0YVXx9+x
 Mj/JrNweiSMU988vV2Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE2NiBTYWx0ZWRfXyUWz9V7yHCHs
 52X01vskbhfIiLzi2bCqZ1OycW6x2V2yqRs+8IVkIcMT/XZIDprHJuLnEhyNotjZQdzq82aKl9r
 DcGGMFT4UgURNrr6jvjO/ZsHzRrh7A4=
X-Authority-Analysis: v=2.4 cv=GeOCDgXL c=1 sm=1 tr=0 ts=6aabd501 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=bRpLjHfgeuKP4GRv53IA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: PZmN1PWBRKOuvmCEgD7HE3IAIUDBZIyr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170166

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts b/arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts
index d23b8ec08af4..0443a86899a9 100644
--- a/arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts
+++ b/arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts
@@ -249,7 +249,7 @@ &pcie_phy {
 
 &pcie_rc {
 	perst-gpios = <&tlmm 57 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 53 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 53 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie_default>;
 	pinctrl-names = "default";

-- 
2.34.1

