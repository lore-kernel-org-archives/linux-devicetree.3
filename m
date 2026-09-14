Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EAF7463B84
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390127; cv=none; b=FQaG3UrzDCoBd6O2F5/G7adenyjkQFQlYoRLwcvoIYQqj+RqwDFKdwDS+zW6Xy7NHZCWM4TKx+Ev5c8Q40Zqaf8F2s6SesssBIADOCBJ+P0AHZcCfxHup4kgj43UAuL3xdNRMXPA5xOrXHwomv1uxvcHvz90h6WqYuiVn24vLjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390127; c=relaxed/simple;
	bh=jmorG+sVx1jmE+pmAn5LNDloJj3Nod1ZC9WT9PbJf3Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y31WdRlMoKdicKl6IRjZyN7ey4yhmEw2Lpt0EvTjvCywi/YHFk27SjgoQToL8aVuZy9xxvDVv0t7C2v4O+nmdFmp2jq8lXK/uMpo2cQQWFX+ni7wGjqALeDyprBCHkZccqVPvPGCqtLnAVjxh4XQTB8K0ia7eZg7SBOIlofteB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pH06U4iY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JEL5pR1j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pH06U4iY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JEL5pR1j"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAlxVS1460649
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:48:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SFiUv8eckH+zt8KxRqMl5caJ2lTRmK6KkzeTcrcUwRY=; b=pH06U4iYeIBa4JUn
	BtBToZND8BRqMTTgLeHWzQ5DY1fuEmJ417OhOiWX6JuB4PQq0a1hBMHZ9ykNutDJ
	H9hVrjLiXYwIybVRPwlc0N48fnmq+2UwVD+J2l8/IcaUE/rzRGA9bB/D51ist/By
	jyFptHR51gmEOl1g/AYuZvxYHaJT4vVzuvWOq4l226CPG08HLKTWTTSx9jFjJ5Td
	SEAecC+6O6oIfT8NTkckH2/PGmsMKYAuw/rOZAA53zPKkllCTEvYkKDx2CdWW9jm
	uoPtougbYvXB6iR+QdedHXeoNmXOD2dwBwF87L3z/rXLn5q6u2nW150Ze9irIiqN
	+gXPZA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeex8qjv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:48:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e82060977so640672785a.1
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 05:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390123; x=1789994923; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SFiUv8eckH+zt8KxRqMl5caJ2lTRmK6KkzeTcrcUwRY=;
        b=JEL5pR1jKSSupTN1S1/mBsMs7vGLHG7QTE6DoYUWG8KdaBi3sPpp7BzUpBzUJfonEg
         WnF1EKFmphG2KcsC+lZ/QJ5GeW5cZxzLMX21dkn6b14i6uGMPVKdaXSkHAq+eIUF38TD
         dRkwcZnzbhxLLy6hh04xpad63gw8K6B8OTclz0iax2syCjRd0AWQgNUmmPx8JuVPDBKf
         bMMSUHQV/gpK9NKBtitA/4vEouY/Xlbh/ambomjR7E1jWnCqpVcLiiXDUgTFdWe7LWNd
         bYuBQ2cBnkcW1L03rIPdJtRI4wUGRpx6TaQ+IORdujII7vouTtoNjQK+cyTg+jcxKcVg
         31qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390123; x=1789994923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SFiUv8eckH+zt8KxRqMl5caJ2lTRmK6KkzeTcrcUwRY=;
        b=nEY04CPgLBorw5gTttMGkmbOHE6bu4QcvENwdMoX4Mxom+F+CBphvDpsifnrk7Ho+d
         OTLruA6mGWMQVFvegNwzxTA/YmDekJuo5N+cF8JjCY56j4C/2PSqFfs6V3a/pOv9WMuT
         UhLAw8XStoatVLfpFXAx6Gw6sh+pDsxWDzZaxnGBXwL6MIE0FASb4jYu+gOvL0X6YKHh
         kaLQU7Z1VVKnFQPFrnAmOJhvJ7pM337HLu4S44vdftE2WnfVKdBaJ//ykc0hiHlOCsuP
         zbhiQOPZr6deTY7q6fsJ4zstq5/YGg2pLxZnUqbnV5vzhE7VwhvxlW1BfwO5MVvnPPeI
         lDVw==
X-Forwarded-Encrypted: i=1; AKwUvBw8bQ9bm97ZrqMzBuRTjcI+07llL2+P7YFEFn+GXCbh0RCvvj6qDqtqOQK8z2+jbmN41wuDWd8DzcA3@vger.kernel.org
X-Gm-Message-State: AFuF++k2Yqm8YkWwVw77JF8IR9RkonTbfhn7fiWaEXbvMRnls0vPrXJD
	JjuyhM2Ns9AKWV6zJhrWSs/ogpSYE3sLg6wkrRZ+42IV6TuFT8ItdzmqHQWX72FVKdppAqt2YdM
	vudtM4vv7bZczWwl/T910TZpOmt7d6u2rDTkqur9mrrmIO1Xgp9dKzzCgXrlWBCtA
X-Gm-Gg: AYBFou0Zme/DuO+pop4Uzuf0uoDsIw4hVzoVUK1n/QfyMxBsrO2C+PyGIOH13Q7zhHv
	L83rTbRCQGZ/Zpd95xNTXJWVlu1KkA2BkjC7EvUV4Z1E0ym/XTPFVj+UmkLjn++3mHdx59AjJn+
	cimAQBN0uXm0SIuntOiw4RMPcyOHkjq+O4MuDOo4Ij3eCC94nSFacXPglXGfrsE5PURkt4KGTx8
	JCzz4Ie095U0wLPyKqHaWO/YUDvyQXdY5aTiNYRdJylYwNstF8agqs1zjfBLV92qhwTNnuwRpcK
	3e0WhdTZLqbQz+FAhnwnOwIwqGSGlDYGgRbkrQ+PdDPlkdCOqq9AN+L1xvR7hW/ud1N9P/F4uUO
	xBb2UcCYC
