Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794812929;
	b=PWolIpiEEZph2GX8pBW0sGqyxtEC+hnAuLr4Uw8dhSaZJy76jPaF3sNyZghnQJ2OtYK/
	 7Qo6wGIjmQnnMsVQ1TAkCKfgBuiCs3T0y+9Q1Clnv+QT/gcug3en1RA0DChVCLIjoOgtT
	 CT13O2U/nL4FBkgQsKm3xT3kbfdGJ5675U3vIxPuFdaQcltWwjVQm5ODjfWX6Z7Uk3/1h
	 RmwUvtGidPnDN3xK5vJp5sWiz4NZvkYljDxVxEvCbrqOR93JhDJ1h3TQudvzMKH57BNhP
	 pHwBeLsqGC0THzM8T5aiJAyEcWYkLyYOUWsA3RJYkY8RHxC4tM3F6LXtbAFko8+NsCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794812929;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=VsctoSyuzeDFyOLJHRFtf5FpkehAfPMSRea91fkgfbs=;
	b=5TtDoxTHWerthjlL6o9X/2LZ1jM/EqU4pPUr2WXncPSH3t5C2TV1I9ETUjkEw1uItANb
	 pljAGaFtCepKaXQ5dmgLbkEwpVmH9PGILtj1k7CKXwSbFRWw11TDExIxwkpB1H4c+zTUa
	 BmNr7C0D9rKDcscPCQ7g2YZvGe076ZaXMbIiy/mTvOEfyPLjf9oIMhxuMZcM53N7kcgZu
	 t7bYThpunaplbZwp1W5AOnC2UoXOOy7HnvI0Bx7VxbtotVDOJTyRvfxFUa14fk7IzmGuc
	 nLDtCl39jul6LWzsrQodmPahtAmEMFQH1wIMM51huwwIDquDORx86Pp8XN+MxLDJsOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UU+lkmg8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LI1lEujG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2392606A32A
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 07:08:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2392606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UU+lkmg8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LI1lEujG
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG5M5Ka3177735
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 07:08:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VsctoSyuzeDFyOLJHRFtf5
	FpkehAfPMSRea91fkgfbs=; b=UU+lkmg8mKbhrhmA1XaI+i9P9IE1ak1bAcJpyo
	ZMiNibS2UNDUIHc99dFfWj/bO8F7SYN3Zts60vd9qgevheLue2niTouNQqrDQbVd
	Z5UuSdYXbMgVx3bmioBuPqS1W/37Lf6DiCL0NJ2CUpMY+tSCnxf2dVXF1Vhs/IFN
	i1BvYS/mZO7Yu6oAsdBqHm02V5k7T+0bUmFwHGbIrgKYwaXDsJToG4OJeNXovLnl
	aSQ3URKryJvs64POzafE+87Rsd0JwrlMs8ZCF3BwibYgDZGWcb9cvOia6o4ypZnz
	9YfUxb4QqHpZD8rKa0rx85oLzCwqmKKxVzge2dSoEmcRTeDA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmcd7ev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 07:08:47 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b0e00d7cc2so2824076a91.1
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 23:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794812926; x=1795417726; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VsctoSyuzeDFyOLJHRFtf5FpkehAfPMSRea91fkgfbs=;
        b=LI1lEujGGe1Lpa6zJ0gKOLH8EsGxNBR4X7IrmAczkLxzZhEml4cDItkRbHgqhFf7Ab
         mhIZCnGnp4C4WCnauY6xATLNQXYF4wrz8KKNzOWBte7yec0eI2W2/89x42+nNYfxNxsF
         Sa9gn0N65yMiIsQNA9BN0zMrMT9tEDg2WGo7lfyYl2teRgxxM3YL52ALIJfdcjkVXPuh
         fsWAHcGddEUtgObJev6q8A8P3sQXgY7ZMYonO1RUrtaxBZhEpXhoXp1lnJ5z6CBm7Aha
         mgZQb5JzxkqI7AmooDglDJF30dsaCiZqYCsE9haetmEq74HT/tIpsICXrEa8saf2tkqF
         FXQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794812926; x=1795417726;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VsctoSyuzeDFyOLJHRFtf5FpkehAfPMSRea91fkgfbs=;
        b=PFBmu56Pj20xPYPqQodlzlfgvm9DDcQoOBvJl+wtuY7fVm5Tzbv4cNpO7ipWHGRl6G
         q94NE6VF5GR1XS+rQkJ5orhhlmTSqXhHQ6hDIWqPptzQVB4ej3ICEpURCyGbDZ7qGe/e
         7dkvSLU6OmIOFYm6Ro8YVhk0poNTTtIOFJ/Hognc4IXYPX3VqOGy9Z0Sogttx8V9D+vE
         SmrNBDLPxpBfjamvxWSx0qbmjNUe3Ieen5bX+mZWzq9VjKwSNplhWdEQFCxbX4MarU9x
         622PNmLyp6mcNzQMVymbPLG7vI1cDnsSCQqAp1B8flpKoAwaKCZD3We3AG9iDd7ZziQT
         s+TQ==
