Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A994315A
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 16:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785948517; cv=none; b=JESDm4PNVSPOe+FCUBryyMLAxvIyqg2Bcg//2ZNYc+GWJTkXKdqfPMtYc6oh/1LhrVxOSilfrEyC3Din1NM1bAN3k/xTUAtVl+GjP7O+4Dlg2P7gpL1FvpGmfdTYL/+Jd1eyb6qYjVg301lueIm5VotIG7l4MJh2iscgF3twZP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785948517; c=relaxed/simple;
	bh=RhK2YzNaAdFsBNuwzgXhz8JaZgpPP3+1u11J8QvAJkA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mkXfZRtaD7kFFdLTinZLZQnoMtVa8lfUsm6vAFK6VHLFQsDPFHgDVESGHpRSLGZ9gQS46AGS8Q8XhbjR9QhpSyPFjLhB6ja/W19P6md68v91mAxigMQAt5x9opat9VsDirnKiOoU8+V4oeED5jBnU8PG9tB9sIZujoMc5CXzRbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ys/PvQzr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kOcWSgv2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ys/PvQzr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kOcWSgv2"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675FV82c3867590
	for <devicetree@vger.kernel.org>; Wed, 5 Aug 2026 16:48:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=s0x/y82/ZYCWr8KscfSkCm
	6MtpItQIqFoVaXXVZMU2c=; b=Ys/PvQzrQbbUfPL6Pmb2NmRqBiEYU5N+tNsAxG
	lHFyhHKTX6XNcByJiyMqbMKqyACvwZbJGGyAReT1NshdQPQEJjZ0zm0j/29tGksS
	up/5CH9JOc0uC0rRvQOlEofkCSyrRZl30mC+rxifMGV4Z2tLVg+i8jFDPcNjCsmz
	YtiW0kHAJLGbQXLjNnP2Jj8XsSC7fxZdcNY77WZd0rfs4c+PrybTxX0Wp2C8LUc7
	jMs439VS34ImuNqOBYUqEZQodImYM9l3tII/pp61DAtY+TyTyVlj+W2OdBLXrtha
	TNVuTkogXF4OQW4xjU1Pv4LoqjAZ7QZCyiXhcUuJ2pX9NuuA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv5dk17gk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 16:48:34 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cee1ec30f2so14944445ad.3
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 09:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785948514; x=1786553314; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=s0x/y82/ZYCWr8KscfSkCm6MtpItQIqFoVaXXVZMU2c=;
        b=kOcWSgv2QG0YY/ndN0jk+sOU9hvij2ML/I+sQKut77Wfvz4Zcb29WZTbCqu1HIafKa
         GjcxwSXoXOEqP/G1rb/zPrsysFmUcuEvSaqogj1NlsvUHwebE16X4C7Qg8bhRDKE6tOF
         diUeQiU81bj4fUaMZfGAi74k1VAJXe81EhTMnRizbGgzzRj0adotLlUR5cXqO8WGPJuH
         me9omMTAPI3tn9YiTNqwFvX070kRvOLR+Oj18Q1zojWJ/SC1+ljNSidkGNiYmraO/IkT
         0fdeFugF2USWIDTw6jPg4R3qG0gpKIyaJUbEjBznen6Lq+nW1HcMrWLmXmwbUYda1PwY
         TzsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785948514; x=1786553314;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=s0x/y82/ZYCWr8KscfSkCm6MtpItQIqFoVaXXVZMU2c=;
        b=dGhmzRdPOoEiwfe/DAswAJvPy3euCmR2CYl5OV+MTvH37vmE5KMKFXCxj+ibdsYUz3
         T0EKmQmQgwQXukinF6p+t2iVpsIRemGgozmmEPfQkTXIikwCg/z8Ew3wjwWxeGqReH0i
         Ll0YqQqNcq7jiODKhVfUYgbMC/FkGyj/uW/0aPZSj+c43vs7RPVpXiwkZHCIE6Dk0EuM
         sKPtl9yPZ/PFzPIZ3/MgJbTktjAs2ePAs+0LDvU8JID+hfK8AuOCx2912NKdJkfKsx8t
         n6s3xabm9QCaYqvFqwK+ydBmekVKDsdHnuunWXLUmovCdTMB8zLGN0wXeItYAYjEHJQY
         HiZg==
X-Forwarded-Encrypted: i=1; AHgh+RrLmVMwELkmXyQ0+mAsK9xk4GsDUH3yVsaZycQTzETEgiO+dY3PC3EBRWvNf+s5XWssth9ZCiFo/MEj@vger.kernel.org
X-Gm-Message-State: AOJu0YzN2QaTaKgFjVnvkVzyyHZR0lW6FYEfU7yYZJtNwVVjE1dJl0VQ
	sPSGb9OZxwfyjmMs/BCQlFxOvPB5UM8Hyem6yHPBkamqfNbpgLzO9IWAFvI/4oggwVufY5RAQhK
	Iz+EI21H/827U+nuhapyUriYbrQvIvb0jwQahyoIwzcH2uJd5SRJOlXDK/HTKnXZh
