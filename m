Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD3429E114
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 14:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777472167; cv=none; b=m+G5l/oVSMj1o6lEvEvn0d65W3IFDxgNnvgj0Xxlghy6al7/HI/c2rfIuvYkHtf3BqYHZCmJXD13Os2iKeoDSJFhhXJY1wf2gOn8SlBCVdP8I8crS1T6ihcmT06xhOxYaADvY2nkY8NC8HWPODSN14EQQr4/MjMjOITGiBswl8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777472167; c=relaxed/simple;
	bh=p1psAY240TWjrNT/9/A2dEWv0oKUcybspgY7ZKfLuuc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hxi5WXT0RSyEBe1/uCsu328mRrRXEY/CDfXuQOmn0yWpLjlGynn4Kgt+AFG/uNRtdmJN7BLo5UTXdtBBqObr058uEIyxCmG5jlCJ2/kLYYZ4juFLL+2AMN6h9o1+pAXPfjCKw49BZpJmvroc0c73tXUR4zusH4wfniTm9dEeT7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lLmtZVB+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZivmOOOS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lLmtZVB+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZivmOOOS"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8pvBt1728671
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 14:16:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kMmu6Z1AbggkXe6d/8V5ix+QevuBAB+OmmG2XjWhkEc=; b=lLmtZVB+ljGYLIap
	DzB9ITB3OjLrgvcLtIZ2KJF8hMFWYGod1IzWcVKu6JmZHXouJBcNCNfqYtL6r8vN
	OlEgvocC7HV8nwTctrOFuwk0Q3JKfcKnetMvIO6nrM+u7QGT8eDgooBM+OyC56mO
	JBDcXDXChsxCp7utqjXhHCli9VUCUHEGsAKr3g68MnUFxMG5TJmZg3AKiPLJGajd
	3DaPm6pd3+i/JDb7HWhSxcVXGmuW0rF61uqnxT7vXJpz2dKNWxVYbQXaIkMwD8k7
	MSpRxot9k4IouIUeR9NyM6N5bi153EtNwiG07juGc8mfCZxGnhkFiqMMW9sB9IKa
	YPT8CA==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4due5kscpg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 14:16:05 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-651b8f743aaso23256390d50.3
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 07:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777472165; x=1778076965; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kMmu6Z1AbggkXe6d/8V5ix+QevuBAB+OmmG2XjWhkEc=;
        b=ZivmOOOSvFGIqvMXa88L6CPsebBjKmZ8Be323Z/RXayiuQIIGH0DaYqsATcZq6tYIp
         Dq4k3BpILOeJSqdt4s+dY3fLrWzC49WvhGoQvRM7oDlaqbzR2DSjyhMS4XlKI4ZAByUd
         uWQNW+c20KiyWt/Kd6OFj4UZ2D926fgNsVzBe7QW4uwKJOx0mT5dXJkaocZu4ll2PIxx
         WVnmVs9kKI6v3axE9TnpcoaJzS18rLUjz4Ig2Ki6WW3+zw/PzZrwRaLHHvGshFGwmIWg
         ZNr92PFWKOzOIvFO2fGuDZdbFU4OGQ9xQC4+/FaLxLnwfXqJsGTWo0tm9FJ1ZGvtdRrR
         VuBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777472165; x=1778076965;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kMmu6Z1AbggkXe6d/8V5ix+QevuBAB+OmmG2XjWhkEc=;
        b=cVwOvFII2rcpvADEqs0ZA+FtLIp1I+hSCtoU4/SsEVwPxOGXcMMGeLQWzHMB0m9Exg
         XCrLg/RVR5ltYwxDm9unnJJSGvGiwHMipGgUDLU2Wmk/q4SJk47KIeaEG1JguqsUWflO
         DhwDSjoOMuLEiTlanvB+4Yy7LIPxhmKaHa9l87nSrIbJqj3qNky11+ELrotcGGUt231B
         o8W6Gw9/v5zDslBBAK6ArMX/Wt6b2gu9ykfq/xpX2jp70/7rQ/IF46d5l9850tuYmk/q
         9SYtF+MQoXulI9fXiHVgrdVmNIvGtDtSkoKZi4EicUHdcRzDYVx8tQlyyVp9/LgMqH2z
         sEZA==
X-Forwarded-Encrypted: i=1; AFNElJ/p7PMn35E6Fz0vKtxAGiLUt9Ja5RA9FdNtjV7N3aQWGf6HWmeg6PK0NX4onarmOfSI2EsvpC15JNIZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6kObTcJoEQOZQte8Nchnuz0Ua2C9M8KuFSUa6M4niYSm361xA
	cKOGVA/R2ZkLM9OKtWeBm7TPrH/1Bobogmnfqqw/Vxj3sRD0zTEvtI7/R8XU6PAoB99XrS029TQ
	GXHjhlPJyISrG2r1az+DKpu+Z5fmArViym3SYbrGVxMLgAjMCNdZxfMA8fTnVPc22
