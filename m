Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF07C374E5B
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 05:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785131414; cv=none; b=VjTma1lemvBaRIVKXRSCBmKNlq3CgS0jDjeWlg7kaPBgYBgiiMIFC49dwlhe4MVjrqS7Z4JeFHOTBQY4OQQUGw3aHvFIF0kHrnGlyPgfnpyu20KqUV/7lMpy2Bv5w+pkh6G54Z4ljV62qATAH6OWxaKXXrVA2XMvaG27RdbbNEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785131414; c=relaxed/simple;
	bh=DI7uquLPZfrzyLlmWn0qBbixBjxqqAUijuXsxGR4sbE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WkZb0kmgeNhzzGB5oTR6RsX5P9l6idCjsL8in8MWg6IgUM9MAsgFKerAtoay+mFyCSn4ttQ+lR4cV5dLokUPXboa1REC/lLqRTsJe/6EZ+Tr+mPJx/z2Fniw4hsF7P/8BmYlPQslzhJ0wogFtE21AAgZqFlqZhFwu42iiXtxnCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PSqIjbI6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UedlcmeR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PSqIjbI6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UedlcmeR"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R1g3RY2467067
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 05:50:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DsLW2ScIO3HpYUASwYwisH
	IZJtfA6zMzHxtwObJo5JQ=; b=PSqIjbI6pGJ+fW0Dwa45kFa+a42UJTmICiqUhA
	3Fcy1xohtMwLSsnJmdces4hXMUAYYAXy5uz77b814gZwtpiE2GnbrS2n5bxX78u+
	9ZkwkkcbTOvGdkk15O6XOZaLbws5sxzeRmawLeLT8PU0SHhPLXi4j/T2yHTBBrfS
	gFy02uCGwf01ij4WVc0P0v6VdfX4h80A4ccMRZHrELgMSd7EuOZ56qZS0/HdE5IP
	4RDV1X4WYnVC1xO/vnDK/ZZ+JPdCyKLKFnAWSPm+Q8De7yp3MONznkUcjzsi+jez
	oIFj6J0XhBzCjxdzCcHgPkXIkZOukDCC1QZmx7LUJBTjY/ng==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmm574vaw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 05:50:11 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38f5ac7416eso273868a91.3
        for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 22:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785131411; x=1785736211; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DsLW2ScIO3HpYUASwYwisHIZJtfA6zMzHxtwObJo5JQ=;
        b=UedlcmeRCvW+oPOdM0a7wi3uGo3vE/txzYNsTWcMSlL0cXIKrHkYT2wCcHVlokfv6s
         2jy0HDPnWZIl08rQF17gQoP1cmf/jWRehyUp/1e/muXBnhMScJ/dGh5mVCsIBA1Ld7yb
         +upUGjSEYW5hokId40zP5psy4s3J4Y43yWMhmQoxekJnOiGAAbiOw+tI6KpBWfPTy82n
         4RwXg+U+WBccED+LdQ4g05MEtWpSGrPXEzVBlmKuSXv2DAqCyFV11Eda98CuzTIms9Gp
         X1ZMh3wgwPZ5MrThvTi9Y5OBvKLeKRl1gadtPwhMnagT6svEtDI8u1YyToo3AUhcAJN2
         EMuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785131411; x=1785736211;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DsLW2ScIO3HpYUASwYwisHIZJtfA6zMzHxtwObJo5JQ=;
        b=rqMuINv/02BH/BlGsznQCYY8qTeRFh0DPiyK2yH/ImSkbTtI8AvL8w8H44kdRoja9b
         +y8ClePe28Q3Pcqv6kxwgylYI9xDj22Xud0+tuzu7tEQKlNzasTZT/ljT4aBJRNF7DBa
         S/SVXMeft8zsgkH+gdh+txdKmqQOt0ldsZoQhotshFYGuWfkAK+FzfFP/5HeoOvMe7qj
         JpvzEpE0Z4anflC/R+KiGXhyfK09qMw/W/XvA0JH5LSl1Bl2QhNuS2sMO8m/u190eFdm
         mljmyAWN7q6yDj6Q/SZgm8YdxUPoE87IgwKo19bKvr/MPIVg5hUsrbuA+kJsaZqswjtc
         psTg==
