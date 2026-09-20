Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8612E0B5C
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 09:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789895471; cv=none; b=aMqKffQpHhZagPPFYfcF1KY/7ke7YEE3uwpj7/fHBlyEKaO6MXwY8CSJ+Sz8hzbwiIbYhhimFpmd/5EVeRzFkYyuYowsdI3Kc7LNperS9CwUBJgt4vlJTrNhjYlEO/PZA1Rard7hWdWiL7bwYRxxP5V/fnhmzvjspK4/LElnLzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789895471; c=relaxed/simple;
	bh=jUKKHsJ+wNOoevjg3zWqhCwj9JSq6CVvfcbmi0VNi8k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qf3pbu34DKjDTM8nKgTSy1FCdq1xmQ+S3oL7F6OKoj7oXUbrC7S5wwECGO8+AB/gMpPYmRAed5otrCX5SohoHWacrscM+oz0ikNR2yR2q8oKut/y+h4lEL9Xf+c8/UhIAWtzeKB6GPz+5k7ilNPN+aXIY4XgnNkhQFUr0cJI+dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ik0XnO4w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e56fBy48; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ik0XnO4w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e56fBy48"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K8W4SJ1793460
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 09:11:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=zC3U63Vdt2nrgMKKnu1GOaFTrNnUgJkj6dJ
	gFYfKln0=; b=ik0XnO4wi06iMVcqe9ScEp79zOAgZDavDyIHPsfYUbGpSMXLwdm
	b6c7eIz3hEK8/4PmWnTtuQBXo0c+q/Vswbwe/9C87s4u4nbDWCPQLvtDFicusPJB
	8gBgWrhY2giWSOJWxqI3g8TJJZ9OP6eWVfZJCfeSkIaRR67m1gVT74dt2+dzk2Vu
	MqgasRb0zOUvMvjiMcsuIjnNHO9gjwpGvhvkTphoP7vfiiVoIKhkebjTrj5PtU59
	JPZVbLv6nuxmZXuevTzgjVLfR+PYjBAgRXV/88ek+njXZFy9OePEDgDvW5Q0Ua94
	O45JrRbHOESVMzQBjZYfqe9n6HRXoLc1ksA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gshqftrec-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 09:11:09 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d9336581a2so39255945ad.3
        for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 02:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789895468; x=1790500268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zC3U63Vdt2nrgMKKnu1GOaFTrNnUgJkj6dJgFYfKln0=;
        b=e56fBy48VqRHwC5EG+ftZrpNkyZt9Twg2SqBYFHEsaa9+/t21JbVR3gPJq0Kd3lpFt
         N2usdZ3+6CPJ3eefVOFhaq/EdtuHUJkmj4ohpwwsEE486ACCBCl8hvhUoCrLJKkXNPKC
         s7vCs4oqqNQy7cyerxJPVP6AuTmjJFP/iCnOs9RUtgBzK8fbS6v1vnUSv+oNCr1yLUce
         PPBU04mKtj1w4drKc8i4CepQz0CQ11By62+gWz150W3u29XF3paiyzlK8a9gMCCOGFC1
         UgbQ5uyyjeiCcZaZwONSP/4T8EvGP8utgga7mRTdcA8sXDmq+wInX6KFKl1imP9rxNVV
         dKfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789895468; x=1790500268;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zC3U63Vdt2nrgMKKnu1GOaFTrNnUgJkj6dJgFYfKln0=;
        b=VADACbRxZ/Tg+25+YqZYUadRfqdu4brr53Cd/pZccvewnLJLDr5mqE1q7tgiDVnlBs
         R8OevOJVrveqwVjqbeJOpzCUiOExw9BIq/hPz9LJK/O72xc+njXhpbwC9vy650yNGFzg
         Wu8txsOahZzHAn8sFghX+WoSB3JOiiCHhBloQdwh/wSSJ+i5fkC7Oz4LKxMBf5Qsm6HP
         WgMq98gAf2KIcle32hreUnQQ/NINM2kdg+00FDFgoMTRTo9YlHLx27P625EjoCbs034Z
         dl21GyQcL6TWmqQXSPKA3lgWJQqKdE5T43c6UzorwCjocV1KdNOfbhhkgH+AbFfHt/KD
         jaog==
X-Forwarded-Encrypted: i=1; AKwUvBw4VeQtoSDytxA/Kqeaw8KxCL8ed9jECJ568wKlFgpDquWGbkOYOXISxwV1yj3G1/Onq6dViFYubgNI@vger.kernel.org
X-Gm-Message-State: AFuF++mowVC4BtqzaSmht+pZQ6sm73IRZ/U9Y5bW3RIrXD2ClToZal+G
	e9WASnD4ZwWunpp+xjlir4omPIeqDakDqRMHKO5LYBHbVnYhjKlxbE7HRDPxZSGaOMcnqmyF2qQ
	kTcQhUJ6EngSY/lOoBdqv++cGiVmviAlzL+7MAjLg/+DQsFzGoePeeIwtiLS6YErK
