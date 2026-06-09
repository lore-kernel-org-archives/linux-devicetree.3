Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412DF3F076D
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 09:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780996155; cv=none; b=tsEwHdwTIw8AtusnEg+1NAROmov9m4yOpXaQCEddauFJgVzLiJvYxJUPapAB9T3GwGzSkCEeD1V8PJM9Af3n7ZDkv+1X0TacxLNibAH6CG42h5cen43i1cJgiu1ogFb4jHJSL6tUqusFjnZzN4kMQNJhe+vfH9YhbinvhZOkZVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780996155; c=relaxed/simple;
	bh=qkD7hfP5GdrLokwUs4o0VJbAwr0oen558Kmn380Nmbg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EXvbFgER6C9cW6eRz2b/xUFyaxfUk9VLVu98PLgx27/EkeMSLS2Ta6n7WuapJ079Bq9/nPlSyT5mkup0LekovasM2mjDd3VzZNOAXXxdP5P6KqyiN4pny2ZQi+K6ouGwJKD3B8yzahmseF/0nQnV9yDz2HN1VQSnHUGmkJPiQJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=anjuNBD4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KlJhd0sN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="anjuNBD4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KlJhd0sN"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597rbU12034571
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 09:09:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uel7Dn8g9zRhKX5QtlCfVvgluNSy+/SDTRB8bCzSu6Q=; b=anjuNBD42C2wlCUQ
	YhAkT6p7GisTv/V2AdHaY5cdJeTLlNchamE0lQFdv3cGPnf416gHzrEv/66kkHoS
	qUBE+eJTN8VOwQm54OdLP6t/WtYmrw1fhLXE2zI9hlYxhWXfh7vs9z9xnlYVsElZ
	L8EHURrymBTpNy5zq3C5n/6nMAlhFl2f2hq8QlE9ANf7P61Oyeq3duoRWNV/b8+l
	LMkxPhJe0zPBD8g8hXjMbnVEXl5reKbbLZslYqpoRNiSd2bgxXVvyDlkLlpQP02a
	FIy66xjPuUFH71EET0vt+wNeYZOiocNFzl4UiLwIsCI42UceMfpiELh/gPrdrbE6
	nOHgyQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeeardas-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 09:09:13 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-304ea42b025so2831802eec.0
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 02:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780996152; x=1781600952; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uel7Dn8g9zRhKX5QtlCfVvgluNSy+/SDTRB8bCzSu6Q=;
        b=KlJhd0sNIOndSkV1m2rWMSj5QewprTndMTPoIS7Gybg3EfWA/FaFyHLZTt243D2V8g
         ipE/MO8+r22yrVQuPxrYb5ls8VbyTFRVWehSV+1NovmJlAVpmSO1zwxij4cQ17iVBFfL
         iSaUTJ2CXlAOo+fkiS27r9qOCM102OxHG2X0Ne9dp0kdymx2XzIjDpLr2Mcf/ZaJuIl2
         7Rw13zI2Rc5PDN4zUSNNuTKItq8PFnEB1CNtyvI5kfpusB6GhcSv+oqXwGMQ9K2U0wTN
         q90OjOwMQy44bmROCaGjjUBtmIZeZrJnsrycX84DhpHN+LwGtQdm5OVq3cUwYnztH1RS
         pCeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780996152; x=1781600952;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uel7Dn8g9zRhKX5QtlCfVvgluNSy+/SDTRB8bCzSu6Q=;
        b=VkT09F5SBDy6u9e5NJ+1aBVp1e3HuFqVyICk2LNMnxWD+SlKgwGovtGUvxlhfvKc8l
         uKLlpZlrQIhs8JSQ42QsFCbBZZKvJlYH+3f08G0VhRcyHCcKDPz5Zws6UoTyV7k+2yx7
         ASibOsycZqNefqMRBiAsBl2ix1YJkVDKcfwmPWytsnWPHdsrc7OMEhWDNYc/fZ21+4o2
         HniY9/wKfGV6AXsEItRNMBhLrvx/xFS54SyHYVHypI+wlrmd4+JafC+UbiTSSB3D3261
         B/dz4SvuCmSEH2Xuwp0Mmen2YdFoIyZFs8LJqTwJ+PxtNGZhOKbeIpF0Th3Rys427jTo
         W6UA==
X-Forwarded-Encrypted: i=1; AFNElJ+y8yiLqen0DHmfuTQOymaxfwwIVIQJZYLroxyzq6+puPYKxyrPu+1OzgQctZ3GzBou+c30jx6wCJPo@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu8UIoS32EOpTKeAY4sBBtHkU/Beqn3XQwpdlkDaepxJAdh12Q
	1tnAh+8oF3/gQEar1QuuIUWmFnOoOhdtBSdjrUEgeEo+xvhGq76/h5cs2a+DrUEiVvUo6xoZvcj
	NWWssi1IvTNxpZEroGTi0r23pIg5/4IVjpeAMWDVmA7mR8evLBBJp5JFzRuUe5dS1
