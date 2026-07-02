Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B4F331EB9
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 17:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783012169; cv=none; b=Be93qNNaZQlTF+r4QtVw36GArvNc8YaVGOCssYYytxFU98Dpy7oP2sktYIkLPC/IM3a6y3xNVwzKA9keIMQvO6McFKeP25qumWaFGGfo8eEPPu8f+4znka1DmUPbdwpIhKzb8SYQMThx4Jny4Qb2thLXpj95VZdFgDn7i7cA0nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783012169; c=relaxed/simple;
	bh=u79lhT1lMVctCBRknaRHjj4cM7lR/xKEJk/uC5skegE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Y+9h5jyAMhfGSb/MaCTQiwIykEUmVSpMOP8GnUtZOlRHN2mslOlLiPOHjG1Yh86dKVbmUZ/eMdkE3mdrIrRjeC0AJdsJk5Bz6RQ5z/aDNXXWSP1kpfibcEAYORY9A32j4W5ifY3SDVJMG2xo483AOHz8H6Nn8NuTWUCJuB3bEkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fm+8SKgW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LO3iObp5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fm+8SKgW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LO3iObp5"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662E3M1q548955
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 17:09:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=E+tfsQg4XuWFCHdwZ0VNEb
	dCPvzW0k/M5Unmvuik7v0=; b=fm+8SKgWCh+y7CDJMa8kKmajoAkWlPfLj/xRip
	poLsmF6eWM22LAJQAhhwVtTC0XWOUAEp0AhHxPElDtuxPn+H9bRs/f9sYmWH9mfd
	nP9jLpGo5sx2OvbPku93o+ANJDhpOlplYdwLIHGTFqgx2YVP6xwf7Sd1QOX2m7te
	oq4z0BPwTxceEn2Ii98ZiKWAiE4/OvZEgSoe3fuBN2/ibxU6I4qOsP7pUngPV5CG
	gSAYVde80IAY5JPbuDkwM9nPeGLyMlAPQScislq98e7mE5ed0uw3NSAKy3af38V7
	mKGP9AqqXl4j/wQfnoPjGrfeThR7SNO5tqGqc9+rpMf18eZg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5h98jwt0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 17:09:25 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3809cc5dcccso460884a91.0
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 10:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783012165; x=1783616965; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=E+tfsQg4XuWFCHdwZ0VNEbdCPvzW0k/M5Unmvuik7v0=;
        b=LO3iObp5YJdfMsCmndy3rndoqpl+YqY6cvoUP2r5g8ywgjKrJs/psNCbrbOzEvRWRV
         2Gw8WSgppd1FiBKIbGYhJOjwedGcamGPHztqGEisgNN8CSyWObh4WduwjhHK/7e3uKGA
         xJBqOs8zfh3rgPlQie0v7X3xvkCDfG6xra7Pg8Jo1CUFwXwYgcm/6aSy0lnJmDWbwEW5
         V76IpMLDHYZGp+TftYZSZxA8ZstG2aQ+PL0blNavBuxJmN0eenahG8y5q++U/OJdwE5P
         u+2HRSb2mDQ5WrDIWiWlZuzjfwF+oJ187RHbJYNuoCu3geZ4xqvR5nNpSB5Iw7X47l60
         QPPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783012165; x=1783616965;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=E+tfsQg4XuWFCHdwZ0VNEbdCPvzW0k/M5Unmvuik7v0=;
        b=Mtw550Y38URNXHl19q8iGo3uvSCEVaECjOdrESs+DIooIqXkaTyIv72vSi0Vh2gzab
         EqzM5X1vMW1K3GlwqRGRqgojLo9JlSmMruBNSJLmqAUZhNXP5HkQxcpfMAoCOEI7d2ba
         5kNgTEyzINXGsb2CCHa9aqb6e3HFf+m478qKDbC+tYvSBdxLwtbd0c7vGsUHyhHANNOs
         Kyew5C7L7v8SJMF515qsSvx3B/8yqkQoqjg0L2Xy0pByxpnFuQe13BA3GsnmqbKss981
         SVY1RMlzmpkeuKQ2j+u6fDbM8CMhfCFa1rbbjqTOHI6HSDx1tWy6o5fEkGXT9WAtEjUY
         kW5Q==
X-Forwarded-Encrypted: i=1; AHgh+Rqp+uN0izuu4sddfLvL4aXtZsqCdI/1wHXPzyBEwpXbw6G56psZT0IDMA0tl2Y5ozTgHUjbBbRAIZUL@vger.kernel.org
X-Gm-Message-State: AOJu0YzBPyu2zKakifRT/iQd10fKQLdxopZZipPSIBLGda169LqG3O8z
	jy15aSafIIfYNxjC0j+O0w2pKwIpKWcMtDXLZim/+FdD0Nvv79piLrj8ZIHrqJURQb7IadjCXOj
	zM0t/nHLsZGINufumJOKjnPijcaZtP7JWgqq+l94DBLdg+I4xSR1e9wdV4lTYwg4x
X-Gm-Gg: AfdE7cnq2IZbKAACKajkwvICkRjEa70NwvUyDE7YW2Liht4ZXf8YPucfdnqyLsq4LB6
	w6xvb1agH+Uuk2+Q8bD57AMjntCoT/J5rHUd8D5npl4yboDgCSSLrOnjT5lPVF2h2h93GOIH9K0
	UzVdCDJLrix95I8laU7xODrYWSJPeMASJ2di8NqokfxL8Zkf6VQXgKVdy7YcXYSdKhFSfMPq+CJ
	ZrdNT1h16A0v68i5IJ+7LhGuemziUeIkPzK/RIvvGb8w2nrsURcVw6FePKXObnBVCyY6KW2EKDu
	u51vGQR1SBhPeYJud+AoABSmg8mMjUhhMW8QTeiB2bC1QZP3WL/zgPPyeEemrp1oII9sfu+nTnW
	b2dxG8flumfYl+Oh/vXuCoMXDBDooU8lT637U/iRcOZiMANvHKrd2+13ud90=