X-Gm-Gg: AYBFou3dTFUeWkkgDd3n5f/21xW6zHrMxTSrQEneyXKjaHuA8Ue+y0dxZigR98jkRo7
	QBxCqU8IWsQkwrKDbChPgVRPGWs+CwvyRKz+UccGBKn7+/K0bfw5zpHwort4R8FoYs6vN1Xi59q
	ruckpPop2ljDxPLIWXKNrsje3FKU5rnTqm9xmZsHUN24sjQS85CeQymM13q/cCjXItfSUL5f11u
	vNCJgX1jGgw3Yrfwu/j0qwxyLhGfnB7SrdvQYLIMhpZxRuPwhTnlvw1VyWHm6Ki5CUpoVFykQWm
	cVJYZ8U/U8SBzeq+XMfq0WTtGtVYVJrDcNRikkM5+15U2wrTY2sdKTOv3OYIaPIvlb9lT8+Iw1G
	n7cDnMQjM8Yngrx3K5ud8h1xrYR4PFBKFtfIFYDLvlgznnZ485AxWksoi8xc=
X-Received: by 2002:a17:903:3885:b0:2d8:d4ce:7e3d with SMTP id d9443c01a7336-2ddb1b8987cmr124497385ad.18.1789895468342;
        Sun, 20 Sep 2026 02:11:08 -0700 (PDT)
X-Received: by 2002:a17:903:3885:b0:2d8:d4ce:7e3d with SMTP id d9443c01a7336-2ddb1b8987cmr124497185ad.18.1789895467901;
        Sun, 20 Sep 2026 02:11:07 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c3313d96esm10730242eec.12.2026.09.20.02.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 02:11:07 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 0/3] arm64: dts: qcom: nord: Add camss support
Date: Sun, 20 Sep 2026 17:10:50 +0800
Message-ID: <20260920091053.2214965-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDEzMSBTYWx0ZWRfX91YGdAmABl+G
 Q+zyuaa6Hu98/GGjpsB9i3HCF7vf5TmGnUTL8/Pdh72bVAlltxSdkjEf6/02KifmCuGIzdiMaKr
 V5Xxo79VRrMjsVhV2KwOlgLI1fQKisKoTRUCnSMVgfVktMKszTcSNinzuxRxYi8zLAdVR8SRmnV
 48CCqHx65WPFIlBbr8fU6RjjzkbRAFznweRbTn2gjaeOuTQZ0ornnGhK/Dn2nVFF81FF03KdlKY
 7mNuegGSg40ozkgA/iW1IOgeFTzfcgUNLj3yEl0RsOFZimnDt4mU+4O15uyz0Z/9JU1tXaKfr1A
 cRjhJRrLeGXI9hcFJ29NMjtgmaYhpSqLhoPZUA3wPM3+oYwBaWK4mNl6YEAiiXw74htuXhymM1q
 fktuFWenGBEsE+POiJZ8a+aXQopnQ0z+MlT1ppFlcx/Xp47eKiqIz9wVPA7V8LkA46CboGALkYm
 7lBY7K+uTHNpLEJJW9Q==
X-Proofpoint-GUID: s0R2lmgZQhp1Nkwq5mj75qLx8miWa23x
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDEzMSBTYWx0ZWRfXyN63Cdo/HI40
 X1sjMrdF+il+xwXF2EjeCj1dxH3LqPC1qHmZMYnJi1/RaVHsE3eIVHADC7RdZ8uR8JVRiLhXUn5
 6L1ZAB3o3tWOaK26jh+LQNZwqbnOwxc=
X-Proofpoint-ORIG-GUID: s0R2lmgZQhp1Nkwq5mj75qLx8miWa23x
X-Authority-Analysis: v=2.4 cv=XegcX455 c=1 sm=1 tr=0 ts=6aafa32d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=z18lgUtyltjxkIEc-I8A:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200131

Add the camera subsystem (CAMSS) node for the Nord SoC and enable it on
the Nord RRD and Nord Ride Embedded boards.

Dependencies:
- Nord CAMSS: https://lore.kernel.org/all/20260915-nord-v1-0-20db41a7f1ff@oss.qualcomm.com/
- Clock DTS: https://lore.kernel.org/all/20260920081049.2183845-1-shengchao.guo@oss.qualcomm.com/
- Ride Embedded DTS: https://lore.kernel.org/all/20260920084920.2201418-1-shengchao.guo@oss.qualcomm.com/

Shawn Guo (1):
  arm64: dts: qcom: nord-ride-embedded: Enable camss support

Wenmeng Liu (2):
  arm64: dts: qcom: nord: Add camss node
  arm64: dts: qcom: nord-rrd: Enable camss support

 arch/arm64/boot/dts/qcom/nord-embedded.dtsi   |  64 +++++++++
 .../boot/dts/qcom/nord-ride-embedded.dts      |   4 +
 arch/arm64/boot/dts/qcom/nord-rrd.dts         |   4 +
 arch/arm64/boot/dts/qcom/nord.dtsi            | 121 ++++++++++++++++++
 4 files changed, 193 insertions(+)

-- 
2.43.0

