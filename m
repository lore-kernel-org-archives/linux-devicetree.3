Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFDAF3CAA5F
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 08:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787042117; cv=none; b=lhc+L3s7WLd4YC4jt6gHWDsvwAaVrADLdqhdxA2jCsqPPNxGZhFGUrja7jT6K+VGxRY/tqdbqu7yUpDDqruMjDLzrnJFCoaxOB/1X7+D6rAViLLOUZQveswtIIxU3mfVRx7LEna3g9FmltjtTGgvr1llZzTeMVVxNiIU9TR9Z74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787042117; c=relaxed/simple;
	bh=Iz66LCZo5fXFALDvKKx2Nhqu8/6To4QgfSJrxKaluhQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TNix5oJVU0EKpH7nlADHtIGDxU8vMEMFpvSna6K+DnffRu2e7szjLGcuqQ4VOKs1D4/kqCFCvl8wmxQnhvotpvyBeXruOcGkrpH6p/lAPcJ/RPwHMLeM3HeCkorM1h46JfQ0x+IjQCL471C2bkKb5sOkKeI7uwAAsQaboRRSgg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W+plavQQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VaUugGNS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W+plavQQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VaUugGNS"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I8BMWY547345
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 08:35:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=cwon1017CNB2PdCi5r+jtBraiGt1oL+ayCi
	rU5Wancs=; b=W+plavQQoWT96rna1+z1ima+9SWS7KhF+sRghvJb5qZMF15nXKE
	M4XFv9ZY2rJ7D2m8Nx5dsK5p3SxJCo6tmdedj49PgbwCdDbHrcJU/3sxL/7Z7wyR
	+sJshxfDAX8IjAslKMNV2WfbFpKxNIa1XlgldQ87GZJaLWoK3YKnaF/bapY3izKz
	tb8q3d7tZ1UiE3oWhtUjxePV600lE7yTolWmWLCrDPaCeFo5L/36kGHTK+uXBZxj
	wAdq+wIJ1naEcgn4hNEW9yiTSBdqXYw3o5Kxo8MnBRqKKZSToqESis3EGxF3cx6l
	DWDIWlkzjylTm6a6dYo39WBNjASW9DveeKw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4g2p12my-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 08:35:14 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1d7886cdso1123911cf.1
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 01:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787042114; x=1787646914; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cwon1017CNB2PdCi5r+jtBraiGt1oL+ayCirU5Wancs=;
        b=VaUugGNSup5jdBVnjJwNwojxtv3H/KhVpycV3FYG7G2F08Uwubbi2rCvrPD+NrTZ3a
         cluqoegwbuKu3JsAOQZ+ZMlLvbDsVN5EKQM9Do2aqaN3Mjp7xNzt9qd0GJnAcz+kxFC7
         eFfH/2Qpy1tkq3Fjfz4UuPhzTJ0aXdrSk/O8+0LoayrDBFJK6eOLwh2534X/1/Sc+Qpv
         ypfz1sI7o3qqt/gcywn55jkq7lBVT9j73/QNbStkEGYt7Oad1s7E2OKutAlT/6tnqTBy
         vj3t4awZXpy7FclY28hmHB12Nu6jwXUAy/EiXL0lNXBCPVsehYIeXmYtsuddjpce3UUQ
         aLCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787042114; x=1787646914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cwon1017CNB2PdCi5r+jtBraiGt1oL+ayCirU5Wancs=;
        b=ZkTtY63FbOWx0yYuDo+jG5eDU/Xj+jJjZzSXJlzCKYciBhqLpnkYbDfqxgCLcc8FQl
         b03IV+4xEfZEHMU/0bxKoqFMyna3eT7iB/+D/MdayqOyEWesnFWA7xsTDfM8RyJF+7j/
         JGEWIue1kI69Vn5LowKACr8aEIPaSTAhMFXdEWtGNqxagSt/pnvMnXYYTa7arOk2GgPJ
         M141Ba2ELc72bcJ4HJnz4leMnSn1jCb64eL8XVdM3yoCqFCESkzy+yAXXc2GgwFSOsmY
         CPXP11TlGGVQHOv/EJ7w2a7hohj/SP//KkeuPi4WaA6QQ8JAJiZz+HeqlI/N0ztOCUCS
         BkTg==
X-Forwarded-Encrypted: i=1; AHgh+RosuDm2QYg5Y+FSB0QZTEM5kmwXL9YhrvaTfJseDqNNtmxd7YNZy/Mxw+68ga3cEhvw4m+1H7RaF+J9@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8Mf4/67YMp08swWl7B8PlmYyE+1Q74exDq6gzi8vHePZyCfXJ
	0ZIjfsLzbmjHseGGBP6740Gk0QoF5K4qrL9mP94ea2F0hvbR0ZV79qm+l5mqAPCS2gB0lv4hcr5
	plMnBJJIYNPizLyqy0QtkgD95IvJi9j7ANJMXdAm63+mxr99LFtkibNMNLfdvcZyX
X-Gm-Gg: AR+sD115jg/s+DKN5EGj6RUNDTddxvaZxOq7QPPSVjwLCB+mch/T/mvrMheLAOXovT7
	okn7376XtteAvLMR2hLNleErkWdU7fMLK5dDN59Bf0IyQKC9SPpRBbcgxMSI+PEsg9QjJuzkRtG
	E6vPWS1x1D+Fz4h9EtHYAWkNUgCrL9de5fDFMT+yojoudnmHGOqA57/kW2RjcLDnSnOfTmFt1xq
	MDWmRFl8PIi+aR397NETNuteIDSGQL3bUocdNcpl9qWQCvxKjxy1QpSRqjQML1Jhmcl2zzkZI2B
	CkB5zABd6akj39tRxoW1Fthe76TlrPpvqbw1YGn4PsIKaLQCg5smSWFyBUoVI5iluK5oAkwsrO+
	2nTUr6W+fE2IKZfA=
