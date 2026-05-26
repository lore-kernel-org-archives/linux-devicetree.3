Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2794D1F875A
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 12:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779800115; cv=none; b=re3C/Yxalm6aWjk7oGQysf+u6fYTbNw8Y914L+oNMGeEXgcb2IHgJbCaXapXrl5vv/p2t5YsJL5iLa0IydT7HOZMSNXiqYknqqHZivJaEtgINTdhs4rE2X645hbyQLMhMkaiylX54qlkqWUb7KSSrQKeXx0ClSRlBLsjdeSfYa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779800115; c=relaxed/simple;
	bh=E8K8gxQ/TdZcVbxk2ueWju5PhjMe1cZYpqIaYJ69NV4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hnMT0Ied2geLXZI50Z7uwggrGi/HH0iUb9A94Ee3ptBy0jbKLiwf65IQpdLLd3dpnvv0rfYcesdHLWdD+AR6pdfJz+oouhuNSsMIWIsbcBgFfy+/1pdiKpN+s/7dHBD0EvBOj+bTJu6NGkLXYVOfwuhjeJCNKJHsJej7lESoCRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HYzDduqe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a5R9Sruf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HYzDduqe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a5R9Sruf"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QCsZ1X2496683
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 12:55:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ag+ERHlpaRZe4pAnmXb0B1hS5kaPrwHjfIHQ6RiEcmM=; b=HYzDduqeKyoKFnef
	aQL+jikR0NzEeR2p6v7uww8wiqvzHTqq0Bdr+V8zRPj+rODUaCVV4gH6WhGzLgHP
	pMZf2mm4DeYOznyOLqEkpuLVHCqb1gVWOzyMoWgUJnC2tId51ikemC6ZVy+b1cDp
	lJXNeZphzr6aXS7GrQ7RCVyw6gSeY4qKbgepbrb57vZyr9z5tWxcumUBIkJWukdx
	Q999OQzBtjg8KhlCconLXbj0eSyp1nOFks7eOjlGYZl/5RikuQpGxN16ECXZlcP9
	C4MGlaMGIQh270qd5T3IsrCGiSn+eu5XmH7GQMIa6HkANDWsXL7tk+Jf376dcpn9
	llIITA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecpyqma6a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 12:55:12 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ba6fe41283so113506025ad.1
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 05:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779800112; x=1780404912; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ag+ERHlpaRZe4pAnmXb0B1hS5kaPrwHjfIHQ6RiEcmM=;
        b=a5R9SrufMIq8eUsS5mApyR4ccDFN2R1MQelqV7kmaWkB526Hv86aVoUh+CBsff6jqM
         iSh+Eqz+9ieI/ZrWhrskuOGkl8tayjQRWpzlk9qo0YaI1XdDEzjakRk1JXkaWdehpRhW
         StT5/h2moZkovJCYA36W0s/4CwihTM/RFKQRSKCTJQ1io6uva+WOoRZNzamNly/9NXtl
         b7sUbBwW5KuGp37usrRJxcNDCZFXXfEV0eqPgxY11aM1uY4+Wk59fLMNy3zszEI2gKy6
         pUEe5zzqVu2WIvLHqn0gfNh0M8Z7PUVthNjPIO/wvuzRxBQ8gNSx1v+FZI9p/WblYKCm
         mkBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779800112; x=1780404912;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ag+ERHlpaRZe4pAnmXb0B1hS5kaPrwHjfIHQ6RiEcmM=;
        b=Yy9RJtmm2v/et6LIT+e6XoKvj32Zi/gocuDRqrqnguqOshALjF0T9rxd1X7ZnwFJCm
         CE3ffMkDHxnA6oSsLA6Q2cjKlNP9Js3t4QZPMtgKPrSSIprpnOHGnTeBpRfoDHtJW44u
         CGGq9vhEpSHw3ofbCJ02M0y3MEFU2aSU+mBMgaVYD7udVlsgleanPftSf32fSFQu6lv9
         tgKdXN9mP5cDEDAZQXor6piR8WOWBFHfRNWROqNjRhD3P9OLD9GoQ3fYNLN4sNqHrjoa
         ELMCBcRgmLczGpuku43GOaQLWJISYpE+u+lP2MvEVmIZQdr9Nz3659vpR+bcUYwSNjcl
         ejVQ==
X-Forwarded-Encrypted: i=1; AFNElJ9zqy6TlGkA0Pg08Xe+ft1RE/4Y+WuTPxeAwvA9mJh6VqpJONYpcVciF2T7Wz/UMWnAf2xO90uCZtZf@vger.kernel.org
X-Gm-Message-State: AOJu0YzPOT0pKIn58GWj6u6n9iPPbXN+uGsoDRPoSbnLVP+t1SNahzEe
	zgCzQVytfcRAyDkE12gwba12P5t3ChUWQJm0cZoAHDFc6K4laObW4dtjRvLhaL8RCEQZHfImIUP
	/ZWcyOH4R2aDGYtC+MZiVfqdb/jsb5736ce8ooweGSwU+6LQHbfb2FLlnw1KHNKjs
