Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B5C3A962E
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 06:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778741150; cv=none; b=kkj8Az81xo6gSQP1Gpzq+k5yOtODVwly7pjN7fuxU4EUFWnKl/jTOS0DLz6Z1wRILOZTgtiSIVX98+HTBBg4xBSoZCju+cIUD4FolUmNPM9e0XLCT76T0s1ZV1/4P+M5C8M2RrGqhr2XRxrOyiPYGRdN8/XnJ4ozS84wC7G4gAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778741150; c=relaxed/simple;
	bh=jBEDtYGEa2IKZ3W+O1lVxJfYt+vX1gTebqiOx8/EH/Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=klM51x1QotTeDh7u44A6hE5ydA+1ItTZfU8fUPAeY1XGyHGO4mpz39j3ixlOfXd3HKxZJlEppZg0QbHycVnj/sEdYjKEA5iAEl8g8yuPrVtDyVqN/SGVzb0HPxc6p1p0i1l2pDliDQaUuZqhaXd89O9ddjosn4pJbl6a1gQpp3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N+2AjhuZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TIK7eQEZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N+2AjhuZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TIK7eQEZ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E691dj1966252
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 06:45:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=B92BQ+6HWYcw7rNENNk7fQ
	8re3zw84yQz2S+EvoqcHI=; b=N+2AjhuZzFkbY1pZJAusdpkX/M6Pqr+VGFgocc
	m9z2pVKVPbqRwecce8bC/eXplscD+1+S7DYaGtOwWrlE6UlMHjC8tplTCNC8DsVi
	oCU1Dd8/ebohi5YwNwc3dgDbPM4FJtzbhi69LuTpYEillvi+vN2ALQWB/rN7v0XS
	jPP0RcbujzPVN+1pmJnKuWqiLokCkgvlPLxfjXvnb+XTTxJRzAjXc1a28lKO9NvO
	Vtz4Gwky0+J1rhIErSpyESrayBvHQCYI99TtGS8zSHTt8j8TH8i5Z+tJjr91a++h
	tCMVSpwxHtmQGltSl7tj+4fSPggCXCDwEjHaTUag3XwMdfvw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e58v883uy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 06:45:49 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2babc42244aso142619495ad.3
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 23:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778741148; x=1779345948; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B92BQ+6HWYcw7rNENNk7fQ8re3zw84yQz2S+EvoqcHI=;
        b=TIK7eQEZkVwbe1idzL8FRqWW5bw18sVAzZkoHRA418wEusWiY79Zpb27m3mo61MEwj
         bxUPNqiGZnY95nfr+LpkGDPHUixEMu5veUHSuKFzlv1Rm85ZWwVzqdnDA8wAPASUnVsb
         hDHzTLU/uTSW7CW/CQQI8nguhkDTUVNbu8w/U6MgqmSGP9+UqG4apdZso8bs0b0WNBKH
         QxAxp5IaPmldikLN9kcblu9h9xcORA6j5w72o7yrT0Rj2K40Y6LmoI37MGpD+YUUD3Qm
         WDlNmR0RuROjrl7R1VTvrpeoqrLOezOQFVjDqt9QU6hVkOoqcs0LdX0JnTyjBkKojnYv
         kczg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778741148; x=1779345948;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B92BQ+6HWYcw7rNENNk7fQ8re3zw84yQz2S+EvoqcHI=;
        b=DCX3b3W5ZxmJGDTXq6pb8vZUoAl8depRboJywOsIYQNZ1DzN2XbztVHbNU5dKpGLUT
         BctYyTxzoMuQVZgY/+JZP3iu6ab/vPiMMVn9F0I8wGIUNTH2xkRR+YlKvOoy4HeyZzZ2
         ZHUqocA4k8Lmr6sy4Ii052jGvI1Vww7a0YhQzlinCEY70nuIVr0XVQWIJW9vBW7EKAav
         0NIHi+U/H8PR71e3FqFfnc4scIOUq5hmGkM63ssohwXcSwD5SVRu9H/qkmVp05WrvCzV
         HBYhhbXNbbI+UmIKtdBoIZu+/Jy1pO520TuRXj5ByT47H//M9rNyT96IidngD85ow1/x
         amug==
X-Forwarded-Encrypted: i=1; AFNElJ8rbZidBGm4WS9R7Y3PwW6OchV1RaO/QJHzDWU4FJ67jAvOVoFDDsAeb8UrqVaCfVA+dFo6SH2tdKhb@vger.kernel.org
X-Gm-Message-State: AOJu0Yw28ESn4y9N5NC1ZQdC8DVmPsJO6TtNBYU1QajyzLjXqw6EJTNL
	f2WLdpICT4Lpc2SKOJfreuOgiwhHQtDD8uyRcKTMk/1aGYmbVNeyw+nhX5Jnu68Y+W72hD3BKV2
	pv0JCoqolMilbJC411VqE/VHu1/fEXyzy/RbDm5dDDuDIZ1TzQ/9qUAMGOoJyvuLx
