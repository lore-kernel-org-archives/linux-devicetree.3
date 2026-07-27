Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CCBE3BCD23
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 07:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785136130; cv=none; b=WnxP+c9ggpFrt6D2HX1YCANKq+ZNixn3g4CJTaKJan3iUYYUFRQ1XvKiPsxBHU34bhdDgM+OtR79AU6JWO1uYUl4zMsOQFR0f/P96H9FHaQ1oNbFeh4iElD0stL+rzUOwv83PcUWOO9cjl+QAMkrpVngeTQwbKTVyC/biifSkwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785136130; c=relaxed/simple;
	bh=MG1GWb9hZphruxpUSQyenSfn/wC+QIgQwpedGztWTuQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UoPkhBASWGG4f86Sz6k3DDbV+FvnBXC6Qfe3GjX9h8ilNixWaBOkcvdrkDFJenZCfZd03YaJnZVA3nMZSxBrpQfjxwjhgygZSJZyRVSFjSK8OSnk3FJQ9VSgX4dTXzphbOgxLZH70rsJhe+Ip1XapKzwgbys13KGpWnt9eMVYpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mfh/Bwgn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V7x8SD88; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mfh/Bwgn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V7x8SD88"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R3HFS13604379
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 07:08:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=AkCcYKg/1g7
	RZD8uzUH99V7PW0IFfhJEegSKIw2Rqqg=; b=Mfh/Bwgng7PsfU0U/dLlrX+dTfW
	LoAnco+5AXpsEFXGtZttYoCpiMI4Av9UiELvHomg7qVRTg15Z8SN+hZ3yDJlwiaD
	h7PfKGfMqWPkcn9tmL53lFHce1izllB0TKfB124+8m/RuVkiGbHZA2mxvVJTdoqT
	xer5O1P6rt/qaVTG9xGjJOmOBZ+0ds+GNOFMkcWhq2tTcCHwSDMv2hz7rGjG4tXP
	ZCr18ZuYZsegJ1G8k+5xsh4XK1+JVeTnF+ItNwCp8HlYlqKjfFmWSBEDyZRICfxn
	hlMzaQn/w45GVlAFJH0zLjLwsZsyq+Rv9Qo2MzsksgEJvvklBOgHhlbhqVw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fny9wgmrq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 07:08:48 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51ebdfceddcso32290911cf.3
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 00:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785136127; x=1785740927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AkCcYKg/1g7RZD8uzUH99V7PW0IFfhJEegSKIw2Rqqg=;
        b=V7x8SD88ES/Uqn9S4qdgkUDyw+vO4ufSaOhNwifKDID2M4ktdkDfaqtqJBW8n2mHJo
         5XW1i3s+aZY0lsMrRkubvJJkldovZPPLCEIsjzTWLRog359Z35LXvFbxbN6L+AO9mTID
         JUvmstkBk1c3oXcvUxyzwftChG9liTuoJDs9Q+gsQJdQpyVgFyXG4yO8Ck6fw3d7aFx/
         a281yNYWwOA0dT4y1Ev631kyOAfmHjeC3zzAKHMQTesu3MvBmUPCQQZqc/E49naGugEj
         oNgsFzsxkomaQNn7pNUbKNKO/5TLOlZgajcjbM7DuHAhTpehPMhPeMCsF85uuwcn7S5V
         eFVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785136127; x=1785740927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AkCcYKg/1g7RZD8uzUH99V7PW0IFfhJEegSKIw2Rqqg=;
        b=M1NihCPc99HJTicA4BzAbYrBVbOkdKClsvsowp0vQtwjdSoxxTBCWmiRuoi3nLyqkf
         aJbzFOxz9+1xwn5XZT9uMGvKJbZNQXcuVe6dT1TpFhbvSUa40i/8RQqDzYJEpACi97O0
         qXoebqP5/53KvBLCsQGyHqH3bTrtBOCTvvrx76dKeiJ0FsuR4NOwaSBspgCDCJWEpG9u
         vVs98ssE+YJ3/uwKlzyYmlk0dRmvT/tNPwQi4XTU/Hf9LBd+tQTMUIOh8nQ9oD/fNPxh
         joda1RnkkHnN3xpJ6bmI9Z8mgHFcKj6EaBdCRJEohLDKhI4ScBA+s1e9u+bOHQsu1pEs
         eUHw==
X-Forwarded-Encrypted: i=1; AHgh+RrD89Z9FlWND27izIaD8aQsvrbNqEcw/AGcGpvly8IXOAT4iOLsatr8UxbH10uQfBrILbTE1/Djq1FO@vger.kernel.org
X-Gm-Message-State: AOJu0YxyExoQgdMF59/OxvmgOyJx7tPVNzrtUD9T+67eYxJtgYJ6B0VE
	gGUCtHqQr6w//2z0kEY4xE5+Akq122EetnEuiynY/3UHBd4auKQgPDOZSx1Tm85RUyKhq+i4H7r
	ikLTo7jyVvmO5Oa8bsbRgHNPo5JwecJvBEgz9k4Aq1ASKIzNkxFdnncSzeGrV7QtQ