X-Gm-Gg: AR+sD10Qp27Rs5YU9pqK50z0/LThqAlDAHFxFWawTJRUPL5exBwfh9Nz+Xc+qkU0d41
	wHHt1OlekRIp6qgXKTCPU1/HHd8i8cXSW/vG2dWQVr1hFJGTVN+zWbfBVKJOA1jqkf4OMP1Fhf2
	APocSGMet/I1JDKtaj0e4JpHVqR5DjVR9rGWFEycr4xmp3hcfj4VZksawt/vP30vhvqh/DNk7Ab
	SvDY/rlcXx+CR88RqVpxAt4cirVnPuGXvZ09CBu0iL9RMiN95MJZEqe6j59gtex9ul4DlWmy5pp
	yXnTjYol+TsrGI8zknRMoKcFt6zYJ9vUJJrV4MjPdUfxBn+Wo30GepLFX5Vu5X0XOdXcpYhNnMJ
	lIsGbYRFIqbZNDj5IHYH339MC8eLHsmk=
X-Received: by 2002:a17:902:d547:b0:2c9:b8b7:5d1c with SMTP id d9443c01a7336-2d0ca7faee4mr95892915ad.16.1785948513507;
        Wed, 05 Aug 2026 09:48:33 -0700 (PDT)
X-Received: by 2002:a17:902:d547:b0:2c9:b8b7:5d1c with SMTP id d9443c01a7336-2d0ca7faee4mr95892365ad.16.1785948513087;
        Wed, 05 Aug 2026 09:48:33 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0aa4d986fsm19159465ad.75.2026.08.05.09.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 09:48:32 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Subject: [PATCH 0/2] clk: qcom: gcc-qcs8300: Add support for TSCSS clocks
Date: Wed, 05 Aug 2026 22:17:12 +0530
Message-Id: <20260805-qcs8300-tsc-clks-v1-0-e7a5101ed479@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABBpc2oC/x3MSQqAMAxA0atI1gaqBaeriIsaUw2KQyMiiHe3u
 HyL/x9QDsIKTfJA4EtUtjUiSxOgya0jowzRkJu8MKXN8CCtrDF4KiEts6Lv+7qo/OCotBCzPbC
 X+1+23ft+FrYslmIAAAA=
X-Change-ID: 20260731-qcs8300-tsc-clks-fbb968fdac73
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: T3J5RYpskChgYOmnJW4VGJapBQj-1ZSc
X-Authority-Analysis: v=2.4 cv=Or9/DS/t c=1 sm=1 tr=0 ts=6a736962 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=DcIv4KPYSJKIViMFPNcA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDEzNyBTYWx0ZWRfXziM3Vl7wh1f8
 YCa6HI/r8Up5k6UPzrLUDLC+cuY92dXcIb02d+XGgexYhhVMU9xerVX8CsnG5osl3ViWIyNcnHC
 QDJViexbMDmKjPgJF/BGpaZ8BiYbzZJP+M8gyaDUmT/nepFt0X1mlfTEwxgv4gt+IBd170snFsf
 acLDW8w0dLjv7VgaNal2QKI678qEdMp5dqTAOnH1GxNGErtCRzuQxiPeAJk24ButfWG5VDwSAeY
 j13/pUXks3MFrZbEHKzYxT0hj450AKY/qYyFVl3UHUrV4TLeN0MA2M8PuHoXBVnytoJE5HBMB4C
 A6DB+PdjqyfA8qMwOElwbvci2ybApKds+ZldhfYxtV/sQhYUsfxdl7O3WcIiakOAPOI3YDqkJ95
 Bsggq+Sr0B2SsopXiIAHr7kvFrXeaLN/ZX6zqXuCRFe9LUz2vYeMqEImAlvnVL+gUB7X5AyAWLO
 Jp4qlXptUf8n8ZcbSiA==
X-Proofpoint-GUID: T3J5RYpskChgYOmnJW4VGJapBQj-1ZSc
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDEzNyBTYWx0ZWRfX8lR9zSlBTDYm
 LVxdmRlFBvtTfgBui0+MBDjdIhPhvGagmobedIy9FO938RG6QQ43Hyq+aam60moaZrvrfu4Fm4l
 JVYlc1R6qJEcUL6w+nJglfBM103c0Ss=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_05,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050137

This series adds support for the GCC TSCSS clocks required for the
Timestamp Counter Subsystem (TSCSS) hardware functionality on Qualcomm
QCS8300 SoC.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
Imran Shaik (2):
      dt-bindings: clock: qcom,qcs8300-gcc: Add TSCSS clocks and resets
      clk: qcom: gcc-qcs8300: Add support for TSCSS clocks and resets

 drivers/clk/qcom/gcc-qcs8300.c               | 103 +++++++++++++++++++++++++++
 include/dt-bindings/clock/qcom,qcs8300-gcc.h |   6 ++
 2 files changed, 109 insertions(+)
---
base-commit: 1701fda2f58e345c050f4309971bdc07cd6146ba
change-id: 20260731-qcs8300-tsc-clks-fbb968fdac73

Best regards,
-- 
Imran Shaik <imran.shaik@oss.qualcomm.com>

