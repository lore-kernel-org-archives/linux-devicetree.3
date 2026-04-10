Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6C032E729
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 03:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775792962; cv=none; b=PGXgwld4YIAC/31qKrsDdMdvl12QMmlX96xGwNkULOH/a1iKjy8uch99xcjti7cRFT9W3nG9C6UIUNAkmK8SEb483cxTE6Mbo2Gxyxx6kyrrMgHkutJbrHecgk88bfscCGP8Xlk1vOTBvWS7Bl0vNljCQAG4UisKIEpeKCVoUEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775792962; c=relaxed/simple;
	bh=xndMnytD46oNcdty1II0Pt5GXVR0jc6Q7BqQXZ6JaeY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W5IKtPkrvzPGpcdnnj95VVCnSSt0HjxPdUo9/GfzB1PQWZO+w3EwFc69Z2+KC53xVIFn5AxEAis10VtXs0Blb3qHsBF4O37tomOTGPwlFCFit6RVO2PUr2TLGdyuX5AfVGmdnQAhVI4en3T3ePW63FCfW7Ng5BFiJ7SkxyKyUSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZpkViu+e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=POTswptj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZpkViu+e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="POTswptj"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639HRa6V3352647
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 03:49:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yPiSfrQKsl/VRd2nw1vKfMGzQDLRFPCgUTkp0DvqBBw=; b=ZpkViu+ezp+QCJU+
	dGZ47mzKf4ol7fgo3MfL/lNfrHztjOBKF9eghgzxtxc4Xcd+JgD1DJTpzYuVwJM7
	Bunap4t/fi6aCQQHfyxmkeE/G11utZW13B4Ax1K3YAugKrL4frCQScysEVqs95pK
	QTign0hAV72lLHXf8TGfG5lq52GY7JMYH8DFKrHIQBGUWGR4EtKe7PM8T0+kehq3
	qYsgugxUCpApIxCx3AxEQROiS86eDo4w2O1xenHpmZhyi1dhI6nBlD2zknEKyTFy
	n77OXAvlCtnLCn4gcfYorGrU1XNyKvpueYFgxiH/qlCZUh2JtfTE3CWlhmAkHMwO
	2Tv9xw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dec1qttdk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 03:49:20 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b0cf396c45so19935265ad.1
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 20:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775792959; x=1776397759; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yPiSfrQKsl/VRd2nw1vKfMGzQDLRFPCgUTkp0DvqBBw=;
        b=POTswptjsbdGa9NzD36FbEd66z5p+vNmRn64dD00Hu7uP7JMEf1oMBjRgJQDQoB72F
         kvIOs/ouVFAMZuTDAKXtY6q4j+nkL/mKWH7sDzYjKEXashQVt22VZ00Wv5Pj0D573tZ6
         26tqUw0LLtrMGruDlOpz2I1amcQqiIhqnDu3oyQZpom5jZ451hvT0axSVyVK1pjDm1z7
         5mW7ZOib6OZOwnB7cfqCF+X2SAu2+0SLrURox191gklkvMPNKU9Y3vl2EGHgIt34XdzS
         kenLcNwLwTM8b6LQBm75Px+9R8WWFLznJvPWQruRuFdjGRjMwi7aLoEEBa5Tr2PP6A1r
         IO2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775792959; x=1776397759;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yPiSfrQKsl/VRd2nw1vKfMGzQDLRFPCgUTkp0DvqBBw=;
        b=qOoosh9IOydXBsc8RVj8RH0ftTlRnazmv1a/VjjqGqUaVGGbZRB6PLKiTmQ9RPWgUs
         uSeC5hIVZi4xfXOAemvYSOeNvUyT47rl1MN2wrTWx6HdLgGJH9bhEkDVJJpe5Jl67UWP
         ZapbuvN/kDzMUaBPQNnwdr75mDLaQqA+EFwlQ9FQhZSMgg3tVxo+RPVWX58pp1J1fiYU
         4FIzKaHMuwOG252PBfpuijgJ1D28Anj1Ai2bDqW7IqzGvauKFo4aQi4OJM3MdGkz8Vch
         0Z1sci9hfWr28O6yub2FzXdmllQsrp1W7aJI4eoWZyGgUKugCC+pMqAy/7S2tqJZQxTF
         xfGg==
X-Forwarded-Encrypted: i=1; AJvYcCVkZ+2TGU22DTs9G3WwX/D3E32yQ5IRaMoMdDrTbdQga8sZormYiQ3dYpMOenjKQaj+btUwUKSvTuOm@vger.kernel.org
X-Gm-Message-State: AOJu0YymrzdMFGJE3GgSnKx5iteQDFT5TPwlk3p3tdrLO5CZ15rD/YgG
	U3NngU1VWGaxkloVZ/iind8Fsr3pF52ct8PMaCj9ai+z1wLziUI4hOe8Ym0ZsavMAZ/2ueLiN1C
	wtmecQhXcPM/XwarlvjM099aM6fSrWecFOrSeYSXtKP1tZngStzhEBBXcQplxtTPa
