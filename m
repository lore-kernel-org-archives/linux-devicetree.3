Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8AF20468E
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 04:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776658411; cv=none; b=QM5kLfZubu+rc2LcWELPkMwuWdH7112CrMbD4lIv76BRpiPe9jyh+EAl8ZuiQybVhkc9GcnpeNsMlv0KM/1FW6YXZ9vtZikRPJvdJbsAkBbI5zVbK+1m8ptjX4iqIRgcE1y89eJ59PdJ2TUaT71OD5dKOpmUH0wGqCBkwloJx0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776658411; c=relaxed/simple;
	bh=9QGzM2GwADzNh5EjP6rspLOkwQKNf6EL9dVRXE6ozSk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nSB20HkqEmlG8iDqmxa9QwvloM5gLOEWbuwOYPHacm21ZAsNSyXiZSNxHSwHhCB4oaC1IdtdBaKPufhJhH6NUxMxYq9PG25IPgMs4WXq/xCd/Ohpk833w6NR1/BUk/jIStjDOZ1SnCX+hiyT/PiivUtI033kIe3KnoMkzHhJa3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JIWTe5uQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FyKES1J2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JIWTe5uQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FyKES1J2"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63JK8EP01980516
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 04:13:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=5IqKT33huxo6LgScnLPN/qrcfhux/M7Dtrs
	2VQgJeQE=; b=JIWTe5uQ4xnihPabIgaKWD/zPfTSVxMPHl6VqUVYnYYnXsdfV64
	tqe+AoTsX0I90H8AE4k3k/cxwBOGSP1DGwzls1Eo8ZB8VSZrnEQu6pXMAl82BwAa
	fLXLYQVBs2fb9kbaaKz8HllFMLyQ157RW6QwOGKfKL8gsK3Y0karVv0KZDQN0Txn
	RKbraZ4U7UNr7PV1BvyDrUFMAMTO4T1u+cx9lyPDup0brz0aWiFkahJRtRiB1ymT
	n8yz0LJkh5fufhgLant4Q5KQQeobJAgFfFu07cTGMZKF7X7meHCe2nv/EeQf38uV
	inQWFBPoWUCU20BwZce2XhrAtR2rUjcs5lA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm21ukwww-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 04:13:29 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3614272b00cso2775622a91.3
        for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 21:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776658408; x=1777263208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5IqKT33huxo6LgScnLPN/qrcfhux/M7Dtrs2VQgJeQE=;
        b=FyKES1J2O3LrTpQgfo5AoorNNJAXTn/3PA07VbVQc4EOB7rifp5dTJ6T2I1C+bvWwV
         eLyIwOCrZOKK/Rb80cYwWgWoHJBBDu6AV5hbocdDJf8kT6Csf1QmpB7tb1QERGxUm9+u
         sb3uSAmOB72U+MafwbBLKYCo6Cf3b42y7NGJViwHENMgPAnrWfdGAtytrl886Ut9gyGU
         PhcGdUoYjv9BPS/UBlng9d770J76MyWC4rn4h1de1gnZ6MxRttUC/ABTwGWdzmR+lc3l
         INiegWmFUa1dMy6wz605Y07S+dl3Wte2ZJx6o2RepAHFZ5bfPIiOdr/neh5YOQ/2Pnjm
         EoOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776658408; x=1777263208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5IqKT33huxo6LgScnLPN/qrcfhux/M7Dtrs2VQgJeQE=;
        b=IuI3fmp3Ochvm6pIkBJiNkaquW3kSz6UyY8ynGBjFJkxwPGRVF1ccyRnjwmHi4bYpW
         j10ujWMyyx0TNPdPeQidMug1puEA7xwB40pZR9wZ+iCzUrhCakkSBjEujCUBWy+BzNva
         +cAGiDhg9IqbHEHQQUJeK1ATQZMrsUFUkyNKUrQfvrq5YHOi0MolVBvRneovmLoLGpGw
         9Y2gV/1XaxfmOayg57iANK+/Ple1Mvvi+s86v7RheEFHLg0sWtAA9klddQ6+oy4h60YJ
         6T+r66fKdy56x3ale+BXfHq1FUt8VnUtNF7phRzVyZuqcYRjAVIjIbYCFZ284lPwrar9
         V61Q==
