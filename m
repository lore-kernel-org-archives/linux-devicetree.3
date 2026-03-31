Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0381F2FE079
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 13:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774965278; cv=none; b=etdsmSu/Ck8+XBNjSBCFNNgCWB+YUIPL9I/RkCNHtaoOVzioSBUX5zlO6Ht8KHFcwXSAAcaj2wH518/UBc+cIQiw/ssQtNBbkBs4Q88ClXfXBMQJtaJVx25ado55/J/pmyxkQVb8Jsyl/oWlvhP6tdc8slmR+aqdWvrgXaHj0YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774965278; c=relaxed/simple;
	bh=bko6/n6Y3o4LVRBfTVGhnO2E4+IxCBptdpcPANcT05c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZsB7DqJbNUpBlMDm9tPmffF8tM7yHf9DwqNLghXnAPCojHCM+5rH8Kaqh8a+MamyioDhwOdqqKjibVI2ceTnT4dgGfe6bJQyPoja+o2f1vPAv/k2LVzIrc3hs3uIcXjvWXfsmY6f0INooRZOOzBC1SqSq1gDQP51EK+XzqWfqXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C2o2dQV1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VdlO7akQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C2o2dQV1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VdlO7akQ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VCNHkA2164532
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 13:54:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2d5FgYC3u6aE0xSdZ+PL0d
	lE9GM2ls8llKU/gqPjrf4=; b=C2o2dQV19D8XQgKcSsBP7gvRkZD8SGHCiL2o2v
	i2NfKWidOMoI7BnhCNOfak/oGoBTdlzEXX8laUmSwvGuFkIRkaxdO7CfB7Yi9hiT
	T2w1kN38qafr7ICdoJIxeFEE4ch4ybeZop76eS8sEGMCNNULEiNDvzKMtaBcOHEE
	6ozfeviyDrSCWfoLkjvD8HqPA7s4yKWIFDpUqYahSsLYXMSxZ9h6jOU//uKi15Bl
	R2/juYlAKRw7mL6uuePwSab0qV4B1hDNli8Mnp94sNA/iEoXDjtr1iFN/sLc1pWS
	NJtvcEimKM5FOCQPTzJCp+/KlLYYcXOD8MxZ7uaqVuej8u4g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d89ga1sdv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 13:54:36 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b24e45271cso29856005ad.2
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 06:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774965275; x=1775570075; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2d5FgYC3u6aE0xSdZ+PL0dlE9GM2ls8llKU/gqPjrf4=;
        b=VdlO7akQfXd5DWq+5D8AA47i7kU05McShob17Vij4qLQoi60t+Q3OD0P8JS5HI8kmF
         DMfwGAEakcwdn73dw/bK5uz01J7yI022OLZOGUJJU10kHBrRt0NbLjC3E7rIPWywTnD1
         sL74lu18dhOQyXNfrUHuhhqAYlLrmvyFdhOPpdTEdF5bFBsyV+4TJjxlr4RBPpQCHUpU
         tmcpuyllKM+vdocF0XI0cr5YEUJSHq3RMmWQsVGBrlcDCqlkcRedJhpzzxR84Q7grJtN
         s21PTivyFRFPR0OaJzFAIl3vMNzdfdkv5ffZsZO6pHiJPZV03FsiSQuNN4hzpRlmqYdo
         Ei7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774965275; x=1775570075;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2d5FgYC3u6aE0xSdZ+PL0dlE9GM2ls8llKU/gqPjrf4=;
        b=dPJnNIdBjXvIp5EbS/EzllOAXzoghRtkwzDBaewhZtsXdvi/DBL/MSjyzjHTHC7zcc
         rZMavG6vdNwZsxX4vBQpvPLgbVUwhr61LCHjmgIXgm5MgfmgDvZknfZMgstw2G6ZXRXd
         C8tqHU1ZQ9KH6/lp9W1JO0pU5rtOY5bR3z+Y4IgchjI7aBmNFWQ51TvgIEPCZLv5KThM
         unv/RiNUEcLNd/1TzcvpjnmbI3UEpbAvtMXTyluk1Zt4CvQ3LbtuqGTQ0L7SZzErfUhd
         nwuj0gTTzKA1/4yZ/zBc0sJCWIj8oFwWaokbBa34urD9KOxjIq7YdbN3FLRUgTwPZ6Oo
         7C+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWTO1fE89etA3zAKPW0XgU6ISqMS3wA1/ugKC17lRG4HTqMk3rhImxiGxHyGJmpq6/sokcXdzaHU3L7@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhw0kocpWIf5kMwKfhSYwReexXCjqY2w6QaWa8q4pPK9/1CbEO
	F0awNAtNmblBfOGEgHv52h/oi39tl2rDaOfMnnNI4A/IuWCdnuBFgHVRHZoqSfP1K13lyd+X+aS
	G6omztyWJhKpnu/0keI7UNxOpFGoa6n5OUTlketZOcuAhskfVjSNty2CRWlz2ouzM
