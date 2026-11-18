Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981794;
	b=G1zWtZC1mWCRH/ExqyU30abtbTv6zUBfkQnnV1BFmmoozGzYEJR66H8XVvUXeM1eq30y
	 dTpqWRyfxPWG73LoufrxrD3sebqRVk5d1c+XHX/Z04MbU5MMj6CmgpTl8eboYilYdHtBE
	 E/goteEOqcOZC5SnRLBAVV5NGb7O1PEJjaLkonseJtDLwzXfjrO+vwAkiBKppIuq6iqBE
	 7gjFlcnt18dAV42jD2IFXue5pEG7QtlVCp9y6WpwmmLXSK7a8TVqEl7HLdZny1gIeTJAJ
	 YKvo0FvDyb6+BGWaMvDK80sMQfHiXYNcR1RR27G56mn9l0cV+0yHBdlILm22+e9B+JA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981794;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yKJOOe7dxWQ0r5WNO8PdVxtOKxOpWeueu0z43hFM//o=;
	b=r5TcXTlKhP1LxGDmvRrQLfXnG+ScCGuUEEGGvH3hji0mmLW10WAg9yxH0tBdFiJdsVk7
	 IQhBUe/o3E5g4tFcu2+fSBV1HJMahJSq9zEHAM+HSwTa+3r5gnQi+bkPIfDxWL2QZxi+F
	 lnHmnTZQr5b29Jlg6Itt6tqYnF7U04mdiAcrJF1ynmCOglcWeoUL0vMpbhhzQk3xGjn0l
	 H1mTIl3/KG4dPiX5NzfdWSD2qM+rooZ3CX9/9M2q8kvCL2rCrPeOKKIxe+W01Nglt6x1z
	 pcn7W8wHWF46GUPu5wje/2FIlryHQ7a0hROUaWish1ijTY5cfHujOLNua0MK9tCdnkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bCfXUpoN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EXxN4mHu;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A3B606A32F
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:03:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9A3B606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bCfXUpoN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EXxN4mHu
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V2o51959902
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:03:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yKJOOe7dxWQ0r5WNO8PdVxtOKxOpWeueu0z43hFM//o=; b=bCfXUpoNIdFsrTD2
	78cSneZxyRgsqgKbHlmT1xNF9jjjo9AER2ZPELbKCw3x0c0/y57F0nKLnlSED2LB
	lWqYEV/yhnwX8b4uLudgxpATOGc2hBV4AEeEM3oWikIYJpbqdrme2DHHRgc8/sFs
	z9Oo268/xX7aT1eAYESRUNaveYEx6ommV0ShBtBs6MZgmXapOxKTcjgIL6fSjHVa
	SPgyTwv07n3pOG2+/ThRQLSzXrDvGLF6XeuCS30JHnrbCjsCcRZp/30AByDajtPl
	hNHhwydUaj54qjZs88F6HH+lspM+w1uJqDTwo581FN0L4op7lJsm0v/mP47YBZvi
	9LieVA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9hexc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:03:13 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ed02a00b24so5986865ad.2
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 22:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794981793; x=1795586593; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yKJOOe7dxWQ0r5WNO8PdVxtOKxOpWeueu0z43hFM//o=;
        b=EXxN4mHusV6m5ZoObFBDWMKrG7VMjRZxaSPTyx5mNeUWTN8l5QGIUTOv14gyZnknGR
         vbEGKfvam9j5sRNN35/55rcG93C56cSAyVMP/gr9XW7gPUChgByc4edxhc+D51LpjMf4
         OWjTUfHiYlaNY3KAydzxZQjyHrb6XUdtzkeld9hCV5ofJCn9m3Cpew0ak9AlPAkO8w4N
         DPzpglmy2UwcoOYDctNtFxMCBcAqeE52Cqq0h71iBJacRep6Jsd8zO2K16N6zOd2Njcf
         OdPGV86/RfqO20KZ9u53fqFqEsMRKty0Vo8SRXZi5ev3ZJNMlhqGj9m0gJx7Ic/LTl97
         xAzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981793; x=1795586593;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yKJOOe7dxWQ0r5WNO8PdVxtOKxOpWeueu0z43hFM//o=;
        b=mv755UnkWLbKAfEyH6ZqHa8gOzn7r2x+bH8v4sbBz5vORJV1rO0cWI//vZwmxoQoh/
         eENcJwM0AIPrNFnvAqLBltmdYeDNQCu0dXoHM/OxxbdrIMek6o/nkX1JpVnEHm/gYGXx
         nl7/L9NyQlAhaAuvdWx1/I/s+/hNxfOSH4op44YMbha9rWTFh9dMT3pMMFcWD2PkEDlc
         ZNncPKWc7UQpdegwExt1HqVloCy56QD7TY+5gDdxbWX001TL1zAOD5WG7d5hLh3A3KgT
         HI8xi0NyN52QBQIYL6oUkcimd2gcoEtkxc8QaiRynd7sxbiiqeomQhKZF76oAPznlqTm
         Abvw==
X-Forwarded-Encrypted: i=1; AL+hErELE4t/pwgJ1WcCpwupKZMj9zuB5mszVRZaeoENZq97ehb7TZWykq8EwbUi5N7X6t458JPyW+rB3/P3@vger.kernel.org
X-Gm-Message-State: APuU4Z9aVntu9VkvvhO+SUyTMea5/bSs1mrhaJl5tql3W+G5FJhNAUWD
	wLBG6XoWLHbXi297m2Qkj/+SmR0E03RSVMjnnMRkqYvY8utTiO0SSJ25v3jt0toDObws1DfkOLD
	HqCLl9xgRyV58bdD6pVrwVInRuQ1CRzIyhJ/Ymt4wBsygSIbiVT3VpmreQ5J7FilL
