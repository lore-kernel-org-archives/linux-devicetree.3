Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B4D362130
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 15:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786721177; cv=none; b=S+rgHIlYwgXUZlwBQVDUhsglIn6Gjgl0IVrqfNjNNHPT/d8HSFzWiLFh88IRIIqZJn6LOhzNBG3aHtOBA9OU+dGGPXEzXNa1+ZEQC/Lf1rqmIPi7UhSDvKJNwoTFyVhHaGqh0QfEiOXW9v7IlckZ61zlalCCDcx0zgIZXr+ouds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786721177; c=relaxed/simple;
	bh=G7ysoFXlnA+setv4G4hPplslGf5hjLQq7jycfGIehps=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZGxl4qX0GRjHc1Er39/CFPYY7Z3Fu4G3lxcXXAQCrNx2KeBcGvl4OZcp1bTC6cOiUE/Qqcc1dkOUDMdwBhgw+V2EjTyNOBTigMOYHED2BZtDXaTV+KnKwGNjz/4CT+5IhY6Qq2LYTUIlALYpxSP5oLnCAdF+a/IOiQ9kRZe1DF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G40vA5Ns; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EYc0BogJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G40vA5Ns";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EYc0BogJ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67EDx01a1906686
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 15:26:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=wnqWx+LXaxodf+1nzTgqpRZxRqRqnKschao
	pwZo6XmA=; b=G40vA5Nsr7KVT8/qStliyOFGYIn5Tdb7s8AUvH+P4eyWIKnMlWu
	w9Ar0hId8wdLAcyoG1ZxH+7+K/nn1dKiPGxIX2ylT01waT/gDASu1rVB8+12SVB2
	wQopEGWAJ+kd73Gi/Dkbp+Gtq4hWmXlRoXSh4dDsDWgeYcKkoUrvxZx7RFMsOaLX
	zVxu23p3Pnie6YjD5HZ90GdKzQGDRnD+OVmdZ2SDjzbEwkGUfDeshJcGlHsauz3m
	ZVJHO5mYg+hBe1MBtcwYS09RO1UDXnVjQfslQnEAMYvsZxWhiRmLgLzjTTC2N2qZ
	L/aJTDWdl7NcDOOF9kmrGR7OiqiTpj0Tjmw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1xexj5sm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 15:26:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-936aa34873bso112348485a.3
        for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 08:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786721173; x=1787325973; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wnqWx+LXaxodf+1nzTgqpRZxRqRqnKschaopwZo6XmA=;
        b=EYc0BogJDyVfgdUW647qzs6LMXoZMetY4fkSnUpMIfD6n6Q9rcPkpgzl2P/9KBOzeS
         7eT3Kbgjpmic5kZsPyh3nA/yXoF9Tk5J3JZcSAA4k8NuhdtOnt+wdeEY0VGAq+FpQaWR
         l5E39COF/Ka6Dwic/+fq3hx+CutIWNEjd7xpazoQRuyVaLtpQoqjtKV3H9Slm6uKAe0w
         X1lo0HduVS2clzF4RZLnU/PTOcP+Xp7m+rL85xlEj7lknIxg83QfUXY0jYBjEZgwxGR8
         rE3MLK7GE6Quvlg78QbJbWuNxumEP1rPyok/m6ds+QAz4LNooBqixyCcXACVBlXmanZj
         3vTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786721173; x=1787325973;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wnqWx+LXaxodf+1nzTgqpRZxRqRqnKschaopwZo6XmA=;
        b=GMaOBh8Xr6lmp4FVaIyxh68u8IEE0GVax71oH9wvURrsiP99Rn/JvOn31pXC/cFnuh
         azj2VmS8NLPvhIJLpaXzkMKR2evAKFulad6giWZ8GpHL1ApL41lHfkIakp1algjctRrT
         3wWfVL7eMQFYyUtxztbL6ZEz1wQChtLU6tWfySiX7MpNcCGZn1X08CAbHSbpX3ULzCmy
         pOZ6NBY92F3493gSzSrrv/iyOALjgfnEY2IOwNyW7BSOBnSkplcTw7q+7vZEgdoyYpAT
         ZD8FQCXkpczy+76Zbw+n9ZHMFnl6PF7yfz/F9ml8XDb+1IV3YVmtVmCFAcvttNu/5UfW
         MzfQ==
X-Forwarded-Encrypted: i=1; AHgh+RqjbqwRN0kjV1wV4CjcS6Z3hotv81g91SujXvou5Cngxn3sUgcSbBgPRsgKzfVYKkRtknMYaJyiNd9O@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0sRKJWphLl0CCKzXs39sIrt7kC0toP2Xy/rs7LIY5OLC3gBj+
	v2PUuGCSGrEnqcjr+z44vbl1Ibv4oan8GOcI+KzXo5ViIgWp1n7NTxt/1be/obL5Erin5ChRqk/
	3kpLcHs/CyQoabCA2JESu+KI65TKm3IHdV31QPrPBQ26CdutA/6YSvefnR+aCjeXPat6YyV7Fz+
	s=