X-Gm-Gg: AR+sD12hIetJ3vrXk1BQ0MWlvCHJyb4PTRb8MqL1yAoWwNpJork495Vd4A4AWO7o+pm
	+TbCBkBEFiFE6ZBmR1I+yOPlCdt2w/4b2uHl2z188STdKwVJ2UTMw2OSlv5RYd390eMP7hXrOrB
	o9hfP08527JSIKATRO6QFThygwU9JdJC7zIVxrMQwM2odad3oPoiYruuiJFvvzrcRXcweCU4OoN
	qd6G3n8heVSZEuyEbyiWWRHqt8BnabmYyXELvAY6KG9WWizLIxdDo9PVKwBi5zPYUQ0OVhIC8qQ
	zQSYaYqrBS0xmJxtJkLcq4Du4q07W/wC7BDg6zM5dfov2RTOvkQAbPErewzrnScT1TBdnQ3AMOU
	KoLwWsM2E6jNp17p/hTsjKvAYOJy/RzCqpp4mRN7XnfHWfDNh9SsKN0hU+k4=
X-Received: by 2002:ac8:570d:0:b0:51b:f635:9aa1 with SMTP id d75a77b69052e-529a865ef01mr76880191cf.48.1785136127305;
        Mon, 27 Jul 2026 00:08:47 -0700 (PDT)
X-Received: by 2002:ac8:570d:0:b0:51b:f635:9aa1 with SMTP id d75a77b69052e-529a865ef01mr76879951cf.48.1785136126840;
        Mon, 27 Jul 2026 00:08:46 -0700 (PDT)
Received: from YUANJIEY2.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907e8522e88sm58884446d6.1.2026.07.27.00.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 00:08:46 -0700 (PDT)
From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, yuanjie.yang@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com
Subject: [PATCH v2 1/2] dt-bindings: arm: qcom: Add HAMOA-IOT-COME board
Date: Mon, 27 Jul 2026 15:07:16 +0800
Message-ID: <20260727070758.528-2-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260727070758.528-1-yuanjie.yang@oss.qualcomm.com>
References: <20260727070758.528-1-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA2OSBTYWx0ZWRfX0Gx6VL5nglXl
 lPOrK3W0A2NSs4ZGEzhgL6x7Npcd+ALpsGN/o7uDt7hIy68Z0vHsEtyovDEqCipFz9A2peSPcAQ
 ZOnefdI2arSXafsW6f1ppHbXr0M0op5SiXjFACgljZWzEwDOV/xKpHzvA+Ti8YYszLW28iqnNdM
 a6ORfuoTDwtjLN5Up/p7EgahTwfhX3eylpjDhwpqKfm3FcGM1TGP/LVdi73Vj3OROH4M7KouKqR
 /+Oln+yPZtjtTDUJc9k7X5um0Jgl8YLLmTG5A+NEDDv87UZhLX4wHQ4/IUWtJWZ6hZWTZ9noAdw
 qXTFCvoHPlbxl56uWF+MAsdfnpHZS8qf8dkd0M2dy/3lh+TBUEp7Y+6suTt0uziK0y9Wn9L2euK
 BlGDatoy740IGxUeAHqKS8Ng3I6UkrVQSGvC6ziuBB58kppU/PnyvcgbY53uJIJW19V1I4nkVdA
 2mBv//qxbNBjAO3x2Jg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA2OSBTYWx0ZWRfXxu2/YTllgDPO
 ny0qQELLgl7j4UITI0/hhJrw71zZWXTP2fIZkKxY9I3lZNxs9jKjy3dbM1lox7slD8PvyjakfEU
 Ax/CavDjkQe+OyG4SdhUkZunOVhHwZU=
X-Proofpoint-ORIG-GUID: xs4tWdr4WVSGVMo_GjFhMJC2pz9iZDP6
X-Authority-Analysis: v=2.4 cv=E4b9Y6dl c=1 sm=1 tr=0 ts=6a670400 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=ufpXK9N5UmUcXK3xRpUA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: xs4tWdr4WVSGVMo_GjFhMJC2pz9iZDP6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270069

Document the device tree binding for the HAMOA-IOT-COME board based on
the Qualcomm X1E80100 SoC.

The platform consists of a system-on-module (SoM) mounted on a carrier
board. The SoM integrates the core system functionality, including a
SiP containing the X1E80100 SoC and its supporting components.

The COME SiP hardware is effectively the same as the SoM used on the
Qualcomm HAMOA EVK, while the carrier board provides the board-specific
peripherals and connectivity.

Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index c7c9a9279684..443191b12137 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1209,6 +1209,13 @@ properties:
               - qcom,x1e80100-qcp
           - const: qcom,x1e80100
 
+      - items:
+          - enum:
+              - qcom,hamoa-iot-come
+          - const: qcom,hamoa-iot-come-som
+          - const: qcom,hamoa-iot-som
+          - const: qcom,x1e80100
+
       - items:
           - enum:
               - qcom,hamoa-iot-evk
-- 
2.43.0