X-Gm-Gg: AZFdTZcfBIoa7E9BxxuqbiQWf3j0mLYiH3xfk7igPKZCQVqZzysoZEXsXFhoxkr7zrw
	vg6VFIJBee4ZRW/VS0mGYvUHYvA6UnLw9Z8iCLjn2Q3OPBKq5/PwoBkPsaq0eC1a9UNFeEWZ0Fw
	Zl4XSGIKAhqY9bKo4SntPN+fOQLW9JCEokinh4ylrruM08y7hB86pKlcn+YbKpgSLhbdzmqq4QZ
	aCurvGhGRRYUxgNL2sTh7rzjtEGlU0Ex0Pl9bFKuJwqBVPI3KyR2PmMNG5FHRBMABhNf6XrTHjM
	+fS3tcQ93CUi7OjrmhFi0oZL5jeww4ZL1jOuZHFM6O8VjCyJJiI10+xXhVZGTdy+u8tX4dsNPEa
	D6R3x7qSnbKX0IYNF4yCXUqNNNhRI/WB0qXvE+l/ksHkr43btzdJ0tldfQDrKw67NZIlAPKc+7w
	==
X-Received: by 2002:a17:903:943:b0:2e9:5714:6087 with SMTP id d9443c01a7336-2eff71f7733mr15105325ad.5.1794981792560;
        Tue, 17 Nov 2026 22:03:12 -0800 (PST)
X-Received: by 2002:a17:903:943:b0:2e9:5714:6087 with SMTP id d9443c01a7336-2eff71f7733mr15105085ad.5.1794981792074;
        Tue, 17 Nov 2026 22:03:12 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62e38eesm7288805ad.76.2026.11.17.22.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:03:11 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:32:36 +0530
Subject: [PATCH 05/18] dt-bindings: pinctrl: qcom: sc7280: add gp_mn
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
Message-Id: <20261118-gp_mn_tlmm_support-v1-5-703f7badd194@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=QenzLcbv c=1 sm=1 tr=0 ts=6afd3fa1 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=rOX_z413SjggttUJAysA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: DMvUdmdNGGc-UtBhtlv2bjU9QAZBnRgw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX7auWDdcIGs0C
 9wK54Wx9jBnbwIs9kSuA8/Te0JLSBBKQSuUZKj3F2bDMoxq07JbQdQr+g5P9qwxbi23XAXwQYGf
 bM4R0NPIuvjo1qCsHQEkj3nQuJHitYMYkRoOTAroy1He4LjR4zWCVmWk4dJxWHFDm/YNMmnLhT6
 G5nToQjpJt9ytoOePRXSsobOBxepQf9vWVlnjbq65Bz08yi+ZRzzAXi6YMI6TEibtlTNJWEeMAU
 SbqQ6Nb/XYYTE/TQCS5l57uT5P1u+hen8AoHCiGrzfkD5dG9acYRzUWGNjLeVxDC6qfF2+j1sWy
 GmDIEgkSQEpTZ8JYSRPUTJ4wRkwbiJU3Enin1n1034nL8iq84bk8VxINjhtyjfjvM7pQWc6AKbj
 S3VJvf8Klhu0tLcixA7deDzzQq9R3WpcICzDu4RiTmdqDa7YBAo522b7+oN+6yBrj7m1TxE12gP
 rSkl1TkNfdGbuwOY4Dw==
X-Proofpoint-GUID: DMvUdmdNGGc-UtBhtlv2bjU9QAZBnRgw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX2Zmw7k4JqrJ5
 WlqYzUwd1/CMGv0L5gqK9VPP18KxEELZ9sDAhBnpUKf2KPCj9iIgzZRYafo4t7Q+tIOuuvaGJWW
 fL40hmvFkizeMcYIJ2IiSUdMCVI41y0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180023

Add the gp_mn pin mux function to the SC7280 TLMM function enum. This
exposes the GP M/N divider clock output and is used on gpio60.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml
index 5329fe2a439789ca1466577db26f56bc4c779d65..9ae7183976d3713affe2b798ff8e6ecb93f877db 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml
@@ -75,7 +75,7 @@ $defs:
                 cmu_rng2, cmu_rng3, coex_uart1, cri_trng, cri_trng0,
                 cri_trng1, dbg_out, ddr_bist, ddr_pxi0, ddr_pxi1, dp_hot,
                 dp_lcd, edp_hot, edp_lcd, gcc_gp1, gcc_gp2, gcc_gp3,
-                gpio, host2wlan_sol, ibi_i3c, jitter_bist, lpass_slimbus,
+                gp_mn, gpio, host2wlan_sol, ibi_i3c, jitter_bist, lpass_slimbus,
                 mdp_vsync, mdp_vsync0, mdp_vsync1, mdp_vsync2, mdp_vsync3,
                 mdp_vsync4, mdp_vsync5, mi2s0_data0, mi2s0_data1, mi2s0_sck,
                 mi2s0_ws, mi2s1_data0, mi2s1_data1, mi2s1_sck, mi2s1_ws,

-- 
2.34.1

