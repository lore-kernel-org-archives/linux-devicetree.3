Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793714125;
	b=HUa1lgP3PxKkufUiFAHBlM7suhtJWVfzTuEJFsOsTh6IRN22RJk2KFiGMd++XiUCuU+D
	 hBQ77UzGnln8qZI8Sz764iCG19fSJZwU8V60kYm8lWPbemcUOZl0qzL1qz+fB1daz7nHU
	 PJOjR6ClGj6COXVw2NjPPRSgWzggfXdzgI+Df/GQGCgpHGRREOc5/78m1zPmzx7r7OKO2
	 k1lbIaS+r1j0prky298q2ruIIWstGYxIONYMbt7eySjjtmL0/RtNVP0TRo9Q3nKE6luTN
	 vkrhDbUlfpfdKKr2YkbFsay7dmtb8C+R8Vhr1O01VldWw8FTtNlx3RtI1nG8MVX3e2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714125;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PgRBsYalY5lDh4FatExTN9A5QD/wv/3vfmiJFWyWNTk=;
	b=A8xKY5ECzQy7DpKXruY3LyjCUMJqj/pQy7BiSftBeLucM+CjMUYOJpPcLaAYsOmxJHi8
	 /47DZc4Rg7dACy2J9Ak3bTsC/f3ZhcdbPICG1ArJbhCYLHkbeZ8fR0dnaHZ48IMgUa3cu
	 KmLI0URLMAPye4t0ULo+bB2KUu29cFomg5diYySKnVccTIwYu9nBynKBhhFRN9LMvepnK
	 M49SuHZIb2CoYUGLDXfE//cs/w1BbUE4QQb7JonEd975DMfewihNMitaJR5temwRen3gX
	 Hs0wrOd6oA78U8YOUGn8ozu7GeTTC1V0rKsFVhrab3S7lnl16Gef8K4UPskp8K49ODQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W6P8ZjL5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eLrP5vbU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828CE606A327
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 13:55:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 828CE606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W6P8ZjL5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eLrP5vbU
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3DZCiC2651186
	for <devicetree@vger.kernel.org>; Tue, 3 Nov 2026 13:55:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=PgRBsYalY5lDh4FatExTN9A5QD/wv/3vfmi
	JFWyWNTk=; b=W6P8ZjL56dLuoHFh3Ml2rKdlVb36Cr4xSmlCm0HJIRQUAs5rS57
	rPBDXmZYnyru8FoLyxdivouQY2j+1qcw7VR6gjJ1dTu+H7L2iXICrRRKZFGrj4XA
	GgE3InhaNMDxq7MhetwA1e+wpuwgHK/SoFWDzO4nqq5iroU3TPv/s447eMBgVRn3
	ul1ZazQslK2cbUSgMb9A9zhivuPvjkCxvQqW/3aOL+8HkfhTqaY5BKYSNPQqjvuh
	U0VDkZLkzTxpQZ+uggn5Eh3WnhJwC/Uh4+jjbQ042LIPRtuf2zIxh2wKPcfqQhFQ
	J1hVpnoqx4CU+k33UYkhaYUsTPs/7jypmlw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq07r41kf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 13:55:23 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1a5005fd0f8so3927329c88.0
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 05:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793714122; x=1794318922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PgRBsYalY5lDh4FatExTN9A5QD/wv/3vfmiJFWyWNTk=;
        b=eLrP5vbUsIRkVG63I5BI6kp+XA+SCLu2tAsm8rKDy5vK+A8W9sUe88ROF5MxE+28Ny
         aHlnZ6oqX02YZHkY8NsPzvyZgky0eQLcSan7gJFlz5pW8mVg94CCRnz8vkJP+YhqMlqb
         G8IpYHjXz1Et5/FE2t0YttpAOF9z9a7a2bT8D+08rwYlLkiSWr0HJGVG7nD/0xeIXFWE
         53QvotbahxkGiDpM/D7mqUxfqRQkMa5eA4ydsfTKWGb54Xfaoika6ZzQLj0Ffe5xsvqD
         5jlQbAAFjGGrVv1ZqVRJhbS0iIsN+rM8/2b0A+sdCmmPudR07THJ4EheBVy7U1hHrW8J
         jV4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793714122; x=1794318922;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PgRBsYalY5lDh4FatExTN9A5QD/wv/3vfmiJFWyWNTk=;
        b=m21bIe2/CO4m3mztVy1qnU2GIIYbnsxXUWOyQeqt5JMC4vX73gJKahHBm7YnVpjM5F
         UJ55Q3dOqDidG23pB0eYdUj24DFd4TRH/yF1mF6BEZ7jC0ue/fgb3GEhXtrOTNNzzWqu
         +QjGUeXv+/W3ubty3ZI8nAnXdkVIqU6aTT7meXcQLmOFgTdR7iKTkIm/1wejyJokOz1A
         3FK66MjJEQBuOW3VfVdmM7mj9xUCSagN4uz57cNCSY2A1f2+16GyDBngcJGnS8t2rbms
         cVoV0KRqH+5a+cd5x5I6ypjuN109QEgm6Da7F2bSP0ZXgBmAIM4atQ7/An+9XsQfjJNT
         oo1Q==
