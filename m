Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFC648551A
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 09:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791450901; cv=none; b=I3P49MycvfjJKPeAnb+HbptX4qGnq7uKg9hBx2LuA0zisP0EHtB7a/PZ+ms0HhYMyY35/STU3ReejdqFDTs3w9Yy8EiPFvq6pvhIENyQf8Gl0FFnqbcemmQVSJeqk3CQd1OiemRlqLhC54SOne8Y4X6W6ZymOwHt967+XVvLYOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791450901; c=relaxed/simple;
	bh=EZNzhw66TQKS3/ys7hB9X72wHLID8eW7VocBG9jNpBQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jK2GJ1MzFmQfrmfSzPUjS/tTLb88T3AvJA9Vp428Rs3FrJRjWFpHZRMfiDLBo0TBdMnKx+axSoo5QSQxd9NUpze4WdYILb1MipiatPGlzXjs+nShnCIEmpBF61AAUPfiHLSm1ecT+otJtXaUBHqO3gKhcveYJjzfGm9/Z6Uc8XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bofeOqO/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SWmbjucm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bofeOqO/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SWmbjucm"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KX7W1170011
	for <devicetree@vger.kernel.org>; Thu, 8 Oct 2026 09:14:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vWw27EvAoHyMo7PLPdhTJ3G2tiw8E/kIhA2dZUt1o8A=; b=bofeOqO/hGNSL97e
	JqgYiJlN17/Njy/+PMtAgZdQYqIHphi9QcZp0kqSn+jYSAjKTaeGPB+puvD+U8l5
	R0NZHMGGPvXZuSwKCsjURFyshgPd9HMfZdwx1Qtq60RYmrhGPLCgJDwTjJOt9HNo
	qu7XDeNbLOiLEjrzHAeWIrwOinEBLdcEr8w2XptewjPxtTuayCr9tJD4Wsw0hAp2
	Su6y1PWzqhDIWNY3u1UDZ8sNXK21d3/YD3f9dUJXvgYmiSpESjM4YmKvPIAlhBEc
	H4YLPFhb/fVoR0qNshmOqB2q0ZlpSBL4iyLLbAfE7B2KJJA6IJUscaZ2mdMsS8ph
	KO/aKQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3a2xq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 09:14:53 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-143826c4a13so3910754c88.1
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 02:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791450893; x=1792055693; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vWw27EvAoHyMo7PLPdhTJ3G2tiw8E/kIhA2dZUt1o8A=;
        b=SWmbjucmgPSidkA0dXn8RP+MyJDr81ZaoLvAKIYX0GLwj32hqslDuEYHPHdoQdVRxG
         SzvQxLeCbC4LwmZAJsU3r6C7T7rfkNm1WdkNHm34eBYLmnkEmZCy7r74EUQS9XDaIUqA
         vqrjEFtCCyQgr3cw+XzQzFtFcccSfyXj4ea+qmv0hNtL93oXfLHynYFpyLMilpsjKXRX
         56TgyihrHgE8tDjCtXahjWzWWqhutpzsXcrxlfITk5Y4H/kxWov/psqWPcME7Oz7eHA3
         QWI8zZ06aZ4kz30w/12znJgOZ6JlfrkWyRyreLfFrs3Of25+INhGTSWEt5ExN41lsQyM
         q7LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791450893; x=1792055693;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vWw27EvAoHyMo7PLPdhTJ3G2tiw8E/kIhA2dZUt1o8A=;
        b=WOdbjs67HXqQWuWVItHSIdSitLHOYrY0ossmYkIuosQqyvldiGZy/4gYxnXJ5vHIct
         VhTU8WtTkrE2yXyk/OzKrEC/N1ty1UEvRB6Zy5la2g3PHKxFWOJkzqvmYhPIDLLDrJu/
         Rx/fGDni2M0agLJtNFzYYlT5N9IS0BgV3EBRe/xvVHzlssLdOTsoDGbJ+Kw4hAPbxQqE
         fUY+4s2rDFBwZJrU3u25YxkPP001mJOzyYS/HIFWF9ucCCTw8DzBhClPsybQRk7zAfgg
         tDq9QR8NE8l9Af+60rx920PY1tRWeZC8VvrsK4I+QaSNWt2ZrRalqWPzEmfmcE06m74b
         9l8Q==
