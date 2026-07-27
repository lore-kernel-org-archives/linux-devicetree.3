Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD55C435EDE
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 18:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785176975; cv=none; b=L+f6sV4mZYy65EQjYMy9IIW8A9YLo3BF59H+fBoLFrZwMPmTVuCefrx9ofDLPDbMKhUt2fw49dkaYXYO7TPMwo875GdnOWMelG/2EtcHxvYPcyPhVBlNXsL03dgqeR+n0tZfIoVIl+QEHMt87GkpLO/yiUEO4UIjnCPBOIXQGPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785176975; c=relaxed/simple;
	bh=0TMQsD8HdtxtrloI4SS2ZbE/Q6kNWOy27N0zCHKXDDE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=khWWn+4O6Pjl+jhlyLDo5j7/U+0lJNJ93iPf7LDNGZt9x/nn0le/AKXE7vpitLlptXqi+pdyqjj8eNONH/8uPn8+AHwC8BLGqDt5gJbqFQQRQxuKqwpVsHX4x4uRJXoiqp8M+o0m5hKH/UVXhI8bgNmVfwtODAX+n+kYHCd0Q1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dhC447lT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j4FUIJQX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dhC447lT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j4FUIJQX"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RIC0sI4028788
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 18:29:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Iu6qBkEAtXGL2JpseAyS6osyszuia6QPp7utfQoubVw=; b=dhC447lTIW/OYwAg
	8BWUwYu+N5LTrwQQPvwm6tS/SXekFy/9z0V5DA1okIhqAY0Qp9TEDwUuKDA/uYNd
	bStUaU7tvMzW7NGlALrxgKq0uK8cOI2rWuY3Gst1zPc4UXEKZ7bDmUUp7P3EHNel
	YDMes8+W/agipBkuHbUJN+LaswY3n+yTfKr8zeeV2TXBPm0DmewUkmIDfRyxcrHd
	Fzd9RvF7ZqEDAhfVqQLem4GJukMmKOTuF7KccZlirS1huFEfU+eF6H+vQ1T3lW5e
	re7e3dlfo00pNYRbXMJ6ID3jEI0sW1AsiRX6E1u+Lin3//FRGzgFgW/z/VnM0RRQ
	xGhzcQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4v6aatq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 18:29:32 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c88cfe287e1so2166433a12.1
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 11:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785176972; x=1785781772; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Iu6qBkEAtXGL2JpseAyS6osyszuia6QPp7utfQoubVw=;
        b=j4FUIJQXgjs5kNxlbXJvp8jQwx4GsRRHr9nrwS2roDb3fMSRc8y89Y/RuC1ysMP+pi
         7pPqNL9c2BgqU+zyhgbYUAgR3MrAZFGwV+f9fmao5vBuKSyMSwI5sH8kuJcUssafQMbo
         VI46N8kxedbByoMu39gwJjXdH7MBqiM0LdwyWRdHMf2nurs9iZKMsz088Zn4K0+zKnog
         kUvcntiGvHhnQDyJXLEo+iGie7oLdeVxokkEOlkro7rsaqjMYUndFE6gTcGOkYrK68x6
         aT1NTWRARH1ktZwPbgX8LyQon4gsvbWI/+MR+Zj5ExY+v6YVCmWwSerutE0Zu7Kc6KmQ
         Mc5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785176972; x=1785781772;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Iu6qBkEAtXGL2JpseAyS6osyszuia6QPp7utfQoubVw=;
        b=oEltmqCH6fN2co+jEMiWkPur2f3d242eKIfycfUE5RwB7yUibC+vVJdiXZ+au7zFA1
         MH4SDNGLGHSvTbVXi22A5coNSYrlt6gWUktfTECGwuYSuTaWIXm2Y/sLnhHfqrOTkk9c
         sC5M6SUATKbI9EGFmh+zj2Drdmz+TAXkejKkyRZQqiAMTcwSruYiXGx2qQrKQBPgBrzI
         Qe/lW0VOMwP8bVJ9rB9K7igehOKi//qxB6bdfuSIAIIU/nGdsh6qi1fomMJ+v3GxsooN
         Smk4DDBrrVV0kPsCgfg+aqImtsBZ40+wgH9N6weaqUI5fj9VfxRyfpE5QnPe90B+Qtgm
         1Y+w==
X-Forwarded-Encrypted: i=1; AHgh+RqAAmAnsc2pKK7BtMGfyYX4clW6oOAtaCGZHaPmzs+ZAkdrN0R4LqjcCoLFpXwGWlwW0+JHaBXaVjwh@vger.kernel.org
X-Gm-Message-State: AOJu0YxNTgjwVkIsoeDCaeSm0nPgKxDLd9LmFzlp77ydIuMBtrzCjJBL
	FlO4lxwVdwoeOqFE340ruRzcgoG1xnGqVd2icy3MFRNLJbbZOoVNNDy879aNALFHMj8psLUf555
	SXoWAtCjhVczxVpMOeWeTLZDVFMlr2PNKAyu3JRuFLAW5R4iQKNyy7n2QjulDRiVp
