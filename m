Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B9D3C3F67
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 07:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788161180; cv=none; b=rAB7SkVYO2gogEu3uB6ObTJXFCdCbN4OJt9x12xpPH52noLqKQj8ojZxeFoDTpsMhRtoxU6v/4R/VoJJoDKT13kUIoqvBHvtr/eCoSz6xYrPBBN2oVw3zHHtnXNEXMj/ZHRAyproRuzO0eLncs2tI+tOfeXD83eduUMdpQXUTHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788161180; c=relaxed/simple;
	bh=Idyt7VPiLOMUneagHN9PxugOsJessHhJSGZC2obkP8E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tv2qj8H/O/cErMngaq7M0wR9Nrxq9oNNiEbVEuPm380Dop/3pfRwzbiXymXBoWQTT+jfTT3sueSPJtRB6q+NecqCqdIbMB8zCSgTNOKi94EeYSSiiOM/ikLL2UTeijYnW5hSEvMFwmfeK/r4/MYTm1AuNhNUHkV0ws1arbIS4Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UeuqUghM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TJQ7kXt4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UeuqUghM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TJQ7kXt4"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V52M4v3678645
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 07:26:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6FR5VWdYyPP97YYCxGcdgj/3+qyFVzAQu966AQXL308=; b=UeuqUghMBsSlqmP+
	uaXpdMJRQC0JDgdfrWW9nuEFJ+mgEzV8QJOmkn/mgY86tdj369iS8g+nkiOga+dW
	snU0f/UBNPfgRIRowvgwMuNkw0vdcRlChXrTRaGDwxPff5asfZLck4v0K1gJgrUh
	lCJvr7t64LkstypJ0lTDvVb1qsVqFN/rTk37nkm2/hGsIXdyYRJtDW5rtQbj9XUZ
	MVN3InalaQtJvrjj2ZOWe6s3uYnucC4WB1ZruSIhgGNaqjMOmvGL0E+FJnceKKyK
	fTmgjcKGczk/oHwdwlgSL+BsDDsuyPvJZdOrStzL0WmMEFbpFvjqkdJmiXUkSDTD
	NpAaeA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gcv8h1ewe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 07:26:18 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3968bb86fb7so4541406a91.2
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 00:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788161178; x=1788765978; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6FR5VWdYyPP97YYCxGcdgj/3+qyFVzAQu966AQXL308=;
        b=TJQ7kXt4zi8rZ8BeWsdGv8yUZBAG8S0DLV4Tiupg+x6qEa0j46UR1oygIbxL9oumR5
         mK2GAIpKF5gsAG34yiUNGjwDqvuQK9lZqtTYB6KBEl2JdKlmgxQgxy71ImY4v8JrUpTB
         TB9SwEC4XD5N9aADZuZM0QHLD6ipiuNKhtmD92ciIeuBLKuJNG34BoxLlkVVO9jug3gn
         ligwRiBEpmoFDbwYPB6uIrYo0VfpJlHqS+rn/PvPUEcX1aF7Jcga9oid2k240PkFtdVN
         gGVZZi10ChIcC7+vjRsicrAzpUZXdhT2egeVc1/fvc9hS3R7ANRJ2e91QQRrzZR3j2d/
         VcSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788161178; x=1788765978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6FR5VWdYyPP97YYCxGcdgj/3+qyFVzAQu966AQXL308=;
        b=KYHCeUeOdJPcBwlAUdLErxMkzaHLM8U+MNfoa9osMZ4TmHnKK5f8BWbZ0F+QGlcZp1
         DBhenHBRfFGtUJ88/Ctdl6IYjP8UttEY1DqMJL24c3fphKlM31Y9sughEn/N04ICF5I5
         3o13REPbsFqTRM/TaFJA15gfbFH+JxUUTiASGxJMc4o9q7KDveUCjLERoxYblw+yUOWP
         ddGjCMSk5zcsC+y8v7xNb11xXnHJYhP6C4gA054yo4w83GFHlWTPfpPZI7bTDIA3IzMk
         fDfCiHhsBNnZoz6VLqbl9YhaVwswRCLk4J5QIKog/fQ1XEe7TbSfmdQfXPGpQpHIEKO/
         kddA==
X-Forwarded-Encrypted: i=1; AKwUvByQwO9GENdTAjVipgr9HRu3wjbsn5e86CGl9lwTgx4EjkW5vxjJHbnyU0eSF8lOAnsNs+3HofzbwGu9@vger.kernel.org
X-Gm-Message-State: AFuF++n0ARDhOyJ9jYdTdE7C/fiG7uaJ1l1GKB9GDBOiILXQ2AEs9yUD
	FXDS0FYg3WlOFSJXloKmeudrlKZjr+hoFDAvPq3PcvbUK+NUPvIzPUVbW7KE/yUaK9xcSQutthT
	FXpQfYJzrnFukucEPrOPhgSMQeOKQnhyAqHkvKEXCt2v8EG5bjkf7fJMxnBV93i1z
X-Gm-Gg: AYBFou2KWJIqce/FsRo+2TKulPRLidpDHsZupOEUiv5/i0eqUH4+yWZvEdR+8i7FI+r
	J+3J9q7X8F56yZ5OWYHPBObi4ItBvZLqEFmwqxDh8QxyTRQOklZKIYsqBX/QSu0Xpgs0/GPz768
	uKEtKGqMskn9UvPw8Ex3SXyvfosiNZFj1RvX2L2bM413T3CcBe7impG6Poanxd3AqbrXoXIoiXi
	tFx0tFKzV+7sFwkzTQNPo7t9+JBZ9jfU3QH7w20w48J8JKRdepT288p4vegyrZ889/qZ23nbmV7
	BNgdi4NbkZzodfNwY8ZOro0G1sQAIYTEH6bE6eVl/XKQ34JTacgHH2dGHHurYRoP/n/7cKlqDbO
	XpLG/g3xYPtOs1nVsbjx+Lb8Bi+1BirlWIhA8