X-Forwarded-Encrypted: i=1; AKwUvBxvj/q5VFZEX0ZXs6dGEKZoxTaA3lbDPG16fLtisff91FVZAtb/R/cFFz0o8wQ/cWHPCygl+0yttLnu@vger.kernel.org
X-Gm-Message-State: AFuF++mRtf7VASWG/OTIZb+vvVU7NyVuiy3K1Tbdy/FhuTfsTULYZ7VJ
	W0AcE4Y2yEC0uBsPZd/uP+HRjaW5gwVSNamRdgJW6wasO79UsuUBtbm+Rk8fDTxvmou61smT3na
	jUccnIz9ygnOjBQqilvu3poEjClc00UqR3zMJ3uE9uXXViyDF3xvzr5LCZSgg72vY
X-Gm-Gg: AYBFou33yNSVeFB0vr0bWWq0HO1AjS8nBx1FCnG+d0lH0F3ByU+fN3b9FzVBc+7lwdU
	r7xpO/ZDaYXom+vosDFnOAxfI4pEue/pLQQ8tIrg94jZTvhnvY1ksqs/2flCrhchOsfxqTibopg
	4BNo5MNZsvwBVoyFtk5RkVbhT8DJmMOj4ej/mdJUjk3oVxIxV5pB0P09BSfJoojA+wEt+ufGJPi
	L03B99fJp9b/AxMh4PqqIpVhxIRHQqZ7ETQ3IlFbK9fprIp/Ce09b+73Gwt3Roii8slTazQy2lN
	APSC2RC3SeN72kuubiGoTcW+htJfphKBKn9k7mkQJK8ExKqLs7+1jjppFEJ4lNx2RUeK/otQvvy
	FCz3u+EkMknUPgqsLXdP2FcluuuLmScVi5dwB8OiTmohyjcQwenbbeBm0jQGkjoF9sbxw3RLrAa
	P08R8xWibZF3UJr2ZOnXrds8z4X+SI
X-Received: by 2002:a05:701b:21ce:b0:144:c123:4036 with SMTP id a92af1059eb24-162074d60e3mr5046911c88.35.1791450892866;
        Thu, 08 Oct 2026 02:14:52 -0700 (PDT)
X-Received: by 2002:a05:701b:21ce:b0:144:c123:4036 with SMTP id a92af1059eb24-162074d60e3mr5046882c88.35.1791450892236;
        Thu, 08 Oct 2026 02:14:52 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1615f1ac8c5sm24456045c88.2.2026.10.08.02.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 02:14:51 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 14:44:25 +0530
