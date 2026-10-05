Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE6F481AA1
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 12:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791203157; cv=none; b=VZOw7s54dOXXY7sztN6vW9YBUd8auSM5SWS6FHbcl1QviQSzpocEl+efRSVXVBP0RtORz4e14/WEhEItKtBOUw3Am1SlY9kz/rGQu2UMtXMx7xiS2NKfE9V3tZkOXjJZddrNAsVN7jXAOJXpzPnxKCjgUQVEJ/ruuooM2I+UQX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791203157; c=relaxed/simple;
	bh=bWkI07yTaxFWD4atiiVpHEgTv/JWhA8cgER3iu8rSDw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BN5U3BLqyqLnHNAVRzhMy0QnDMLi9yrri13ivZ0ik/chibc3QLNxLW50+bCwNrJ4WqeYJ/lTSwsZgmmqmOOsyJMItYW47bfYFZNbGZhUTbwaYxICSc0dDvEw61lvegegEhCKuB3DiN+8CDOGjmXVlH70S1Bb1RyB2rwnXGHPTfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mfM8xqKb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ba+j7bjc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mfM8xqKb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ba+j7bjc"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695CFfwu2366692
	for <devicetree@vger.kernel.org>; Mon, 5 Oct 2026 12:25:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	paA6ONkQiU4NHTMxar0Ki2c6NwzaquR/pRAOcsSnfzw=; b=mfM8xqKb3FejSNJ+
	CgZaO3jOsZv+GauTDRjU5DvW746DbIjGmEheQZ1WWidlaQpN44OxwC0kstI7yh7y
	Zfvu2wNouaWJZCXXew5coFrqbk5CEZRQW3g+MDkZePN1oOB70r13SKOFnFwXGoZh
	fLfOAENqFG4i7u2OE40xiAmHeeSfb2z90WzCz5BlyhSA9FS7gjiU828taY1Ja6CH
	60l30yqmSP4dgCIMpV9KUR+i6AfJ8O0XVFi9cWX0+1fbYNW78pi6CQdlNWDZlfYp
	vWbjkKI/1PbdUe99c3uFq6SLZVy9KxK+b61hoGspxtF2lm4Txo3Mstkoj/yCkAEi
	3ZvATw==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h49tvrd01-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 12:25:53 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-82412fd5f11so1825198a34.1
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 05:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791203153; x=1791807953; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=paA6ONkQiU4NHTMxar0Ki2c6NwzaquR/pRAOcsSnfzw=;
        b=Ba+j7bjcW4GVCe9ZWuF86CQapua9AkfKR8POvPLrW+HzjSq4h34qgFG1BKyukUqbhG
         Xa6KkkEdGB6wYGr0K9o0JFI930VGlxAsVVRN+Bpa9fLQ2oFQXZ5CHbN2zJT6HHq49jY3
         j/Rg9KjAK4Bk6LhIWwwvsx3CbvrGZPP115UPtBA1QduR16K2EOP/mjC4gBZMGYrCmXWW
         H8PnMjJKkc/YSUD2E0hYQ2ZJoumdpm0oBK8ZoJvjd+GQf7AWG86OGbx9fD/go3JgEM6U
         c5M2BCVVwfUxx4kGh7NY+0WPHFRnRZNtH/3/FhWEB9vyA7uCaPku2RLfVmjNqI6AsFDQ
         5RIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791203153; x=1791807953;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=paA6ONkQiU4NHTMxar0Ki2c6NwzaquR/pRAOcsSnfzw=;
        b=q7RhiCSosh+2i3nMTpM7a3Lu64H+65qhP4O3tYtaO4XmlXV7Ac/EhnPq+kW5VASy4N
         FXuKHgy9LF9Xah3HRTzcXE6IUpy5u68z4czkxgz2/LJrwWSWFWyJB2r0ODEDR3yiMz2I
         hidpeV6/MRRvkebsENJcHtsT87SvM+0Ir6fVjGqUR6U0XxZTgXYeIdq9+WVoi7SqV2pu
         Zs8eSPZ1UAG1NRPMiDWhmYvAZ56lYtbmhvm+gEilGteR2LNlYG42skb8vZGciATB7rBa
         42tRQqIWRcgBtsPMLNqMLH4pyU776Fbx0AanNuaT1xhDYbyecl+M3bnXZymsCAmPtpCS
         Ke0g==
X-Forwarded-Encrypted: i=1; AKwUvBwvQ01WNUORWL92gRh+4ag1tm2shhlFzP6TQuVFhi6TW1MAr75XwDpKi8gegiRb7K3gLrMe6aNCJO+y@vger.kernel.org
X-Gm-Message-State: AFuF++kdhq+tGrRGbs1JDltZAEjh4qhw0xV+c2g8s2n1wMISn+/RscCL
	R8IgGstZTNbOGPtz5hnyYUnrCEj0mzv9/HbRm90r6OR+EVVAhAVn+O0py0KJPuUsXQYiNPTpmpM
	bAf1nmWikW0Pc4vFsNhInsB0V8vGyjQQjauxyCYJ6EpvmKn5up8INEhcgWquncqUnNUQWw3lk
