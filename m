Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459E719CD0A
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 23:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789082220; cv=none; b=W7EzS563/45qn+epaZCHNRthwG4A9SZlSqZNrwF+AAdEnLMblZuxPOx4gDmbLaTxSgZF5zk71C7Ha1h2EuoDBZ69/vms3xnMe7FYJ5T46UULJ4WcXbG4/HrJN03v6L1RI1W+CU21RRLN+1kc38tzN3ehncAqfWCW1ZpPOnxXcpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789082220; c=relaxed/simple;
	bh=WDKdODQnX8YmpWUSjZe8tftJ86Tlnw6HDxRaNSyktGI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fcwNqEB6hcIdeWqkWbF1pKun7Vy/tLjD9ekgRucBEzJS0WtRO6bMK55GytZoEPLKfbUDcAe2CbMxTCihVYNzIuwf/tvvreDJapwWL4kWKlDQaK8c9O9dBU01by6nmu/qW8i0HFMcQxLO+lgHLsEJHHvZ6cZ878nIY6hvCcl+cmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hXZFHoo5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ENedKHju; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hXZFHoo5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ENedKHju"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ALUe732350312
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 23:16:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=67czAuqUh1r
	qng3/RCVOZLghTGIHqPCTo8SlnOqGdYE=; b=hXZFHoo5zS0Vdk/V4TUtRX0Flvb
	JTVEiwYs6ohD4OJ13VhvjIGMj1jBqmASKoVCLJRMzHk+fUm9h/V1+8roYn8buE5j
	4hMW9J3ZciABkgkEMbu1xDdlmS4nYLfgBK9nOXhfNp4Js9vqJOn2PiTq3lur08sH
	iAa9EwSS1IciznqvBqMTouKakCQc/0z73iGN0XBA8bS8IZxKScQ5Cg+K3TgjxuzC
	36iJ9M3d1mNObf226ZhUVK55vSt43PLX0/uutBXB8vAoE5cwdq1q1HGs0S6h8jO+
	KUbuK9Lj/VCuoThTvGf31TOK5p/f3FHTl6eVoesompxuACgcS/F34h/XizQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkwx9tfx4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 23:16:58 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ce7dff6253so17109115ad.1
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 16:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789082217; x=1789687017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=67czAuqUh1rqng3/RCVOZLghTGIHqPCTo8SlnOqGdYE=;
        b=ENedKHjuMmccacD8qLbY57Png8pyLiu6aBWsLsAFIQeaY6Uk6peJLUGshGRjnzh1Xi
         3ReYPDvfOS4bASPtM6QdgzrsrV53A8PqeS0Uap6CXbpqSIQcpndTN8fUlXJOkamAGEEV
         FYt35Gj9ONf0NkJJEL/r0yGoVa59t5+f8KmNZU20Gkb1FOvegt1bGSxOBNxOLcIr7uPi
         QXo56uOWm71D/BuagJNi8ZjwiX0bxFslbTEGU9E4yb7jRuqtob6NVJhepU+wT5HEenj/
         d0BPBQ6FTiA26v8MD2eOKw7SQl1o3hjJYzJD+DOvg+tLpw4hB+cYkHURqtCDrob0YQVo
         +Ulg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789082217; x=1789687017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=67czAuqUh1rqng3/RCVOZLghTGIHqPCTo8SlnOqGdYE=;
        b=SiUj6Z+FfgBPgOfHWh0bppQVmdwrrRsIN8JEopIEPmiUNLwJwNnkUX3jksRwr7/Bxz
         fkNV+S3Bof7oFTO5YTZEDRvAPxFs8crikq+7RAXEBUQABMR/KNipU7HXtvqXrjgIjzSC
         eAvbTImp2TfJuMAf2ajR1PcjQmPvU2EG678Cn2z6FD5x9nWDMpbvOjQhzCZBXNMyEU+q
         +gZaxB6IQsPE5aGmczyHlVThPzb9jg7AeubaDRepwmz2EyN+rOf4/e9cU2urY5S8F8pq
         +7MglF91OGvPKZpQwfKRSHgzM0+9zVwzJr/Wb48gaLsypRfgwtL4z9KtkKjrVt/MOi92
         Zaxw==
X-Forwarded-Encrypted: i=1; AKwUvBxO43SnYcxXEwB3XKBQ5hqB8MZF5p6dmNasmg7jM+dxqMZFMRJWZoSk/Bg8j+9uM3BJjCPjPr0i3tQO@vger.kernel.org
X-Gm-Message-State: AFuF++kRX8ZJnuGmCo8tKDgeDeFdj5eplyD9aTAPXqgdCr0Uiq/t1n/r
	Rfu3/67O7cXxRvQbGFsOreowMzerhbXZl2C4dfSmYBE90un734lCN/eZO009E9Y7tXDTRgx807C
	/ZfzEXDEwpHYJV/t9ARRSYNXJEGo1Llk3wvf+pLQ2F0RmmauOIEUUYSxo/5KtVdbL
