Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15353B8BB9
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 09:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779268047; cv=none; b=kmwqNwvXzQ/KEapg4632dHePlbBvKtnvlErr6w7nl9v8SNqifzvfURKkd3yoZXHurmGS1SgeGod6OEwKEORGZjP8p2839WKudsHPcWqUbOwP3s33j1e6tjMOa8Op0ZrJbAkYPnEdbYaw9GAxzeOZD/Nb9k/fM4eYn9hKPkdX7c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779268047; c=relaxed/simple;
	bh=Aq3EGiRll8cEh7kakXlEMZDPaCvsmEat3X04muRysSk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hxiHkiEhIQYN4a6HFbIv+0ynDdQay398dhCzF3Glk5U2O1bzuDmURSi0il+94hyZnBCoKq2eFjJMIxb73UXFgchgJKH4bh+YsdbulVzne4jSPABw29RhWiLtWWmA/K8HQYpCtebPYfZCRXpeMpbXEhU4JrhnkcmJh+V9MWFbNTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o9tHfKTg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LTLesh9c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o9tHfKTg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LTLesh9c"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K6SxDo2984422
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 09:07:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PcF5GShkp7/Z8IOVTXkjaq
	cfidS5rTrtlMbwB5Gh1gY=; b=o9tHfKTg1rk3aNZuTC0z0a/gIBuh7GEKT2zmlN
	+nqokjtIh5PNVy/AMJtXJ0FTsqgnQz7uKI/9phUGH/tlusj35ceVmHFsJ2llw9pB
	vRK6Fj+VPV00D7jqRQrTEqir3mFaL7okle5eoCzrGvn8XbYutVdEolPKaLdF6QTI
	hQnmFlq7ZVhZ/fpTCM3VllGjWoIM3nx99aqMJXuhRn8P/FXRzE8uU6CMnMs/XxDY
	U7xURVFIYaXVEyVT1UB1vJ1dwpaLOgjND6jhVE/n8Z5JS9wW541e+vbw3CObOKB8
	Q9K6Wl+lOEkhXv074in1JA+UzHgadTXXFQFPEhZnWrICoS1w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3t41m0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 09:07:24 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ba6fe41283so46811205ad.1
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 02:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779268044; x=1779872844; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PcF5GShkp7/Z8IOVTXkjaqcfidS5rTrtlMbwB5Gh1gY=;
        b=LTLesh9cbNc8kTQTQk/xhQKiXGhle3l5ofKIumbbljto4UWbFNOZJpelvjaLd3b1mg
         YGf72j+wWzU35trIJhVITgEPxDVeoOnBuUnhkZu9AssheYTaxluVNHDOPxdcc5o16w/j
         1TVjGa7rlSoyhCAS6gyQIKyhveLjjA0lrW3D77RCpF0Om5T4Cxkub7hdzx8BNC5OzeJK
         CWJyLD/nSp3dtU/pC+JCb+zUQSz2y1HiJBYgWA4UNrTmOEYkeJBgX0IgOVcd0aFpLgEG
         Y6GsxRGswoDVexI2ki9DoYlCCfv9MI7rM9GRquJSQ7/xAAXNFBOOKJJxel3ojHO9eNK3
         +n3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779268044; x=1779872844;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PcF5GShkp7/Z8IOVTXkjaqcfidS5rTrtlMbwB5Gh1gY=;
        b=S48sBbZo24sQEUaSqHsS5D+lNLHivUidZvhUmaBS9DU8CA86f10M6iqSnohrZCeIaw
         qLe3MgoeGeoyN/rSP+nWboHSXlhfHepP1Lc5tFPATKOGmk1w6TZ/dog1CSSlIm/BI3lo
         Rk6LivEcUFz2AU+DsCUo3R8M0LqTcgJeQ8Mw0jJJOST2J0Yyj4lFlaEep2TJ9Nd9eRuJ
         +lwvd0ly161uvhxIk/x/dMb0y9yLeYq9qd0ZIrNdtJiH7tGZxmbM23yXBQY24IXjGmeC
         lljxEFauhcveA0GoIuf9wz2xzTFIel02gFHcDo5ADB93YFfoUTokCZssfJ1biMTahgbO
         ou6w==
X-Forwarded-Encrypted: i=1; AFNElJ8jdssJg6odBHp9gpTdziYQOYMoSovtUM3mXTHkNNvf+4ntTtgKEWs1tFts0FqchiYERL385busxRyy@vger.kernel.org
X-Gm-Message-State: AOJu0YyWR7YpbdAhbeeRXeTcCnilj7PKNSJOb6sPhRKLdz496cRJrATb
	AVLRBSCTphdVzj2jbtxP9TNFcV+b0S43FKYCB6dGLIdPe8CbtA9O5qtbwD+tgKal+T36UI5nSXu
	sd9NhK3IX2qKBV4VguGO8D7fJeaylUP1Yq89MeAfsn9m6hq8C3PbXkGPXCZceEHA=
