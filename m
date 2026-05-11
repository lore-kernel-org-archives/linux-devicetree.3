Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68EB73F0A88
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 14:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778510235; cv=none; b=u0F2YdqmjTGPw6oDZ/CQk6xHUapd3/1w8S/lkH8jSZpfZ7zeMhtpkVfMLX4FabR78JLPw99MMFl/MlMDcX2sALDr9LrfXAHW3IY/STyagd3BemKGZBKaypwntDJx3QuAdCc9WlY40GOaJn2aDRZf+XAfsHfJM1tikwYqnMHWV+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778510235; c=relaxed/simple;
	bh=p5Kug1tNLTgkIN4VM5MK/PJ60rtDv5/qU/L69mB5lIk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=SnrtkTPz0XXaVeXq+K6mFkvEKQaMVO9xfJ87Rs0FmJruJMa+xN0CN5xweOkRYC5Atjyp92dzR1tAHc8fC7pPux7CtXqo4ikP6+91p8wydmRDB2QA611bVgu/dHgMaoZIUmndX4Vq4p9ab9n0nkN/XFz3DIVSDbrI39uTvaNc78g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rrh98Mne; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iOOcO67R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rrh98Mne";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iOOcO67R"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B9JhQi654469
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 14:37:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HULKX73qzdciugZvR3HKlS
	qQjAScB/2pEIkvEnaSpo0=; b=Rrh98MneRojJoTERz62lWZ30sCZKINFg0qgPWf
	Cd/7vM6h+Rk4bIFztJlrgqy7n9f994HKe/ATF67wDo6XSUoXas+FAC1oq5Ukti9c
	lXpTjI0t9KnEnBQi/s9TghtZcaHOdM/6CEtkfWH1wT1wCeaOOxuH0TqhCWcED9r1
	XSiNKAA+g0KMTxT2r7FtI/5NKP6Rjw8fArjkbadXbPig6Q7FaGh0sh+opuMj8sIr
	1BV59INPD8cs53HgxR1qHkAqJ5/FaCI+RyG8VOlDsNfTtqNSHTReoHuU9iBtXPmi
	MJoPx2FYWJ++mYBG5xaU7yU+JsvNhbS1512jHXOMR5kXwzJg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e37xua6j4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 14:37:13 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36781927b4dso4900551a91.0
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 07:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778510232; x=1779115032; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HULKX73qzdciugZvR3HKlSqQjAScB/2pEIkvEnaSpo0=;
        b=iOOcO67RRlnoWvpHl82Acy9F4TBvv68Pr+zlYBMi8pRTol40tp59qxLjoZttj7JY99
         wF8SyTk4Y8+lelZMA8u8XAfL6r7lnVXBRyHz4FI9/N9Slavh0OhkBZRWeAwIr/uLL+I+
         ZWzc2uSirX8QY7mxBwBUCgNDOJMhEhW7Pr0WdMXijzYomVHMokuweMrjkvxq+bYCtO8B
         I7X7cQzP/z870tOUTemnt85HvV9EhZ0foB5MrjwmJY7SGAvT2q6qXJ3g/ldwh5PKMyDK
         wzf4INwCHApfhPd5bcyBvahO11ocH+TqrEt+XEo9ptVAUS7KS2zCP+NyROxgAev6JUq/
         MgKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778510232; x=1779115032;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HULKX73qzdciugZvR3HKlSqQjAScB/2pEIkvEnaSpo0=;
        b=dlrDq+szrcslj5uC01jXKoCV7F+hIGAWPPoxkJC/uz86NpFWlAMEWlAK8nVrXLaYjy
         png6+XpSM3vfZ4ghwTH/V8LHDDTUbgc4ibkD2BdRCTYy9N3k9x6cwaPSCdP6n9I3zEcO
         5TnAvQ1BfIonduBPQHT8T0YSEe7hCjKy5rKhXdlB8CJdpmC8+kSoXk8XQiffyKqkQh9U
         kC9ewQnpW9PugBbcWY7EnNjNiK2lAA9mVRZQFlLfMHWq3YPI/fp431kXf9v0rfH3BtT+
         it606uPIT+/tPiabdaR7gYNVBm+JWMa+gP96UYwNiOOXYDwBAnSXoPCJGHBDzq50zcg4
         AxXg==
X-Forwarded-Encrypted: i=1; AFNElJ+EY860JC/6q9T3ZJOcO7u6vDUlEaFHGYdtG/2rb8vBEbl76jGfBJvUuAs8bDZWdeLOoEovJq/tBlB2@vger.kernel.org
X-Gm-Message-State: AOJu0YzUr5Q1yyNRznUNBR+cR/QX7oBG0kFNpzfOxl4BAm5FSMI4jNF/
	LMF6LeUnRKxbQsY/xa/aYkEoSt1+c7Sz8B2mu2dws6mk9Hp4wtd3cqCcWuXFy6+mvBiz0b7/Cwr
	rlAXo5DIU/wiN5yVyY3tlkU+F6eUWIqKsWXQibyioLY+YEdiZBLcB3AjSkYZ/EwVF
