Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981844;
	b=H3BHONMqhNon8twf5SRcTKGIVHJ18B456xT6K8CknfTq+/Jd6+srDhBtB3t9I3rnXu2b
	 TPkpT8xMyYGZWw/TK0pz1TFROSzAhE7QaioJF4V8wubR4UosqnQD/EoE4Lr7YHvbT469G
	 JRb9etFrLKEd+4aT8Owu52w9CFrZOSlyYRFktXuNIipJOOrtzBU/s8EeR4B5AfxKnj6pv
	 /+vVF3bgePSKffi+i63Iqh+uA0rM6tLRnnzprpyHbv9GOwGbLEkLZN7QJAkP9iI4RiXoj
	 gMH6r0qPsEAEGD2B52NnnpO5DAibDc8d8ODGTHPI8z966LfyOfJ/h/CVh0E2sknrbBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981844;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=d0ZwDTIgbYaBgfjg7LiDdgZsPVxBbkeCINB2HYSUblw=;
	b=JbQXwKyWSTgZ0vdKfLBs4pJFOBRKAir/xzpBPZHKtVK+cZyW34YEjXQheEPLdwQhyE4+
	 Ft2NLn/GAu7Ty7Wan3XcfGpml0p8KU0W0cCo/frWEmr6hawxa7F7wCzlXBTpp6TJMsFk8
	 j5sDf0G8N9TzrEHgYD8zmTE5fxXlGRaghyqKVvleQrjrNM8hq1T7s0VbCW+gyzlDAT2EJ
	 qExVkEw8p++mNMepLgWg8SggXfZJzRkQ6souUjz9hn+X3cZwKCptEyxRR2Fgg7DVz3+yF
	 lYRgnx+nBl1nBGRKQ/Dpc/Xn0iyhECruuWll2J2QUAOucZbTxYwxXBRsPaqv4O7p8eQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ODLzB9Nz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kKFJ1+8p;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5A9606A334
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:04:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A5A9606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ODLzB9Nz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kKFJ1+8p
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI4okl02297168
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:04:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d0ZwDTIgbYaBgfjg7LiDdgZsPVxBbkeCINB2HYSUblw=; b=ODLzB9NzsoR0lNEF
	ZzoB+jPo4bPp/S9ZPjHgDQfiR8lRs4YfiF6K9wgkdfE4voD+Tn5MEngRfXWG0OEe
	or1JoL3J0BO/86N4h2fmbMrFJRDgePzcDrEuq2ijOLzMqW9svSyq9lFl6lqaTEd4
	jR4pTs+yGsBh1TOg4LYOlZuaOZ+esBe/EDvHHzcg87BnYpvsJt3EphedWoFfupDD
	N/Xivm7+zxJQcIXXaUAAzHRs/DnGddEYiE5TKrO+mfUE/FLWPDc8xbD9jbOEpCJL
	syPP1P8OLo0Tx4izNSaskD+SVptgji8jo33RwaXQvZOuSeRPN16hEeN+mFvw2ITv
	6rGWCQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8hfm6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:04:03 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2efdd509c6bso8232105ad.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 22:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794981842; x=1795586642; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d0ZwDTIgbYaBgfjg7LiDdgZsPVxBbkeCINB2HYSUblw=;
        b=kKFJ1+8p8sfR5rqK/G824nBJF6Lwj1LHFDtBJbRxlL1Yxo7VEFIDJ5HH48iNTnqzK7
         bS6qDTcPaGHDvTwbKOd+1M/RCOujeuJzBCUkBaxNClp3SWas/mCde04S/DavsrgFAR8z
         K+ssWDPEswSu7Lhscb77VcXtfjuiMFrCFT0U8n+u5JClNSXZYOX3TGeJQaUaudDzM5cR
         WKDj4xXOQTGHTPOBbVsIroR3JVjl7J8m3lDqcawv51DmVI/8N086UHp9t6BFWjKB4Vc3
         3uEWmKwHU7VgehrYjcWshcCBU8hWI2jBlhYV4UdVkJSZjfydfV0M9RWxJx8L7KsbRg82
         AOAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981842; x=1795586642;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d0ZwDTIgbYaBgfjg7LiDdgZsPVxBbkeCINB2HYSUblw=;
        b=bCH3USEh6B3Q2+yMSr4hXQ6m1HMeDUzfJch/c307KUqcYl2fWWpjXFthCBTgxbYCRI
         TRnpZTo3K8P1pk1dbR1CLuALFiya2PRlsWk4vOVhbVB5eWvoYrEg9727tyyDDwAWtUFu
         jeb8wFMVd0MIWMjyC0BofStd8kGdBhPXG0EmNZw0oIaETXFiChmN/eyXwmJnsmL11U/X
         Y7F82r97wO2Id2Msl937hA4T9ORB58ImB+zDfIynJz2dK5xXk1dAoxV+ZvfbE3qSsyIB
         uGDs5V/tEg6iKo0cYiJaYNP4Bn6+ZWqH84vB8aATkNsit5uaA2K+lbYldiFN1GW6cVnR
         vCXg==
X-Forwarded-Encrypted: i=1; AL+hErEiFOKRZhsqHsHb2x0lLOkJC1xqsoL3WLhyOQExBmRA26bdaOtHTlbkSt9Oho7KTdWMfkAtFzDb/I0H@vger.kernel.org
X-Gm-Message-State: APuU4Z8j7gDlK6mkV4E/31vDPjjvh080k8qhh6abdONwuJ029ETuh3mJ
	YHbsw5RFgD+aHFADs0rVBKl+WqVnxm4yLTCZCxrNppKSsfCd/YW66fKFN8KDiYOYG/kbksgSRob
	DaQ7OId2MfWXP5mCe1Qm24GnmJ6U2ylS5k/rO+qmJEEMkwj4o32cP9yhDTgBASIkH