X-Forwarded-Encrypted: i=1; AL+hErHeAYeYD88BHBtrThoQWZC535ppEgr/NO61QYHb6Mfrv9NqtXkK9I5JrP9qGytlyKCuv1Ta4M7GE4Ac@vger.kernel.org
X-Gm-Message-State: APuU4Z8WIHHzY8RJYvMm0+mrnRT/2OPvnTQON09K8rke+NbNDFTIQvOJ
	ffISYB/pylrMCf8FGHOkCB5ymYY0JaOejTRWj7qtknG9C8h8COhMcQ1IRLUOItgB6doZ/W9Gniu
	OZ/s/VfWxiLMPJJAOI0t5p0ObHjn5I3l6i8Q+pmiVkNLM9cvGNvZtiBS6lof3z5pi
X-Gm-Gg: AZFdTZeulDjCvzsJilRhoC7CTYFLEbk1H3psaXDQOU8m8psDHQjeo0q3YGK7dYUu6Xb
	UW0FBNRS48R7WsuLxb5wD5UWR3un2Q3hmchWUbjg+kEdG9JrSlIVOjLd4o8nU7rwjv3dt05jG6E
	qpAv23ScUM3FMhZKMnoH+nYNIhDXJ8oZmv4wyCDhIsVnvi4BZekNU1vQzHNrBLmvZI5nOBgSea8
	tM4q4NKHlenIIjx4kD8DPjf7y3o6lUwV+MqfAgzCJfo8sHebwzMv250WoibzQ7GuJ+QSLol9mEf
	sQmVbZU40ADOXwdxCToK/1n98jfbg5dlhB/dOR7l1ncd0iDHUWU43aCaI15I3VyUFHeDJAu5lLn
	PRvEqK/jI7+xYlfjHS+w89JEpDg18EG6se+R4ob44+20x/DMGMEv6VKMojMosvWN0yIH1vBynPw
	==
X-Received: by 2002:a17:90b:2f0c:b0:3b1:8300:f48e with SMTP id 98e67ed59e1d1-3b1b0b89c42mr8804466a91.49.1794812926461;
        Sun, 15 Nov 2026 23:08:46 -0800 (PST)
X-Received: by 2002:a17:90b:2f0c:b0:3b1:8300:f48e with SMTP id 98e67ed59e1d1-3b1b0b89c42mr8804451a91.49.1794812926018;
        Sun, 15 Nov 2026 23:08:46 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b1e9ef15sm8658667a91.0.2026.11.15.23.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:08:45 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH 0/3] pwm: qcom: add Shikra PWM controller
Date: Mon, 16 Nov 2026 12:29:47 +0530
Message-Id: <20261116-pwm_qcom_shikra-v1-0-67ee4553adc5@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOOp+moC/1WN2wrCMBBEf6Xk2Ug3bdILIv6HiGziRoPW2myrg
 vjvRsUHXwbOwJx5CKYYiEWbPUSka+DQnxPALBPugOc9ybBLLFSuDAAYebl128H13ZYP4RhRoim
 0MtbjTjUirS6RfLh/jOvNlyMNUxKP31J0xIwfcZst/rzu1Lsj/8xXkLnU2jsAnUOtYNUzz4cJT
 +m+m6dYvg8tMsl3E8Y2q0u0ttHaQg66rCpEAGwMKV+gA9sUta0qX9Zi83y+AOJqPUf8AAAA
