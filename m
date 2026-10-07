Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6A7488D91
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 09:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363769; cv=none; b=cj5AkW5BqgXBfVrGYIOmiFHyiqzwitf1Pm8UkYVJs1k0vndZSSjjIv9nb8dDocjLBxFAZS1TSXw4LAuGQsSVZPK94XTOe4B5G51QeNVcb/KZ8yWzbpwWseGklo7UQXP7qeBXk9IeEaHb0GV8YWWHxQibdoWGZiobG67zLzKnCZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363769; c=relaxed/simple;
	bh=RuhyOjKQKg6pBFbp3gU3ApGTv0VXjIXo8m3P/9Wd9Mo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=O+jdltNBs7CqYmDILTk2udKishX4t/M6ALUcObmnYNNhaGY61d7uLs1cMZPYf7ex/rZ7AuW9aoAfeea0Ns7dg0Kn/D/FaEW2eor7q95xc25uQkV6EudpoqHvS4wCeuWUyLn5hPEAelKUTzJ9u1JPr+rCBuX56TkMGPJLI3gRdOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iLyPETOS reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iLyPETOS"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jeVT3334683
	for <devicetree@vger.kernel.org>; Wed, 7 Oct 2026 09:02:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RSFwFFRmZR1
	WRsY1c9AXXEPBp3eHl/0EdS15woUz0X8=; b=iLyPETOSABKLVZ5ZARQo1uGOZIP
	k8iVfaswVA0lqLUo0yhZG/tXkvfxyiDWDKGsR5p7ByfTwH8WGAPCb09FOrMLHc5v
	C2IkI7mEKiSUlctwAJh/i2us0c5Wxjl4f2YvZ5A72scxj2UMAJJq5pEYLEZBjiOq
	VqsiDT3sWKXvJQ/ZOutBsY+RT2D5IZr1nva+TsJis+w2hURPTrbEnPmcI6ZZaC3g
	w6CHg1ZcOsQ+PK1ZWtgJ55AUNAd/NDQGHS2vV6dBcIGz0eygcpBSo3WiFsoWmM1I
	I7/MbqK3+2EJ2nAOcVQWZQz2BuLrxE4ZyUnNDSMdRft4Zg5FewjIQVXqStA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h54623aut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 09:02:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e92aad34aso276392285a.0
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 02:02:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363735; x=1791968535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RSFwFFRmZR1WRsY1c9AXXEPBp3eHl/0EdS15woUz0X8=;
        b=zdLpvIFqMzWS2TlKUsS5MJxs7+Jd1FZRKc+QM/SN8Z2ya0pvzWTkGXFCws7qbnf/73
         zPTUndZUyJ3bC/4bxnj8hsUDmZLTdUf3CpZOoqN3nZc6HPwjEee1nQvc+5XVugV8efTh
         wADVEwe6HK2Z6Eqi9DwpOGuwGONEfkNOtkDxqb+jaqFP/HWfXv/RfOX7QZ+at2sleg2T
         f08VrMxN02XXjABc+BGbLeoaY/2I21GIINPYzcCJeZMto1xAzS1RoqsVtHHXyVKbx2Em
         opYNVdmYC9+TUHgtZJ0f7eolsbq7C19mIdYPJ1AgTDXZCMRmQXdQdu8/jiLRHuVd34eg
         C3Ug==
X-Forwarded-Encrypted: i=1; AKwUvBzZEjlfIaTWfu8X2ZybWlhH8JO/H14jMXO28xquqa5fyUKEEvWt1RZe0GmK1k6Oil80wPBGUQrmpHed@vger.kernel.org
X-Gm-Message-State: AFuF++kj5XT66LH8UFSJJCbvdjfDLtuFmbd80hd9vICgt1RCuwrCZKr3
	rmun75d80wCkF/DMtPycOtE6ICs8dz2hHRVz9ntVTsqVA1vof53of/ms9kx8oYkqvt38O7CLXiD
	ZThR1bBkbZE8ViReP7HtWd9dtGN1zUzKrvRfCNCSTjS6zBfG4tZNUrXcu8NNrvwK7
