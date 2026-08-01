Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3474F278161
	for <devicetree@vger.kernel.org>; Sat,  1 Aug 2026 14:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785593651; cv=none; b=qUfK2/53/miPAo0ip6Va4C/RtJjWx18Rrovcr9T6Cc9ojQi/PjY74h4lQdnXes/lo8gjKQXkzT8Q8ENinIfB7DgW3OBUg30Vmvhkt6RzFSr0UHy4TSI/t9icSfO0EIxsfrHvqxPOjcwxoFSyuRTVIbW1H11xubIraQ5rFzdLNNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785593651; c=relaxed/simple;
	bh=WhReouEPT0feU5MQmQInaoMDe0X4aQOAzAKso31UGbQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jAjK4PYfZpWNaUbAwXtpHCK3ez0ToMii27vtWEF/iPH7QudN5r/vaojU40IEMJRWwjGO+jLdkim4ZnaTYZwzhhzfxxQbtgCxSG8/UDKs6YS2LYy9LjrffzXOyJIsMRR2wjxDydZOAb5wzdj5XMo70Tl4Gqag2M5IoGtGTI8VR0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iLMPe8pT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HU/SD9h1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iLMPe8pT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HU/SD9h1"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671Cadg13441579
	for <devicetree@vger.kernel.org>; Sat, 1 Aug 2026 14:14:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uHNlyGAaWAq2NRA4NV7Ae3CXJ5ky5RIilhiWwiCNMsI=; b=iLMPe8pTHSuqbZnL
	c6S9UdNkfc+oSCsmzBQmAvFvEj4QYDeXSnYgATx3NBTzyTr93eV40GCDTQD6t0Z1
	YLy+tCp0XLuB2F8rHCOtQ97DlKRKdzj+oCxfPNMOYvooaG7D05FQaf8tS5RVOceY
	Diz5ZvAcId/3b8tircduUr7aU/D15utrVCwBuYs9jhdK6r1TSH8I21Sxp2REAQwV
	PKomR0Vh2p5y77OckNl0r8lDCztGhgdOPMm6LRbn+yUW7DcTOVv3BCaHT1szhq+6
	4RfkH9LZG5VXT7KJ1QJDuZIHAijKfkFR8/E8SMbg/KOnu3+HpodhUpDr3SPHohOk
	IONE3w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8qps1pd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 14:14:09 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cacf17c7e0so22931415ad.0
        for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 07:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785593649; x=1786198449; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uHNlyGAaWAq2NRA4NV7Ae3CXJ5ky5RIilhiWwiCNMsI=;
        b=HU/SD9h1vvsWPQOD4vyXf4gpwlQLvfbFYpX+/LmK/7e+GmxHnrzbvKWL0YViaHuhHk
         V/OiLnugamAdHvs1yFogkdc+O4U+fxS5Tpc5PaF59gKKYIDx3saplVMi2WmhP4O3Mxe2
         /PtP3iXBAR9NsENK1mHFk6ctsZrfEhb3kfOYCtCEgHI1trjwg6Apw2z8PvqxnPqb5iRi
         ghzbxZK7sZcDQuz4cZJ74Iva8BTgDN1jBGNK8BfWyq2DAY+xbDWs+texUtOt11cGOjEc
         pLucT50718rT8Zi0X7Wg6sCEUKlKALhxnTOvKNuu7AkONE1m1P7zwh54cKMEkqpNN1nZ
         kiwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785593649; x=1786198449;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uHNlyGAaWAq2NRA4NV7Ae3CXJ5ky5RIilhiWwiCNMsI=;
        b=dr5GHVW1Onjb+jADnuI/w2GcMNCHwEM+V7g/x/vxkUgn3gLSW7u49OdO+/w4mobtxj
         iAGILCEbMqaWalDUbOApN7xuBth73JXTRMeaFB6sLCaC8w5ijQXV/W4JvD+2CWkkHNCn
         7dkDTO32YDZQMGKWQy+nNBJeJ/HVo4Er32GKhIUKXWhMDdihc3IVzE/1wX5cTmwlMUzS
         lOjYtfkpt0C01ALW5P0MNNj7bnhIW3QwVxD4E2VbrJHmYieYbyXUsAC+HYNKME+Iv3iE
         TFtqQp1CkavT/LprhonTiXLWQxMCC6L7pOk+Hy75vIbNTxQij6VroMW2ygSXKJnkIuoH
         8Nrw==
X-Forwarded-Encrypted: i=1; AHgh+RrK06Mu8t2oA1oMPfFNeg1iWoxWZ3f8sHbcQITHRK89cvaI0sylMO3Jx03siZGdJLxheemOiWEhGC/C@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4Rf6pYIrR1QTYnBzTESpkTAkK1BVAmim7xwUE6JuvRaYhxVfv
	grbRTPjQvmqPUgvpYxVAk7Jz3XjJvEZF/MdBgowPjeZ9jA6rinCXKXhNg//+pfGcLq3m0i2R4Mt
	UvL3YkjjaV3aVkI6r00yXwAmL8JpQfUbdztr9fXdC/9htspFknB9w7HYoaGQ3ZvMxNdbPg8ji