X-Gm-Gg: Acq92OEgbjAaxXgDwz+1uQxtGw6Z/3of9fVEK8D8x7Jd1IqHNoBvIOuvbFXCNTeXZPC
	MbSsZGIKBEfOJaMEotiRT5fzJMMWRuppKKZhJyYVOU0AzhTrCdFJXalGt8M3JiqGJWFJqAq6aik
	OCc9s9X7c++AQwTAyTHrRdEtTBEQgiz/NMEM+4CxUITLuHlEk3WJuZqB17ir93AF7i/5sMHI23A
	waadjMiJTqRoTeTbFN8IUeZskeE/Re8SoZe4v1/SknDwi42ZUNf2cGqGFXtwfUCEmgatKSOQoVG
	6174rGBKi8yrOs3NlFfiQiYqCvJ56tP/Su6K5fT/EgJAnKc1nF9Gpx/4tfTjx0zkSxXzDFQmOFB
	WLcBDRf/IKqbwBCDl8w8RQGsQYUbaynkcjd3bmKhMEEZaQ79XU+LVMwjmnUuhUotW9kxko8hilO
	R8CXC1OIo=
X-Received: by 2002:a05:7300:a887:b0:304:ddc3:2c35 with SMTP id 5a478bee46e88-3077ffb4d52mr8691056eec.10.1780996152188;
        Tue, 09 Jun 2026 02:09:12 -0700 (PDT)
X-Received: by 2002:a05:7300:a887:b0:304:ddc3:2c35 with SMTP id 5a478bee46e88-3077ffb4d52mr8691036eec.10.1780996151726;
        Tue, 09 Jun 2026 02:09:11 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df102a1sm19356606eec.20.2026.06.09.02.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 02:09:11 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 02:08:56 -0700
Subject: [PATCH 1/2] dt-bindings: crypto: qcom,prng: Document Maili TRNG
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-maili-crypto-v1-1-0f577df56a61@oss.qualcomm.com>
References: <20260609-maili-crypto-v1-0-0f577df56a61@oss.qualcomm.com>
In-Reply-To: <20260609-maili-crypto-v1-0-0f577df56a61@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780996150; l=902;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=qkD7hfP5GdrLokwUs4o0VJbAwr0oen558Kmn380Nmbg=;
 b=eEpItHIskxCiKI3mzi/3Qp/HdOJ5m+DT6L5nVBwhwChSI4HQ7f4spRIMI+hYp+ghURcv9j7Ej
 dd0hdKJFRswAEo8+mbY9ZtwB/zij2OXM4xjZJoe75qF06xED1z33DCk
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-ORIG-GUID: jIvmFLKt7TFmiHwd3RShbFW6AgYCEc_b
X-Authority-Analysis: v=2.4 cv=Iey3n2qa c=1 sm=1 tr=0 ts=6a27d839 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=FNAlisUgfRrBHgIoG2YA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA4NCBTYWx0ZWRfXycuhbg+wAJnj
 w6af/py3ijuHcHSUEzAeSDuk8rxidLXaNinbke9KkW1y7DuKFhshIfNEQbK6U2BWGZ/wBBseolQ
 Vld8yni5qTkeEComIkDgOWNSbC2Xbl0c7G6vN+tE7hCCRUbj37k9Z+bIOwLsp+p8U3vtEhxy3Bp
 wlqVU4TIPZGcmpyVUUzglHIuv4p1ZK1kifiUcYIJtbLmCbP104qNL3+cf6JlZVD/oT2aZYmxkdS
 I7AGob7ulIOsrRl3mODIgq9QbKF/MDMpxTbHTlcoHNSSAwEKfFh7iVy/IWJmWN28cPfd63FQdGH
 2i2mTKIlUZd0Kdhvf0tpE7T8iaE7jVGZ5LrNS52j65RjwSiLT3+q/pGkIX35X0PJx2wkiQzx/Zn
 Cpy8hwTH+0s5OIARVrsaWm6cHyhRmLhYcAXvkYSuL4iOoyRuM8rfgzsBI4daIqiwn+oAYlsXIza
 xYnwFNtZ0Li0RI93kyQ==
X-Proofpoint-GUID: jIvmFLKt7TFmiHwd3RShbFW6AgYCEc_b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090084

Maili SoC has the True Random Number Generator (TRNG) which is compatible
with the baseline IP "qcom,trng". Hence, document the compatible as such.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/crypto/qcom,prng.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
index dc270c8aedf3..6116289ec413 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
@@ -23,6 +23,7 @@ properties:
               - qcom,ipq5424-trng
               - qcom,ipq9574-trng
               - qcom,kaanapali-trng
+              - qcom,maili-trng
               - qcom,milos-trng
               - qcom,nord-trng
               - qcom,qcs615-trng

-- 
2.34.1

