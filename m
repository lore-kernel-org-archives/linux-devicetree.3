Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28A33B83E0
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 09:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785747816; cv=none; b=nCI+FV8aNIcvyTEcTuog6HaLM7Q38KP/Ea/vROKaHbwr7o4kgWXpGQ9LwXiTy5NPuY8wN8rwvVXt6q0WWPjxX3TprZhICp12E/SPvASCA+MYOVRYned0Af4ZKScHegGj9pE6z5wnQFZ6cGcH1ho/HTCBxtzaYdSwZxxvrl/XvEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785747816; c=relaxed/simple;
	bh=ZFlLG3z3MlcszCNrY5WmDudqd49xElNAGFD9EIWF1s8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BS7JrXoToHLQIRJBdbk1RAKh6tWaTcA9/ONWGfKdU2UYJ68zPvLTE4wIRF6LRPb+MmB9nOo0nX9Am+izEavqZ4EuClPzT0gmqZC7VdIGH6ewVfPkviKuRE1GZooXV85rfDL85PHNaJ/qEuZumD283Qnwv363f0rlJH3UCdg9WtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VerTOP8n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JsmARsTq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VerTOP8n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JsmARsTq"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736T7i34014979
	for <devicetree@vger.kernel.org>; Mon, 3 Aug 2026 09:03:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nit2svKmSnKek5KgwJ3n2a8gERZY/b5GYApAabo7+j4=; b=VerTOP8np1qt1NWd
	W95iVTI3nzvMkzUqzkCL+7TKpWrV2HLkECtMeILdfsraPF8bs5Pss4cCuYn+YlXm
	+k5W0luSlJKM5BdGjIut63Ol7sYxeLwcgerVgpA4Xhe5jXsaALIez1P0Kpj8J5Xn
	vu+IH5w2HfhfS+0V+gTuQrTWXrbHgyo6vkkjv3up8jOFmELrbIeFijCcKVYWPLSC
	LVxUVZYligBXEIWIkcTF4tu0lpN236ROSqC1FE1DxFMRCZ+FgGgM07QQLUFkiMnX
	kSPnTyweRBiR2NhaiRDk6l3urmROO8InPqPVe6nGL+Q54XMgBY89oO+4u6fcHVlI
	JU2YXQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnrt8p3s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 09:03:33 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1d30035dso21015591cf.2
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 02:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785747813; x=1786352613; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nit2svKmSnKek5KgwJ3n2a8gERZY/b5GYApAabo7+j4=;
        b=JsmARsTqbX2Tar73BM4Mh8il/EM8IXeXtCPGeIBDvAL3kLOXOFuS6H4MFmYnVAliE7
         lmrnlU9Qe7JKgir3Qtdj/mrqVm8KjQ3LgoPhEgNP9hO4x9C1SxvLFfgJP5hn/CxccctL
         nKBCSg9+O+mjoY+X8JpM0mg2WCVvvtEjR4Z/uLcHDtjeYkpVpFjO4URXs/JG/Amnd+qS
         HnJyuHOCyAl29wSs3gy2dNEMAKy8pfRwv6prdJRym+bEm9qcAUq/ax2MdUytMO/qb3Cw
         A0SG1jBO46y0HD4bHSLqT9ZZS26AifBY2GPoCEIkmF8vKJXkBwYpyvyGVPVizU5S3VV3
         3eVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785747813; x=1786352613;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nit2svKmSnKek5KgwJ3n2a8gERZY/b5GYApAabo7+j4=;
        b=VbedDcFXU7v5tI7PQ/nJc76iYKkPvQUmtTPNHANDO6WYU+lW6JupwOWyjdBgLFg6RY
         /7Aw3QMqeUGPHu7K2BU8qaNGlZcwpY6KjYr+wDbAiyvhmXKQLJuElTNaWuEhogohw1XS
         r12aDn4N1BmftWzyBZrb0oNwyt3QWDqQyO3SerclZm9FXd4PiyLkOs+60st9wsfDLXnf
         xDXZr5jnsCEDF7K3f9bqzOvCknU5sENhQSxAM/GbG1EPDK0yjowFkcAGPSOpDQOVZZOT
         7Tnga2R4U7oRAVjAhpVVU8wpern+KaDUQ/DB2cNMzBi7VgNlWhmvxAB7Cg0pg0UQqd9y
         uxdA==
X-Gm-Message-State: AOJu0YzJKGw4G7Gv6gl9HixhADQJn8chMIuWDv7xI1Y09w/a1AjL1mwB
	V9tEkTNu/QBT4OmlJ7i5pRclD6zhQvRgvKCDQU2jI9ZvB139ewFJDYfTrV10x+uGgxvgODZqm0W
	dPwczwLqhWvtOpQ9a1HPuzIXBHxTaCKWj5r3neFUZA/zbUSMc+XN8EtWQrOYVHgyf