X-Received: by 2002:a05:620a:8805:b0:93a:ea:b00e with SMTP id af79cd13be357-93a1873ea7bmr625603585a.30.1789390122684;
        Mon, 14 Sep 2026 05:48:42 -0700 (PDT)
X-Received: by 2002:a05:620a:8805:b0:93a:ea:b00e with SMTP id af79cd13be357-93a1873ea7bmr625596185a.30.1789390122112;
        Mon, 14 Sep 2026 05:48:42 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:48:41 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:14 +0300
Subject: [PATCH v4 15/52] clk: qcom: gcc-eliza: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-15-9d5a606ada33@oss.qualcomm.com>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=819;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=jmorG+sVx1jmE+pmAn5LNDloJj3Nod1ZC9WT9PbJf3Q=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zaufGkBkQRsJxo2/bQoif3cxlSWIc+XhYlI
 ZVdzUW/8diJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs2gAKCRAbX0TJAJUV
 Vi5GEADFusoKNY4do5pOeuZqkyIlpRTEg9uZhnVCC4QjqPFA7RA3lSWiV5WVeix6rXLpmFvdvBS
 ggyDagIvL9W5u2EqZqqouZ7Udn5iXDhe+DHItJpB86z/eLc5+zF0eqmbB6vEimTZLq0YT47JEDT
 tbA9e1v9MYJRnmA7ZAZ+LHFPguxONS4qRocQ2KUGMIAgUHY7sz6KASUuV/SZraXGHhY6dl31kef
 IMBbZVo8Gp7fyBtal5afxSWiIHRunb5V2CpVUkek7QPVz9M3jpk1j5IcpwMyAGV/jwZ+H0Nkumb
 w30FqlyMlcxfpJpNTaf0mjWHfg0LM+ALK643l3iHRh405LMKnbveHMlg9GnWquGhqjI6f0QiddD
 FYTGpz4E2JkOYTw4PkYmgp656wfAVoeMCCYU71TVEarGeUiNEZn4qI1epCzY/9rdxkf9iAKRjK6
 wyHgCLrZO6E2odtiK0mXxkaTAiStjXRzua2jM2QZfO0d6aeMfFNAgMr5MOa2O6t7wBgrQbC7EaC
 uQNKr4U8jFjXSOlHNwX5UPhSdhyPjaedhiKN0oIyI6tOrqZeF6qm+S2sJ1zO8VXJBZdq8NcbRiE
 XDpWseUFovx+q7L8/Usn43Y+5f1XlMRs8zj3/w/S8sjVSG7bZKxyxHJWv+Nc3bWt7sYUgBfu5CF
 wqAQaO412DD6NRA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfX9vK6Yg4zYH9p
 /zBU6P+yBaq1tyUuIuvzHqrkEL/P/6TMEwWYRVXyBKvsGUbDXeu9gdnBgWEv44Ft6xjCjVpKhyl
 HA64qBwyUNJqvJs1tdSvOtU4BuZm6C6qoE+Uv1YtThbb6trDebL+O/PDJIB5uG8L5DsGP2KtZ7e
 fHiCp43uramxoPPETFH/l6DG2M51jpHj/wxy5kE08VxaJeV4trtXlXzCqd6RrI7DtvrwT9awtgx
 MJg28FMMwEdRXVFzmcUG1EKeA0LcYT9ZoG/8dPXQQj/DaIdn4jJEqnGWLTJf66dk1IJiLTOpK4D
 g4X4jwG8Onm0XCwrfQ9UvvyDegEZFQ9mpZP9XW2rgC5qHh9og/03My42xJfP9tPjeK0FNbz4HSh
 ehVplQxsXgzbQXtNb+oY1Z3VOoDBF2pPZBRVu7vCTJ9RwzP5/c46B3UHYrqIVyNdN6ZGBMaCrM3
 YOhG9ZoLl9Z+yOrB8iQ==
X-Proofpoint-GUID: 9yb4zR9c8ORbyeGPvDNxNK8vmRF4ci--
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfXzSU7phryqQTT
 aUZntvjzWFfC/pVeJQDEMw9aepHL89JCFOhUfqgXaeDKvpAI5lJjOAR/ddzBpYdSHoNcviC1IKB
 /p37LbfQvYr7tQ2lYzsHTRXpPVtY86o=
X-Proofpoint-ORIG-GUID: 9yb4zR9c8ORbyeGPvDNxNK8vmRF4ci--
X-Authority-Analysis: v=2.4 cv=MsrHeGae c=1 sm=1 tr=0 ts=6aa7ed2b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=lgFvq8bPxKKT3kYZ0-wA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140182

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Fixes: 6393a36fe184 ("clk: qcom: Add support for Global clock controller on Eliza")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-eliza.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-eliza.c b/drivers/clk/qcom/gcc-eliza.c
index fe18942a59ac..e26e6e6e52f1 100644
--- a/drivers/clk/qcom/gcc-eliza.c
+++ b/drivers/clk/qcom/gcc-eliza.c
@@ -3068,6 +3068,7 @@ static const struct qcom_cc_desc gcc_eliza_desc = {
 	.num_resets = ARRAY_SIZE(gcc_eliza_resets),
 	.gdscs = gcc_eliza_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_eliza_gdscs),
+	.use_rpm = true,
 	.driver_data = &gcc_eliza_driver_data,
 };
 

-- 
2.54.0