X-Gm-Gg: Acq92OEKEMiPmjOzKIBxcyCURYBsC5PmJNxgzSWDmQT1PngyxuUOfVrsbkft7U1T7DZ
	X6U3kMbE+dkjqApeDVZzTjjyNIDzh5XAGjTGEBo8Gb4H/Vyv+9ACeBVRHhb0xtN2v/Tz0UBkMAK
	JRXvxkeZC5ZmW1gXSBps5YeNa6w/lkaUlLrFEoy4XPpukeZFgMifQbuUFgoajYjkKiI3a7FZxya
	Hp0Ap1WdiXN16NxBFa8+3zHoJXNIUjNcwGpwTdm+xtlBKYMsHQHI4QSxrKLyCHZkMpc4ijO8c+t
	Nx8pfJmN8K00d8w+RvvuD6nBE9rMsrVIEB2YTfkpw6lDYBPwrw328OgSSqGci7fmBMmO6nr9NbG
	aGuQ2qBuTtgrH2UGCLLlg3SEJcpI/gCle39b4vzb6OieYwsKighIv
X-Received: by 2002:a17:903:3c6d:b0:2b7:86be:7673 with SMTP id d9443c01a7336-2beb0366450mr191747195ad.6.1779800111725;
        Tue, 26 May 2026 05:55:11 -0700 (PDT)
X-Received: by 2002:a17:903:3c6d:b0:2b7:86be:7673 with SMTP id d9443c01a7336-2beb0366450mr191746875ad.6.1779800111285;
        Tue, 26 May 2026 05:55:11 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58e4fcfsm129000165ad.71.2026.05.26.05.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 05:55:10 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Tue, 26 May 2026 18:24:45 +0530
Subject: [PATCH 2/2] clk: qcom: gcc-shikra: Add support for the USB3 DP PHY
 reset
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-shikra-gcc-usb-resets-v1-2-6d9e7fee2998@oss.qualcomm.com>
References: <20260526-shikra-gcc-usb-resets-v1-0-6d9e7fee2998@oss.qualcomm.com>
In-Reply-To: <20260526-shikra-gcc-usb-resets-v1-0-6d9e7fee2998@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=dtfrzVg4 c=1 sm=1 tr=0 ts=6a159830 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=T5k1B2oZpLT1qSJ_dCsA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: zWzRdPhs_tZjhWzPbKJ16gXuy4keWi5x
X-Proofpoint-ORIG-GUID: zWzRdPhs_tZjhWzPbKJ16gXuy4keWi5x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDExMiBTYWx0ZWRfX/Xj6tpYVUqw8
 SXkyTAEzkSLYjcvjaSbi7j4bD7hMlZIQK28ChtOoUZDXL8nILtiFjFhHW5z2wRDaHvf6kPMjI2D
 7Bdl1N5QKrhuIVdFiX+SWzHhz9rI8zVqQSZ5FpM3e1qoOu4Q4ltJ7E5sDCbezbNB62bb6OraV67
 s6Ije485zO3Sv3fNmv5XKKuEFlY2N1J4lO+3xqXhn7z3yNXpG02/GEM9SyrZyn7oSRgRHU7Dz2W
 PHWBPCCD+48mQaNMtjSmvPmkR12f0TSPT9YexkjMbSVMPuHe/kjUULhUl9Gzpf2b7PASO7WAeyk
 1sWCxZ2/TA++Knmf5iWm+ID/Ry7NiRerNAF9Qrj5g8fDNArBeZgITmJOVdB2XSF+LRyUvNaCLvn
 tHkJp3oOmagfmJHvRodcaR1QPcbwr1CaKEiJo+wi8JYrb39GNUl0bZ6QbFkWHDXpynj7uRzHyHB
 djeHez8j/e0PCiVcznQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260112

Add GCC USB3 DP PHY reset support for Qualcomm Shikra SoC.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-shikra.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-shikra.c b/drivers/clk/qcom/gcc-shikra.c
index fc1c90e7e7469818a4372e1bc192761096441221..f323ac5c6400c430b1c92cfc4f7a1550abf08de9 100644
--- a/drivers/clk/qcom/gcc-shikra.c
+++ b/drivers/clk/qcom/gcc-shikra.c
@@ -4331,6 +4331,7 @@ static const struct qcom_reset_map gcc_shikra_resets[] = {
 	[GCC_VCODEC0_BCR] = { 0x6d034 },
 	[GCC_VENUS_BCR] = { 0x6d018 },
 	[GCC_VIDEO_INTERFACE_BCR] = { 0x6e000 },
+	[GCC_USB3_DP_PHY_PRIM_BCR] = { 0x1b020 },
 };
 
 static struct clk_alpha_pll *gcc_shikra_plls[] = {

-- 
2.34.1

