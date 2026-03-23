Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35B135C1B0
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 19:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774293820; cv=none; b=fB8/PE/LS5Je671wSDZ4VHywCT3emH+jT0THGcqX+JPCpUb0v3Cuk8BN5a7T9OF1JzhaWn7GkoFu9p7W+uaHJbRPEUGyXwiZO2e0Hpg4Zirqo8qOui+sUsSekyI5EwiPPICFLM3MJwVqUY6Gcfo/+l0EaIQfGaTQCFSL8KSc530=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774293820; c=relaxed/simple;
	bh=2OiuwC39r9WAYMNgOQIQbsFnQFBXiUcdl29tWIk77dc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k9ELcLdKXJuBcaxOgAP3t7TaSB0NMoHdn3gY+5q1PGo1QTp1UGlPPiVMeXn43oh5Hxxskt5Oof1Y+2c/IzAzk4Z2taWWvui8+bQ7QUsoM+EJ4JDGDdybhusWkgi3o/FvlvdYLrtWET890kXzov+Y0SzjDNNG1kq8psRekueeEpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UFFSUpz/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q2JbPKKq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UFFSUpz/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q2JbPKKq"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqpgx3934889
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 19:23:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UTq/5O+jBlL+PdEsQhURbyRBWv7Zin4EIwuvMYQLw+g=; b=UFFSUpz/E8v4jDB8
	FuahP2ctUzQuw4Tycupg9iXR1zFXT2UfkXiOlqhDBwMCnxHTzQhjli+fNws+bZUc
	vbsfgHykJWTxFhXKWnzIN/173Uzm2Nd404z9ZH5oTlCEQHpepIDmdUYwFdo4rFUo
	KVn0ySlIDMpkEj2rbV7jrm3+D2vRdHoPKX+7n+eLulNIxeMIS8hBqTFXRrK6IRrd
	yBsuLPKGZCrSNIvDQjI1qSJ1hkM4GCyGe31mi/uzs+bR+wEid6p5VnpJJiDIZvY7
	LDl6sg2pJo3Ot8JwvDQNy0NnE91hVLUHQOQ0NpKHlBK+Z3dcShUnG0nsSW6ckRsZ
	mQWQTA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d37a0h1ee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 19:23:38 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5093a985e21so344167361cf.3
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 12:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774293817; x=1774898617; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UTq/5O+jBlL+PdEsQhURbyRBWv7Zin4EIwuvMYQLw+g=;
        b=Q2JbPKKq1b1L7FKNvVkEDt5p+exC/QpziqQ7E7V1bW5vfMYGqEBojLvKqfwIQ5ub5p
         wFeMGxgKbZobb7frskaMoGkFHpZsDw3Wmv3KDW9Jh0ZwOjf9OeJHJbY5uUMNldjQjaKQ
         d2CbTaXzuOFo0kfwu2igKJd6m60TDrX4Y6wc/g4LR6TUwaAhBEMBRkXoFFvV0pCptuuF
         qlfHh2on3QxkCNmXOpEm2gYjFnyaaEcKYf/pD7uRr4gHwPZ5d/nWNmBezido/N4XX/Ji
         tUdILJY0y/IFAb/XB6T+lm+apMmfgcEiP2IgtNxovsTylS0X07LNTj+VzocMcwkeOZHz
         DgWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774293817; x=1774898617;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UTq/5O+jBlL+PdEsQhURbyRBWv7Zin4EIwuvMYQLw+g=;
        b=WfKaBzRMOTObdAwNF7XvRyH4OduuZHR8hps7HPKVBycrKhe2D/tBjKNKAZcO24wKFF
         bdtsMTYJiQWfOfgq/EHJDJPIG/g8EajTB3KaTL8T+922fP2LtffJTaKBhJ0Sli9/seO5
         VGANIkeFlxrTnoOTIJuL8u8Yq+NlQPgbJ9xXIqSNIe78G8wWB/znqW3LzWlERTQXopkp
         wp9Ck2FuXh/wIJfOE54bt7oc8YJBuyI1GC/8tcsRp3PIerpUB/+yGjGZ2ob5QKNYYlVj
         ERGyKeDNGl3tYvsfMNgY4FHaM3ylnqCrxlFza5sl4j+dtEHbMcFP37Urlejfq0u16mFG
         bETA==
X-Forwarded-Encrypted: i=1; AJvYcCX9wo8DGUpvi85PSfeYYUG5MtrRN66tPr0+1pUwTtjvVxUFQEIITAZkBsxUGVsaU6z4yzEcqW2SbWPE@vger.kernel.org
X-Gm-Message-State: AOJu0YxwVSlYYyPDQ8GvW/uWmxbFZ5Fu/bU6ax8zZfB/7H8Co2Tk4f2X
	SBgDu0l5pZIMI7cUtsdrSQbDHf4U+8qy/sXAv5EvELxzrVh9k5mnpTO+HJzP1EQKIfnunOCHiiN
	t/FDidMAuEibks5TWCimpnTIEJdaeHtTR7WK11ZwRoZizQ+vQo4uoi1CGs8LQAfTm
X-Gm-Gg: ATEYQzzsNeSHvPZImPWvvvgw2jiY3xyOasZHMw0JbzeiPCWOmpts3FN/XNXpk1DTiVt
	Kkmdz5sqY+UDSVOrEPQY6d3MoR8T4FxIxrZz/DJXi4liEBn9CYLR5tjlK1iK41KqZrV09nrBA3j
	cXYwg/JL3bP7Vim15yKd9oFg2kv3O9l4cQkqZKLQtB+R8iKtptCyJpR882xXdTMRzweBiDv/K7B
	iMDxWg6MnAInzL6teQCs/KEMyUbjcFS5lxiPk3WTqynloQwoCsVdDRYPFeQQL+P8dijiVHXVaJy
	eRE0HG9NV7v3aCMk2zsQuRkBFSkJemGDlULGWToRq3X+1lWuaowf0FT/Qim4U1/ryW/vyBvSOyW
	pxqKC5jjc9yA9dmCgmFUkhYSiU0c=