X-Forwarded-Encrypted: i=1; AHgh+RouoMiXW8CuzlMa2Es4K8QvrYYhOi0p1VqM5VlvYPnd/mtipUW6DYqlnPJnAhzNImhmxu4/C8lGISJE@vger.kernel.org
X-Gm-Message-State: AOJu0YxhR1fpuHz61tzNKoARmxEbda5iPjvjzKrYK7ZSePZ7iX+XsLLh
	LChy/RsVmpRZ2V8rZb+DktvrUOFaLsgKbyDcg+2otTkrNnUOoYQY+U9d2UZSSyuoPjalNDH9/cG
	sZ7Oc/nZas2mhw126zGYOxECQ2a6J+G7kc3G9hJ9ZnfJbP4elX7HOC5Zn3e1SyQBf
X-Gm-Gg: AR+sD121iG2M6iqGuqOIst2T4NQekT+zkic4Wf3VHmKbmfXepKBOYK/cVQtc6xpYosq
	dfXD3/W26EwkK0do7gA0LawVV88sxyMknMHO2u5CCllbj3vR5O57d0G6ISoruLvRFfWJ17UvFYw
	8vtRv9FP8UbFv+MEVFdJs8MzFCKCtevCLxxWD131VoKz0DkSuyXmDZfHanBe3V34KAF3dXPWsBS
	q8jugK8tk9mcdueuamSBrE+alLnBRzWw3he1hQy+9CqzytSOLLO5bVyFzA04ZzyMsfCPMMgzZ4L
	2LWDgeRifMzILW9U74LuZ5M2K2u66aNBDxUYiscw4CdlPSmHJNCZi7O9S4LA0FATjhfxaQp0fSt
	U20zvUOP17ZrVltd5Ticlz0a4/oBYKDIGkT4m5sQyYANjX88b7A==
X-Received: by 2002:a17:90b:5347:b0:387:e0db:bc34 with SMTP id 98e67ed59e1d1-38f298b386cmr6564373a91.42.1785131410745;
        Sun, 26 Jul 2026 22:50:10 -0700 (PDT)
X-Received: by 2002:a17:90b:5347:b0:387:e0db:bc34 with SMTP id 98e67ed59e1d1-38f298b386cmr6564335a91.42.1785131410250;
        Sun, 26 Jul 2026 22:50:10 -0700 (PDT)
Received: from hu-doz-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc549cacsm27934761eec.16.2026.07.26.22.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 22:50:09 -0700 (PDT)
From: Dongfang Zhao <dongfang.zhao@oss.qualcomm.com>
Subject: [PATCH 0/2] clk: qcom: Add GPUCC and GXCLK support for Hawi
Date: Sun, 26 Jul 2026 22:49:52 -0700
Message-Id: <20260726-gpucc-hawi-v1-0-224e7884cf9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIDxZmoC/x3MTQqAIBBA4avErBOs0KKrRIuYRp2NhfZLePes5
 bd474FIgSlCXzwQ6ODIi8+oygLQTd6S4Dkballr2Uol7LojCjedLDpsFFVNp7VByMEayPD1z4Y
 x23HclnB/75TSC/5zan9rAAAA
X-Change-ID: 20260705-gpucc-hawi-8c35e13866fc
To: sboyd@kernel.org, andersson@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robh@kernel.org, mturquette@baylibre.com
Cc: mike.tipton@oss.qualcomm.com, linux-clk@vger.kernel.org,
        konrad.dybcio@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        taniya.das@oss.qualcomm.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785131393; l=1260;
 i=dongfang.zhao@oss.qualcomm.com; s=20260706; h=from:subject:message-id;
 bh=DI7uquLPZfrzyLlmWn0qBbixBjxqqAUijuXsxGR4sbE=;
 b=SZivjTNAzXEcQE4VuJtqU6VaKkaDtSIc9IkNNLwn0voLKuYCve6bhnr8h5KfTJYQZylJuubih
 txLMWe3tMPwBUz6abqcRFT88RPgiFKV3heumKM+IfutPhEsca4ttU+6