X-Gm-Gg: AR+sD10Cgj0ZQl9ri6TTwWwIMAqltop6RLtzt5X+aPb518UGkfaIUQUTnNOgDZIwNoH
	tjRASmKqZrnLur7tILr0M4tQjS+sw0a2fEhHfwrQXshZ3UuTbelvHp+KWnDoJcA2fdd8J/wZObp
	DfFf1zsdTfnwkLjS8i9u3bev3XBgaEdPK0wcGiCZH87F5n1YzOcj6oJz9d5oj7AI+ay9A1HxAMl
	r1TmD6/t6l/+psXi3cE0gQTcJ2BLibRzOdviscXUPla6kEnV6HzwVP8V+7gxIot7Fb9Bfsqwhp/
	njie83oRVWLws4l0ZIvj5DzqEnvvYNn+aFUqXxkRIl4Xn6jMYoXNOaVw04e77b5w/Ld3MvPlNjP
	QIXs3C2Nub3sFKw4A9/oJ/Ga4
X-Received: by 2002:a05:622a:5c17:b0:51b:ee04:5a4e with SMTP id d75a77b69052e-52b567bfe2bmr192444121cf.31.1785747812753;
        Mon, 03 Aug 2026 02:03:32 -0700 (PDT)
X-Received: by 2002:a05:622a:5c17:b0:51b:ee04:5a4e with SMTP id d75a77b69052e-52b567bfe2bmr192443511cf.31.1785747812249;
        Mon, 03 Aug 2026 02:03:32 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd456a6d7sm31858493f8f.19.2026.08.03.02.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 02:03:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 03 Aug 2026 11:03:04 +0200
Subject: [PATCH v3 01/11] dtc: dt-check-style: Add missing /dts-v1/ to few
 test cases
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-n-dts-style-checker-continued-v3-1-6c9776928cea@oss.qualcomm.com>
References: <20260803-n-dts-style-checker-continued-v3-0-6c9776928cea@oss.qualcomm.com>
In-Reply-To: <20260803-n-dts-style-checker-continued-v3-0-6c9776928cea@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Test User <test@example.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6705;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ZFlLG3z3MlcszCNrY5WmDudqd49xElNAGFD9EIWF1s8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqcFlWxW8fBa/Ti67XvOv7zPD+bkxr6wu7lnFBV
 brAArUoX2eJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCanBZVgAKCRDBN2bmhouD
 14pFD/98MNpLEYoxrhSeZpIAd4cc7khbphgBMrhgGfYIdFRO5J6hg34qlozIG7CyiYi+PByZHkb
 uiCjpPIZiMY1u+kS4wRhxn2SXKpLcj992qHSj4H3eURSMLdMxuLrMS15Ac5eTSPyHuGJchn6w4X
 Eob+iYsVKIq5tqITuhUxWvy5pAa1UWCYsZc5F+xARUny0pfEvxLZuosuMyjRneR9a1AKVgD+LAr
 gUPIZOrZODKvlISDAFDGf+ypQh8JTcn+goZ53qWV0cmVO4eK7f/3rq13sOwoqoWoFpcadVUCeA9
 lUFw/WaeptIohJGctdF4PqUNd4F7UGrX+ii4ZNwmo6Uefj+06d1NjPMG/EYApyzq6ah+ks4jSJh
 fmEu30YkykVBviSf4+KXsOEM6G9xufGu8TmJEHgnFvCG/1djB8nno2ig7RnyQLrd1OXU6VUaJ6A
 VDK5fJoFVVR9gjTAjVyVCnRZtiqZGlvM2jk1Vg0arskNrbT8dAJQVeQ89hkqy2VJWJrWe5CePG/
 NpamaK355SyA2zv16wqiXnVdHVgT9gDONBFhev/4N4IH5KF/9ou3XlTw6LvPMOY7qNuwMU/dp00
 vh969QjQxLFQU2OZpsO/guz+L1sK4WCnAw5ybkDStyvRhGp7YMbXmDKIEfkd0gDgIVvEyz7r6sr
 4EONsV5ZGaTkBSw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA4MCBTYWx0ZWRfX2gxpE3gFmMaW
 0ON71gmGAmE97Txe/w28oflOieR9bxkC7yJwAAvkHlFHEUTaHl0advOFUQsK0ymCkDDFFYHt0az
 i2+Hl2kVfH5iTlimp0LBT/9P1mHGbk8G1OoLeyXLx+AHRJA0qCgpdNamyp9Dj5/RiiO1Ih3nbJL
 pGxa/bFIJQitnyge0a0klOA/tvH2wVSwsq/9sh3JsSCr3Ft8Vv/7Wy6GPAeEhU7lD9RS10gwZqD
 kdLwN+4KAjib4YJAzk1eS325C4yjd+dKSn4P8UoEhqTcoe+AUCc4KADkuG2e3XqpehHEl6GFsbm
 URJGem/extBRgvAQB9kLqyveIZEbBaPb4PQT6MSL75pt4NQoHjc8Hmog0az/FKOgpDtKsF0nZrn
 X2jmJ1n2jWORJGfw1yUxnRaLa67lZ9FZjyd1C5vki/wGSGJN/u+NEPt2FXzbDKj4L/Rfd2RPus3
 m4g95iT7esHERcoql/A==