X-Received: by 2002:a05:622a:4c86:b0:50b:4ccf:1367 with SMTP id d75a77b69052e-50b6f8d4ce2mr8199291cf.37.1774293817289;
        Mon, 23 Mar 2026 12:23:37 -0700 (PDT)
X-Received: by 2002:a05:622a:4c86:b0:50b:4ccf:1367 with SMTP id d75a77b69052e-50b6f8d4ce2mr8198801cf.37.1774293816652;
        Mon, 23 Mar 2026 12:23:36 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644acb52sm33388113f8f.7.2026.03.23.12.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 12:23:35 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 21:23:25 +0200
Subject: [PATCH v2 2/3] arm64: dts: qcom: eliza: Add CX power domain to GCC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-eliza-base-dt-fixes-v2-2-59af0627b7c2@oss.qualcomm.com>
References: <20260323-eliza-base-dt-fixes-v2-0-59af0627b7c2@oss.qualcomm.com>
In-Reply-To: <20260323-eliza-base-dt-fixes-v2-0-59af0627b7c2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1121;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=2OiuwC39r9WAYMNgOQIQbsFnQFBXiUcdl29tWIk77dc=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpwZMwJVEvwFZtd5WgfIj0WAYBfQORM+7gZlHnQ
 Y5h1oRMyiuJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCacGTMAAKCRAbX0TJAJUV
 VocCEACy6KIucjBD6iuTkcei53kBfNGkq0jNhl5UuEg/6tTK8W1blMBF7KwAFERRujW7sohEAgg
 92SFVYJtS9VcKOkpf/gERQHWitMuzYOEFAxjOpwlAJ9iHXgrLlLQSmB6Gx6H1ZlwK+J/LXJmAF6
 PQa8Dtc4nZd+xxQDBfEA6Fo6VHqmCQbEBL17UgV2FQM1YHztBXrgytKYgt+RtnN9JqO5wKl1Ah6
 1m07mLpDf2sNaJRoMwZcNKZjhXBNNaM5jiU0QWdkarPGu1vvech8rmb6KJUh5eYwR9lxfw2hZSS
 G1pDERGlkZzByDeXEL0B37uW0O/KeEnZ4mB1SLKYQxTwtIyYeeSRbPVhnBkFJ86yD8Z1ykaO08U
 r3RMFBMq+FFem6LLce+uQoWCYvjh8x8620tkFKeTynz/6mvRs8Wy9UsdblbZyGXQ/WJD9kCha+W
 +Rcc0xoRTU9w6NmKJPLxvYIPApYIovFBe9KoBwhbzIOEbJ/krTmGX90Wo6Ic56//7HlNqQbgWw2
 kxD3H0SOixN3+mSbzhFD12W59zsuS8Dk/7bgQuQO46CMWLsxYxPAhb6f3HsT723/mQ8r0fBTe6t
 3CHmOx+ie5aVM8vWJPdLkUqtl30dPwNEcdl8++a7LR1/YCbqeCuZRHTEebgButlvfwiVj1G0Cyg
 5udO/canOs7jjUw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=GIIF0+NK c=1 sm=1 tr=0 ts=69c1933a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=eWTIzzE_mSYKg3fclygA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE0MyBTYWx0ZWRfXyv+BshklrjNR
 WVhSAqu4ZCXqhM11MF6q4tzeD6QdiaP0MZK/Rd2BnOkVVq6W3r0Pu/Y1V6DHejCekxrFgFaS0NC
 wMvBftDYH/dkGa/NJv6sQkxAR01FQ6mGLlhejUuO6VY0jmapgVxtgC4enus0JLhInQxZ1K0z93b
 JSwAa5HBchQiAKDupfjzkZ156oXZJFtjlbKBMOotD2BeWYy6W7UE/ch+uU+9Xa8rYUAybkyqUlY
 sY6Z15mzvUMzXxHn6/3LpE6RMreVfnXVnff+JFasCAohb21WUl29xKNLk0iPdo9QfkLPKiHkq+y
 3v3G8MfQThVGndvk6URJGHgQOq48BvVO9Fl4BlkUjbrYt+wQYVWLdl6Cu32DDkPA2oBvgf41ppp
 v8YkLbVY6wcKUFPFZWL3DtjgtLeRFibPrMoNelgN/07A72U7RSFHDc8NANyNNjccxqQhhLU6Equ
 b3m3ojfpUXtpm2QGrWA==
X-Proofpoint-GUID: poUIYl731v7gm1hQRwTrwyXUxqJnDfnl
X-Proofpoint-ORIG-GUID: poUIYl731v7gm1hQRwTrwyXUxqJnDfnl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230143

Recent discussions off-list highlighted that the GCC should vote for the
RPMh CX power domain on Qualcomm platforms. Without this, RPMh may not
aggregate the correct load for the CX rail, potentially leading to voltage
drops and system instability.

Add the missing power-domains property to associate GCC with RPMHPD_CX.

Fixes: db7fe6963466 ("arm64: dts: qcom: Introduce Eliza Soc base dtsi")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 5dc3aede6842..fab603cd8e42 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -617,6 +617,8 @@ gcc: clock-controller@100000 {
 				 <&ufs_mem_phy 2>,
 				 <0>;
 
+			power-domains = <&rpmhpd RPMHPD_CX>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.48.1