X-Gm-Gg: AZFdTZeSuei1gmkpOuCsc//VWTWx4eXKZHby6cpx1+WyR5duepKLjPpEyO+DcjGTz1I
	V0rXxTRftfXX/G14ZGy/J7+VEe4nlHcS69gAo8VYySO28546Hmk7WXcQJ9B0H0OIwzOIYKKUBHV
	IONbivL5rJsy6p8T6wR0wE5zTVYVFHiZl8VMRDYcGdvns/rZ2S9QDc6kbWQwy7gIBxZD/6Jur0C
	fksKvQTBV7nzZspFW0ZvrsKr3P2PLUqQLfaY0ZcyLT/7cgRFvIu1wm+DcSLECM4G79doDt1H4Pa
	MF6uPOMeaAeJkU4qgc1SC6iB113hHIog3lMlY8zXR1JFcwp0Q6jlngMs7sJriamz3YRp58QNsiy
	kI/TtC8YTF8NDCdQ1bgAvQUMSne4AanbXVuFg9LBXTj/f6gunAGhy4ffRaPmmyQEpb4p51i7OUg
	==
X-Received: by 2002:a17:903:234e:b0:2e9:4d9f:a65b with SMTP id d9443c01a7336-2eff75424cbmr16415575ad.53.1794981842033;
        Tue, 17 Nov 2026 22:04:02 -0800 (PST)
X-Received: by 2002:a17:903:234e:b0:2e9:4d9f:a65b with SMTP id d9443c01a7336-2eff75424cbmr16415195ad.53.1794981841573;
        Tue, 17 Nov 2026 22:04:01 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62e38eesm7288805ad.76.2026.11.17.22.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:04:01 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:32:44 +0530
Subject: [PATCH 13/18] dt-bindings: pinctrl: qcom: glymur: add gp_mn
 function
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
Message-Id: <20261118-gp_mn_tlmm_support-v1-13-703f7badd194@oss.qualcomm.com>
References: <20261118-gp_mn_tlmm_support-v1-0-703f7badd194@oss.qualcomm.com>
In-Reply-To: <20261118-gp_mn_tlmm_support-v1-0-703f7badd194@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <quic_jingyw@quicinc.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Lijuan Gao <quic_lijuang@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, netdev@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: vjsyEVtZgFLg9POtBCvSMexQdOiFN-t4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX7yEDwcspCFTz
 ph/LmkMtJ49Q6NrsQ6kaQbaZ5ptv3vPUi+R/ZVf1+EMdv712Ic/pH1BZAxJYBRDJfOqDsYs8MFv
 w2MdX+2WbZcGlcK6CRfXIl5bZxSEfZA=
X-Authority-Analysis: v=2.4 cv=c60+0h9l c=1 sm=1 tr=0 ts=6afd3fd3 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=YsnPb_3J17WYr9j2Th8A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfXwBP4H1CTd2Ik
 HKULBa+V3gYHwjoN//S1Sps06isjqSL8JoD7McQ3cd/SebMrmAR2V/W2SHyveBzOKR276wuZRq1
 RRHJJW3i8OGhpsL0pyvWZtYd86NfpEQZAPMN4U5MHGrOoseDmS0P9HRiuSb9B3BVuvoOXq24Oym
 9UoIwmJNOruZgMlLd+CVli5iaubVVQtnLNGMPRvXheeZn0a6mgObMJBXeFmaeSKnFsolV3pZr92
 SIi0zkGNuGOI2h+VxMJCdrjnZ0dLwkZbempi3WPfbfuOsM5m+MkQaBY9Spd2ZOqvBYh1al24o3J
 0nzqIkd7uJ0B06HQ/BI/YgwQOzrdOTyaQpmFnUR0+pktT4m97rdF6kFoUDGUsajN7Z3ed26LiLb
 Pz9GvYkQDZk+qewf/O3yndR/egRGHwrE2kxhGy/2afhuGBihUrIB+VrcAWTvNY6xCaJVfjcLzIO
 d9g0o9gzxhNWkbwiYpA==
X-Proofpoint-ORIG-GUID: vjsyEVtZgFLg9POtBCvSMexQdOiFN-t4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180023

Add the gp_mn pin mux function to the Glymur TLMM function enum. This
exposes the GP M/N divider clock output and is used on gpio53.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml
index 2836a1a105798a8bb5a38244f7cbf8db350b755e..6bb572640256d3cba2a6dc7571acba85dae57440 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml
@@ -75,7 +75,7 @@ $defs:
                 ddr_bist_fail, ddr_bist_start, ddr_bist_stop, ddr_pxi,
                 edp0_hot, edp0_lcd, edp1_lcd, egpio, eusb0_ac_en, eusb1_ac_en,
                 eusb2_ac_en, eusb3_ac_en, eusb5_ac_en, eusb6_ac_en, gcc_gp1,
-                gcc_gp2, gcc_gp3, host2wlan_sol, i2c0_s_scl, i2c0_s_sda,
+                gcc_gp2, gcc_gp3, gp_mn, host2wlan_sol, i2c0_s_scl, i2c0_s_sda,
                 i2s0_data, i2s0_sck, i2s0_ws, i2s1_data, i2s1_sck, i2s1_ws,
                 ibi_i3c, jitter_bist, mdp_vsync_out, mdp_vsync_e, mdp_vsync_p,
                 mdp_vsync_s, pcie3a_clk, pcie3a_rst_n, pcie3b_clk,

-- 
2.34.1

