Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C78F3B7749
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 11:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784289271; cv=none; b=WdlM07+hyUofqLyqfzlptrVawuIB6fD5RaudzS3tmT8kZZz0kixiKv1rLLUu8e8ZsQGLDZlkQGMSMJd8lAE4SGgd4rrMqtZPHLsEqLbCBAFKRJKkYxyf4ka5Etvu8fzLUIqh05zQ38ay/AMlAOEwmmoQh8tLs8C0lL1Zdo6FY1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784289271; c=relaxed/simple;
	bh=JFGjLtrj1zZzYn/Ag3VBI/clEiJ4wT55tKa75dJeRuw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AoPYAJpzV9AoN9EHuckM2JF2N9YjEELtkh9wYITpEh94D3JREqjWMx8QySP6j9z3TjJkLL0QarOb64ZweA2ezoP5IsriLGeIY+UWaSYbKwaZMbB8FVGAg/fD42KUW9AnCohGRqIBm2VI2b3OQ02gGgnJ77alQKssIujFqZa9ykE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FudbfHAo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ja+JFqQb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FudbfHAo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ja+JFqQb"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HASu5s1632060
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 11:54:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ayGOx5bR5XzD3m4opmyJF75sdfovMNMnHcpR7EtzxsM=; b=FudbfHAoVWtx0qJK
	t+OstdOYiZzUYOmeEv460bN798bEaO+laTY3YjcFcsempzIoyQTpfAzzioDQHV1s
	xKDjrwwLCYqNetxDxgv9y2coZOGGmxKVxFbkY2fGTuYdQR9tRbPaXdQMYGr5o2Iq
	5HYTFSc2BHlCX/rjrYV7cbM9HBydZKPKAVUyAbWvOwll1I6WlgX4pOwffwXA+XDO
	RS4AACpjAr5xZgSFH+5wGrZEKmzIgIy06ahzvlzAmtie8DpudhvLTdiihpTXYKro
	zGqWGfCRpHOKdfQHSf7bcCb62QCBadEPk1GKqVbsCOFrvtiF5+Xw3vin088yc4Q/
	996wtA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffe0usg5p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 11:54:25 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cce14a21faso27713155ad.0
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 04:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784289264; x=1784894064; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ayGOx5bR5XzD3m4opmyJF75sdfovMNMnHcpR7EtzxsM=;
        b=ja+JFqQbzqbC/w9bWGKGmjiF/hwb71IoZwZfKCO3NRAFVh9vl7SdyI1Ae4NJCKgEXp
         zIPxB97zMjyJ3qAc5Yiz3U9xsGD0+AoJ47g+XadT9LQINZ8YBJNFr08m7mgbSeLvn2gB
         1xyqMzhCl2eRl51h1gtWAf13x2c29VafPkPdTfWS73MG/AT3vuLpaVVK+2ANqRKqc3SQ
         DkLR+07JJzqhgJPmyxzIRlIUR03QZGljqC7QKKQQE+3udgh/DuT6wYwj3y3XmHH68/wE
         XhsMcHJTs737AxsPH+9Tw0mAIsBgy5/P30zBTEYAGrD5A+qzaxHol7zNkFq5yZyO7PNF
         D5EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784289264; x=1784894064;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ayGOx5bR5XzD3m4opmyJF75sdfovMNMnHcpR7EtzxsM=;
        b=YKrvM2EditePr4mYnnhMAU/7Bo0Xzffvuwpq2HXRc6npU/zNVP0q6SZQKZhunnXiRK
         DRDSBJ4sbqunfxOPPYVlMrA/CWk/DJmotB27uIp43L5XM3yz2q4IUCsGjpQb2SBhq7nH
         CkXDxqHExpB8/PELfZyI/ztEcKOjbZodCKU/wSdbrelNm7zxASb2Q1wT6XJ1YvIUJhau
         ShT5BpUjOeGPMGIoyhGywLKAr+D3e1Om6C8n/ZSkvD8qMDrQ0/R3uTcYunTkzxlzKt8h
         eFkrMIAux+T3izfctCvi+E/o+LdCGh02dK8CSxLgu10B2gb+6ElUq4URA+06mRXCWtoE
         xcog==
X-Forwarded-Encrypted: i=1; AHgh+Rp6Ye7NwwdC2JTfG7aEnfhd7v6dCJ9IsR1EGi12l05koMm3ohq6HkFUjsxx201cyZx84E+xrqM+Vxov@vger.kernel.org
X-Gm-Message-State: AOJu0YwJZHq6Up0Y5She7B/EVOrFp18ucOGmL3jh6kltI4RRSP14uMtz
	soybE1KBPntQTwy2xic4WYsHUP6gVYey70SENJzzMWfitaSCgn5nQ3YaNsEhhUec026KnwS4qnu
	IzmmMQ6LwfvSGdxMPz8bjdxALIaXvtJooOBBOg5Tctmhg+CQ3poy6wvwOPoET13pA
