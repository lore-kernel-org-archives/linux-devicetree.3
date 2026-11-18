Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981856;
	b=snYKiGB4upCG+jIHbfq4ixd2W/ORhz3gYZnkY/tlgSyiVfZvQEsqxrSJ2+MVYOixQXce
	 kSt/5KOFkjWks+HPUSUGrB3XLrRGDkjv1/hmbPHm5jAzGPHE9WZsbKV3YQXtIqnO8HMDW
	 rByxEyvdNhk6FXC4wTr+GQBaKRyfLD+sdjc2A3r9D38yQXmrWvl03HP8o/UUxIqICWUYK
	 2JzmN9YSYu/N3nC/Rhl8QLOFytmfEwQo4ka4Z2sHyB7PS0vak5xApzkhKqVjN6PpUExqi
	 P06BchI3L7ChBk6BE/wdcq8ObH+EFbR4bWhvLc5K+fDD5R8+tecaYIYhoUbCVRLJCOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981856;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=JmMgwWrlYArqAJiyQP0GZ/j88jfULxmPpmaBoNWMxCE=;
	b=Sfz7p5Hj3doMs0K3cDEZf7nU5MuytDDX5Ji3PB0GNgSkNj2ggj7mZRchFlktCR98VaW+
	 CrWO0pl2wo9ItGREh8kXIEWAkhf6Pt6cprYZIfmIcxCX6dethDBvl2Nbq4RdEUzPqtFgE
	 7QXy0h5WPVYm727AYwVOVSi43MPfa4mxlxp+ET0HW1c7DoLcoRgu1sqOQpWqGhBgXBAlJ
	 tDPPFhGHsuf4bF9PdmqF2e9ru1DigFRr6V1MlPto9hrtB4gWJSVBMgCvZYdx8kicX83C3
	 wyOn1msom7SMuJYh6K92OENT1VDGd74+rxujWfiDMlwV3DU4j+36BwcAJMPuiF+gThA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aIBxJlhB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WJADAJ6o;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA6E606A325
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:04:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FA6E606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aIBxJlhB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WJADAJ6o
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UxTU3121718
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:04:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JmMgwWrlYArqAJiyQP0GZ/j88jfULxmPpmaBoNWMxCE=; b=aIBxJlhBUfMCdaV6
	jD8F9K0/I+x6B19Hzu4zrUUf7D9lennCZygcKOdXpbPaqYe4SdJsJtgURwwevFQL
	kAvVDvFZKFEtZFZ5tp472eDejH0FE1J+oDew8yfZihjGmtZj4o1SUKvXDd9NPm6K
	d5KtqrLsZcNAqg4yorxsagrzndxBKybpSiw83F2stPUR90/pwLvxBTCKkcSoY0s0
	rJR3B6yMTHgi9MG9wJ0Eu0eX984DW0mx15+T0FNJY1qDhH1mD/iXcMaMoN95uwcT
	ig5kkY6zAlMbTNwsY1DsnrWN1qchn5n6YF8DUMZdenfO7lxuDhHNnBuvunGLp8dh
	4y6zMQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9hegg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:04:15 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2eaf3f829b3so5690075ad.3
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 22:04:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794981854; x=1795586654; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JmMgwWrlYArqAJiyQP0GZ/j88jfULxmPpmaBoNWMxCE=;
        b=WJADAJ6oMzy0/U9oV6a5LodDvgwvaykgFSTFK9y85pZovcLAScxNihkrIOP6m6Mc/j
         obZZyY60bfJY7Ulb1Hge2IuGY7Pv8WpIOR4CmjPj3BollB3yxZHDuWsLCKoUYRfuxHjf
         4CisZ+dK3/QvWea/hbH6BK5M6TE8QJv/vxzW57fGi17ragUuCS/cUEP2i7UZgfDOuhy5
         bjqUE/bVgaeIchk8R+Q1IIFYMTlr6DStyyxpE9XBx2mfnVaCYg8p6WODU233lgbXkbZ/
         yEjGN1IpXA1O5dIbwt1nhhSKWukNtBX3MGhOvDHxFASGUHIik2uSAwhLSu8n76h0dkTR
         x8Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981854; x=1795586654;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JmMgwWrlYArqAJiyQP0GZ/j88jfULxmPpmaBoNWMxCE=;
        b=Mgq0m/xNHFt1ZBgnbIvg7yJqJHrIRvQHYWSUTcWzC0yKtkXYqJM2MbyiFrWCzCnUl1
         gZ9J26sxIckUYfFveLhxmpSk2i1D/woED1aAmlHJHjPJiFzfnugolmAAqIssUzKyP1op
         FAW+tOntDHRj+7d3k1yARLzTFRLsLqt4UwxyYkdOZf6IP4kBDT00NpRIYQPOOk5EozeC
         Vw0zITIIqt6mUZf66EMuklcJaDfNGTrvDuaPVhPhr0w/5RjDJ+v1UZE4j3y5fmjTAqFc
         Qi7IooMCaN83ndduU/5Efu+l0+I5BkYOP4OjabTZXkRFc0Fv5nvIs1nXwl7jgANfc9W9
         ZMug==
X-Forwarded-Encrypted: i=1; AL+hErF3ykblBuPDNIJIFsDjTFJR/LlNUGkuNOf8kkpGyCgVdxnT6cuSN8Mj/NnZMddMkVlZtwCLTbO5T3Mu@vger.kernel.org
X-Gm-Message-State: APuU4Z+H05nqIEcGSlru4ugWkICRmaH9PpwAY/+bzMx7VbPpL7QyQm3Z
	47L72Z8mkwutPfJbn6M9R9SlUL3aSdmLzTS8NUtsOQOSQnjDk0W4NJ53ewXS6NdWA7hoiEuaPOF
	lM1kO9TnFfrx24wC+RxwHHqb77zEecO8eIBgT32lKZKjLDo7ifdMx2WCBFGNP3hEz