X-Proofpoint-GUID: BNnxbE1AoRrP7cm9mnqZB0tNtLdoqakp
X-Proofpoint-ORIG-GUID: BNnxbE1AoRrP7cm9mnqZB0tNtLdoqakp
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA4MCBTYWx0ZWRfXyAfb9uKcz+Y5
 3wuDLrytxe4iV7ANdD70EMNy6rCwA9c2Q/D7CGCU9heoFFGkjkIrNS7AN6NjrpRLdbZhjDYr5Zi
 qsS3dAVN+sfGcL73hi/BAKnKlNCvq1w=
X-Authority-Analysis: v=2.4 cv=Ft81OWrq c=1 sm=1 tr=0 ts=6a705965 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=bazDI84LfyIabikLn_YA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 phishscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030080

The selftest DTS should still look like a real DTS, so it needs
'/dts-v1/' marking.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-style-selftest/bad/dts-child-name-order.dts              | 2 ++
 scripts/dtc/dt-style-selftest/bad/dts-extend-node-child-name-order.dts  | 2 ++
 scripts/dtc/dt-style-selftest/bad/dts-extend-node-digit-node-order.dts  | 2 ++
 scripts/dtc/dt-style-selftest/expected/dts-child-name-order.dts.txt     | 2 +-
 .../dt-style-selftest/expected/dts-extend-node-child-name-order.dts.txt | 2 +-
 .../dt-style-selftest/expected/dts-extend-node-digit-node-order.dts.txt | 2 +-
 scripts/dtc/dt-style-selftest/good/dts-child-name-order.dts             | 2 ++
 scripts/dtc/dt-style-selftest/good/dts-digit-node-order.dts             | 2 ++
 scripts/dtc/dt-style-selftest/good/dts-extend-node-child-name-order.dts | 2 ++
 scripts/dtc/dt-style-selftest/good/dts-extend-node-digit-node-order.dts | 2 ++
 scripts/dtc/dt-style-selftest/good/soc.dtsi                             | 2 ++
 11 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/scripts/dtc/dt-style-selftest/bad/dts-child-name-order.dts b/scripts/dtc/dt-style-selftest/bad/dts-child-name-order.dts