X-Received: by 2002:a05:622a:903:b0:52d:6de2:906c with SMTP id d75a77b69052e-52d85347cd2mr352959311cf.14.1787042114165;
        Tue, 18 Aug 2026 01:35:14 -0700 (PDT)
X-Received: by 2002:a05:622a:903:b0:52d:6de2:906c with SMTP id d75a77b69052e-52d85347cd2mr352959081cf.14.1787042113827;
        Tue, 18 Aug 2026 01:35:13 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4999d0788dasm97850305e9.4.2026.08.18.01.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 01:35:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Suman Anna <s-anna@ti.com>,
        Bhargav Joshi <j.bhargav.u@gmail.com>,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: remoteproc: ti,am3352-wkup-m3: Drop redundant reset-names dependency
Date: Tue, 18 Aug 2026 10:35:07 +0200
Message-ID: <20260818083506.79567-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=878; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=Iz66LCZo5fXFALDvKKx2Nhqu8/6To4QgfSJrxKaluhQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqhBk6Dcet3CpFINyjckBxL+eikCTu5L6LngX+R
 +z3/g0fWzuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaoQZOgAKCRDBN2bmhouD
 1z9KD/wMxwFpvwqGnaTS/Y8R1ixVFa9rPTLHXVwRnMHwdjxg1PSnaNG7eqoGTgc3JfjHyTRC4dc
 d4U1coWqUIKHDDd+qvN9N+XLBgnVwAmN+irkZESl2RVvsaXfZIuukZJRRLXaIzYP3ti2LIP1n1Y
 mKKzqPD0H3mgT35SF5bsS8DmlCFT0eX1fd9MotX3xr0gclnTyNDba8z/WxaQoOTP20O4n6UchwM
 PUh9zLZyyqdmwdv9gezYMorZSQabKpryaGz04ddnR+26VmgVVmggfw1GCikjaQ6EiMARSTSuVSN
 rZ05Qud+9VCeUcC/3dflbOU4OpQlJ75dcJGBV5BMhWvRrHrHFufjVXnDf+h7UV7QRWYIoP8MXTl
 PR5cJEX6wBAbyeqgO1k0TQv2+oy4ggRgnQxj7LiSIRr/DQtzuxJBf/8EHI8gdEGTIZHqaxrSTIC
 HKnu9aWU9umkISy5Ecoc5Dl+Shzq8dvm194TnVkyk3GDTriRdBW4jGkxrUJB0nxUjnQuplmnihb
 XSClUds+RprEqBGK+gzaMb7TuHCwN0BrjLSJouwKJVHzPCvh6PSwQ2MDGPUm55z0MJq5E3u3779
 THcydpnW9+fw7YjWITUjYhWrujr/wWrzvftI9Vj4ZGma7mvIU9Mc0dbHMhTCHBOgW5TNQcLzqGs vOCrrkKj37hkw/g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: WgqmQMKjF6Qa1CjklLee9ZfsnfX5hjsM
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA2MiBTYWx0ZWRfX376KlbJzi3yd
 +d9W864Rk6H50rX4dcM5EN3b9Zf5WkBKgah0D9hUtIE6lFqEr4DQsRgl/Pix9lOCBdT4W0TElJ9
 A+/wfJp4foubZVEprsAKQwU4khwKQo4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA2MiBTYWx0ZWRfXwq7xKfSOyyIV
 XMRwbfnRyoR8teF+YxTRf4LMlQxZXI4offDSURYk81ilii2ZiTgiBjIH0ECW7nO3R2shY8c3MU3
 OK7Z2uFRTg8khiNFiQ0QVfJJbfIZVvcDdAPsPFGnFgvtrjVUgv3CrOdn7vRfkXRKeNfz5wWVRo2
 r0TqUF635z4IIjhFkoQWU70N6eb9KD4q6FcQ+TLcoJEZDuRA+aX+T+RmS7uGWIciumr4tJIZ3BA
 C2ncwEjcVyZks8ZNoP4rSBQZvOGl279YR7kFY2PDcKx6DMeYXrqnwX3coTJcjPcMakyq4gGG4D1
 gV/nmeo2WLsRjEDPLPus2iLWQlmw4sOJm8JJ6JkQptpYZX2sgTobs/HxCvv6XDBDQk4kLp3r5w/
 srBeIhLzP1+PpurQHbWOi5HS56gi4RPa8SxWSMUhf5P0DqcAFws/pTOxXJyIcMjrDQ1Rw0qh36p
 528ZemVwSe1ytlW5C1w==
X-Proofpoint-ORIG-GUID: WgqmQMKjF6Qa1CjklLee9ZfsnfX5hjsM
X-Authority-Analysis: v=2.4 cv=bfRbluPB c=1 sm=1 tr=0 ts=6a841942 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=J0PaZF-mWyMKA4pKr4wA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180062

Core schema already defines dependency of reset-names on resets, thus
code here is duplicated.  The only meaningful new dependency is reversed
one - resets depending on presence of reset-names.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/remoteproc/ti,am3352-wkup-m3.yaml        | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/ti,am3352-wkup-m3.yaml b/Documentation/devicetree/bindings/remoteproc/ti,am3352-wkup-m3.yaml
index 9e8a03acdec4..997be06ceeb1 100644
--- a/Documentation/devicetree/bindings/remoteproc/ti,am3352-wkup-m3.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/ti,am3352-wkup-m3.yaml
@@ -62,7 +62,6 @@ required:
 
 dependencies:
   resets: [reset-names]
-  reset-names: [resets]
 
 additionalProperties: false
 
-- 
2.53.0

