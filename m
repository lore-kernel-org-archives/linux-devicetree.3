Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0BFE48124E
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 12:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791203163; cv=none; b=D3D/SDwQsau32wKBsGOYWZnjS6yy5l6tlQA3uqKM2j3LYINkLS5RQgPPj0PNy2UDzjfm+fa/gPB7m3Orq2VvZafcHZ0YVZ3ir+5qlBaGifZAczGomVAKpjUXv+oNbt2mbOfyoDBKrd3jmXAxJ1gtklTND//Uqw64CyfT2kDI+8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791203163; c=relaxed/simple;
	bh=rsNJE6rdBqS/rQ/BelOoDUkPT/XAtADfvhPMMgL5o4U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EUpvVoQKcZebKyLmLbUBqrYyiS95gvs9IVI8I65I/2dtoJm50wRIF1UjlI7lUv9Oky5Z/t9pcJiKIDoDvTnHP7Gv1a+OrpKRz+NVlyP3e22F2I7Ka+a9GDQuyJ/q5fhE4BSMTopHUD6Mrqhj6IFeJe9PBR/ibUALcLELZQfxh3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jGaJAfFf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HhRMDFok; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jGaJAfFf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HhRMDFok"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695CFOw31925797
	for <devicetree@vger.kernel.org>; Mon, 5 Oct 2026 12:26:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KBLuCW8bSwBh3JDmqul2Zcg881XCgLML0pMkjxqHcw0=; b=jGaJAfFfrN7F68ra
	KPQWVWIDxoFLbcaQ3OM8BtAbkmLI19mxUXW20Oxn6guNcCc+oM94Et3WE8iHxvgU
	N0i9KHmOSXReLTir3S+AaPSwxDf40HmeEEOjb/bj1JW6sq+4hjd4pAG6TQSX5mCA
	ZtxSIToRP+AcuIiVRvVBIPdgT+kV0kjs6/gvj+9R2+Rigb4lIv6QU1BP03nmdtl2
	XvVOx4CRTgd/yUV+sJ92SDMEkdJxOWoObE8EUb806+sQuoJ9v3GEoKWKMojWAAh3
	euy0fe3YD1VU13eaGuJ8h8iDBQls0rO/Ao+3Qe/etML6pgaAiU5hUMia6u7/MGqL
	64+pvw==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h3xgyt22h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 12:26:00 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-820ce3bb94bso1681475a34.0
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 05:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791203160; x=1791807960; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KBLuCW8bSwBh3JDmqul2Zcg881XCgLML0pMkjxqHcw0=;
        b=HhRMDFok+k6jKlRod+Hp83Nui93sy9d/ZTV3yx3dEt5382UmiuJcRTNWRgJVYlZHvF
         XLsBXIAKDm4fXEu1pUu9YuYPiOacHpVw/rMFERTQb4RMfo0lHR9O0UEiFYwaVWr04Fxl
         J8pIy5gB5hkoSyF2YxoJ+WZwNc8V4ykmqTuIvdGIHJI/XScusW56FYfougdZGQNi8Xt0
         8BgNUqD3XWzwwGOxAcDcd5J0QdRxs/2T/0ZOsaF/u2vck4qcRMQUVr6u8w8BOzdyNlqm
         BKMCRJrqFaKLVj1hGRlOD1eU4zC9t18VDN+q+I7mDrOeX4Xi37ZlasKcdzWurfM/fEfB
         FPgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791203160; x=1791807960;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KBLuCW8bSwBh3JDmqul2Zcg881XCgLML0pMkjxqHcw0=;
        b=zYerLzHuwYELuk35r5bQn8BFkV8pIe4KkbcTaTNw/c8mvGhbQnxuqAwAQMXrdmlwNp
         a5AHl5ZWPqheQIliH6QJboDo8ag9huleBVqgbysibIxJUR8eyPQ9Pbd0Rhkrz1w+Z+SS
         MGS24LYIXj9WK0Sw9BbAAAfR5MfENQRFo8gRAxjWTzlz4MqFv6c4G3uZPF3y/0skNs28
         FAAgptBQp0xojUxApt1pSlcx27sWe8uuQqW+Xxf2L8bhpOZUnZFB6DF1WaBX7WjhhjvT
         yVKCrjp1TfiT0hJ5n+3TS6gOzyrd2UuaNY3sIixghKfIxGbVCgnsSzw54Qqd0ivJeRs2
         kMfQ==
X-Forwarded-Encrypted: i=1; AKwUvBzU7Haf0/QZPsnb5oTbp5nabUaU2SeD9KyZ6TP8CMuNfQ+XI/PITrrBetLk2BQ+JY0bflB7n/sCmNZq@vger.kernel.org
X-Gm-Message-State: AFuF++m0jaxC2dk8IT0TdNp4sNv/etJfrhJEHmLFUYS7GFSIeUy1aAiN
	/89xAHrPGXaWlOa3L19OpSYzlLVzslI/8QqcLzD9pdMvQiPLjiG3n0Ar11tl2HlECgmqKCpp9/5
	7qL0fI3Xudlnw1JDlUk7PS5dJYecxFhYeoE4tbowEmj6DWjdPXxenMtn47noKeqy8