X-Gm-Gg: Acq92OExd+w/p2hXQwctVmuJ2DCLKygJnzwSdXflH3HieFQKjEiWq0E6t6BdBkQ+mLV
	7HnSRuAmAvYwQxp8A+MnUps4F1H3pymzN1vDUQrfh1y5S2qumQJEY5tYiGlVrvd3dWpaRz4/Way
	Dj+A04yRRleU1QMtC09qMb2ImDEUNZStREdx5Id/djR5JQuWi9EYSS7QZJGDP7MxZ02/PEl8dbv
	Ng3A/lZJCcID5Wm7LOdXlw6HNETkvpUXIhtvRl3Qg5DjKgh38ER2Tr0EISVcfBPY98sh0FKoLLS
	QsZCrHEEmTmvEyJ2/X0KJTl7ol7IrPYSvFgQW8T90gEgqG0039Hc1YktvjG0EfSbPoKveODFR2O
	6X9o+V+wl5hcqIHNjB3hzrrFiq2bqmTJmJaWqJ327TtVE4ytFAYI=
X-Received: by 2002:a17:90a:1649:b0:369:946d:32fa with SMTP id 98e67ed59e1d1-369946d3704mr11068321a91.5.1779268043880;
        Wed, 20 May 2026 02:07:23 -0700 (PDT)
X-Received: by 2002:a17:90a:1649:b0:369:946d:32fa with SMTP id 98e67ed59e1d1-369946d3704mr11068300a91.5.1779268043361;
        Wed, 20 May 2026 02:07:23 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-369517a8612sm17079903a91.12.2026.05.20.02.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 02:07:23 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Subject: [PATCH 0/2] regulator: qcom_usb_vbus: add pm4125 VBUS regulator
 support
Date: Wed, 20 May 2026 14:37:10 +0530
Message-Id: <20260520-add_pm4125-vbus-reg-v1-0-f6d15d7dbbe8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL55DWoC/x3MTQqAIBBA4avErBswU6muEhGmU82iH5QikO6et
 PwW7yWIFJgidEWCQDdHPvaMqizArXZfCNlngxTSCC0FWu/Hc1OV1HhPV8RAC7baNbpxxpKqIZd
 noJmf/9oP7/sBsW/nXmUAAAA=
X-Change-ID: 20260520-add_pm4125-vbus-reg-95c858c6ae43
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, jishnu.prakash@oss.qualcomm.com,
        kamal.wadhwa@oss.qualcomm.com,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779268039; l=815;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=Aq3EGiRll8cEh7kakXlEMZDPaCvsmEat3X04muRysSk=;
 b=00F1t+ApeQIYaweDHjHwDoqN4Rb7fSVE8RbOLerC9frzmUrfynhFaHpq//qE2DiLJZFb/V8da
 XSQJ5pqKtTaCJZIRMhPwHtfuNOW59733Q+1jaCtDs92Mnr0wBLOlNYp
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Authority-Analysis: v=2.4 cv=BOCDalQG c=1 sm=1 tr=0 ts=6a0d79cc cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=4HaxCju5o8_Txk6xNbsA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: 80bernT31C_N7q6jxbYwEjC6WmmfiP3N
X-Proofpoint-GUID: 80bernT31C_N7q6jxbYwEjC6WmmfiP3N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA4NyBTYWx0ZWRfXzGzt7TW7GX/l
 fapi6cGbmm2BSRoKlpSdtqCk5uPtz9GXG+G4wDW1I+2bY0P49e6H0bst/TbTKEZ1kBN+VRcTxHB
 si3auHvjhresqohigzBaPDqsdcVD6/eP+foxA1ntjkBpLP/s9V7+XNoYX03bKqIOn8WZzglHiz2
 JZQHFL+sxX4CRtbqNdHwkU+ZXPB6GkOkG2DiHuZwyYCHzYN+7llUGvIKPDy8+L5Mnj4YiNiFCze
 AvvjZutTzmH9T9uBJMZDDq8W0lRf9UEvIfAph2K5Y+hp+eOeyJQ28Bof/92xATjLRxHvBD6fTQx
 /FaNMwmRybuPkR5o2GheAlseZ5zxIiZNRjI5/y2gOCmu9BGLVW0PTrWRK1qE8xhpOgT+m4cHy2c
 dKXgt482LdEOgyPIJS7HP5SznJ5TCzB+u73/9VMoXTRrVSTfKBizuvfmWrgZmpDnpa8v2nb3GIF
 BZCx4E6ijT2VlzWdArA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200087

Add support for PM4125 USB VBUS regulator. Unlike PM8150B which uses
a current-limit selector, PM4125 uses a 2-bit VBOOST voltage selector
supporting 4.25 V, 4.5 V, 4.75 V and 5.0 V output.

Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
Rakesh Kota (2):
      dt-bindings: regulator: qcom,usb-vbus-regulator: add qcom,pm4125-vbus-reg
      regulator: qcom_usb_vbus: add support for qcom,pm4125-vbus-reg

 .../regulator/qcom,usb-vbus-regulator.yaml         |  50 +++++++++-
 drivers/regulator/qcom_usb_vbus-regulator.c        | 102 ++++++++++++++++++---
 2 files changed, 133 insertions(+), 19 deletions(-)
---
base-commit: 6a50ba100ace43f43c87384367eb2d2605fcc16c
change-id: 20260520-add_pm4125-vbus-reg-95c858c6ae43

Best regards,
-- 
Rakesh Kota <rakesh.kota@oss.qualcomm.com>

