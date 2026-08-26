Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8B538DC75
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 17:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787763840; cv=none; b=tCEd62hl5/gh0laIKqYvj6xsgUJcsIrO6VhtM2ez/p8x55QbqinTEA8iwl2Gk//5v2T3b7/8m2thC5lkPey2DG0tewleRcuEc1I19ZmRvYnzE06ofDZ2XDKQhQdHZf5p9sHe6xh/1dBoKwNYHUHlvgoxQfQTNok+8xT2SPUQPu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787763840; c=relaxed/simple;
	bh=/tVXMe1X40jBRWP2+3mc6TsHLn4raV1bdUbMpmk1/+4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qcojP1Eh3ziFvSEIEwCB2pOoxuKw7NL4D+++IKFaerFlWbkfzt6+0AG//ssCEiVI67GSUPXY3CzsHYzJpbNr790NRIuoGSc9sR63qRYTOagBzawv0DManyO+aWykui0G2oi97QM2KtCfVrGTiHt0x/HBqlyzsQFAB/41EQPB+vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B6RdE/hW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aedQ5GyW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B6RdE/hW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aedQ5GyW"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QGupiE343497
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 17:03:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NrqpIZV2QBG7L0QYtbs8RatDKP6IxZ/Xed/zIM03jdA=; b=B6RdE/hWm9VQq8Wh
	ntaZ+Hlx3py/ZpDkiE6W2YcEyOrA4IKhtfTPTJU9NAlBpHjGb+j2Dsj6RoKR0ItF
	wc3wR/7ED3dBZE/GiCKgX18XrvAfrcQ2uJVLIHG6Nugk8nbc12B2bXfoQGbhJ5dQ
	60UHz5idSiROq1hEEMgAbYN+C3NJCQzMvX8YfjuULLpftVm5MtxmAEYLStYWNQL9
	lz50OmUKmU1mKtXxnrS/g2H9UWIRguGnGRky4jUKO1WNXt2k3iGiVN1P8K1zCBm6
	0jWWXaRJL2y6wQGLedtRFhb7I32fSd7IcOzAud0mrD/ZBmfx1xBieatavmy/RHWF
	sLlpug==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9utht79v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 17:03:37 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cec4226c70so15678215ad.1
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787763817; x=1788368617; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NrqpIZV2QBG7L0QYtbs8RatDKP6IxZ/Xed/zIM03jdA=;
        b=aedQ5GyWbK0gVbDW/zuWOWFKZlDMYdydmKRNmXOGleZhfE7HH6IeDuAwiSFTExIDlc
         DuboNUn7j+W/rskal+a765uR0jfYmGZyspnPmcimR7Hr+i01lm2REZA6aFyTOBhXdkyT
         6GOOPxjpOm3Zz5bJEVl7k7yah4qgXHFfy+G4efEdJAHKwWBgUs5qNmd7n9LZLfWBWiGf
         Rq3r5a+UKY9Sg6zLy1Ev7vUH8eWLQxAl/cVAeZ4ttr/QtG1EQwrsdFWyZcQnphG5W+8X
         2iMAXEWjKCq66wYtui8L7aOCy9nVI1s0wryWSIHRMUGPHE8m4i67amEQUpTi0v+XCYQQ
         MHRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787763817; x=1788368617;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NrqpIZV2QBG7L0QYtbs8RatDKP6IxZ/Xed/zIM03jdA=;
        b=J6mosY38LAhMKim1tKsEtXSu0K94y8C/CV3MaRTdDDQegWGhJ+byQ82lJETCDo3fZ9
         3nR6x+tSLAKARHCpefrBKPTLEY/bLxSwVO13tpILBpUNpAQkjqKa6uwinQ5jB86v5A6B
         phcf+4VYL21O4pzCCNiLh+e6nRR6iBaZEZJS7GfKFB6VdqfHLPc/zqeZwER0vPhNOn+I
         bIJQh14BCjoBspRVaplm72mEVPHtnIEzS6FxL0F31oQVdPkaH3r/9yZTEc+nmMw3qMO6
         KmQSM4Hiv3i+XzwnrfWj9FuT6RHdYQZbz+pMj7lIW7KOUeUwZ0kYJA+vhY6wH4uHoB6b
         XofQ==
X-Forwarded-Encrypted: i=1; AHgh+RqKwGXkyJnwuXdrQj/ceHlQiHU8J5qBfhbQIcwDAi+9i4JajsyJ7p4GFSpT/oKfX/ETu+aqJK/ixIlL@vger.kernel.org
X-Gm-Message-State: AFuF++kvkKjDh9HV8bwDcMaRoBZ4ILESQpfi+Dm/04izsG7Me9CHeX9E
	qK95db70zZBSx+NLeElRrtnDmidFhZLztup8YsicaGBBPyyF7sFUGDBPUlF0F61A7+/gxR7jJ+V
	yW9HVvfqMY38SZU/1464mR+Zl6sI26Q71PuDjOPglD/pPb8B8rXctL9TW/IvsrB16
