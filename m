Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A774DD3CD
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 16:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790008864; cv=none; b=bFoTwnEIzU7eg4XlGjI1uv71SdRWg43U2aRRoiRj6Fyqq/OdCEvzd9CwYAi0Y87L94SvVyLTxjgwyNTFuQ3yILhOrRlFVM4cY/JS7aiDZX1x3CmtjMdSYQQLhHcYMTEZ+L2CgvdJ5n2YXtsEf5Q23rrUJs7L1aysiaiWk1iDlaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790008864; c=relaxed/simple;
	bh=w5cFDvauDgruD+36S54d4kqkMhyWmgilo8XcvR7nbDc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dMaMHX3rpeTwS01sLyUSYd3ggw1EWwKtRZt7WDcZy0/3FuJEgqm5bKM0pywVKW1Zt+Bp1cIZkBlArxmA9XUxAWn0Lv+8PZ9EbHdCx4ExTZAK2ykyn1mOUzlDqVqypbV1JQSiLc/IWrQphnmrIrnQTdmfEAqMVR0LL+jwW2QQn+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GxKSG1x5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iimmqeZI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GxKSG1x5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iimmqeZI"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LFAERp1677359
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 16:41:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	thdcCPtM+tGMNytTaRpSP/GhqNBf7dWlDzoV9SQrUyo=; b=GxKSG1x5mvidL77L
	IWwyW0eg60bMFM4QNdHyt6fXxP8iZKGb9RQLOQu06dysUUhZSGDavsGlxF3Cdlo9
	gJ2I2dnJm1c2XEczW25phVZ6VAT6uDQ144kE86MY/B9GtbEWmJ2021M4L2Z9egxw
	NZtsVvcRR1AZ5mobyUMWpBCCpyq6DHGlwbKVoGjUf0rxm/JA46NqoIJ1RjefWxEZ
	uiEijYhNXk0GD3qto1CfRbCXta2N59C/aaiPhI4nGj/onP+MTBmgtgIlANIIdiOD
	ujRkBWWwXVvINOFq6JXibm25jCIeuj7pjfe6awW9tfvAV0JyyQNxEIXbobIdftQJ
	f5nTDg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu3cshe4w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 16:41:02 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-86a74698972so3694013b3a.0
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 09:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790008861; x=1790613661; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=thdcCPtM+tGMNytTaRpSP/GhqNBf7dWlDzoV9SQrUyo=;
        b=iimmqeZILgPIzUdWqKDZ95jZWV9Lrbfm5Vs7gtBywf1FC4CRLikm+VboIzqs4oNUg1
         UBFM3CvgzVR0xpjPEZngB/w4oXARkEZyx1sU7/NkD3v2NfFgZxTFCO/15Zmt4Viqalho
         fnvzwDV9IQtrJgbwC2oMHbVf+JsSnvJyhBaGRewvVpDGXkl7jrA5krosJBICFI2/88dm
         IoVKzIL3HnUjw80BJ55zKpeONjSPFUUp5rI03dBERDdqu2NUzZBGrUXd3fl10xJrwfiX
         U23IDa4pDqo8NHpnSm3+7CXMx5/Cs+8T34kJc4dMfJtLQkSXsv7S3RgX2xVUo4RxSX+M
         uLkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790008861; x=1790613661;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=thdcCPtM+tGMNytTaRpSP/GhqNBf7dWlDzoV9SQrUyo=;
        b=gy4aqBfsgGst0CF505TfulIWoV6IGoNsBI25V/Ji8Cwe/xHBpZWJjvqLQlBQxAquHG
         eUHOfUqxy3QVWwhYOupLDjkNM2eZhV90iriJv8uUMVUOwFt1DyESLX4EBfOXhcgw45vJ
         QnJt3vO7qQjTx1B3tZNVJOhaaot+Sct9RmvCjffOkdA45iq0lQkDYdp5ytG3HR77ymNf
         RwOExYEqK1wFvTDgvhKOrCSXqh5mk9yJ9n46kGIroCj1jzdLXOL6ayYryb5JXtPtXSEy
         Shn7nA9UuViSuSAA6TZ3ODpo3LayIpkeI/9Ix7NblGQn2d9Z4b8IhLKeh8j/BxbsUvEp
         DfcA==
X-Forwarded-Encrypted: i=1; AKwUvBxTw02qn229C5ItHv9Hjr2ZAmpOYRYgvFdw/vAr+Ng5VqMi5HxvbXTMFZY3CFacRlrQX8fLGVS3T2cf@vger.kernel.org
X-Gm-Message-State: AFuF++mVnqie1908dCd0UD/SI8cuGlyIKPUAMCtNQMMcF6hDVnSLqR80
	87Ex1dBwLe2xsbdceXI5Ii8fREPo9HRagQiuUbp9RE4YysFV3khwoZjNTvSbsyyoFIu8l+yBXUX
	/Kp4W3Jsx4zAt8NE6mLcOa/DhAQPjO+vE16+rOdcRDb/guJOrbUV17dtR+Grqg712
