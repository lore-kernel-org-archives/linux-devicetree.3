Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7E1448CF2
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 12:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784031862; cv=none; b=KGwzib2TpiEH5yuQ0VQhzK0/t8Nx+dh9jugfHYabv0k80ZFwpDsxk78Yr1td71P5m1OmF//RQp5XF5KWr51UnzjbZT/4v6+iq2aPow6WKsQz2KIcXuFFcP+YrYf88Qerzj4t42LvFbSM3CSqrACR4xp3GLiyEcprZOT3McoMhe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784031862; c=relaxed/simple;
	bh=a0iJXpiPVpNb5jp2bwdcRkK/t1vDreQyJ7PZL1jDvkY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fZu9Ovm6LFVcWzVLkL6vVf/2uARkCnNmMSaXD1UsQIUtAqDH85afG6NlT1pJCZpH0el+sdXhlE4H1XvADoTTXnt+C2kYILdIYTZYB+HpLyCxiKvbSEqIPIKkK6W3KOcYlG2h18scTnFeIsskwtCMn2qZ6v9JYY1VBTvtWSdQPnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m8TWXM7f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ha/Wxe8o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m8TWXM7f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ha/Wxe8o"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EBO2I5438998
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 12:24:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VO/pEhXd5lR+VCcrF6A+ZH
	NsGAyCTWVhy3fTRz5lAc8=; b=m8TWXM7fnjGOsvwSL/uYXiN50NA+KJwc+3Kq9o
	4qrdub49oRLGY0NZkdveDAhJRkdm3gOE2VmFUVBRmq4Ue0PlCWdrWIUSYGJjxLu0
	2R+r4f9vRgVNw1GXyroZn3SZ3N6/hTEAbV1Ox8RXL34O0iWi8wUxIFXC7ijnB/zj
	K1w7BnutQYW/ISIwhRxO1Dxxs/ieF9KM/pyUKT202vQeXyZr+2Oh6a1QCEvGqLQA
	SZrK6A6TXC9s99L3fFpTjzV2lKSdqt33IpSF7l2x9EVESaL2AzPSZn8am6HE7/Ox
	MFHHhGKRp/5jr/4q90H6yyxIfFO/zVF7rcofpS1+/W8tF61g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdgudh11y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 12:24:13 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51a87ef9713so8399701cf.1
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 05:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784031853; x=1784636653; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VO/pEhXd5lR+VCcrF6A+ZHNsGAyCTWVhy3fTRz5lAc8=;
        b=Ha/Wxe8oEOdKzC1LN0Sr6jg36Sz/b/scFC1yI/XZGRb3KfzRHzkQOe0Y3fyEotGwCu
         ESZbb2L8g0ZHnzrFcCT38fFMiy8P557o8VQSswrJViY2eLCrEIHuqvRXmDMzNh+FLZOl
         OnzDEvIy2RzMX3E54Zet2u1oK9b1FxOb1Aa7zu1FeGccPvaxdxHbPimZryF2wfPGhHPU
         0I5Wi1yJ+1jj7jCygcd+BXwK+EDVEe6WjNRq9yX4yv37cSmrDcK3wmYbJgtXRTXjTVG8
         cYVviST2bTXnl2J0aAWGDs8/6QRGpPrekdsSrQnbVBiMfi61F/h/YcP9VycC+nf9Zxvx
         DOoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784031853; x=1784636653;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VO/pEhXd5lR+VCcrF6A+ZHNsGAyCTWVhy3fTRz5lAc8=;
        b=M7PY+uM1p8xFANyYpubbmTLXmXXLb3Lvarufiuv5rMsDzGleQdYAdz1tP4l5BGgBRs
         IkI8aR4TKuFMrONPxzHsM5A2CeDn6uMzWm6UNkgrOeNP+FRGMvYG6fQuElONtLdwgMCj
         VKQOHMe/4WBlHMh0mhXhEv98qdRzbgiaVnnSVtCiOkLGJnr0gLGiMTNh6iwvl5g17eVE
         IhxChAE4AnO7ardULuw7TcImngXoZi2dBeTRYnNxx8d4usmvmlIB7socFrsHAHbPqVjU
         LnRzLWtco23P+gr+j3N8SJ8P6zVJdiGUlJEzJc8Xvw+O0MHxy6WQdae6HdODIqpfF50k
         bPSA==