X-Gm-Gg: AYBFou2u4l6nDDHDZ2ujVw70K9e9iYvLzfhpfrTt7fnCO+DaZxiUZzSMykFR0kojHhz
	0QlqEbFV8UlLDihkaiJLnpUPfL4fiE+nlQN7kenxh2TdMtI+IOX16QUazMdDHXJcCTj9UpNOrmL
	43l9E66VFr8NzWh8KE7pd8T0mG1C7GzWyahnyJnj1kWpqjIy66dqIwE3yb9W3McK4daHPc+qUcE
	ro1GCg8yWGhObKMbONaH5DjuqIizjC+4TnPKl8MF5IYP3W+wMnoBIGl38RoAix6dsx4NZ2CQYL9
	dVZnWZTTuKmyfx8gm5w/NWngtNNONDsP1hUpAAE+G558M4F9xXg74ylYJDD7qYxMcRorSzF+5bD
	EkrwtTQzcd3ZsLGRrQD/53lWd+mCKJu18tibg
X-Received: by 2002:a17:902:d4c6:b0:2d8:d4d2:d138 with SMTP id d9443c01a7336-2dd0eeb8a59mr82662075ad.20.1789082217167;
        Thu, 10 Sep 2026 16:16:57 -0700 (PDT)
X-Received: by 2002:a17:902:d4c6:b0:2d8:d4d2:d138 with SMTP id d9443c01a7336-2dd0eeb8a59mr82661875ad.20.1789082216766;
        Thu, 10 Sep 2026 16:16:56 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f7390csm1204374eec.26.2026.09.10.16.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 16:16:56 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 1/9] ASoC: dt-bindings: qcom,apr: Add modem_apps GLINK channel for shikra
Date: Fri, 11 Sep 2026 04:46:34 +0530
Message-Id: <20260910231642.1794948-2-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260910231642.1794948-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260910231642.1794948-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDI5MyBTYWx0ZWRfX4Nq7d2KBNCz4
 BID9rao6dytmlsefwfVZwNpHR8OXLEr3LqdkQrswtRR8/sEQrBL2yRmSJ7RkyvGaa14smdgmPPv
 SMmfekW8J/R1fltiDXTCZG+VpkkGG3qUo74i753DFcT8P9dVVJ9GgySfCaCbglyPhh8rPiN6HAD
 XB87Hv9JKJB2KO6UJPBxTnxRMN2v1PGoPEo+4Q1nXKyylYex0+7puGRkfmG9lGMxgusngEjfMp+
 pwzjsRhDXJZ+IlzwNe0lc3T6spmLCKkPvfkO4YWB3VE2HzsFGK+lZvXfBcyuXNazx1mbbSTPGkS
 wqWht+cmj5fdsl4qlnY8PjZtLGQi9lK8H9KVdIaxdrTbqQJx5n6JAY/MakCV+RrZBf1FqEEzs+j
 DtxEAQNutJVomXmvMo81MbtKvEVdrKuOkrQLl0s7W3oj+a41Q1nddm2Lu9/zJ5BCN+/DGYR5Mcn
 fUDmqvnnlITk+Yho1qQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDI5MyBTYWx0ZWRfX5Uhyv4S/j/rn
 +u/0UT/O9H5MRu6iJ8L7hCK8Rl0BvSJ09Y5MMEQsez8dxEKSWzzdL29GgdvxeW8a2yzGFooiuE+
 OasX+D0v6BsiQRJz6Sa1ReIlgakZ73Y=
X-Proofpoint-GUID: 5V4LZ2S35XAwe5rIs0bX9ewknA0x29Mc
X-Authority-Analysis: v=2.4 cv=TupzFzXh c=1 sm=1 tr=0 ts=6aa33a6a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=HnBwLnbP2RCvDO8bWWEA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 5V4LZ2S35XAwe5rIs0bX9ewknA0x29Mc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_07,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100293

Add support for the modem_apps GLINK channel on Shikra, as audio
processing is handled through the modem DSP.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
index e51acdcaafaf..01250b556985 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
@@ -120,7 +120,9 @@ allOf:
       properties:
         qcom,glink-channels:
           items:
-            - const: adsp_apps
+            - enum:
+                - adsp_apps
+                - modem_apps
         power-domains: false
     else:
       properties:
-- 
2.34.1