X-Gm-Gg: AR+sD11lPrJvNoMJ87CVXcedhs49FkjRUicUgPI2GHrJBdgi/m/U5e0wFNsQ5En8jVk
	qRK/WanfraNJb3opRVTeoft7CmdbGswb0O7AhujtwAU/LnmpV3DiIfsazMQnYCUlkWCjdZzMQgQ
	MoRs8fV6r+uSO52Cb4J9NoFO9eU30pq+0W6o7DgPV9fBKNug11k9UeXI+2JoLZkgGtIAD8RlfM/
	Qy0QpLPsDkY24DrSRnkFeFjS5dDqZ2x3kk9Oqg4VYs8SGjiPMkYLWj1VxmL5wai+5XGCV8WIUco
	Kvue9aO6ftmSAIylIzkNaxYbt9RhAynKOqskLAgZ5N8bhcsFM8C6gMcmI5wYcZvrp3iW34HDr4K
	/V9LeogaKtEJodutIqOYCm4irsAel0xgPI19kPr4qaCUDVDJOxzU1vWZw4Y4xff6SsJeRcA==
X-Received: by 2002:a17:903:94c:b0:2cf:8131:75e8 with SMTP id d9443c01a7336-2d707b61486mr154251725ad.13.1787763816872;
        Wed, 26 Aug 2026 10:03:36 -0700 (PDT)
X-Received: by 2002:a17:903:94c:b0:2cf:8131:75e8 with SMTP id d9443c01a7336-2d707b61486mr154250195ad.13.1787763816258;
        Wed, 26 Aug 2026 10:03:36 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d70498ca3csm9938285ad.31.2026.08.26.10.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 10:03:35 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 22:32:54 +0530
Subject: [PATCH v6 4/5] phy: qcom: m31-eusb2: Set phy type to EUSB2
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-eusb2-interrupt-v6-v6-4-ae2601cfa80c@oss.qualcomm.com>
References: <20260826-eusb2-interrupt-v6-v6-0-ae2601cfa80c@oss.qualcomm.com>
In-Reply-To: <20260826-eusb2-interrupt-v6-v6-0-ae2601cfa80c@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787763791; l=943;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=/tVXMe1X40jBRWP2+3mc6TsHLn4raV1bdUbMpmk1/+4=;
 b=8AUWnAkBRSOaoJzjamgva0txDu5cduEp6C4GlNUbwuGYz4bERAge9awi7ni4Px4gFenzCk3KV
 iLYfRKBeDS5ACGWk5G6PmSq1X/KUgugw/DIU+DoTlYfnxf/ZFDPgogk
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Authority-Analysis: v=2.4 cv=EMA2FVZC c=1 sm=1 tr=0 ts=6a8f1c69 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=GXgYrK0FegosRrsl_UwA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: ewWTXVMO4zblzv6BJ7VtHDWRzMyDIIY-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE0MSBTYWx0ZWRfX2dG2oqtFWUoO
 +UJN7tlyH3DCW+33dp5lxHrFaq7wy+w3tOuoHH6jk5tdfTtkQ/X/qj7Xdt9W1PJMMO5q1NVvUN3
 9WLB1JfYC/gMV5H2vyPUrfiHB34KB1cwdbpWR4FKQkoLNB6Simc9qpk83qJQxjBYUaoM7gxz3bm
 Rq7YjbLsnLQfbOnZ+WQPWdhGxD21Zykuxa7slfQhSrEBnirVOfHhyl7KUl9v2zZ9Tf1XQtLJ3Wo
 qJ7yX9L65ZV2V9QUL21wNkdfw67cfFZQDeLVG5Tp1lZUvJSBFJft1av1PMddgUs0b4wuXM3WBgH
 8kvQXAKU8VDqPbncze5KETaDdxcBcZPnKeBRkewQMnhrQxvsVJ15V+REnJ7vOsALguLyVLpNyQ5
 /qU1GibSLyOMRHjklEzm+8QiqhqOL6rr7/ookI124EYFaLCdcWrhAfd0acBc2VeGrpbhaY4RQEd
 eSFYqYgwKvlHDU2OWLw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE0MSBTYWx0ZWRfX+J+hkot87kqB
 5lEMxYb0/D+cRdhCxFvls7+Hy33XeMusXOIdCz/bLV9B/Ad+za8x9m6LpBiVg+1S0ckRNHC3Prp
 8fW2cVEipdz6JoYgTj9NJU5mI7/E2/I=
X-Proofpoint-GUID: ewWTXVMO4zblzv6BJ7VtHDWRzMyDIIY-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_05,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260141

USB controllers like DWC3 are agnostic of the kind of phy (USB2/eUSB2)
connected to it. Set the phy type to EUSB2 to let the controller know
the phy type when queried during its probe.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-m31-eusb2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
index 0bec8657149c..7e6b16b6952b 100644
--- a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
@@ -277,6 +277,8 @@ static int m31eusb2_phy_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(phy->phy),
 				     "failed to create phy\n");
 
+	phy_set_type(phy->phy, PHY_TYPE_EUSB2);
+
 	ret = devm_regulator_bulk_get_const(dev, M31_EUSB_NUM_VREGS,
 					    m31_eusb_phy_vregs, &phy->vregs);
 	if (ret)

-- 
2.34.1

