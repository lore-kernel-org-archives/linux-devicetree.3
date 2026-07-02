Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BC034D93B
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 18:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783017198; cv=none; b=FzjC3Dt9SOgkPxysBrDw2ppNTOWpK4Pb3IiMVZEN26x74+ueZq9gCGozStiR7EFqRxObV3+C1MKWkjZ5wNwqjAe589N92A8pwjzG3pp3EtkV9VLMBWXMwMHZH0ZmSJjZ7SBsyByi9s6tVh3n+Q8z4yGvmdOmnm0srqq9FK7okc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783017198; c=relaxed/simple;
	bh=ODq7eDWthtMnI0q0/3/kj+6Glk7zuFnIIQAuCpzOJks=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t+0c1GM42xpnahghHE/AUJ3JaHaAwG1zyrNdJONF+MQr04RM60Fd7RIuBx6Lb/c6OTnF/55k2rrYD8xN4UbYyOnJEmrqEmI9DTOi8CF0HQZC4Txh+uqToYjm7kCE8AFMLxg9cDaKhRbTlSQhlyz7VARJV45Xfu3Ep5sS8TrV/Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cL2MWViu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jNDqG8Fr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cL2MWViu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jNDqG8Fr"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662E3HO1645266
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 18:33:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MsoFpbnBWZlSJf0cOm4UWGA/xqUOJNFG8rZDk3ZD1/M=; b=cL2MWViusapTSdHe
	PHNWTaY0wgskVoPgsZODtTM6gnPMdw9Ho5HPzaWF/UAeD+Nx8wq9JDNvwNH3FkaN
	6UdnhRT/3Ko/3Qg5/Odck1uB7b+iNitcMFZTMD/GrRoQrC0ScgCQ9nnZfHc2Zro9
	7CTYiFWwUuQOu3SRi8DJCLuJx84W6O60S0r300zJn6A7T0WS/bYvUBsxkhldPS/A
	VvXCOxT9XjOXtBKCImeNxX864rf9LOYFt6iugBJIkAVe74l/LfH7hYizpEnXUMts
	1OKxUaeYSoaqCj33RpSEEorwaBDKe9rxxQZNB6It1bKhmVQs1bYMhD0mqPDyK0Nv
	4IwBsg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5gmb3dpt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 18:33:16 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c88ad1558f4so3024416a12.2
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 11:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783017196; x=1783621996; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MsoFpbnBWZlSJf0cOm4UWGA/xqUOJNFG8rZDk3ZD1/M=;
        b=jNDqG8FrQ7i4e4KQep0bKuoQSa9mMc4/uGt7mqiuKl+hJW8eCFUvEIEhlwvfs7qD+V
         clals4bFjz5MRC/KSUQHqtsfUQugQAf5q0xfleD06+OYKAubr+cl+FT9oRDBCYsPyw7w
         xpLEneG7WhVE0Or7c4mfuc8MSpA+jSZhU8QpjGKX61mhwzWX7FNcpeHJnfeZ6ZGNWrar
         ilbvngZVWr5BiMKeCrvRkaZSmQK7OfgCyBUJRxr1F6B/zV4Q81/LirGgeOa4sN/IWiZL
         XH8B2ekxDPmxc5p/5dSY2MNSof+Yjkib3mkIHKpMAw8xD6Yi2XztMlJNGeZZwQSfLtJy
         HtPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783017196; x=1783621996;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MsoFpbnBWZlSJf0cOm4UWGA/xqUOJNFG8rZDk3ZD1/M=;
        b=YmHM2dGwkCl6FPhE9dB6o/ZGveZ5/ZXRoAsIVrTxFugwEK4L1VtZDecqMsgH6IfnHH
         XQd6KE+fqPt56Ga14t/o2NtEJci46Mu0J7fplEoCdAMaEbb31p+rDP9ez1Y21SkbhdYW
         rFzToF1wRb2bmTR+AzUx9cNuC8eUZozWEvPVS4NYyEkz2nuwjXDKSyCGM20ooZW9AKJx
         Ln4As6NGlh0hpUT5x3StRrn8HIcIP/1sdH3CcbI328bGGz/wtB58gJwKa+UCk/90uzca
         ytsNZXKoMn6pTHeS7Z8eg8onaGe27Ulo4RJMf4QlWtvqIRrv/ZD6TC92mP2kbKwkFhQj
         YEyA==
X-Forwarded-Encrypted: i=1; AFNElJ/lKWd2/HnijRThVo14EpQBtMlCemaiWQpwHPrAaHhjnHWa/W5/NP3CeU9rI4cEhX1Zwvm7up2A+icN@vger.kernel.org
X-Gm-Message-State: AOJu0Yxyz2UgVHFkpKVjmwKJMOL/1711/gftQOwQ/GwoFFclpTh5EE/L
	1IV5ZiOsWaARO6xsvZsRK94dd4MI54SGRcsuiokqpnEcdvqd3Xyl0WpzKGR1OzzbCbUUOj8p1nP
	SbOs4zWwpIcqas0Dy49bwjO7+7fNSFK72R1mQCXpD1q2s+ftSElaxtSrY351r2JY5