X-Gm-Gg: AR+sD10Pu+5eFwBesBr9NbYbDpNyCYovbejQxduHbKWZHgX5VwLRzrTMrE3D2q0KbLA
	FdRpW3fNDMWQ4O2XsD8hz4V7oxRsrWcF8re+mokSqLx7PsK85WcX00lD5lD/ddKRFYt7WDd1op3
	jnCwJp3evUAlSPmnPlVF5UC6mm9uudEGDxf7M7bYZ95d3NciMw6Bv5bldZEr6ty0EGoknVkLY8X
	KD8XuGS6x/vUqxK9CY9k43EWVNGVnFYV7ztJ2J5Yf2ZSg9JQFyr6Y1fbIDjJPvXWd2HegKGpZR3
	EjybmdCxajgOM13U1dp3OO916VIVgBpnwXEHd1C0J55AdKzBJCCmaWewc59b9mflfwI9Be+Ydix
	NaVvx2khDjv0STP9xxyY=
X-Received: by 2002:a05:620a:294a:b0:914:bc2f:baf7 with SMTP id af79cd13be357-936d2145acdmr672762885a.4.1786721172930;
        Fri, 14 Aug 2026 08:26:12 -0700 (PDT)
X-Received: by 2002:a05:620a:294a:b0:914:bc2f:baf7 with SMTP id af79cd13be357-936d2145acdmr672755985a.4.1786721172454;
        Fri, 14 Aug 2026 08:26:12 -0700 (PDT)
Received: from milosz-tp.home ([50.55.56.40])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-936ce1ec714sm295517185a.24.2026.08.14.08.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 08:26:11 -0700 (PDT)
From: Milosz Wasilewski <milosz.wasilewski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Milosz Wasilewski <milosz.wasilewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: monaco: add PMIC PON with power key
Date: Fri, 14 Aug 2026 11:26:10 -0400
Message-ID: <20260814152610.2039318-1-milosz.wasilewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDExOCBTYWx0ZWRfX0q6yMBTr5+4n
 Atsl/XqVP8/mmq/vDx12UifXNKihEN5nfATNaR5F1WFJF8cxZ+EsaR9Tc3RPLyP1xOUczWny/l9
 8MXjSGZFh7qW9pWBrZwVCTPw9IxlOrM=
X-Proofpoint-GUID: R_thQlFDOl_oFRdBrpg3PUCB2Trq0G5F
X-Authority-Analysis: v=2.4 cv=eO4jSnp1 c=1 sm=1 tr=0 ts=6a7f3395 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=CRReYiPZqiZXUn0N9rmGIQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=woqh8NtRkY4zBJMUoBoA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDExOCBTYWx0ZWRfX7cIwgxWgDQpS
 lc75+xVOrYMbkgMLcJ3zrsccR+DzHJ+i3hqwUEGA9JDBG8MXlcC0qxOuPnz562iRU/MAvimvWqq
 WBIhMtVNcrSBOdsmBQ0wi7VF6g6yi3Pnk8AGKwdWtXnXC8jctITqDeijBa7QAmu04uZK0hru+8n
 dXDFxIkd7ZoIqjOVgFk4czBFTdrzIf5yUMZpnPUpf0rW5U4pN0LgajUaXn9R0EpzQ8UjBR0TS8b
 odfGDKa6/Plo3hjxQYunUgBRaxw8NGO35b3xP2nFyj6KNItu6uPZXP/CZySRaF6mtrIxYMHxJai
 U5csGQVZAww37fOSH2NsXpu2gf5G0ELfZ5J6UJi4WQhPX0GWVAKJRpJLyUujvN1/ZMN4S5BI9Gl
 RGx/L0a2So6KBuQUujxsATFnyRkfBcwfRHUgmfST+SHYTEMmat3LJUck2oiqGJEuca/s3ZUqVCy
 JmfwmWLDqVlDqbJHYgQ==
X-Proofpoint-ORIG-GUID: R_thQlFDOl_oFRdBrpg3PUCB2Trq0G5F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1011 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140118

Monaco has no PMIC PON node, so the power key is not described at all
and there is no pwrkey input device.  More importantly the board then
has no power-key wakeup source: the only way out of s2idle is the RTC
alarm or one of the PCIe/USB/remoteproc sources, and pressing the power
button does nothing.

Add the PON node with the power key, modelled on the pmm8654au PON on
lemans, which carries the same PMIC: the block lives at 0x1200 and its
interrupts are on block 0x12.

qcom,pmk8350-pwrkey has wakeup_source_default set, so the driver arms
the IRQ as a wakeup source without any additional DT property.

On an IQ-8275-EVK this gives a pmic_pwrkey input device under
c440000.spmi:pmic@0:pon@1200, and:

  # grep pwrkey /sys/kernel/debug/wakeup_sources
  c440000.spmi:pmic@0:pon@1200:pwrkey

"systemctl suspend" followed by a power-key press now resumes the board,
where before it stayed in s2idle until an RTC alarm fired.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Milosz Wasilewski <milosz.wasilewski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-pmics.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi b/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
index 6e096b9b7546..aeaef002f791 100644
--- a/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
@@ -14,6 +14,19 @@ pmm8620au_0: pmic@0 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		pmm8620au_0_pon: pon@1200 {
+			compatible = "qcom,pmk8350-pon";
+			reg = <0x1200>, <0x800>;
+			reg-names = "hlos", "pbs";
+
+			pmm8620au_0_pon_pwrkey: pwrkey {
+				compatible = "qcom,pmk8350-pwrkey";
+				interrupts = <0x0 0x12 0x7 IRQ_TYPE_EDGE_BOTH>;
+				linux,code = <KEY_POWER>;
+				debounce = <15625>;
+			};
+		};
+
 		pmm8620au_0_rtc: rtc@6100 {
 			compatible = "qcom,pmk8350-rtc";
 			reg = <0x6100>, <0x6200>;

base-commit: ed2647532a225739e86c7f236a2ce82764ec2772
-- 
2.43.0