X-Gm-Gg: AeBDievdkaHmoRiYD+f6NNLpN9n6blFVJ3VgpeaYOuBNnistwM/QBhfCYlhmV4M08oj
	GFgJ7Itx0USVCJ0YVOzlWsQFGACoR+WX0/o1BS4iuz1ZfvZVja/KumUqRD3clzPhu3cn6AKjcWn
	fOjuZ2PExMvyAZ18eK2J0IRvR+HPIVrdeDJtUH6yhirZnvBSJDgHw9JfYaM7eNbYJ7X8BXMe4Da
	utTcjk4A1sol9S8vnXY0Le+Dzgk34ow7i55CLQwHt6rLer9g9n9WZ+5oAHjkt3k9/4Ym0HtzFYR
	5WBU3mPXSUNZbOg3dA6YdnuSzL5wCTQ1QE7QXX5bH6gu5UoAgW3n7rdPeZvxT8PF/Kbl+7EYBHO
	ED9SWnutfSWoTLhbgtWO0Zgy8CUpmgZhzvoprVUhPr29Kqw==
X-Received: by 2002:a17:902:c943:b0:2ae:c816:ec5d with SMTP id d9443c01a7336-2b2d5a6a0dcmr15477435ad.32.1775792959332;
        Thu, 09 Apr 2026 20:49:19 -0700 (PDT)
X-Received: by 2002:a17:902:c943:b0:2ae:c816:ec5d with SMTP id d9443c01a7336-2b2d5a6a0dcmr15476995ad.32.1775792958802;
        Thu, 09 Apr 2026 20:49:18 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4ddcda9sm11588185ad.28.2026.04.09.20.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 20:49:18 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 09:19:05 +0530
Subject: [PATCH v3 2/2] arm64: defconfig: Enable Qualcomm Glymur clock
 controllers
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-glymur_mmcc_dt_config_v2-v3-2-acce9d106e72@oss.qualcomm.com>
References: <20260410-glymur_mmcc_dt_config_v2-v3-0-acce9d106e72@oss.qualcomm.com>
In-Reply-To: <20260410-glymur_mmcc_dt_config_v2-v3-0-acce9d106e72@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDAzMSBTYWx0ZWRfX6ijqelmN6Ywz
 sxCYIuVJ7rmD+v3cNkoPrIgVuYUmqMyG2YEIvmIicW4FG43eDoV53DnZ1X4q8A2YSzSP+p3txYg
 VypSo9QSoLI10UIqlpK6AKKOpTGJHwSYEYMJg1GYDa4xe6Id0yFNom3hqp9gUDQWHjsE2EKXdXa
 VHChjW3+fhWYtP1xdL3G7mJJ46qRkqKwJT58WRPo52gh0N4Gby3Eppt/qqtZByHj0mwrAoxNXJp
 dZIdoXlFB8lpzmn2q4pX1sjotItS1z4FtNYrcZlN5ILmIA6fDw9rwE2IAegY4OH+4P1GnvzEKbU
 bpVDEOkN6Gw6nr/TyVRs4Dg+KxRePVnwzGB8y5uxSIGxjJv2gNeAL3UFg6xKlPmeQ32grUTXG+z
 n8v90+8SF39Pt+4MqNK+l8gm1E6R2BEQWi7BxEEsiciw8/mQJAn8XG6ecjUSKRi1QEw+2KHN9u2
 Y8FSG2Ua+ODaBWQuEJA==
X-Authority-Analysis: v=2.4 cv=eOcjSnp1 c=1 sm=1 tr=0 ts=69d87340 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=rO3wVDe-YCVyVCuK1RsA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: c9Cjmi0TuPFTZRMnXJuBPGxVi7fxH1nW
X-Proofpoint-ORIG-GUID: c9Cjmi0TuPFTZRMnXJuBPGxVi7fxH1nW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_01,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100031

Enable the Glymur video and gpu clock controller for their respective
functionalities on the Qualcomm Glymur CRD boards.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 4ed70ab7ee854038fa7a756d8b650a609258bdb3..a607bf49c1563d22550c4b81a237d46fe4ea41ce 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1457,7 +1457,9 @@ CONFIG_COMMON_CLK_MT8192_VENCSYS=y
 CONFIG_COMMON_CLK_QCOM=y
 CONFIG_CLK_GLYMUR_DISPCC=m
 CONFIG_CLK_GLYMUR_GCC=y
+CONFIG_CLK_GLYMUR_GPUCC=m
 CONFIG_CLK_GLYMUR_TCSRCC=m
+CONFIG_CLK_GLYMUR_VIDEOCC=m
 CONFIG_CLK_KAANAPALI_GCC=y
 CONFIG_CLK_KAANAPALI_TCSRCC=m
 CONFIG_CLK_X1E80100_CAMCC=m

-- 
2.34.1

