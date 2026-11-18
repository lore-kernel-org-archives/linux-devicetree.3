Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981808;
	b=nefv3eaWlYJe7O0+7eYWTIAZa/j9XpYgfR9mOWn4pcIoEwSTO+yOWjB8qwvoXAafjK5e
	 f3tioNcPRWL0/aswKtmZExucCB6vmFuDCyKqHeSzON4O22kJRv2gTy3GVlyGIpCc04N0g
	 0ljlGa1uzF05XbtQ5hju7UnuCBmO8C/jWv88eSRSbUn3zgRAr118B+YX5Fhz+9QDAtytn
	 5R2Uq01ES+jOF1T7KjPRYo5wAOTOQ6mvE0IbrIAesZbxyJcPOitg/OhDDULRwdHReUlO5
	 NCHM7bP2z7knuKvTmZL8OlQ2dfVC1oQjL3CLjVNP0jUzn6u34o0bzXO/Izs4iF31EzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981808;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=BTcq6Yk1TfnlDEBHf00jtWdtH+xxPxFHHxDQe3rqWEE=;
	b=rQ5oWmcorqpGug/KIJzSJdWO9S+XqRNew9mfbUOIGf9WQzFfyDYSPlc7InkhMpm2GuVj
	 /ap1YwOWQ/U3Hx2+sfbRQPLC982qHLGLGp8rrrz3N8WGv9lV9hF/VVnXHUCShCFaKvlsP
	 1e49dPw8AXpuKz3z7cwiiDukxip5EDjhtfn4S7TQYa7CO6iWV1YnvYxr5hF8s2n1/nVs/
	 tu0oa5bjSMuXuvsetjUu0jaAtt1q7zEwdB8SMoT3mcVHm9MBAuE0y6XTmcyARaPLVPk0f
	 yzpUxXMxdUlX2ULSCBgo7kcARHr0UzjuDUkYvPo80imCwwN2RsmRhN5Vv03NVlWUZyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="csZl1/Gq";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IAC7bR6V;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33B6606A32C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:03:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A33B6606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=csZl1/Gq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IAC7bR6V
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2WA0V4060197
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:03:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BTcq6Yk1TfnlDEBHf00jtWdtH+xxPxFHHxDQe3rqWEE=; b=csZl1/GqXiGYJtqZ
	syMkGj47N0vft8Hrr+hCCoFG9J/uxuOFskOzYjZvPI25u5DeStP0ATnZuNBnDcM8
	9wf69nulRESftniW3cHL3S8AAGY+AW4EYNsl2HDrdpHtSZJEqgtu5rGdDuSbTXzB
	AUdFPnbo0eYrckieoLXSEL9mDas9wvJX0VeEn6g4qT39kNVdQckTdx0RAbk+zLGU
	AG3lOs+gkv8rrEAanHadB6FrWR0PUuePlDq/PhYg2MHVJjANKyO6oq71C4GGjSM3
	I/X+QNUB8B8RfgHNuhmG5Qqn6wqnc1nMZchi3YczfZTHgfpaMUHAJm5Rpo4QQ4RE
	fHSrRg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvchg45-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:03:26 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ea71803effso5883945ad.3
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 22:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794981805; x=1795586605; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BTcq6Yk1TfnlDEBHf00jtWdtH+xxPxFHHxDQe3rqWEE=;
        b=IAC7bR6Vi54NOfuF6rqZ6fSn75EagmUuGa3DZwPN0BlIujuBzmxM10Jq03WP18mBeQ
         1RXxGM/mfpZP4+y80vC0rXARIZvqPgN6t+0rkh0inXfejDdhS8fOGtQ6wiGYTgKI6Di6
         aJY/9t9HAbt2YsA4UfSzl/Ec4MY61hsZwbr4JyEzizectpalsaVGQqafeEtk6uMOaEuH
         0eRzyLhxzR2VKIOqPe4IrnyARCgelKntoTH0BMWxGZ4yiM9/zdBeGZKwHjeDbgAGrVhW
         lmKxVw234KXn6DgjS1ZliWxJHaDzWaLNd2+XKDxbkDKOP7qS7Ck76H85/zgK/kB9RAhC
         QGlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981805; x=1795586605;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BTcq6Yk1TfnlDEBHf00jtWdtH+xxPxFHHxDQe3rqWEE=;
        b=RUpQrhizzRTBm6hNysasmYw3FnawAWIIIi2Guaoc3Up2kgB6wQgkFbuxPgVuvkVhff
         wohWMmVIWHcug/O70yg/SBGh/INiQrUBBE9q5CDq6XCoR1xjrwxd7NoC3azE2VYgaRd2
         LpC5PWNbRTZsTGTIQsM1V95dSA3nJpS+jdARV4D/arkZnuadXiBCfinGcHX63ITcl6G3
         MFWq28dnqLCn6h9P4pMozvLsq3s4eZ6pAOhR0UfGnT3XMgOrokUfVyW/lbimUiaJJ0Oi
         xTef787aMX/nNVY8rzCLLTFIr4tgZKu+2gHKiLHkVbZo6mR7htrDWzBDncy8DQN/wfJ2
         CkyQ==
X-Forwarded-Encrypted: i=1; AL+hErFC3jwKU0aUgJQPIURwhkepghF+tfFXc/FWRS0J8e2Jp36KWgiTQvVOAi6pb59nTa36lyM4wNrozuAq@vger.kernel.org
X-Gm-Message-State: APuU4Z9ym79eiXmc4cpRQ8epWwsVsTs5kw6z0mB3B73zQsjE5n1RW3TO
	SnHWAbpveEu6y2sKmDUD0Ev8Db7RwC4Vl8x+0B2i6WJsJdDtej8Tx4cU0r8nsRFZgBFgIPzU6A0
	Ni/+nCAj/0vI2wU4Y01W7gdWVHln1Ceb4F8cNy18qoFJ+RDkiSHYAsiGXgBz0A0Hu
