Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794369646;
	b=hPxsIPveMqE3prQyUBB5gv049SVfkyzOBjQ4P76Ti8AZf9YMAmwtQ8fhF9NQ2yQo87PS
	 xpSzJXKDlPGH179GWsVUB9OF8mpdD7d+U38qY+6b9fHrRYiJ2IYhvS1XrTRIN+Y82DnsU
	 eSmgHxatk4CM2vyAaX4ROupc/tTVt3Ff8Hga9tae1nKK9Z/sXVh6RTuJdjDOu3OH58iP1
	 yJogHM652Zmpye1wY5Mm7ETpMI4E3CCkuUpKOvUHvvAhsZ9986y02nqjnIOZSWnykaGPr
	 CYqHV7s0PeTgZxAp+Cag5HHo8U7GbXt35c8zj46xiWaIx4Wch76FUAfmonRDRIpdn8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794369646;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Qlr228EuIzXhz/N5k30rrxvQvI1lv73pvJhSOTxy21I=;
	b=bFKaDn83dnz9btdDKOxuJPlkAGovvRqmkMyRGvwobay2EWSOliDVR9EkDIGD5oWx9T35
	 jTc04slR1WOYQJFTVEx3B5tvLTJ5qhxMmJPMTrYhKps8KF6F3pYbKg05lkszb80srAw5G
	 G21/HYjAZU8dFowUnqtFZXxW84iUWq3fO7nU5A2ZdCR6xPWCp38lu5dsNtoJMC4CvAy/Z
	 kPdkuhUwtydCo41GGHGAQdBKaLZOW1YdkCL7VykcCp3tMyF/EsQ/ywW79iXtiPTiFx3ca
	 I12SZZUj3bmm2M8Cj/GskkCcW0Iyv3w8ab+dTXOjNxBi175i7CVCTkJBkstqkCRgT/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FH2Z4Cpp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=izKeNjmg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D021A606A324
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 04:00:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D021A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FH2Z4Cpp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=izKeNjmg
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB1tEsx605571
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 04:00:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Qlr228EuIzXhz/N5k30rrxvQvI1lv73pvJh
	SOTxy21I=; b=FH2Z4Cpp50sveYA9YR0ZNB9Gwvy745VBjhwlYRsIhZikOFq5p3j
	kXU4mwGf5GNYAeauUytxS5Xny5LWwATbquA15HEW0/zGQCM7eO/gBp6A4DM8TtNu
	Ss5gRsPHJgDW3rZOtnsHGFuMOGpIrhFWIjXQRDjpxnKn1WQa6eXANUUtnyuj3Nj9
	6tm4zlinmG1GETMYf4JvDiW69iTOrq01eO4Y0KxDth1Hz7TLeez0J9hhqPWgLlZU
	WCPnxR4rn6pGKxOZJGavmH/akD4s3JZlJvYNL7oHJiJxOl/mhphp5Wy+4ZrL0h4s
	I3oeI2Ohu9i73AXnNByIYjNd77x9xEGOSLg==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdrh0pee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 04:00:44 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4fb73e868aaso3845098b6e.0
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 20:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794369644; x=1794974444; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qlr228EuIzXhz/N5k30rrxvQvI1lv73pvJhSOTxy21I=;
        b=izKeNjmgGEb+ohQD0Lo2MAj/aQnsOQBqGfHNjKP+5ahwFvmAq8ETD1AtOpQfQqZkY5
         3Ccfku4MgdWRhiqeryy3U30ZPyIcHWkE6E10kp/hy60LDsJC+W45uW3U6MPZKb3NFMGE
         TU7GYYYUWkF8slxjOWFa9MOBF5SSQgoSRzcj/nH60b96PgXijTmJwNzWYM8PsB4hisZC
         6KtNdCM+Di9U6fUFETUdxFuu0MDbvA+OM4tQfomqYUix9Y02DXSft+LOK9tHSMR3cRhq
         NGJ4cXp8wySDAs4ThKvo7+sLe7W9Oax5OYv9Hp0qYGrqjSDm3YmS8lyFmQ9R83uE68Be
         ATiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794369644; x=1794974444;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qlr228EuIzXhz/N5k30rrxvQvI1lv73pvJhSOTxy21I=;
        b=gSBotI1zKGlMy4YLrXhUei92Sw1vsr71CkJBbeqvH5T5I15N9wjcugVngL5im9CWck
         eNKus6JtMc74o5ybASsKt9Pp9WdHM2XNc5p7zyi8vNDSt677Ia9s40QCuT1Dx6h48S4e
         ukSIkgvV6P6kZ/4xARxQCyeG92/FBbM2SQLAuRVQOQbIpFlQVrpUEF5mLhIASfErznuV
         7IbjuWXwWCqcvApV7yN7KfnUPM3x79e/JNtG753BhEVluF7KSLOE0GQwVLIl17icuM74
         Rk+GizIdfPAg2oesq7OY4ksnguWvNPkEQDf0/EH2F38v8Qm1Dsj0IdZCQFR59c0A+0ki
         dNug==
X-Forwarded-Encrypted: i=1; AL+hErF8BM6lLnRp8cBAWL61vdEECLceMiWr37D/C95Vkv21aDZoN5k2P6g3ZmJJA4aqYuHPDjy1Zf7hS487@vger.kernel.org
X-Gm-Message-State: APuU4Z/jY/wOy8pMjAQcxtVfL7Poq/t2O8tjnHaVkaVsR+AHwDgd9moc
	k/8ld1TP/SoHYB84u0pYQCj3RT4w2xLrV+bMIFB7zndeSfUGiN9JwOz0eofFNfvu5/YZYjAf4E9
	CtV53BGKLxczuD1/xFaMn8DfPabpaC5u6NmBYTOQvEM3e7hs/UuB5Jms4S668/o3P