X-Gm-Gg: AYBFou2WzXBhnwaFx+1L3KJdG71Kp5fSHP/DY1jZVay81VZZ1Mm4rqezCg+VM8WqmCP
	I+3hHh8mS/tbJZMobI2tr1YrzzGW2AHGcMdPXN+0eIidBziSZKZsYlr9guUQUFo657aglCAG6PK
	yHvOqyvMmznpeuHn3+pbt7ujOqk2SDZ51bSWaAhE10IiMk9CeAkAJnLuEWk5KoRCIZGpfH0JMlG
	dPzJ+e47DTekP16m/HJkE3T6+aQJYQRBjde6Wb3ha3/3H/uMekero6QtwE7S3oxDb9P1T/7PhWU
	vTfWH9g8DRxe5fjsbojIGXuFB31xXYxpG/bwh5dc1qzV/cVkPjxnPhHxMmhQ7CO/iSQmNSUZiWx
	MLuez+XTGlnpMUi0THsQOhahVQrySHSRo2w==
X-Received: by 2002:a05:6830:264c:b0:816:a9dc:6d05 with SMTP id 46e09a7af769-8227fa8f917mr11197409a34.4.1791203153215;
        Mon, 05 Oct 2026 05:25:53 -0700 (PDT)
X-Received: by 2002:a05:6830:264c:b0:816:a9dc:6d05 with SMTP id 46e09a7af769-8227fa8f917mr11197384a34.4.1791203152682;
        Mon, 05 Oct 2026 05:25:52 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-82273e27adesm10896314a34.0.2026.10.05.05.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 05:25:52 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 17:54:11 +0530
Subject: [PATCH v4 10/12] arm64: dts: qcom: pmih0108-kaanapali: Enable BCL
 sensor node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-qcom-bcl-hwmon-v4-10-50b9a8c730b7@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791203081; l=1265;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=bWkI07yTaxFWD4atiiVpHEgTv/JWhA8cgER3iu8rSDw=;
 b=G0lvChTsfBSyXbyJbOlm2/bbEoTUbl+hghwIpt3euwBIZ3GEeqcSEhjB1ymHDU6ozgTHgXnjG
 nbz/VRCEmGvAdwQrewRv27fzccZPQBLiXh1i8Xk2quL0/l0R4IC43CX
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Authority-Analysis: v=2.4 cv=aN9lOr9m c=1 sm=1 tr=0 ts=6ac39751 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=09zRouN1k7u6xsjrD3kA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-GUID: IY4OVMEZoUOO90xbLsKLiGZigEW1Rg3j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfX0n0wFv3sYHHh
 +tFNsW2vfqfJespq3MqRXK4uurH+nfbyxk6pcmi/K5/5Fv7rq9WWZq6gSs6MCfyNWEeuLYlTbnQ
 50FHlnxDQxAXtJiUBQsJWK+/ePARBTQiPcADzx0P8vSQA4rCYWBoCUSrGkZ+Vyh1OmGtuhBLEf3
 mjbfZ3aE09EPeNGHEtGiAevgnR3U1KHM6cjerwpb3DO7GPebWOjL/DkwQKux7iRycBVIV+ZHx7O
 3ZGRqT4KYiPKEJ5xuzs8vbA4zpnSHQzDlv8H6kHcyJB/nb/bMFZ8PRrCLlhyGqY1q3BTx/lVK0q
 gfqN1f/ROErdV+qaf1FpZ/hKKhLlkff522PbfgMvLuZzralrU/maqkn/R/B+xrUfXvy5L33LLFf
 0qInsy7ImqZM2Sybua3kfNZrPLUmgWEDyz+K4drshWDXzzkwsvMdzeyafm6q2XtZhf7KS7b7OZA
 VKRaNDohis7tFsWq3zw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfX7glqlRNDeysL
 V4YOl9G+ZhRx5z8LDi6k4Hf6GhxSQCMiwOj5V3iREQ30wKMu/uQw1UHZUoLRp+cb9xvP7WuGC0C
 G6Ekax4rv8dDHUuvstN1AAMYilWoXik=
X-Proofpoint-ORIG-GUID: IY4OVMEZoUOO90xbLsKLiGZigEW1Rg3j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050048

Add Battery Current Limiting (BCL) hardware monitor node for pmih0108
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi b/arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi
index b73b0e82c3d3..9f6bef6087cf 100644
--- a/arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi
@@ -49,6 +49,17 @@ pmih0108_e1_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pmih0108-bcl";
+			reg = <0x4700>;
+			interrupts = <0x7 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pmih0108_e1_gpios: gpio@8800 {
 			compatible = "qcom,pmih0108-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