X-Gm-Gg: Acq92OEir8O2MSEFUTsmzrZRn9M/WIDg2pcRe/zgRQ56V88+ZSq8xLUu27gx08jQ4m9
	9AR+afeShXa4PFNymEOtK+rmPFZwc/TsemeD+lvGd3aik0KJa+hKc7jFlNU9wRK1DddBsY96y+I
	5kwiEbZ/O/h9Yi5jOGpLF4c/iDbxlNuKCVWOD1lWcl1JJmPRh5SM0IlCtudBn/abkpL9o59Ixar
	L1iVFNMmF2du/G4dwjTLgVacoJSWzdFmWZle0d8tKbTnrX/d+PPLFslPRAWgRYhVEdFoaQa/nTo
	O7pJfiCS8IWe3NA2jEwoo3ly7lkTWYMP32bJ9bPrz/npWubYrweDOq+ec4VFMp7jyY8coq/WX1M
	9UBlIaRWUFUCe3NjeNFVkhW7VPvo4HT5drKJcpUnRbvFVyA4iYN2DIlqNbDviB0iQXN3RfzJcBz
	+uWopjmRAkcodEUf2qat4BaeJIONFjUFaS87vQRI8gHObyrdWMNiUDG3nCyH5/m7Wg89M=
X-Received: by 2002:a17:90b:2248:b0:35f:b348:63e with SMTP id 98e67ed59e1d1-365abbe373cmr25939268a91.9.1778510232362;
        Mon, 11 May 2026 07:37:12 -0700 (PDT)
X-Received: by 2002:a17:90b:2248:b0:35f:b348:63e with SMTP id 98e67ed59e1d1-365abbe373cmr25939220a91.9.1778510231745;
        Mon, 11 May 2026 07:37:11 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367bcbac3b6sm3059935a91.0.2026.05.11.07.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 07:37:10 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 11 May 2026 20:06:56 +0530
Subject: [PATCH] ndings: watchdog: qcom-wdt: Document IPQ9650 watchdog
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-ipq9650_wdt_binding-v1-1-d2779e756bf7@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAIfpAWoC/yXMQQqDMBBA0avIrA1MBIfaq4hIk0zsdJFqYlUQ7
 260y7f4f4fEUTjBs9gh8iJJviFDlwXY9ysMrMRlQ4UVYa21knFqqMZ+dXNvJDgJg0LyDRlyD/Q
 WcjlG9rLd17b7O/3Mh+18reA4TmOUN453AAAA
X-Change-ID: 20260511-ipq9650_wdt_binding-06f96b6d80fc
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778510227; l=1074;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=p5Kug1tNLTgkIN4VM5MK/PJ60rtDv5/qU/L69mB5lIk=;
 b=ku2iuQdaoyIH56leKRoFmsG/f+nB4AUsdzOR/gXGGTMazNIg3fpjYwO9GSSyk6FQ+Uz/X26Pz
 dWD5rSIa13vC9IwF+qQh4aDGYwPl5E4f5DCb0v4zGPHdvkLBiFlSpDZ
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=EcL4hvmC c=1 sm=1 tr=0 ts=6a01e999 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=w4RUFeMe5Se8zSgF3B8A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDE2MiBTYWx0ZWRfX9Gygz4D/8Tef
 KOASqBhE7dBEg5lbZ3V+PQ8FchI4coHFD5AOmbVdn9kuHAuG+yQHBRerxmiTbvAgxaZ8CSm4qiX
 65SjkLAhNAFpZhbSncH/Lo7If6qviwXNrpqYrblOLons32Y9nfqdDnzR+zyvBuNrjI9WhhZhzrk
 m00NJ9x1ABTz01txlTEl7AXRi8DyRF0qm2X14tEjd3mfmVrymK2hlo4/oq8IFWUUdtdv8tNuWFb
 9IGHRp8X25pI6EUGzywI94zgzz+LvFbB4Y7xviqW9hv+3u4sfRETN8JURGWZ+qI128Z3DYg6TIY
 o3XWhbo+N7DZgYV63oWyKQDQZkwhurPNyA+l7AZJvbGO5Gx77HhA6R/9MXmFRjXoeVB5Rk56Zzz
 F7/j5Uf+/BJVFgUbB+jwtpVThhlVov235eo6nECGDlASNV2ips5u4ZkPLy7Lqz/NnETOFHvacu3
 1yDHoD0C+tFoNmb5opw==
X-Proofpoint-ORIG-GUID: AJXNT-VM6qbJHU2V3116gugVgFNtOrTp
X-Proofpoint-GUID: AJXNT-VM6qbJHU2V3116gugVgFNtOrTp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_04,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110162

Document the watchdog device found on the Qualcomm IPQ9650 SoC.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
index 9f861045b71e..54b2378525c0 100644
--- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
@@ -23,6 +23,7 @@ properties:
               - qcom,apss-wdt-ipq5332
               - qcom,apss-wdt-ipq5424
               - qcom,apss-wdt-ipq9574
+              - qcom,apss-wdt-ipq9650
               - qcom,apss-wdt-kaanapali
               - qcom,apss-wdt-msm8226
               - qcom,apss-wdt-msm8974

---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260511-ipq9650_wdt_binding-06f96b6d80fc

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

