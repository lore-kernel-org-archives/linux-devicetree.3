Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1D63B27F3
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 09:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775642336; cv=none; b=UYDdqa/hYg8G5jHHwEucrYPoeHpFZWuiwqUVuE7d1HTkR+Dxj5cBEN9w//fxIFFYfeuwKGEztPZPixobkQaQBp8HN4dl4u6/Y1VKkF8VIysi9YIJ32hGGypkGOjDu3JLDOzv1xj1je3mxE6kJQqyS53zKIEz/MGXnikRQfWbz3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775642336; c=relaxed/simple;
	bh=wJ0e12ikEqoJjKP58GCgxAO9XJT3KyRarFLZzMDpX4s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OgwDxcqSyEgYnMYJEeW3YrTHCtez99twuoGl6sXtPhzLrP1Xc/aCaK8Rn64N6+mZOylWiS5U7+NYZ2yla70mANx0PKLLoyCN2/l4dqOVhZJ9RoWJlmrqypQlpQKyzg4YNSJqOANAMQ69OVYx9ceYUNDx92IN/3alN+k6Dv51Mf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b/1WmTWM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FIZyHDl6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b/1WmTWM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FIZyHDl6"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6389n6Rb2411828
	for <devicetree@vger.kernel.org>; Wed, 8 Apr 2026 09:58:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UHLv1LepPQQd8y8BfHLr3erT+0i5iQAtxSKpT8MX/M4=; b=b/1WmTWMkIXCB1Wa
	vMsqwy9HxuY7WHNJACs2v9y4WyImyS7feX1W13gVbWn0AGyaE3cY29PVVcKRGrV8
	k/+Cf4CquKH3JbCZgq1mOdG3e3MrJoPWreJE0JVk7FHPHJB6fkgKUKfLy0ePI3e4
	6ZqfpKeeBLP0lX6IXWYkllyBWUxM/dWufWkT+XAvKQ6QJrxEvgzi3ENYd/FWdGsR
	OQKTvEWgYFbnA3qtxwh6HC0uIqGw2ICjhYujNm6P6gRXexTleNJ2sKaElrUSEnW+
	Eyov2XN5v9bD3Co253foAHtnB7d5mRh3EQqQZ+AC3DFGRzFhyEkff0ZINR330GqD
	7SkB7g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd61vb6dr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 09:58:49 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35da99b90f6so6754541a91.1
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 02:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775642328; x=1776247128; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UHLv1LepPQQd8y8BfHLr3erT+0i5iQAtxSKpT8MX/M4=;
        b=FIZyHDl6CxQUjkc/XyblKdoxXPCLs8jp7EypmFqMX0+kiW7Ukrf2uiJxCKxndAQyJm
         qXPrGypMusLx0CO6NkLuxczFEbe4E1bZqbaRIgA+yUgJ+qYgGN+w8nmYFoXXDAz/PVB0
         j/Ll3SKXQDeBnzUNs0Xlw/BtMxVxamHuubkV8+7fuUFcnrO2Sq4VcaZj2ALJpkFI63IC
         mDRI0vDKfJjA+ZlZcR2uwxEoOhh2nUFM6iQZtfJAxI9JkWG8otQ7HzrWie4N5SdVL7Th
         UIMvrhAyQ3Rhi/wB/HR2JcPWQPe52FLayGC0rWeeO6eNPZ6MlRVZoT8wvwCtyiySWASV
         AHJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775642328; x=1776247128;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UHLv1LepPQQd8y8BfHLr3erT+0i5iQAtxSKpT8MX/M4=;
        b=NXGyqgpCikqGghE3f095n0NNjdxopvWIn4HmGkkoGoGeYp5lz9yFdp6scVHyf53HV6
         xP5ZCdh1WA/a14zJYX/auM78BEbZuBr2qIdw8hUNgweKbtxEOYjcYumFfKLq5HC2IREH
         Y8aennbPkdx6fXUdO+kScU5dcuWr2/FRBxZUQkSWbI36ADzG66rxjhhgEOVAwN6P/+RI
         Eyp3YIxB9EsiBYQgUKNwpoIK+02i69N1544vCTN6zpdd+dY7kyBfw4YN/5/R1GC2p/hO
         8r2XKrwKqNdsL5qgoEO8zytQ2DYeA0jisjr0Le0VBBKMN8lTXmTe0S4nHRTw2zRI0fDe
         wBzA==
X-Forwarded-Encrypted: i=1; AJvYcCWOejbmRZhujN0icQTL6dr/IrPy9rmbjdrPrBJ0n/HCtHSiRFQX8mSDUeyLpEvp/xcDQc6AhOdcztXq@vger.kernel.org
X-Gm-Message-State: AOJu0YzNXBmuqnQgIzdc7CGZSbcIuKHYhEneHhNzCbEiXmyQ0VUrAvqW
	Bx2aSx9EJlBzJcL3qNR1XLgbjT9KV3acjG2oUx9uRVNXsrV0rn9aTM/ckHmFcu8S8PnU7rCNMX6
	irjlEjAM5R3Dqq1HwOmlMnfBxBr7bDAVIzfGevGS6OsuLM5BF5KWQ2zKCrMUkQReeK7MuGbkm