X-Gm-Gg: AeBDieuQDDB0RI/9XcwhUaPbGMKQ0Z5226VmXf4UFKEJiP1pDjtZlEqEqo9qCPd/eSh
	O7JhkjoY81Virs44rfg0Vd2SK3rgUy65o6SlQf6unxYrbzZ2j93yf7mQddXg8EwCP9O+3WMkzQA
	A963BMtXQpYXyJNAo+elvVUsw7e2xnlWORN6OA4Aw+n/oFzZyP+WKiUo0i9GrdmLnVRa40EvH3B
	dCaa8HLvCHZyDtYbIZPMSInRTlbNWYzm3mhMVRdrcOF/eSqYsVC+yqaMfPBcdXPyUAyU8SfxoaG
	KcYjrvQI3vvJxvKuvt/jDR5cuHQMCdnMcc65/NaGNuUYYCLjaZfg2LEFp2l3XJ5HDZ/jhfQJux4
	YBZ4kogr0D0oSnQgHzFWi5qHLCY9OUXZtLDp06TwdClit6CbbP6S2/hDlQyj3iY0=
X-Received: by 2002:a05:690e:438b:b0:651:c6e0:6bdb with SMTP id 956f58d0204a3-65bfb5f9cddmr3360826d50.18.1777472164405;
        Wed, 29 Apr 2026 07:16:04 -0700 (PDT)
X-Received: by 2002:a05:690e:438b:b0:651:c6e0:6bdb with SMTP id 956f58d0204a3-65bfb5f9cddmr3360759d50.18.1777472163749;
        Wed, 29 Apr 2026 07:16:03 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65bff2c2eccsm1379533d50.0.2026.04.29.07.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 07:16:03 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 19:44:59 +0530
Subject: [PATCH v2 4/4] arm64: defconfig: Enable CAMCC driver on Qualcomm
 Glymur SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-glymur_camcc-v2-4-0c3fd1977869@oss.qualcomm.com>
References: <20260429-glymur_camcc-v2-0-0c3fd1977869@oss.qualcomm.com>
In-Reply-To: <20260429-glymur_camcc-v2-0-0c3fd1977869@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE0NSBTYWx0ZWRfX6QX6P2PRWFGN
 hfaQihT1koLcwBk6kEE19Mw7sGabtX6cNk6QbOd8+v8MKTfhsOy79B/av9TmW6mkuHVeRgn3LT9
 +VtjznNcuIyae2rQ1TxNb0AUMFg1eDBMrjfc18R0KJOoXrXHtUUHF9o40N7YqFuU2uInXaebC6i
 dW2tMX783ORiRoEyRlyMrvo5WMwo+YXbh0fcIwFlYa3Cc5/MCm+22ssYhHYanXDuMG2p0OUiX3F
 yDwRFxUN+ozD3f3PT6KH4Il9iMOGFL+yd8eylIczrYjD4aWuVPNLwJz3C8IHv8ewnkaotVKCYYU
 Xj8JHQIyfl/i2hwKkxuNLHE/C8wzGJkTY9PhUs2/wzYSsOQJyWTQKOz7KNGsMC7W8h6GOJ8lCW8
 hn3VCN3ex9OqPjn0hc7wDayEIvTHnucYeECr65HWi6qYzlcmnRdyVGqKeoStdQAVfHyvOWnO62e
 s03kbWeT2YR2u/yUB9Q==
X-Proofpoint-GUID: OAXg4D9DIDqQbNh9rweDaLVflXekYiBh
X-Proofpoint-ORIG-GUID: OAXg4D9DIDqQbNh9rweDaLVflXekYiBh
X-Authority-Analysis: v=2.4 cv=CL4amxrD c=1 sm=1 tr=0 ts=69f212a5 cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=2tOI7iOMnFxh-ToW9usA:9 a=QEXdDO2ut3YA:10
 a=nd2WpGr1bMy9NW-iytEl:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290145

Enable camera clock controller driver for camera functionality on
Qualcomm Glymur-CRD and similar other platforms with Glymur SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e44e83bc57812aaed21bff1b12d36ae4a373ce11..f5aa905a6feb48e7d65dbf076f778bcea54aef02 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1478,6 +1478,7 @@ CONFIG_COMMON_CLK_QCOM=y
 CONFIG_CLK_ELIZA_DISPCC=m
 CONFIG_CLK_ELIZA_GCC=y
 CONFIG_CLK_ELIZA_TCSRCC=m
+CONFIG_CLK_GLYMUR_CAMCC=m
 CONFIG_CLK_GLYMUR_DISPCC=m
 CONFIG_CLK_GLYMUR_GCC=y
 CONFIG_CLK_GLYMUR_TCSRCC=m

-- 
2.34.1

