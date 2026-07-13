Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657953F4DC7
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 11:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783943919; cv=none; b=Z1FxMT0iYQYeaLdG54Eu4SZX8jtb3HBK05jg2eXyG1FZ5xC181o27P2lIoxAQlT4CAncTAX0aPVTYn7nAf+r9EoDf2orhIVx3ASBDzDlpKd0AzGYyBn1hVUwUEDn/3YUAfEsFD12zT/EWEjhWpDEJjtgW3rH2gXMtZIQ6QtIwYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783943919; c=relaxed/simple;
	bh=WeA/Wy9c5MKU2UD2GwOeQhDQz66ME3bEbXly4eAnD0s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h/+c14D+2CnRaGjGM8pnYmSY1viwHg5yhCnw3v4t5fLi0TWSnxXIHxYXAOPSXRe9udJ3r6IXjpQKKaXTOeJn7iZyegex62vO+ufhQV7V1ycgB3wNqAC3YDYSRlXeuGP2/OXXjRecr1usvy0PvNOk2Le59L7IBhcgFT8PkbfRj0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YHu72Zwn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YYe3flSI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YHu72Zwn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YYe3flSI"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D9eJCI956861
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 11:58:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5iJieZ8EQcjhAmKwiUQKT3yTUvEdnOkURgGJjmiy/Gk=; b=YHu72ZwnG0tE2hUb
	GOqWR5IaC6HkplUS8vPSnVfL0pBVP+BlsUTm9vZ6H3Ms3bUqpJRuDSakBZonettR
	szF3GqdM/XdlSxbrd3bvYitx4/hQDXWlgXCeV+s1Y14q5B4YYLWWvw7fAzAEYGYK
	rDJS7kL6Gw+m3oSCiEvjMXxzXlsZ+t7AysLcsx2QrPvrHNQEhABcLTBtB7YVcLDE
	Di8mR+U6pfPy5/n5JLwjyR6hdrJD9KySjUgH1u3h4FdTGmTn6KiwNxUD87E/ohNi
	FeOEOLxdvL1qR768F4nL0jryvVn5Bo7Y0cFcN2/oUUwU0gNZWH0mZCy/IrtbjzWu
	j1jNLQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwk9rfsu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 11:58:33 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-381ed6616f7so5231453a91.1
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 04:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783943912; x=1784548712; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5iJieZ8EQcjhAmKwiUQKT3yTUvEdnOkURgGJjmiy/Gk=;
        b=YYe3flSIx4z9iOwx7+ngZDh7vOGcDsjgNbfkvMYbw9BPvRuYTxwNKBQe+yIHRW4enA
         TbdATmr9rDB4qaIMhYEpXAhC6Qkkfnd+N4x+2rxk7t74s/rVhMYWs9nkfnQMWhjUvheO
         /ou1JWy17HW25s2xvtOnvV0LNnkSP+ukef7kz+rrXeZHezQkYvgxC27zIyX4RjDnA7xr
         QQeShQQFYQTRbZ1tTx8/VTjgUEN+L+SH/P0BvPYkOJw5K/FnLf3nLyQbWSX6etWYvwJT
         sKOUGG+1XcQG+nNhxccHakPyA4PaXrbSpnGsVE26EOBqzY2OOPZOOism9wS44rVGlXK3
         yEkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783943912; x=1784548712;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5iJieZ8EQcjhAmKwiUQKT3yTUvEdnOkURgGJjmiy/Gk=;
        b=nQclELSDuMqJJX6vkQ4kiF5OI6sxCx0yg2zhYDAmzLCeMriC56IGz6pEIyROjnmnkC
         FedkXHBNiNeX8l3LtfWSfNEknBwGqaPqUoSweHj22e2P+re00//XV/LOXhSps8HPmrDb
         0w5EUlHA3BEqRanfCug8QfHiXLC65pk9gcLbLWnKsSoFUZeZyO32xzptIC52/rgeXeWm
         EJkaF0U51j6xUSOEo1D3m+7vjJCoLbjqVu6IlRTzxflsmqpWx+civDCd3u4uZvF0pxL4
         yF4we/6nYSOlG+4pady8Y8cz+CrrqivwiPR2ZfRhlhaAlWWnM7Byv3vTQrmJEwnwEVXD
         aCTQ==
X-Forwarded-Encrypted: i=1; AHgh+RozJJOsX91kzq5DDpruM3OX9Fqi7KY3fzhFk+BdYrwLJOdSBzYe9usjnxKo1Czry9nG95htwForsEfy@vger.kernel.org
X-Gm-Message-State: AOJu0YzDEm5CP7n/+yx7un2LJ+0vyiOyUgoN0F69bVkjNqhgL5ufXV94
	SUh8go7+LVmKFtpJ3dAer6PQS76tvo3a4hHypn9376QeAcP7QLHKxDcWWyYkIgIq0qhl7+6MwbL
	qIzEN2eYQCqFzQWq0dMcnhua5sA0Cwi8jww1YpGi17g9V0hLBNL9aUg0ZoIyTwgc=
X-Gm-Gg: AfdE7cnqtqBdwP4jGQdEE1s/BT+jfk2rvYen0a450caWXSzXV3vjmT/j08DZtvGuQ4k
	9Oku1/5V5PEuJtfZ/iz+UdRZ71kHDO10ymNYfLpzl2sn2E+p1dYLskZftqUUDiUr3NjBy2rUin/
	CIewuLb8IMiEBNVFrAA/J52Uwcr94j7/NJDDGRU1k7dQ+IpTSMOZAfXDSYLaQUYgKmFKlHfmElZ
	fBOWpDBvLHnEUhRIwQyI7KUPOHBaXm60mRHOTIvKbfHwzSFDTbEWaPjDWiWPXow5tA2h0xm5wrP
	RfJhL8u12UgVaSTte1+xBrhPCOUOMZ61XigH/m7PDZ8eOeGmsDUTv9jh8FsGZyKJXwZPWYAzZQZ
	b/virUkW9a1JSZiURgy038rBWAp1MCwfb/L3YnyWR