X-Gm-Gg: AZFdTZcz9shIiwSSeI9l2E70V6BglIiqQpWoF9bOSWRTP/Hi55HKHCl/DCKR5jhWz6w
	ZREiPPOzfpYHiwBo3NCyJ7FU1OvoYWdocPWRLU1E2nNwaO5sSqa4OymYECqiDz2wNdHRACtk6Sd
	8KUp/j1/hO47HPJBhDjeGOIxy12ZVE9r2EpARYOmSjkuwNhT7kJ9ZNy8s2rZ4EpDv0aKL4hzo1w
	SmoXr3kzS6Mvii3vzssIW3GeJcUgcsN5/rJSKrkYqdwWqMpLNcKBeQoNulCx/O9SgQdFMtmU1Qt
	CYKbtABdXyPcqaMoI+wT1wmlqIpUH2vYKop0Lgm7t/M0OtI1sK6Z1pN1EaR7TmF1SfeAwZdpY6p
	YRIrfgaHFdb4ewYxGGTU/GfHW1xoNI11bTFw4qKBpOF3DrXXSWJPm3q0d0y/xV+5Bzror4n11MQ
	==
X-Received: by 2002:a17:902:ceca:b0:2e3:1bb4:6121 with SMTP id d9443c01a7336-2eff7541959mr14868345ad.49.1794981805127;
        Tue, 17 Nov 2026 22:03:25 -0800 (PST)
X-Received: by 2002:a17:902:ceca:b0:2e3:1bb4:6121 with SMTP id d9443c01a7336-2eff7541959mr14867995ad.49.1794981804661;
        Tue, 17 Nov 2026 22:03:24 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62e38eesm7288805ad.76.2026.11.17.22.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:03:24 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:32:38 +0530
Subject: [PATCH 07/18] dt-bindings: pinctrl: qcom: qcs615: add gp_mn
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
Message-Id: <20261118-gp_mn_tlmm_support-v1-7-703f7badd194@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=R5OWitRX c=1 sm=1 tr=0 ts=6afd3fae cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=5Of8VGKfJeO1p_vZ4b0A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: QOgU93YutIvfYnT7M9s7rYE7MApJR1Y2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX5DEDVJXkwzvf
 2lZc3zPGZcSR3q279EWDeO2P8YHSfMbviqMllQ7xVDpNrMs5KzkVTEwMm2l/QKbrr4PMvxoAHxF
 XqfbXMb9zQ6MLTAGBGVSYS8swQKHE84=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX7ezmBPGRkMH+
 dVlcPKOROL5rZK4TSh9egm5TG52DxTe9fwKUmQgEfkR8DLHmU05jNusQcgBnVfeOkSxKukEe7Qm
 84J8UmmKxSJfQLYPi28wsJXBS3KjegKcJj0UwddPx5rIBNmUtKzlOeT9HSEP7QYvooon6xZGPSg
 k3bpSqlrPffVPM+KEn0jZHFBaCR58njtMuXPxVOTbSQh4cMUhCfGxHLwBzeHUn+rTXt2vKt7WJE
 1+j3OjkZOTP0vUHFj0gDWuzKexYfvg1BqpI2sd8S9PjFfafiRelYN8rBL0kECVhPgEIZV95vSFM
 kAWWbT51csWRcPExIJD/n2Mogtb82Np2sfRpS507UFNdX5CuNxWsA99ZWl90ltW13dNnXGcwncH
 CyoavZW3i+VmttngEFqm4EVkzMY+7KPXjIh0Xc2gdaP5IwBJJDtxk24YMSo7DJ/F9we6j6qTL6r
 aS23gdSC0iAol7mSsfQ==
X-Proofpoint-ORIG-GUID: QOgU93YutIvfYnT7M9s7rYE7MApJR1Y2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180023

Add the gp_mn pin mux function to the QCS615 TLMM function enum. This
exposes the GP M/N divider clock output and is used on gpio29.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,qcs615-tlmm.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,qcs615-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,qcs615-tlmm.yaml
index 2791e578c1ded3fc1b839c59fa1d8c90df4d837e..768f8196032e01979df6ed39c2036c2aebdf3905 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,qcs615-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,qcs615-tlmm.yaml
@@ -78,7 +78,7 @@ $defs:
                 atest_usb, cam_mclk, cci_async, cci_i2c, cci_timer, copy_gp,
                 copy_phase, cri_trng, dbg_out_clk, ddr_bist, ddr_pxi, dp_hot,
                 edp_hot, edp_lcd, emac_gcc, emac_phy_intr, forced_usb, gcc_gp,
-                gp_pdm, gps_tx, hs0_mi2s, hs1_mi2s, jitter_bist, ldo_en,
+                gp_mn, gp_pdm, gps_tx, hs0_mi2s, hs1_mi2s, jitter_bist, ldo_en,
                 ldo_update, m_voc, mclk1, mclk2, mdp_vsync, mdp_vsync0_out,
                 mdp_vsync1_out, mdp_vsync2_out, mdp_vsync3_out, mdp_vsync4_out,
                 mdp_vsync5_out, mi2s_1, mss_lte, nav_pps_in, nav_pps_out,

-- 
2.34.1