X-Gm-Gg: AeBDieuh9YDpuFr8lhLaSm9xtCqAB9/UqAovbmB39dRNCLPiovwGvuwiq+IHANidl66
	l0anBQIxQDaDmIvSRiiWe4IHUDU9bJKTDBXJatXKJhLUvNW1/vnMFSNK6M+vzheXhDlDbpc/kOX
	qonb8+3r1X+NGE41+mCGrcmvfg5SPynDTEpACVFARR/573ivGob+sZt7ACX4XYcZ5MvPR4GAybR
	CmZz1aapw7VH/PcncJWaqvUdbxP8FKlUpE3t9Flxby6ToIfVJHJNxvoqugssXUmKrAfUZXk5Rsu
	rTooiK44gCXbOPVJw3BW8BG0cZoVTLR591FYCU/DNlxJyxl+5amTai5XkT4fWhEqtdUzRpmAdOb
	Wush0QyUsooeyUH1zRDFKNWTbTsNPEzAz4dTOFuydjsM24pE7j6sw0Vfmm8rgCCRvc136XTeAH0
	RDazByWe6Y7EtjbBjJrRPpZiUHWZVKH1bJYqQ9Yi0SlduoRE93CnnrGkwl
X-Received: by 2002:a17:90b:5544:b0:35d:a276:a87d with SMTP id 98e67ed59e1d1-35de69fc997mr19889983a91.27.1775642328299;
        Wed, 08 Apr 2026 02:58:48 -0700 (PDT)
X-Received: by 2002:a17:90b:5544:b0:35d:a276:a87d with SMTP id 98e67ed59e1d1-35de69fc997mr19889958a91.27.1775642327853;
        Wed, 08 Apr 2026 02:58:47 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe62f5dbsm25445663a91.8.2026.04.08.02.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 02:58:47 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 08 Apr 2026 15:28:35 +0530
Subject: [PATCH 2/2] soc: qcom: socinfo: add SoC ID for IPQ9650 family
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260408-ipq9650_soc_ids-v1-2-e76faac33f77@oss.qualcomm.com>
References: <20260408-ipq9650_soc_ids-v1-0-e76faac33f77@oss.qualcomm.com>
In-Reply-To: <20260408-ipq9650_soc_ids-v1-0-e76faac33f77@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775642317; l=827;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=wJ0e12ikEqoJjKP58GCgxAO9XJT3KyRarFLZzMDpX4s=;
 b=Z3NfKjamXHOLclO68N2bJ+W/p3/kSLUto71lkGiO2Qvmlm3/rl3oXqjBqmZABcruiEbSRxQ+V
 7qvNfsb/KHNBhIUH/R0I8XIy7hN4szaB6YxQnxDO0fknag4UwHtjNbk
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA5MCBTYWx0ZWRfX7mLLwYs076rn
 VkVMvnjLdsdh6DYQI8cbjJD/ZeJub2HSpMiz7r1oYrg5J7b22GMC1panMd+pOiku9OvkUMDLNxj
 8vFiDeVv8bmN+4II9JFmMl/RMQJNxqQZboci8MgKtYhhKu9Wt2FXRK5ZM+LAkSOnV9+/moQL+Xj
 UCJa4LEwL22hJeAi8hhtHUBvJH2VztQW9DdZjJnUQSP5CwbI6uUT3PFvpKbzx1rMtejY+VrrwpI
 e1DQeoIytd7oVwV8RUQnDVRiNPaIcyUAVyvijmENWhm77KeqD3AXRk6lv0KkpIbHNF9P5VoK9pR
 x46e2RAH/APN3jLYz1lXrl6AKL1U/gVQP3YT886v7cUU5s59s4w96xSlOMcgQnFkJxWRROnPW7s
 jqqzDndJ5Wo9iafUFnbZDmH+ssEWT9CtCwdlvOE03xYNWjXFyhIpJIlW4Hab2cBslqP2hwGRrwc
 yOop33WeH5N5lb7aHRQ==
X-Authority-Analysis: v=2.4 cv=FecHAp+6 c=1 sm=1 tr=0 ts=69d626d9 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=KPtWMpYoI-qC0yIVAH8A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: xIcvQdni1qMk1ITNd2N3Yvf-hlMfUOF3
X-Proofpoint-GUID: xIcvQdni1qMk1ITNd2N3Yvf-hlMfUOF3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604080090

Add SoC IDs for Qualcomm's IPQ9650 family.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/soc/qcom/socinfo.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 8ffd903ebddb..77a605bfeb46 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -533,6 +533,12 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(QCF2200) },
 	{ qcom_board_id(QCF3200) },
 	{ qcom_board_id(QCF3210) },
+	{ qcom_board_id(IPQ9620) },
+	{ qcom_board_id(IPQ9650) },
+	{ qcom_board_id(IPQ9610) },
+	{ qcom_board_id(IPQ9630) },
+	{ qcom_board_id(IPQ9640) },
+	{ qcom_board_id(IPQ9670) },
 };
 
 static const char *socinfo_machine(struct device *dev, unsigned int id)

-- 
2.34.1