X-Gm-Gg: AYBFou1UU4g3Ti8+4VKlyqX5jxWlYDgnviWQjB4j1V/WiwkjBb0/GG9cmV9W7iGRxeN
	30532PyNMM08SaU9qQTlmtFJCe4tJ12wRFecMfIiRnKgrn3n7XYoE0I3f1GW0I3qQG2ftfq2rfv
	7XOQlNKI9tZlhr/D3jJ4WWYzYc4rKuBDYjkbEErx9d7cUArzXE+fICDbuSwBVvnDMzPQkJHD7Mw
	Ja+lYFwGzRI1yvdoPYaInbln6CBaUo5CnWDUb22NdffVVB1fCTzNFwwcZ/PT/MoZwhmKpqbbj5Q
	CfauAcIrJ5wYH4+nOnAgl7+WRQY0vtCwHcPhWj1gI26FsC8xhGH/c5wXtRmz7A80GS703CCtI1K
	qrh2+GT0ZVAqfxkqCpFlAnhs8kbqcEco=
X-Received: by 2002:a05:6a00:98f:b0:87a:6eb:ba50 with SMTP id d2e1a72fcca58-87a06fb013bmr4446882b3a.46.1790008861223;
        Mon, 21 Sep 2026 09:41:01 -0700 (PDT)
X-Received: by 2002:a05:6a00:98f:b0:87a:6eb:ba50 with SMTP id d2e1a72fcca58-87a06fb013bmr4446854b3a.46.1790008860845;
        Mon, 21 Sep 2026 09:41:00 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a8dfe732sm3666086b3a.16.2026.09.21.09.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 09:41:00 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 22:10:33 +0530
Subject: [PATCH v3 1/2] dt-bindings: clock: qcom: Add Maili camera clock
 controllers
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-maili_camcc-v3-1-2f8d739ac2d4@oss.qualcomm.com>
References: <20260921-maili_camcc-v3-0-2f8d739ac2d4@oss.qualcomm.com>
In-Reply-To: <20260921-maili_camcc-v3-0-2f8d739ac2d4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDI0MyBTYWx0ZWRfX3eZ3XiCEqq1Q
 CNUQwzO5Fa3gf16GyxsfM6s2tdg49Cl77aG+6aNnSMnj/7VE5M62BYtg1aDwdx6GzkmxyMawhYu
 Scn2k9ZNWaOoBWigSLk7EW6ScQ92h4A=
X-Proofpoint-GUID: EVcq3jpq-9b4TSLhd7P5L5VdtgBBvNEA
X-Authority-Analysis: v=2.4 cv=QovLTlyd c=1 sm=1 tr=0 ts=6ab15e1e cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=6Q3Ru0MKm2Bx8LS0oh0A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDI0MyBTYWx0ZWRfX/XJ8NtwSDUaR
 s4u9k8/wmXE0PaLU4/krnbkL704/JJDQLB1vJg8C4VNb93m2ArfLKxYN/OH4e4PkV4I87bQ06bf
 CWDO/LT734hTEkRoQDfMEzyOFrwMtYlwxLo1FundxORaWYXLf+x0sLFzgZyulPc3+9Ehoy0Evw0
 siCeiVaU9wC4ow7jE2MMbUgFSSbeuFuJO4FRVjBgkwidPmcIfuxq2J44fIURfuiX/WQcD53tcut
 LjK6TRSzOX2imgV5gDPn3u9pkuRZnB7XJONoSpo0g+b73/6lPRHYq912hyq9ghAvxoSgjnAUJtF
 b8muRIRQhXmj0Bi/gVh77W4TRQgiCkSbnflc98ywP3Y0JQFvItoYQT9FkEra7s7OpFnVVxw4JUz
 2vV2osx9X/+eQY9Y0TbQf3bc391LmHo4SoWHxoojiG6cmg0fnrPj+SNk0L8/4UN7dfMRM9L9MBp
 nS1JEp89LzfYMb155Ng==
X-Proofpoint-ORIG-GUID: EVcq3jpq-9b4TSLhd7P5L5VdtgBBvNEA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210243

Maili camcc is a derivative of Hawi camcc with minor changes, and
hence reuses the Hawi camcc driver. Maili cambistmclkcc is the same
as Kaanapali cambistmclkcc and falls back to it. Add the compatibles
for the camera clock controllers on the Qualcomm Maili SoC.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
index e2a126925e9d50046d1b4ad2506d7921462f5fc0..64f5002931f24003607349aea3ce366f5a8ec369 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
@@ -33,6 +33,7 @@ properties:
           - qcom,hawi-camcc
           - qcom,kaanapali-cambistmclkcc
           - qcom,kaanapali-camcc
+          - qcom,maili-camcc
           - qcom,nord-camcc
           - qcom,sm8450-camcc
           - qcom,sm8475-camcc
@@ -43,6 +44,7 @@ properties:
       - items:
           - enum:
               - qcom,hawi-cambistmclkcc
+              - qcom,maili-cambistmclkcc
           - const: qcom,kaanapali-cambistmclkcc
 
   clocks:
@@ -95,7 +97,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: qcom,hawi-camcc
+            enum:
+              - qcom,hawi-camcc
+              - qcom,maili-camcc
     then:
       required:
         - interconnects

-- 
2.34.1