X-Developer-Key: i=dongfang.zhao@oss.qualcomm.com; a=ed25519;
 pk=oRbMthG8BHvTvcxks87U5rUBoZiRXWKs6KZR6lV5C64=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA1NSBTYWx0ZWRfX4/uiIJIAFyJb
 xgpoq+n0BsewAZKb98Vcxh9Q534wdpJHHgs7uy1ekJ0Sz37idW0YICoYk9vntJR4t/vXIO0B0Lp
 Evd5lzAx8u2V4Rq+PrPs6OS94lyqvMs=
X-Proofpoint-GUID: roNMc7EZX1iqftSrHZ5gLWK3N39bQL4A
X-Authority-Analysis: v=2.4 cv=FOErAeos c=1 sm=1 tr=0 ts=6a66f193 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=LjwRoHMMlgVm7myvQdUA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: roNMc7EZX1iqftSrHZ5gLWK3N39bQL4A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA1NSBTYWx0ZWRfX9g2UaeYYQguT
 MK/ORtWgTNnJ6Socb7aY50jvcDoDt8JY394TE8capSqSID9ahcL727FnOfQi8WRbFvoPRFJahSL
 PYdfFfTjH2pmHPtSH9FvQZFxmIISkIqsWZbi2eGawB6OtVypTzDbTyw5nuF0viQF9wuvjmjDbh5
 qvkoo7UOvi4EWtU7eEoQpE5o76Rsnug+z6KwWcFIQGR6nZCtrReglGhGq4FuCtKhUEadrAI0aEy
 xEpWzZoE/pidYbQbQfhSfAsgRd0rKZaFIvAjgtXNapR0CyW/reqQ5YFXlhAp/35DvjfhIO0yUG5
 DlBdTMsGUfpPT87hjdb7ziyvCTFoLf+r+b90x1Z93jORCeMn1PaIWhvYcIBd8ONlkpIj+MeNnRK
 JeiVsldcT7cLZoLgarqOvSh83oLbz6RnsM88L4B4JoNtnMQ5xXO+cG8V1Xkbn7q9g270HOAdVwt
 eihyxPBPM81iUUQQbPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270055

Add GPU clock controller (GPUCC) and GX clock controller (GXCLKCTL)
support for the Qualcomm Hawi SoC.

The GPUCC provides clocks, resets and power domains for the GPU
subsystem. The GXCLKCTL manages only the GX GDSC; remaining resources
are handled by firmware. Hawi's GX clock controller reuses the existing
gxclkctl-kaanapali driver via a fallback compatible
("qcom,hawi-gxclkctl", "qcom,kaanapali-gxclkctl"), so no driver change
is needed unless Hawi-specific behaviour is required later.

---
Dongfang Zhao (2):
      dt-bindings: clock: qcom: Add Hawi GPU clock controllers
      clk: qcom: Add support for Hawi GPUCC

 .../devicetree/bindings/clock/qcom,hawi-gpucc.yaml |  78 ++++
 .../bindings/clock/qcom,kaanapali-gxclkctl.yaml    |  22 +-
 drivers/clk/qcom/Kconfig                           |  12 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/gpucc-hawi.c                      | 461 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,hawi-gpucc.h        |  47 +++
 6 files changed, 613 insertions(+), 8 deletions(-)
---
base-commit: 8cdeaa50eae8dad34885515f62559ee83e7e8dda
change-id: 20260705-gpucc-hawi-8c35e13866fc

Best regards,
-- 
Dongfang Zhao <dongfang.zhao@oss.qualcomm.com>