Subject: [PATCH v6 05/11] arm64: dts: qcom: ipq5210: Add C3 CPU idle state
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-08-dts-v6-5-f9c4ec8664d8@oss.qualcomm.com>
References: <20261008-08-dts-v6-0-f9c4ec8664d8@oss.qualcomm.com>
In-Reply-To: <20261008-08-dts-v6-0-f9c4ec8664d8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: _L1B-Ged6x5kKEiWNF9AzB4mYgJomjjN
X-Authority-Analysis: v=2.4 cv=QOz91QLL c=1 sm=1 tr=0 ts=6ac75f0d cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=LX2C00z4I0v6K8_64uwA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzNiBTYWx0ZWRfX/KKsYrLnt8nr
 spz9g/rFut1IbzAxJOpJmBt0F9nmfQPxSya8uF+sPusvXHMbWPPjiRZsljDAdKlXN4XWxyHKWWQ
 Be+gY9fOvyXUbfSMiD0NDpq5ay+Tpzk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzNiBTYWx0ZWRfX9M3IrMkO1NU3
 S8UV/pSUWuaGmW93P5VqcYH25Ld4xf0rdDDN84YaWXyiuwq3UzS2bSFeoHiYe6ZkxwRj0/ih8hU
 XqY7yDhJG+Iy1OW6NQHa2S3mn5X8KhwDSsX640jIXqLJ8nkQb2EZzrwV1HtWo519K3qbyxQq0tC
 eM8qLzVrKctdny5Ol8lSeQN2CNPzRVwBgiUbtD6q3TEOhY9JLFJsw7pKb85Js8vEZQpkIZn9VFR
 ghPfCCUeqB9IMIEmPUSXgr3ZbSlYnSBzw030bf+U57WA9Y7DrTfeo54pmuDGsA8lBkqBwd+DdLf
 g7v4idMykgZo6ie5UtV4dKSt5KF62sjK9/6h/hzkORtxRU/bIBNuzIwZxC9iu4AsUH5o9tTiUo1
 NP4NJcnlDb967MXXjjtddvQmzY2vaF3brFB0NeGvITHuHCdA2aVsDxRQOY3r2L0tnjaEnHwJ7k0
 AoEnENmbkO2bESDA8iA==
X-Proofpoint-ORIG-GUID: _L1B-Ged6x5kKEiWNF9AzB4mYgJomjjN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080036

Add the PSCI-backed C3 idle state for the Cortex-A53 CPUs and wire it to
all CPU nodes.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 3183182d1cc7..331589a9c1ff 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -36,6 +36,7 @@ cpu0: cpu@0 {
 			compatible = "arm,cortex-a53";
 			reg = <0x0>;
 			enable-method = "psci";
+			cpu-idle-states = <&cpu_sleep_0>;
 			next-level-cache = <&l2_0>;
 			#cooling-cells = <2>;
 			clocks = <&apcs_glb APCS_ALIAS0_CORE_CLK>;
@@ -47,6 +48,7 @@ cpu1: cpu@1 {
 			compatible = "arm,cortex-a53";
 			reg = <0x1>;
 			enable-method = "psci";
+			cpu-idle-states = <&cpu_sleep_0>;
 			next-level-cache = <&l2_0>;
 			#cooling-cells = <2>;
 			clocks = <&apcs_glb APCS_ALIAS0_CORE_CLK>;
@@ -58,6 +60,7 @@ cpu2: cpu@2 {
 			compatible = "arm,cortex-a53";
 			reg = <0x2>;
 			enable-method = "psci";
+			cpu-idle-states = <&cpu_sleep_0>;
 			next-level-cache = <&l2_0>;
 			#cooling-cells = <2>;
 			clocks = <&apcs_glb APCS_ALIAS0_CORE_CLK>;
@@ -69,6 +72,7 @@ cpu3: cpu@3 {
 			compatible = "arm,cortex-a53";
 			reg = <0x3>;
 			enable-method = "psci";
+			cpu-idle-states = <&cpu_sleep_0>;
 			next-level-cache = <&l2_0>;
 			#cooling-cells = <2>;
 			clocks = <&apcs_glb APCS_ALIAS0_CORE_CLK>;
@@ -80,6 +84,20 @@ l2_0: l2-cache {
 			cache-level = <2>;
 			cache-unified;
 		};
+
+		idle-states {
+			entry-method = "psci";
+
+			cpu_sleep_0: cpu-sleep-c3 { /* C3 */
+				compatible = "arm,idle-state";
+				idle-state-name = "power-down";
+				arm,psci-suspend-param = <0x40000003>;
+				entry-latency-us = <181>;
+				exit-latency-us = <149>;
+				min-residency-us = <703>;
+				local-timer-stop;
+			};
+		};
 	};
 
 	firmware {

-- 
2.34.1