X-Gm-Gg: AfdE7cmUpkkOYWyVPEBILSa1Rdk77xQVBdpYZAQ6sAuclD9p6eUxqdD69Lu+Lr6tuEV
	qRCq2aJKYqj1KjtBQbarMoAc6LMh2+IcJxvUdzykoD/dF1zaQqQ2YGnLcJLhkl+NnQjwTkdMxM+
	irKlp3cpYxDetRGKakj0T5QOckas/PgR8TowfXxPDOsha/fksIAkUYi32uefrYPQu8a4lYYRPcn
	/dyNHi3Oh3OWcp5LegKNQjTLGM+ieL0S8W/5Fp0K+mlwF5Tz09cMG5fwVdjU7fcdLYBZykMg4Nt
	2poTJkYyf2J/l9F4RyHcq10r/wmsKsgy9zv+HSxHGRiO8reXwtdShESrnAYVmK3aGVDmS9WN+OQ
	aRWaZA0ul/0vatL53TmUt+6vCcCSdBYpYvdo697dz+dILImZ1YSpvzizqClpm7TMi
X-Received: by 2002:a17:902:d501:b0:2c9:d8c5:d55d with SMTP id d9443c01a7336-2cf349bc5e1mr22316265ad.16.1784289264625;
        Fri, 17 Jul 2026 04:54:24 -0700 (PDT)
X-Received: by 2002:a17:902:d501:b0:2c9:d8c5:d55d with SMTP id d9443c01a7336-2cf349bc5e1mr22315915ad.16.1784289264217;
        Fri, 17 Jul 2026 04:54:24 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf344f12e0sm9481895ad.31.2026.07.17.04.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 04:54:23 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 04:54:09 -0700
Subject: [PATCH 1/4] dt-bindings: arm: qcom: Add Glymur QCB
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-glymur-qcb-v1-1-aaf1cff84aab@oss.qualcomm.com>
References: <20260717-glymur-qcb-v1-0-aaf1cff84aab@oss.qualcomm.com>
In-Reply-To: <20260717-glymur-qcb-v1-0-aaf1cff84aab@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784289261; l=795;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=JFGjLtrj1zZzYn/Ag3VBI/clEiJ4wT55tKa75dJeRuw=;
 b=O4K0VfcphQoj6t0S34CLi0GaJK62+cErYHu2jC+Oe0oh0H0wo85A5u0vBOFtcF5GKZgo+E5Xk
 bYAhgt/V9N6DK0cRLCusXxBb2W5lO/xHO2qmS9/1eAegnzPo2f6Z4Hl
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Authority-Analysis: v=2.4 cv=deWwG3Xe c=1 sm=1 tr=0 ts=6a5a17f1 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=rhmdLvgBfCRuod5L2MIA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDExOSBTYWx0ZWRfXxg773Il+OV7f
 F4SYiZ2RHPQYhaQ+WytVW7xCeuT35ImGQOvd/19S3Z23oorAy4oxuF9Xiik6SwaTMGPjq42iSZO
 AbvMLXaaFUD+jJQrI2mV7mK49OvDxtWFXdE+XyTEiNeqjlqAEtGgJvQHuQfGjwXqs3b6Y0WdxmR
 i72Pqxn4G5CAt4vKhsqXzKxBnPtpd+FbJGpGngHRNySg8R799fPUUfZMCfgP8tc4IDr45oCu1kX
 721rkuvVK1aqSsVHBuC+RPPbEaPx2zhRbUmgxqqy4InUOCe9HRrXsgtb+MD9gKZ/DuXeLnro/C5
 zquOazN6BSrCQyIQuZ/vmsO0rcpOhT8liLaB5d91JjoHPMf2QfTtyiBtSmfrxQIf+hu2S+km0Kb
 jpQr1kJf4Ami/5jtC9640MwjClMgSPZqdjleT3Ml7FTJQWQcnIHWg7wpc9qyPRMHWNTRiJGjOJw
 lIlqSObGFpl1TnWsCVQ==
X-Proofpoint-ORIG-GUID: Pni5LcTbzr20xJy24My82tMuuTCIPGqs
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDExOSBTYWx0ZWRfX8CiwlphS9qGX
 OeSaNvH8ZUkfkeYaI6tLADe/mLQTZJw67F3Ds/ys5IFduiL3DHCKgOdDzBE2CqWb5KjV3+MTN3W
 HJ+eAGQcNTpM6w1c1o6cwi8X1iK0kDg=
X-Proofpoint-GUID: Pni5LcTbzr20xJy24My82tMuuTCIPGqs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170119

Document the Glymur QCB (Qualcomm Compute Board) board id, an open
form-factor Glymur board intended for compute bring-up and power/signal
measurement.

Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index c7c9a9279684..0ca766f12147 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -87,6 +87,7 @@ properties:
       - items:
           - enum:
               - qcom,glymur-crd
+              - qcom,glymur-qcb
           - const: qcom,glymur
 
       - items:

-- 
2.34.1

