Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F14040586A
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 17:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779815594; cv=none; b=L1pWBsjLOOyfcNfFiBozatupPbvHHYhbd+xWqiQjjUwtI9vESdK2qjhD97k9Wwrx5Pp9SHEwkG12nusxNJffHByKwmLIh4wadGNVArLX2R9Qds13aOECIsZq17eif+pFASdaIgxD+d0G8HWjZl9QhO6MtGFTKDnS7KfIVzv9q+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779815594; c=relaxed/simple;
	bh=uac65xjlQks8nBNaxDifvO7AVmUW4BX94tfMWeRps9U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MxtchpFjFVt9RoxgRzzZ5/9HBLoyTcE3sD/7HVbXiYlLLVnAzH+QAC77zUOghw71iykThZjf3XN+c7ekSwPjbJjpa3xZrd8SAJpKDEW2B6kA2PviWmIONlupbxUqf+CB8025q5jnTw8E7DPuEDcoXFAKOIJMGbHj7FuuRqUqv54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fP85kTQw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YGUAHtbE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fP85kTQw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YGUAHtbE"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QH1eir069550
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 17:13:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	myApPVC79MUKSl1wI2Gc0zirfHAtnCQO6eIvLGQumqo=; b=fP85kTQwAjLmK8j4
	Bt/s9gGVLLQ/MLsVdLGS3ORhK3gKJcWIahzQeokIqZvMK0hye2ZrxAO2J/DOOkw2
	nU6Pchy7qH2n9CHEDOnbIryC6yk6NNEzllAJxoHB4t5O078E9QVpRCJBLS0U2flD
	iNZFW9U2Bzh/0dJv9hfw8gDLh/KAISaVS2Fr9KR63wxsozGbb2UktqHF1f6wMw/A
	QoC+vx0JqIjzuOITbfA9TmjYbJDks0JXkmIpby/XIIxFxvPKFLVCe9JTPeSkJOab
	w6PTPnUKm3JTU8UTtT7WplL8MQO2mfzklkmBuqjPRYYQbmpBkn+llp5tZLDzu/Zi
	s4XK7A==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edc2yha5b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 17:13:12 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82fa5ecd760so5249760b3a.0
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 10:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779815591; x=1780420391; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=myApPVC79MUKSl1wI2Gc0zirfHAtnCQO6eIvLGQumqo=;
        b=YGUAHtbEpEUTtpQniexhH6ex0mwXGasMN40+IiZ6osm6rFHXvz6pK/79tQvyIPzdzC
         tlpnfrSwul6eUQae4HRExYGzxoe2um6zxkYW7Ez1s2AH6umicmwFN9+vuHXQ+Cum+5JV
         0zXvTSbEBt9yNXxWDp6uBmn5OmMro/L/BhR+K8zd36egFaw4flXsBU25GHdjhF6P8T4b
         MlOfLPCnk/P5kv3X/I8rwP13W1QIDQEE3bJ5ERhdSOKgzUEaEmDQoL5XTdaj1SjA6uyF
         aN38OqfWeDp7b+TDMzRhML2TeRNihqEpPDVepEwGCQpA33wAQN0R1VIkLxtSc62oy1z7
         XMSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779815591; x=1780420391;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=myApPVC79MUKSl1wI2Gc0zirfHAtnCQO6eIvLGQumqo=;
        b=CDEEPYpc9Zf5iBi8Ouzw25wOmh86atzs6JDTYr+zFiQHBTH5DrxWyN/B92tz4WB1yg
         xvgKIuW3oeN7Q7Qp1sqK7Jjy6DA9UVx7IBl19Jqj43JxjQKBA3PcgD31ywjINPYV0TPe
         bxbRenfbZfM2WQUL6GtlbItitvsg/tQ5BnztKK5pNh/c0Oz+MQVGG1S6t5Nnte9Av4Ya
         aCuaHOp4z8Nwf9+QJbeEoeMaRk3POAiPd1WT4x/UyD3Ww4/f63mN2ags6Uyjc0wlNKML
         6gVpBkGogs1z6O1BcfR2OkZAsaJnB00LQvrBH7pGyQSOMf1Sire66IgLNVeEUiv1x1a+
         nB4g==
X-Forwarded-Encrypted: i=1; AFNElJ+ArUbqV7gCRYj37sLEa2xM/OJ8LMggvD/+W9ueJhrZmw0mtAjXA25lag0sIS//ysTgMDVcmDlIqWG2@vger.kernel.org
X-Gm-Message-State: AOJu0YwEGtFPyV0FsVq/hZSFbIajPJRk17Y7OzuNezmrr/2iK0l+5TiF
	V+PhSOJt0raPE5cZNY1bJWzdmzK+JftO/m1YX2g7hi05HTtekHBVkdnLQ4+o91l7mGpganQD/hP
	tf86e4X845+z8/piTxQgmJc6yfWq4EdE4+YTLKcyzQ+No8jPNd8b20vEWe9+l5pgT