X-Forwarded-Encrypted: i=1; AHgh+RoWlKgGLMNWbFb+f70k2ZwVk/1f3SOxL/BUBBcBm942qh2YMsy6RqXIUmmeJP/UV2Bep29wWIW6IucW@vger.kernel.org
X-Gm-Message-State: AOJu0YwW80KMe3poHK8WTflcCs14iJx/L1pS8hbWqSlJquTtnsVlAXH2
	t4JN3qkch2v55g4BfXAo0qzsfCyL5zPgnMcW/5BqSoavYu2EoKVKZ+lI+aXIZqLSjFGP3hFyc2r
	+TkC+RlPuZHk1VWRGHAGCP+ev0CV5RtsgH9Js6kUv/GAO0UefzkTMmV/cUSGNOFwV
X-Gm-Gg: AfdE7clpTRfb8bu2LdS1aEw5mbbisTiz/Fbw334JSwkTR7lAXqZ/HrauYuhUo8ASolU
	L1nmMmvmZGkHpM6/KUxQo1wSAPNWSn31vrjGEvKMjCFyHMDWkx/Zs0XK83JC1dbCPIyndG3+G24
	RVR3EZDujWQ6FeKG9AkuHSwnzKwebXvcLrU1Oa3YTxedQJ2g5CTHJ8mT7a7unFLTQ+iCq1RRC9v
	CiwHsFit+mM84nsNQntH/zaHuzn5tWoUB6e9KwzW2o2ppDgxJuUni6BfaGIa9T64vFrCaAqXsZB
	EYMm1n68hwy2Ec4kg8MJ4hO0yRu9pC5w3fgux/j+jRfEdMbCPy8wX+axqbqnuctz4aKgX6cYygb
	jN73/eNbn8i1T63k=
X-Received: by 2002:a05:622a:a958:10b0:51c:b91a:33f9 with SMTP id d75a77b69052e-51cb91a632amr113417651cf.13.1784031852585;
        Tue, 14 Jul 2026 05:24:12 -0700 (PDT)
X-Received: by 2002:a05:622a:a958:10b0:51c:b91a:33f9 with SMTP id d75a77b69052e-51cb91a632amr113417411cf.13.1784031852148;
        Tue, 14 Jul 2026 05:24:12 -0700 (PDT)
Received: from hackbox.lan ([5.12.73.156])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a2f951asm77031845e9.14.2026.07.14.05.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 05:24:10 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH 0/2] remoteproc: qcom: pas: Add support for CDSP on Eliza
 SoC
Date: Tue, 14 Jul 2026 15:24:00 +0300
Message-Id: <20260714-remoteproc-eliza-cdsp-v1-0-32eb7a1f2c59@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGAqVmoC/yXMQQ6CMBBA0auQWTtJWyKNXsW4aMsoQ5Q2M0CMh
 LtbdfkW/2+gJEwK52YDoZWV81RhDw2kIUx3Qu6rwRnXGW9bFHrmmYrkhPTgd8DUa0HjvbExuHg
 6dlDbInTj1+97uf6tSxwpzd8Z7PsHEbfuLHkAAAA=