X-Gm-Gg: AR+sD11a/sCzHNpmWlBYObbfbPPkhwbhJAeEZNcAqvRs+w2g61xtLJe0ZvDaUXU17TN
	8za5sirLejEAm8oVslwGt+VLYY2mZWEeg34c/JwdN/YX8treV7+mqMY3PgLeCYiN8dGMoOt9d1H
	7MQR3m9YaCsbHQiXi5eZz2hjqYsg6Aop3iV7hrrluPq761b9LcutuntJjHNcmpJ0vR3qTTFU1fT
	5du8Hk2NPcUu4ZNHkfvHwdoNDAJq4ZLLL6/c0hDht2wl3wXIlh+YwXU55WISfyXli0RoDa6tCf7
	FrilgicaZYnNWYhNgu8tlV1m3PQ06GnVPqa0k9RiPnUti+x22ydPXB4MZWvUvwoHFKbFbpll8tN
	C1hTRf0iSULS9ZlF5E11ZTagh
X-Received: by 2002:a05:6a21:4cc5:b0:3c4:3672:ba6 with SMTP id adf61e73a8af0-3c92a7e7e6fmr3392541637.22.1785593648673;
        Sat, 01 Aug 2026 07:14:08 -0700 (PDT)
X-Received: by 2002:a05:6a21:4cc5:b0:3c4:3672:ba6 with SMTP id adf61e73a8af0-3c92a7e7e6fmr3392510637.22.1785593648265;
        Sat, 01 Aug 2026 07:14:08 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab4e506csm13570696c88.13.2026.08.01.07.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 07:14:07 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Sat, 01 Aug 2026 19:43:52 +0530
Subject: [PATCH v2 1/6] dt-bindings: clock: qcom: Add GCC video axi reset
 clocks for Nord
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260801-nord_videocc_camcc-v2-1-674d7718e41f@oss.qualcomm.com>
References: <20260801-nord_videocc_camcc-v2-0-674d7718e41f@oss.qualcomm.com>
In-Reply-To: <20260801-nord_videocc_camcc-v2-0-674d7718e41f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDExNCBTYWx0ZWRfX7HkYPa0cC0qp
 IbCXCBHcjlGERSxHmvJncPh6OY5qvfonJ9vb7GFZeeSI1PfPguEtxUPXGaImOtbvE4ehGshbU99
 huIQe1mJlaXzwfJLaLE6NZSzDE4FMhjAIKh0oGuym3HHt0ThzLwmOo3orQVc818bV4uHyZF68Xb
 8YxJa/VpdxzfymekS00rlssaDzeTVeIGmjhTlYNt5bZohRrj9UJBX0a8Y8UHbgXN7mdJckcx+/w
 QB5bO75nsS3rxYd/vMhAxnCvgYDNXOS+3G7uPUnoWaHIe+l1jh6n6H7roCvyXw6w8Dje0X7pVnw
 7BjevU/xY9v+q8/7jRUkpG6LJ1r4RKGC9Rsrhav/dBYDnA4TKC4HeL92BO7GIcNoJfvP0FBqL5o
 CSh4hBpaIU/YQCdtpjy29+CLf5iKKg1Fsz/UxV57pjrtc4UGoQHgFeK/9HaCeS8PcodpgYPltXM
 /kd6/iW5R3uGh9ZkIcg==
X-Proofpoint-GUID: kXSyLn0kH7fP9VMhk5uhevpYwiSrVJGF
X-Authority-Analysis: v=2.4 cv=MpViLWae c=1 sm=1 tr=0 ts=6a6dff31 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=wyNhwcPAjvrcrPB_k8gA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: kXSyLn0kH7fP9VMhk5uhevpYwiSrVJGF
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDExNCBTYWx0ZWRfX9OTblJRJHg5N
 vmD/WpF5tHPMsy/WOtH73CrDO6xR56UcOBZw2t9qIFXtzwNkHf+w4WEr34I2CwAMF/ZYavFY6EO
 +hjjkB6rXGAy1wDns3tbiYS9ts9F96g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_01,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010114

The NW_GCC video axi reset clocks are required by the video SW driver
to assert and deassert the clock resets during their power down
sequence. Hence add these clock resets.

Fixes: 06498d59bb4e ("dt-bindings: clock: qcom: Add Nord Global Clock Controller")
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 include/dt-bindings/clock/qcom,nord-nwgcc.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,nord-nwgcc.h b/include/dt-bindings/clock/qcom,nord-nwgcc.h
index b6253dd2aa85a3152f99447a60a6f8a3e85d8f3c..8beaa129aa814c82470deee4382de5bdf8177892 100644
--- a/include/dt-bindings/clock/qcom,nord-nwgcc.h
+++ b/include/dt-bindings/clock/qcom,nord-nwgcc.h
@@ -65,5 +65,8 @@
 #define NW_GCC_GPU_2_BCR					6
 #define NW_GCC_GPU_BCR						7
 #define NW_GCC_VIDEO_BCR					8
+#define NW_GCC_VIDEO_AXI0_CLK_ARES				9
+#define NW_GCC_VIDEO_AXI0C_CLK_ARES				10
+#define NW_GCC_VIDEO_AXI1_CLK_ARES				11
 
 #endif

-- 
2.34.1