X-Forwarded-Encrypted: i=1; AFNElJ83uo5x3UUPyBMw0/aNn40wXnI2zmM/y7pcvtGeYZ+7DhgPPlEQt3stEAAni8OC+b2nhQGdL5prTMt7@vger.kernel.org
X-Gm-Message-State: AOJu0Yzszlf9M/5FUbga3OsjwCSIG9W2uLiH+VrXhqbWbnCDHGOlkoJe
	hjJQlMGHDvP/U8GEdnTDSEkTyTchq89odXqQH8kVcy0gx+MP/HFyt1xl7kU0hdDMbiRdCJ9/qq5
	ZcNUcaS/qev3Pn9hTV20hoPmSJpxVy69Kczvdl3XgPrgDVENc2vWXZgFytqO1DCj8
X-Gm-Gg: AeBDiet5y59y5TP0kO+IkILo3o92ApG9I+M303zaWwpY0Q9l+OQ3TU1BFxCjmUGNqbp
	BqgNsBb/QOGwZ82gn6AraTVFB5u5ve7yjJicVM5FjAVl4nWcf8N6Qv1pCfG6KYo36qobrl428l6
	YkYuYq0SIKF2yi3QdPkAALpimLnj/7Jfos1Si+gXAtI4GBC2XQDXZIjI533HLuQ9WCEf5/dXFpJ
	PRzAY3b2xKBeA+p+3Cb39go3M4vm1oj62Jc4OoG9zsbtPShRUSKY4S79gQKvd5VtnXiu1lv6nyK
	Sr4RZTlqjNYZujc/2oFZNQrjdHFFe/BJ3f49dcxENxeerbYjEd+/B5jI+u+lKCUoPbEXP2hAg4Z
	0k0TZyTfyyuCFS4YIpqKPVeROnjShwzPiE6asM/nTtLDTZikKMMj6syrbvzstFRuu
X-Received: by 2002:a17:90b:5203:b0:35f:b9ea:8f9f with SMTP id 98e67ed59e1d1-36140464842mr10938071a91.16.1776658408549;
        Sun, 19 Apr 2026 21:13:28 -0700 (PDT)
X-Received: by 2002:a17:90b:5203:b0:35f:b9ea:8f9f with SMTP id 98e67ed59e1d1-36140464842mr10938052a91.16.1776658408110;
        Sun, 19 Apr 2026 21:13:28 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3614195a8f0sm8725035a91.12.2026.04.19.21.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 21:13:27 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: mfd: qcom,tcsr: Add compatible for Nord
Date: Mon, 20 Apr 2026 12:13:18 +0800
Message-ID: <20260420041318.1247875-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDAzNyBTYWx0ZWRfXymxYok5VLtzu
 6q8pgpGZsHDFe9QsO5O8mWmFMATWw0OSfyzg3s5u+KP4BJ1ikX0cjTDXaLYUIL+qLjSQyMerj+A
 qgNRB7LOoG2FULs9FeHQh5VBRFPu3+mjNi7nB6fv0PJU9fBGLR9Og19je4tW4mlTaNnSB5LEXAV
 7mfDWfG1QQKaB0JaPn5kx5B9fToj+b+n2eUIqUfeVTAVnitVwNS/DTecFYQlAEo/YNE4fCGs5Bj
 ZzHjc4b7Joawn4sOp2oXgt8akbqktCCIA/kHoW68x7gB7nRpNUdtQ9lfrurjiO02Hjk3I61jlIE
 MF+goznTmAcZl7Y8ImDw6EoXu2ra6IPFHw/SN4osR/1oWML8wmOthyWaGyMzaVKTih6hnAmWQCt
 chX39GWbBQPlqnKcQ6ThES6GyYOqnUI44wj0doeASa1pJrIKNe7KS0hpBpL/JDYXtWhf7ILiRpe
 c7F8ZsZIQB9XVVugjDw==
X-Proofpoint-GUID: sI03sCZv7LtFXdWojFVW9QvA6yatb2vM
X-Proofpoint-ORIG-GUID: sI03sCZv7LtFXdWojFVW9QvA6yatb2vM
X-Authority-Analysis: v=2.4 cv=WK1PmHsR c=1 sm=1 tr=0 ts=69e5a7e9 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=LjGnC7tzK2yCY8HLVSUA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-19_07,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200037

From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

Document Top Control and Status Register controller for Qualcomm Nord
SoC with a fallback on syscon.

Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
index 14ae3f00ef7e..23317d1b381c 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
@@ -19,6 +19,7 @@ properties:
       - enum:
           - qcom,msm8976-tcsr
           - qcom,msm8998-tcsr
+          - qcom,nord-tcsr
           - qcom,qcm2290-tcsr
           - qcom,qcs404-tcsr
           - qcom,qcs615-tcsr
-- 
2.43.0