X-Change-ID: 20260713-remoteproc-eliza-cdsp-07701ba2b956
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=761;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=a0iJXpiPVpNb5jp2bwdcRkK/t1vDreQyJ7PZL1jDvkY=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqVipiNjDQw5v7TlX/E5Fuv7ulYpQkwcQPqs8bp
 RI1+LzXHcKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCalYqYgAKCRAbX0TJAJUV
 Vn3kD/0aI2shMbCcQiUn6cXG4gT5F3h/UUipteD/wFKv3pkhiBPllNpLS/3smE6WJfOfq8a4c4E
 YIqhuEosk5xZlrZB8IF1hHGq8vtKsrCAC/I1j+jIVUUUwrr3aVAgjVrBljXdZ3tDZ3qC+fHPREp
 6p3UZNgzlGMCAb2athFCWQTW9x3HGK63uTAicABQJHyRs2whqrWthNgBZ3gdHkFB8npA0oUVZrv
 Ns7yRP6XmW4/kbvEzZgJh8gNYoL/rneUAd/hsL7YHd/CgWLnqrxaotzpJsxhsjbKYb75EROhefg
 lhkkEuNtNz2Ufy2CcuhB8j+xU23N52PJbyOvMH8a+RBb8/9/OEVyCPIO0L+R94ZlJDCjyENYmh6
 CFYkpPiYJIxLVNNn5h+LJEr31+iSpNFXbRcWNu9Bo6y82Sgfb7RrqiAouehKHXanMNSc0XAC3M3
 FRw/n4kV8YU3EVQhrmlxqG8qfYJ8AONVMs4rAgTchhyzc7qqzk7fMeTyGXM2CoARBjbOu2xNIpR
 MbF7OOsqLZw1r5fqhFNG7eTgGcF80+xr53liUrWqbaPSJRSUm8OIcnE/FQ+/Y+bIpyEPFb9J+Gw
 TclA0jRmgH/BEi9P+C42Q9nw68eJzblQ1WqmYNW5hkXR+InAfQWfrOwEw8/WWx89W8Z9ZVfcLaC
 3/h0bWGb48tyQoA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: 7Oeh_3EA-4GLG5S6hsgSKqZMBdYAyB_y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEyOSBTYWx0ZWRfX+XN48XBxqF7N
 6Cu+PnChVAAAP+7aIIIRmOGS+sSCCnjbyPGSM459hlzm/woBnZWieqV/kH66nPkjWNDraKTUoF8
 7pCCiwYZX1I8FPlrXxMRr3m4WKSHr+7At6a8f7R9E6Ud/OmWPkV7UgSS6as5lcwOVEH3DTntzKr
 0nmbvDfU8mWJVghH1CHO6ue89oo2+0h36aPKsboz9hlirHBhELDFJwrrNjN9xfObW4r1K+R1zc/
 zn6/Yc1Zw38vHhDi56uqPUbBAxJQPvvlSQZbQ0VGb27wQ0OhZcGke/ZgpEpl7XCiewAo8chhaQz
 x9QFNp5LwYAQ8wr3Gb0fknd67vHIiazDJP3oFrkbgH8nhu0yvUD7IBnfJIHiPzj0/UhuCDdzbKK
 30H83F+SvefnSfDAF3IVUiDTGkblJMqwpLvIlwwWD/NpfrWpw3/D2vPSFv/va/J2/JW5SjXw41X
 mKQHDfhhuofZR7GcjPA==
X-Authority-Analysis: v=2.4 cv=T/O8ifKQ c=1 sm=1 tr=0 ts=6a562a6d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=qUYP/O48JsHWwiZSxXr1NQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Fk215-RvauUPKMbZKwgA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEyOSBTYWx0ZWRfX3kXveZpZqDlE
 1OZWGgmofFf9QGPw6vESccuJhYqtAQuctuH93DDvhp16SX4Ng2Hp4/5zjCm6UKEmVRXj+1FGEXS
 4+FEFyhodBZWB2oEJ4b2/QuZIRWArBw=
X-Proofpoint-ORIG-GUID: 7Oeh_3EA-4GLG5S6hsgSKqZMBdYAyB_y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140129

First, document the compatible and add the DSM memory region
and the NSP power domain, both needed on Eliza.

Then, add the driver data and tie it to the compatible.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Abel Vesa (2):
      dt-bindings: remoteproc: qcom,milos-pas: Add Eliza CDSP compatible
      remoteproc: qcom: pas: Add Eliza CDSP support

 .../bindings/remoteproc/qcom,milos-pas.yaml        | 41 +++++++++++++++++++++-
 drivers/remoteproc/qcom_q6v5_pas.c                 | 26 ++++++++++++++
 2 files changed, 66 insertions(+), 1 deletion(-)
---
base-commit: 49362394dad7df66c274c867a271394c10ca2bb8
change-id: 20260713-remoteproc-eliza-cdsp-07701ba2b956

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