X-Received: by 2002:a17:90b:5344:b0:381:1b66:4734 with SMTP id 98e67ed59e1d1-38dc75d0b31mr8284357a91.6.1783943912337;
        Mon, 13 Jul 2026 04:58:32 -0700 (PDT)
X-Received: by 2002:a17:90b:5344:b0:381:1b66:4734 with SMTP id 98e67ed59e1d1-38dc75d0b31mr8284335a91.6.1783943911906;
        Mon, 13 Jul 2026 04:58:31 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174ae6cd9sm74546638eec.31.2026.07.13.04.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 04:58:31 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 17:28:15 +0530
Subject: [PATCH v5 2/2] arm64: dts: qcom: monaco-pmics: Add PON power key
 and reset inputs
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-b4-add_pwrkey_and_resin-v5-2-3bea476e1453@oss.qualcomm.com>
References: <20260713-b4-add_pwrkey_and_resin-v5-0-3bea476e1453@oss.qualcomm.com>
In-Reply-To: <20260713-b4-add_pwrkey_and_resin-v5-0-3bea476e1453@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783943896; l=1670;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=WeA/Wy9c5MKU2UD2GwOeQhDQz66ME3bEbXly4eAnD0s=;
 b=lNNwuqwq1a2EM9whUp2dZ4sbP/GSnfnsOJsmGPhA2xqLV+fwu/Mn2oFRmWMG9ToK+UlXnVAQU
 K+UhKJ8s0kwCxwbI7w35A3hEj8sdJOiL5abTr3SspYQIW7i0tI/eMls
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEyNSBTYWx0ZWRfX6W5Om/W/GhLl
 I5l3MkwBTLt0rfbx4EsOkb5kcm5JY3GCie9JC/fsLp1+NEPl+u2DxZ+Qsb3A6Rc5Mpkb/rasxp5
 VecOvl7gE1r2oUfrKDaGf19YLPDZ3tmJ3igwrNtQMGmRTq4droTNIOZi5+VfS1scde+sJVNU0zp
 Q/6502mVFf5LFDn5V9i3YIBUDGH4MQLx7M5q42Mmi6NoBiX+hNQhuVm0h8GTDtGgHcuKdJcX4Xn
 KvgC6s6TBNlxmw9PcEigwDHm3LWfu1H8Gq+9lEXm7pXBigfvktpKPwAZSU55nsZaZ70PozP2sDS
 rzoJfFNQUQmgbxwp2773NK7WHga9aUxwrDocXvOBOEe3Ze9v/9N4UJ8AxK2unwUPyNg6j79r3Z9
 kTr63QT6oSdde8dKIciobfImwmngK3MjIOxtg1LjC9hS9j10EUGL+EQFhSVgZwcB8I5b/B6aUNt
 lS+AeqBTQfvOGfUpjWQ==
X-Proofpoint-ORIG-GUID: xTlHobZBCXBaoRNOF-sF2aJEy2hN21eu
X-Authority-Analysis: v=2.4 cv=UMHt2ify c=1 sm=1 tr=0 ts=6a54d2e9 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=f3aK1VMAgMfWcFvZUCoA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: xTlHobZBCXBaoRNOF-sF2aJEy2hN21eu
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEyNSBTYWx0ZWRfXxsGpUV7zxdna
 wUQTxAh5yZ5LsF/nNrhhrfcaBll7mwzf9AIpdDJzw7F8m865gM64oqmwkTVPfu8LTeILIvRDUBw
 zMrkf+sE/R2LweLWhtV+wJSV83ae/Cg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130125

Add the Power On (PON) peripheral with power key and reset input
support for the PMM8654AU PMIC on Monaco platforms.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
Changes in v3:
 - Disable the resin as suggested by the Konrad.

Changes in v2:
 - Add new PMM8654AU compatible strings as suggested by the Konrad.
---
 arch/arm64/boot/dts/qcom/monaco-pmics.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi b/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
index e990d7367719beaa9e0cea87d9c183ae18c3ebc8..af4c38309efae89479f9a11fcb970a4c18f03a91 100644
--- a/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
@@ -13,6 +13,26 @@ pmm8620au_0: pmic@0 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		pmm8654au_0_pon: pon@1200 {
+			compatible = "qcom,pmm8654au-pon", "qcom,pmk8350-pon";
+			reg = <0x1200>, <0x800>;
+			reg-names = "hlos", "pbs";
+
+			pmm8654au_0_pon_pwrkey: pwrkey {
+				compatible = "qcom,pmm8654au-pwrkey", "qcom,pmk8350-pwrkey";
+				interrupts-extended = <&spmi_bus 0x0 0x12 0x7 IRQ_TYPE_EDGE_BOTH>;
+				linux,code = <KEY_POWER>;
+				debounce = <15625>;
+			};
+
+			pmm8654au_0_pon_resin: resin {
+				compatible = "qcom,pmm8654au-resin", "qcom,pmk8350-resin";
+				interrupts-extended = <&spmi_bus 0x0 0x12 0x6 IRQ_TYPE_EDGE_BOTH>;
+				debounce = <15625>;
+				status = "disabled";
+			};
+		};
+
 		pmm8620au_0_rtc: rtc@6100 {
 			compatible = "qcom,pmk8350-rtc";
 			reg = <0x6100>, <0x6200>;

-- 
2.34.1