X-Gm-Gg: AYBFou0O2GHgfQSEeefWut8NPljPgiqT0Eno0rxybhpDeIGfEcGR6kNoPsCZkmMizp3
	QnULL6MyIIey3b2JlbGQNZJH5TRJbu6yOiZwG2tfGvhsXg2mhv/vrM4jSEC+ERtlo6dTWMlKtJO
	lHw5BOPBKG1+fY6nZURD+CL4T0f5HHvyAorLwVa7BEoSt2U8Lk+gWsOU1pgijc0G2ArTiIMg8yT
	mwRD2HOLNDwxecmu2LgM0FXrsVRvz8ljtk9S2TM4m9kGW+UKwrC0w1ak7Rv5bzYbtpU5dNxvW94
	juT8x4qxsRMVoIA2YtaZPeSTHI23gsEzRkcUmHQxxkqRQ3POt54l8/GmyInMqQ+e/d//XZbEwAR
	4Nl226M9bHYNbGQCuDH0DUONIibGnUWzdiHYrZC7R6+2VDuhyzsn7kEgFwx5cXJ5Z780cXMJLgY
	N2E8Rln0WLxXw8G0rnDEP7pM2KAt4ELJtH
X-Received: by 2002:a05:6808:3a0e:b0:53a:d128:4021 with SMTP id 5614622812f47-56b96bd580emr1045811b6e.15.1794369644027;
        Tue, 10 Nov 2026 20:00:44 -0800 (PST)
X-Received: by 2002:a05:6808:3a0e:b0:53a:d128:4021 with SMTP id 5614622812f47-56b96bd580emr1045783b6e.15.1794369643526;
        Tue, 10 Nov 2026 20:00:43 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-568f083d000sm4089276b6e.0.2026.11.10.20.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 20:00:42 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3 0/2] arm64: dts: qcom: nord: Add ADC-TM thermistor channels
Date: Wed, 11 Nov 2026 12:00:18 +0800
Message-ID: <20261111040021.3636059-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAxNSBTYWx0ZWRfX/TyDNK4S6xct
 zQTgAp2CdIFduLXeXP/MjMQ29rg6ioFFm+i0S28nyO+t3cYN/MlskcXVpxlXBLucZiEiJ0vRZb7
 FIUDetUTVnUuYnELV0HoSKnYwTkib1s=
X-Authority-Analysis: v=2.4 cv=PoQG/AM3 c=1 sm=1 tr=0 ts=6af3e86c cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=-jktPZProMVJZdFyxj4A:9 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-GUID: HnbjD0oAeHQbHcid_85x9oZHvPTtMjc4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAxNSBTYWx0ZWRfX9DhTi2z2ZvJh
 Z0zj2asVgPmBp+4HANOwXLGolFmtIiegs9WEgSgeQsg8UnidBwD1449E161xwSqb3QHMbQ8XNkE
 m/zJqkZacBliqIfqlc2jFN0RCYSz0YZvejXpSZMF/G72m4nIu/3KanSS9IgYlvRYUox6MA0IdmP
 I7D6sRt9VHziPvsuIhI17N3HzEUk6Cnsep72pVSv9FA8oMdNCBaNm4vQ8HB676897+ip/uHah5Q
 Q07gG9zwCVC1lP5q2WS/0Rz42hWrGqptYsxfacqkCZSxoFXmbTr7f2wTteOfPkGC1OIJUmTG5t/
 iBrQ0ljgZFNdfE+e0sQX+nh+hTxKChl5rMUQE5Kd1js4gSg3gfhE2TKqO3CqfCIZLhZVlwaSoAu
 RS2dpDo/fXIpGqSPcoougJ07bTrbVuHM0RfPuOqZC1VCf1uO/Fhd6dwqPICGsD9z4yA5qdbVMR/
 eB8mLqvY+dmz/MMoeGQ==
X-Proofpoint-ORIG-GUID: HnbjD0oAeHQbHcid_85x9oZHvPTtMjc4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110015

Add the three board thermistors wired to PMAU0102 (Kai_MV) AMUX pins on
Nord Ride and RRD: SDRAM3 (Kai E AMUX1), SDRAM1 (Kai I AMUX1)
and UFS (Kai I AMUX2).

Changes for v3:
- Rebase on next-20261110
- Drop RFC tag as the dependency is cleared
- Link to v2: https://lore.kernel.org/all/20261103135445.2049110-1-shengchao.guo@oss.qualcomm.com/

Changes for v2:
- Move thermistor channels and thermal zones from pmau0102-nord.dtsi
  to board DTS
- Keep #thermal-sensor-cells in pmau0102-nord.dtsi and set it for
  all Kai ADC instances
- Rename thermal zones to sdram3/sdram1/ufs-thermal
- Link to v1: https://lore.kernel.org/all/20261028150103.520428-1-shengchao.guo@oss.qualcomm.com/

Dhruvin Rajpura (1):
  arm64: dts: qcom: nord-ride-embedded: Add PMIC ADC thermistor channels

Shawn Guo (1):
  arm64: dts: qcom: nord-rrd: Add PMIC ADC thermistor channels

 .../boot/dts/qcom/nord-ride-embedded.dts      | 84 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/nord-rrd.dts         | 84 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/pmau0102-nord.dtsi   |  8 ++
 3 files changed, 176 insertions(+)

-- 
2.43.0