X-Gm-Gg: Acq92OEWEpqbu4/1zwpA09Jm4A/+dNNmqj2lJrNhUA45NwAAORaIgZAeTX9uNfaN2sz
	oJ/6IvxqhJbG+NJxRdn3OiYEYDdRa9hdWZsd0kOppeUw8gqciFb6xBzvplOnj833PX5V3ppIgT4
	HC8xIAr+fzvz97438aXspi3vAdCenaO36Vla0Kz9Ztw9Lhsd+fuIMTxY8Tk/PwNOCRBtFCfe+4b
	BPIWNunymI028RNU2B8aWld0wfVQk2m8hAvVsjVV9MRcTEC3gd/KPs9vJYTUbzc1xJx8EZnVFcg
	6fdtnnLC42rjYv7N0S6LTNf1tt5XZoMr+qUSxEF4jJfa6r8rnz4XbRiLG1z8suN2NKjxqrziSYd
	oB3hvI6GAMu+OoD5fYkJ+3EB/pTiy1ebjIz30qODgqRhANuWiNXfX
X-Received: by 2002:a05:6a00:2da4:b0:82f:85c8:fc19 with SMTP id d2e1a72fcca58-8415f314ba2mr17283029b3a.11.1779815591512;
        Tue, 26 May 2026 10:13:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:2da4:b0:82f:85c8:fc19 with SMTP id d2e1a72fcca58-8415f314ba2mr17282999b3a.11.1779815590996;
        Tue, 26 May 2026 10:13:10 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84165009761sm15736235b3a.60.2026.05.26.10.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 10:13:10 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Tue, 26 May 2026 22:42:46 +0530
Subject: [PATCH 2/8] dt-bindings: i2c: qcom-cci: Document Shikra compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-shikra-camss-review-v1-2-645d2c8c75a7@qti.qualcomm.com>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
In-Reply-To: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: j0zFhz9Uk8lItQeaSEgGfdxBjRl9WW6j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDE0OSBTYWx0ZWRfX2R+NfyqZYLKJ
 YjsGVDm9ywelxIBfzxYizaX3o5LUOMzvD+9/aw8QOlqpXzT31cVDNEA7iMjvAUkyJ1DFPFA6mLo
 aOkwrPhx13bSkEW5wPhahZG11e2Lpxt82vOIl622fnyo75q4oV2KIO2HxVIWx7r53kZ9HsGo7Aa
 60bQhVL68tEEbrCvbIVgoNZbWcLDaO1xWJgw1A3/iw91CszrkkCrv2uDGRJkkfDomo9Slp6cYZI
 dsYP7eNrMoqh6ZIeooOxMY4ZmokAumV2Otbn3JhkXQ0kp0lwTkBBSqpYgaCIM0orFpp0xTBgvya
 kmFATzNjFzbHS9Vbzbth6gj8WN5zuyOn6/fueUJoi/4+Pr1zLrltToRK0NVy+Nu412tHBQwRNc7
 TwQ3kVh26zbcmdOm/I1Yf1Fd4Fz41yAAjctN/tN7TR9/bwXX+xcO1rBhsFOUynNZpi+osJi4M7V
 7VLpb8jQxhwtTt8rVpQ==
X-Authority-Analysis: v=2.4 cv=CYg4Irrl c=1 sm=1 tr=0 ts=6a15d4a8 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=phzA4CzYhpZqrDFsW3YA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: j0zFhz9Uk8lItQeaSEgGfdxBjRl9WW6j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_04,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1011 bulkscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260149

Add Shikra compatible consistent with CAMSS CCI interfaces.
It requires only two clocks.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index 7c497a358e1dc8cec8b31c17bfedf315e4e00606..c94069afd8d06dbb08ddd6b49e2de7dc7acdc29a 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -35,6 +35,7 @@ properties:
               - qcom,sc8280xp-cci
               - qcom,sdm670-cci
               - qcom,sdm845-cci
+              - qcom,shikra-cci
               - qcom,sm6150-cci
               - qcom,sm6350-cci
               - qcom,sm8250-cci
@@ -137,6 +138,7 @@ allOf:
               - qcom,kaanapali-cci
               - qcom,qcm2290-cci
               - qcom,qcs8300-cci
+              - qcom,shikra-cci
               - qcom,sm8750-cci
     then:
       properties:

-- 
2.34.1