X-Change-ID: 20261116-pwm_qcom_shikra-a63526bfad29
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pwm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAyOCBTYWx0ZWRfX+mCGlh4oO6+I
 BOoKnrEeio9PjtFsQoWVmaD+u3S/y8E+ECPOzlDVOQIPhazZZr6cq/jAoL2gB9s3yjwLBMES4/M
 OUTjFlRIif9gqFChs0hcg+f/BuZzIkM=
X-Proofpoint-ORIG-GUID: 8mSabHmVtFRrSXvVYrWwDCSpXFOMAqK8
X-Proofpoint-GUID: 8mSabHmVtFRrSXvVYrWwDCSpXFOMAqK8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAyOCBTYWx0ZWRfX5o6+SPX1K4Q8
 XxIrw161T/+L3XJ9S9QVT0+k2OfcTPTawxJ0H7kXZVG8CS23zQueQcABtrguoxIctz2CMpiFxYv
 8q9pR0h7Xg1K/9nnaznioypgOb7ahRheOZ+vw4RE8WpNOjMoNXrYfCXR/fnlFk5AEErvA8liZ20
 OjPWQSrqvMJ3AHuVnj3nNm1MAUHI5QcjMvB8xaBkpCGRRKdO2akA93fMgtsazxWMCWUYes9PTWq
 bCbWSONASfGLToMlcz2uD00nuFTDrh9gOxy00K56fZD+SzKdWMktL0m5lkY7qXBhHs7lyTTt1Bj
 XIBciriq5UOmCihw81QDEGJOgZmFnm74YdyrqUxNglDBcUY9kHaaRnLuqHYEnRTfgiDUT82ygLm
 xnd+0IdcJ1PtkeNLaog3TLQIJ/NoNa92tWbQjkyTNFEgy6rtwdPNMt6cuu2UzLJ52NbCh+VDgVA
 aABRA3YDGTaHHZF2XDw==
X-Authority-Analysis: v=2.4 cv=Vpy2kO2n c=1 sm=1 tr=0 ts=6afaabff cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=T5qpfgZGmVIljgUINK8A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160028

Add support for the Pulse Width Modulation (PWM) controller found on
Qualcomm Shikra SoCs.

The controller exposes a shared output-enable register and up to ten
independently addressed PWM frame blocks, each modelled from its own
device-tree child node. The driver retains the shared AHB and PWM core
clocks while any output is active.

The series contains the device-tree binding, the driver, and the Shikra
SoC DTSI node describing the controller and its ten PWM frames.

This series depends on the GCC PWM XO512 source clock, which provides the
GCC_PWM0_XO512_CLK_SRC divider feeding the PWM core clock referenced by
the controller node:

https://lore.kernel.org/r/20261116-pwm_clocks_shikra-v1-0-55fc11501821@oss.qualcomm.com

---
Taniya Das (3):
      dt-bindings: pwm: qcom: add Shikra PWM controller
      pwm: qcom: add Shikra PWM controller support
      arm64: dts: qcom: add Shikra PWM controller

 .../devicetree/bindings/pwm/qcom,shikra-pwm.yaml   | 127 ++++
 arch/arm64/boot/dts/qcom/shikra.dtsi               |  63 ++
 drivers/pwm/Kconfig                                |  13 +
 drivers/pwm/Makefile                               |   1 +
 drivers/pwm/pwm-qcom.c                             | 685 +++++++++++++++++++++
 5 files changed, 889 insertions(+)
---
base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
change-id: 20261116-pwm_qcom_shikra-a63526bfad29
prerequisite-message-id: <20261116-pwm_clocks_shikra-v1-0-55fc11501821@oss.qualcomm.com>
prerequisite-patch-id: 25c90a2ea712aecae7404104dcc83e1c79227b6c
prerequisite-patch-id: e4b3500eec0cf6bc98edc43780b2828c28445b5c

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

