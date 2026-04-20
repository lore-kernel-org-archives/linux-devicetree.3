Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8F13939DD
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 10:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776679478; cv=none; b=ATglqOMSygrXtoNyKC2Kf1lgF5qjeOQzrfJ1h/peiCTIvlkaTu3JQFt4e89dgR7+3OHH8IBENOCQDukawuyjCV71b7DoC6jjXY1c8a8m+HHpyxFEzyV0/f1zwbJWF/i37hxlGicYoGS1JML35HGHAl6feC3mRQ5phhDwUIPCH20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776679478; c=relaxed/simple;
	bh=KqW4ho6y3A/FHoS7E1slFKZl/GqcfdvaciVSZoOmOiI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kP5Xu7gKY6PgCHCTLGX6yDr3XiTiG5XQx0/RjoXFFQ/gIy/6EnPskQRqIjP8q6DLXvpaDO6qu/TBsNv4uDKfT+QVOIy1NvWC5rShDOhMJ8UvAAoT5hfBsrFF2AOJApG9WPtTB4dUI6UZBUa2u/4OOE4YKgYEJRXjIqtHze4Wcpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=haxZqLW+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EUxhLD1s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="haxZqLW+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EUxhLD1s"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K97qXm1599880
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 10:04:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QmHOp54KgPu
	3xB4W0mKi44LzifYpPbFwkxhfR9KtlPY=; b=haxZqLW+tefYq4fy9gpFp51/eKh
	Pt1amrbYZP9erq6Bx1DGu16Ef9ig3Fb61JmVdJQo4KEM4RbgicZ/nj64aRyetJth
	d/UekbZnfuYxQSgWBCQEqnVyFQ2Qc1HanPJ8ltUdcyDe9NaBp2/m1GKMExbVW5dD
	NwgPxRJTQAtdOnMO1UwzSn7C9HDgopiZ/+nk+75g9pr4OsjUrFI5LILVvKqPOD5d
	mTaIbNBbnzoCgm1yNBu/tRkWzSCWxrrDEbUgthRqQ9d+jt7vgGmmpcCTpA6ymoRc
	W8kBgckJZsdtDFVzLdC5HFbz/dgiKZdWV+ccX/CK2RjmvWwf5/6j8ftyFFw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh8986xr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 10:04:35 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2c0f6593ef5so2978687eec.1
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 03:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776679475; x=1777284275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QmHOp54KgPu3xB4W0mKi44LzifYpPbFwkxhfR9KtlPY=;
        b=EUxhLD1sdNrjgz8T1bOCS/CLgRXMnQTMPKSxyumvts/7hec5Kxe02cuokbuIOrGv7z
         DYtJ6PLsfdooOtCFusbrY43WFcWOuCgWvF+T4t2tTErC5K7XPhCC9qgWJ46KS2dCesSe
         zOr0lfynhtn2Dvmqe+BY7GiykTd4h3TvFM5v8ZSTKfZNMGMwhBXvyFgZsJsaHeQu8nm8
         gz5tz1Tmi9LJeGZgLADmhdTEJIxEv0HdR5g2LlhD2QM3upyn3dXXPmyTNZ8bZk6vk/51
         0hclLf4qEKNN+VWcE3fWPn9Td1VHrAhkQhvjDtH8YPnSbOsycxMaERhu5zZgwivVFov/
         qPkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776679475; x=1777284275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QmHOp54KgPu3xB4W0mKi44LzifYpPbFwkxhfR9KtlPY=;
        b=eoUdWg+HbTnURTzhW1mDler9UiGVU0ebJo2b/ovBrg/kjMa9arqIJuvo7qy6HDAzTM
         n1F03sZ+9eKqOV4pDSSVXPdjnkVXQofIiV8CUIDwJ0iDwwUlPcs1/eVDP3ZrBjy9+HpU
         5vTeQq3/b2S5ulS6QPlw1J7svEMs/cbI/f8auvJ11SdeseRYZ+pVQ930nJoPzGc4e0yh
         Z27wvxmMk+MAKqR4nnRUXBDy63bHUN8o85wCoLT0jboDqzXjMHEvs1TUF40WOjWIZnlU
         9ldr3Kn52oNzgOsG6LTXZ+yPBE3ScuaTLG1HpKCswU2zg/WcW0cDoY095NVV40RHE7Gq
         bp8Q==
X-Forwarded-Encrypted: i=1; AFNElJ/wTY4boa+eTCoctSVf44FYoHWYjgD9OHieijlnBbP7M2BYlyVe4dX+UFi3N+7yEh8XNOmEcg4G6Xka@vger.kernel.org
X-Gm-Message-State: AOJu0YzkYZ3JUzIroMz5S3XfJU/7q7HI2kS1LWDTxdSkRXZ4L3DevkIx
	Q02ZOS92z1SshncorUsYUNwC4VZiRx9ge3mgQn5brCcEkQtD8aUL9vFUKYud6wKBwUHwscMKZSW
	PhwIZ4n3ecUrtlT8WNm4YFw3NQZumxYeuB3BAHRGcv/PWmktJ2WmBLlfem2O8x1uk