X-Gm-Gg: Acq92OFx6/tPNob3Tmvm+avUZ8U7YTsQMjAQLqp2Rp7S6R+PRhbm0jh/l6TE+p6PsCR
	//mcamh884KnahAv+gCyVjYLI0Cfh903Q0ZBF1P0U9ZlREqmVT/3Zdm3MMbbyYwXPuzcmPls6Yx
	lUlsX88yBBLGwB0SDCGu+vuQq1RBnmtZmi1TQtH7Il6mjaCajZfGJuNmZQX+38ff35HbCZXnmC9
	6zzdqpwTJDdjTSGNYXVnmWkaBfyesytYioVmT078QC3+aGeWZdeV+z/eEFAjQHMVmNBSQKe4n7m
	fg0fOL3HEnoxWemq8DYEN1ov9K2t5oMdx+BsmH5tt47O/6383PI7J3zU2FO0I9RJmjxaeXuZtrN
	dmFGc9+3SBvw4ht5NGbt3K6c6fZHvMZ0Xq0b1NaxqEgJqP7gyqXZdcWtFJXzkfVRI3UDC5pqwUP
	EGgs4pJ3tdGilr2Qrb4J9hUjsQON9uM73IUojoWr3ALhh1E9NGWNI=
X-Received: by 2002:a17:903:2c47:b0:2bc:7d1d:b677 with SMTP id d9443c01a7336-2bd27708c94mr73287935ad.36.1778741148060;
        Wed, 13 May 2026 23:45:48 -0700 (PDT)
X-Received: by 2002:a17:903:2c47:b0:2bc:7d1d:b677 with SMTP id d9443c01a7336-2bd27708c94mr73287465ad.36.1778741147511;
        Wed, 13 May 2026 23:45:47 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe49c9sm13387685ad.49.2026.05.13.23.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 23:45:47 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH 0/2] Enable QPIC-SPI-NAND controller for ipq5210
Date: Thu, 14 May 2026 12:15:30 +0530
Message-Id: <20260514-ipq5210-nand-v1-0-cbdd7492e826@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIpvBWoC/02OywrDIBBFfyXMusKMxjz8lZKFxrF1EfNsKIT8e
 6WB0uW5cM+9B6y8RF7BFAcsvMc1jikD3QronzY9WESfGSTKCjWVIk6zloQi2eQFu5pJe/SqJsi
 VaeEQ31/dvbt44fmVrdsVgrMri34chriZgtvGS+qpRofkPQdVVQGlci70oXKKNLbBNgr+35ji9
 8XZQeQ9QaW0yNygrtnsGrrz/AAztfxw2QAAAA==
X-Change-ID: 20260514-ipq5210-nand-eb7e15d0d371
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        sadre Alam <quic_mdalam@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDA2NCBTYWx0ZWRfX0KhZntcY5GOx
 exd6DcmEtx8ePP4Xb6IPcEtUrkHdLlol25WdSXdBJNGPU0EFDdtgY8LLPZ6a445cRrqOhmrTXlU
 5w9sARC8tS9h06B/J3i9mqHrmXv+CMsUj3aN0VZBZXqHDtkwpMxTBfo3+zh+geI/gRm5GqBteuW
 t1wXemt1FfE6Guhg+zOUALnO7hfUJN8/r5wiwAxWkoTEAqHu/X1kBzJcZpyqcmuhMAfOe+CffcS
 w261khsiNe87XoEr2nezfrIiRVot79lGqjSzTyTbieDXyHE3jVxtVvHD8t0IS5RnsN7fAo12Tr5
 yBajX3baVtPIijm4CnwEV9g7+i4U2DwTHlVDfifcowfsNvsVDoIkWHt2NKWL3RsGPd54DTXzqph
 QCzdTHdh10rqzR1gdSdw5+NyC91ze4Xe3yfF6rDsrUwjLBClzVqDsS624sk6dfpmiT+xGZe2PkQ
 r49OG0PcWH8OfiTgbeQ==
X-Proofpoint-GUID: JvRteXMqEnus9LnUEOZtDTffKrjPV0NU
X-Authority-Analysis: v=2.4 cv=YZSNIQRf c=1 sm=1 tr=0 ts=6a056f9d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=PVFtU_vroSRoQC6WWaUA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: JvRteXMqEnus9LnUEOZtDTffKrjPV0NU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140064

Document the NAND controller binding and add the DT nodes to
enable the QPIC-SPI-NAND controller in ipq5210.

Functionally depends on [1]

1 - https://lore.kernel.org/linux-arm-msm/20260514-bam-fix-v5-1-58f6edb34969@oss.qualcomm.com/

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
Varadarajan Narayanan (2):
      spi: dt-bindings: spi-qpic-snand: Add ipq5210 compatible
      arm64: dts: qcom: ipq5210: Add QPIC SPI NAND controller support

 .../bindings/spi/qcom,spi-qpic-snand.yaml          |  1 +
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts        | 42 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/ipq5210.dtsi              | 29 +++++++++++++++
 3 files changed, 72 insertions(+)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260514-ipq5210-nand-eb7e15d0d371
prerequisite-change-id: 20260514-bam-fix-142a0ee8057e:v5
prerequisite-patch-id: 9e9abb177bcb562f5a07a4865e9d88e82dbb98b8

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