X-Gm-Gg: ATEYQzxEFclP0t92vdccn1mz0g6EnSwUAIoIc+ZnS4+y8pR0r+d6HXnJ3GZSSWeap+K
	ZhNeLDZrjUGemyGUxbsE9gwO8cgAdVrDi1GJDLUWTDqjWvaJO0rnxD9RR326a7beVKI8PW/3nFX
	Nr9vjtK9yohxS9EU8HLfG1HNYG2BwS0bGvXqfZhPqioX4O0FzpiR7JBK7WgF1cXQJ3Ny8rPP/w/
	kg5KCxPk9l4wcKPYNsCJ0TkxfgIPLclipM336UdCLcMVKOd4SgQCcRNxs33BNBnZrOe7amW0IBm
	bTsisy7Ob26u+m9iHzRGBCH+PtDA/BnyIoR9qAd+iUvMrHofTmNmn63e7QRM+4UWXDwWSNgjldh
	e4cP0uIlT8naMMafOH3hnNZna1Gbx9b5zGa/Q0Klft1pQQ8dZh19/LxzrrWyysvgh2raMKILwx2
	3/tgo4uQlsG+uj46XSJCN//bTZDbgmbIupKXyEoAkG9w==
X-Received: by 2002:a17:902:e742:b0:2b0:7e4d:f43f with SMTP id d9443c01a7336-2b0cdcd3cd5mr171529835ad.41.1774965275556;
        Tue, 31 Mar 2026 06:54:35 -0700 (PDT)
X-Received: by 2002:a17:902:e742:b0:2b0:7e4d:f43f with SMTP id d9443c01a7336-2b0cdcd3cd5mr171529495ad.41.1774965274993;
        Tue, 31 Mar 2026 06:54:34 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24268e7f5sm112748945ad.35.2026.03.31.06.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 06:54:34 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Subject: [PATCH 0/2] arm64: dts: qcom: glymur: Add QFPROM efuse support
Date: Tue, 31 Mar 2026 19:24:19 +0530
Message-Id: <20260331-glymur-qfprom-v1-0-5b4284d23c80@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAvSy2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDY0ND3fScytzSIt3CtIKi/FxdU8Nkc1Mjw1STlEQDJaCegqLUtMwKsHn
 RsbW1ADuBShZfAAAA
X-Change-ID: 20260311-glymur-qfprom-51c7521e4da0
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774965271; l=829;
 i=pankaj.patil@oss.qualcomm.com; s=20251121; h=from:subject:message-id;
 bh=bko6/n6Y3o4LVRBfTVGhnO2E4+IxCBptdpcPANcT05c=;
 b=w9WwVzeTekg3k7DDit81XXPqscSO+tejDRErTEmSn8WAsWmtMPdbolhG6P4Saya6v4tjCBDxH
 unwEpCNzDTeA+09HCJvoQsNE7HB1c75mB9xUnCtX5oikyJZYSefCJv4
X-Developer-Key: i=pankaj.patil@oss.qualcomm.com; a=ed25519;
 pk=pWpEq/tlX6TaKH1UQolvxjRD+Vdib/sEkb8bH8AL6gc=
X-Authority-Analysis: v=2.4 cv=KJpXzVFo c=1 sm=1 tr=0 ts=69cbd21c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=9phbO8Kjjr4k9TnTO1MA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 0SKvyg4OyPKkbS0beaa7aLnMSZ27h6PM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDEzNCBTYWx0ZWRfXweEjw6ZKhze0
 Arm04URGr9u+TLE4G8dWSiIi751N8SYLYKkQJ2CP4vWf4UXOsVgnG9vcxE1v0eRZr5zEmR16GbI
 LtZ6UQnOu5D6c+6M5hc2cz5XUZ9hyMpEjB9FLdNJIDDeDfoYD5AG7lioIaCnl+0A7x1M5wc87TJ
 2p5xCf+PfmY6jOUxBOearN1+kF02alk81hvFTK3g5jOT/G1eHKi6N/9CzE7KjwVyJONhb1L2tzk
 tmiRMboiQ/YnlyYikoJdz74JFjoUFy3PQIh5/qbmya2M2ggW5uU0FkaYnBindmeniRgExWRhPb+
 IQ56S2MFR05VZl1eaKdtmXlYSlAX/0qlSyb0I1UYYFIRsNiCvZRFxdCXQpplL2MFdf6MQVcw0z8
 XX7hSgr9KYlW6IUyw7C023zfHg8uT8lz+gEQLfQFLMqYQkZcD9J6FGqfWBPiMkDOQaZDWxLRd+s
 7QcVKGU9YIzA+3GS/vg==
X-Proofpoint-ORIG-GUID: 0SKvyg4OyPKkbS0beaa7aLnMSZ27h6PM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_03,2026-03-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310134

Add dt-bindings and dt-node for Glymur QFPROM efuse. The GPU speed bin
child node nvmem cell contains details of clk frequencies supported by 
the GPU, which is then read by the GPU driver to select the correct set
of operating performance points (OPPs) for the device

Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
Pankaj Patil (2):
      dt-bindings: nvmem: qfprom: Add glymur compatible
      arm64: dts: qcom: glymur: Add qfprom efuse node

 Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml |  1 +
 arch/arm64/boot/dts/qcom/glymur.dtsi                     | 12 ++++++++++++
 2 files changed, 13 insertions(+)
---
base-commit: cf7c3c02fdd0dfccf4d6611714273dcb538af2cb
change-id: 20260311-glymur-qfprom-51c7521e4da0

Best regards,
-- 
Pankaj Patil <pankaj.patil@oss.qualcomm.com>