X-Gm-Gg: AYBFou02e6X8NQP2inFNZVeNTBv6ndk9zO5s/fB/kq6t364iQbb8Xa8VbJO7gXJDsU2
	ECiI6LXaJFR89diZnGHsJ0p+nGYyNq3oCb3sKaYEqUEILSV89FHQ5fMgnv6qWXNrMeX7rHCJUdm
	MSLehSKSSajZj3hx9wQt5IpY+bPxEBgg8YOh7jRJbU+S0DD4rlonIPJ06phz9JJ+3tSIndjw1Bo
	FgtFtdX5huQXGa4C72LbbvsqYFQTcQWsi65K3FCitxjxctm+bqIGZfBAZrlaeDc5U711B3UxTPV
	cWNB0zAF+1O12SJvkMVINfeR2MOCoQ6/Rlw7hZ6V7fctnI4KuamJDuHB/Qq3a9U6ZTFFerNVshY
	V8iu9iiZBIqCBsMksEYS+OK2W7mIkSrSzcw==
X-Received: by 2002:a05:6830:926:b0:812:3a52:16f with SMTP id 46e09a7af769-8227f99b0acmr10283527a34.3.1791203159531;
        Mon, 05 Oct 2026 05:25:59 -0700 (PDT)
X-Received: by 2002:a05:6830:926:b0:812:3a52:16f with SMTP id 46e09a7af769-8227f99b0acmr10283503a34.3.1791203158986;
        Mon, 05 Oct 2026 05:25:58 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-82273e27adesm10896314a34.0.2026.10.05.05.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 05:25:58 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 17:54:12 +0530
Subject: [PATCH v4 11/12] arm64: dts: qcom: pmih0108: Enable BCL sensor
 node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-qcom-bcl-hwmon-v4-11-50b9a8c730b7@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791203081; l=1209;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=rsNJE6rdBqS/rQ/BelOoDUkPT/XAtADfvhPMMgL5o4U=;
 b=Z9ExX4EPJmHYRM6OMQlJF1Qw37mBoGoH8gb7spV/BNq+wtv18xJTFrRFw3gSxi/Y1NyHgidqC
 8FydNoUpspIDcgC3Evp+u8MTKYBxkJ834tGf4d61aZdw7CMqwejh4Ib
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-GUID: rJd_j8D_D86HrZLj_UuhKWwpbBIPiWta
X-Proofpoint-ORIG-GUID: rJd_j8D_D86HrZLj_UuhKWwpbBIPiWta
X-Authority-Analysis: v=2.4 cv=A6b5rKWG c=1 sm=1 tr=0 ts=6ac39758 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=09zRouN1k7u6xsjrD3kA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfX2S7mvG/Ivrpg
 +CCDIl7U0c4kw9QMzLZisIMrKFJZdirFxHkwV3Jjzp/AVUfDr0FL6+AUJxTK2zStdjsRta6fEXR
 kwjUkj/QAM1ZMkkTdne++d8UOr1qSEpGQklVXASJgeeCaHwJhUF1b3aoDv1vPr9w6Z5VlhCQ5UV
 130HRjU8d11NBP1mMHaxtHU+ARk3tsZhkBRd7Sw/FPoRwzZMHJRBzZOFRvklphM+NegRz3GGoiR
 tGgCw4UNHwUKeMA9t4xRI2BtpeTWj/K/q8wCNMnR+gipe0yzWFrcOtVQDD/In5vyCf1bAncnu6U
 nylo374A+6sxqQY6IqvKGfzc+FvQ0q9YWkluyeEyva+6uh9wkzJlQ1O+1ZC3pYgDTqtEOusD/bg
 D4WiDYbPfv63XgpCh0p/vSyU2xdO2mkw5n+mQ4jeAEzBMO7QT6gz5pANkm0iTKRHiKj6FxnysVX
 O8DTCP9Xfur+2YP9N8w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfXxWjKMbO0NLCR
 GJ1sov8/jxMhLdGi0digPNnH2wRNRtgTfz21oXGvB9AfuUAZ8OH8xVQUA8MuU5cKKQdNs3rtaea
 qJ+ibuXXA+Qw62SLm2fr5vTIa8T5VKM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050048

Add Battery Current Limiting (BCL) hardware monitor node for pmih0108
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pmih0108.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmih0108.dtsi b/arch/arm64/boot/dts/qcom/pmih0108.dtsi
index 1c875995d881..e8af3e5d583c 100644
--- a/arch/arm64/boot/dts/qcom/pmih0108.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmih0108.dtsi
@@ -49,6 +49,17 @@ pmih0108_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pmih0108-bcl";
+			reg = <0x4700>;
+			interrupts = <0x7 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pmih0108_gpios: gpio@8800 {
 			compatible = "qcom,pmih0108-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