X-Gm-Gg: AR+sD13YvrWkFq4QhAN7HBgYvn/r5ew9WFEUshuOh0PldvI39oN57FuzrO4uT829H2C
	KBdmUyR6V8gbFW7nNENcgztLvBFY1hXgZ8sVGkCD6yZYLKDpbh92woyflX4gGXMvqGui+BSeRnN
	3XHAdbSWmJEesLJYgjwXvom1VDMWNGj8q8muxcnOgDdlYmWCfJ/cooDfi6ikD9/i9Glm+fSnQaK
	hHWGtSiKvLYrLRvKLBPgL/Potmu1OSi0K9K9H9fzLDSXqeHrALgf1l+DdbLRU49jfGvjMPTYtzV
	YoJ5Fy5R3Mb9K1L4By0b1MkiigHwcgDnoDKXVxZpQPIfFIGJDdLBwX7IvRKY8IdP7uONAXnFEof
	J25DNuHHIcNjeMIumLPT5aNUMRqcj9ck=
X-Received: by 2002:a05:6a21:6b02:b0:3c3:954d:279a with SMTP id adf61e73a8af0-3c67daecd2bmr9207871637.33.1785176971525;
        Mon, 27 Jul 2026 11:29:31 -0700 (PDT)
X-Received: by 2002:a05:6a21:6b02:b0:3c3:954d:279a with SMTP id adf61e73a8af0-3c67daecd2bmr9207842637.33.1785176971126;
        Mon, 27 Jul 2026 11:29:31 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc5a04b2sm31963087eec.28.2026.07.27.11.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 11:29:30 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 23:59:09 +0530
Subject: [PATCH 1/2] dt-bindings: clock: qcom: Add Maili camera clock
 controllers
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-maili_camcc-v1-1-01dbd7ddb276@oss.qualcomm.com>
References: <20260727-maili_camcc-v1-0-01dbd7ddb276@oss.qualcomm.com>
In-Reply-To: <20260727-maili_camcc-v1-0-01dbd7ddb276@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE3MCBTYWx0ZWRfXzLt379qIW03m
 KH0FQAvjFsf4P+GcLxR5V/s8LqPKCJnA8bFFSd3XrNB/YTijNCwqFWtfZz9SNp06jfmhJmJJgBH
 BYnFD8Wv2i5GYvqf02EEFu83SSi+rdc=
X-Proofpoint-GUID: UGTlYq9CrZMqLtuoMcT4oQYoLuv61KLY
X-Authority-Analysis: v=2.4 cv=ev3vCIpX c=1 sm=1 tr=0 ts=6a67a38c cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=itb3sOZw9SQNzPTiAAwA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: UGTlYq9CrZMqLtuoMcT4oQYoLuv61KLY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE3MCBTYWx0ZWRfX/j0QItYrGPVk
 2d7JjCbyqpiSTvKqeZineYMUK/YthCsqMZP0P2lsniVH/fjKFV7qsFLhhkSkWGFEI9dJqkn/ENF
 PFpNKK6ZOhtWvUIKHZ9h2ZX1p9Jo5zbDJlZAbwb2yjqgThScKa3eoSgN/+dkuHmCywopjUZo6J4
 G08A+Ja7y+fzkdPmLdhTRHelne2fE01+bbxLqHFxt5vLcOnuN8176CgGOL1SycRFkYH2WGCy3Jn
 WWfNWqJK1eXIWZDMFeHCrDnYB2/jKgo9T6u6j0i7yRYm8uydaNLnW4ji+DbN/TUeujXY2CBflrY
 4ZWC7YYPgVuu4GMejAMAQDf+xohR+R+6G/kHRstewipFYbC6UH8Cf8N8/Q+QYlrYQbJsMR0tbaC
 b8eNIV2S7C+5c6N3hW+44L5qczyk6FBJFUjNO3VgBCPFxc58Vpqx5G8bsyEgokavT5pwJUFGwoy
 K4y3KujfX5zeUf350WQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_05,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607270170

Maili camcc is a derivative of Hawi camcc with minor changes, and
hence reuses the Hawi camcc driver. Maili cambistmclkcc is the same
as Kaanapali cambistmclkcc and falls back to it. Add the compatibles
for the camera clock controllers on the Qualcomm Maili SoC.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
index cdc19418c06471ea8f3233e96c0169fb8b590942..4b961226a2d1a1fecaa0bbda004974f4a1e9592f 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
@@ -32,6 +32,7 @@ properties:
           - qcom,hawi-camcc
           - qcom,kaanapali-cambistmclkcc
           - qcom,kaanapali-camcc
+          - qcom,maili-camcc
           - qcom,sm8450-camcc
           - qcom,sm8475-camcc
           - qcom,sm8550-camcc
@@ -41,6 +42,7 @@ properties:
       - items:
           - enum:
               - qcom,hawi-cambistmclkcc
+              - qcom,maili-cambistmclkcc
           - const: qcom,kaanapali-cambistmclkcc
 
   clocks:

-- 
2.34.1