X-Gm-Gg: AYBFou1r5hSLdl46WvaLFnG2MW2pwUgxZzRVy46dhW+RSU0qG1Eq6w8Z5HpVqWbPEMZ
	iLVeEaHbWZEsZmaBGKiv18cCMqLk2tab1DBBL4B6lrPGxTF++5w/6oRGYzwNxCx7zmSDkVm54DS
	brK3Kn7GXgOlFVITEAUjXbpVcoAk9jbrBPLaG6p7b/rdpcX/nDIN6oVRcY74S5jGbKV2GFeixOT
	vk0Q2D9NGLZP9sCZ2J0j/neWe7D6pPknzqy3ZgRKBQUeHWSRxM64/GWEvK1X47malYbTOmzC6c0
	a/9hk6iPpr/bP9QtpY9GbeW2IWLonKApyATON0l/Y2q/NyM+4M+QFUWaZ20=
X-Received: by 2002:a05:620a:44c7:b0:93e:9809:3369 with SMTP id af79cd13be357-93e9b856ee4mr312955985a.74.1791363735151;
        Wed, 07 Oct 2026 02:02:15 -0700 (PDT)
X-Received: by 2002:a05:620a:44c7:b0:93e:9809:3369 with SMTP id af79cd13be357-93e9b856ee4mr312950285a.74.1791363734638;
        Wed, 07 Oct 2026 02:02:14 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:02:13 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Yuchan Nam <entropy1110@gmail.com>,
        Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
        Robert Foss <rfoss@kernel.org>, hariram.purushothaman@oss.qualcomm.com,
        pshrotri@qti.qualcomm.com, johannes.goede@oss.qualcomm.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Subject: [PATCH RESEND 25/45] dt-bindings: media: qcom,sa8775p-camss: add pixel path variant
Date: Wed,  7 Oct 2026 12:00:21 +0300
Message-Id: <20261007090041.3732717-26-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: B4-41O8XPPyquz_R7wDldc1MOuly69x9
X-Authority-Analysis: v=2.4 cv=ZZiIpcVA c=1 sm=1 tr=0 ts=6ac60a98 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=-SsTkY4pZgJ_H_-AmIoA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX1QXVAKxEJtC0
 Fs1uIIVvNds6fr62qgw7rQRGP8/LM69oFCViVzT3D9/ZLwLKR2CL1SnvbeqWJo//W5Qr0/8T0MX
 /6YezMelkmh8E2jaomRpYjeqaJaQsco=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX9wIlPHjaCxZl
 gq1v9xvbe7N4y5wU9jbRLEg08hf5AASo0td/RvN5J9w6YIgpAbxnxdiZLkFR6DiD465Niq82vtr
 XMkNTitgJ6pT9CvNOx431H8dGjp2F9CIU4W40e5ljeUI/mEmu2BNZDRcWPvxtKsC0ZD12Puoxup
 /oNDI0n/Q8g5yz/ZLviIc701mP6KReQ4KQR75QvyhPErcLdbWSjCCaIQgqPuPnOO6ni3yjkHwh0
 YOOkSGYRkuPn7T6L5d2CR0RtijS2BzcW2ApwSPMPuXgEOBNCkHNvsaPf5DQ5EoOvdij2HI+GvpO
 eCWS7dJGy44v9ajRh+Weep+mbviMuXxEOxwrd+jIzatsuqa95hyT3Qjxpy7sdIaEU0+aR/oeonF
 12uOqStqGO/kNM6CvcT4s9gAZXgxPFUHWc+utZFX9r+nBJCh7Z5cusCYFAwmb8QUubL791VZkSu
 6cUD83rprqhcqddPCUQ==
X-Proofpoint-ORIG-GUID: B4-41O8XPPyquz_R7wDldc1MOuly69x9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070035

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Document qcom,sa8775p-camss-pix for CAMSS configurations that use IFE
pixel paths. Keep qcom,sa8775p-camss for the legacy VFE resources.

Co-developed-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Co-developed-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Signed-off-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,sa8775p-camss.yaml         | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
index 48f280e99809..9206c7cfe197 100644
--- a/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
@@ -14,7 +14,9 @@ description:
 
 properties:
   compatible:
-    const: qcom,sa8775p-camss
+    enum:
+      - qcom,sa8775p-camss-pix
+      - qcom,sa8775p-camss
 
   reg:
     maxItems: 22
-- 
2.34.1