X-Received: by 2002:a17:90b:5827:b0:36a:5438:cff4 with SMTP id 98e67ed59e1d1-380aa23f18emr5132452a91.6.1783012164664;
        Thu, 02 Jul 2026 10:09:24 -0700 (PDT)
X-Received: by 2002:a17:90b:5827:b0:36a:5438:cff4 with SMTP id 98e67ed59e1d1-380aa23f18emr5132422a91.6.1783012164203;
        Thu, 02 Jul 2026 10:09:24 -0700 (PDT)
Received: from hu-linzl-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bb80f5csm16505031eec.15.2026.07.02.10.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 10:09:23 -0700 (PDT)
From: Lin Li <zhuolin.li@oss.qualcomm.com>
Subject: [PATCH 0/2] clk: qcom: Add video clock controller support for Hawi
Date: Thu, 02 Jul 2026 10:08:06 -0700
Message-Id: <20260702-hawi-videocc-v1-0-6c1e640b0954@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPaaRmoC/yXMSw5AMBSF4a3IHWuiTarYihj0cXENkJaSiL0rh
 t9Jzn9BQE8YoMku8Bgp0DIn8DwDO+p5QEYuGUQhykLyio36IBbJ4WItq9MqnVGouIB0WT32dH6
 5tvsddjOh3d4G3PcDiQ4IPnAAAAA=
X-Change-ID: 20260518-hawi-videocc-90265db7e712
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lin Li <zhuolin.li@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783012163; l=841;
 i=zhuolin.li@oss.qualcomm.com; s=20260512; h=from:subject:message-id;
 bh=u79lhT1lMVctCBRknaRHjj4cM7lR/xKEJk/uC5skegE=;
 b=9V6b9oWSTx6kZeIpsgNN2N6YOY+vtGSyJaUmccYW12S6J4ZVKtTKtqTthLcRO5jR5xCnUVOA3
 OQ5SLsW6OgZAY8vwpzBKTTl9UOR/ND7tCt0csroYa8VKpFnT5jsjdSN
X-Developer-Key: i=zhuolin.li@oss.qualcomm.com; a=ed25519;
 pk=MHXg6mCJoooUzb0vMzMIbkL59skKuD2BVgAX/XneLrU=
X-Proofpoint-ORIG-GUID: eGPbyR3-gJpqxLh9-iSoSVkkpaf-yDFR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE4MCBTYWx0ZWRfX5L8B18y+hIVk
 ZL/01tYqGt3EnBMbGOOtu+fkXS1VORFJljz4gDBwEJc3vlId/XOwlJJgqD7rA6gdzIhVkGyBh+w
 V6CqjiIu18DPSNqzuSfVLqLLpD/98aamXpkA3gGE4hmhFBrhj+2utMvSs1M0v8w5vQ/7tYpIk3E
 pWiVK0CldKjDbxVOlEv3nenmpjI340b7UmK8EmkHt+75VkdA/enUXf23BBlzTq/zo4UnY+Wfift
 KTAt/qwm9HYvGVPDenMTnm5BWvljGq88q/0gp1c7tA83/L1bmVht0Fs1BB7kDSHyxK322OlBD4x
 OWqzu+/FwTy7Ox2kB19qXa9qMnscIEyEQRcIN/2E3OggFT6M8xMPaR6Uo15LQ7AaBBAx0MEZP7i
 OlaviA5MZIxkGiq8XbXYxZmuiVMbN4V0txDYBKlIGSw/n+xvQgSBBb3EkiPJ7ha7NOGXofQkg+f
 SLwwwjM+o4bzVfMmNUA==
X-Proofpoint-GUID: eGPbyR3-gJpqxLh9-iSoSVkkpaf-yDFR
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE4MCBTYWx0ZWRfX6u+xBaR1HSnC
 HhviZERh/5xbPTiZrm7T4sN2i0VuYL5Ji8evPilmzP1MH6bK4M9Q3rOKkCd0fxTIY4uRLhPYIw5
 NcTb4CelkX6uBu8CMKZnnWzlg/pMcUw=
X-Authority-Analysis: v=2.4 cv=bdFbluPB c=1 sm=1 tr=0 ts=6a469b45 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=mUcvQ3vS3PEDK6hVkjoA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1011 lowpriorityscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020180

This series adds support for the video clock controller (videocc)
required by the upcoming Qualcomm Hawi SoC.

Signed-off-by: Lin Li <zhuolin.li@oss.qualcomm.com>
---
Lin Li (2):
      dt-bindings: clock: qcom: Add Hawi video clock controller
      clk: qcom: Add support for VideoCC driver for Hawi

 .../bindings/clock/qcom,sm8450-videocc.yaml        |   3 +
 drivers/clk/qcom/Kconfig                           |   9 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/videocc-hawi.c                    | 840 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,hawi-videocc.h      |  64 ++
 5 files changed, 917 insertions(+)
---
base-commit: 4f441960e691d37c880d2cc004de06bb5b6bd5e4
change-id: 20260518-hawi-videocc-90265db7e712

Best regards,
--  
Lin Li <zhuolin.li@oss.qualcomm.com>