X-Gm-Gg: AZFdTZcx3hqsfZt2dy38xTYsvsYXoe9pBGDQ1LlusuhiVOgsOZ9b3HMpX9YXdo8T0Yv
	mvmT/U3Sz9Eit8ChoIVEyohcFsk/1M2TpSyBOeoW9FnhlxeX44S5ZbXGP2AG9vMa+pVNlFlUw9D
	FhRQvuI5mVaNs5I1KfsfZUNX4+x9WzwrEFFOw68H5wZwEkjYuKKm4d74eaHytpo4S+2AP9A76eW
	KUMRj4kfg5/LF9Vlbeejuj2PjrB6Uc7zrobrRvsLao3rmVB5VlGuyen4y9yFlDssfh8hUb0y9zW
	cu7u7PsIAMUC7S9XT/7WwWMKr9qQ/K5WNTZ/TNqNpjLw2xHliDTuQArM/Hhmf+Hz4ABMHpu2CyB
	vbFcpjO7nHS3Mpx6bN/eK6CSUdstnsorvf6oLZuqA45rBSHVU0GBreoIkn07UyJjeo0376eJ4sA
	==
X-Received: by 2002:a17:903:9cc:b0:2e8:e17d:c8b8 with SMTP id d9443c01a7336-2eff7557702mr14933505ad.63.1794981854158;
        Tue, 17 Nov 2026 22:04:14 -0800 (PST)
X-Received: by 2002:a17:903:9cc:b0:2e8:e17d:c8b8 with SMTP id d9443c01a7336-2eff7557702mr14933295ad.63.1794981853715;
        Tue, 17 Nov 2026 22:04:13 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62e38eesm7288805ad.76.2026.11.17.22.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:04:13 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:32:46 +0530
Subject: [PATCH 15/18] dt-bindings: pinctrl: qcom: shikra: add gp_mn
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
Message-Id: <20261118-gp_mn_tlmm_support-v1-15-703f7badd194@oss.qualcomm.com>
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
X-Proofpoint-GUID: oHgRd5-daPVQrDnAUYcgV9lfVz5OGB0i
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX1iAP/+KPDWzO
 iLKjgMmDTXF9vqU3zfGokNeLmGHFxS+xI77gkdhfOV5kMRQYZwV4+j+m8wnlvVJ2KI81f5mZb0t
 XlaJqib7b5kjM4TUQtd5TuMGoB0kXss=
X-Proofpoint-ORIG-GUID: oHgRd5-daPVQrDnAUYcgV9lfVz5OGB0i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfXznlcrZv/KxZy
 GuxKYz2hV0wCjs1sBtRzEk4wHlqPIRgwmB27xa6U3sEPE6l27AOAIptopJ+LGPX9DJkLeHOmgZW
 COaWXAzJIBQSCg/SCU3lc+JcFVzbLaJTBf4KAZ9twdlTGQwWX1IM8udQwANSi8MBc454N7Cp2IF
 hUJSatHEjR58jPnISAk/IU7uCNZCvSMsTjoH69qkd9LAI8VEW77fsAJ/oDnQT/Je6RMPKyUmPXh
 ylohcGd3rpE/wZLRb4xC7O77/wWeXnlmJFnVSnlK8ubzpfBSWEtiBpoPAY++1Dd7BWHCF+rgcBs
 WoLGkQiYTWp/jeWKMErZ2ZTRUyvCk+a/NchKayTjaLBIqvrkSlSilQbdTxwJs8rQlEsDrc0ur1X
 Z60jKCe1w8HWhRL8y1K1LAOGvQPwnmvO3l9fnkggQxRINRgAY4wuZlxfwjeeByya7yt4xdenz6m
 jIYwanqbZ6SXhEo7XFQ==
X-Authority-Analysis: v=2.4 cv=RYIFmFtv c=1 sm=1 tr=0 ts=6afd3fdf cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=UWeVNdHasT3lCgRpUHEA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180023

Add the gp_mn pin mux function to the Shikra TLMM function enum. This
exposes the GP M/N divider clock output and is used on gpio87.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,shikra-tlmm.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,shikra-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,shikra-tlmm.yaml
index 411c402f9044faf36c5a2250795a817fe43dc48d..420d0b5eab1821bc81a74cdbe83a5de480f9ff3e 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,shikra-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,shikra-tlmm.yaml
@@ -73,7 +73,7 @@ $defs:
                 cci_i2c1, cci_timer, char_exec, cri_trng, dac_calib,
                 dbg_out_clk, ddr_bist, ddr_pxi, dmic, emac_dll, emac_mcg,
                 emac_phy, emac0_ptp_aux, emac0_ptp_pps, emac1_ptp_aux,
-                emac1_ptp_pps, ext_mclk, gcc_gp, gsm0_tx, i2s0, i2s1,
+                emac1_ptp_pps, ext_mclk, gcc_gp, gp_mn, gsm0_tx, i2s0, i2s1,
                 i2s2, i2s3, jitter_bist, m_voc, mdp_vsync_e, mdp_vsync_out0,
                 mdp_vsync_out1, mdp_vsync_p, mdp_vsync_s, mpm_pwr, mss_lte,
                 nav_gpio, pa_indicator_or, pbs_in, pbs_out, pcie0_clk_req_n,

-- 
2.34.1