X-Gm-Gg: AeBDieuAP33mPWQ5StGjKfe8Ekb8vOaGwjEO6QUqTeyP9KkVU6oIRFK+l9lUlah5ZxD
	K7TaJ8RiXAwCgvSkxuJ0odB/7nU94C+VPi8PyKo9flOjE4b5HQACONwt+RfW+8MqaGHLKc6gUVy
	EZYdtmXD2/uNRUUOw17a8FziR0XsmpD00DAjESf1s0hbW8nmb+HBupHJkNlXOkUqLPvhLydFyLk
	GEELK/I+5VNnSqdEJMgjWE76Kk4kZvq3M9FjYeFHzH7mGOuV1Czt7yn8ILOl7RKsqs2ZEY2Rcbg
	l2MNtVqnKAvW50cE6gVmwFFEwbrH+yjAo51L/DKu8jL5D3O/ULJk4nPBu0r3W9l5SVX81Gx4mhV
	ZMZBJQQz+TgPOmkMeXfPsb1MYbAEKIe06cfGPPQYLjFNVmDj0DxXvsRzudGDJBlg/1xX2XQwJLe
	IDXpMfIOlErSOgruEZ
X-Received: by 2002:a05:7300:641a:b0:2dd:6937:79d6 with SMTP id 5a478bee46e88-2e46c48a9cfmr4728316eec.7.1776679474634;
        Mon, 20 Apr 2026 03:04:34 -0700 (PDT)
X-Received: by 2002:a05:7300:641a:b0:2dd:6937:79d6 with SMTP id 5a478bee46e88-2e46c48a9cfmr4728287eec.7.1776679474072;
        Mon, 20 Apr 2026 03:04:34 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53d2cfef3sm13076436eec.24.2026.04.20.03.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 03:04:33 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: "Martin K . Petersen" <martin.petersen@oracle.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 1/2] scsi: ufs: dt-bindings: Add compatible for Nord UFS Host Controller
Date: Mon, 20 Apr 2026 18:04:15 +0800
Message-ID: <20260420100416.1252983-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260420100416.1252983-1-shengchao.guo@oss.qualcomm.com>
References: <20260420100416.1252983-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA5NyBTYWx0ZWRfXzbpRWmWdrFdS
 c00LS7rIymBRUTpaRJhL6E6EUQYsVQAAvBG3giWiIuCB1rdYpQXtrs/jPEp6uaekT0CBPkepf3a
 qt7fUNIgsgalye5TaoW+5R3uWDcpK84DnNL+OV+SoODOxbikKzgQ4I8HmqnqKuEEQPlgOBEH2j8
 oqDdlrxtcq8ABQ6OIA0H0jgkBiv7vIxQyZ7fQ5pzZPrh0rGlYX3ZAuMm6Ti2araQLEFwnCP8z93
 E869trj8AhW+1vB7uSHknQEyJbu7brM67VpD0LKbvjBoJthJY1GpJGAbTyhyHj4pwk87cCSLqzl
 x+wIzc2LY2qBKGdjom4ZIp2M6WzosG4FAWKMw17Bm3FQgn78cjlIrjhLXN0cTj3yCikdrVjpEUQ
 LyUDW0gbG7y7cZzr5k2Iy0BV6Bqqk8rnsm0FaufD6DfKvaI9vSFU0USzE4rTNI8W9+kGx/zfkFJ
 z2Ke5kDM4Ag5TWpMhZg==
X-Authority-Analysis: v=2.4 cv=D6B37PRj c=1 sm=1 tr=0 ts=69e5fa33 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=o674AwMwzFixoRFAmicA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: 5ekD-V0SyRfJXmrkJHyx3RWX--h-K2RW
X-Proofpoint-GUID: 5ekD-V0SyRfJXmrkJHyx3RWX--h-K2RW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200097

Document UFS Host Controller on Qualcomm Nord SoC.  Like the Eliza SoC,
Nord has a multi-queue command (MCQ) register range in addition to
the standard one, making both reg entries required.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml b/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
index f28641c6e68f..900d93b675cd 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
@@ -17,6 +17,7 @@ select:
         enum:
           - qcom,eliza-ufshc
           - qcom,kaanapali-ufshc
+          - qcom,nord-ufshc
           - qcom,sm8650-ufshc
           - qcom,sm8750-ufshc
   required:
@@ -28,6 +29,7 @@ properties:
       - enum:
           - qcom,eliza-ufshc
           - qcom,kaanapali-ufshc
+          - qcom,nord-ufshc
           - qcom,sm8650-ufshc
           - qcom,sm8750-ufshc
       - const: qcom,ufshc
@@ -74,6 +76,7 @@ allOf:
           contains:
             enum:
               - qcom,eliza-ufshc
+              - qcom,nord-ufshc
     then:
       properties:
         reg:
-- 
2.43.0