X-Gm-Gg: AfdE7cl4zR4VFbhGGhbHcUWbztAF6IUAZ9xLi/tkI2fYigBUHmmB4vOaI3zaJ+ubhdP
	hshBP5t2/KcxmXOoHfxz0yBBSUH1gJa57eQ0Wrxxh1blhDZRfEXzdJeUWcNbXWCtGZstAK2RbeQ
	mIoWn8Qhj4dj9HvvChUcTC4BdflW2NCkDNtnIMqbdyTzxM16uoN+WeYaofK/XMASilgBtmC9o0L
	n4fWakGZr0Eg8FVCXAnptTWjHMQLXBwjhhKvIuc4bRq/pzVp+ov6WytzTqeKbndroZDAgfUGohS
	YGEwbnB8eeOhPRsAW1m0MUX/2L4YJ4RuXb7tRyFhq8yXqxyuKy8GNNr8G5q2GiR7mYeh7Pam4Cd
	/IbjdtR0JwDT4f9jIN/AOk1MfXk5KZcz05+k6sN8xhQ==
X-Received: by 2002:a05:6a20:da0d:b0:3bd:203b:982b with SMTP id adf61e73a8af0-3bfed24f1ecmr9309462637.16.1783017195595;
        Thu, 02 Jul 2026 11:33:15 -0700 (PDT)
X-Received: by 2002:a05:6a20:da0d:b0:3bd:203b:982b with SMTP id adf61e73a8af0-3bfed24f1ecmr9309415637.16.1783017195161;
        Thu, 02 Jul 2026 11:33:15 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7ef5b3sm15704735c88.1.2026.07.02.11.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 11:33:14 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 00:01:26 +0530
Subject: [PATCH v5 04/19] dt-bindings: clock: qcom: Add Qualcomm Shikra
 Display clock controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-shikra-dispcc-gpucc-v5-4-cc13826d4d5a@oss.qualcomm.com>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: bd5MkD3Na_TQh5_tQu7GRksSm6ciMQ0s
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfXzsW6hKM/KUE6
 Moy/DP36e+ezqXfRjiW3KqNB/Dwvqeaf243VV4ERdYNBWQoVitmvP/dx3slI6GQBOwxyr1r3P2D
 2sE76AKheMYsMZ7vGTKu63NEgbSbegY=
X-Authority-Analysis: v=2.4 cv=aJ7Ab79m c=1 sm=1 tr=0 ts=6a46aeec cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=zFVXnba82tZ0OxNrzBkA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfX39EpbSz4HF7+
 ha+ZqkzAc3NHxf8ieaRbBWPSwome7Fb0iFRZFXDSWby4Pp+H/4XsyBCHTXqcWHZpplH+tQPV5aa
 wjrNGvsI0SSCAFNoPJIgrsWuZ+0bXfa8Fht8mvSMw+hBmV1rmSI/Y4QDMtOy0jnA5NH9C7ARDWq
 KEvIv8VbENu6qdktg2khUIXeJFUzetq+1Po5Ih3WkGuxp2VTMsMHjHNP6DbA1BLrM1tWThsPgxa
 jxeyxAwDoQL2y0iijBa/v83bVCODaZ3lhdDiNbDsgplwsAT1gZu4MRqhmBLHusyzOs7Gb4GjF6n
 OC9zxM5dQ9rjAgx2M1xILdnPJ4MAAZGG4V4IgdPkLFnSgHUr7EXejZHA9/r+4jY7/zaq6YJhgd0
 RNGsY5WrA86VWC857cl96P5f5OXXw8rnGDv1mQt1SJBjKi9K5meYfAzl/WG73Y6GUjbfVCYkhFL
 3Qycfj2CfauLF1Ukbbw==
X-Proofpoint-ORIG-GUID: bd5MkD3Na_TQh5_tQu7GRksSm6ciMQ0s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020195

The Qualcomm Shikra Display clock controller has clocks same as QCM2290.
Hence, add support to use the QCM2290 DISPCC compatible as fallback for
Shikra DISPCC.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
index fe49d7fcbd4985adf340945c4b907758abf7ea10..54d56bac66d8b40d1457f2cd1797b19cc9133686 100644
--- a/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
@@ -17,7 +17,13 @@ description: |
 
 properties:
   compatible:
-    const: qcom,qcm2290-dispcc
+    oneOf:
+      - items:
+          - enum:
+              - qcom,shikra-dispcc
+          - const: qcom,qcm2290-dispcc
+      - enum:
+          - qcom,qcm2290-dispcc
 
   clocks:
     items:

-- 
2.34.1