X-Received: by 2002:a17:90b:538e:b0:38e:c232:9d3f with SMTP id 98e67ed59e1d1-396d0e20f00mr39218626a91.5.1788161177754;
        Mon, 31 Aug 2026 00:26:17 -0700 (PDT)
X-Received: by 2002:a17:90b:538e:b0:38e:c232:9d3f with SMTP id 98e67ed59e1d1-396d0e20f00mr39218563a91.5.1788161177311;
        Mon, 31 Aug 2026 00:26:17 -0700 (PDT)
Received: from hu-sushruts-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9595bbsm31327059eec.14.2026.08.31.00.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 00:26:16 -0700 (PDT)
From: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 12:56:01 +0530
Subject: [PATCH v2 1/5] dt-bindings: phy: sc8280xp-qmp-pcie: Document
 Shikra PCIe phy
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-shikra-upstream-v2-1-406661d75afa@oss.qualcomm.com>
References: <20260831-shikra-upstream-v2-0-406661d75afa@oss.qualcomm.com>
In-Reply-To: <20260831-shikra-upstream-v2-0-406661d75afa@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788161164; l=1298;
 i=sushrut.trivedi@oss.qualcomm.com; s=20251127; h=from:subject:message-id;
 bh=Idyt7VPiLOMUneagHN9PxugOsJessHhJSGZC2obkP8E=;
 b=Afp4er87SYR4UN6qgzu7q7JgcYyKFGUWxXYEngUg1Vyuf9jT+hcvLmpPB3DdNO4CY1P8fIq7E
 u1rd3gw6+FkAftA6Wkj+JrJZlae1Ejx/nditm3eyklqmkkUbVCWeP+X
X-Developer-Key: i=sushrut.trivedi@oss.qualcomm.com; a=ed25519;
 pk=OrUHTxBaSg1oY3CtCictJ5A4bDMNLRZS1S+QfD9pdjw=
X-Authority-Analysis: v=2.4 cv=DY0nbPtW c=1 sm=1 tr=0 ts=6a952c9a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=EF49ANZLUTmcXe5zpi4A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA2MyBTYWx0ZWRfX53C3R0TuxTbP
 QcyRa0LRAd7eIaCQDD1fApsx6unH+RD3jLCky3keFmV/4lyued6XEh/1fF4WemUx4PUPMh41Y4j
 p0Ia2FUvXfstmDrRVG5cEtGpCGZBb/ccTF4kj4bYOjvpR7pstFEIPtch9nmURTSlP7yG1lN1lU+
 SADTU5eNRj/MYxC+vPdONo75eHMnVlc0RBIGLAI4n3i3LdWLlfhZpe/i/tYiQq/aKbquI9WSUkc
 appszk6X6ZzIP2UZknL8pd+Qw3R/TyZaGbswmcqQDUQRCQJ84tKKpLaH75NrmOw5QbZBCsBoa7G
 Uvb9FNxpOUS138m/bxLCYf/9NY0yGDBz8oJnBgdJAa6cEoKotK3WgtFfSxWbzBGfvIQ9J9s/Djq
 SWGAwhEkic8nor1OYCfZVbgfWr5shs8drkg6QseRWUjdDvjjNnDp21vZ7Ol68A9rsngm8Z1oDO8
 IQESXa4/hZXnevLBG9A==
X-Proofpoint-ORIG-GUID: yO6BgXIzkIodXSGHWOML2qjpSy2AgNGI
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA2MyBTYWx0ZWRfX7UpxpSMK24C0
 Xcr6fkF3MSCjWogaoev+eMtBRsEa9Nbad3LKkjrg4jI3T4QxDPfdE0m9QL5nLcY8KXri51FJABT
 A5ogyZYhJcR1NWDA/RWNnFa1AeXTwnI=
X-Proofpoint-GUID: yO6BgXIzkIodXSGHWOML2qjpSy2AgNGI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310063

Document the compatible of the Shikra PCIe phy which supports
Gen2x1.

Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index 108cf9dc86ea..b9b0fa26347b 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -34,6 +34,7 @@ properties:
       - qcom,sdm845-qmp-pcie-phy
       - qcom,sdx55-qmp-pcie-phy
       - qcom,sdx65-qmp-gen4x2-pcie-phy
+      - qcom,shikra-qmp-gen2x1-pcie-phy
       - qcom,sm8150-qmp-gen3x1-pcie-phy
       - qcom,sm8150-qmp-gen3x2-pcie-phy
       - qcom,sm8250-qmp-gen3x1-pcie-phy
@@ -166,6 +167,7 @@ allOf:
               - qcom,sdm845-qhp-pcie-phy
               - qcom,sdm845-qmp-pcie-phy
               - qcom,sdx55-qmp-pcie-phy
+              - qcom,shikra-qmp-gen2x1-pcie-phy
               - qcom,sm8150-qmp-gen3x1-pcie-phy
               - qcom,sm8150-qmp-gen3x2-pcie-phy
               - qcom,sm8250-qmp-gen3x1-pcie-phy

-- 
2.43.0