X-Forwarded-Encrypted: i=1; AKwUvBz9o8P5fSxdcil8i/fSo8WoSrtQEzBzcQC3dQHIYq7HYcajhGV+DNp7ZsodZ+5ceFaXSywDHvTsFoD9@vger.kernel.org
X-Gm-Message-State: APuU4Z/P2UB3BCqZgorbw7VGa6tOMQevn+xxNsoT+59iZZKlxQvr+lXH
	AIDAT6B5t9f4HKkbw39ek3x4tKfbEn5UMPYtVQHd1ozOKUzKizGYINrYbSho0t5AoTUDYgzXP/c
	GKTbWkXVrIFGKvEAssplwG57pNU4oABYvofEGTkUgKZrlhV1OmDUaKAaobZaobPC9
X-Gm-Gg: AYBFou3faGgiDpNr47NQC6HgNzgBM+PKwd6Ebg5XPAPNg+5Fl8pxMsEPQmAozF0H7f2
	xUJkc2pPUUDwbOZTCzH2FO0Qt08vxpMbGu0AhnsiF2dcSkQjyXsY6WAjYUHGMLLOE7bBqcbJRJb
	tNYokysE3CD1ptwU0KabLEzYC3ge4nH/MdiRtSB6KzCIhHCTx33yv21L2XgzQbm3FnUY0qn7iz6
	8RALRS/E3Cc5gONTPdrRIJ6xZnF+qSU2m+OtWxS5YMcyP0LTjThfunNYvkuWKR5f9DZb0BJK0X0
	Iy2bAYTDx+eDapx1yOi/HZbkSCOX+nF4dDMc0k8XOEVpLsWgNV6A379eW2y/MrPwyAC9+4nooW1
	axe8gsIHc6X+JAKJ6oY+Swxfgd4ktMgCvgx08EyxEX1G2mpmlFwS2NJ3iwqDoUBYwCTyMrPH05o
	fRg1BEbtpToTG0x5H6fl8Mod5BCRi63wMx
X-Received: by 2002:a05:7022:eb42:20b0:186:4a57:94e5 with SMTP id a92af1059eb24-1ac5c272744mr20880096c88.34.1793714122256;
        Tue, 03 Nov 2026 05:55:22 -0800 (PST)
X-Received: by 2002:a05:7022:eb42:20b0:186:4a57:94e5 with SMTP id a92af1059eb24-1ac5c272744mr20880034c88.34.1793714121441;
        Tue, 03 Nov 2026 05:55:21 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1a9e2ed3sm41634001c88.19.2026.11.03.05.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:55:21 -0800 (PST)
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
Subject: [PATCH RFC v2 0/2] arm64: dts: qcom: nord: Add ADC-TM thermistor channels
Date: Tue,  3 Nov 2026 21:54:43 +0800
Message-ID: <20261103135445.2049110-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: N8VxBkJDQlnNgZLeVvh2cFKsuZurWiOC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1NSBTYWx0ZWRfXwBY3430FmavS
 ZfJprABwfGwVZscALsUvnN4PH4IssoaV74befN7nroXkT+0Z3ApzsdJMVasb2HR5cPaiiQF86kI
 79ZbUzxhRQ6sPhW5AqWmKW/uLXbHgu+b9VXYTTbJ5+sUgGCSG/NNJxy3k6T1Ujp19NHbWGo/U6M
 bTjTFUoMmZ3Mof0VE811Kh6SIPbD6FKM2JtBit6oyEOUCt7bwE+MzoZeH2MDSUFgJWf37wr9BK/
 dUbsI+Ho7Oaq78nPPVia1qZLBPe7E99ILoRxWoohtu7dVvKQzgLNXg8LjKwsPrd36K5155GxF7X
 mTZl0YHimKGbb8MLh6Wim3dthblgwN9bcM+/NKC3hxNMhF/qQ85yF0v/yMtzGwY11W7UwkuvSxV
 hvws5YY1+W24B7LemhsbQpE3OBcbsd21LLxhqOeKNzX5UlV/tzBcLAMve5fny6TmRY8Hg0gLZJO
 jF09CMsTi8dYRRC7aEg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1NSBTYWx0ZWRfX5HyA37z3zXIq
 wMFshZQLDaaijRHQOJATjad17xrDMmv5beonRyQKTpSqau/gFpPfMcRVvjmv2I5eJYp+KZgarHR
 YWUdpVExVqJH45YgOL0QQBWApCyVPdE=
X-Proofpoint-GUID: N8VxBkJDQlnNgZLeVvh2cFKsuZurWiOC
X-Authority-Analysis: v=2.4 cv=NZlzRGD4 c=1 sm=1 tr=0 ts=6ae9e7cb cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=-jktPZProMVJZdFyxj4A:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030055

Add the three board thermistors wired to PMAU0102 (Kai_MV) AMUX pins on
Nord Ride and RRD: SDRAM3 (Kai E AMUX1), SDRAM1 (Kai I AMUX1)
and UFS (Kai I AMUX2).

Dependencies:
- [PATCH v5 0/7] arm64: dts: qcom: nord: Add remoteproc and PMIC support
  https://lore.kernel.org/all/20261014063953.549379-1-shengchao.guo@oss.qualcomm.com/

Changes for v2:
- Move thermistor channels and thermal zones from pmau0102-nord.dtsi
  to board DTS
- Keep #thermal-sensor-cells in pmau0102-nord.dtsi and set it for
  all Kai ADC instances
- Rename thermal zones to sdram3/sdram1/ufs-thermal
- Link to v1: https://lore.kernel.org/all/20261028150103.520428-1-shengchao.guo@oss.qualcomm.com

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