index 49c5c10c92d7..54be9f07b680 100644
--- a/scripts/dtc/dt-style-selftest/bad/dts-child-name-order.dts
+++ b/scripts/dtc/dt-style-selftest/bad/dts-child-name-order.dts
@@ -1,4 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/dts-v1/;
+
 / {
 	#address-cells = <1>;
 	#size-cells = <1>;
diff --git a/scripts/dtc/dt-style-selftest/bad/dts-extend-node-child-name-order.dts b/scripts/dtc/dt-style-selftest/bad/dts-extend-node-child-name-order.dts
index 575dadd03c38..296c58a545d5 100644
--- a/scripts/dtc/dt-style-selftest/bad/dts-extend-node-child-name-order.dts
+++ b/scripts/dtc/dt-style-selftest/bad/dts-extend-node-child-name-order.dts
@@ -1,4 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/dts-v1/;
+
 / {
 	#address-cells = <1>;
 	#size-cells = <1>;
diff --git a/scripts/dtc/dt-style-selftest/bad/dts-extend-node-digit-node-order.dts b/scripts/dtc/dt-style-selftest/bad/dts-extend-node-digit-node-order.dts
index f3ffc47365a3..813900e3393c 100644
--- a/scripts/dtc/dt-style-selftest/bad/dts-extend-node-digit-node-order.dts
+++ b/scripts/dtc/dt-style-selftest/bad/dts-extend-node-digit-node-order.dts
@@ -1,4 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/dts-v1/;
+
 / {
 	#address-cells = <1>;
 	#size-cells = <1>;
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-child-name-order.dts.txt b/scripts/dtc/dt-style-selftest/expected/dts-child-name-order.dts.txt
index 86b1de9bd654..e2eea0862102 100644
--- a/scripts/dtc/dt-style-selftest/expected/dts-child-name-order.dts.txt
+++ b/scripts/dtc/dt-style-selftest/expected/dts-child-name-order.dts.txt
@@ -1,2 +1,2 @@
 # mode=strict
-bad/dts-child-name-order.dts:14: [child-name-order] child node 'bar' out of name order
+bad/dts-child-name-order.dts:16: [child-name-order] child node 'bar' out of name order
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-extend-node-child-name-order.dts.txt b/scripts/dtc/dt-style-selftest/expected/dts-extend-node-child-name-order.dts.txt
index e3d8fd367e09..b6e74e6f923e 100644
--- a/scripts/dtc/dt-style-selftest/expected/dts-extend-node-child-name-order.dts.txt
+++ b/scripts/dtc/dt-style-selftest/expected/dts-extend-node-child-name-order.dts.txt
@@ -1,2 +1,2 @@
 # mode=strict
-bad/dts-extend-node-child-name-order.dts:20: [child-name-order] child node 'bar' out of name order
+bad/dts-extend-node-child-name-order.dts:22: [child-name-order] child node 'bar' out of name order
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-extend-node-digit-node-order.dts.txt b/scripts/dtc/dt-style-selftest/expected/dts-extend-node-digit-node-order.dts.txt
index 525081867bf7..bf252e4d9815 100644
--- a/scripts/dtc/dt-style-selftest/expected/dts-extend-node-digit-node-order.dts.txt
+++ b/scripts/dtc/dt-style-selftest/expected/dts-extend-node-digit-node-order.dts.txt
@@ -1,2 +1,2 @@
 # mode=strict
-bad/dts-extend-node-digit-node-order.dts:21: [child-address-order] child node @10000 out of address order
+bad/dts-extend-node-digit-node-order.dts:23: [child-address-order] child node @10000 out of address order
diff --git a/scripts/dtc/dt-style-selftest/good/dts-child-name-order.dts b/scripts/dtc/dt-style-selftest/good/dts-child-name-order.dts
index d2a278763c3c..af0adf5abf70 100644
--- a/scripts/dtc/dt-style-selftest/good/dts-child-name-order.dts
+++ b/scripts/dtc/dt-style-selftest/good/dts-child-name-order.dts
@@ -1,4 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/dts-v1/;
+
 / {
 	#address-cells = <1>;
 	#size-cells = <1>;
diff --git a/scripts/dtc/dt-style-selftest/good/dts-digit-node-order.dts b/scripts/dtc/dt-style-selftest/good/dts-digit-node-order.dts
index d2bf5861c3ee..cdf3f91ebe01 100644
--- a/scripts/dtc/dt-style-selftest/good/dts-digit-node-order.dts
+++ b/scripts/dtc/dt-style-selftest/good/dts-digit-node-order.dts
@@ -1,4 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/dts-v1/;
+
 / {
 	#address-cells = <1>;
 	#size-cells = <1>;
diff --git a/scripts/dtc/dt-style-selftest/good/dts-extend-node-child-name-order.dts b/scripts/dtc/dt-style-selftest/good/dts-extend-node-child-name-order.dts
index 47fe5455edfa..97d468051f25 100644
--- a/scripts/dtc/dt-style-selftest/good/dts-extend-node-child-name-order.dts
+++ b/scripts/dtc/dt-style-selftest/good/dts-extend-node-child-name-order.dts
@@ -1,4 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/dts-v1/;
+
 / {
 	#address-cells = <1>;
 	#size-cells = <1>;
diff --git a/scripts/dtc/dt-style-selftest/good/dts-extend-node-digit-node-order.dts b/scripts/dtc/dt-style-selftest/good/dts-extend-node-digit-node-order.dts
index 0c292fefa52a..faf49962faf2 100644
--- a/scripts/dtc/dt-style-selftest/good/dts-extend-node-digit-node-order.dts
+++ b/scripts/dtc/dt-style-selftest/good/dts-extend-node-digit-node-order.dts
@@ -1,4 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/dts-v1/;
+
 / {
 	#address-cells = <1>;
 	#size-cells = <1>;
diff --git a/scripts/dtc/dt-style-selftest/good/soc.dtsi b/scripts/dtc/dt-style-selftest/good/soc.dtsi
index c60274469555..deec1a973c92 100644
--- a/scripts/dtc/dt-style-selftest/good/soc.dtsi
+++ b/scripts/dtc/dt-style-selftest/good/soc.dtsi
@@ -1,4 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/dts-v1/;
+
 / {
 	#address-cells = <1>;
 	#size-cells = <1>;

-- 
2.53.0

